RailsAdmin.config do |config|
#config.authorize_with :cancan
config.excluded_models << "Request"
config.excluded_models << "LineItem"
config.excluded_models << "PartLineItem"
config.excluded_models << "PartRequest"

config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method &:current_user

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Subcategory' do
  parent Product
end
config.model 'Property' do
  parent Product
end
config.model 'Order' do
  parent Product
  weight -1
end
config.model 'Product' do
  navigation_label 'Product'
  weight -3
end

config.model 'Part' do
  navigation_label 'Parts'
  weight -2
end

config.model 'Consumable' do
  navigation_label 'Consumables'
  weight -1
end
config.model 'Store' do
  parent Part
end
config.model 'Supplier' do
  parent Part
end
config.model 'Manufacturer' do
  parent Part
end
config.model 'Use' do
  parent Part
end
config.model 'ConsumableSubcategory' do
  parent Consumable
end
config.model 'ConsumableProperty' do
  parent ConsumableSubcategory
end
config.model 'ConsumableUse' do
  parent ConsumableSubcategory
end


end
