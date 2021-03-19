const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
  res.render("Auth/login");
});

module.exports = router;
