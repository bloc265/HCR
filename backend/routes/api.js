const express = require("express");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const Patient = require("../models/Patient");
const router = express.Router();

// @desc POST request to login
// @route /api/login
router.post("/login", (req, res) => {
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
            let token = jwt.sign(patient, process.env.SECRET);
            res
              .header("auth-token", token)
              .json({ success: true, msg: "Authenticated" });
          } else {
            res.status(403).send({ success: false, msg: "Incorrect password" });
          }
        });
      }
    }
  );
});

module.exports = router;
