PeerCnnctr::Application.routes.draw do
  resources :peer_groups do
    resources :peers
  end

  root :to => "home#index"
end
