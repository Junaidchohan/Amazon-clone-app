// import from package like in flutter 
const express = require("express");
const mongoose = require("mongoose");


// IMPPORTS FROM OTHERS FILES

const authRouter = require("./routes/auth")

// Initilize the express

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://junaidchohanedu:@Junaidm0997@cluster0.a15ozse.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

// Middlewhere
app.use(express.json());
app.use(authRouter);

// Connection with database
mongoose.connect(DB).then(() => {
    console.log("Connection is succesfully");
}).catch((e) => {
    console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connrcted at port ${PORT}`);
})

