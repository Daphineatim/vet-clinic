CREATE TABLE patients (
    id INT NOT NULL,
    name VARCHAR(200),
    date_of_birth DATE,
    PRIMARY KEY (id)
);

CREATE TABLE invoices (
    id INT NOT NULL,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT
    PRIMARY KEY (id),
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE medical_histories(
    id INT NOT NULL,
    admitted_at TIMESTAMP,
    patient_id(id) INT,
    status VARCHAR(200),
    PRIMARY KEY (id),
    FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE treatment (
    id INT NOT NULL,
    type VARCHAR(200),
    name VARCHAR(200),
    PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
    id INT NOT NULL,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY(invoice_id) REFERENCES invoice(id),
    FOREIGN KEY(treatment_id) REFERENCES treatment(id)
);

-- many to many realation
CREATE TABLE medical_histories_treatments(
    id INT NOT NULL,
    medical_history_id INT,
    treatment_id INT, 
    PRIMARY KEY(id),
    FOREIGN KEY(medical_histories_id) REFERENCES medical_histories(id),
    FOREIGN KEY(treatment_id) REFERENCES treatments(id);
);

-- create indexes
CREATE INDEX ON medical_histories(patient_id);
CREATE INDEX ON invoice(medical_history_id);
CREATE INDEX ON medical_histories_treatments(treatment_id);
CREATE INDEX ON medical_histories_treatments(medical_histories_id)

 