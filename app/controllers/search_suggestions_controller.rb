def index
  render json: SearchSuggestion.terms_for(params[:term])
end