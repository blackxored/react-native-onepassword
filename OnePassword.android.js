"use strict";

var React = require("react-native");

var OnePassword = {
  isSupported() {
    return Promise.reject("Android not supported");
  },

  findLogin(url) {
    return Promise.reject("Android not supported");
  }
};

module.exports = OnePassword;
