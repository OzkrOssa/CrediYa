CREATE TABLE public.roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE public.users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    document VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(20),
    base_salary BIGINT,
    -- rol_id INT,
    -- password VARCHAR(255) NOT NULL,
    -- CONSTRAINT fk_users_roles
    --     FOREIGN KEY (rol_id) REFERENCES roles(id)
);
