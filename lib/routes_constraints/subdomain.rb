module RoutesConstraints
  RESERVED_DOMAINS = %w(admin www)

  class AccountSubdomain
    def self.matches?(request)
      request.subdomain.present? && !RoutesConstraints::RESERVED_DOMAINS.include?(request.subdomain)
    end
  end

  class SiteSubdomain
    def self.matches?(request)
      !request.subdomain.present? || request.subdomain == "www"
    end
  end
end
