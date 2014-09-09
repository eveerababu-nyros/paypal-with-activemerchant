class PurchasesController < ApplicationController
  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @purchases }
    end
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @purchase }
    end
  end

  # GET /purchases/new
  # GET /purchases/new.json
  def new
    @purchase = Purchase.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end
  end

  # GET /purchases/1/edit
  def edit
    @purchase = Purchase.find(params[:id])
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(params[:purchase])
    @purchase.ip_address = request.remote_ip
    puts "######################################3"
    puts "Entered1"
    if @purchase.save
        puts "Entered2 "
      if @purchase.purchase
         puts "Entered3 success"
         render :action => "success"
         #redirect_to :back
      else
          @purchase.destroy
          puts "Entered4 failure"
         render :action => "failure"
      end
    else
        puts "Failed"
        render action: "new"
    end
  end

  # PUT /purchases/1
  # PUT /purchases/1.json
  def update
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      if @purchase.update_attributes(params[:purchase])
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url }
      format.json { head :no_content }
    end
  end
end
