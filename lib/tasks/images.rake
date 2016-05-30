namespace :images do
    desc "TODO"
    task :recreate => :environment do
        for job in Job.all
            unless job.image.file.nil?
                job.image.file.recreate_versions!
            for section in job.content_sections
                unless job.image.file.nil?
                    section.image.file.recreate_versions!
            end
        end
    end
end