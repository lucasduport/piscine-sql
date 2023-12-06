UPDATE  dtf.madelines_contacts
SET email = CONCAT(
            lower(first_name),
            '.',
            lower(last_name),
            '@roger_roger.com');
