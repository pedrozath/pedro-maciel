namespace :images do
    desc "TODO"
    task :recreate => :environment do
        for job in Job.all
            begin
                if job.has_image?
                    puts(job.image.file.recreate_versions!) unless job.image.file.nil?
                    for section in job.content_sections
                        begin
                            if section.has_image?
                                puts(section.image.file.recreate_versions!) unless section.image.file.nil?
                            end
                        rescue
                            puts "Error! in #{section}"
                            next
                        end
                    end
                end
            rescue
                puts "Error! in #{job}"
                next
            end
        end
    end
end