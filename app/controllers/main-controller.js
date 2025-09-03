import { dataMapper } from "../data-mappers/data-mapper.js";

export const mainController = {
    homePage : async (req, res) => {
        try {
            const coffees = await dataMapper.getNewCoffees();
            console.log(coffees);
            res.render('accueil', {coffees, pageTitle : 'Accueil'});
        }catch(error) {
            console.log(error);
            return res.status(500).send('Erreur serveur...')
        }
    },
    savoirPlusPage : (req, res) => {
        res.render('en-savoir-plus', {pageTitle : 'En savoir plus'});
    },
    cataloguePage : async (req, res) => {
        try {
            const coffees = await dataMapper.getAllCoffees();
            const categories = await dataMapper.getAllCategories();

            const categoryQuery = [];
            req.query.category ? categoryQuery.push(req.query.category) : null;
            console.log(categoryQuery.length)
            
            const coffeesByCategories = await dataMapper.getCoffeeByCategories(categoryQuery)
            res.render('catalogue', {
                coffees, 
                pageTitle: 'Catalogue',
                categories,
                categoryQuery,
                coffeesCat : coffeesByCategories
            });
        }catch(error) {
            console.log(error);
            return res.status(500).send('Erreur serveur...')
        }
    },
    productPage : async (req, res, next) => {
        try {
            const id = Number(req.params.id);
            const coffee = await dataMapper.getCoffeeById(id)
            console.log(coffee);
            if(!coffee) {
                next();
                return;
            }
            res.render('produit', {
                coffee, 
                pageTitle : coffee.name
            })
        }catch(error) {
            console.log(error);
            return res.status(500).send('Erreur serveur...');
        }
    },
    contactPage : (req, res) => {
        res.render('contact', {pageTitle : 'Contact'});
    }
}