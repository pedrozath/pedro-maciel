namespace :images do
    desc "TODO"
    task :recreate => :environment do
        for job in Job.all
            puts job.image.file.recreate_versions!
            for section in job.content_sections
                puts section.file.recreate_versions!
            end
        end
    end
end