const express = require("express");
const router = express.Router();
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
    let name = req.body.first_name + req.body.last_name;
    const new_Patient = new Patient({
      first_name: req.body.first_name,
      last_name: req.body.last_name,
      email: req.body.email,
      phone: req.body.phone,
      date_of_birth: req.body.date_of_birth,
      residence_area: req.body.residence_area,
      name: name,
    });

    await new_Patient.save();
    res.redirect("/home");
  }
});

module.exports = router;
