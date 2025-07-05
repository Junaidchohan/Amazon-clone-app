const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");


const authRouter = express.Router();

//  SIGN UP
authRouter.post("/api/signup", async (req, res) => {
    try{
 // Get the data from client
    const {name, email, password} = req.body;
    // Its the if user is exist in database is already then stop the app and show the error.
    // User is a model from the models folder and import and use here.
    const existingUser = await User.findOne({email});
    if(existingUser){
        return res.status(400).json({msg: "User with same email already exists!"});
    }
      const hashedPassword = await bcryptjs.hash(password, 8);
    let user = new User({
        name,
        email,
        password: hashedPassword,
    })
    user = await user.save();
    res.json(user);
    } catch{
        res.status(500).json({error: e.message});
    }
   
});


// Export use for make its file public so i can use this file anwhere else its by default private.

module.exports = authRouter;