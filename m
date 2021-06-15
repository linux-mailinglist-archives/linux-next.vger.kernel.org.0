Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3483D3A85E0
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 18:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbhFOQCh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 15 Jun 2021 12:02:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:16368 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232187AbhFOQCU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 12:02:20 -0400
IronPort-SDR: gSV/RYgd3qPo8D64omXy4SHZZLh74LtGluSdN8MD1j3AzbAFSAoi9SnXlvL/BU4A4SMXmhifIV
 RJr9a63bPVZg==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="267167787"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="267167787"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2021 08:59:02 -0700
IronPort-SDR: rZgX+X0ZpOj8QcudJB5fW4TE+SoK6Hqghzz2P0aZqQhv1MrZZazKLxEgqoz5svnxmC7wZHs/32
 /9d6I1pj8ejQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="553729500"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga004.jf.intel.com with ESMTP; 15 Jun 2021 08:59:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 08:59:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 08:59:01 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2242.008;
 Tue, 15 Jun 2021 08:59:01 -0700
From:   "Saleem, Shiraz" <shiraz.saleem@intel.com>
To:     coverity-bot <keescook@chromium.org>,
        "Ismail, Mustafa" <mustafa.ismail@intel.com>,
        "Nikolova, Tatyana E" <tatyana.e.nikolova@intel.com>
CC:     Jason Gunthorpe <jgg@nvidia.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: RE: Coverity: irdma_reg_user_mr(): TAINTED_SCALAR
Thread-Topic: Coverity: irdma_reg_user_mr(): TAINTED_SCALAR
Thread-Index: AQHXXJAz/wEfuDqCVk6cZTYQDIt91KsVPHDg
Date:   Tue, 15 Jun 2021 15:59:00 +0000
Message-ID: <5a929effe400411eb1c6c84397480356@intel.com>
References: <202106081059.A515282@keescook>
In-Reply-To: <202106081059.A515282@keescook>
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

> Subject: Coverity: irdma_reg_user_mr(): TAINTED_SCALAR
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
> (Editor's note: I believe the issues below are basically summarized as "the contents
> of req came from userspace and did not get validated before being used for
> things like array indexing, etc")
> 
> Coverity reported the following:
> 
> *** CID 1505160:    (TAINTED_SCALAR)
> /drivers/infiniband/hw/irdma/verbs.c: 2812 in irdma_reg_user_mr()
> 2806     		list_add_tail(&iwpbl->list, &ucontext->qp_reg_mem_list);
> 2807     		iwpbl->on_list = true;
> 2808     		spin_unlock_irqrestore(&ucontext->qp_reg_mem_list_lock,
> flags);
> 2809     		break;
> 2810     	case IRDMA_MEMREG_TYPE_CQ:
> 2811     		use_pbles = (req.cq_pages > 1);
> vvv     CID 1505160:    (TAINTED_SCALAR)
> vvv     Passing tainted variable "req.rq_pages" to a tainted sink.
> 2812     		err = irdma_handle_q_mem(iwdev, &req, iwpbl,
> use_pbles);
> 2813     		if (err)
> 2814     			goto error;
> 2815
> 2816     		ucontext = rdma_udata_to_drv_context(udata, struct
> irdma_ucontext,
> 2817     						     ibucontext);
> /drivers/infiniband/hw/irdma/verbs.c: 2799 in irdma_reg_user_mr()
> 2793     	iwmr->type = req.reg_type;
> 2794     	iwmr->page_cnt = ib_umem_num_dma_blocks(region, iwmr-
> >page_size);
> 2795
> 2796     	switch (req.reg_type) {
> 2797     	case IRDMA_MEMREG_TYPE_QP:
> 2798     		use_pbles = ((req.sq_pages + req.rq_pages) > 2);
> vvv     CID 1505160:    (TAINTED_SCALAR)
> vvv     Passing tainted variable "req.cq_pages" to a tainted sink.
> 2799     		err = irdma_handle_q_mem(iwdev, &req, iwpbl,
> use_pbles);
> 2800     		if (err)
> 2801     			goto error;
> 2802
> 2803     		ucontext = rdma_udata_to_drv_context(udata, struct
> irdma_ucontext,
> 2804     						     ibucontext);
> /drivers/infiniband/hw/irdma/verbs.c: 2799 in irdma_reg_user_mr()
> 2793     	iwmr->type = req.reg_type;
> 2794     	iwmr->page_cnt = ib_umem_num_dma_blocks(region, iwmr-
> >page_size);
> 2795
> 2796     	switch (req.reg_type) {
> 2797     	case IRDMA_MEMREG_TYPE_QP:
> 2798     		use_pbles = ((req.sq_pages + req.rq_pages) > 2);
> vvv     CID 1505160:    (TAINTED_SCALAR)
> vvv     Passing tainted variable "req.sq_pages" to a tainted sink.
> 2799     		err = irdma_handle_q_mem(iwdev, &req, iwpbl,
> use_pbles);
> 2800     		if (err)
> 2801     			goto error;
> 2802
> 2803     		ucontext = rdma_udata_to_drv_context(udata, struct
> irdma_ucontext,
> 2804     						     ibucontext);
> /drivers/infiniband/hw/irdma/verbs.c: 2799 in irdma_reg_user_mr()
> 2793     	iwmr->type = req.reg_type;
> 2794     	iwmr->page_cnt = ib_umem_num_dma_blocks(region, iwmr-
> >page_size);
> 2795
> 2796     	switch (req.reg_type) {
> 2797     	case IRDMA_MEMREG_TYPE_QP:
> 2798     		use_pbles = ((req.sq_pages + req.rq_pages) > 2);
> vvv     CID 1505160:    (TAINTED_SCALAR)
> vvv     Passing tainted variable "req.rq_pages" to a tainted sink.
> 2799     		err = irdma_handle_q_mem(iwdev, &req, iwpbl,
> use_pbles);
> 2800     		if (err)
> 2801     			goto error;
> 2802
> 2803     		ucontext = rdma_udata_to_drv_context(udata, struct
> irdma_ucontext,
> 2804     						     ibucontext);
> /drivers/infiniband/hw/irdma/verbs.c: 2812 in irdma_reg_user_mr()
> 2806     		list_add_tail(&iwpbl->list, &ucontext->qp_reg_mem_list);
> 2807     		iwpbl->on_list = true;
> 2808     		spin_unlock_irqrestore(&ucontext->qp_reg_mem_list_lock,
> flags);
> 2809     		break;
> 2810     	case IRDMA_MEMREG_TYPE_CQ:
> 2811     		use_pbles = (req.cq_pages > 1);
> vvv     CID 1505160:    (TAINTED_SCALAR)
> vvv     Passing tainted variable "req.sq_pages" to a tainted sink.
> 2812     		err = irdma_handle_q_mem(iwdev, &req, iwpbl,
> use_pbles);
> 2813     		if (err)
> 2814     			goto error;
> 2815
> 2816     		ucontext = rdma_udata_to_drv_context(udata, struct
> irdma_ucontext,
> 2817     						     ibucontext);
> 
> If this is a false positive, please let us know so we can mark it as such, or teach
> the Coverity rules to be smarter. If not, please make sure fixes get into linux-next.
> :) For patches fixing this, please include these lines (but double-check the "Fixes"
> first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1505160 ("TAINTED_SCALAR")
> Fixes: b48c24c2d710 ("RDMA/irdma: Implement device supported verb APIs")
> 
> Thanks for your attention!
> 

This appears to be a bug. We will send a fix.

Shiraz
