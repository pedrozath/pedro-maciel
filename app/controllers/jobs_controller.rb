class JobsController < ApplicationController
  def index
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

        @projects_hash = [
            { title: "Four hands website", cover: "example-image-1.png"},
            { title: "Four hands website", cover: "example-image-2.png"},
            { title: "Four hands website", cover: "example-image-3.png"},
            { title: "Four hands website", cover: "example-image-4.png"},
            { title: "Four hands website", cover: "example-image-5.png"},
            { title: "Four hands website", cover: "example-image-6.png"}
        ]

        @projects = @projects_hash.map { |p| OpenStruct.new p }

  end

  def show
  end
end
