class Children::SummariesController < ApplicationController
  def new
    
  end

  def create
    search_request = SearchRequest.create_search(ApplicationController.current_user.user_name, params[:search_params])
    search_request.save
    redirect_to children_summary_path
  end

  def show
    search_params = SearchRequest.get(ApplicationController.current_user.user_name)
    @prev_child_name = search_params[:child_name]
    @prev_unique_identifier = search_params[:unique_identifier]
    @results = search_params.get_results()
    if 1 == @results.length
      redirect_to child_path( @results.first )
    end
  end
end