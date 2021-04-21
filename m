Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0530A367585
	for <lists+linux-next@lfdr.de>; Thu, 22 Apr 2021 01:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234404AbhDUXJS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 19:09:18 -0400
Received: from mail-dm6nam12on2057.outbound.protection.outlook.com ([40.107.243.57]:37473
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232796AbhDUXJR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Apr 2021 19:09:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oj6XSKwubFCuQg9cDTJWNrErlcfWY/rAAU/VyU0KxEF88PkebSAqyZm6swr91SsGLmp7f5VyOncDzkhjaqKXlyt3Thx93MmY+MU+F7dnLTDudQCRia8gKURihQ6eEdxttS6NQYe7IRdNqbceIsTM9yHfvzDSxdq1BehhoBoZkYD0DgsSudw/Pefiil4YTRtyGk8vJeEnXzB55LQ9z8IoZpeQxDATZiu/3YERZhSOaHRv9f3d7WEfJXvVbh6uIe2py9beLVxs857+ODe7uoXOTvy3I7oJ653N2jchN+B49lB4KRBGRDW0w71NChxZ2pKKiaT43Plcc9jM783BXYATtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRYr70rrfodmFtSH73eQC3V4PEPnuW/de0Ua22r1jbs=;
 b=b2EqTE5+OsDVzYQ9sdJ/J9vPOPPOcEjDmuKkS2qdaqgj7u5RC7KRmM1cd8A/cFopaL02KmoXyE9yigJpCX2mEQzJ7lcdsJjxKUZ51mCzXBrq1f7dzxtHXNGdWe7YhP1g/ti32qpAVhAnjka8Zct5unhwTqeVY2VWSKkNJ8AsWdOryew3eeUwNwgp8QA+5uAS4vR36c32+Aia1Me+Cp+X05Guq2y/xLPUG3ZT1bKhsOC+1MbYpPASkIdAWwkIB13R0MiTbyTwe0uCfZE8D/SfrzN6k6OCLuHfJszLBFYqtL17qrkRmL04PgeUNWyDPYLT+xKdDKwNr4MyWkxwRTG/3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRYr70rrfodmFtSH73eQC3V4PEPnuW/de0Ua22r1jbs=;
 b=dax2AKtTG5VvsUrgpjT4ES5FBvYd0Nn2Hoo1dlVNilX2LiKMBlquLnWCkJwV23moqk4U5bKN/5L1lORuip8Jy6D+vTLVJVrho/iSFpszZ2yk3aUcyXgywvwN3YR8C3Z5SmEvM8/WwRg65AXY9uBI+39kh6Yrzxa7aFvKDqRnKbLWq/Tan2Q8EltRsbpt25gp8sC7IoNCQpsIgG+CV++f2UVzgJKIWcf4LpYMQ0C+qaYuNXR39EwHxPRm//q+uuXRcq42LI6GgEpqCi4ePvqoS2xSFRcIjqmo8CDbBY0WisVbJ7PCJ5NCK02Lb2ANHDtR0dbSjJajl0YAfQVzH6eizg==
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR1201MB2490.namprd12.prod.outlook.com (2603:10b6:3:e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Wed, 21 Apr
 2021 23:08:42 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 23:08:42 +0000
Date:   Wed, 21 Apr 2021 20:08:41 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Doug Ledford <dledford@redhat.com>,
        Maor Gottlieb <maorg@nvidia.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the rdma tree
Message-ID: <20210421230841.GQ1370958@nvidia.com>
References: <20210422081336.5798e36c@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422081336.5798e36c@canb.auug.org.au>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: MN2PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:208:160::35) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by MN2PR13CA0022.namprd13.prod.outlook.com (2603:10b6:208:160::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.16 via Frontend Transport; Wed, 21 Apr 2021 23:08:42 +0000
Received: from jgg by mlx with local (Exim 4.94)        (envelope-from <jgg@nvidia.com>)        id 1lZLxZ-009gcx-DY; Wed, 21 Apr 2021 20:08:41 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95bafb8b-e612-40e8-c362-08d9051a681d
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2490:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2490806B98974947CFB74B8FC2479@DM5PR1201MB2490.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JcDKxJruE+dfOCVVznv8LsI9mGF0Py3Sv97Jj94e9EzcEpk9VfN+iyb4JL6Ry3qlOgAfuATMf/zQnjO/Sk/nChRHqdpnjcmQnk1EO6YPv7bnp7rFcTS92K3QNZjznUAkuLEWidOCOPfBCnBmXNnIEEzLmJBzUlqxDHGYG7CFZZL9j5gYcndR1/fWwstJkjESouhG3oov+QBXY/Yhr3ZkDWFhcnMydsayeaqKWmljhLHTdR+3uVuz0cIPP0buE9BmVNm8K+yMTjHRQDbZlcGV07TvTM6wEjs9kUO30nq2eijzrPBVbNV2BkPslJnYxT2JGejDa/4qe+VS1lsNFkXc3W3cm9v4FEmjaqNZ+VkIjkGsfxVnmKIiyyoytliIjrE9QsOIC2yqEeZicQTc+FnTFncrULD95bIbUTGnckbekWbnGIKHgRxzyJtjxfX92pANU/Ov6RBtDIbdn6zJdJwPN8HNi9U75ZLT99628i9VdQA1LR4egXazqVipHcDxz9X5EUyA7Lusl/L0p2D42XsVmrmHjfrjEQi+FXJFWQtTeAX3Zz8p93T/zREAsn9ign+CjiY7xey+y96wOC4vOr5uDOBKsyvMUwIIpGm0qo4lzUc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3834.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(26005)(33656002)(66476007)(8676002)(9746002)(86362001)(38100700002)(8936002)(2616005)(316002)(426003)(186003)(6916009)(2906002)(54906003)(4326008)(478600001)(66946007)(66556008)(9786002)(4744005)(1076003)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?X9IvUSRyTYzsTWUcTBn+fbPFg2fvR6XKQgTBSc5hEVAnJ7sI2k+5fryCdfT3?=
 =?us-ascii?Q?u+q1Q/9v89socCnaL1bsNr29ExhkhFUlVA5labwS2NrzSa4PpceLmzGxUH9p?=
 =?us-ascii?Q?pFsXkWUub4ThFz0Ea/ykHBGPiraGuHgYT4YolBKDj8cFCUNncKbNpx4cb3y6?=
 =?us-ascii?Q?RljEmrCSLdyGkS0mF3zc7dWTMCiurEVCFQr/EtJ1Q6uQAZHz1AaFzmKP1Ct9?=
 =?us-ascii?Q?g6/NYYfbGnPLeFNuP2VBMp/6/e6v31Rno+NQNl2DkLHyzcKZPprBppStBocv?=
 =?us-ascii?Q?KU2UjeHmL+odkTOH4k7/BM0knvVyFzA9BIFu2difjZnwpHeQyNvkbJQetie/?=
 =?us-ascii?Q?CtNsc/b9tZMv23HdpMcbSBB2qslOX+IkmD/qLY5OoiIX5Ke5iE2xtzuPvSIH?=
 =?us-ascii?Q?Fi0vht7+jXC5wzjw0GEQtWf6rGK2obAueFsTGPiy3HgLJLf1r9cNnKHsBYPb?=
 =?us-ascii?Q?xxggKhEu7ME5zK5q1dZVVk+OPOdMLTECJEsYHHu7JSVRcYfBk5lvfs4neo26?=
 =?us-ascii?Q?Zqqa+eJkhmX06cvCGJnfnUU1IBjYDNVkDh/d6lKdj2H05h5YDOYlijuGOF+9?=
 =?us-ascii?Q?pGUT2fJELOs4zlXpOCq0/c2TI9mipdnHnSQvZc7nwgi/XMWZsDbARh3a7fiK?=
 =?us-ascii?Q?JF0TZc7F+uGKELSHwlK04C7f5x4Ws5B4+jsZnsc26fEtp/hKqSesQV9vLfO+?=
 =?us-ascii?Q?TVrm2GPnhdWB3bQRfSRDaOrdgjnbUlgzgrCatCNiaOYDZ3nP6J+lj3UG7+va?=
 =?us-ascii?Q?Kou3GP2fqw7Z7LZlg0UljtIucSi5g62MoKhoL8PBLb40MNb1Ob4cUhVBaU/l?=
 =?us-ascii?Q?bf05f/ODNp0jlB4DSQx6RSKVlSPRolaAdueKDPW/nKkJOAn+NsKVpAT+nXrM?=
 =?us-ascii?Q?5mNJtr4PV9eZRa+mV0xH9Xfhr8IWyjeymivR6DPJAb73PkP2wbibg0dU/Gz4?=
 =?us-ascii?Q?tjHQcxEHQgxjGQxH6m68ew209SJd9H8+c0alnishBtGEcms8FRqOWW4h6+Ed?=
 =?us-ascii?Q?6zrgH5//obPy92wnxT4bQOceI/4snChpDbpanU1ANMBH/6l9USe+krRh/qMs?=
 =?us-ascii?Q?v8geVny7fw1HucsjEjU0Exb8EfKj0FAFUW2j8WHiz9JJxEZQv1R0spmzud2R?=
 =?us-ascii?Q?0mirDzn4OpE/L750cduGTeDbYepcUIZ844WYUjVoxts4KZokjlDImIE2XZUO?=
 =?us-ascii?Q?KDKxH59v/1tO7xXcGVSCDtfqlTtEMLppoXIT21hH7BHU0/yXKZmR20yLKeQ1?=
 =?us-ascii?Q?4mZvDKhun5ZOsX9ztxLxBoFpDpeDO1FH6oJQDnkZxnugngQ3ipwkeTGtn1O+?=
 =?us-ascii?Q?9W6zQQVOYWuPaPDbjv4pAuxN11fEl8Sp4TguboPVUhsIfg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bafb8b-e612-40e8-c362-08d9051a681d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 23:08:42.5024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2j67xoFdIqUFNW+PX9ZMlIQU1nL9zWrX5kk91gIETcLLuL+LdSd2Wl3PW6vJAngG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2490
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 22, 2021 at 08:13:36AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   74270e75d9dc ("RDMA/mlx5: Fix type assignment for ICM DM")
> 
> Fixes tag
> 
>   Fixes: 9905fb65119f ("RDMA/mlx5: Re-organize the DM code")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 251b9d788750 ("RDMA/mlx5: Re-organize the DM code")

I fixed it thanks

Jason
 


