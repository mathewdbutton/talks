# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: widget.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("widget.proto", :syntax => :proto3) do
    add_message "Widget" do
      optional :name, :string, 1
      optional :length, :float, 2
    end
  end
end

Widget = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Widget").msgclass
