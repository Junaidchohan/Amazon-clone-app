const mongoose = require("mongoose");
const { productSchema } = require("./product");

const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true
  },
  email: {
    type: String,
    required: true,
    trim: true,
    validate: {
      validator: function (value) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
  // /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
      },
      message: "Invalid email format"
    }
  },
  password: {
    type: String,
    required: true
  },
  address: {
    type: String,
    default: ""
  },
  type: {
    type: String,
    default: "user"
  },
  cart: [
    {
      product: productSchema,
      quantity: {
    type: Number,
    required: true
  },
    }
  ]
});

module.exports = mongoose.model("User", userSchema);
