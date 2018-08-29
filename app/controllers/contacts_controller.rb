class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  # GET /contacts/new
  # def new
  #   @contact = Contact.new
  # end

  def thank_you
    # code
  end

  # POST /contacts
  # POST /contacts.json
  # def create
  #   @contact = Contact.new(contact_params)

  #   respond_to do |format|
  #     if @contact.save
  #       format.html { redirect_to thank_you_path, notice: 'Contact was successfully created.' }
  #       format.json { render :show, status: :created, location: @contact }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @contact.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  # def update
  #   respond_to do |format|
  #     if @contact.update(contact_params)
  #       format.html { redirect_to thank_you_path, notice: 'Contact was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @contact }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @contact.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :catgegory, :message)
  end
end
