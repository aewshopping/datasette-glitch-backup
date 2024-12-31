# Datasette for CSV files

This is a Datasette project, which creates a read only database from CSV files. 

It is a remix of Simon Willison's [Glitch Datasette project](https://glitch.com/~datasette-csvs). He is the creator of the open source program Datasette which makes this all happen. He has written about [using Datasette with Glitch](https://simonwillison.net/2019/Apr/23/datasette-glitch/).

## Why bother with a database?

What's the point of a database? It means you can find a little bit of information from a big pool of data without having to download the entire dataset.

## How does it work?

This code will ingest the CSV files specified in the install.sh script, turn them into an sqlite database and serve them up from the browser, as you can see in the preview.

You can either specify local CSV files or remote files. 

The trigger to restart the project is set out on the glitch.json file. Currently it is looking for any changes to the CSV files.

If the files are remote, then Glitch cannot watch for changes so I have a dummy CSV file to which I can make an arbitrary change to trigger the restart and reload of the (possibly updated) CSV files. 

There is probably a way of triggering a restart remotely with some sort of webhook thing, but I can't figure this out right now. It would be better if I could! 

## Why did I build this particular database?

The reason I wanted to create this particular project was to create a mini database for history books published in the UK. Datasette also creates a read only API that you can call from another website, and use to query the database. In this case I am calling the API from my [popularhistorybooks.com](popularhistorybooks.com) website - see the All Books page - which is also created using Glitch (and eleventy).

Drag and drop any CSV files you like to this project root and they will be converted into a SQLite database and loaded into a Datasette instance.