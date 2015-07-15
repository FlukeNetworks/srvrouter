require "srvrouter/version"
require "resolv"

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

  def lookup_srv(service)
    answers = []
    Resolv::DNS.open() do |resolver|
      answers = resolver.getresources(service, Resolv::DNS::Resource::IN::SRV)
    end
    ret = []
    answers.each do |ans|
      ret << "#{ans.target}:#{ans.port}"
    end
    return ret
  end
end
