class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)

		if @contact.valid?
			ContactMailer.new_message(@message).deliver
			redirect_to contact_path, notice: "Your message has been sent."
		else
			flash[:alert] = "An error has occurred while deliveringthis message."
			render :new
		end
	end

	private

	def contact_params
		params.require(:message).permit(:name, :email, :content)
	end
end
