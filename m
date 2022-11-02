Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAB16616E62
	for <lists+linux-next@lfdr.de>; Wed,  2 Nov 2022 21:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbiKBUOQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Nov 2022 16:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbiKBUOI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Nov 2022 16:14:08 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722592F6;
        Wed,  2 Nov 2022 13:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fI559aVtxA5lH0L7Uwhh3sOMGbhYpGtl6bJBKBlrRi+wozo0LHiVpfYpVYJ4/GJ2vfRTuca1Al1aUar/pvHecIOWoV86jppnVKPLaKPYT3glFFeWFLSZlWj2qPZDD9T4a1IPd2/brNE6V+cL3zBMGCh0WinuXm3bPebWkc4zHN2ZEsVZsbFjlr0910ea3w7qaKHag3UbMLq7dB6py0BJzC/w6AndCQ0Q0ekK06H5ChuKREwHlPYf1t9xiEpc/uvxoVKSiG/s8El17/lSYKQ1Y7ZidT4YxB2T5fY8LN5osG8giQW0MUSyKNEiUmxG9VD5xIRvlq8rcOhpq4O91I5CsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRXD24CxBe1V0LZ7gGp4L5QknzUjSskEkFRjsSXKN6Q=;
 b=OayqzRAGzKl3IVe+5hL7aEDhp24zLTFX7luEVCHN0JXh3TbM3fdrg9lfQGCnkrdBGt6cmzrD451vkxIdc8gcPd9RCqHzfGDTWhKChnMS3ldckcGcB9Wh6nvsTqly+IbkT+hVk1q7Aj2qr3LMTm5lo0TaopEAjWUjFDsBAGgOPcE9eRMocJ3VpBIKBBbipjzYKul1PXtjBDIVYvwJt9kOh4vQQjr2hurSxjCD7JO/4/++SJrV/kESwzfCxDJwgiF7wQ2pkD6TydobKijkSoPseS3D4h8dDLMcoD6TDW4+40kgcpx4+XzTNdSDBbxFOpYEgsdcnT+oU5obw2RFT0ywig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRXD24CxBe1V0LZ7gGp4L5QknzUjSskEkFRjsSXKN6Q=;
 b=MCkIjnNLhjlixSTfd3b3IvbXi+VuDYMlstsRa215RxRvBiS6B+uySnv+AOMDzc8T5SenNhy8YF9fcsXnKF5IutHZQZ4xv6HK9x/FeO1SU8U+Vg11gNWmLjAcC4lurMgCp4MrEnqSoeY9+7iLnJEl8ZC8ZMhrRpb0c5eh69elhzgFbeJpy34QJgFlEcsyXFeUPK4kdqXKIMW/sapv7qDUwqmTBwMZQporBucREJr1Z1qTnsfcqBM0C91xTiMhYTu/rM9HaYt5oWitQwqYjooCxJrFC2wDeuq68mEsHQXlrhmDTaJbfiYU6Rh/kXaguCzJ8k+V06Ca1OV7+X/S0lrs9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5239.namprd12.prod.outlook.com (2603:10b6:208:315::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 20:14:05 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Wed, 2 Nov 2022
 20:14:05 +0000
Date:   Wed, 2 Nov 2022 17:14:04 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     coverity-bot <keescook@chromium.org>
Cc:     Nicolin Chen <nicolinc@nvidia.com>, Yi Liu <yi.l.liu@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: iopt_map_user_pages(): Null pointer dereferences
Message-ID: <Y2LPjFFkYk0mW+bo@nvidia.com>
References: <202211021256.2F571DFD@keescook>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211021256.2F571DFD@keescook>
X-ClientProxiedBy: BL1P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ff025e-1a8c-412b-61d1-08dabd0ecadf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RWOIllaOCwwzUmLVb6RPmQA2B68YgCkpmCwsQpJNGQEWgG0bha5QZ+Jy1fUKBIF2cZFvtZWQ+STMBNmgJ+9lw5vQQQS4jwZVPN2RMkC3FY2wHrc888CHM/lAeoZUUOilR2xq+6aorLri/gVOHlJK2kNZxzyM/gYlAAmFTgZsymdvMinnwjR2z1xaOFigg1qK40S18rBkxIyf+F69s6gbRlcmfsS5UiNFgeQjJwgubNGfxQiXwvgYni4y+W0DJxWTtzXNzqEigeIGAWt78LaVDiur5etrg52Gp8Ke/F8ZKbMqubNpshUh6uw5F61CuJtTb9TK9ZuKJFl2y6URmaZ80Cy1WBpapm0emjT3M8yembIkZJ2pH15tsYtli+KaBoUWqzBekCb6CMLjWZFBjGi/Xj/PyVDxlgxIb5vcSZC3BJzYZ5o0bPVTz4lu2pYd47PDI5hIV8QB/aN0Y/v4SQjma3ZsVMNf+mE7lVEFBzGhAXZoxLj2nQ5n64Stzw+FWPJxorB9fdg5+KLcwk9A8fUENS8EXEMKkx74VdMATMDyWOThBh9Cs2/HNh/PqwfPflqtLFqbEeKdito1Kpc6adI9W1VgXSMdvMcTpw7UuRXLDP8FJYk9sgtXj6manjJCSkFx0X9CKj8dkpb2aUASkumIiCucKKhAf+hSfJXkbNixRsTcaBBl5Nu9ulANeAiPt79UyTfwn5yPVR6OQGuqpZEmLZcN+YBCM6HiP2rjEqBOjGamfHSLAps2N0rPjwdzgvG5P2OUgoy2avpJq3CY2PKzDULbD6C93yIOipFck/B4FBi/j5Z9ZYLOMlr+eVWfR4WW3McC9+EsQ0jJJfGiIERK/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199015)(66476007)(66556008)(41300700001)(5660300002)(4326008)(8676002)(2906002)(86362001)(66946007)(36756003)(966005)(6486002)(478600001)(38100700002)(83380400001)(2616005)(26005)(6512007)(6506007)(186003)(6916009)(316002)(54906003)(8936002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HmdF3h3Ffuw8H3JNN9Ob9MTYHxmdq42TqGWSwSa8S+2JiJ5kIcjxTn2HlaX4?=
 =?us-ascii?Q?ngCOde2Fg+7mVaFWnXmAW2yaaP6ucaKpa1fV0gNVfTNCKYtQ+lY0Pkkb6vwG?=
 =?us-ascii?Q?oOdktxOV6V8QmBkA7ya4xmuPlEWj/DG+/pobyAeVuOsxAgpLl8v+5QTCB2Yq?=
 =?us-ascii?Q?J16kNVw+5PCEfH21E+aHimvv4GEHJwLIjIeDmjiulqYTtGnbGByiLg5bSDs3?=
 =?us-ascii?Q?+0TwYRVgC9EpOgAd9njOoR/K2+ULNelavrLfdqSvC2VvFmQQ0H6UfOTmKbS0?=
 =?us-ascii?Q?p/wwUtZ3H+zPNxL/H8CWNPDHMEhCXZfFiwRXPKNApn+EidFTQAWCTLPYnkP8?=
 =?us-ascii?Q?c+uafjzu52/bcW1D7td2oGo5Ltv669jWkhre7wkNhUCv+5Zjio43GFNrOww9?=
 =?us-ascii?Q?eylwPXL9V0BOJqXY62xtCnXqlpBNCN8vhBGFY8MAhFcXTHyPGNROcxX0af6m?=
 =?us-ascii?Q?szWpc3CY7JAeQLe0xD/iB0fhE3s320TgbdkDgyq036SYrLw7Fg3tyEFr3gWW?=
 =?us-ascii?Q?ratp3fcSxEA/CJaCP6SMFD8VnnMeEHF5/dZchnhfeTWOs3Aev7WL7DQh6DfE?=
 =?us-ascii?Q?hmGTSP5FbFLiXCBFCKAZv6O0XD2b7SjyU3okVs9Iqd+cHl4H+2NRHVwtmCYF?=
 =?us-ascii?Q?nJqulN/eC29gK/S8ETyc6mViJdaMyxuYMXA73nZ/k5/Ua0mQx1KOx5DrA4Az?=
 =?us-ascii?Q?pm29MPUzhuw6xjQEkTN7h7CMpQa3l6mhrPmKI/O4RW2KGVcyUiHovo8hWDE+?=
 =?us-ascii?Q?+dYJBx0/hDCRKa3mPA234dw90iVCcyoURmKwthMKYTLrcQG2hzyvxTkgcv3G?=
 =?us-ascii?Q?58XmpQimR11FDzX5lxpV+gBwPjRqA15+5O6K+nkSCiFmB8tG6saFOdfeKKXH?=
 =?us-ascii?Q?y0AsfTS9Op5Ajec/C5YKwobBgJRPP0mRxYdkZ/9JRX1Hyo7VGzzhnkH8cAD/?=
 =?us-ascii?Q?nO+AkvH1Ok9OgosfBMZP1wuiC42PubHljMTFjthTKRRKzbUOn6sX6PHmvEyG?=
 =?us-ascii?Q?LMe+U/8rrHoHyRis4M539DmFBWfeK03LGlpx88TvA2+l/JoGFaF9NUQ8ktFt?=
 =?us-ascii?Q?7IOQ5xPQMz6+O/T7cQpMvatnWlz9pA+XuL4/PqfymmfM1Vapvmpefa1KyCwd?=
 =?us-ascii?Q?kNPQDQQg8Q/kXhR4S8XUHsoISjrnD6CZZ1uSOEMdMEWSJkixzArpQDhSQ3k9?=
 =?us-ascii?Q?3/ruuLQoWYWvvoSj5IUiLJAi9DKTBAffZ6QvDBwXKpD0BSLITtu8uHHZUUwU?=
 =?us-ascii?Q?PlauXJaEbOmdIyh7UdjPpcqrX/np/161+rGkVUEkdocq1scSftN3sREs3JHC?=
 =?us-ascii?Q?mERBQu4+OH+/WIKK7dAR4NRaZ98Cx7dWJq5jmi0GdFcsbdgJx8J4TqRqHk4/?=
 =?us-ascii?Q?sR/QhrbkN+TwZyfk+c+DyOIjwDFJ9kLtXRnktpo41mMVtSZ8TBNuCSg0Kabj?=
 =?us-ascii?Q?6Ax2LZxwrPCO4ffD9IJ9EC098w+uvl8/p1y+w9k6WmCbqtV+rRTUlRuVQtdS?=
 =?us-ascii?Q?UmF7CGx6eC2gq1wNGxRtzOHEHbNsRBRdlnTFkZjp4eE3vxefLVKy3ejCqZnc?=
 =?us-ascii?Q?igJjECbEpm1UGoRBz3U=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ff025e-1a8c-412b-61d1-08dabd0ecadf
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 20:14:05.7956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hc8rIVF5Tz44InEwnzBGfVkU1Ydmv1zNT0KByv2yEq7gDfwWcyzGAWjiq8BCyNF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5239
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 02, 2022 at 12:57:05PM -0700, coverity-bot wrote:
> Hello!
> 
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20221102 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
> 
>   Mon Oct 31 13:37:57 2022 -0300
>     91b4be750274 ("iommufd: Data structure to provide IOVA to PFN mapping")
> 
> Coverity reported the following:
> 
> *** CID 1527090:  Null pointer dereferences  (REVERSE_INULL)
> /drivers/iommu/iommufd/io_pagetable.c: 417 in iopt_map_user_pages()
> 411     	list_add(&elm.next, &pages_list);
> 412
> 413     	rc = iopt_map_pages(iopt, &pages_list, length, iova, iommu_prot, flags);
> 414     	if (rc) {
> 415     		if (elm.area)
> 416     			iopt_abort_area(elm.area);
> vvv     CID 1527090:  Null pointer dereferences  (REVERSE_INULL)
> vvv     Null-checking "elm.pages" suggests that it may be null, but it has already been dereferenced on all paths leading to the check.
> 417     		if (elm.pages)
> 418     			iopt_put_pages(elm.pages);
> 419     		return rc;
> 420     	}
> 421     	return 0;
> 422     }
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1527090 ("Null pointer dereferences")
> Fixes: 91b4be750274 ("iommufd: Data structure to provide IOVA to PFN mapping")
> 
> This looks like the earlier "if (IS_ERR(elm.pages))" should use
> IS_ERR_OR_NULL() ?

No, that exits the function, can't get to this code with a NULL or ERR
from iopt_alloc_pages()

It becomes NULL because one of the things iopt_map_pages() is to make
it NULL.

I think it is complaining that on the rc!=0 path of iopt_map_pages()
it never makes it NULL.

But I think I will leave this alone as the protocol to destroy an elm
is to do all these tests, and an open coded stack creation of a elm
shouldn't be asymetric with the heap allocated elms.

Thanks,
Jason
