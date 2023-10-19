import express from 'express';
// import mysql2 from 'mysql2';
import cors from 'cors'
import rootRoutes from './Routes/rootRoutes.js';

const app = express();
app.use(express.json()) // hàm gọi middleware chuyển đổi cấu trúc json để backend nhận được

app.use(cors());
app.listen(8080);



app.use("/api", rootRoutes);

