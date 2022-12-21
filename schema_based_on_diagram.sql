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


 