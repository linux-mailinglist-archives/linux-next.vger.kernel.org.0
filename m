Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC9001891C7
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 00:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgCQXI5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 19:08:57 -0400
Received: from mail-eopbgr70072.outbound.protection.outlook.com ([40.107.7.72]:7335
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726564AbgCQXI5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 19:08:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHHLOxgTZ9osNtl13qHdM5Z9KckCIUmyZRIo7RfDJwkiJ7bfaQQ7LKoo4ctz+XrfOoBVY3LCNDT/SlQuPtfQ46DM5mkZbveWP8ecwqu8tiOfGdwwdCvIqGg4PpWWb/JkJmMhh7iP+8s8upskm3YSAuB3zVEpHCQMAHXX5ro/MuW4BjOJaxAMdS2/fy+fdbDdtQm/NuqRKjDPXtt6R+7WCKRCBLRy70n7qUlpNnE+QFBQEwyPOVlePxjgzplvexinUuXCKegsfoNYxdJrrdWJkTkm62Gh0lLXIhilB/dbhl7UXxZkU+UXJzCpUoz5uMUhEVIxIX4ryOuCvdvZTSroIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kIQOG/Nvz7fSiNMeqDevp9eAESKDUfoimHXRWkvmTE=;
 b=Up5mu2MCFEBJ57dAvBohlCc5Kybe7DuQjzHenjnOztmVkZC6/61on8lmT384K8/4DRbMwCseMzFbMwRhfofSHpX/0OE1S4O7kWyFknDimUwGot4dQHsJXqRkG5UITOqkmnzcPbGVA6neNX+xPdpCPhoGZQCnGLKI+1wNUyHRahzrtRi9s4TSwYUYwv5dHS7UMNCxDM7VQ5e+T1vtvj+sosy98p3FSGH0BWxiuZwEfoa0Mi0BYzZQ/W5XK6g2aVQv8CMCB06lLdGfbjMSRfPlbTkIPz8uuoEZWR4TK0Y6KzRwe7aJ1nqbwJppiUv2e2ndiZity2WhkoJdkckYfuaJkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kIQOG/Nvz7fSiNMeqDevp9eAESKDUfoimHXRWkvmTE=;
 b=Of7bWqEY0/oQim1ykK0IJpxAhvWpVwhTNqIOkjCOqszL2XycAOswMwgWuR6TEOw+FhocLyE5EyPGOg+/1Ljy47XFefOvedMpTnoev1tf39Qzf2y54yZ4IAYnphH0rWdCmuY0zBd6kkl28Vu33gUDDaToDp4wJ2yErttMwwrNB9U=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6286.eurprd05.prod.outlook.com (20.179.24.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.19; Tue, 17 Mar 2020 23:08:50 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 23:08:50 +0000
Date:   Tue, 17 Mar 2020 20:08:47 -0300
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: Fixes tag needs some work in the hmm tree
Message-ID: <20200317230847.GB13183@mellanox.com>
References: <20200318075033.4d06b1be@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318075033.4d06b1be@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR19CA0015.namprd19.prod.outlook.com
 (2603:10b6:208:178::28) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by MN2PR19CA0015.namprd19.prod.outlook.com (2603:10b6:208:178::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.19 via Frontend Transport; Tue, 17 Mar 2020 23:08:50 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)     (envelope-from <jgg@mellanox.com>)      id 1jELKJ-0007sv-6j; Tue, 17 Mar 2020 20:08:47 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 122d8ce8-f9fb-47ce-fe87-08d7cac8279a
X-MS-TrafficTypeDiagnostic: VI1PR05MB6286:
X-Microsoft-Antispam-PRVS: <VI1PR05MB62868A124DA4D3EDFDA3268BCFF60@VI1PR05MB6286.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-Forefront-PRVS: 0345CFD558
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(199004)(478600001)(2616005)(6916009)(86362001)(36756003)(1076003)(8676002)(81166006)(186003)(4744005)(81156014)(2906002)(33656002)(26005)(66946007)(66556008)(8936002)(54906003)(5660300002)(52116002)(9786002)(9746002)(4326008)(316002)(66476007)(24400500001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB6286;H:VI1PR05MB4141.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nT0aGwSPrHfJ62QgFPm3Yd3MeFDdE+gRcsIaqDaTaD+Ntuprne7qUERVGsOd1f0+cM7pIEw/kQGnYTG8ON5oH6QL3HmwwIzOfFKY8e7qh+GFZfc/9hGgwgWh40bQpoyjOrWuVCZbFSqhzOMpapICbvgFMLmqWnL+76GReBo43gCSQ5TSrfF4eLRQDiKcRlM4gfW5V8uqC3i30vIJS1m5zK0gssf4AiGwsaHDjIijWcFN9KFBHHSCjg1WL5m7Dh0NGlgnQkYoJWgrBmoIzHGKkBE7FHaFyn6QOeXAyFbqN82q1uqV3+4Dajacu9k978EULg+zNcZJkzmqGKyyPwuo9SkmXVY5n4GUIoCBXqnrovf6f+MPIIBAU8pGD3RUIoUgotSV4ewNSUv3IlfZi5ewlNLnAziQbsQx/tVjNbsiFHhXPBynk8rQnuO+T6Rj25ZsXfqhJ4e6nxf0xWhVxdjO2IRNfkjbrgzBHcJZYSPhDQERHvvi2NVSrY6JGHpcZugU
X-MS-Exchange-AntiSpam-MessageData: p00qTaYFJuhwn1XcaziPu/2+FR+zh/5YhINEGfqf+uuXqNHUlt+wGwBKlaK+G5sp8XT+ZjkdD0GYz7Y3BN+HYKy5KYSPTrY3pKpBj0x/ru+CHeQ0KGlTAXXmvNPIpsHYxy3iAyYt6KKYxP7bmKVSfw==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122d8ce8-f9fb-47ce-fe87-08d7cac8279a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 23:08:50.4932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MCR9yjUe9NooJUOXGD3T79RaeQDUH8erMz4UnEruvgMl5UY2KyJERKqhp+L8UIC9UBI8svuKNyKdHNAw9YpCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6286
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 18, 2020 at 07:50:33AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   ee37d9e6e474 ("mm/hmm: don't handle the non-fault case in hmm_vma_walk_hole_()")
> 
> Fixes tag
> 
>   Fixes: 2aee09d ("mm/hmm: change hmm_vma_fault() to allow write fault on page basis")

Fixed, and really confused how it happened :\

Thanks,
Jason
