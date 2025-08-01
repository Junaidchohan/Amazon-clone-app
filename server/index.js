// import from package like in flutter
const express = require("express");
const mongoose = require("mongoose");
const cors = require('cors');



// IMPPORTS FROM OTHERS FILES

const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");

// Initilize the express

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://junaidchohanedu:Junaidm0997@cluster0.a15ozse.mongodb.net/amazon_clone?retryWrites=true&w=majority&appName=Cluster0";

// ✅ Enable CORS
app.use(cors());
app.use(cors({
  origin: '*', // or specify your Flutter Web origin
  credentials: true
}));

// Middlewhere
app.use(express.json());
app.use(authRouter);
app.use('/admin', adminRouter);
app.use(productRouter);

// app.use(authRouter);

// Connection to the database
mongoose.connect(DB).then(() => {
    console.log("Connection is succesfully");
}).catch((e) => {
    console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connrcted at port ${PORT}`);
})

