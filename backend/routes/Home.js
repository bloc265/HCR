const express = require("express");
const router = express.Router();
const crypto = require("crypto");
const accountsid = process.env.ACCOUNT_SSID;
const auth_token = process.env.AUTH_TOKEN;
const client = require("twilio")(accountsid, auth_token);
const bcrypt = require("bcryptjs");
const Patient = require("../models/Patient");
const { ensureAuth, ensureGuest } = require("../config/verify");

router.get("/", ensureAuth, async (req, res) => {
  const patients = await Patient.find();
  res.render("Home/home");
  // console.log(patients);
});

router.get("/search", ensureAuth, async (req, res) => {
  try {
    const patient = await Patient.find({
      name: { $regex: req.query.patient, $options: "i" },
    });
    res.render("Home/patients", {
      patient,
    });
  } catch (err) {
    console.error(err);
  }
});

router.get("/new_record", async (req, res) => {
  res.render("Home/new");
});

router.post("/new", async (req, res) => {
  const user = await Patient.findOne({
    phone: req.body.phone,
    email: req.body.email,
  });

  if (user) {
  } else {
    let password = crypto.randomBytes(6).toString("hex");
    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(password, salt);
    let name = req.body.first_name + req.body.last_name;
    const new_Patient = new Patient({
      first_name: req.body.first_name,
      last_name: req.body.last_name,
      email: req.body.email,
      phone: req.body.phone,
      password: hash,
      date_of_birth: req.body.date_of_birth,
      residence_area: req.body.residence_area,
      name: name,
    });

    await new_Patient.save();

    client.messages
      .create({
        body: `An account has been created on Health covid Registration\n User email:${req.body.email} \n Password:${password}`,
        from: process.env.FROM_NUMBER,
        to: req.body.phone,
      })
      .then((message) => {
        res.redirect("/home");
      })
      .catch((err) => console.log(err));
  }
});

module.exports = router;
