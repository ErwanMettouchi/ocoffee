DROP TABLE IF EXISTS "coffee";
DROP TABLE IF EXISTS "country";
DROP TABLE IF EXISTS "category";

-- Table pour les pays avec les coordonnées géographiques
CREATE TABLE IF NOT EXISTS "country" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(64) UNIQUE NOT NULL,
    "latitude" NUMERIC(10, 6) NOT NULL,
    "longitude" NUMERIC(10, 6) NOT NULL
);

-- Insérer les pays et leurs coordonnées géographiques
INSERT INTO "country" ("name", "latitude", "longitude") VALUES
('Italie', 41.871940, 12.567380),
('Colombie', 4.570868, -74.297333),
('Éthiopie', 9.145000, 40.489673),
('Brésil', -14.235004, -51.925282),
('Guatemala', 15.783471, -90.230759),
('Kenya', -1.286389, 36.817223),
('Indonésie', -0.789275, 113.921327),
('Costa Rica', 9.748917, -83.753428),
('Vietnam', 14.058324, 108.277199),
('Tanzanie', -6.369028, 34.888822),
('Jamaïque', 18.109581, -77.297508),
('Rwanda', -1.940278, 29.873888),
('Panama', 8.537981, -80.782127),
('Pérou', -9.189967, -75.015152),
('Hawaï', 19.896766, -155.582782),
('Nicaragua', 12.865416, -85.207229);

-- Table pour les catégories de cafés (anciennement main_feature)
CREATE TABLE IF NOT EXISTS "category" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(64) UNIQUE NOT NULL
);

-- Insérer les catégories possibles
INSERT INTO "category" ("name") VALUES
('Corsé'),
('Acide'),
('Fruité'),
('Doux'),
('Chocolaté'),
('Épicé');

-- Table pour les cafés avec une clé étrangère vers la table "country" et "category"
CREATE TABLE IF NOT EXISTS "coffee" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(64) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "reference" BIGINT NOT NULL,
    "country_id" INTEGER NOT NULL,
    "price" NUMERIC(10, 2) NOT NULL,
    "category_id" INTEGER NOT NULL,
    "availability" BOOLEAN NOT NULL,
    "date_added" DATE NOT NULL,
    FOREIGN KEY ("country_id") REFERENCES "country" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("category_id") REFERENCES "category" ("id") ON DELETE CASCADE
);

-- Insérer les cafés avec la clé étrangère correspondante aux pays et aux catégories
INSERT INTO "coffee" 
("name", "description", "reference", "country_id", "price", "category_id", "availability", "date_added") 
VALUES
('Espresso', 'Café fort et concentré préparé en faisant passer de l''eau chaude à travers du café finement moulu.', 100955890, (SELECT id FROM "country" WHERE name='Italie'), 20.99, (SELECT id FROM "category" WHERE name='Corsé'), TRUE, '2018-03-15'),
('Columbian', 'Café moyennement corsé avec une acidité vive et une saveur riche.', 100955894, (SELECT id FROM "country" WHERE name='Colombie'), 18.75, (SELECT id FROM "category" WHERE name='Acide'), TRUE, '2019-07-22'),
('Ethiopian Yirgacheffe', 'Réputé pour son arôme floral, son acidité vive et ses notes de saveur citronnée.', 105589090, (SELECT id FROM "country" WHERE name='Éthiopie'), 22.50, (SELECT id FROM "category" WHERE name='Fruité'), TRUE, '2020-11-10'),
('Brazilian Santos', 'Café doux et lisse avec un profil de saveur de noisette.', 134009550, (SELECT id FROM "country" WHERE name='Brésil'), 17.80, (SELECT id FROM "category" WHERE name='Doux'), TRUE, '2017-05-30'),
('Guatemalan Antigua', 'Café corsé avec des nuances chocolatées et une pointe d''épice.', 256505890, (SELECT id FROM "country" WHERE name='Guatemala'), 21.25, (SELECT id FROM "category" WHERE name='Corsé'), TRUE, '2021-09-18'),
('Kenyan AA', 'Café complexe connu pour son acidité rappelant le vin et ses saveurs fruitées.', 295432730, (SELECT id FROM "country" WHERE name='Kenya'), 23.70, (SELECT id FROM "category" WHERE name='Acide'), TRUE, '2018-12-05'),
('Sumatra Mandheling', 'Café profond et terreux avec un corps lourd et une faible acidité.', 302932754, (SELECT id FROM "country" WHERE name='Indonésie'), 19.95, (SELECT id FROM "category" WHERE name='Corsé'), TRUE, '2022-02-14'),
('Costa Rican Tarrazu', 'Café vif et net avec une finition propre et une acidité vive.', 327302954, (SELECT id FROM "country" WHERE name='Costa Rica'), 24.50, (SELECT id FROM "category" WHERE name='Acide'), TRUE, '2019-04-25'),
('Vietnamese Robusta', 'Café audacieux et fort avec une saveur robuste distinctive.', 549549090, (SELECT id FROM "country" WHERE name='Vietnam'), 16.75, (SELECT id FROM "category" WHERE name='Épicé'), TRUE, '2020-08-12'),
('Tanzanian Peaberry', 'Acidité vive avec un profil de saveur rappelant le vin et un corps moyen.', 582954954, (SELECT id FROM "country" WHERE name='Tanzanie'), 26.80, (SELECT id FROM "category" WHERE name='Fruité'), TRUE, '2023-01-07'),
('Jamaican Blue Mountain', 'Reconnu pour sa saveur douce, son acidité vive et son absence d''amertume.', 589100954, (SELECT id FROM "country" WHERE name='Jamaïque'), 39.25, (SELECT id FROM "category" WHERE name='Doux'), TRUE, '2017-10-20'),
('Rwandan Bourbon', 'Café avec des notes florales prononcées, une acidité vive et un corps moyen.', 650753915, (SELECT id FROM "country" WHERE name='Rwanda'), 21.90, (SELECT id FROM "category" WHERE name='Fruité'), TRUE, '2021-06-30'),
('Panamanian Geisha', 'Café rare aux arômes floraux complexes, une acidité brillante et un profil de saveur distinctif.', 795501340, (SELECT id FROM "country" WHERE name='Panama'), 42.00, (SELECT id FROM "category" WHERE name='Fruité'), TRUE, '2018-09-03'),
('Peruvian Arabica', 'Café équilibré avec des notes de chocolat, une acidité modérée et un corps velouté.', 954589100, (SELECT id FROM "country" WHERE name='Pérou'), 19.40, (SELECT id FROM "category" WHERE name='Chocolaté'), FALSE, '2022-07-19'),
('Hawaiian Kona', 'Café rare au goût riche, une acidité douce et des nuances subtiles.', 958090105, (SELECT id FROM "country" WHERE name='Hawaï'), 55.75, (SELECT id FROM "category" WHERE name='Doux'), FALSE, '2019-02-28'),
('Nicaraguan Maragogipe', 'Café avec des notes de fruits, une acidité vive et un corps plein.', 691550753, (SELECT id FROM "country" WHERE name='Nicaragua'), 28.60, (SELECT id FROM "category" WHERE name='Fruité'), FALSE, '2020-03-11');