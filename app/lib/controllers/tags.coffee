require "ember-skeleton/core"

###
Computes active tags
###
App.TagsController = Ember.Controller.extend(
    constraints: null # What to filter tags by
    init: ->
        @set 'constraints', new Ember.Set()
        
    content: (->
        tags = {}
                
        App.router.get('projectsController.filteredContent').forEach (project) =>
            # Now add to tags
            project.get('tags').forEach (tagname) ->
                if tags[tagname]
                    tags[tagname].count += 1
                else
                    tags[tagname] = App.Tag.create(
                        name: tagname
                        count: 1
                    )
        
        # Flatten hash to array values        
        taglist = []
        for own k, v of tags
            taglist.pushObject v
            
        return taglist.sort (a, b) ->
            return b.get('count') - a.get('count')

    ).property("App.router.projectsController.filteredContent.@each")
)