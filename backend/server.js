const express = require("express");
const dotenv = require("dotenv");
const exphbs = require("express-handlebars");
const morgan = require("morgan");
const connectDb = require("./config/db");
const path = require("path");
const passport = require("passport");
const mongoose = require("mongoose");
const cors = require("cors");
const session = require("express-session");
const MongoStore = require("connect-mongo");
const flash = require("express-flash");
const init = require("./config/passport");

// init app
const app = express();

// express middlewares
app.use(express.json());
app.use(
  express.urlencoded({
    extended: false,
  })
);
app.use(cors());

init(passport);

// dotenv config
dotenv.config({
  path: "./config/config.env",
});

let hour = 7200000000;
app.use(
  session({
    secret: process.env.SECRET,
    saveUninitialized: false,
    resave: true,
    cookie: {
      maxAge: hour,
    },
    store: MongoStore.create({
      mongoUrl: process.env.DB_CONN,
    }),
  })
);
app.use(flash());
app.use(passport.initialize());
app.use(passport.session());

// db setup
connectDb();

// handlebars setup
app.engine(
  ".hbs",
  exphbs({
    defaultLayout: "main",
    extname: ".hbs",
    runtimeOptions: {
      allowProtoPropertiesByDefault: true,
      allowProtoMethodsByDefault: true,
    },
  })
);
app.set("view engine", ".hbs");

app.use(express.static("./public"));

// routes
app.use("/", require("./routes/index"));
app.use("/home", require("./routes/Home"));
app.use("/api", require("./routes/api"));

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
