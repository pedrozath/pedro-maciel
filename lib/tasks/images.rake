namespace :images do
    desc "TODO"
    task :recreate => :environment do
        for job in Job.all
            if job.has_image?
                puts(job.image.file.recreate_versions!) unless job.image.file.nil?
                for section in job.content_sections
                    if section.has_image?
                        puts(section.image.file.recreate_versions!) unless section.image.file.nil?
                    end
                end
            end
        end
    end
end