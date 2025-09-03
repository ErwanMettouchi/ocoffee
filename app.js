import express from 'express';
import 'dotenv/config';
import { router } from './app/router/router.js';

const app = express();
const port = process.env.PORT || 3000;

app.set('view engine', 'ejs');
app.set('views', './app/views');

app.use(express.static('public'));

app.use(router)

app.listen(port, () => {
    console.log(`Bien arrivé sur le serveur http://localhost:${port}`)
})