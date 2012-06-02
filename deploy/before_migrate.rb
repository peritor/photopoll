include Chef::Mixin::LanguageIncludeRecipe
include Chef::Mixin::LanguageIncludeAttribute

include_recipe "redis::configure-client"
