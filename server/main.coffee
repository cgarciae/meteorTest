
if Meteor.isServer

    Meteor.publish( 'gVars', () -> return gVars.find() )