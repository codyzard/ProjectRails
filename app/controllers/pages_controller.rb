class PagesController < ApplicationController

    def search
        if params[:search].blank?
            redirect_to(root_path, alert: "Empty Field!") and return
        else
            @parameter = params[:search].downcase
            @results = User.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
        end
    end

end
