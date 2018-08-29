class AppsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_app, only: [:show, :edit, :update, :destroy]
  layout 'user'

  # GET /apps
  # GET /apps.json
  def index
    @user ||= current_user
    @apps = @user.apps.all
    # @app = @user.apps.find(params[:id])   

  end

  # GET /apps/1
  # GET /apps/1.json
  def show
    @user ||= current_user
    @app = @user.apps.find(params[:id])   
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  # GET /apps/1/edit
  def edit
    @user ||= current_user
    @app = @user.apps.find(params[:id])
  end

  # POST /apps
  # POST /apps.json
  def create
    @app = App.new app_params
    @app.user = current_user
    
    if @app.valid?

      openid_client = Services::OpenIdConnectionService.new(@app).register


      if openid_client["client_id"].present?
        @app.openid_client_id = openid_client["client_id"]
        @app.openid_client_secret = openid_client["client_secret"]
        @app.openid_client_access_token = openid_client["registration_access_token"]
        @app.save
      end
    end

    respond_to do |format|
      if @app.persisted?
        format.html { redirect_to app_path(@app), notice: 'App was successfully created.' }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apps/1
  # PATCH/PUT /apps/1.json
  def update

    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to apps_path, notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end

    Services::OpenIdConnectionService.new(@app).update        
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy      
    Services::OpenIdConnectionService.new(@app).destroy  

    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:name, :platform, :openid_redirect_urls, :token_endpoint_auth_method, :openid_client_secret, :openid_client_id, :contacts, :client_uri, :policy_uri, :tos_uri, :logo_uri )
    end
end