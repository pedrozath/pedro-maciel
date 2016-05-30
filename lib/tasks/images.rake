namespace :images do
    desc "TODO"
    task :recreate => :environment do
        for job in Job.all
            job.image.file.recreate_versions! unless job.image.file.nil?
            for section in job.content_sections
                section.image.file.recreate_versions! unless job.image.file.nil?
            end
        end
    end
end