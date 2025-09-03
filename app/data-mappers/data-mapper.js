import client from "../database.js";

export const dataMapper = {
    getAllCoffees : async () => {
        const query = {
            text : `SELECT * FROM coffee ORDER BY name ASC`
        }
        const result = await client.query(query);
        return result.rows;
    },
    getNewCoffees : async () => {
        const query = {
            text : `SELECT * FROM coffee ORDER BY date_added DESC LIMIT 3`,
        }
        const result = await client.query(query);
        return result.rows;
    },
    getCoffeeById : async (id) => {
        const query = {
            text : `SELECT category.name AS category, country.name AS country_name, country.latitude AS country_latitude, country.longitude AS country_longitude, coffee.* FROM coffee JOIN country ON country.id = coffee.country_id JOIN category ON category.id = coffee.category_id WHERE coffee.id = $1`,
            values : [id]
        }
        const result = await client.query(query);
        return result.rows[0];
    },
    getAllCategories : async () => {
        const query = {
            text : `SELECT * FROM category ORDER BY name`,
        }
        const result = await client.query(query);
        return result.rows;
    },
    getCoffeeByCategories : async(categories) => {
        const query = {
            text : `SELECT coffee.* FROM coffee JOIN category ON coffee.category_id = category.id WHERE LOWER(category.name) = ANY($1) ORDER BY coffee.name ASC`,
            values : [categories]
        };
        const result = await client.query(query);
        return result.rows;
    }
}