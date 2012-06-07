class CompanyObserver < Mongoid::Observer

  def after_create(company)
    #HerokuSubdomain.provider.create(company.subdomain)
  end
end
