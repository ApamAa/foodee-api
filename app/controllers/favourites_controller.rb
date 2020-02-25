class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show, :edit, :update, :destroy]

  # GET /favourites
  # GET /favourites.json
  def index
    @favourites = Favourite.all
    render json: @favourites
  end

  # GET /favourites/1
  # GET /favourites/1.json
  def show
    render json: @favourites
  end

  # GET /favourites/new
  def new
    @favourite = Favourite.new
  end

  # GET /favourites/1/edit
  def edit
  end

  # POST /favourites
  # POST /favourites.json
  def create
    puts "fave params:"
    puts favourite_params
    
    @favourite = Favourite.new(favourite_params)
    # favourite = Favourite.new user: current_user

    if @favourite.save
      puts "SAVING"
      render json: {
        status: :created,
        favourite: @favourite
      }
    else
      puts "DID NOT SAVE"
      render json: {
        status: 500,
        errors: @favourite.errors.full_messages
      }

    end

    # respond_to do |format|
    #   if @favourite.save
    #     format.html { redirect_to @favourite, notice: 'Favourite was successfully created.' }
    #     format.json { render :show, status: :created, location: @favourite }
    #   else
    #     # format.html { render :new }
    #     format.json { render json: @favourite.errors, status: 500 }

    #     # render json: {
    #     #   status: 500,
    #     #   errors: @favourite.errors.full_messages
    #     # }
    #   end
    # end
  end

  # PATCH/PUT /favourites/1
  # PATCH/PUT /favourites/1.json
  def update
    respond_to do |format|
      if @favourite.update(favourite_params)
        format.html { redirect_to @favourite, notice: 'Favourite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favourite }
      else
        format.html { render :edit }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourites/1
  # DELETE /favourites/1.json
  def destroy
    @favourite.destroy
    respond_to do |format|
      format.html { redirect_to favourites_url, notice: 'Favourite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favourite_params
      params.require(:favourite).permit(:user_id, :res_id).merge( user_id: current_user)
    end
end

# class FavouritesController < ApplicationController
#   before_action :set_favourite, only: [:show, :edit, :update, :destroy]

#   # GET /favourites
#   # GET /favourites.json
#   def index
#     @favourites = Favourite.all
#     render json: @favourites
#   end

#   # GET /favourites/1
#   # GET /favourites/1.json
#   def show
#     render json: @favourites
#   end

#   # GET /favourites/new
#   def new
#     @favourite = Favourite.new
#   end

#   # GET /favourites/1/edit
#   def edit
#   end

#   # POST /favourites
#   # POST /favourites.json
#   def create
#     @favourite = Favourite.new(favourite_params)
#     # favourite = Favourite.new user: current_user

#     respond_to do |format|
#       if @favourite.save
#         format.html { redirect_to @favourite, notice: 'Favourite was successfully created.' }
#         format.json { render :show, status: :created, location: @favourite }
#       else
#         format.html { render :new }
#         format.json { render json: @favourite.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /favourites/1
#   # PATCH/PUT /favourites/1.json
#   def update
#     respond_to do |format|
#       if @favourite.update(favourite_params)
#         format.html { redirect_to @favourite, notice: 'Favourite was successfully updated.' }
#         format.json { render :show, status: :ok, location: @favourite }
#       else
#         format.html { render :edit }
#         format.json { render json: @favourite.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /favourites/1
#   # DELETE /favourites/1.json
#   def destroy
#     @favourite.destroy
#     respond_to do |format|
#       format.html { redirect_to favourites_url, notice: 'Favourite was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_favourite
#       @favourite = Favourite.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def favourite_params
#       params.require(:favourite).permit(:user_id, :res_id)
#     end
# end