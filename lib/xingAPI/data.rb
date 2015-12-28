require 'ffi'

data_dir = File.expand_path('../data', __FILE__)
Dir["#{data_dir}/*.rb"].each do |filename|
  require filename
end

module XingAPI
  class RECV_PACKET < FFI::Struct
    pack 1
    layout \
      :nRqID, :int,
      :nDataLength, :int,
      :nTotalDataBufferSize, :int,
      :nElapsedTime, :int,
      :nDataMode, :int,
      :szTrCode, [:char, 11],
      :cCont, [:char, 1],
      :szContKey, [:char, 19],
      :szUserData, [:char, 31],
      :szBlockName, [:char, 17],
      :lpData, :pointer

    def nRqID; self[:nRqID]; end
    def nDataLength; self[:nDataLength]; end
    def nTotalDataBufferSize; self[:nTotalDataBufferSize]; end
    def nElapsedTime; self[:nElapsedTime]; end
    def nDataMode; self[:nDataMode]; end
    def szTrCode; self[:szTrCode].to_ptr.read_string; end
    def cCont; self[:cCont].to_ptr.read_string; end
    def szContKey; self[:szContKey].to_ptr.read_string; end
    def szUserData; self[:szUserData].to_ptr.read_string; end
    def szBlockName; self[:szBlockName].to_ptr.read_string; end
    def lpData; self[:lpData]; end

    def data
      ::XingAPI.const_get("STRUCT_#{szBlockName}").of(lpData)
    end

    def to_s
      "#{szBlockName}"
    end

    def self.of(pointer)
      new(FFI::Pointer.new(pointer))
    end
  end

  class MSG_PACKET < FFI::Struct
    pack 1
    layout \
      :nRqID, :int,
      :nIsSystemError, :int,
      :szMsgCode, [:char, 6],
      :nMsgLength, :int,
      :lpszMessageData, :string

    def nRqID; self[:nRqID]; end
    def nIsSystemError; self[:nIsSystemError]; end
    def szMsgCode; self[:szMsgCode].to_ptr.read_string; end
    def nMsgLength; self[:nMsgLength]; end
    def lpszMessageData; self[:lpszMessageData].force_encoding('cp949'); end

    def to_s
      "[#{szMsgCode}] #{lpszMessageData}"
    end

    def self.of(pointer)
      new(FFI::Pointer.new(pointer))
    end
  end
end