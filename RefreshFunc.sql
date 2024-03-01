CREATE OR REPLACE FUNCTION update_summarytable()
RETURNS TRIGGER AS $$
BEGIN
    -- Updates the summary_table on insert into the detailed_table
    INSERT INTO summary_table (title,first_name, last_name, genre)
    VALUES (NEW.title,NEW.first_name, NEW.last_name, NEW.genre)
    ON CONFLICT (title)
    DO UPDATE SET
		first_name = EXCLUDED.first_name,
		last_name = EXCLUDED.last_name,
		genre = EXCLUDED.genre;
    RETURN NEW;

END;
$$ LANGUAGE plpgsql;

-- Create a trigger on the detailed_table
CREATE TRIGGER update_summarytable_trigger
AFTER INSERT ON detailed_table
FOR EACH ROW
EXECUTE FUNCTION update_summarytable();
