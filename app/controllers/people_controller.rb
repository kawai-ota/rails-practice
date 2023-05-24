class PeopleController < ApplicationController
  def index
    @data = Person.all
    @msg = "JSON data loaded."
    respond_to do |format|
      format.html
      format.json { render json: @data }
    end
  end

  def show
    @msg = "Index data."
    @data = Person.find(params[:id])
  end

  def add
    @msg = "add new data"
  end

  def create
    if request.post? then
      obj = Person.create(name:params['name'],age:params['age'],main:params['main'])
    end
    redirect_to'/people'
  end

  def edit 
    @msg = "edit data.[id = " + params[:id] + "]"
    @person = Person.find(params[:id])
  end

  def update
    obj = Person.find (params[:id])
    obj.update(person_params)
    redirect_to '/people'
  end

  def delete 
    obj = Person.find(params[:id])
    obj.destroy
    redirect_to '/people'
  end

  private

def person_params
  params.require(:person).permit(:name, :age, :main)
end

end
