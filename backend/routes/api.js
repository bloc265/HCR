const express = require("express");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const Patient = require("../models/Patient");
const router = express.Router();

// @desc POST request to login
// @route /api/login
router.get("/login", (req, res) => {
  Patient.findOne(
    {
      email: req.body.email,
    },
    (err, patient) => {
      if (err) throw err;
      if (!patient) {
        res.status(403).send({ success: false, msg: "User not found" });
      } else {
        patient.comparePassword(req.body.password, (err, isMatch) => {
          if (isMatch && !err) {
            let token = jwt.encode(patient, process.env.SECRET);
            res.status(200).json({ token: token, msg: "Authenticated" });
          } else {
            res.status(403).send({ success: false, msg: "Incorrect password" });
          }
        });
      }
    }
  );
});

module.exports = router;
