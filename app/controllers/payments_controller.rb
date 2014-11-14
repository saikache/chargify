class PaymentsController < ApplicationController
  require 'chargify_api_ares'
  require 'json'
 
  def index
    subscriptions = Chargify::Subscription.find(session[:subscription_id])
    @transactions = subscriptions.transactions
    session[:subscription_id] = nil;
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end
  end

  def new
    @payment = Payment.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  def create
    @payment = Payment.new( :card_number =>  params[:payment]['card_number'],  
      :cvv => params[:payment]['cvv'],
      :first_name_on_card =>params[:payment]['first_name_on_card'],
      :last_name_on_card =>params[:payment]['last_name_on_card'], 
      :billing_zip =>params[:payment]['billing_zip'],
      :expiration_date =>params[:payment]['expiration_date'], 
      :first_name =>params[:payment]['first_name'], 
      :last_name =>params[:payment]['last_name'],
      :email_address =>params[:payment]['email_address'], 
      :phone =>params[:payment]['phone'], 
      :organization=>params[:payment]['organization'])
   respond_to do |format|
    if @payment.save
           product_handle = 'apisaisagar' 
           
           @subscription = Chargify::Subscription.create(
            :product_handle => product_handle,
            :customer_attributes => {
              :first_name => params[:payment]['first_name'],
              :last_name => params[:payment]['last_name'],
              :email => params[:payment]['email_address'],
            },
            :credit_card_attributes => {
              :expiration_month => params[:payment]['expiration_date(2i)'],
              :expiration_year => params[:payment]['expiration_date(1i)'],
              :full_number => params[:payment]['card_number']
            }
          )
        
          if @subscription.save
            json_object = @subscription.attributes.to_json
            parsed_json = JSON.parse(json_object)
            subscription_id = parsed_json['id']
            session[:subscription_id] = subscription_id;
            @payment.update_attributes(:subscription_id => subscription_id)
            format.html { redirect_to "/payments/index", notice: 'Payment was successfully created.' }
          else
            messages ="";
            @subscription.errors.full_messages.each {|error| messages += error + "<br />"} 
            puts "Subscription Failed!" + messages
            format.html {  render action: "new" }
          end
       
        else 
          format.html { render action: "new" }
          format.json { render json: @payment.errors, status: :unprocessable_entity }
        end
    end
  end
end
