SELECT *
FROM (
VALUES
('a', 1),
('b', 3),
('c', 2)
) AS answers(question, choice);
