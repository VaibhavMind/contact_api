class ContactsController < ApplicationController

  def index

    @contacts = Contact.all()
    render json: { status: 200,
                   data: @contacts }
  end


  def create
    @contacts = Contact.new(contact_params)
    logger.debug "create contact: #{@contacts.attributes.inspect}"
    if @contacts.save
      render json:  { status: 200, message:'Saved', data: @contacts }
    else
      render json:  { status: 200, message:'Error', data: @contacts }
    end
  end


  def show
    @contacts = Contact.find(params[:id])
    render json:  { status: 200,
                    data: @contacts }
  end


  def destroy
    logger.debug "inside destroy"
    @contacts = Contact.find(params[:id])
    logger.debug "destroy contacts: #{@contacts.attributes.inspect}"
    @contacts.destroy
    render json:  { status: 200, message:"Deleted Contact", data: @contacts }
  end

  def testcors
    logger.debug "inside destroy"
  end


  def update
    @contacts = Contact.find(params[:id])
    if @contacts.update_attributes(contact_params)
      render json:  { status: 200, message:'Update Contact', data: @contacts }
    else
      render json:  { status: 200, message:'Error in Update', data: @contacts }
    end
  end


  private
  def contact_params
    params.permit(:name, :phonenumber)
  end


end
