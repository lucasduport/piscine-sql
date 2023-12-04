SELECT *
FROM (
VALUES
('a', 2),
('b', 3),
('c', 1)
) AS answers(question, choice);
