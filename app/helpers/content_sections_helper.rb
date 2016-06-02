module ContentSectionsHelper
    def render_technologies section
        render partial: "content_sections/technologies", locals: {technologies: section.technologies}
    end
end