class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def user_name_search
    if params[:term].present?
      @users = User.where( "users.name like ?", "%#{params[:term]}%" )
      render json: @users
    end
  end

  def user_roles_search
    #if id.present?
    #  role_ids = User.find(id).roles.map{ |e| [e.id, e.name] }
    #else
      role_ids = Role.all.map{ |e| [e.id, e.name] }
    #end
     #render json: role_ids
     require 'pry'; binding.pry
     render json: [{id:1,text:'my bug'},{id:2,text:'duplication'}]
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
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
    #@user = User.new(user_params).merge(params[ :role_ids ][0].split(","))
    @user = User.new( user_params.merge( "role_ids" => params[ :role_ids ][0].split(",") ) )
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
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
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, role_ids:[])
  end
end
