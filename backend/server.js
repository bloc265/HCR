const express = require("express");
const dotenv = require("dotenv");
const exphbs = require("express-handlebars");
const morgan = require("morgan");
const connectDb = require("./config/db");
const path = require("path");

// init app
const app = express();

// express middlewares
app.use(express.json());
app.use(
  express.urlencoded({
    extended: false,
  })
);

// dotenv config
dotenv.config({
  path: "./config/config.env",
});

// db setup
connectDb();

// handlebars setup
app.engine(
  ".hbs",
  exphbs({
    defaultLayout: "main",
    extname: ".hbs",
  })
);
app.set("view engine", ".hbs");

app.use(express.static("./public"));

// routes
app.use("/", require("./routes/index"));

// morgan config
if (process.env.NODE_ENV == "development") {
  app.use(morgan("dev"));
}

// listen on port
const port = process.env.PORT || 5000;
app.listen(port, () => {
  console.log(
    `Server started in ${process.env.NODE_ENV} mode on port ${process.env.PORT}`
  );
});
