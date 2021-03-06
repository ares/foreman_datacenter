module ForemanDatacenter
  class ConsolePort < ActiveRecord::Base
    belongs_to :device, :class_name => 'ForemanDatacenter::Device'
    belongs_to :console_server_port, :class_name => 'ForemanDatacenter::ConsoleServerPort'

    enum connection_status: [:connected, :planned]

    validates :device_id, presence: true
    validates :name, presence: true, length: { maximum: 30 }

    def connect(port, connection_status)
      update(console_server_port: port, connection_status: connection_status)
    end

    def disconnect
      update(console_server_port: nil)
    end
  end
end
