module Output
  class Creator
    DEFAULT_DATE = 1.day.ago
    DEFAULT_FILE = 'output.sql'
    SQL_TEMPLATE = "insert into volunteers (first_name, last_name, phone_number, insurance_carrier,"\
"medical_record_id), values('%{first_name}', '%{last_name}', '%{phone_number}', '%{insurance_carrier}',"\
"'%{medical_record_id}')"
    DELIMETER = "\n"

    def initialize(volunteer, file = DEFAULT_FILE)
      @volunteer = volunteer
      @file = file
    end

    def call
      sql = "#{SQL_TEMPLATE} " % {
        first_name: volunteer.first_name,
        last_name: volunteer.last_name,
        phone_number: volunteer.phone_number,
        insurance_carrier: volunteer.insurance_carrier,
        medical_record_id: volunteer.medical_record_id
      }

      send_to_hospitial(sql)
    end

    private

    def send_to_hospitial(sql)
      Rails.logger.debug(sql)
      File.open(file, 'a+t') do |file|
        file.puts sql
      end
      true
    end


    attr_reader :volunteer, :file
  end
end
