class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :history]
  before_action :require_admin, except: [:new, :create, :show, :history]
  skip_before_action :authorize, only: [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        login @user
        flash[:success] = "Welcome #{@user.name} to AB OnlineShop!."
        format.html { redirect_to admin_url }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = "User #{@user.name} was successfully updated."
        format.html { redirect_to users_url }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    begin
      @user.destroy
      flash[:success] = "User #{@user.name} was successfully destroyed!"
    rescue StandardError => e
      flash[:danger] = e.message
    end
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def history 
    @orders = @user.orders.paginate(page: params[:page], per_page: 5)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation, :gender)
    end
end
