class InvestmentData {
  // Output1 fields
  final String prdtName;
  final double cblcQty;
  final double thdtBuyCcldQty;
  final double thdtSllCcldQty;
  final double ccldQtySmtl;
  final double ordPsblQty;
  final double frcrPchsAmt;
  final double frcrEvluAmt;
  final double evluPflsAmt;
  final double evluPflsRt;
  final String pdno;
  final double bassExrt;
  final String buyCrcyCd;
  final double ovrsNowPric;
  final double avgUnpr;
  final String trMketName;
  final String natnKorName;
  final double pchsRmndWcrcAmt;
  final double unitAmt;
  final String stdPdno;
  final String prdtTypeCd;
  final String sctsDvsnName;
  final int loanRmnd;

  // Output2 fields
  final String crcyCd;
  final String crcyCdName;
  final double frcrBuyAmtSmtl;
  final double frcrSllAmtSmtl;
  final double frcrDnclAmt;
  final double frstBltnExrt;
  final double frcrBuyMgnAmt;
  final double frcrEtcMgna;
  final double frcrDrwgPsblAmt;
  final double frcrEvluAmt2;
  final String acplCstdCrcyYn;
  final double nxdyFrcrDrwgPsblAmt;

  // Output3 fields
  final double pchsAmtSmtl;
  final double evluAmtSmtl;
  final double evluPflsAmtSmtl;
  final double dnclAmt;
  final double cmaEvluAmt;
  final double totDnclAmt;
  final double etcMgna;
  final double wdrwPsblTotAmt;
  final double frcrEvluTota;
  final double evluErngRt;
  final double pchsAmtSmtlAmt;
  final double evluAmtSmtlAmt;
  final double totEvluPflsAmt;
  final double totAsstAmt;
  final double buyMgnAmt;
  final double mgnaTota;
  final double frcrUsePsblAmt;
  final double ustlSllAmtSmtl;
  final double ustlBuyAmtSmtl;
  final double totFrcrCblcSmtl;
  final double totLoanAmt;

  // General fields
  final String message;
  final String rtCd;
  final String msgCd;

  InvestmentData({
    required this.prdtName,
    required this.cblcQty,
    required this.thdtBuyCcldQty,
    required this.thdtSllCcldQty,
    required this.ccldQtySmtl,
    required this.ordPsblQty,
    required this.frcrPchsAmt,
    required this.frcrEvluAmt,
    required this.evluPflsAmt,
    required this.evluPflsRt,
    required this.pdno,
    required this.bassExrt,
    required this.buyCrcyCd,
    required this.ovrsNowPric,
    required this.avgUnpr,
    required this.trMketName,
    required this.natnKorName,
    required this.pchsRmndWcrcAmt,
    required this.unitAmt,
    required this.stdPdno,
    required this.prdtTypeCd,
    required this.sctsDvsnName,
    required this.loanRmnd,
    required this.crcyCd,
    required this.crcyCdName,
    required this.frcrBuyAmtSmtl,
    required this.frcrSllAmtSmtl,
    required this.frcrDnclAmt,
    required this.frstBltnExrt,
    required this.frcrBuyMgnAmt,
    required this.frcrEtcMgna,
    required this.frcrDrwgPsblAmt,
    required this.frcrEvluAmt2,
    required this.acplCstdCrcyYn,
    required this.nxdyFrcrDrwgPsblAmt,
    required this.pchsAmtSmtl,
    required this.evluAmtSmtl,
    required this.evluPflsAmtSmtl,
    required this.dnclAmt,
    required this.cmaEvluAmt,
    required this.totDnclAmt,
    required this.etcMgna,
    required this.wdrwPsblTotAmt,
    required this.frcrEvluTota,
    required this.evluErngRt,
    required this.pchsAmtSmtlAmt,
    required this.evluAmtSmtlAmt,
    required this.totEvluPflsAmt,
    required this.totAsstAmt,
    required this.buyMgnAmt,
    required this.mgnaTota,
    required this.frcrUsePsblAmt,
    required this.ustlSllAmtSmtl,
    required this.ustlBuyAmtSmtl,
    required this.totFrcrCblcSmtl,
    required this.totLoanAmt,
    required this.message,
    required this.rtCd,
    required this.msgCd,
  });

