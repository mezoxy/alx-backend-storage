-- A script that creates an indexe idx_name_first on the table name and the first letter of name

CREATE INDEX idx_name_first ON names(name(1));
