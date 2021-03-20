const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const User = require("../models/User");

router.get("/", (req, res) => {
  res.render("Auth/login");
});

router.post("/register", async (req, res) => {
  try {
    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(req.body.password, salt);
    const new_user = new User({
      name: req.body.name,
      email: req.body.email,
      password: hash,
    });

    const user = await new_user.save();
    res.send(user);
  } catch (err) {
    console.error(err);
  }
});

module.exports = router;
