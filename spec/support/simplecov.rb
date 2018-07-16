# frozen_string_literal: true

simple_cov_formatters = []
simple_cov_formatters << SimpleCov::Formatter::HTMLFormatter

SimpleCov.start do
  minimum_coverage 100
  refuse_coverage_drop

  add_filter '/spec/'

  formatter SimpleCov::Formatter::MultiFormatter.new simple_cov_formatters
end
