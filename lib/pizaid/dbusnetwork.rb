# -*- coding: utf-8 -*-
require 'dbus'
require 'socket'

module Pizaid
  module Controller
    class DBusNetwork < DBus::Object
      dbus_interface "com.pizaid.network.Properties" do
        # IPv4アドレス
        dbus_method :Get_ipv4, "out str:s" do
          Socket.getifaddrs.select {|x|
            x.name == "eth0" and x.addr.ipv4?
          }.first.addr.ip_address
        end
        # IPv6アドレス
        dbus_method :Get_ipv6, "out str:s" do
          Socket.getifaddrs.select {|x|
            x.name == "eth0" and x.addr.ipv6?
          }.first.addr.ip_address
        end
      end
    end
  end
end