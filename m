Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 909582D7600
	for <lists+linux-next@lfdr.de>; Fri, 11 Dec 2020 13:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405492AbgLKMsh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Dec 2020 07:48:37 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2003 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405906AbgLKMsJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Dec 2020 07:48:09 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fd36a600004>; Fri, 11 Dec 2020 04:47:28 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Dec
 2020 12:47:28 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 11 Dec 2020 12:47:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajjlhPC2dYJtzy8+dn81WytJrgl6Rb8sdoPpqXZ2jxsN/8Zf1Pl+d727B9L+kraojLymBRVKv1xkgtVxUHmYYl5fDZjXCZziNJateh0k8IhKLYkjXcl1Pr2jzrBGa/zhyV5O7rYMzXkRn/jkie350CnFgJ5wYB38zND5FLl48rkq/qkm/RqYuEz4TM7BcMCmqWYd7CY7Fplu55N6Lotwu23BgPLIQ0nUmLKiFte3rbMQoIxcWa3yq1zZU1E/rOdyVM1r9K0Yut4qQr8YM06B2JfdZvzGCogk+QKGSHdIYX59dnmKXLixaOcKwE6wJ/ZGGhML6iLPXbGcqBzxfUEl/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3Pc2+gxrqDcz1bXwXDCnkbOeGEz9hf2MsDqKcLqN3c=;
 b=jSAoKLJ6J6FKrzUwRRHCLJQA1KGiP5gDGOzBHvo2zT6SdqBSJWNZWMLtOWz0xem91gXNL/0YM9DhSsPzYsFmf9udmDoSBTFDhtR8kosyOYyc3AtGw/hLUDawHBttRCbKcyPvN2gYbVYw1HQ/8YXUjUeevPkcLnbYKQf9EbVb+s/ekgLt/gxjdRel75JjsOJ8yR0+jM4BCIztGnY6VkjxQATjzw2eMTi9kF00GYkcV2yTinW2M/WPgdqGfyhN00d6kkLjH75G6UKJ6GgZY1gFVLFDkMc/IN0E0ztNOVpwEoVWl2L4I3t8ypVVU3HCKvzi2CbFifztvctK/I5zel+IWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3737.namprd12.prod.outlook.com (2603:10b6:5:1c5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 11 Dec
 2020 12:47:27 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1ce9:3434:90fe:3433]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1ce9:3434:90fe:3433%3]) with mapi id 15.20.3654.018; Fri, 11 Dec 2020
 12:47:27 +0000
Date:   Fri, 11 Dec 2020 08:47:25 -0400
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Message-ID: <20201211124725.GD552508@nvidia.com>
References: <20201211195654.6b414f90@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201211195654.6b414f90@canb.auug.org.au>
X-ClientProxiedBy: BL1PR13CA0079.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::24) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by BL1PR13CA0079.namprd13.prod.outlook.com (2603:10b6:208:2b8::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend Transport; Fri, 11 Dec 2020 12:47:26 +0000
Received: from jgg by mlx with local (Exim 4.94)        (envelope-from <jgg@nvidia.com>)        id 1knhpV-009CG6-9i; Fri, 11 Dec 2020 08:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607690848; bh=K3Pc2+gxrqDcz1bXwXDCnkbOeGEz9hf2MsDqKcLqN3c=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
         From:To:CC:Subject:Message-ID:References:Content-Type:
         Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
         X-MS-Exchange-MessageSentRepresentingType;
        b=qv+fA6yK3+ZRVLGVX+s78OOKoli/mvLkptoTsP71IUZTc4R/Ce2ymqf4p08lnjJjj
         FyJBv/N/XSOi1fzwqCWA4l9K8HdpAdWv/IIfDdfhThOMJoWwxROD49M+Amlp7+3+/v
         oHSYmUgpW/sKJE2sYwrc/fXswx0ERp3NDV5w34l8WmCPdJlDSkYQvwvCy/Wm5of4vG
         10LIGC03WUjr0gLBO4yF5MuTRCKp6Nhy+ciUpEb8MoXcPdFh4GTNuVtJIMbwMxCV76
         vaqEu2DIT+vBVMVA60w5whTvyeiuCjzYDUF8bR7niLoREspRKu2/Swrl1eUsSiwKnH
         VxQEv+SmsfB8g==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Dec 11, 2020 at 07:56:54PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   mm/gup.c
> 
> between commit:
> 
>   2a4a06da8a4b ("mm/gup: Provide gup_get_pte() more generic")
> 
> from the tip tree and commit:
> 
>   1eb2fe862a51 ("mm/gup: combine put_compound_head() and unpin_user_page()")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks OK

Thanks,
Jason
 


