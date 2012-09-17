class WebfingerController < ActionController::Metal
  include ActionController::Redirecting
  include Rails.application.routes.url_helpers

  def index
    actor = Actor.find_by_webfinger!(params[:q])

    finger = Proudhon::Finger.new(
      :subject => "acct:#{ actor.slug }@#{ request.host_with_port }",
      :alias   => polymorphic_url(actor.subject),
      :links   => {
        :profile => polymorphic_url([actor.subject, :profile]),
        :updates_from => polymorphic_url([actor.subject, :activities], :format => :atom)
      })

    self.response_body = finger.to_xml
    self.content_type  = Mime::XML
  end
end
