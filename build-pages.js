const ssi = require("ssi");
const includes = new ssi("source/html-ssi", ".tmp", "/*.html", true);
includes.compile();
