Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1DEA19B8C3
	for <lists+linux-next@lfdr.de>; Thu,  2 Apr 2020 01:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733245AbgDAXAj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 19:00:39 -0400
Received: from mail-db8eur05on2049.outbound.protection.outlook.com ([40.107.20.49]:6221
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732537AbgDAXAi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Apr 2020 19:00:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkTYiUhwB6lNhtVH7o3ozyubc4JYxK0ygcUPumtVBWQFJXBqvDbRPyT36LPg98FHnNEiLzj/5cGhFjors/d9w1TxsejAadi6INokAGxcmvUud7tZgrk/VUNZxdkvMlD8Z1vi4EUwriwXslSNqSKTARm9itDXzkZNUUpeg0y401p38O9GryDn5GNs40RptYDXs3QDmaw2IfeiRskDOv23tV5/wMtYyPc6bD3FzOKpPxEIci7NGLBULMW6mEuzYgVc3d66Uie78nJkllwGHlZwsp6cmZ6r/fKotgtdjdWqZRwyMoaAAL1nHX+eX0ai75UAefzidbtxjys3Wg/aOUkoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESnh3VahpoRgOVcSgO2oM/SlAfrlL7ed912gJCbCoMs=;
 b=nFx6oZQzV2sAV5r9ymLo9Kql7gS2781QJ4wAXq8n+wIoJ1EKd0ec1Pm+2791iyeGS7GnKVi3FJKMm4gfrUpSVIYL7RiZahD/qEGtoPUk0ilxA4H4sNRPQsTc4nuueTOS2C813ANA15/O+nxObnldYeZgjVCZsS7rkOmZDYgfuhAFF4Ib7K6yn3G3dStEgZXwhXMmE8mTtxX9A+6kNgVncQMzNxyWXbjwHHB2tMN/S8FZPLbGb7tHqtpT36QL2gasoOqNa7GJg9y4F1VhrmRlv5J7ew/k8lx+08/dCbeVjijrjrJ2kMxZkpWodrejkhacGIGXwMDEWPtlTFsHunRJTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESnh3VahpoRgOVcSgO2oM/SlAfrlL7ed912gJCbCoMs=;
 b=CZbYLlvv24WbCajiofjYUp1RTut/3cNQ3S0zkfGEZScnePcxjVLMailCGK3Eww6wxiuvbJKESTUTD7wYZtyjhImWWTB3YJflBCN+Wal0qKW0ebtokoaVVOEIfeb1VBZyNNWeDTUTc6mz/vJMFnlY9I7f3rlQhJBoAuSVczCUqu4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6845.eurprd05.prod.outlook.com (10.186.163.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Wed, 1 Apr 2020 23:00:35 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2878.014; Wed, 1 Apr 2020
 23:00:29 +0000
Date:   Wed, 1 Apr 2020 20:00:24 -0300
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Longpeng <longpeng2@huawei.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Matthew Wilcox <willy@infradead.org>,
        Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200401230024.GY8514@mellanox.com>
References: <20200331195612.64c06485@canb.auug.org.au>
 <20200401155831.24aa79ebbb14c654a2bee8c0@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401155831.24aa79ebbb14c654a2bee8c0@linux-foundation.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:208:236::20) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by MN2PR05CA0051.namprd05.prod.outlook.com (2603:10b6:208:236::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.5 via Frontend Transport; Wed, 1 Apr 2020 23:00:28 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)     (envelope-from <jgg@mellanox.com>)      id 1jJmLQ-0003kU-N9; Wed, 01 Apr 2020 20:00:24 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 782fed45-2782-4d65-3288-08d7d69078cf
X-MS-TrafficTypeDiagnostic: VI1PR05MB6845:
X-Microsoft-Antispam-PRVS: <VI1PR05MB68458ADD37D7AD08CEE60465CFC90@VI1PR05MB6845.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:107;
X-Forefront-PRVS: 03607C04F0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB4141.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(2616005)(66946007)(9786002)(66476007)(2906002)(66556008)(5660300002)(33656002)(26005)(186003)(9746002)(316002)(8936002)(54906003)(81156014)(81166006)(36756003)(1076003)(8676002)(86362001)(6916009)(52116002)(4326008)(478600001)(24400500001);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JmpbYDYcBCiMkZIs2rqt3yibfKjYGVSqdODGx9iNnhY3LpCHIT0XzsEKnsH0+AEtTcbgi3X1m6TCOd0KwE39DGr2Hxc048pYEnR52/Tzz0xJKiLvAxr1QRq4epZcpqkY1ZHXHPzbJzbiSesY18Wk7dhFoWCwiPY0Yqft5CQhQFCz5wHIlnVsxiSSqr8xtQbbgNERIFsNLKNO2fj/JP7UEz8jDzUBCHKP0RAiIxJmP3b7NjXe9oJaJyfKt4PSwPZeZI2kxty8bIjDAMZ43RjHNt8F5oZccK+vnF2YMhlqzRQLoz/CdhZheIN+R7u1zF+dqrt9j5j8VJG0LydVsV1AQBY4lq8edK3oasF774x7jQMX0/5i1ycndyT6/nYO2y1rUwufXKdKS1ptysYRKGQNUH9daZGqkbl1crvifpG4GRPRx199CIM23+/IS+dnbgiPAwz5d2UgyB8GfU/ArU2qV4rEqv99CR3tSufQ1Auqqf+DHmDbWWO/Ljxc4W9yOTW/
X-MS-Exchange-AntiSpam-MessageData: yk3e688ht29iUKtczYCYpOVj605rZLaxffFszuEdCIoRfshzyYuJezwfT9RhjmPzzHZP/80aQ2FLPXmSDza+MFFphgEvU2Ut3/5GOKoNbrvnUa/f0NYJ8GTWxKQobqjsw//SJfiHkymgzrw4bEQ5Ow==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 782fed45-2782-4d65-3288-08d7d69078cf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 23:00:29.1251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nf3TFOmMaaIMMMa4XdayT/D2fqqPzARzps8R6yZkJK2ZmZOXUmpAETyuGa9bb7nt0e1773B52EWMGKY7gPfQKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6845
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 01, 2020 at 03:58:31PM -0700, Andrew Morton wrote:
> On Tue, 31 Mar 2020 19:56:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > After merging the akpm-current tree, today's linux-next build (i386
> > defconfig) produced this warning:
> > 
> > mm/hugetlb.c: In function 'huge_pte_offset':
> > cc1: warning: function may return address of local variable [-Wreturn-local-addr]
> > mm/hugetlb.c:5361:14: note: declared here
> >  5361 |  pud_t *pud, pud_entry;
> >       |              ^~~~~~~~~
> > cc1: warning: function may return address of local variable [-Wreturn-local-addr]
> > mm/hugetlb.c:5360:14: note: declared here
> >  5360 |  p4d_t *p4d, p4d_entry;
> >       |              ^~~~~~~~~
> > 
> > Introduced by commit
> > 
> >   826ddc88e2cf ("mm/hugetlb: fix a addressing exception caused by huge_pte_offset")
> 
> I can reproduce this (i386 defconfig, gcc-7.2.0).
> 
> I can see no way in which this makes any sense.  Hopefully it's a gcc
> bug but it's hard to see how it could have messed up this fairly simple
> code.

It is a code bug, there was a little thread about this. It happens
because the address of a stack variable is passed into the pXX_offset
functions which return that address when the page levels are folded.

I recommend to drop this patch until it is adjusted..

Jason
