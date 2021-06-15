Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B26AC3A85DC
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 18:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbhFOQCM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 15 Jun 2021 12:02:12 -0400
Received: from mga01.intel.com ([192.55.52.88]:42966 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231807AbhFOQB5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 12:01:57 -0400
IronPort-SDR: 76Nz9Nv+I9FTwSgfeRjdd3cV5JiiVBwSWbocPq0u7EQROMecRUSYTEgZ8D3SGuad+JO4DyHTA4
 IovT0a60NUjQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="227493067"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="227493067"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2021 08:58:58 -0700
IronPort-SDR: umxTBsbICMUtwYuO5GckyaleN38pvh7Sblh53VkKIj8FHSk6pRo2uXyUK5XBCP+MA/mYHdnn/A
 nWGJLUaYFp6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="553729484"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP; 15 Jun 2021 08:58:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 08:58:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 08:58:57 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2242.008;
 Tue, 15 Jun 2021 08:58:57 -0700
From:   "Saleem, Shiraz" <shiraz.saleem@intel.com>
To:     coverity-bot <keescook@chromium.org>,
        "Ismail, Mustafa" <mustafa.ismail@intel.com>,
        "Nikolova, Tatyana E" <tatyana.e.nikolova@intel.com>
CC:     Jason Gunthorpe <jgg@nvidia.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: RE: Coverity: irdma_prm_get_pbles(): Integer handling issues
Thread-Topic: Coverity: irdma_prm_get_pbles(): Integer handling issues
Thread-Index: AQHXXJBcUmSD/tAsIkaRJI77D73XVasVPNtA
Date:   Tue, 15 Jun 2021 15:58:57 +0000
Message-ID: <be18ddbbac97471ca9e7b5f80e8a9cd9@intel.com>
References: <202106081101.0D7C450C@keescook>
In-Reply-To: <202106081101.0D7C450C@keescook>
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

> Subject: Coverity: irdma_prm_get_pbles(): Integer handling issues
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
>   Wed Jun 2 19:55:19 2021 -0300
>     915cc7ac0f8e ("RDMA/irdma: Add miscellaneous utility definitions")
> 
> Coverity reported the following:
> 
> *** CID 1505157:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> /drivers/infiniband/hw/irdma/utils.c: 2329 in irdma_prm_get_pbles()
> 2323     	struct list_head *chunk_entry = pprm->clist.next;
> 2324     	u32 offset;
> 2325     	unsigned long flags;
> 2326     	*vaddr = 0;
> 2327     	*fpm_addr = 0;
> 2328
> vvv     CID 1505157:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> vvv     Potentially overflowing expression "1 << pprm->pble_shift" with type "int"
> (32 bits, signed) is evaluated using 32-bit arithmetic, and then used in a context
> that expects an expression of type "u64" (64 bits, unsigned).
> 2329     	bits_needed = (mem_size + (1 << pprm->pble_shift) - 1) >> pprm-
> >pble_shift;
> 2330
> 2331     	spin_lock_irqsave(&pprm->prm_lock, flags);
> 2332     	while (chunk_entry != &pprm->clist) {
> 2333     		pchunk = (struct irdma_chunk *)chunk_entry;
> 2334     		bit_idx = bitmap_find_next_zero_area(pchunk->bitmapbuf,
> 
> If this is a false positive, please let us know so we can mark it as such, or teach
> the Coverity rules to be smarter. If not, please make sure fixes get into linux-next.
> :) For patches fixing this, please include these lines (but double-check the "Fixes"
> first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1505157 ("Integer handling issues")
> Fixes: 915cc7ac0f8e ("RDMA/irdma: Add miscellaneous utility definitions")
> 
> Thanks for your attention!


This appears to be a bug. We will send a fix.

Shiraz
