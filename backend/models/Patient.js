const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");

const patient_schema = new mongoose.Schema({
  first_name: {
    type: String,
    required: true,
  },
  last_name: {
    type: String,
    required: true,
  },
  name: {
    type: String,
    required: true,
  },
  email: {
    type: String,
  },
  phone: {
    type: String,
  },
  residence_area: {
    type: String,
  },
  password: {
    type: String,
    default: "Pegasus101",
  },
  covid_vacination: {
    type: String,
    enum: ["vaccinated", "not vaccinated", "partially vacinnated"],
    default: "not vaccinated",
  },
  covid_test: {
    type: String,
    enum: ["Positive", "Negative"],
    default: "Negative",
  },
  date_of_birth: {
    type: String,
    required: true,
  },
});

patient_schema.methods.comparePassword = function (passw, cb) {
  bcrypt.compare(passw, this.password, function (err, isMatch) {
    if (err) {
      return cb(err);
    }
    cb(null, isMatch);
  });
};

module.exports = mongoose.model("patient", patient_schema);
