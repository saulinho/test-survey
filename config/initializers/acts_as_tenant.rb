ActsAsTenant.configure do |config|
  # In development and test we allow no tenant so local work and automated
  # tests don't raise ActsAsTenant::Errors::NoTenantSet when a subdomain
  # or other tenant lookup isn't available. Keep strict tenant requirement
  # in production to avoid accidental cross-tenant access.
  config.require_tenant = Rails.env.production?
end