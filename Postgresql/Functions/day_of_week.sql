/* Takes the day of week in integer form and returns the name of the day of the week */

CREATE FUNCTION day_of_week_convert(day_of_week_int NUMERIC)
    RETURNS VARCHAR(9)
    LANGUAGE plpgsql
AS $$
DECLARE
    day_of_week VARCHAR(9);
BEGIN
    CASE day_of_week_int
        WHEN 0 THEN day_of_week := 'Sunday';
        WHEN 1 THEN day_of_week := 'Monday';
        WHEN 2 THEN day_of_week := 'Tuesday';
        WHEN 3 THEN day_of_week := 'Wednesday';
        WHEN 4 THEN day_of_week := 'Thursday';
        WHEN 5 THEN day_of_week := 'Friday';
        WHEN 6 THEN day_of_week := 'Saturday';
        ELSE day_of_week := 'None';
    END CASE;
    RETURN day_of_week;
END;
$$;