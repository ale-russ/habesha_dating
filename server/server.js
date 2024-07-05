const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv");
const bodyParser = require("body-parser");
const cors = require("cors");

const authRoutes = require("./controllers/userController");

const app = express();
const port = process.env.PORT || 5000;

dotenv.config();

const mongoUrl = process.env.MONGODB_URL;

mongoose
  .connect(mongoUrl)
  .then(() => console.log("CONNECTED TO MONGODB"))
  .catch((err) => console.log("MONGODB CONNECTION ERROR: ", err));

//   Middlewares
app.use(cors());
app.use(express.json());
app.use(bodyParser.json());

// auth routes
app.use("/", authRoutes);

app.get("/", (req, res) => {
  res.send("Hello World!");
});

// Start the server
app.listen(port, () => {
  console.log(`Server running on port http://localhost:${port}`);
});
