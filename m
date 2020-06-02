Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14F6E1EC264
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 21:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgFBTJ5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 15:09:57 -0400
Received: from mail-vi1eur05on2044.outbound.protection.outlook.com ([40.107.21.44]:32534
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726589AbgFBTJ5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jun 2020 15:09:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgymGUxT3g5QteheTxveWY7RlQt7rkq2l71kq5PtrBMTqxHwEyQ5u2dMPL7AXyYlB+Y2ozPcUPCIR7Ju1QWFp6o5MHmAAc6Rue/PuC/IAhT1DN+jBa0ylnG+MmM2yk2AUwk0vpNrfwyL8YJltstVaJXTqRjeCBhWSsRxPPAOmUYw2Qs5XnO1XVzz+JYSHJFulUJb4CU9wS8ExtC/qv3jbo5NQx75PLeGrTVWXkqW1dVHOEVR87IoPmNedatHHVUyjEqDJVSP+QFMbdyRroq5mi15nHnW/B/BdRmXSNkb4rzi36HKFvYNV+rKQ94QO5p5Ja3/8uvoQyodDGc9TZiGbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SzEnlG4144aI5xIPHukyAt4KwOBxTzMnWfoibg6JK4=;
 b=nwSAhpXwjUKGQQ+eounyEe65VTUyUerXb3sMhCwyIYFtXO+61NYjQltoXZisC2BMeHO9sTgykCAft6bQ9JifQHmXsoy6tOKHpLyzjzzykwKre0dODe4BFgmytiCqjRExv9EhmHBENfY+/WXwWU1RPdB7jcJNE4a3JDwAWnmt/XmljgV54b16UK1J8VPpvbT/GLnT+pM182gmUnGp6yBeOJegv9+TopAgWtAqftB6p+3Mv9ogbajR7sfkx7AtMdhHf3xArPFWAhDIrg9Xoa9NbINAiftumWgpozBlEvJC5JK/mwTeXiwFiLCTnbFjAa62GfoXpbOle6QTHVRIIwgVdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SzEnlG4144aI5xIPHukyAt4KwOBxTzMnWfoibg6JK4=;
 b=QoNl73SHVfAIHhFlR2dmwPAs+WGcl7DnPqj99/XnlwYxtVluPrglr6l1mSgMAiBZ+V5XYgf0QpW9w/Zpsgq2tKruFybf+xstMP17/RAl/Nog/qNA/g+0QYRuuTWANoxW62gMoCY0I9x3PGMXET4ERegLiQecpeGq33B7Nds5G2Q=
Authentication-Results: kernel.dk; dkim=none (message not signed)
 header.d=none;kernel.dk; dmarc=none action=none header.from=mellanox.com;
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (2603:10a6:803:44::15)
 by VI1PR05MB5342.eurprd05.prod.outlook.com (2603:10a6:803:a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 19:09:52 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e%7]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 19:09:52 +0000
Date:   Tue, 2 Jun 2020 16:09:45 -0300
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Max Gurtovoy <maxg@mellanox.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Doug Ledford <dledford@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yamin Friedman <yaminf@mellanox.com>,
        Israel Rukshin <israelr@mellanox.com>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the block tree with the rdma tree
Message-ID: <20200602190945.GC65026@mellanox.com>
References: <20200602125647.5f5ed151@canb.auug.org.au>
 <3717aca8-9d75-33f1-ea8c-044af767ab5c@mellanox.com>
 <20200602190153.GA65026@mellanox.com>
 <8be03d71-9c72-bf88-7fd7-76ec7700474a@kernel.dk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8be03d71-9c72-bf88-7fd7-76ec7700474a@kernel.dk>
X-ClientProxiedBy: MN2PR22CA0023.namprd22.prod.outlook.com
 (2603:10b6:208:238::28) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (193.47.165.251) by MN2PR22CA0023.namprd22.prod.outlook.com (2603:10b6:208:238::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 19:09:52 +0000
Received: from jgg by mlx with local (Exim 4.93)        (envelope-from <jgg@mellanox.com>)      id 1jgCID-000Ijs-5d; Tue, 02 Jun 2020 16:09:45 -0300
X-Originating-IP: [193.47.165.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 82130f32-e303-4e5b-2687-08d807288778
X-MS-TrafficTypeDiagnostic: VI1PR05MB5342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB53428928F64DEA1B92D82A95CF8B0@VI1PR05MB5342.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3dcOWnO1Gc+5ITRwHe8rRDe4mWfLUA00Qu/+UdAfwPz46AqKUrfCexrItNo//QXG14fxoGpdz9Nfuypzo2Q6E2WEVMneydKaVrcK8loQJhu3HaLWeVmmutOpY3vkzXb3xi22CEDJNGVRmv4VTburc5tbwmTY0cox/W2UrE2CLPxzVqyptCrZqhsjQzN+lPJzdlQCXZuVmN1ZIVh2Fhw1PycmLJRbTfnSKcAKAn5AEhom12LbO113x8qFk8xJgPHMr9NIq+zREipiQc/6b/rQ/rogJgoTo6yd1xu+EXO8Ck1hKxZKm0VDipQHf3mHn0qF1qtn0DEjLFg2r2Z7TXJXZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB4141.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(366004)(376002)(39850400004)(136003)(2616005)(53546011)(8676002)(26005)(8936002)(54906003)(36756003)(83380400001)(316002)(6916009)(426003)(2906002)(66476007)(4326008)(66946007)(66556008)(86362001)(186003)(5660300002)(9746002)(9786002)(1076003)(478600001)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: zoG61zCeCgf9WkUxUkivkY2Z7ktjNhEoRPlpLe41OuCIn2Yn7fRRhb3ux2ilmsePZ1k5izhgxSBk6kgSesWEjUdftPEej7MhTJ5zRCpScafGtRGhHO5X/QqkPYC96qa4pGPuTr32SZpWWkzi9WpEN3ftAkLfsr+atRc4eOXHljkeYLTzmaytXe6x9KizBeKmjW0iB8VYTQRF192MUL2vWRQpGng1+8Gch0M5v4bfGntynMQ9QEqwsYOBDccHv8P12BW+kc37udxTUeJKpGmv15EKb3Jyyi8DzXzGYv6NHrRUPAbwcN6zMyntY1EYKAKB5UoelEqcdWsjobj7D+IqV9TMn1VPud0DGbk9ceN921S9kutUN/hDpZcDrJ9z/ZIEc3iROzhkU89Wac9M8UhvOL+KlmaaLWRb3HG360cEdu4asTXv5xKkkSrbNqjG0xpNkeXn10uT3V4gEl5/aZFiv77mRrk5Q9kXB2s4mI6KN2OqISqItjAk0aenIiEvlVZ8
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82130f32-e303-4e5b-2687-08d807288778
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 19:09:52.7199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zpw3RfS4JlBZjTvzHz1Tuz7xakxu1MvDvObQL34OOqXRfjExsD3LbflTJjbn62k9Da000G9DTNoPOjugKPOd0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5342
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 02, 2020 at 01:02:55PM -0600, Jens Axboe wrote:
> On 6/2/20 1:01 PM, Jason Gunthorpe wrote:
> > On Tue, Jun 02, 2020 at 11:37:26AM +0300, Max Gurtovoy wrote:
> >>
> >> On 6/2/2020 5:56 AM, Stephen Rothwell wrote:
> >>> Hi all,
> >>
> >> Hi,
> >>
> >> This looks good to me.
> >>
> >> Can you share a pointer to the tree so we'll test it in our labs ?
> >>
> >> need to re-test:
> >>
> >> 1. srq per core
> >>
> >> 2. srq per core + T10-PI
> >>
> >> And both will run with shared CQ.
> > 
> > Max, this is too much conflict to send to Linus between your own
> > patches. I am going to drop the nvme part of this from RDMA.
> > 
> > Normally I don't like applying partial series, but due to this tree
> > split, you can send the rebased nvme part through the nvme/block tree
> > at rc1 in two weeks..
> 
> Was going to comment that this is probably how it should have been
> done to begin with. If we have multiple conflicts like that between
> two trees, someone is doing something wrong...

Well, on the other hand having people add APIs in one tree and then
(promised) consumers in another tree later on has proven problematic
in the past. It is best to try to avoid that, but in this case I don't
think Max will have any delay to get the API consumer into nvme in two
weeks.

Jason
