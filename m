Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47AC21EC24D
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 21:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgFBTCH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 15:02:07 -0400
Received: from mail-db8eur05on2058.outbound.protection.outlook.com ([40.107.20.58]:56364
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726174AbgFBTCG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jun 2020 15:02:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbZaDvmliqGBHqawHcZ3Jv0E8cjHFnJU78/L2cmN5V47oE/ZW9QU2zfxwuI3DdCS/bPUlcX9kKiH036yd9Lm7J4piuHgMnA53pM9P10Oqbg+8REBA/oYPfAjFoFEp7IowvWjmeVbI4GUiU72xuD1RVZJ+Mos2S+KbLYCN2Pttx8mpOFqqKFnvi81ZhFp9PSLwS8Cy5scgL8KD2cMgB0GBRqDbeRAjAxwqmURa8ndv2UqMrSwgnNQ97RMmDKDahjblBzEv5NvU51lQ3EacjxL9uUuKbA/9NySeY52DZLkmx4eGloLwOXEjIY9O7MWQTyao78wEXOj8BP3oDw46QyKOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRcTWKhCLqqylKmWRjkzlCvMDvg/FrMAsfCIBxVLy2c=;
 b=QX+aNqZxDkwp4JRsPbO4zTVkEzJLfvkHZyuupqTa/0zvgi8aT65T+psDg/3SgtXvWbHFGbLF/sw/+7u9gVMBV3A5Pp9qKommXZNrKhE9HCzcall/4gvv8wnj9ZEg4SRQt59Qa1OsTtp05eev+LVaKM2/qeZSny6wSvGqvWuQep2nU+t10mFshVw0g6zFXBXRw/HTN40wRAGeJvIlnM/xZtjZbYMgkse0qmaSBAkV8tnub1Mg8FGv33lBBMfAlbvG5iMTqXN59WEEXiMAiScjZv3+jFUjO+TYIMfEBsaAnrFDe+1JFLpXBst0XCQ20xWnWLF5phNRJG+YwbiizUPdlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRcTWKhCLqqylKmWRjkzlCvMDvg/FrMAsfCIBxVLy2c=;
 b=fN2WpU4QelH1GTjSdR6Kk4pbv98c4YNl7SZtpzmfD4s3FW8AJDx7gakzSPqHKg1MfgUNKI7QkreQYIS1CVSoUnY8lkLIoMH2dAKF5F1MQgGTyk3i+J4a0dVhyMGNuMggjyyLyuMCWu78hXH2L+jEnG86llgl0fMbBtuvU8HlOcU=
Authentication-Results: mellanox.com; dkim=none (message not signed)
 header.d=none;mellanox.com; dmarc=none action=none header.from=mellanox.com;
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (2603:10a6:803:44::15)
 by VI1PR05MB3486.eurprd05.prod.outlook.com (2603:10a6:802:1b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Tue, 2 Jun
 2020 19:02:02 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e%7]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 19:02:02 +0000
Date:   Tue, 2 Jun 2020 16:01:53 -0300
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Max Gurtovoy <maxg@mellanox.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>,
        Doug Ledford <dledford@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yamin Friedman <yaminf@mellanox.com>,
        Israel Rukshin <israelr@mellanox.com>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the block tree with the rdma tree
Message-ID: <20200602190153.GA65026@mellanox.com>
References: <20200602125647.5f5ed151@canb.auug.org.au>
 <3717aca8-9d75-33f1-ea8c-044af767ab5c@mellanox.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3717aca8-9d75-33f1-ea8c-044af767ab5c@mellanox.com>
X-ClientProxiedBy: MN2PR19CA0057.namprd19.prod.outlook.com
 (2603:10b6:208:19b::34) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (193.47.165.251) by MN2PR19CA0057.namprd19.prod.outlook.com (2603:10b6:208:19b::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Tue, 2 Jun 2020 19:02:01 +0000
Received: from jgg by mlx with local (Exim 4.93)        (envelope-from <jgg@mellanox.com>)      id 1jgCAb-000Id2-Pn; Tue, 02 Jun 2020 16:01:53 -0300
X-Originating-IP: [193.47.165.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2b3ba0d0-27d6-4006-75d2-08d807276ed9
X-MS-TrafficTypeDiagnostic: VI1PR05MB3486:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB34862B6011F4ACF6081F7C0BCF8B0@VI1PR05MB3486.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hKN13yEXe4+0thdNRYPbVFK3xtHXvSrdKOo0LT82KehY28UJ9Wcc7KMT5ZZ7Lbd2U0FrCz9z3Graorq1mbxrPKqw+pk8chjEmGRZKM5s6WzVjbV7d08cDPfzp0Tr6fAL53Ih8/lMMEnuXVUR5REsDEujXoEIZyD43OPFIV8L7aNtn9vhFPZhjs9iZ0BtNqJlQBEKhqg6cmmzBVlyynn/TYiUtTI02PY8YlScPiYJBTmhrdsgjTU94U0vJbrjBQ9akGaheKQdlw7lBYOJE1g4b1EMIyIMdJdE+4hupVnMIeBZJEDjfgG95HXP2Ni+iuDyj4sg5VTYZK8GGsNPhd7VMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB4141.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(39850400004)(346002)(366004)(136003)(54906003)(2906002)(6862004)(6636002)(37006003)(9786002)(66476007)(9746002)(4326008)(66946007)(8936002)(316002)(4744005)(26005)(36756003)(66556008)(426003)(1076003)(186003)(86362001)(53546011)(5660300002)(478600001)(33656002)(83380400001)(8676002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: bHpGoHL8zAwY3E6+jzLxooQV90Ffpqd51ynx1Hj7/f64zswKX/9EdUYL1swOe0Tih+c+DWvoc0KhPWj5WWotuGWnRcXGFy6VhOudw6UBxqckioHLkNI2Rahws7bEWawrD0ef68m6/c+ITL/3iA76e5te0WcSk5etB69QNtoNkX5U1Y2QLUV6HR/nPZTq06WWdL6wEKRKs2awNblFtkiiH9exvj7YiCB8SxQ2S4OOPQlvNZkHwib8+ULQprrSjoaQjKs17tnjwwvpmUKg3cq8eV4UXi3ny6Q1yCmpCRY6/Jg9AccQic1mpHYXnhAz/ktF5hdJET5ItAI6FJ8dyPMObHnSgftbzk10atbQcGU/T1Ntx95Akl2SqVhdpeZo1RZvPg9cd/47QJJtn/RPTM5fpiZ4I6VOFMmZRVCX6oxmhCHaIABWTFpzY8mdkn3Mei1kh0b5O4t4puCNQdU1c6lapo1SzR8VB4Hw5WrelyDR0ZyxJQMpZFizdq7scnJdZrW4
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3ba0d0-27d6-4006-75d2-08d807276ed9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 19:02:02.0287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCiYHc4RCZWdjIwVzmkln/pHYKb9yyz16LEhmCiIuCM3t/l+lte5U1kdPFY2OX+t+qdW2wTsxHS2lgbP2jtugA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3486
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 02, 2020 at 11:37:26AM +0300, Max Gurtovoy wrote:
> 
> On 6/2/2020 5:56 AM, Stephen Rothwell wrote:
> > Hi all,
> 
> Hi,
> 
> This looks good to me.
> 
> Can you share a pointer to the tree so we'll test it in our labs ?
> 
> need to re-test:
> 
> 1. srq per core
> 
> 2. srq per core + T10-PI
> 
> And both will run with shared CQ.

Max, this is too much conflict to send to Linus between your own
patches. I am going to drop the nvme part of this from RDMA.

Normally I don't like applying partial series, but due to this tree
split, you can send the rebased nvme part through the nvme/block tree
at rc1 in two weeks..

Jason
