Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D8F1EC5C1
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 01:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgFBXcV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 19:32:21 -0400
Received: from mail-eopbgr60081.outbound.protection.outlook.com ([40.107.6.81]:58878
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726223AbgFBXcV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jun 2020 19:32:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjESByxC5CYlYF6+gl60KcPziXbfyDJpoc5x4uH7ChYZww8lrJM7MLAGeeY6M06Cjdeu5rL8kE6naKgBDPw/SU5V2DYlbszjVHmzVf3TT2KLLNTOSxHfW/A8MrjKl5oeameFVv3nSNtxnj+GDyL8jAaR4ZA4rJdFju/933VKJFtwy5z7/08IhlgHAgRJDmjfPetIYLe50ibYz2qw0FONRlRJPNSM+eCgaT9JTtM29tcincxf2nmSHdjlBLmgsHGBYzIxIFAuwbk6e5Xe8hsm5xYkp5gcrzQbnCMUQqeWd9ySCTyxsmuHxEcH+NplwbVHM3q2fnKUf9CumV/e2NvGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skFgLhjGYSqU/PfJcc/KVL/ffwiV5zlthTlvtyirmNg=;
 b=fRS0Q7hb2pw5rNqdPVW3wgs6qeUr8tgk4wo2wUj3+b5LkNlJF1h2pboSP2YMLcNKldsUYn35SjpXzvHs/Y5fXNRZO7o0tRkGBUD/LwVmG4qFDLIs99I/jecPH4+arJkNCFXIJhyIr+eJKetem8Jyh3tvc33XrzbJ78yVE0ZgxHmYaT8lLEvcxl/tiKb2io8f3biW1Wbvnv+VqoLclS8SX/OLj0vTO5ATKBQyHiSiaKfdSV1F+KpwcLytbZ7jUjmLWWubSBqSGyU0r7zHjJBuuApfiFUkomXdqybehfTlXdF9YHqcpydLwLpmKI3bMHKnOf4tVXg39eX8zZYrfezSNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skFgLhjGYSqU/PfJcc/KVL/ffwiV5zlthTlvtyirmNg=;
 b=GC6MNw/XkYxTU2Z67w0j/1LkfuOTCsE0LdHeY/nEmBhNSdi2yaX+Ur7/DCMNcfISwGPrLgBKdNZwwFDJvwAPHOvIMJI+tPadZQIEppOhHll5lrhMJx8JbRevjOIlb/q5bBJW7cPR2fuydH8R3sGUjPcbfwgkLUmRGU46dne/f5o=
Authentication-Results: mellanox.com; dkim=none (message not signed)
 header.d=none;mellanox.com; dmarc=none action=none header.from=mellanox.com;
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (2603:10a6:803:44::15)
 by VI1PR05MB5759.eurprd05.prod.outlook.com (2603:10a6:803:cc::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Tue, 2 Jun
 2020 23:32:18 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e%7]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 23:32:18 +0000
Date:   Tue, 2 Jun 2020 20:32:01 -0300
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Max Gurtovoy <maxg@mellanox.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Doug Ledford <dledford@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yamin Friedman <yaminf@mellanox.com>,
        Israel Rukshin <israelr@mellanox.com>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the block tree with the rdma tree
Message-ID: <20200602233201.GE65026@mellanox.com>
References: <20200602125647.5f5ed151@canb.auug.org.au>
 <3717aca8-9d75-33f1-ea8c-044af767ab5c@mellanox.com>
 <20200602190153.GA65026@mellanox.com>
 <8be03d71-9c72-bf88-7fd7-76ec7700474a@kernel.dk>
 <20200602190945.GC65026@mellanox.com>
 <b8ad79a0-57cc-e823-6b99-47d59ce5dc7d@kernel.dk>
 <b3b08c2f-b22f-1e8a-ba0f-d50f2db1abd3@mellanox.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3b08c2f-b22f-1e8a-ba0f-d50f2db1abd3@mellanox.com>
X-ClientProxiedBy: BL0PR01CA0032.prod.exchangelabs.com (2603:10b6:208:71::45)
 To VI1PR05MB4141.eurprd05.prod.outlook.com (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (193.47.165.251) by BL0PR01CA0032.prod.exchangelabs.com (2603:10b6:208:71::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Tue, 2 Jun 2020 23:32:17 +0000
Received: from jgg by mlx with local (Exim 4.93)        (envelope-from <jgg@mellanox.com>)      id 1jgGO1-000Msq-ES; Tue, 02 Jun 2020 20:32:01 -0300
X-Originating-IP: [193.47.165.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4383a56d-de15-4705-662b-08d8074d304e
X-MS-TrafficTypeDiagnostic: VI1PR05MB5759:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB57597B7786B0CC664B78206CCF8B0@VI1PR05MB5759.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ONjocoDpFcliLzkrvwmOjJp2kULD0DQkjokqTwCxQMmbc7HB0n0FfJ1EZ+QnnTHxKeewa0NOw5TEYTj5KPPX9YFF2CPwVhW9jhuZ5l2CGWe+eDuTo4rEOk4R4sWevzGCJyJwXdayFpk4rHqNFkegQ8C41dzJeupPQkFOEaU19kHOVOOcClxKMXjbF/OBZAWzOjrPWB8CaqNX8Fa6b6x/40ZiRVRyetTascApi7rK8u3ARtu6tvr1EcQTzkKOIXZkYlcTEXx7bzhrH8VOJcJRYDAA2627pDkGmh3gu2HpElhzgCsPPsd/5yG2H1vbAWneuqA0b0eVGsOD3JGtDeoYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB4141.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(366004)(39850400004)(396003)(8936002)(1076003)(36756003)(5660300002)(9786002)(66946007)(66476007)(66556008)(33656002)(2906002)(37006003)(316002)(426003)(9746002)(2616005)(54906003)(53546011)(478600001)(83380400001)(86362001)(6636002)(186003)(8676002)(6862004)(26005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: D2QfnC3ulKI5aDDnpGvL0zZYJ7WmI+ER8hPJtpTdSfKjE+CN7iTHKVqubMtqFF1g5y1huqYmooPGxHpnh3aGhG9A9y4LkONIHBgSdJNNB8EqR4OLfL8O+QNvTmyX5X2ZJx12M6mJAuU2wxaFjM9wvWsKvI5wILNnfQADe4UWXvYrB2wTilm/0BZYiRuc+dPoiNgsuPMOIEfM9SljjjUgUmTqsvSYrB4vnCoPbhAYxqnK6FlajnFHWPAzBXuYEX0SV2aAfLhgdrUsYMpgLLukvBJQcDd2QriSDSu+3JXy1tB+DgvDJsDBaQ31SMx1VXaeBQRFZiuNnkQNTkONfXzCDrwEOSy3fwn3iG0PDvFAdVdn8XeX0KXyFKlzSB9ukLIveT5ZGJBk/dZAEWzp9QXLfr7l6ajwdLx/9sW9hsqyAKqN7VxI0ePc3nIk7LpAb+Zw1i+6zVkItnN9Iu872+qFS1aUW5X7Q0LFLLXzJzWDGq3u+il+VaSOh0BTdnSeVHwC
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4383a56d-de15-4705-662b-08d8074d304e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 23:32:17.9134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwhiTyigp4AYS7wBgWfkn+B+CqDyIG/RYFyFE0EGHKi/9C9KkZ4S7zDzQlgnnFzazUoKY7gD3GMa+2xOcLwtQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5759
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 03, 2020 at 01:40:51AM +0300, Max Gurtovoy wrote:
> 
> On 6/3/2020 12:37 AM, Jens Axboe wrote:
> > On 6/2/20 1:09 PM, Jason Gunthorpe wrote:
> > > On Tue, Jun 02, 2020 at 01:02:55PM -0600, Jens Axboe wrote:
> > > > On 6/2/20 1:01 PM, Jason Gunthorpe wrote:
> > > > > On Tue, Jun 02, 2020 at 11:37:26AM +0300, Max Gurtovoy wrote:
> > > > > > On 6/2/2020 5:56 AM, Stephen Rothwell wrote:
> > > > > > > Hi all,
> > > > > > Hi,
> > > > > > 
> > > > > > This looks good to me.
> > > > > > 
> > > > > > Can you share a pointer to the tree so we'll test it in our labs ?
> > > > > > 
> > > > > > need to re-test:
> > > > > > 
> > > > > > 1. srq per core
> > > > > > 
> > > > > > 2. srq per core + T10-PI
> > > > > > 
> > > > > > And both will run with shared CQ.
> > > > > Max, this is too much conflict to send to Linus between your own
> > > > > patches. I am going to drop the nvme part of this from RDMA.
> > > > > 
> > > > > Normally I don't like applying partial series, but due to this tree
> > > > > split, you can send the rebased nvme part through the nvme/block tree
> > > > > at rc1 in two weeks..
> 
> Yes, I'll send it in 2 weeks.
> 
> Actually I hoped the iSER patches for CQ pool will be sent in this series
> but eventually they were not.
> 
> This way we could have taken only the iser part and the new API.
> 
> I saw the pulled version too late since I wasn't CCed to it and it was
> already merged before I had a chance to warn you about possible conflict.
> 
> I think in general we should try to add new RDMA APIs first with iSER/SRP
> and avoid conflicting trees.

If you are careful we can construct a shared branch and if Jens/etc is
willing he can pull the RDMA base code after RDMA merges the branch
and then apply the nvme parts. This is how things work with netdev

It is tricky and you have to plan for it during your submission step,
but we should be able to manage in most cases if this comes up more
often.

Jason
