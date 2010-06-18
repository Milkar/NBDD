class ContactsController < ApplicationController
  def new
    @contact = Contact.new(params[:contact])
    @user = User.find(params[:id])
    @user.contacts << @contact
  end

  def delete
    
  end

  def show
    
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:sucess] = "seccessful created!"
      @contacts = Contact.find(:all)
      #redirect_to @contacts
      render 'show'
    else
      render 'new'
    end
  end
end
