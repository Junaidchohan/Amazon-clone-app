const express = require("express");
const productRouter = express.Router();
const auth = require('../middlewares/auth');
const Product = require("../models/product");


//  Get all the products
productRouter.get("/", auth, async (req, res) => {
  try {
    const products = await Product.find({ category: req.query.category });
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//  Create a get requset to search products and get them

productRouter.get("/search/:name", auth, async (req, res) => {
  try {
    const products = await Product.find({
    name: { $regex: req.params.name, $options: "i" } },);
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


// create a post request route to rate the product.
productRouter.post("/rate-product", auth, async (req, res) => {
  try {
    const { id, rating } = req.body;
    if (!id || !rating) {
      return res.status(400).json({ error: "Missing product id or rating" });
    }

    let product = await Product.findById(id);

    for (let i = 0; i < product.ratings.length; i++) {
      if (product.ratings[i].userId == req.user) {
        product.ratings.splice(i, 1);
        break;
      }
    }

    const ratingSchema = {
      userId: req.user,
      rating,
    };

    product.ratings.push(ratingSchema);
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


module.exports = productRouter;