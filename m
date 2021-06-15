Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037493A85DF
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 18:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhFOQCd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 15 Jun 2021 12:02:33 -0400
Received: from mga18.intel.com ([134.134.136.126]:33358 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232164AbhFOQCL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 12:02:11 -0400
IronPort-SDR: X00aGTsw8Rolndz/j/QyJ0M1oJIDN2tAA55dPp0Nb04jyxdAeBr4c0WcM6P6q3wnzS1BjFgl4I
 P+vZemq765nA==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="193328799"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="193328799"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2021 08:58:53 -0700
IronPort-SDR: bzLY3yR0qNlyDOFgDncrG33Us21k0yNi1l6aR7ZWQkQoXnCQeBsUxnt9PgZGo3D23V7AYm5ug0
 v0qFdgVus97w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="553729464"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga004.jf.intel.com with ESMTP; 15 Jun 2021 08:58:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 08:58:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 08:58:52 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2242.008;
 Tue, 15 Jun 2021 08:58:52 -0700
From:   "Saleem, Shiraz" <shiraz.saleem@intel.com>
To:     coverity-bot <keescook@chromium.org>,
        "Ismail, Mustafa" <mustafa.ismail@intel.com>,
        "Nikolova, Tatyana E" <tatyana.e.nikolova@intel.com>
CC:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jason Gunthorpe <jgg@nvidia.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: RE: Coverity: irdma_fill_device_info(): Null pointer dereferences
Thread-Topic: Coverity: irdma_fill_device_info(): Null pointer dereferences
Thread-Index: AQHXXI+P0o9izdR5wky89Oo/hCw2tasKtiDA
Date:   Tue, 15 Jun 2021 15:58:52 +0000
Message-ID: <6bdaf0a1b0e74782b63afba1ecbdd348@intel.com>
References: <202106081056.E270F59@keescook>
In-Reply-To: <202106081056.E270F59@keescook>
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

> Subject: Coverity: irdma_fill_device_info(): Null pointer dereferences
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
>   Wed Jun 2 19:55:16 2021 -0300
>     8498a30e1b94 ("RDMA/irdma: Register auxiliary driver and implement private
> channel OPs")
> 
> Coverity reported the following:
> 
> *** CID 1505164:  Null pointer dereferences  (NULL_RETURNS)
> /drivers/infiniband/hw/irdma/main.c: 230 in irdma_fill_device_info()
> 224     	rf->gen_ops.register_qset = irdma_lan_register_qset;
> 225     	rf->gen_ops.unregister_qset = irdma_lan_unregister_qset;
> 226     	rf->hw.hw_addr = pf->hw.hw_addr;
> 227     	rf->pcidev = pf->pdev;
> 228     	rf->msix_count =  pf->num_rdma_msix;
> 229     	rf->msix_entries = &pf->msix_entries[pf->rdma_base_vector];
> vvv     CID 1505164:  Null pointer dereferences  (NULL_RETURNS)
> vvv     Dereferencing "vsi", which is known to be "NULL".

This is a false +ve IMO.

This vsi object is obtained from the PCI driver's [ice] PF object.
And this pf->vsi is setup in ice_probe and always valid by the time this function
is called from irdma_probe. 

> 230     	rf->default_vsi.vsi_idx = vsi->vsi_num;
> 231     	rf->protocol_used = IRDMA_ROCE_PROTOCOL_ONLY;
> 232     	rf->rdma_ver = IRDMA_GEN_2;
> 233     	rf->rsrc_profile = IRDMA_HMC_PROFILE_DEFAULT;
> 234     	rf->rst_to = IRDMA_RST_TIMEOUT_HZ;
> 235     	rf->gen_ops.request_reset = irdma_request_reset;
> 
> If this is a false positive, please let us know so we can mark it as such, or teach
> the Coverity rules to be smarter. If not, please make sure fixes get into linux-next.
> :) For patches fixing this, please include these lines (but double-check the "Fixes"
> first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1505164 ("Null pointer dereferences")
> Fixes: 8498a30e1b94 ("RDMA/irdma: Register auxiliary driver and implement
> private channel OPs")
> 
> Thanks for your attention!
> 
> --
> Coverity-bot
