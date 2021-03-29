# frozen_string_literal: true
class Rack::Attack
  throttle('requests by ip', limit: 100, period: 900) do |request|
    request.ip
  end

  def remote_ip
    @remote_ip ||= (env['action_dispatch.remote_ip'] || ip).to_s
  end
end
