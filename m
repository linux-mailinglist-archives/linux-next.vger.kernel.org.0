Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60102D29F2
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 12:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgLHLtl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 06:49:41 -0500
Received: from mga06.intel.com ([134.134.136.31]:5209 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725803AbgLHLtl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Dec 2020 06:49:41 -0500
IronPort-SDR: uS9jtQB7A+2vxALhk799l2dRyzyCyhgZwM1XCdjszVPqO3KUdZP2QuIzSHez+y4osDa1IEsl4/
 lz5TUqlZngfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="235474374"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="235474374"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 03:48:05 -0800
IronPort-SDR: +mYAsGNwLPzSACc9S8+36/64d/OoImY/y1/fHBX6dA6McsnXEeAXnCQkDcHxOw34xTe6V8DnCD
 34BlhhgZ3X4Q==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="363605727"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 03:48:02 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 08 Dec 2020 13:47:59 +0200
Date:   Tue, 8 Dec 2020 13:47:59 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: linux-next: manual merge of the drm tree with the pci tree
Message-ID: <20201208114759.GA5246@lahna.fi.intel.com>
References: <20201208132632.7c3a6a41@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208132632.7c3a6a41@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Tue, Dec 08, 2020 at 01:27:54PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the drm tree got a conflict in:
> 
>   drivers/gpu/vga/vga_switcheroo.c
> 
> between commit:
> 
>   99efde6c9bb7 ("PCI/PM: Rename pci_wakeup_bus() to pci_resume_bus()")
> 
> from the pci tree and commit:
> 
>   9572e6693cd7 ("vga_switcheroo: simplify the return expression of vga_switcheroo_runtime_resume")
> 
> from the drm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the fix Stephen! Looks correct to me.
