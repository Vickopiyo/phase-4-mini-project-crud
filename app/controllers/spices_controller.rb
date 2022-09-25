class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound , with: [:error_response]


# GET all spices 
def index
  render json: Spice.all
end

# GET  a spice
def show
    spice = find_spice
    render json: spice
end 
# CREATE  a spice
def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
end
 
# UPDATE spice
def update 
    spice = find_spice
    spice.update(spice_params)
    render json: spice
end

# DELETE spice
def destroy
    spice = find_spice
    spice.destroy
    head :no_content
end
private

def spice_params
   params.permit(:title,:image,:description,:notes,:rating)

end
def find_spice
    Spice.find(params[:id])
end
def error_response
    render json: { error: "Spice not found"}, status: :not_found 
end

end
