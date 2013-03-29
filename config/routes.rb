Rails.application.routes.draw do
  namespace :style_guide, path: 'style-guide' do
    root to: "style#index"
    get "/:id" => "style#show", :as => :section
  end
end
