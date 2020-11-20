Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#home'
  resources :cocktails, only: [:index, :show, :create] do
    resources :doses, only: [:create]
  end
  resources :doses, only: [:destroy]
end

# no longer need the new routes because cocktail is added on index page, and
# is added on show page
# resources :cocktails, only: [:index, :show, :new, :create] do
#     resources :doses, only: [:new, :create]
#   end
#   resources :doses, only: [:destroy]
# end
