Rails.application.routes.draw do
  namespace :style_guide, path: 'style-guide' do
    root to: "style#index"
    get "/:id" => "style#show", :as => :section
    get "/:section_id/:id" => "style#show", :as => :subsection
  end
end
