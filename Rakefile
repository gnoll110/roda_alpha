#!/usr/bin/env rake
task :app do
  require "./lib/roda_alpha"
end
Dir[File.dirname(__FILE__) + "/lib/tasks/*.rb"].sort.each do |path|
  require path
end
