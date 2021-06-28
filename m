Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0C9E3B666C
	for <lists+linux-next@lfdr.de>; Mon, 28 Jun 2021 18:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhF1QLK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Jun 2021 12:11:10 -0400
Received: from mail-dm6nam10on2080.outbound.protection.outlook.com ([40.107.93.80]:32096
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229504AbhF1QLJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Jun 2021 12:11:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIpa0IfuizZgQcaBJqXWskULi+PZnSw5PrRx7YCM+SIJcriLzBftmdegqMTFqhRtSEbeka0+154fnYEF/RV/EkR8ESiOkSKVWE2IHtG93a8j0ptu/oWf+MGeRnnmabyGVv50f50b5JzlKStGLQSRgQvIzGFubW0lvTTYKnfxgbOQZbnjI6epe4SWST/xgBxEmtriX2q0VFq/Vp9bdTuqp3Vb/94MBxT9fs4QKzDRVnhF6HCJfTm5+JuFlEv+ttE06EdK9opLBTUZQWTy5LziW41hWUyBSf0a0NsY2Cdvzt0kuMSfl3DbEwTIWiu4f6YeEzWUNgc3I86UYXkkqS1eEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKGeR9OBF2PsaSl0eGK6regxyt8Y/hPtwMXDQ/rEMoY=;
 b=MzuNDOBr2Ljz1WJBmyYFOq/3VleCKDi46csdIt1LHGMU/xXE7YzXojQBoRASQDTOJAe7HmQt34Y1ybmHIvMGLFupL6m3HbrBitucLiJ7dXo18QIJMKSCX1ULTS6+SOAL/6P45QEJZBFR6QLLM+vtByqyNdW1kjgwTv2TOn8d1hAopzRv7OjnHETJjkhrhXbf5YDI4KkDm50O56OHHGsc7sKTn1R1ZxhapndDV6yul6mdTSqVJMlue+t9ePNjuN3HjWmTXDNvqadbs0GXfa+BeWGwx8JSKhxz1HpfQaI3xupNTI3dKXc5E+yiKD5g7YdUtP4py3e/+mWD78p8Wt9+SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKGeR9OBF2PsaSl0eGK6regxyt8Y/hPtwMXDQ/rEMoY=;
 b=pbAiJFVL6e4ICr/Z1uvQ3HL6d6at37vlDnTB2S2qgMseOKtkMcKTqCoGPouXQEsy4BtlQeM+XKclngR6agftwZW4+7gicRP1kbLur9fdKvtvpg9V8ii0DkLWRuVFRZPGAkr64yfXkoB5IyqXNzTbSCg3wBsY+l/JOE8rBaH8ztpWcRYaAnzvxaR1Yb+a5AFmnhaJdBwxveA2EMctTRxY6mWuDDaotZg+9FmOwDQZR2wdlkkUdu+juSmSq6Km1YrL1gG3YJ3IdsWahZXS6ZY4GnGGNPg1i85nhMroI+RuQq3QHH9WUMRNWQx8QvYSVfePxyIKdPiAKhjR+rSgZOAlYA==
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5142.namprd12.prod.outlook.com (2603:10b6:208:312::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 16:08:42 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%8]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 16:08:42 +0000
Date:   Mon, 28 Jun 2021 13:08:41 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     liuyixian@huawei.com, liweihang@huawei.com, sfr@canb.auug.org.au,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Lockdep splat in -next
Message-ID: <20210628160841.GD4459@nvidia.com>
References: <20210628153746.GA2237462@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628153746.GA2237462@paulmck-ThinkPad-P17-Gen-1>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL1PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:208:2be::8) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by BL1PR13CA0183.namprd13.prod.outlook.com (2603:10b6:208:2be::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.8 via Frontend Transport; Mon, 28 Jun 2021 16:08:42 +0000
Received: from jgg by mlx with local (Exim 4.94)        (envelope-from <jgg@nvidia.com>)        id 1lxtoP-000ebP-Ds; Mon, 28 Jun 2021 13:08:41 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d00070e4-5b7a-498f-0b51-08d93a4effdf
X-MS-TrafficTypeDiagnostic: BL1PR12MB5142:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5142557861E4DDB3B8BE63BCC2039@BL1PR12MB5142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MCOMko5X3AU2J2Y7RHVKqVCVORwqTXIomnglDncZpmkZ5V5D8e7JEXQgC+nTvl0wpKtymStgHyJkHQTmEZR3QfFIy45LETZqIbk5/Q1Svwc/0tCqvyz1CYFZ7hcoiWj1QnruguCK+oHb6LM05J063UnBsBnUS8Rfykb1pGaJXosMNiM7KE9K3tRSWChdQaDA3CCiOxgpl81d0hn5ruR1kDraatrn9+ZlullC8blLrgeF0w84GuJQawuVrW5m/s9SBVoBhABS4TBQ6m7iM63u5krF8/CKoKt1oQIvNfp4d4WiTHL1+nB9e9HlAXVv3O3yMgJysHn5Fciz3g7aFw/Uh60e/ZfB2AwH8k7vdWEjt0jmwYGNhLUcNzF0fDqOev7VNdCfIeVirqUMgduPkvx/O5a7pfYTz+UKITvcwcH3wisQVezF35nq3e/9tav3S77TTWtl6iPOMHMXmLw41pd6soksTYvmn7gzrtRRmiT/hLN01GUDd8xdN4YMe9fCRRWjo0RSzHALnrTKtY+t9PL847yhY5mHKz7L4RSDO3yMd8waoFoo5U+GzRzw2eB1WziKKMM2D9WWNrPPqxuCN/mfhfesreAVn3yPRgT+FWcrZd5fyXzDnE1GFD3wstiTiZZcdg72Re0sW+WfdqyNFUOqAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB5506.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(33656002)(8676002)(316002)(8936002)(426003)(4326008)(6916009)(26005)(186003)(2616005)(9746002)(9786002)(478600001)(66946007)(5660300002)(66476007)(1076003)(66556008)(36756003)(83380400001)(86362001)(2906002)(4744005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rxy2GjANtdAgb7HN6mBKwPHPrjIiIEXYdHP/NxrFxOVP5DqllubaXkYn49Dj?=
 =?us-ascii?Q?ZJibxbrDb3B7uD2Gwe/YV9kyd1ZFr+z95sludol+C87vU8+FE3crxB1rW/ZH?=
 =?us-ascii?Q?uUHKIT2bb3dOmYYXfMM1VKsRZhRAVQ9Dk5yyzQTQtuW7GZzCRs6q9qB04/L7?=
 =?us-ascii?Q?XBhdSroLPBJv0GsOEjPxIfvLLKZXTzw4ZaBs/owsrymInDXrq9Mn8/oG/HQs?=
 =?us-ascii?Q?Uo+/NNH8nvHjULbgowu+0UIPo9E9usdsrqO0qkU9UN4Cl++TrqCbRBiS9pwM?=
 =?us-ascii?Q?f8sfRFxO5vCOnCPDVDxzUpThiPLT0he26jdpMgXskqmsVctId0s/yYHSrlD0?=
 =?us-ascii?Q?QfDvBAxiSe4N1zmuoeYESrQkzyIUlYmBfP2b49EmbNkDeInyQ42Mj/7n5Iiu?=
 =?us-ascii?Q?t/6W7updh9FJbslAxtPvFuDccLgCUxHllV4BNYb4GnrH3k+4gaC9buW/MtFj?=
 =?us-ascii?Q?eAtcnL9TZ64YXrD2wbrEDQTxzB5aqItVpnzX2dqmXPvn7KCne0zgpPekms8o?=
 =?us-ascii?Q?eH6IvRlqO/wyJWwQb8RWxvnY5ogeYU4ATd0AaZsj3iSF+zw5z0z9QPOUUWYK?=
 =?us-ascii?Q?BWZd3AZ5d9MyvLCjVJyj1v4Qr4lSJGxjN7K8hLRpDJVUI0Wp2PvEOkNQzXhe?=
 =?us-ascii?Q?rxyZ+gzz/54bNoov1/S2NFE9dOwE6gtOwJw/eSVsRSmbKDfqsIy9iVpEBifQ?=
 =?us-ascii?Q?PwJZA0MUB1NDrL1Qtil0FevnDVtk2+I/KZnDJwI0ufTSc1Uctl8LmsN9LAWH?=
 =?us-ascii?Q?ANQU4Z/0aEZBRaqn84pXBPliOT1lXrFtvC/NnpKZXau25kHzMQyuLtdDBT3H?=
 =?us-ascii?Q?q+OIyMffbxigzDA+F40NgKeWVr2k4GuDQOFSoo1Xa507J94A5KrrEkRIGinI?=
 =?us-ascii?Q?Pmnndl6Hru61ZEm3HQojNk8fy5rByd8IH/PQBHvBWgYUcLaZzo6Lqgt83YPs?=
 =?us-ascii?Q?urEF/tLmI6DG6dAlMGyfRYmAt+3mkG+FlQD5WUxyaOulnLUPqqkEwQDd5WmW?=
 =?us-ascii?Q?sAWOUE46TTDK4O+3YtSMql4HFQYNxt5P2brXGioYTnjCFgGd4F3r4u9E9vaL?=
 =?us-ascii?Q?iSvtimGrWuK0+uZrS9m+88oBSLgBrVpvkiCwY9kITx3TWXfTtx+W6HQrnwhQ?=
 =?us-ascii?Q?GGpjhzRBp9XGHqhJ+8DpKO30DjzCjDDqiiSieE6CFoaXIXLHS5xZaVcgMQKS?=
 =?us-ascii?Q?ev7DwXvFTt3oIxMX4w7y9FRRIg0NdfPNxVEbhYCw+V3838zqw5eYqzpzGC6K?=
 =?us-ascii?Q?iRTxK6f8Z4ww1Zv0YFVvhpc7Z4R3Yveq12pbKhPq+2CaIE+9bxmeX3YVRnqT?=
 =?us-ascii?Q?yN1XcNtcwjAWRueI4k87mgNs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d00070e4-5b7a-498f-0b51-08d93a4effdf
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 16:08:42.5727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egV4U3twm+030iGMY0+ozVGCOAj0kM2RHF44iMgj5DHiPokwun2frV64csNPg10V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5142
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 28, 2021 at 08:37:46AM -0700, Paul E. McKenney wrote:
> Hello, Yixian Liu,
> 
> The following -next commit results in a lockdep splat:
> 
> 591f762b2750 ("RDMA/hns: Remove the condition of light load for posting DWQE")
> 
> The repeat-by is as follows:
> 
> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --trust-make --duration 1 --configs TASKS01
> 
> The resulting splat is as shown below.  This appears to have been either
> fixed or obscured by a later commit, but it does affect bisectability.
> Which I found out about the hard way.  ;-)

I'm confused, the hns driver is causing this, and you are able to test
with the hns hardware???

Jason
