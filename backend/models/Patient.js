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
  date_of_birth: {
    type: String,
    required: true,
  },
});

module.exports = mongoose.model("patient", patient_schema);
