require "srvrouter/version"

module SRVRouter
  class HAProxyConfig
    attr_accessor :frontend_port, :backends, :service

    def initialize(service, frontend_port, backends)
      @frontend_port = frontend_port
      @backends = backends
      @service = service
    end

    def get_binding
      binding()
    end
  end
end
