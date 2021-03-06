module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /the list of (.+)/
      class_name = $1.pluralize.downcase
      eval("#{class_name}_path")

    when /the show of person "(.+)" month "(.+)" from year "(.+)"/
      model = Person.find_by_name($1)
      person_show_date_path(model, $3, $2)
      
    when /the show first account in the (.+) "(.+)"/
      clazz = $1.camelize.constantize.find_by_name($2)
      a = clazz.accounts.first
      send("#{$1}_account_path", clazz, a)

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)

