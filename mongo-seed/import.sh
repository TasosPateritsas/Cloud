#! /bin/bash
mongoimport --host mongo_db --db cloud --collection movies --type json --file /mongo-seed/volumes_data/movies.json --jsonArray

mongoimport --host mongo_db --db cloud --collection cinemas --type json --file /mongo-seed/volumes_data/cinemas.json --jsonArray

mongoimport --host mongo_db --db cloud --collection favorites --type json --file /mongo-seed/volumes_data/favorites.json --jsonArray

mongoimport --host mongo_db --db cloud --collection feedback --type json --file /mongo-seed/volumes_data/feedback.json --jsonArray

mongoimport --host mongo_db --db cloud --collection notification --type json --file /mongo-seed/volumes_data/notification.json --jsonArray

mongoimport --host mongo_db_orion --db orion --collection entities --type json --file /mongo-seed/volumes_data/entities.json --jsonArray

mongoimport --host mongo_db_orion --db orion --collection csubs --type json --file /mongo-seed/volumes_data/csubs.json --jsonArray