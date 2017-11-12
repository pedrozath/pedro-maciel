require 'pry'

module Jekyll
  class DataShow < Page
    def initialize(site:, base:, dir:, data:, template:, resource_member_name:, slug:, filename:)
      @site = site
      @base = base
      @dir  = dir
      @name = filename

      self.process(@name)

      @data        = template.data.merge(resource_member_name => data)
      data['slug'] = slug
      self.content = template.content
    end
  end

  class DataShowGenerator < Generator
    safe true
    priority :highest

    def generate(site)
      site.config['data_show'].each do |resource_data|
        resources = site.data[resource_data['resource_collection']]

        unless ENV['JEKYLL_ENV'] == "production"
          record    = resources.last
          resources = [record]
          puts "-- Only record #{record['name']} is being rendered"
        end

        resources.each do |resource|
          resource_member_name =
            ActiveSupport::Inflector.singularize(resource_data['resource_collection'])

          slug      = ActiveSupport::Inflector.parameterize(resource['name'])
          templates = Dir["#{resource_member_name}.*"]
          templates.each do |template_name|
            template = Page.new(site, site.source, '', template_name)
            ext      = template.ext
            options  = {
              site: site,
              base: '',
              dir: resource_data['path'],
              data: resource,
              slug: slug,
              resource_member_name: resource_member_name,
              template: template,
              filename: "#{slug}#{ext}"
            }

            site.pages << DataShow.new(options)

            site.pages << DataShow.new(
              options.merge(dir: "#{resource_data['path']}/#{slug}",
                            filename: "index#{ext}")
            )
          end
        end
      end
    end
  end
end