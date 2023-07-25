class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]

  # GET /lists or /lists.json
  def index
    @lists = (current_user.lists + current_user.owned_lists).uniq
  end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
    @list.user_lists.build  # Ajoute une nouvelle instance de UserList à la liste
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)
    @list.user = current_user

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        puts @list.errors.full_messages  # Imprimer les erreurs
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    if @list.update(list_params)
      redirect_to @list
    else
      render :edit
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.user_lists.destroy_all
    @list.destroy
    redirect_to lists_url, notice: 'List was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name, user_ids: [], item_ids: [])
    end
end
