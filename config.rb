# frozen_string_literal: true

require "govuk_tech_docs"

GovukTechDocs.configure(self)

if ENV["PREVIEW"] == "true"
  config[:tech_docs][:ga4_gtm_tracking_id] = nil
  config[:tech_docs][:prevent_indexing] = true
  config[:tech_docs][:service_name] = "[DRAFT] #{config[:tech_docs][:service_name]}"
end

activate :relative_assets
set :relative_links, true
