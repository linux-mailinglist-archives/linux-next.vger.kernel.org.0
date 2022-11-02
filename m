Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36BE2616E47
	for <lists+linux-next@lfdr.de>; Wed,  2 Nov 2022 21:07:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbiKBUHe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Nov 2022 16:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbiKBUHa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Nov 2022 16:07:30 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36EE107;
        Wed,  2 Nov 2022 13:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1+DeMAcv3VYnZTbTXBBgjJluUSU2HBdhYBQu5l0SZ60L9jQ4vUUXuqW6eLQXNbfiIOww3eYkAG9wHVfIfRrZR4uWj/3knBGbSekAUGXk32yj0xYdoDoc4JueVx/zqHvODINq8eqZdUy1JabnU9Jd9iA5uwW/2sIZRprYgViWCDbJ40XLgyA4w93SiiYP+aMeTmHFyo7QLy1To6EZylxBibnPCKr1UmNm0njULVPxzLZeuXWNQ+7gAp0FvTFHXcA61WEjrqroLxa/iyotPy5Caz4l9OKCX5UiuS6V5CXrkbEpna7tldYZzkLBSNi5Vcn9pLAZ50Cbdw1MNF6QHZQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRw45r6ORR9oLVYFGGxULKFibqgeubP9cBs52AJGlUk=;
 b=n2M2Es32VwKBXiL17KnBJ+DaRGUCxyQZTMqHwjalGIifyAbiAGEidAK+rqygW1SxMQJzUymfuMHxn6o0FWiCLMyatemUaQDj0Q3jG6fqifRtopdoCbd9vWWrR1fVK87z3OzUUzAU64nf8kVyzQ+P92tkicTIJX3u/tjr1fvONoybC47+pKBLe+TrbaJgEH0RMumYxERv6MT+UXtqKr0gu/quu2BFXq2zM3jfz6j/JVXuN00zNyN/U/IcbdH70SAgMlxdPvHwqPrVv1qsG6W7RVOpPKpUdblZkRz6u0NCYlaOrhZ7DbcKMwc+V5hDGg0bA+VyRwnivJKY9viCuCl7Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRw45r6ORR9oLVYFGGxULKFibqgeubP9cBs52AJGlUk=;
 b=a4OxLwj83XjE5niz+z5rtmd8chdfj8vK8EkKTLyyiHDGhe2m4hD53T5w4fRBkE+w4eGO5azFYxodtb4uAHvXP1IHPSjFuLKgXWBhPY2/9idHtRAL48qanlC4fOlJcUjGQ1URLiWqNCz282hWCDO7S3+cE2V7b/C53euWabci92sSJP9vAWiiv8Bn6eYTy4vwPdtUlvBBmiaD3+GaVWnWjQLkRvVBBTvMHBXlQulb2L5Mgb3TtycE0xhjjoY8+5buq88BhXsrev7XUqn4S1DefDlCS9Ogdawd0/UJhNjpzGPTNWv+EAb87V4TiUULdLSI6fU0hLsCRDTYSRhWA8ykxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH2PR12MB4103.namprd12.prod.outlook.com (2603:10b6:610:7e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 20:07:28 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Wed, 2 Nov 2022
 20:07:28 +0000
Date:   Wed, 2 Nov 2022 17:07:26 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     coverity-bot <keescook@chromium.org>
Cc:     Nicolin Chen <nicolinc@nvidia.com>, Yi Liu <yi.l.liu@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: iopt_map_user_pages(): Memory - illegal accesses
Message-ID: <Y2LN/j3Kcj09xwAJ@nvidia.com>
References: <202211021254.4B47DCD2@keescook>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211021254.4B47DCD2@keescook>
X-ClientProxiedBy: MN2PR20CA0018.namprd20.prod.outlook.com
 (2603:10b6:208:e8::31) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH2PR12MB4103:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c125c3f-21a7-4052-c9e0-08dabd0dddd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y+HFKAZc8qDYnsrk1vbQ/CbSBDRt+zTaFwz7igrrm2DITxa7+RsXGuk1fHXmRuKd8x7K3icrdW+rXtCrn+qO7WS/qZncMcWmTI74jIfh+clFrHk5OFddtYc8wPyTonMcpQnQKMJ/cDC8hW3z4FHj8SsLHPawUSin9iAq4AWYZK2b33L0bxahXNdikH6wR8Q4Tx5e4+6cwFdkFkOZnFrlcEMN7684h2xpHt4fwUv4EnOs3iCVXhw5kEFGiUWX2R69ALa2cQut/3lGgZ/I/kjwbcHtltoPGHOzhlDoCN3kgcnWjtB1omnUFiE4ALRnF16XLekBZiG1YDTw0XmhJRY/bsNBCpSlwh++2EqcQux0nY7hCVSNH+JeOtcbGnNqROOv4ig2Rr9pfEtoG+uE6txsG9mjMJYft37wUps5ZfYx70r5qCaTWOQKFmmiIzHzjCPMfcBMoDr1TjRwSfICq4HChz48Q5opwzQEeg1XCursjy/GyXzfdzIRkfOeX2u7bTppjoAET6/A7R/ggWrWR8q4Iy//9wtNmKDA1KTHX35SsHq7bgYUIiTY1EFC+vIxugkL7bSf4tQVuXwmcScQ/iZF1iUcUjHJMbtRqFTByV8H0VGrAV+qUPB2hzxDx52Qi/XvmCPFjH2UUVpcpS+8pICFp0TFVIYiPlc+fsYAI3lennqVaMSa9rytI9HYDtuRFXryiHfFwO5XXxbxKBP7rTnUJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199015)(478600001)(6486002)(54906003)(6916009)(316002)(66476007)(83380400001)(38100700002)(6506007)(66556008)(8676002)(4326008)(26005)(86362001)(8936002)(6512007)(41300700001)(36756003)(66946007)(5660300002)(2616005)(2906002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K7U/cI4P3lzDpVjQD14/q2KMOy78NhypyBMwe2O0ac7YEA9rdRVIYeuLOSji?=
 =?us-ascii?Q?tHqYZej7Om5nt/NzKaelqyWKEa0DoflrZgQ+y0HI8cwr+IyhXBFoKJaOEoVI?=
 =?us-ascii?Q?QrQXY3FHyjgoL2XKMIdz6SMv4L85AuhBpsKlr8KQimvOMimsqw9OjD3Uevf4?=
 =?us-ascii?Q?ZzhXP6M5NaVa8GaCGx6a6QaDIN3dX3BpyMbFZ0IawJQ6bmMHlWh6sCY5+p26?=
 =?us-ascii?Q?UIlTDHoKkp4pK2p/kZ6FsUgC9kwK04nEc0DGgAEmdAGMmjaEHFG0rpeHGfOR?=
 =?us-ascii?Q?UVzfK3k5lxWTy6fCTzhtvYmILTCyxH8b5qNX+SWOA9AkEAYLauWb1iwJh9nP?=
 =?us-ascii?Q?/FYXxqmGW3pHx6ZtKdDH4ATGbZ3k001bNVpi7Z0O2lU26tpHATworQPHlfNA?=
 =?us-ascii?Q?aMt61fSZNjCmwjfpUizw+wquGt7y81wCbMX8P/zCz0VeKQHYsVOactfkhzVC?=
 =?us-ascii?Q?kN31IOVCM1XBRm6T+e8q8hwB2H1T2iybShKVzI1EoPftxWj/ihQzGGewiAmC?=
 =?us-ascii?Q?j4Lzf+Fpu0fWeyl/kbc1gvNdy/wJhXAL6GzmRLPsdC57ZwSb3Qdx0M35Ukgh?=
 =?us-ascii?Q?wZtPTRIhIEEGKUr5iQp+HPNTMCiF8iSK6kjZKHNTWV9l1zCOb9VuQ4X0g//K?=
 =?us-ascii?Q?Dytw2JdyJuPA6kHXaJXWVL5TfjETndq27SoWg4HLvAmErkgFImiLJogjlBLN?=
 =?us-ascii?Q?qVZHyrDwEW2T9arvlm3O4gzjod5LmBarfb1ykSbaPYUFqTNAh9QMQPAXn6C5?=
 =?us-ascii?Q?j9DcfTcmjQlU9rTPg1DKftWgwUSPpqg1r9BX4mwgwrNHH0uqQFGz0hcpdVO7?=
 =?us-ascii?Q?sljppO70syQo0pBYrffIk0M9c96BWMLlxsaeCNQ8J+SM02riJ09ETGIouEBy?=
 =?us-ascii?Q?JDrKYClzq3CYK16fmjLhyL7F69toVc1UJ+7vU75DIro9lLGRrJP7mHysGm84?=
 =?us-ascii?Q?MKZOxLT+GSKxM3NtP90LIgoyjulj3K8NVdlyhz0B+5HMhBZDqPCF4HdmVuKx?=
 =?us-ascii?Q?NIMFk8NbZU0J24u5oGv+9IBQkhonugy4760ttA4WFdbS3ZZEQr1CGeAevSaA?=
 =?us-ascii?Q?jIovXK1TqHKws8igBTgTyPpFiXN9p7TXzbr4G5xukxAHlJQsX8mdqwAs7FbG?=
 =?us-ascii?Q?3T9U4ykfmeGD25n+1rmiIYICGybh23c/rzo3g8EM4rabqyVTwAhQgt3Am7M3?=
 =?us-ascii?Q?UBNLxiXfL1s+QiRsg/Zr1alEpIDYgecrn+cK5zPMZ8rLWlgLQnenOFW5VgR3?=
 =?us-ascii?Q?6TeitLNCNqtzuGWCcpvrcp5y0cU9HbrznPJ328PRbbx1v1CHT7ecFmkfNifL?=
 =?us-ascii?Q?Gz3Bs5/G8hStCSmn/zvTXRvD3uMd3tU3rZ90vICCXM4IL/9taIB7avRSvhz8?=
 =?us-ascii?Q?3jjYnJaNZycJs5FLQhyfbWT6traLhjRjjLH/hxbOeLw5eOcF1VyKS74qgMOx?=
 =?us-ascii?Q?eEaMxusTDxs7QCMABljrg6bMRcGDgoVytKVFfSEJ6sdQbF7v+pcTqPZyK6XM?=
 =?us-ascii?Q?M35atQuSVfeMHf1hDuwqNBX+O8OBJ+NW8ZBJ0ZQjMwoxJUvkhI6InTqjB+96?=
 =?us-ascii?Q?pVgRqnIkWdFl5hDxqXE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c125c3f-21a7-4052-c9e0-08dabd0dddd0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 20:07:28.0800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxRhKuSlv2kBd/vhsl9rQeMXptVHXVYtu4tqbX4JsEJ2xry4yPL0rl+GWaFjx2Uo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4103
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 02, 2022 at 12:54:40PM -0700, coverity-bot wrote:

> *** CID 1527094:  Memory - illegal accesses  (UNINIT)
> /drivers/iommu/iommufd/io_pagetable.c: 415 in iopt_map_user_pages()
> 409     	elm.start_byte = uptr - elm.pages->uptr;
> 410     	elm.length = length;
> 411     	list_add(&elm.next, &pages_list);
> 412
> 413     	rc = iopt_map_pages(iopt, &pages_list, length, iova, iommu_prot, flags);
> 414     	if (rc) {
> vvv     CID 1527094:  Memory - illegal accesses  (UNINIT)
> vvv     Using uninitialized value "elm.area".
> 415     		if (elm.area)
> 416     			iopt_abort_area(elm.area);
> 417     		if (elm.pages)
> 418     			iopt_put_pages(elm.pages);
> 419     		return rc;
> 420     	}
>
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):

Yep, I will squash this in:

-       struct iopt_pages_list elm;
+       struct iopt_pages_list elm = {};
        LIST_HEAD(pages_list);
        int rc;

Thanks,
Jason
