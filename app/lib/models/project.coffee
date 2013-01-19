require "ember-skeleton/core"

App.Project = Ember.Object.extend(
    name: "undefined"
    desc: "fill in desc"
    tags: null    
    url: null
    
    tagsArray: (->
        @get('tags').toArray()
    ).property('tags.[]')
    
    init: ->
        # TODO: profile
        @set 'tags', new Ember.Set(@get('tags'))
)