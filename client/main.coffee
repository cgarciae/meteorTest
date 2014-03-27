cambio = undefined

if Meteor.isClient

    Session.set "current", 0

    gVars_handle = Meteor.subscribe( 'gVars' )


    Template.A.imagen = ->
        actual = gVars.findOne( nombre: "actual" ).valor
        console.log( "actual " + actual )
        console.log gVars.findOne( nombre: "lista").valor[actual]
        return gVars.findOne( nombre: "lista").valor[actual]


    cambio = (dir) ->
        actual = gVars.findOne( nombre: "actual" ).valor
        lista = gVars.findOne( nombre: "lista").valor
        next = ( actual + lista.length + dir ) % lista.length
        id = gVars.findOne( nombre: "actual")._id

        gVars.update id,
            $set: valor: next

        return


    Router.map ->
        @route "B",
            path: "/"

        @route "B",
            path: "/B"

        @route "A",
            path: "/A"
            waitOn: ->
                return Meteor.subscribe("gVars")


    Template.A.events =
        "click #sig": ->
            cambio 1
            return

        "click #ant": ->
            cambio -1
            return

        "click #quit": ->
            Router.go "B"
            return

    Template.B.events = "click #start": ->
        Router.go "A"
        return