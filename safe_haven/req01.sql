CREATE TABLE banking_transactions_poc
(
    id serial PRIMARY KEY,
    sender varchar(22) CONSTRAINT
        sender_iban CHECK (sender SIMILAR TO 'RR[0-9]{2}[A-Z]{4}[0-9]{14}'),
    receiver varchar(22)
        CONSTRAINT receiver_iban CHECK (receiver SIMILAR TO 'RR[0-9]{2}[A-Z]{4}[0-9]{14}'),
    amount numeric(16, 2) CONSTRAINT positive_amount CHECK (amount > 0.000),

    CHECK (sender <> receiver)
);
