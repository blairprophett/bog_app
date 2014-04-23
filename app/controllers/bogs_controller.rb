class BogsController < ApplicationController
  def index
  	@creatures = Creature.all
  	render :index
  end

  def new
    render :new
  end	

  def create
  	creature = params.require(:creature).permit(:name, :description)
  	Creature.create(creature)
    redirect_to "/bogs"
  end

  def show
  	creature_id = params[:id]
  	@creatures = Creature.find(creature_id)
  	render :show
  end

  def edit
  	creature_id = params[:id]
  	@creatures = Creature.find(creature_id)
  	render :edit
  end

  def update
  	creature_id = params[:id]
  	creature = Creature.find(creature_id)

  	updated_attributes = params.require(:creature).permit(:name, :description)
  	creature.update_attributes(updated_attributes)

  	redirect_to '/bogs/#{creature_id}'
  end

end