  factory InvestmentData.fromJson(Map<String, dynamic> json) {
    return InvestmentData(
        prdtName: json['output1'][0]['prdt_name'],
        cblcQty: double.parse(json['output1'][0]['cblc_qty13']),
        thdtBuyCcldQty: double.parse(json['output1'][0]['thdt_buy_ccld_qty1']),
        thdtSllCcldQty: double.parse(json['output1'][0]['thdt_sll_ccld_qty1']),
        ccldQtySmtl: double.parse(json['output1'][0]['ccld_qty_smtl1']),
        ordPsblQty: double.parse(json['output1'][0]['ord_psbl_qty1']),
        frcrPchsAmt: double.parse(json['output1'][0]['frcr_pchs_amt']),
        frcrEvluAmt: double.parse(json['output1'][0]['frcr_evlu_amt2']),
        evluPflsAmt: double.parse(json['output1'][0]['evlu_pfls_amt2']),
        evluPflsRt: double.parse(json['output1'][0]['evlu_pfls_rt1']),
        pdno: json['output1'][0]['pdno'],
        bassExrt: double.parse(json['output1'][0]['bass_exrt']),
        buyCrcyCd: json['output1'][0]['buy_crcy_cd'],
        ovrsNowPric: double.parse(json['output1'][0]['ovrs_now_pric1']),
        avgUnpr: double.parse(json['output1'][0]['avg_unpr3']),
        trMketName: json['output1'][0]['tr_mket_name'],
        natnKorName: json['output1'][0]['natn_kor_name'],
        pchsRmndWcrcAmt: double.parse(json['output1'][0]['pchs_rmnd_wcrc_amt']),
        unitAmt: double.parse(json['output1'][0]['unit_amt']),
        stdPdno: json['output1'][0]['std_pdno'],
        prdtTypeCd: json['output1'][0]['prdt_type_cd'],
        sctsDvsnName: json['output1'][0]['scts_dvsn_name'],
        loanRmnd: int.parse(json['output1'][0]['loan_rmnd']),
        crcyCd: json['output2'][0]['crcy_cd'],
        crcyCdName: json['output2'][0]['crcy_cd_name'],
        frcrBuyAmtSmtl: double.parse(json['output2'][0]['frcr_buy_amt_smtl']),
        frcrSllAmtSmtl: double.parse(json['output2'][0]['frcr_sll_amt_smtl']),
        frcrDnclAmt: double.parse(json['output2'][0]['frcr_dncl_amt_2']),
        frstBltnExrt: double.parse(json['output2'][0]['frst_bltn_exrt']),
        frcrBuyMgnAmt: double.parse(json['output2'][0]['frcr_buy_mgn_amt']),
        frcrEtcMgna: double.parse(json['output2'][0]['frcr_etc_mgna']),
        frcrDrwgPsblAmt: double.parse(json['output2'][0]['frcr_drwg_psbl_amt_1']),
        frcrEvluAmt2: double.parse(json['output2'][0]['frcr_evlu_amt2']),
        acplCstdCrcyYn: json['output2'][0]['acpl_cstd_crcy_yn'],
        nxdyFrcrDrwgPsblAmt: double.parse(json['output2'][0]['nxdy_frcr_drwg_psbl_amt']),
        pchsAmtSmtl: double.parse(json['output3']['pchs_amt_smtl']),
        evluAmtSmtl: double.parse(json['output3']['evlu_amt_smtl']),
        evluPflsAmtSmtl: double.parse(json['output3']['evlu_pfls_amt_smtl']),
        dnclAmt: double.parse(json['output3']['dncl_amt']),
        cmaEvluAmt: double.parse(json['output3']['cma_evlu_amt']),
        totDnclAmt: double.parse(json['output3']['tot_dncl_amt']),
        etcMgna: double.parse(json['output3']['etc_mgna']),
        wdrwPsblTotAmt: double.parse(json['output3']['wdrw_psbl_tot_amt']),
        frcrEvluTota: double.parse(json['output3']['frcr_evlu_tota']),
        evluErngRt: double.parse(json['output3']['evlu_erng_rt1']),
        pchsAmtSmtlAmt: double.parse(json['output3']['pchs_amt_smtl_amt']),
        evluAmtSmtlAmt: double.parse(json['output3']['evlu_amt_smtl_amt']),
        totEvluPflsAmt: double.parse(json['output3']['tot_evlu_pfls_amt']),
        totAsstAmt: double.parse(json['output3']['tot_asst_amt']),
        buyMgnAmt: double.parse(json['output3']['buy_mgn_amt']),
        mgnaTota: double.parse(json['output3']['mgna_tota']),
        frcrUsePsblAmt: double.parse(json['output3']['frcr_use_psbl_amt']),
        ustlSllAmtSmtl: double.parse(json['output3']['ustl_sll_amt_smtl']),
        ustlBuyAmtSmtl: double.parse(json['output3']['ustl_buy_amt_smtl']),
        totFrcrCblcSmtl: double.parse(json['output3']['tot_frcr_cblc_smtl']),
        totLoanAmt: double.parse(json['output3']['tot_loan_amt']),
        message: json['msg1'],
        rtCd: json['rt_cd'],
        msgCd: json['msg_cd']
    );
  }
}
