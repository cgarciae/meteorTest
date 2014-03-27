@gVars = new Meteor.Collection("gVars")

if Meteor.isServer

    if typeof(gVars) == 'undefined' || gVars.find().fetch().length == 0
        console.log "Imagenes no definidas"

        lista = [   "https://pbs.twimg.com/profile_images/3686526354/59ed8dfe66aa56fab27b6cf8a91080a9.jpeg"
                    "http://stereo.gsfc.nasa.gov/beacon/latest_256/behind_euvi_195_latest.jpg"
                    "http://i.istockimg.com/static/images/index/logout/tile_nature.jpg" ]
        actual = 0

        gVars.insert
            nombre: "lista"
            valor: lista

        gVars.insert
            nombre: "actual"
            valor: actual



