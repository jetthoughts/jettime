Rails.application.config.generators do |g|
    g.template_engine :haml
    g.test_framework :rspec, fixture_replacement: :factory_girl, views: false, helper: false
    g.view_specs false
    g.helper_specs false
    g.helper false
    g.assets false
    g.fixture_replacement :factory_girl, dir: 'spec/factories'

end
