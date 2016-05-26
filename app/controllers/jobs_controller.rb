class JobsController < ApplicationController
    def index
        json = File.read Rails.root.join("db", "projects.json")
        puts json
        @tags = [
            "Logo + Visual Identity",
            "Motion graphics",
            "Print",
            "Web"
        ]

        @clients = [
            "Four Hands",
            "Dandara Terra",
            "Pedro Maciel",
            "LWV",
            "Holi",
            "LG",
            "Nikolaus Hutter",
            "Philippe Greier"
        ]

        @years = (2004..2016).to_a.reverse

        @jobs_hash = [
            { title: "Four hands website", cover: "example-image-1.png"},
            { title: "Four hands website", cover: "example-image-2.png"},
            { title: "Four hands website", cover: "example-image-3.png"},
            { title: "Four hands website", cover: "example-image-4.png"},
            { title: "Four hands website", cover: "example-image-5.png"},
            { title: "Four hands website", cover: "example-image-6.png"}
        ]

        @jobs = @jobs_hash.map { |p| OpenStruct.new p }

        respond_to do |f|
            f.html
            f.js
        end

    end

    def show
        @tags = [
            "Logo + Visual Identity",
            "Motion graphics",
            "Print",
            "Web"
        ]

        @clients = [
            "Four Hands",
            "Dandara Terra",
            "Pedro Maciel",
            "LWV",
            "Holi",
            "LG",
            "Nikolaus Hutter",
            "Philippe Greier"
        ]

        @years = (2004..2016).to_a.reverse

        @jobs_hash = [
            { title: "Four hands website", cover: "example-image-1.png"},
            { title: "Four hands website", cover: "example-image-2.png"},
            { title: "Four hands website", cover: "example-image-3.png"},
            { title: "Four hands website", cover: "example-image-4.png"},
            { title: "Four hands website", cover: "example-image-5.png"},
            { title: "Four hands website", cover: "example-image-6.png"}
        ]

        @jobs = @jobs_hash.map { |p| OpenStruct.new p }

        @job = OpenStruct.new \
            client: "São Paulo",
            name:   "Visual Identity Redesign",
            cover:  "cover.png",
            brief:  "São Paulo is really big, chaotic, pulsating e energetic city.",
            when:   "13-03-87",
            areas:  ["Territory", "Tourism", "Culture"],
            tags:   ["Visual Identity", "Motion Graphics"],
            content: [
                {
                    type: :image,
                    image: "sao-paulo-grafismos.png",
                    title: "Grid & Modulation",
                    description: <<-DESC
                        This is the grid and the modulation of the logo.
                        We did our best to keep it under a very rational construction,
                        as it was part of the brand mission.
                    DESC
                }
            ]
        respond_to do |f|
            f.html
            f.js
        end
    end
end
