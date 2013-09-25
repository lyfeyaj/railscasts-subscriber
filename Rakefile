namespace :episodes do
  desc 'Update and download new episodes'
  task :update do
    begin
      RailsCastsSubscriber.new.update
      RailsCastsDownloader.new.download
    rescue
      Logger.info 'There are some errors. Please check your files.'
    end
  end
  
  desc 'Update and download all episodes'
  task :update_all do
    RailsCastsDownloader.new.download
  end
  
  desc 'Download episodes'
  task :download do
    RailsCastsDownloader.new.download
  end
end