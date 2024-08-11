-- A script that creates an indexe idx_name_first on the table name and the first letter of name

CREATE INDEX idx_name_first_score ON names(name(1), score(1));
