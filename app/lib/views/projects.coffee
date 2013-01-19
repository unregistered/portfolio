require "ember-skeleton/core"

App.ProjectsView = Ember.View.extend(
    templateName: "ember-skeleton/~templates/projects"
    
    FilterMenu: Ember.View.extend(
        tagControllerBinding: "App.router.tagsController"
        template: Ember.Handlebars.compile """
        <h5>Click to Filter</h5>
        <ul class="nav nav-pills nav-stacked">
            {{#each tag in view.activeTags}}
                {{view view.TagView contentBinding="tag"}}
            {{/each}}
            
            {{#each tag in view.inactiveTags}}
                {{view view.TagView contentBinding="tag"}}
            {{/each}}
        </ul>
        """
        
        activeTags: (->
            @get('tagController.content').filter (item) =>
                constraints = @get('tagController.constraints')
                constraints.contains item.name
        ).property('tagController.content.@each')
        
        inactiveTags: (->
            @get('tagController.content').filter (item) =>
                constraints = @get('tagController.constraints')
                not constraints.contains item.name
        ).property('tagController.content.@each')
        
        TagView: Ember.View.extend(
            content: null
            tagControllerBinding: "parentView.tagController"
            tagName: 'li'
            template: Ember.Handlebars.compile """
            <a {{action toggleConstraint tag}}>
                {{#if view.isActive}}
                    <i class="icon-remove-sign icon-white"></i>
                {{/if}}
            
                {{tag.name}} ({{tag.count}})
                
            </a>
            """
            
            isActive: (->
                @get('tagController.constraints').contains @get('content.name')
            ).property('content', 'tagController.constraints')
            
            classNameBindings: ["isActive:active computedColor"]
        )
    )
    
    ProjectList: Ember.View.extend(
        template: Ember.Handlebars.compile """
        <h1>Projects</h1>
        {{#each project in controller.filteredContent}}
            <h3>
            {{project.name}}
            {{#if project.url}}
                <span style="float:right;">
                    <small>
                        <a {{bindAttr href="project.url"}}> {{project.urltext}} <i class="icon-share-alt"></i></a>
                    </small>
                </span>
            {{/if}}
            </h3>
            
            
            <p>{{{project.desc}}}</p>
            <p>Tags: 
            {{#each tag in project.tagsArray}}
                {{view view.TagView tagBinding="tag"}}
            {{/each}}
            </p>
        {{/each}}
        """
        
        TagView: Ember.View.extend(
            tag: null
            tagName: 'span'
            classNames: ['label']
            template: Ember.Handlebars.compile "{{tag}}"
                        
            classNameBindings: ['computedColor']
            computedColor: (->
                constraints = App.router.get('tagsController.constraints')
                console.log App.router.get('tagsController')
                return null unless constraints
                if constraints.contains @get('tag')
                    return 'label-info'
                else
                    return ''
            ).property('tag', 'App.router.tagsController.constraints.[]')
        )
    )
)