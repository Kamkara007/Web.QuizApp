module ApplicationHelper
    #determiner le current_user model 
    def current_user_is
        if current_user
          "user"
        end
    end
     #sign In fields
     def render_sign_in_fields 
        render "shared/sign_fields/sign_in"
    end 

    #sign Up fields
    def render_sign_up_fields 
        render "shared/sign_fields/sign_up"
    end 
    # avatar user's
    def avatar_user
        render "shared/contents/avatar_user"
    end
end
