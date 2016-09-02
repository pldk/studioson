class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)

		if @contact.valid?
			ContactMailer.new_message(@contact).deliver_now
			redirect_to pages_contacted_path, notice: "Thank you! Your message has been sent."
		else
			flash[:alert] = "An error has occurred while deliveringthis message."
			render :new
		end
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :email, :content)
	end
end
