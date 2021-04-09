Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A6A35A3E9
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 18:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234232AbhDIQqR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 12:46:17 -0400
Received: from mail-eopbgr690040.outbound.protection.outlook.com ([40.107.69.40]:29871
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233977AbhDIQqR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Apr 2021 12:46:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbfoDkPooWfXU0Z1jyNyMR2XUM8L7m6kJOWy7Wm3ctdsxBwr5ZZjJIbUnAVitEZqkNEvQVw8lrg2vYEklic8e/Qn1VEb6mLLhj+2EqScmfiNyCeQiXicNmavMAYuUsP8h8uh22ntkns1bie4K8ybun3FKvgcmsxZ4iSrKhlugze9016yY2rJMtlU9cAkP1T55IB6uAJgF1DgR4baHgdUfVIMmdoPJWI4hgH/ddtf3o/ttwtcxrWxSKyKillldcT03zNifXqJF0rAcFziQK5JGqdeLZjZLslK0dBju6WLc/UNkVtwrpgjSX8rt/cnWp1vH/PudBQcsVd5l+qbvEKs5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSnoH3MlykuOdwVxbGBuFkFQrFkEfRfJh5WatA2xlzc=;
 b=QRABgjeq7gzJzGMvX54KenYeiJ+/TlcRVJgGy83CM+Qqv+JZInnK5h/ooW0ECFOZBG6ywd/NB+sW+C1zd/iN0c+dOTua/71Iwoou0YF+5y5G/DqX19F1HSQg3hH0WnP6/EAUWg4mql8ncvrQuFxhpxo9lkX4Wz2erT/gqd4RFftWPaU6T8CPfJVwy6zVhFYvFByI/2ij8satYJu4/H60mdn5OTohyI5a1JPe49B3wqqdIeqBjLZ0hnDuAOfvi7xtibfkfzq9Pg4+gDI5oZqW8D+N97Ypfj+AV5OVkKAn/9IMdldtsXkzb4xy831+ioHJMu84UvWBK/0s6rVj7Fa0sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSnoH3MlykuOdwVxbGBuFkFQrFkEfRfJh5WatA2xlzc=;
 b=Df02qBH5Qw/xpA7VXZy9IPTsNhCsxYREHrf5BQ4Lx5TbENZEbIxI0DVLrAMyzzEBJqpjXyYP8Zsy4A9T9XlLvg9M3Vhnycfb0B6IbCgc2ulPSGswuV9HJyogzkZSxu6kHrqii0BoGHbbCCBl9MnogT6gAvMrZ6xRE6YA8mmHTFjVCqr0xLIzPqUCLsBePah3g5EsbDedibCfECG3557kdyLHBHDs20HggZJPv+eneM+/klysppB2q8f1ne4qvhJYLLNce/BmtDYYsp0ISJy+N3mdrDGWEZX2X1JYSH6vG03IFXHtPJ6lrPW8u2bR+O2jBqN8Uog5+g4k0tJLYMjEiQ==
Authentication-Results: cornelisnetworks.com; dkim=none (message not signed)
 header.d=none;cornelisnetworks.com; dmarc=none action=none
 header.from=nvidia.com;
Received: from BY5PR12MB3827.namprd12.prod.outlook.com (2603:10b6:a03:1ab::16)
 by BY5PR12MB3858.namprd12.prod.outlook.com (2603:10b6:a03:1a7::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Fri, 9 Apr
 2021 16:46:03 +0000
Received: from BY5PR12MB3827.namprd12.prod.outlook.com
 ([fe80::4c46:77c0:7d7:7e43]) by BY5PR12MB3827.namprd12.prod.outlook.com
 ([fe80::4c46:77c0:7d7:7e43%6]) with mapi id 15.20.4020.018; Fri, 9 Apr 2021
 16:46:03 +0000
Date:   Fri, 9 Apr 2021 13:46:00 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Doug Ledford <dledford@redhat.com>,
        Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rdma tree
Message-ID: <20210409164600.GZ7405@nvidia.com>
References: <20210409080055.421f0dee@canb.auug.org.au>
 <95642f46-f23f-3aa6-7614-a8f4a7109fc4@cornelisnetworks.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95642f46-f23f-3aa6-7614-a8f4a7109fc4@cornelisnetworks.com>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: BL1PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::25) To BY5PR12MB3827.namprd12.prod.outlook.com
 (2603:10b6:a03:1ab::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by BL1PR13CA0110.namprd13.prod.outlook.com (2603:10b6:208:2b9::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.6 via Frontend Transport; Fri, 9 Apr 2021 16:46:02 +0000
Received: from jgg by mlx with local (Exim 4.94)        (envelope-from <jgg@nvidia.com>)        id 1lUuGe-003OW0-WB; Fri, 09 Apr 2021 13:46:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39bd5d94-2448-4592-4b28-08d8fb76f622
X-MS-TrafficTypeDiagnostic: BY5PR12MB3858:
X-Microsoft-Antispam-PRVS: <BY5PR12MB38582DAF1DFAE3402EF2801CC2739@BY5PR12MB3858.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TLxlsX2te10zzYqULO/Bz6Wzy+kqdIKfPFye4M9RnDZl1m9vnlVR55wovPoE+DO634D6ZVsZFilaxbG+MghUvA3KGa8K1E6V02DEBNRngtqlZ7g3nwq5P8qUh/efJkMgvSyTV29tuBVGFxkIpi3CwOimMoLFuXY+h7OKOC9e8TZN8GGc0qXMmvDHbu4JmbJHZch5XuGofwWo+NVDPLhaCZRJKylgb0G3vKlSmJ9bHZnJZB07aqS/zaHEddByh8tVI/Sf5LyiHvMRyIZHgTB5D9KhscGYRUU3epBgDs7xfcH0F6VH27IKLahC6qx6k+POtUQk9pouI5mUjsTlvt8qsSZIsd1YiLTXaXupw6mjhVElpk3bXwwUgv73nXnWA+vS4FZYDqNPD+c8ww5jgFjRVz5msBpOElE7rjd/Ljiux4Gdw3Y7bhfPC+J5BOKgHrVOYDlFjvn8pummjKFWDhyPf27aJEGvnbXjn9yXIiBv+uetwr5BTfAJzTeFgSP7eR1/WeRVdituG9lQBOx5gODPaSONJqGcLtxesX1fAREm8bt2Fj8rog7/PQyxfbKFQszAgWSxaL11Vqa6Kds5AQDfzVcYxNW8ESb6uckYZIWLxNS1pe1iwQAtmz7044Awjj0jc/CyzqNUqS8JkYdQKJixbU1wo0N1f8CD+So9fKMgcl8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(53546011)(8936002)(8676002)(83380400001)(426003)(5660300002)(4326008)(9746002)(9786002)(2616005)(86362001)(54906003)(1076003)(26005)(316002)(6916009)(186003)(478600001)(38100700001)(2906002)(33656002)(4744005)(66556008)(66946007)(66476007)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?INVsphc5bzM9LzinbkFjd8pLroBVPb7gLh7cJhKOIxDGbEP1ovTJRkhCYSsu?=
 =?us-ascii?Q?SThRL3epMWBPrQcpvov/Up5JNZxaFr8oZB0jCI1ALPoyTc/OM5BrTELeyOET?=
 =?us-ascii?Q?Y+NuJ+QM4NEC3GESQxAX4a+DLlE8UZP9fpG5wfB7Vdfgy5Ym77va6Q37xtF+?=
 =?us-ascii?Q?bi0HNW+IHO0iJto9BTDFp3ODEVBdGLXghvQ00WuA8EzcfEdSPYpjXP9skXUL?=
 =?us-ascii?Q?jhOepldT6XcS7R9Lu3xeXLcrLIF2UghaUX0SyoUM8UNj5+34VNNthAha9Gcd?=
 =?us-ascii?Q?yM/14poIw1Vkr20nPlhCA+Hd9ifmR1Ba9wQ7HoXoBklMVNwSXwAnE/DPLZ8f?=
 =?us-ascii?Q?15LNvk+7hEPaBXRme78Pii2jxeMV5Ph7BmE0ZQrX7LfY+lcTOhjBvE430fYF?=
 =?us-ascii?Q?aHcwzVJ6JruRBYJrh7BxxU/mTB+ougZMHEZvoIWyMwMPPDLFwObpj7DBNP7A?=
 =?us-ascii?Q?Knze8MR3jOeLn8qTm2bOkZTxkj2uEu6FFWj5nEF3M3Ux9pZWh5MC7OHbEMiz?=
 =?us-ascii?Q?IhyO542kEA3rcIpJLfl90ai4pzBKPFTZL0NUao+QbGfBUPDEVTjCXKiPp5yq?=
 =?us-ascii?Q?JsLUpf3Rg7OtA19kJDyX9JWn3gC8Q/zNFLBj2E9WB39lYsdnp7F6dTzj9XQW?=
 =?us-ascii?Q?7SNc25w7VLvrBlaHpiJ7O3Jk6jew0WXMzfUDYGNHjkfDe6DWMc0szXt+uSEF?=
 =?us-ascii?Q?qMRWD4Nc0chcpXBXMq38g1DefmBigpiQnFYCNixqffsR2ev/IbfhRGWjAIk4?=
 =?us-ascii?Q?yjercdoeiiUm41Tff4NtgoxGr+ClQEGkKTAIx7q7jGjDRhBKPBSXE7NIJxam?=
 =?us-ascii?Q?cucX1t+kFLDxxv4ug2oI2eZqrsXYTrh5YVugf5TQePpT68iR8wHF1Q3masiS?=
 =?us-ascii?Q?LKUgPZbCJ5K1zzmWMJuGLMFcOqfnmcxU4OhvhjCAKszkZvYs3R1Puj6IjfSl?=
 =?us-ascii?Q?fqJOBylXyzh9GkkcPvfAsnfKgWI68AA3ARP+to020OzCX5gsxDBIvfCIy23F?=
 =?us-ascii?Q?PUWiE3xji/4ZBirl91HEZH3/COsarneMRUJYnsAxFr2q54CRES/VVPa019cJ?=
 =?us-ascii?Q?9awuBFT96tfSXBumbr3Y2HxP9wgRa5qqrOgnYBSbh1olcVy/QLwZOTx0ZewS?=
 =?us-ascii?Q?II6bmAtefVC1MkUNeESiNqHfJfKQKKHfjQmbBaM/gUFE9saRUZjLtLN2Bg9G?=
 =?us-ascii?Q?DGwDPRhBm5PALrEe7DcfTohngxwURYSp7rbmhJqaQot6ItLFhzgzxwjQnSNr?=
 =?us-ascii?Q?gr8/wKhPfxkQcftpXp1mwk7u8Qw/AdTnxZ/ugY/3KzTfRsA0RYsTfOWhkccC?=
 =?us-ascii?Q?gnrWUwm7t1BIF6EFZgz4BpcvzCukG0wW/6OTxrBzMnLTCA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39bd5d94-2448-4592-4b28-08d8fb76f622
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 16:46:02.8539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/WUPrulVbQLxtx/xWH2wDPKEBPJHDG6QqxoTt4/m5eIHI84c57bgGnagOKgPW0K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3858
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 09, 2021 at 12:20:09PM -0400, Dennis Dalessandro wrote:
> On 4/8/2021 6:00 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commit
> > 
> >    042a00f93aad ("IB/{ipoib,hfi1}: Add a timeout handler for rdma_netdev")
> > 
> > is missing a Signed-off-by from its author.
> 
> Doh! That's my fault. I must have fat fingered the delete button instead of
> editing the line when I was converting our email addresses to the new name.
> 
> Jason do you want a v2 of the patch?

It is a bit late at this point..

Jason
