# frozen_string_literal: true

require "govuk_tech_docs"

GovukTechDocs.configure(self)

# Get current git branch
branch = `git rev-parse --abbrev-ref HEAD`.strip

case branch
when "main" 
    config[:tech_docs]["prevent_indexing"] = false
else
    # Prevent robots from indexing preview sites
    config[:tech_docs]["prevent_indexing"] = true
    # Use phase to label previews as draft content
    config[:tech_docs]["phase"] = "Draft"
end

activate :relative_assets
set :relative_links, true
