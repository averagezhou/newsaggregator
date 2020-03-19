Rails.application.routes.draw do



  # Routes for the Follow resource:

  # CREATE
  post("/insert_follow", { :controller => "follows", :action => "create" })
          
  # READ
  get("/follows", { :controller => "follows", :action => "index" })
  
  get("/follows/:path_id", { :controller => "follows", :action => "show" })
  
  # UPDATE
  
  post("/modify_follow/:path_id", { :controller => "follows", :action => "update" })
  
  # DELETE
  get("/delete_follow/:path_id", { :controller => "follows", :action => "destroy" })

  #------------------------------

  # Routes for the Source resource:

  # CREATE
  post("/insert_source", { :controller => "sources", :action => "create" })
          
  # READ
  get("/sources", { :controller => "sources", :action => "index" })
  
  get("/sources/:path_id", { :controller => "sources", :action => "show" })
  
  # UPDATE
  
  post("/modify_source/:path_id", { :controller => "sources", :action => "update" })
  
  # DELETE
  get("/delete_source/:path_id", { :controller => "sources", :action => "destroy" })

  #------------------------------

  # Routes for the Bookmark resource:

  # CREATE
  post("/insert_bookmark", { :controller => "bookmarks", :action => "create" })
          
  # READ
  get("/bookmarks", { :controller => "bookmarks", :action => "index" })
  
  get("/bookmarks/:path_id", { :controller => "bookmarks", :action => "show" })
  
  # UPDATE
  
  post("/modify_bookmark/:path_id", { :controller => "bookmarks", :action => "update" })
  
  # DELETE
  get("/delete_bookmark/:path_id", { :controller => "bookmarks", :action => "destroy" })

  #------------------------------

  # Routes for the Article resource:

  # CREATE
  post("/insert_article", { :controller => "articles", :action => "create" })
          
  # READ
  get("/articles", { :controller => "articles", :action => "index" })
  
  get("/articles/:path_id", { :controller => "articles", :action => "show" })
  
  # UPDATE
  
  post("/modify_article/:path_id", { :controller => "articles", :action => "update" })
  
  # DELETE
  get("/delete_article/:path_id", { :controller => "articles", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
