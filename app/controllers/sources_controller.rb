class SourcesController < ApplicationController
  def index
    @sources = Source.all.order({ :created_at => :desc })

    render({ :template => "sources/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @source = Source.where({:id => the_id }).at(0)

    render({ :template => "sources/show.html.erb" })
  end

  def create
    @source = Source.new
    @source.name = params.fetch("query_name")

    if @source.valid?
      @source.save
      redirect_to("/sources", { :notice => "Source created successfully." })
    else
      redirect_to("/sources", { :notice => "Source failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @source = Source.where({ :id => the_id }).at(0)

    @source.name = params.fetch("query_name")

    if @source.valid?
      @source.save
      redirect_to("/sources/#{@source.id}", { :notice => "Source updated successfully."} )
    else
      redirect_to("/sources/#{@source.id}", { :alert => "Source failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @source = Source.where({ :id => the_id }).at(0)

    @source.destroy

    redirect_to("/sources", { :notice => "Source deleted successfully."} )
  end
end
