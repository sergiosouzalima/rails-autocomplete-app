class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def user_roles_search
    result = []
    y = {}
    if params[:id].present?
      #role_ids = User.find(params[:id]).roles.map{ |e| [e.id, e.name] }
      User.find(params[:id]).roles.each { |r| y[:id] = r.id; y[:text] = r.name; result << y; y = {} }
    else
      Role.all.each { |r| y[:id] = r.id; y[:text] = r.name; result << y; y = {} }
      #Role.all.where( "id = ?",  params[:id] ).each { |r| y[:id] = r.id; y[:text] = r.name; result << y; y = {} }
    end
    #render json: [{id:1,text:'secretary'},{id:2,text:'key_user'}]
    render json: result
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
      #require 'pry'; binding.pry
      if params[:role_ids][0].include? ","
        p = params[:role_ids][0].slice(params[:role_ids][0].index(",")+1..-1)
        p = p.split(",")
      else
        p = []
      end
      if @user.update(user_params.merge( "role_ids" => p ) )
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
