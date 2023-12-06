INSERT INTO dtf.madelines_contacts (
    id,
    title,
    first_name,
    last_name,
    email,
    phone,
    created_at,
    favorite
)

SELECT
    id,
    CAST(
        UPPER(SPLIT_PART(
            REGEXP_REPLACE(
                m.full_name,
                '[^A-Za-z ]', '', 'g'
            ),
            ' ', 1
        ))
        AS public . PREFIX
    ),
    SPLIT_PART(
        INITCAP(
            REGEXP_REPLACE(
                m.full_name,
                '[^A-Za-z ]', '', 'g'
            )
        ),
        ' ', 2
    ),
    SPLIT_PART(
        INITCAP(
            REGEXP_REPLACE(
                m.full_name,
                '[^A-Za-z ]', '', 'g'
            )
        ),
        ' ', 3
    ),
    email,
    CONCAT(
        LPAD(
            SPLIT_PART(
                REGEXP_REPLACE(
                    REGEXP_REPLACE(
                        m.phone,
                        '[^0-9.-]', '', 'g'
                    ),
                    '-', '.', 'g'
                ),
                '.', 1
            ),
            3, '0'
        ),
        '.',
        LPAD(
            SPLIT_PART(
                REGEXP_REPLACE(
                    REGEXP_REPLACE(
                        m.phone,
                        '[^0-9.-]', '', 'g'
                    ),
                    '-', '.', 'g'
                ),
                '.', 2
            ),
            3, '0'
        ),
        '.',
        LPAD(
            SPLIT_PART(
                REGEXP_REPLACE(
                    REGEXP_REPLACE(
                        m.phone,
                        '[^0-9.-]', '', 'g'
                    ),
                    '-', '.', 'g'
                ),
                '.', 3
            ),
            3, '0'
        )
    )
    ,
    CAST(created_at AS TIMESTAMP),
    (favorite LIKE '1')
FROM dtf.madelines_contacts_corrupted AS m;
