Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDD32A826D
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 16:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730721AbgKEPmr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 10:42:47 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:47765 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730660AbgKEPmr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Nov 2020 10:42:47 -0500
Received: from HKMAIL102.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa41d750001>; Thu, 05 Nov 2020 23:42:45 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Nov
 2020 15:42:45 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 5 Nov 2020 15:42:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gw66FIsvBsdqkhlUQJ31z/Zb3HlsbtV0sD2NBElZjqMJvDyLX+d6BdcwOjwHtM9vY9DIuPpotmpICadpQ2cwtbjPOYxQAzOhm05IFwHNqUgv0IovP6LXYQGTcfqBaG8alxsvdNAlEL6XZ6S1KwY89rxxWo6CoJFhruCBTEmQJ+vuykuFWsyAIZ9OOK/BXKVTdtUEym07Ih/6XV+cdl0kuE+5g2+ImGdUi/MIzQxvW6yiWtIDGHMC1oinpJekqW0S666woFNgV9HVsaOkrWB+SRt7kc+tA9xY3BH9hCviCwwH5TIkc8a+mRW2lUZ5/5ngSs50FNZeLgJNSi4sZirMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyQxcI9U4VSYvGOFt7PFjFA5hpcYXzBo013IFYhWNgk=;
 b=W691iisHIw9fvh5vT96DaYelNyvXnDIctfh7l7yHTz30IuJazkmaNHxPvh1atNQHPYQ5TDbFpRFeFnhYqqyiBRDopqIRST9FTDNsAVNOAYSNOFRY+IF8Nw3h8Zn9QjH/t29FSidaqua6n6wn/spIpQrmrQMS+5WtlQ9aDANcm4oFIeiP1BeTZvnQ8alMKvLlatxozlrDjBZl3sRVRCqEDCqcut9zJFdw+BcLw8WkmEJ1PLd0Y/B+gKMaQ98kj07z/aOH1rrpvAxMU/Mzv9D8Dj5jrVhoA6Q03N395yw6joSOsDFX3mfKX/kXaxaSaTPPMNzFWTf7kXt2Y8d8JKDyLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4513.namprd12.prod.outlook.com (2603:10b6:5:2ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 5 Nov
 2020 15:42:43 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 15:42:43 +0000
Date:   Thu, 5 Nov 2020 11:42:42 -0400
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Doug Ledford <dledford@redhat.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Maor Gottlieb <maorg@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rdma-fixes tree
Message-ID: <20201105154242.GI2620339@nvidia.com>
References: <20201105085458.5addbe44@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201105085458.5addbe44@canb.auug.org.au>
X-ClientProxiedBy: MN2PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:208:120::30) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by MN2PR10CA0017.namprd10.prod.outlook.com (2603:10b6:208:120::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 15:42:43 +0000
Received: from jgg by mlx with local (Exim 4.94)        (envelope-from <jgg@nvidia.com>)        id 1kahPO-00HR6k-6d; Thu, 05 Nov 2020 11:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604590965; bh=UyQxcI9U4VSYvGOFt7PFjFA5hpcYXzBo013IFYhWNgk=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
         From:To:CC:Subject:Message-ID:References:Content-Type:
         Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
         X-MS-Exchange-MessageSentRepresentingType;
        b=i2ZyW/5Tqufu2uRtAstj1lxC3xRbqqwrEFyD9QGqGFkGxtvz2wtkJ7JPHsQutYKSL
         AnTMQtqr6Zm0t8Cduo5segKaVhYFkVByAJAMugKaUO5dzXNFvyVSV7P4HwFCst8vXu
         0HzfgXcLNvMz6zEFzTSuS+P+poGNGzP0FIu1/lkKI32oXDJYY3UEhI2nvVo/OBlu7+
         jfD7Zu3LcG8ZxL0Xgv3o/fCBgumnZ/d6h6Nl7+HAbm8FosyhnDoGQZhVnc9hqsaY5N
         ZsObV8AJ24aAujERycH9lhBsQViUMRcbQbAA1gh63lF+PVQqfgdTIj0Zae8TwQ9gob
         R9MXgU6Y3PQvQ==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 05, 2020 at 08:54:58AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rdma-fixes tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> drivers/infiniband/ulp/srpt/ib_srpt.c:630: warning: Function parameter or member 'port_cnt' not described in 'srpt_unregister_mad_agent'
> 
> Introduced by commit
> 
>   372a1786283e ("IB/srpt: Fix memory leak in srpt_add_one")

I patched it, thanks

Jason

From 21fcdeec09ff461b2f9a9ef4fcc3a136249e58a1 Mon Sep 17 00:00:00 2001
From: Jason Gunthorpe <jgg@nvidia.com>
Date: Thu, 5 Nov 2020 11:38:29 -0400
Subject: [PATCH] RDMA/srpt: Fix typo in srpt_unregister_mad_agent docstring

htmldocs fails with:

drivers/infiniband/ulp/srpt/ib_srpt.c:630: warning: Function parameter or member 'port_cnt' not described in 'srpt_unregister_mad_agent'

Fixes: 372a1786283e ("IB/srpt: Fix memory leak in srpt_add_one")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/infiniband/ulp/srpt/ib_srpt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index 1b096305de1a45..53a8becac82761 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -622,7 +622,7 @@ static int srpt_refresh_port(struct srpt_port *sport)
 /**
  * srpt_unregister_mad_agent - unregister MAD callback functions
  * @sdev: SRPT HCA pointer.
- * #port_cnt: number of ports with registered MAD
+ * @port_cnt: number of ports with registered MAD
  *
  * Note: It is safe to call this function more than once for the same device.
  */
-- 
2.28.0

 


