require "ember-skeleton/core"

App.ProjectsController = Ember.ArrayController.extend(
    content: Ember.A()
    filteredContent: (->
        unfiltered = @get('content')        
        constraints = App.router.get('tagsController.constraints')
        
        if constraints.length > 0
            filtered = []
            unfiltered.forEach (project) =>
                # Make sure all constraints are in the tags
                tags = project.get('tags')
                matchingTags = 0 
                constraints.forEach (tagname) ->
                    matchingTags += 1 if tags.contains tagname
                
                if constraints.length == matchingTags
                    filtered.pushObject project
                        
            return filtered
        else
            return unfiltered
    ).property("App.router.tagsController.constraints.[]")
    
)