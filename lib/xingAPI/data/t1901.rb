require 'ffi'

module XingAPI
  class STRUCT_t1901InBlock < FFI::Struct
    pack 1
    layout \
          :shcode, [:char, 6],
          :_shcode, [:char, 1],
          :eos, [:char, 0]

    def self.of(pointer)
      new(FFI::Pointer.new(pointer))
    end

    def members
      super.reject do |member|
        member.to_s.start_with?('_') || member == :eos
      end
    end

    def try_string(value)
      case value
      when FFI::StructLayout::CharArray
        value.to_ptr.read_string.force_encoding('cp949')
      else
        value
      end
    end

    def to_hash
      Hash[
        members.map do |m|
          v = self[m]
          v = try_string(v)
          [m, v]
        end
      ]
    end
  end
  class STRUCT_t1901OutBlock < FFI::Struct
    pack 1
    layout \
          :hname, [:char, 20],
          :_hname, [:char, 1],
          :price, [:char, 8],
          :_price, [:char, 1],
          :sign, [:char, 1],
          :_sign, [:char, 1],
          :change, [:char, 8],
          :_change, [:char, 1],
          :diff, [:char, 6],
          :_diff, [:char, 1],
          :volume, [:char, 12],
          :_volume, [:char, 1],
          :recprice, [:char, 8],
          :_recprice, [:char, 1],
          :avg, [:char, 8],
          :_avg, [:char, 1],
          :uplmtprice, [:char, 8],
          :_uplmtprice, [:char, 1],
          :dnlmtprice, [:char, 8],
          :_dnlmtprice, [:char, 1],
          :jnilvolume, [:char, 12],
          :_jnilvolume, [:char, 1],
          :volumediff, [:char, 12],
          :_volumediff, [:char, 1],
          :open, [:char, 8],
          :_open, [:char, 1],
          :opentime, [:char, 6],
          :_opentime, [:char, 1],
          :high, [:char, 8],
          :_high, [:char, 1],
          :hightime, [:char, 6],
          :_hightime, [:char, 1],
          :low, [:char, 8],
          :_low, [:char, 1],
          :lowtime, [:char, 6],
          :_lowtime, [:char, 1],
          :high52w, [:char, 8],
          :_high52w, [:char, 1],
          :high52wdate, [:char, 8],
          :_high52wdate, [:char, 1],
          :low52w, [:char, 8],
          :_low52w, [:char, 1],
          :low52wdate, [:char, 8],
          :_low52wdate, [:char, 1],
          :exhratio, [:char, 6],
          :_exhratio, [:char, 1],
          :flmtvol, [:char, 12],
          :_flmtvol, [:char, 1],
          :per, [:char, 6],
          :_per, [:char, 1],
          :listing, [:char, 12],
          :_listing, [:char, 1],
          :jkrate, [:char, 8],
          :_jkrate, [:char, 1],
          :vol, [:char, 6],
          :_vol, [:char, 1],
          :shcode, [:char, 6],
          :_shcode, [:char, 1],
          :value, [:char, 12],
          :_value, [:char, 1],
          :highyear, [:char, 8],
          :_highyear, [:char, 1],
          :highyeardate, [:char, 8],
          :_highyeardate, [:char, 1],
          :lowyear, [:char, 8],
          :_lowyear, [:char, 1],
          :lowyeardate, [:char, 8],
          :_lowyeardate, [:char, 1],
          :upname, [:char, 20],
          :_upname, [:char, 1],
          :upcode, [:char, 3],
          :_upcode, [:char, 1],
          :upprice, [:char, 7],
          :_upprice, [:char, 1],
          :upsign, [:char, 1],
          :_upsign, [:char, 1],
          :upchange, [:char, 6],
          :_upchange, [:char, 1],
          :updiff, [:char, 6],
          :_updiff, [:char, 1],
          :futname, [:char, 20],
          :_futname, [:char, 1],
          :futcode, [:char, 8],
          :_futcode, [:char, 1],
          :futprice, [:char, 6],
          :_futprice, [:char, 1],
          :futsign, [:char, 1],
          :_futsign, [:char, 1],
          :futchange, [:char, 6],
          :_futchange, [:char, 1],
          :futdiff, [:char, 6],
          :_futdiff, [:char, 1],
          :nav, [:char, 8],
          :_nav, [:char, 1],
          :navsign, [:char, 1],
          :_navsign, [:char, 1],
          :navchange, [:char, 8],
          :_navchange, [:char, 1],
          :navdiff, [:char, 6],
          :_navdiff, [:char, 1],
          :cocrate, [:char, 6],
          :_cocrate, [:char, 1],
          :kasis, [:char, 6],
          :_kasis, [:char, 1],
          :subprice, [:char, 10],
          :_subprice, [:char, 1],
          :offerno1, [:char, 6],
          :_offerno1, [:char, 1],
          :bidno1, [:char, 6],
          :_bidno1, [:char, 1],
          :dvol1, [:char, 8],
          :_dvol1, [:char, 1],
          :svol1, [:char, 8],
          :_svol1, [:char, 1],
          :dcha1, [:char, 8],
          :_dcha1, [:char, 1],
          :scha1, [:char, 8],
          :_scha1, [:char, 1],
          :ddiff1, [:char, 6],
          :_ddiff1, [:char, 1],
          :sdiff1, [:char, 6],
          :_sdiff1, [:char, 1],
          :offerno2, [:char, 6],
          :_offerno2, [:char, 1],
          :bidno2, [:char, 6],
          :_bidno2, [:char, 1],
          :dvol2, [:char, 8],
          :_dvol2, [:char, 1],
          :svol2, [:char, 8],
          :_svol2, [:char, 1],
          :dcha2, [:char, 8],
          :_dcha2, [:char, 1],
          :scha2, [:char, 8],
          :_scha2, [:char, 1],
          :ddiff2, [:char, 6],
          :_ddiff2, [:char, 1],
          :sdiff2, [:char, 6],
          :_sdiff2, [:char, 1],
          :offerno3, [:char, 6],
          :_offerno3, [:char, 1],
          :bidno3, [:char, 6],
          :_bidno3, [:char, 1],
          :dvol3, [:char, 8],
          :_dvol3, [:char, 1],
          :svol3, [:char, 8],
          :_svol3, [:char, 1],
          :dcha3, [:char, 8],
          :_dcha3, [:char, 1],
          :scha3, [:char, 8],
          :_scha3, [:char, 1],
          :ddiff3, [:char, 6],
          :_ddiff3, [:char, 1],
          :sdiff3, [:char, 6],
          :_sdiff3, [:char, 1],
          :offerno4, [:char, 6],
          :_offerno4, [:char, 1],
          :bidno4, [:char, 6],
          :_bidno4, [:char, 1],
          :dvol4, [:char, 8],
          :_dvol4, [:char, 1],
          :svol4, [:char, 8],
          :_svol4, [:char, 1],
          :dcha4, [:char, 8],
          :_dcha4, [:char, 1],
          :scha4, [:char, 8],
          :_scha4, [:char, 1],
          :ddiff4, [:char, 6],
          :_ddiff4, [:char, 1],
          :sdiff4, [:char, 6],
          :_sdiff4, [:char, 1],
          :offerno5, [:char, 6],
          :_offerno5, [:char, 1],
          :bidno5, [:char, 6],
          :_bidno5, [:char, 1],
          :dvol5, [:char, 8],
          :_dvol5, [:char, 1],
          :svol5, [:char, 8],
          :_svol5, [:char, 1],
          :dcha5, [:char, 8],
          :_dcha5, [:char, 1],
          :scha5, [:char, 8],
          :_scha5, [:char, 1],
          :ddiff5, [:char, 6],
          :_ddiff5, [:char, 1],
          :sdiff5, [:char, 6],
          :_sdiff5, [:char, 1],
          :fwdvl, [:char, 12],
          :_fwdvl, [:char, 1],
          :ftradmdcha, [:char, 12],
          :_ftradmdcha, [:char, 1],
          :ftradmddiff, [:char, 6],
          :_ftradmddiff, [:char, 1],
          :fwsvl, [:char, 12],
          :_fwsvl, [:char, 1],
          :ftradmscha, [:char, 12],
          :_ftradmscha, [:char, 1],
          :ftradmsdiff, [:char, 6],
          :_ftradmsdiff, [:char, 1],
          :upname2, [:char, 20],
          :_upname2, [:char, 1],
          :upcode2, [:char, 3],
          :_upcode2, [:char, 1],
          :upprice2, [:char, 7],
          :_upprice2, [:char, 1],
          :jnilnav, [:char, 8],
          :_jnilnav, [:char, 1],
          :jnilnavsign, [:char, 1],
          :_jnilnavsign, [:char, 1],
          :jnilnavchange, [:char, 8],
          :_jnilnavchange, [:char, 1],
          :jnilnavdiff, [:char, 6],
          :_jnilnavdiff, [:char, 1],
          :etftotcap, [:char, 12],
          :_etftotcap, [:char, 1],
          :spread, [:char, 6],
          :_spread, [:char, 1],
          :leverage, [:char, 2],
          :_leverage, [:char, 1],
          :taxgubun, [:char, 1],
          :_taxgubun, [:char, 1],
          :opcom_nmk, [:char, 20],
          :_opcom_nmk, [:char, 1],
          :lp_nm1, [:char, 20],
          :_lp_nm1, [:char, 1],
          :lp_nm2, [:char, 20],
          :_lp_nm2, [:char, 1],
          :lp_nm3, [:char, 20],
          :_lp_nm3, [:char, 1],
          :lp_nm4, [:char, 20],
          :_lp_nm4, [:char, 1],
          :lp_nm5, [:char, 20],
          :_lp_nm5, [:char, 1],
          :etf_cp, [:char, 10],
          :_etf_cp, [:char, 1],
          :etf_kind, [:char, 10],
          :_etf_kind, [:char, 1],
          :vi_gubun, [:char, 10],
          :_vi_gubun, [:char, 1],
          :etn_kind_cd, [:char, 20],
          :_etn_kind_cd, [:char, 1],
          :lastymd, [:char, 8],
          :_lastymd, [:char, 1],
          :payday, [:char, 8],
          :_payday, [:char, 1],
          :lastdate, [:char, 8],
          :_lastdate, [:char, 1],
          :issuernmk, [:char, 20],
          :_issuernmk, [:char, 1],
          :last_sdate, [:char, 8],
          :_last_sdate, [:char, 1],
          :last_edate, [:char, 8],
          :_last_edate, [:char, 1],
          :lp_holdvol, [:char, 12],
          :_lp_holdvol, [:char, 1],
          :eos, [:char, 0]

    def self.of(pointer)
      new(FFI::Pointer.new(pointer))
    end

    def members
      super.reject do |member|
        member.to_s.start_with?('_') || member == :eos
      end
    end

    def try_string(value)
      case value
      when FFI::StructLayout::CharArray
        value.to_ptr.read_string.force_encoding('cp949')
      else
        value
      end
    end

    def to_hash
      Hash[
        members.map do |m|
          v = self[m]
          v = try_string(v)
          [m, v]
        end
      ]
    end
  end
end
