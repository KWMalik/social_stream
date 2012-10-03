module SocialStream
  module Presence
    class Engine < Rails::Engine
      initializer "social_stream-presence.views.settings" do
        SocialStream::Views::Settings.module_eval do
          include SocialStream::Views::Settings::Presence
        end
      end

      initializer "social_stream-presence.views.toolbar" do
        SocialStream::Views::Toolbar.module_eval do
          include SocialStream::Views::Toolbar::Presence
        end
      end
    end
  end
end
