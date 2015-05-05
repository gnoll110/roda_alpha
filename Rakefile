#!/usr/bin/env rake
task :app do
  require "./roda_alpha"
end
Dir[File.dirname(__FILE__) + "/lib/tasks/*.rb"].sort.each do |path|
  require path
end
