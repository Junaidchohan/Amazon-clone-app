const mongoose = require("mongoose");


// Structure how user look like 
const userSchema = mongoose.Schema({

    name :{
        require: true,
        type : String,
        trim : true
    },

    email: {
require: true,
        type : String,
        trim : true,
        validate:{
          validater: (value) =>{
            const re =
  /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
  return value.match(re);
          },
          message: "Please enter the valid email address"
        }
    },
    password:{
      require: true,
        type : String,
    },
    address:{
        type: String,
        default: '',
    },
    // User type Admin or User and (Optional) latter we can add also sellers
    type:{
type: String,
        default: 'user',
    },
    // cart
})


// Now Create model

const User = mongoose.model("User", userSchema);

//  In js one particular file use in particular file so now we need to export this model for using in others file

module.exports = User;