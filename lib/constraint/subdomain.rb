module Constraint
  class Subdomain
    def self.matches?(request)
      subdomains = %w(www)
      request.subdomain.present? && subdomains.include?(request.subdomain)
    end
  end
end
