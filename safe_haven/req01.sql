CREATE TABLE banking_transactions_poc
(
    id serial PRIMARY KEY CONSTRAINT positive_id CHECK (id > 0),
    sender varchar(22) CONSTRAINT sneder_iban CHECK (sender SIMILAR TO 'RR[0-9]{2}[A-Z]{4}[0-9]{16}'),
    receiver varchar(22) CONSTRAINT receiver_iban CHECK (receiver SIMILAR TO 'RR[0-9]{2}[A-Z]{4}[0-9]{16}'),
    amount numeric(16, 2) CONSTRAINT positive_amount CHECK (amount > 0) NOT NULL
);
