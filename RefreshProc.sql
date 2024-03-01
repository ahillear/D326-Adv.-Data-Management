CREATE OR REPLACE PROCEDURE refresh_report_tables()
LANGUAGE plpgsql
AS $$
BEGIN
   DELETE FROM detailed_table;
   DELETE FROM summary_table;

 --extract raw data for detailed_table

INSERT INTO detailed_table (
    actor_id,
    first_name,
    last_name,
    film_id,
    title,
    description,
    category_id,
    genre
)
SELECT
    act.actor_id,
    act.first_name,
    act.last_name,
    filmact.film_id,
    f.title,
    format_desc(f.description),
    filmcat.category_id,
    cat.name
FROM film_actor filmact
INNER JOIN actor act ON filmact.actor_id = act.actor_id
INNER JOIN film f ON filmact.film_id = f.film_id
INNER JOIN film_category filmcat ON f.film_id = filmcat.film_id
INNER JOIN category cat ON filmcat.category_id = cat.category_id;

END;
$$;

