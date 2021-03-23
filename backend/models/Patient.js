const mongoose = require("mongoose");

const patient_schema = new mongoose.Schema({
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
    default: "not vacinnated",
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

module.exports = mongoose.model("patient", patient_schema);
