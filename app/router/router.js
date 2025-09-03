import { Router } from "express";
import { mainController } from "../controllers/main-controller.js";

export const router = Router();

router.use((req, res, next) => {
    res.locals.url = req.url;
    next();
})

router.get('/', mainController.homePage)

router.get('/en-savoir-plus', mainController.savoirPlusPage);

router.get('/catalogue', mainController.cataloguePage);

router.get('/produit/:id', mainController.productPage);

router.get('/contact', mainController.contactPage)

router.use((req, res) => {
    res.status(404).render('404', {pageTitle: 'Erreur 404'})
})