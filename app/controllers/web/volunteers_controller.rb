module Web
  class VolunteersController < Web::ApplicationController

    def success
    end

    def new
      @volunteer = Volunteer.new
    end

    def create
      @volunteer = Volunteer.new(volunteer_params)

      if @volunteer.save && Output::Creator.new(@volunteer).call
        redirect_to success_volunteers_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def volunteer_params
      params.require(:volunteer).permit(:first_name, :last_name, :phone_number, :insurance_carrier, :medical_record_id)
    end
  end
end