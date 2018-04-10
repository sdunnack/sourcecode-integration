"use strict";
const express = require("express");
const app = express();
const port = process.env.PORT;

app.get("/healthcheck", function (req, res) {
	res.send("Ok!");
})

app.get("/", function (req, res) {
	res.send("Hello World!");
})

app.listen(port, function () {
	console.log("Server listening on port: " + port);
})
