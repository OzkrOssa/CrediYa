-- Estados
CREATE TABLE public.loan_states (
    id SERIAL PRIMARY KEY ,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Tipos de prestamos
CREATE TABLE public.loan_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    minimum_amount BIGINT NOT NULL,
    maximum_amount BIGINT NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    automatic_validation BOOLEAN DEFAULT false
);

-- Solicitudes
CREATE TABLE public.loan_requests (
    id SERIAL PRIMARY KEY,
    amount BIGINT NOT NULL,
    term INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    loan_state_id INT NOT NULL DEFAULT 1,
    loan_type_id INT NOT NULL,
    FOREIGN KEY (loan_state_id) REFERENCES loan_states(id),
    FOREIGN KEY (loan_type_id) REFERENCES loan_types(id)
);

-- DummyData
INSERT INTO public.loan_states (name, description) VALUES
    ('Pending', 'Request is pending approval'),
    ('Approved', 'Request has been approved'),
    ('Rejected', 'Request has been rejected');

INSERT INTO public.loan_types (name, minimum_amount, maximum_amount, interest_rate, automatic_validation) VALUES
    ('Personal Loan', 1000, 50000, 5.00, true),
    ('Home Loan', 50000, 500000, 3.50, false),
    ('Car Loan', 10000, 300000, 4.00, true);