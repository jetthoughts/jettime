module RoutesConstraints
  RESERVED_DOMAINS = [Rails.application.config.admin_subdomain, Rails.application.config.site_subdomain]

  class AccountSubdomain
    def self.matches?(request)
      request.subdomain.present? && !RoutesConstraints::RESERVED_DOMAINS.include?(request.subdomain)
    end
  end

  class SiteSubdomain
    def self.matches?(request)
      !request.subdomain.present? || request.subdomain == Rails.application.config.site_subdomain
    end
  end

  class AdminSubdomain
    def self.matches?(request)
      !request.subdomain.present? || request.subdomain == Rails.application.config.admin_subdomain
    end
  end
end
