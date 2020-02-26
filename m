Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B009170605
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 18:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgBZRZd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Feb 2020 12:25:33 -0500
Received: from mail-eopbgr80045.outbound.protection.outlook.com ([40.107.8.45]:3047
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726695AbgBZRZd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Feb 2020 12:25:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXPu0SvHwlJIlD43A9U4ovACWPxripq3otY+ps9ZlAel2PZpq/IqLeD+e56cwUfQco7FJKES/OpvWiUVwZOpBm78qsiJQ0/O8jpn5r1+dezxHJlCfCoswslVl1zAKkGcFmWRuLwV9K4C6PV6JE6XH0QHKqWGowWPhiGG6YdaBWqMuF2phid3AqdDlGBCRb/o5h9eqXUdtsCTRWrjBAURV8HVm5BdTb4qtUxAfGJ33BHtGYi1eGpqXnY8JzPpGFAPqkr/2RoNLqHPSEgELQAGkJcgTBEAY/eY24DVtDmfu6aVkiWb5fiTaFxJ5gp7oR/tsIAQAKD+6QJeU3naWzDcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nINrzYt5axeuYB4ToGYDVzkBeXj6USkow1njw6kT7ww=;
 b=UWcRsjXXcvVmsSlam6iHouS/6q/NfAOOg/JHHtilFUdgcSi/qknnob3alfw5Z6NNBwfjQ9n2VZBWqiEv/F6Jjlhn9GsIYbvTZg2Q7qwq8MGQfqWzbimUlRokHNFZzGyfUM+OcyVLFNl1WI2iwjrmFgRndYJpYPmIPahXRtbn8q+/ODF2BBavvNLo2bqyfRrEdHfkaral45DFc/aFl5iExjOUYWrsc690kAWM6H6QLZE5mAuIO7XCPu40nhs3b5FUKd/kLZ17Qsn8dpfC+snnG7EA3xGFNQQR8+NqknTNjkNpJgSAdsNLwtlz6qIj+J4HHjsbNzuHbHirD/FiSzS8DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nINrzYt5axeuYB4ToGYDVzkBeXj6USkow1njw6kT7ww=;
 b=msHn3fsnUOLzES9Qhsx0MZLuoIcmFv3bkidnRYi6ili/R1BMCOYIK9TF/lfoeX2VrCcUMCx58jmLetiOAkfevG4FXEcl12xJHCMQJM3zKE/AODnTVNEA3CpzzUE8Qw03mJAASC7SiljZMvFrtCS0BVH0QIiICODYBfAZaI2hTEk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.22; Wed, 26 Feb 2020 17:25:30 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 17:25:29 +0000
Date:   Wed, 26 Feb 2020 13:25:25 -0400
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Doug Ledford <dledford@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Devesh Sharma <devesh.sharma@broadcom.com>,
        Naresh Kumar PBS <nareshkumar.pbs@broadcom.com>,
        Selvin Xavier <selvin.xavier@broadcom.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
Message-ID: <20200226172525.GU26318@mellanox.com>
References: <20200226135127.31667f48@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226135127.31667f48@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:208:239::21) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by MN2PR08CA0016.namprd08.prod.outlook.com (2603:10b6:208:239::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend Transport; Wed, 26 Feb 2020 17:25:28 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)     (envelope-from <jgg@mellanox.com>)      id 1j70R3-0004b5-7y; Wed, 26 Feb 2020 13:25:25 -0400
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 325bc450-bc72-4e0f-a3f3-08d7bae0df94
X-MS-TrafficTypeDiagnostic: VI1PR05MB4141:
X-Microsoft-Antispam-PRVS: <VI1PR05MB41414E25B23EB46FCC565DA6CFEA0@VI1PR05MB4141.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-Forefront-PRVS: 0325F6C77B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(5660300002)(478600001)(54906003)(6916009)(4326008)(316002)(1076003)(86362001)(33656002)(8676002)(2616005)(81156014)(26005)(186003)(53546011)(36756003)(66946007)(2906002)(66476007)(66556008)(81166006)(9786002)(9746002)(8936002)(52116002)(24400500001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4141;H:VI1PR05MB4141.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CHgGXXpSKIi96pL/cM2lNaV+AJlgP245oZur1o/YTq8xDlZeOCLBd73e+6F7uaDkGvgoBLk3tYxmhh5fAAq2RKnODL1qBCEzqcHSVaVKapziNzmW5o0BF4Yl9aV6mEsyspgV7xxf+m46E6LBFJ0FnIPIwR2ZfmwYdnf6iw4wbafg0a6yO/ERG4xiK4ZxFkWZrGr6HetfdD17NaNhAEyRZ6ybxWEbZmxSXzTat8md3g1o9zAO4KDd97Xbp512Kuo3wrKjbXytgBVKbiIFJHB3h2OpXq+q4T5UTeZPchn19/RtuZ9rnAZ57CKgeziMdb4NJYO49YFuqk5A1gtHnonFrEeQkipmyuEdsIpuemJvQlLM7tzJpoOGRBCkLrJTqhOokfTtGC0ZVjIKkbMVrfTh8+V2NlGJxdZ89xoPZL32TlayVJ6B/SQYgZSg7idtRBbiys2I7FfWtAi1iSCM7ycwd1C0GNiJC+jpnlOL0i6e6RCucL46EDJN8i6NEDYKcfQv
X-MS-Exchange-AntiSpam-MessageData: OHDRzD0qR3dWHFafYvXxea76jGVT1iImgUlIuyihCjigcELtjZG75Ykia+ugu29pwDQ3R0vBKYYiZG3ja2zeZe3FL7Y/nhBaDWnwYRIvYkbFUrkNmBtDXP3YZoqcjaiyacxU1naWfqxkGCJEgpOETQ==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 325bc450-bc72-4e0f-a3f3-08d7bae0df94
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 17:25:29.6647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zP6CKOrPwRfYn6tmRqDhEU2Gvj9AxTPm6L6G3ZoEDXf9/WvwsYmQnBYeY1K5PInKyXHZOAPl1lYbw+xH+Ca9Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4141
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 26, 2020 at 01:51:27PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rdma tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/infiniband/hw/bnxt_re/qplib_res.c: In function '__free_pbl':
> drivers/infiniband/hw/bnxt_re/qplib_res.c:78:2: error: implicit declaration of function 'vfree'; did you mean 'kfree'? [-Werror=implicit-function-declaration]
>    78 |  vfree(pbl->pg_arr);
>       |  ^~~~~
>       |  kfree
> drivers/infiniband/hw/bnxt_re/qplib_res.c: In function '__alloc_pbl':
> drivers/infiniband/hw/bnxt_re/qplib_res.c:117:16: error: implicit declaration of function 'vmalloc'; did you mean 'kmalloc'? [-Werror=implicit-function-declaration]
>   117 |  pbl->pg_arr = vmalloc(pages * sizeof(void *));
>       |                ^~~~~~~
>       |                kmalloc
> drivers/infiniband/hw/bnxt_re/qplib_res.c:117:14: warning: assignment to 'void **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   117 |  pbl->pg_arr = vmalloc(pages * sizeof(void *));
>       |              ^
> drivers/infiniband/hw/bnxt_re/qplib_res.c:121:18: warning: assignment to 'dma_addr_t *' {aka 'long long unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   121 |  pbl->pg_map_arr = vmalloc(pages * sizeof(dma_addr_t));
>       |                  ^
> 
> Caused by commit
> 
>   0c4dcd602817 ("RDMA/bnxt_re: Refactor hardware queue memory allocation")
> 
> I added the following fix for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 26 Feb 2020 13:46:02 +1100
> Subject: [PATCH] RDMA/bnxt_re: using vmalloc requires including vmalloc.h
> 
> Fixes: 0c4dcd602817 ("RDMA/bnxt_re: Refactor hardware queue memory allocation")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>  drivers/infiniband/hw/bnxt_re/qplib_res.c | 1 +
>  1 file changed, 1 insertion(+)

Okay applied, thanks

Jason
