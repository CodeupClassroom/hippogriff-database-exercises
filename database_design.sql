USE javier;

SHOW TABLES;

# ONE TO MANY RELATIONSHIP
# One author has many quotes

DROP TABLE IF EXISTS quotes;

# Create a quotes table

CREATE TABLE quotes (
    id INT NOT NULL AUTO_INCREMENT,
    author VARCHAR(75),
    content VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO quotes (author, content) VALUES ('Neil Gaiman', 'I hope you will have a wonderful year, that you''ll dream dangerously and outrageously, that you''ll make something that didn''t exist before you made it' );

INSERT INTO quotes (AUTHOR, CONTENT) VALUES ('Neil Gaiman', 'I hope that in this year to come, you make mistakes. Because if you are making mistakes...you''re Doing Something.');

# But we might have a lot of repeat data: author names
# so we create an authors table

CREATE TABLE authors (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(75),
    PRIMARY KEY (id)
);

INSERT INTO authors (name) VALUES ('Neil Gaiman');

# We create an author_id column in the quotes table
# this will be a foreign key

ALTER TABLE quotes ADD COLUMN author_id INT UNSIGNED NOT NULL;

UPDATE quotes SET author_id = (
    SELECT id FROM authors WHERE name = 'Neil Gaiman'
    )
    WHERE author = 'Neil Gaiman';

# Now we don't need the author column anymore

ALTER TABLE quotes DROP COLUMN author;

# This is bad at this stage: there is no author 23, so this would be bad data
INSERT INTO quotes (author_id, content) VALUES (23, 'Agua mole em pedra dura, bate bate até que fura');

# In order to prevent that, we have to formally declare a foreign key constraint

ALTER TABLE quotes ADD CONSTRAINT quotes_author_id_fk FOREIGN KEY (author_id) REFERENCES authors(id);

DELETE FROM quotes WHERE author_id = 23;

# Now this generates an error message
INSERT INTO quotes (author_id, content) VALUES (23, 'Agua mole em pedra dura, bate bate até que fura');

# To solve that, I need to add the author to the authors table first

INSERT INTO authors (name) VALUES ('Traditional Brazilian Proverb');

INSERT INTO quotes (author_id, content) VALUES (
                                                (
                                                    SELECT id FROM authors WHERE name = 'Traditional Brazilian Proverb'
                                                    ), 'Agua mole em pedra dura, bate bate até que fura'
                                               );

# Now I can't do this. It would leave bad data in the quotes table
# It would leave author_id in the quotes table that does not correspond
# to any id in the authors table
DELETE FROM authors WHERE name = 'Traditional Brazilian Proverb';

# If I wanted to delete this author, I would have to
# first delete every quote for that author in the quotes table
DELETE FROM quotes WHERE author_id = (
    SELECT id FROM authors WHERE name = 'Traditional Brazilian Proverb'
    );
DELETE FROM authors WHERE name = 'Traditional Brazilian Proverb';

# Many to many

CREATE TABLE genres (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    genre VARCHAR(50),
    PRIMARY KEY (id)
);

INSERT INTO genres (genre) VALUES ('inspiration'), ('romantic'), ('for the boys'),('entertainment');

CREATE TABLE quotes_genres (
    quote_id INT NOT NULL,
    genre_id INT UNSIGNED NOT NULL,
    CONSTRAINT quotes_topics_quote_id_fk FOREIGN KEY (quote_id) REFERENCES quotes(id),
    CONSTRAINT quotes_topics_genre_id_fk FOREIGN KEY (genre_id) REFERENCES genres(id)
);

INSERT INTO quotes_genres (quote_id, genre_id) VALUES (1, 1), (1, 2), (2, 1), (2, 2);

SELECT quotes.content, authors.name FROM quotes JOIN authors ON quotes.author_id = authors.id JOIN quotes_genres qg on quotes.id = qg.quote_id JOIN genres g on qg.genre_id = g.id WHERE g.genre = 'inspiration';
