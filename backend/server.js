const express = require("express");
const env = require("./config/env");
const authRoute = require("./routes/auth-routes");
const error = require("./middleware/error");
const errorHandler = require("./middleware/errorHandler");
const cors = require("cors");

const app = express();
const port = process.env.PORT;

// var corsOptions = {
//   origin: "http://localhost",
//   optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
// };

app.use(express.json());
app.use(cors());
app.use("/auth", authRoute);

app.all("*", error);
app.use(errorHandler);

app.listen(port, () => console.log(`Server started at PORT: ${env.PORT}!`));
