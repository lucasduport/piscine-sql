CREATE TABLE banking_transactions_poc
(
    id serial PRIMARY KEY CHECK (id > 0),
    sender varchar(22) CHECK (sender SIMILAR TO 'RR[0-9]{2}[A-Z]{4}[0-9]{16}'),
    receiver varchar(22) CHECK (receiver SIMILAR TO 'RR[0-9]{2}[A-Z]{4}[0-9]{16}'),
    amount numeric(16, 2) CHECK (amount > 0) NOT NULL
);
