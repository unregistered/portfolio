require "ember-skeleton/core"

App.Router = Ember.Router.extend(
    enableLogging: true
    root: Ember.Route.extend(
        projects: Ember.Route.extend(
            route: "/"

            # Accepts string or App.Tag in the event
            toggleConstraint: (router, event) ->
                tag = event.context
                constraints = router.get('tagsController.constraints')

                tagName = if (typeof(tag) == "string") then tag else tag.name

                if constraints.contains tagName
                    constraints.remove tagName
                    _gaq.push(['_trackEvent', 'unconstrain', tagName])
                else
                    constraints.add tagName
                    _gaq.push(['_trackEvent', 'constrain', tagName])

            connectOutlets: (router, context) =>
                router.get('applicationController').connectOutlet('projects')

                pc = App.router.get("projectsController")
                pc.pushObject App.Project.create(
                     name: "Maxel"
                     desc: "A multi-threaded download accelerator written using Cocoa and libcurl. Maxel opens multiple http connections to different segments of the same file, and concurrently downloads a file."
                     tags: ['Objective-C', 'Primary Author']
                     url: 'http://cl.ly/1S2P1r371F3a'
                     urltext: 'Download Binary'
                )

                pc.pushObject App.Project.create(
                     name: "Veritune"
                     desc: "An implementation of a radix-2 decimation-in-time Fast Fourier Transform in Verilog that targets the Nexys-2, a Spartan 3E board, and a phase vocoder implemented in MATLAB."
                     tags: ['Verilog', 'School Project', 'Author']
                     url: 'https://github.com/unregistered/veritune'
                     urltext: 'Github'
                )

                pc.pushObject App.Project.create(
                     name: "BeoHawk Software"
                     desc: "A collection of ROS nodes written in C++ and Python for the USC Aerial Robotics Team's autonomous quadrotor helicopter. Implemented serial communication and mission state machine."
                     tags: ['Python', 'C++', 'Arduino', 'Robotics', 'Contributor']
                     url: 'https://github.com/organizations/uscrs-art'
                     urltext: 'Github'
                )

                pc.pushObject App.Project.create(
                     name: "BeoHawk Electrical"
                     desc: "Designed and manufactured printed circuit boards for an autonomous quadrotor. Designed a four-layer power distribution board in Eagle."
                     tags: ['Electrical', 'Robotics', 'Contributor']
                     url: 'https://github.com/uscrs-art/beohawk-schematics'
                     urltext: 'Github'
                )

                pc.pushObject App.Project.create(
                    name: "Trollicons"
                    desc: "Custom emoticon set of “rage icons” for eight popular IM clients. A custom rake script makes deployment and generation of packages quick and easy. Responsible for rake script that does package generation and markup file generation automatically from file names. Over 20,000 downloads."
                    tags: ['Ruby', 'Author']
                    url: 'https://github.com/unregistered/trollicons'
                    urltext: 'Github'
                )

                # pc.pushObject App.Project.create(
                #     name: "Nimbus"
                #     desc: "File system interface to CloudApp (cloud storage system), written using FUSE. Successfully funded through Kickstarter. Contributed the code to handle writes to the simulated filesystem and translate it into an HTTP post to CloudApp’s API."
                #     tags: ['Objective-C', 'Author']
                #     url: 'http://www.kickstarter.com/projects/1650920829/nimbus'
                #     urltext: 'Kickstarter'
                # )

                pc.pushObject App.Project.create(
                    name: "SevenServers"
                    desc: "Web-based, social S/FTP client. Users can add sftp servers, add friends, and pool their servers into a single virtual storage space."
                    tags: ['Ruby', 'Primary Author', 'Ruby on Rails']
                    url: 'http://sevenservers.com'
                    urltext: 'Live Site'
                )

                pc.pushObject App.Project.create(
                    name: "Doping Viz"
                    desc: "Interface that plots particle density, the Fermi-Dirac Function, and density of states in a semiconductor given material, temperature, and doping."
                    tags: ['School Project', 'Javascript', 'Coffeescript', 'EmberJS', 'Primary Author']
                    url: 'http://scf.usc.edu/~licy'
                    urltext: 'Live Site'
                )

                pc.pushObject App.Project.create(
                    name: "This Site"
                    desc: "A way to keep all my projects in one place, tagged and sorted."
                    tags: ['Javascript', 'Coffeescript', 'EmberJS', 'Primary Author']
                    url: '#'
                    urltext: 'Recurse'
                )

                pc.pushObject App.Project.create(
                    name: "Hermes"
                    desc: "Granted Provost Fellowship to work on Hermes, a 4-wheel autonomous vehicle. Responsible for wiring and mechanical components. Wrote microcontroller software for low-level control."
                    tags: ['Arduino', 'Electrical', 'Robotics', 'C++', 'Contributor']
                    url: 'https://github.com/USCiLab/nrt-modules'
                    urltext: 'Github'
                )

                pc.pushObject App.Project.create(
                    name: "NRT Designer"
                    desc: """
                    Granted Rose Hills Fellowship to work on a GUI for the iLab's robotics framework, <a href="nrtkit.org">NRT</a>. NRT Designer allows users to create autonomous robotic systems visually, and the GUI allows for live collaboration over the web.
                    """
                    tags: ['Robotics', 'AngularJS', 'Coffeescript', 'Javascript']
                    url: 'https://github.com/unregistered/nrt-webui'
                    urltext: 'Github'
                )
        )
    )
)
