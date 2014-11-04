Rails.application.routes.draw do
  root 'tweets#index'
  match '*path' => 'application#error404', via: :all
end
