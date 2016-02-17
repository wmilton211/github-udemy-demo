require 'rspec'
require 'page-object'
require 'data_magic'

Before do
	DataMagic.yml_directory = 'features/config/data'
end

World(PageObject::PageFactory)
