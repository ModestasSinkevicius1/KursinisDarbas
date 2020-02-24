Rails.application.routes.draw do
  get 'prisijungimas/prisijungimas'
  root 'prisijungimas#prisijungimas'

  get 'admin/registravimas'

  get 'dalykai/dalykai'

  get 'admin/registravimas_final'

  get 'dalykai/dalykai_destytojas'

  get 'dalykai/dalyka_kurti'

  get 'dalykai/dalykas'

  get 'dalykai/dalykas_destytojas'

  get 'dalykai/dalykas_administratorius'

  get 'sessions/detect'

  get 'dalykai/dalyka_redaguoti'

  get 'dalykai/dalykai_administratorius'

  post 'sessions/login'

  post 'model/create'

  post 'model/create_dalykas'

  post 'admin/registruoti'

  post 'model/edit_dalykas'

  post 'model/create_news'

  delete 'sessions/logout'

  delete 'model/delete_dalykas'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
