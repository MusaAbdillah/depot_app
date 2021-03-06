class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:new, :create]
  before_action :authorize, only: [:new, :create]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @line_items = @order.line_items
  end

  # GET /orders/new
  def new
     if @cart.line_items.empty? 
      flash[:info] = "Kernjang belanja anda kosong!"
      redirect_to store_url
      return
    end
    @order = Order.new
    @users = User.all
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderNotifier.received(@order).deliver
        flash[:success] =  "Terima kasih sudah berbelanja di AB OnlineShop!"
        format.html { redirect_to store_url }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new}
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        flash[:success] = 'Pesanan berhasil di ubah!.'
        format.html { redirect_to @order }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      flash[:danger] = 'Pesanan berhasil di hapus!.'
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :phone, :address, :pos_code, :email, :pay_type, :user_id)
    end
end
