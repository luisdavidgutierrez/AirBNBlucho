--creacion de las tabla 
--y definicion de las columnas y sus variables 


CREATE TABLE amenity (
  id VARCHAR(255) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE place (
  id VARCHAR(255) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  city_id VARCHAR(255) NOT NULL,
  state_id VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  number_rooms INTEGER DEFAULT 0,
  number_bathrooms INTEGER DEFAULT 0,
  max_guest INTEGER DEFAULT 0,
  price_by_night INTEGER DEFAULT 0,
  latitude FLOAT,
  longitude FLOAT,
  updated_at DATE DEFAULT CURRENT_TIMESTAMP,
  created_at DATE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE city (
  id VARCHAR(255) PRIMARY KEY,
  state_id VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE stado (
  id VARCHAR(255) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE usuario (
  id VARCHAR(255) PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE review (
  id VARCHAR(255) PRIMARY KEY,
  user_id VARCHAR(255) NOT NULL,
  place_id VARCHAR(255) NOT NULL,
  text CHAR NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE place_amenity (
  place_id VARCHAR(255) NOT NULL,
  amenity_id VARCHAR(255) NOT NULL,
  PRIMARY KEY (place_id, amenity_id)
);


-- Agregamos las restricciones


ALTER TABLE place_amenity
ADD CONSTRAINT fk_place_amenity_place_id
FOREIGN KEY (place_id)
REFERENCES place (id);


ALTER TABLE place_amenity
ADD CONSTRAINT fk_place_amenity_amenity_id
FOREIGN KEY (amenity_id)
REFERENCES amenity (id);


ALTER TABLE place
ADD CONSTRAINT fk_place_city_id
FOREIGN KEY (city_id)
REFERENCES city (id);


ALTER TABLE place
ADD CONSTRAINT fk_place_state_id
FOREIGN KEY (state_id)
REFERENCES estado (id);


ALTER TABLE review
ADD CONSTRAINT fk_review_user_id
FOREIGN KEY (user_id)
REFERENCES usuario (id);


ALTER TABLE review
ADD CONSTRAINT fk_review_place_id
FOREIGN KEY (place_id)
REFERENCES place (id);


