source "https://rubygems.org"

# Include gem dependencies from ruby-openai.gemspec
gemspec

# Development dependencies. Not included in the published gem.
# Versions pinned to lines compatible with Ruby 2.3.8 install:
#   * rubocop > 1.50 requires Ruby >= 2.7
#   * vcr > 6.1 requires Ruby >= 2.7
#   * webmock > 3.18 requires Ruby >= 2.6
#   * dotenv >= 3 requires Ruby >= 3.0
#   * byebug 11.1.3 still requires Ruby >= 2.4 — install with `--without development`
#     on a strict 2.3.8 environment, or run dev tasks on a newer Ruby.
gem "byebug", "~> 11.1.3"
gem "dotenv", "~> 2.8.1"
gem "rake", "~> 13.0"
gem "rspec", "~> 3.12"
gem "rubocop", "~> 1.50.2"
gem "vcr", "~> 6.1.0"
gem "webmock", "~> 3.18.1"
