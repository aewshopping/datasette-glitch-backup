pip3 install -U --no-cache-dir -r requirements.txt --user && \
  mkdir -p .data && \
  rm .data/data.db || true && \
  sqlite-utils insert .data/data.db books 'data-input/popular_history_books.csv' --csv --pk isbn_10
  sqlite-utils insert .data/data.db books_tags 'data-input/books_tags.csv' --csv
  sqlite-utils insert .data/data.db tags 'data-input/tags.csv' --csv --pk pk_tag_id
  sqlite-utils transform .data/data.db tags --type tag_sort INTEGER
  sqlite-utils insert .data/data.db cats 'data-input/cats.csv' --csv --pk pk_cat_id
  sqlite-utils transform .data/data.db cats --type cat_sort INTEGER
  sqlite-utils enable-fts .data/data.db books title author publisher --fts4 --tokenize porter
  sqlite-utils transform .data/data.db books --type pages INTEGER
  sqlite-utils convert .data/data.db books hb_publish_date 'r.parsedate(value, dayfirst=True)'