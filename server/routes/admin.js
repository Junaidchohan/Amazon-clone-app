const express = require("express");
const Product = require("../models/product"); // adjust the path if needed
const adminRouter = express.Router();

adminRouter.post("/add-product", async (req, res) => {
    console.log("Request received:", req.body); // ADD THIS

  try {
    const { name, description, images, quantity, price, category } = req.body;

    let product = new Product({
      name,
      description,
      images,
      quantity,
      price,
      category,
    });

    product = await product.save();
    res.json(product);

  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = adminRouter;


