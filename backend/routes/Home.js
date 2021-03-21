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

module.exports = router;
