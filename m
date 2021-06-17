Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACC13AB5AD
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 16:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbhFQOUa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Thu, 17 Jun 2021 10:20:30 -0400
Received: from mga02.intel.com ([134.134.136.20]:60770 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231720AbhFQOUa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Jun 2021 10:20:30 -0400
IronPort-SDR: boj8i74ad3AarNCsUpaiD25PRFPjS843s5movjC3/NZo8AsfoY8GndHfLAcbFAC6gvw74+BZbC
 nzl+x2KiiQaw==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="193505927"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="193505927"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 07:18:20 -0700
IronPort-SDR: vYKMT80zThQkD+J5/HpCQyxiNyHdu4WjKPtj2mhw0uk29nRet35fkEYYDr+/V0HtLmeS7b2Amp
 UjWkyOi266OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="488666603"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2021 07:18:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 17 Jun 2021 07:18:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 17 Jun 2021 07:18:19 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2242.008;
 Thu, 17 Jun 2021 07:18:19 -0700
From:   "Saleem, Shiraz" <shiraz.saleem@intel.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
CC:     coverity-bot <keescook@chromium.org>,
        "Ismail, Mustafa" <mustafa.ismail@intel.com>,
        "Nikolova, Tatyana E" <tatyana.e.nikolova@intel.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>
Subject: RE: Coverity: irdma_fill_device_info(): Null pointer dereferences
Thread-Topic: Coverity: irdma_fill_device_info(): Null pointer dereferences
Thread-Index: AQHXXI+P0o9izdR5wky89Oo/hCw2tasKtiDAgAsFpICAASUWIA==
Date:   Thu, 17 Jun 2021 14:18:19 +0000
Message-ID: <7c693feb84ce452ab2a7ad8f77720194@intel.com>
References: <202106081056.E270F59@keescook>
 <6bdaf0a1b0e74782b63afba1ecbdd348@intel.com>
 <20210615160159.GV1002214@nvidia.com>
In-Reply-To: <20210615160159.GV1002214@nvidia.com>
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

> Subject: Re: Coverity: irdma_fill_device_info(): Null pointer dereferences
> 
> On Tue, Jun 15, 2021 at 03:58:52PM +0000, Saleem, Shiraz wrote:
> > > Subject: Coverity: irdma_fill_device_info(): Null pointer
> > > dereferences
> > >
> > > Hello!
> > >
> > > This is an experimental semi-automated report about issues detected
> > > by Coverity from a scan of next-20210608 as part of the linux-next scan
> project:
> > > https://scan.coverity.com/projects/linux-next-weekly-scan
> > >
> > > You're getting this email because you were associated with the
> > > identified lines of code (noted below) that were touched by commits:
> > >
> > >   Wed Jun 2 19:55:16 2021 -0300
> > >     8498a30e1b94 ("RDMA/irdma: Register auxiliary driver and
> > > implement private channel OPs")
> > >
> > > Coverity reported the following:
> > >
> > > *** CID 1505164:  Null pointer dereferences  (NULL_RETURNS)
> > > /drivers/infiniband/hw/irdma/main.c: 230 in irdma_fill_device_info()
> > > 224     	rf->gen_ops.register_qset = irdma_lan_register_qset;
> > > 225     	rf->gen_ops.unregister_qset = irdma_lan_unregister_qset;
> > > 226     	rf->hw.hw_addr = pf->hw.hw_addr;
> > > 227     	rf->pcidev = pf->pdev;
> > > 228     	rf->msix_count =  pf->num_rdma_msix;
> > > 229     	rf->msix_entries = &pf->msix_entries[pf->rdma_base_vector];
> > > vvv     CID 1505164:  Null pointer dereferences  (NULL_RETURNS)
> > > vvv     Dereferencing "vsi", which is known to be "NULL".
> >
> > This is a false +ve IMO.
> 
> It is because of this:
> 
> static inline struct ice_vsi *ice_get_main_vsi(struct ice_pf *pf) {
>         if (pf->vsi)
>                 return pf->vsi[0];
> 
>         return NULL;
> }
> 
> If the above can't return null it should be rewritten

It does appear on review that the pf->vsi can really never be NULL for paths that call ice_get_main_vsi.
We are running some tests to confirm there is no fallout. And if so, we can just return pf->vsi[0]
as a fix.

Shiraz

