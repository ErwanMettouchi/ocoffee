import pg from 'pg'; 

const { Client } = pg;

const client = new Client({
	connectionString: process.env.PG_URL,
	ssl: { rejectUnauthorized: false },
});

await client.connect();

export default client;
