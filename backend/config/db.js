const mongoose = require("mongoose");

const connectDb = () => {
  try {
    mongoose.connect(
      process.env.DB_CONN,
      {
        useFindAndModify: false,
        useNewUrlParser: true,
        useUnifiedTopology: true,
      },
      () => {
        console.log("Connected to DB");
      }
    );
  } catch (err) {
    console.error(err);
    process.exit(1);
  }
};

module.exports = connectDb;
