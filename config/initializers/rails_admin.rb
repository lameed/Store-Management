RailsAdmin.config do |config|
config.excluded_models << "Request"
config.excluded_models << "LineItem"
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
config.model 'Product' do
  navigation_label 'Product'
  weight -2
end

config.model 'Part' do
  navigation_label 'Parts'
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
config.model 'Consumable subcategory' do
  parent Consumable
end
config.model 'Consumable property' do
  parent Consumable subcategory
end
config.model 'Consumable use' do
  parent Consumable subcategory
end


end
