class LikesController < ApplicationController
    
    #좋아요 액션, redirect 부분은 :back이 안되서(why..?) params로 보냄
    def like_toggle
        like=Like.find_by(user_id: current_user.id,
                          post_id: params[:post_id])
                          
        if like.nil?
            Like.create(user_id: current_user.id,
                        post_id: params[:post_id])
                            
            else
                like.destroy
        end
            
       redirect_to "/posts/show/#{params[:post_id]}"
    end
    
end
