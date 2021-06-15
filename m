Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC31C3A85DD
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 18:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbhFOQCM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 15 Jun 2021 12:02:12 -0400
Received: from mga01.intel.com ([192.55.52.88]:42808 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231822AbhFOQB5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 12:01:57 -0400
IronPort-SDR: EYNcLnUl+u5Gol2Q2Vo/Yv7h4B72uPbZTDl31trs/11FjzRLe9TdYAzH+WfWrN5tkNmJB8TzlZ
 qds+q8IKrjqA==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="227493072"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="227493072"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2021 08:59:00 -0700
IronPort-SDR: PVslqGg/haeN04wuS6Ye2IBwCVViFQsdR+jLVQAhyks+zp1H3GlCg0PSs/8+FvpiX80wBgdpcD
 3goTGrj72vgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="484518544"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP; 15 Jun 2021 08:58:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 08:58:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 08:58:58 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2242.008;
 Tue, 15 Jun 2021 08:58:58 -0700
From:   "Saleem, Shiraz" <shiraz.saleem@intel.com>
To:     coverity-bot <keescook@chromium.org>,
        "Ismail, Mustafa" <mustafa.ismail@intel.com>,
        "Nikolova, Tatyana E" <tatyana.e.nikolova@intel.com>
CC:     Jason Gunthorpe <jgg@nvidia.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: RE: Coverity: irdma_reg_user_mr(): Integer handling issues
Thread-Topic: Coverity: irdma_reg_user_mr(): Integer handling issues
Thread-Index: AQHXXJCrm2HDgmMBNkOTshdqSw11MqsVPPvA
Date:   Tue, 15 Jun 2021 15:58:58 +0000
Message-ID: <972a9a73e0354ff5b2822c7809e71493@intel.com>
References: <202106081103.83B36CB@keescook>
In-Reply-To: <202106081103.83B36CB@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> Subject: Coverity: irdma_reg_user_mr(): Integer handling issues
> 
> Hello!
> 
> This is an experimental semi-automated report about issues detected by Coverity
> from a scan of next-20210608 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified lines of
> code (noted below) that were touched by commits:
> 
>   Wed Jun 2 19:55:18 2021 -0300
>     b48c24c2d710 ("RDMA/irdma: Implement device supported verb APIs")
> 
> Coverity reported the following:
> 
> *** CID 1505149:  Integer handling issues  (DIVIDE_BY_ZERO)
> /drivers/infiniband/hw/irdma/verbs.c: 2794 in irdma_reg_user_mr()
> 2788     							 SZ_4K | SZ_2M |
> SZ_1G,
> 2789     							 virt);
> 2790     	iwmr->len = region->length;
> 2791     	iwpbl->user_base = virt;
> 2792     	palloc = &iwpbl->pble_alloc;
> 2793     	iwmr->type = req.reg_type;
> vvv     CID 1505149:  Integer handling issues  (DIVIDE_BY_ZERO)
> vvv     In function call "ib_umem_num_dma_blocks", division by expression "iwmr-
> >page_size" which may be zero has undefined behavior.
> 2794     	iwmr->page_cnt = ib_umem_num_dma_blocks(region, iwmr-
> >page_size);
> 2795
> 2796     	switch (req.reg_type) {
> 2797     	case IRDMA_MEMREG_TYPE_QP:
> 2798     		use_pbles = ((req.sq_pages + req.rq_pages) > 2);
> 2799     		err = irdma_handle_q_mem(iwdev, &req, iwpbl,
> use_pbles);
> 
> If this is a false positive, please let us know so we can mark it as such, or teach
> the Coverity rules to be smarter. If not, please make sure fixes get into linux-next.
> :) For patches fixing this, please include these lines (but double-check the "Fixes"
> first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1505149 ("Integer handling issues")
> Fixes: b48c24c2d710 ("RDMA/irdma: Implement device supported verb APIs")
> 
> Thanks for your attention!
> 

This appears to be a bug. We will send a fix.

Shiraz
