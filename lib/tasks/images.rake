namespace :images do
    desc "TODO"
    task :recreate => :environment do
        for job in Job.all
            if job.has_image?
                job.image.file.recreate_images!
                for section in job.content_sections
                    if section.has_image?
                        section.image.file.recreate_images!
                    end
                end
            end
        end
    end
end