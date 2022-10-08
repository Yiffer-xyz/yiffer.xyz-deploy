# The two Nodejs APIs: How-to

These two are very similar in setup, by design, since the new one is mostly only temporary.

- You'll need to run the google cloud sql proxy to connect to the database. Message Melon and get him to give you permissions in Google Cloud.
- You can then download the executable sql proxy program at [https://cloud.google.com/sql/docs/mysql/sql-proxy](https://cloud.google.com/sql/docs/mysql/sql-proxy). You need to have this running with the command `./cloud_sql_proxy -instances=yifferxyz:us-central1:yifferdb=tcp:3306`

- Otherwise, create a `config` folder at root level and add:
  - Ask melon for the `google-cloud-sql-storage-config.json` file
  - For the old api: add a `cfg.yml` file to this folder
  - For the new old api: add a `cfg-new.yml` file to this folder
  - In either case, ask Melon for the contents of this config file

Old API: `npm install` and `nodemon index.js` (install nodemon if not installed)
New old API: `yarn` and `yarn dev`
