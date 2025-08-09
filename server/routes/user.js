const express = require("express");
const userRouter = express.Router();
const auth = require("../middlewares/auth");
const { Product } = require("../models/product");
const { User } = require("../models/user"); // Make sure you have this model

// Add products to cart
userRouter.post("/api/add-to-cart", auth, async (req, res) => {
  console.log("Request received:", req.body);

  try {
    const { id } = req.body; // product id
    const product = await Product.findById(id);
    if (!product) {
      return res.status(404).json({ error: "Product not found" });
    }

    let user = await User.findById(req.user); // req.user comes from auth middleware
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    let isProductFound = false;

    if (user.cart.length === 0) {
      user.cart.push({ product, quantity: 1 });
    } else {
      for (let i = 0; i < user.cart.length; i++) {
        if (user.cart[i].product._id.equals(product._id)) {
          isProductFound = true;
          break;
        }
      }

      if (isProductFound) {
        let cartItem = user.cart.find((p) =>
          p.product._id.equals(product._id)
        );
        cartItem.quantity += 1;
      } else {
        user.cart.push({ product, quantity: 1 });
      }
    }

    await user.save();
    res.json(user);
  } catch (e) {
    console.error(e);
    res.status(500).json({ error: e.message });
  }
});

module.exports = userRouter;
