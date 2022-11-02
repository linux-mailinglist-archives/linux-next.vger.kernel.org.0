Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE909616E40
	for <lists+linux-next@lfdr.de>; Wed,  2 Nov 2022 21:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiKBUGO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Nov 2022 16:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiKBUGJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Nov 2022 16:06:09 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C38C624F;
        Wed,  2 Nov 2022 13:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRFKVM+CsfKMNPSmVMU/KGpy/v6hhZUl9YqIzbGjDi5zwScJEuPLz/0Bqjl7lKUJyL8fhbbpPa3/i8aXRJeO4glYoX8he7n2U82XcRRXIYglv/RzrYdd8a7ksZXl0yrOfmJdlk3mE/bRgI07C2p5ADxbF/TAjZdwswmOdLEo1kRV3Z8HCmf7PRG5/1IavEc16OVJvbu5+zPN3lZu9eKyHSie1hYt0bU4T+/RlUhVUkoOdAqIArxIYtIYT0jj8iogID7YAEMhm62FSlFBVd1L5WQuzPaWMtd/RwOhY52E14VpzaqemoSYk51Q+4QedSXLRCLXuCxeirq472kIJQMAZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2+SlPonA3cs5v1l4v+SfwerZwdP0GXqoWXL3Zg79CE=;
 b=T6gTpZLCRMZbOlKX1Uq2S4vrLj2CtWYEQTvL3USEOYk9sZCQ7mhUHM3O74TxmEkNYLzCdXfJBdmj+JhY9n6txspbiRqAumFVfy0Ds7yPs2L5FU6ovrwKzWR5jQanV3xCyUlrhCeSIK4Gbi+CQGG+a8M/BRuKlHhBVTNK0y7n/6iNYFv0YTymL3NGpX7pLILXjMou25wEEfl0Gj++sjCPTNft6s1zsCQdhlDFnB0OzyXTv4tfSqlS2zjOEenK0SpbmoYGaen5ma5UUlVfYXvG/NNIhr2N/LeLnvIusdZVtEVq7x5GpBXIkMxukTxB2vZ+5BrfoJhJpcOXpNBHAHVRfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2+SlPonA3cs5v1l4v+SfwerZwdP0GXqoWXL3Zg79CE=;
 b=o57XHW+EDoNV5uh22UZWGntBN5RQxo+AEOpAEP+h33P9DdbXLQQD33bDtftWVVnsfSZ/aFf8UYWn0JQqh/XPIeyMNUA2/B4CTbZG27Ga6Acezmtk/0mFOPgxyu+P2NrrEkQbyDquPT1re2HE20WvXkHqOz5d0XFQx8jKOMHVcnxILlHEpkZjulA+Bvj3rwQyjH/ibcKZrhfrJnQ9zOnNEAYTzwADLQuQO3tveqEFxO9d28fv7mX5l5/pCJH9kc8SJSqDQDunsQKZGytw4apFUpY3fEj59sFvuMIYCUALBBGJjrvrtN3TGWpp9tnr3RQpOEtGq9aSq1BZ/78fYe14Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5818.namprd12.prod.outlook.com (2603:10b6:8:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 20:06:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Wed, 2 Nov 2022
 20:06:01 +0000
Date:   Wed, 2 Nov 2022 17:06:00 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     coverity-bot <keescook@chromium.org>
Cc:     Nicolin Chen <nicolinc@nvidia.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: iommufd_vfio_iommu_get_info(): Code maintainability
 issues
Message-ID: <Y2LNqO2jpDGw41oM@nvidia.com>
References: <202211021255.505A44F5@keescook>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211021255.505A44F5@keescook>
X-ClientProxiedBy: BL1PR13CA0422.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::7) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 8373561f-bac2-4c2a-c508-08dabd0daa1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K69JFfifNOXTfrhLsCGvP5fzHMljGnPf8soXuAxjT5HfGS2C9Nr1YZLKcmYCiyjRoJV560WhPLWVVILDXpqZGsjKZZ9D4AJhodJnV2w55hTyf2HW/IV6Wk0ffRdjyxAKVwk7LK8yf1oTq6czyuNU7n34j6r/3W41IRZjW4K4yggGwfjBW05VeyPIRuj8Uw3yACdJvvBMsZcnHOzoPVaaPP0riyMqp8g3bCgpnx7t2TKW5Jdzp42OCB29eVty438UOQfz/kLCQXX6QwDaDIHaih5kg4YCQcrgEpLxu/e4cBUQgyPSyKz0p1lT30uOiaH7wEyUOI0BgoDvesyTdq/1Uiv38M2eF1Hq43+Qhw012kM9MkK8vrjqLdiUhlnhowh6Rc4TAet1VLR4dcivqei+EjCmaJeGT6BjS4xgmFNkUznp+bekRd4Xn1QKUBzIFDCeIw8AP25t1yHfdos04JAD90RARMCvU8Ja8DDoyfYIOt6LSGT7taZni/Pk5yCTHRS8/BtkiFYbkYL8+S9mjKQKRq3mURN//OCfQ+bgyd9FHZ+cgnLAC3H8zrkeCvZOAiIaSRmAVDXXL1LPEvLjJrIb3jL5mo0gxX5BgH7JcO5v5QEdfItrCNNy3OdB/NVlKjOJLWocjw+vGiJ20FZAG7Ty4Mo9D7pCovy7tmUxWhE7VUwLF0vaf7jteiNZMAPfmn4SdBuHCctu0/XTNig+Vfa6ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199015)(83380400001)(38100700002)(86362001)(66556008)(5660300002)(66946007)(4744005)(54906003)(4326008)(41300700001)(6486002)(8676002)(2616005)(6916009)(8936002)(316002)(186003)(66476007)(6506007)(6512007)(478600001)(2906002)(26005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wd74GoJEkT9KRI2kqk8gdxx/18ee19ARE/phT8bPW/U5K1Oi24ssCRpIvGJQ?=
 =?us-ascii?Q?O9A+Ptz90FQB+PU51x0LGI9x7/plSuW++vBOf8BIegRItpNcrioJL8REJl0v?=
 =?us-ascii?Q?ja5Aq6WxjxzITm9vFj5gCxSlu8a9NRR+vEbWs2ci62Lvg0uzcaaJUVDYFfm9?=
 =?us-ascii?Q?8cmu74etjc74UeXbler0GGz2hwXndujO+mui6kTLnK26HXjDARQnlEw5s/u5?=
 =?us-ascii?Q?HJmIp6RZJT/iDhbFAyXwRoEFGBOZXxmtcwZxS2PABSiYGojt77LaMEeg6olH?=
 =?us-ascii?Q?4jbJSIyBTyvOYFBVhvsWs4arMTVcgdNuaB8jkqh8Y8RbEL6QTSo+S2x1F7c9?=
 =?us-ascii?Q?HKhfZyeOHqvOjgzeLFMO+KObfrYLLgNQcBD30+MMFFzlL8KR0sR896TLrPMv?=
 =?us-ascii?Q?wcFqBuloOLRgLj0xjoa2w3wC52foP7anW+hgFpu2jPCJ2eeltTbpF1a7kcqw?=
 =?us-ascii?Q?Jg5Eeks4Fenfdwnsq3UBA4aOsSwo/MBIJ7HA5ESFq5R+B/AtBKrIwfWbU2nP?=
 =?us-ascii?Q?EMO2MJLmdIQMGOwZ1jcC+ZGVf91tSPo4YWRnPpMvI+xfaGFoibexz0PEx50C?=
 =?us-ascii?Q?VDvMDmLHh+7cYsun581WUPno/m5eatKDr96ySwS1xS/8v76byy+I76kIerLZ?=
 =?us-ascii?Q?HqG5oJ3KMvMlx80E5Ysyx8FbbPYqXlYkWEjYeLkilPXnS/s0Gf/eHOfgLgJP?=
 =?us-ascii?Q?ZMVjkKztUXRdUPWj/7hLG8YyMeEXp7dDU7pG8d0nqpEMVDJ5FqDIi1auPISW?=
 =?us-ascii?Q?SIe+w7Tlc2UknZx3LQHz4JYkuVei8vYYP4EvGbq6k8UdozZlQdUSlbCUOj8x?=
 =?us-ascii?Q?brljDr/SuU+h5rpXXiusDhUSm4LZ48lyhFd7l2L4FHVvOVzkLJnpvCFMniyu?=
 =?us-ascii?Q?X78TlzywUVnOqPxDzV5gaHZDk5a/l1hxtrUC4ChCoWQLWpPLrdWA30dVQxmn?=
 =?us-ascii?Q?p0K6UjEEdO6rxmaokiNpC8prAz3PJK10h5JrozavXTcuc2vC3f+R3lmt4nle?=
 =?us-ascii?Q?b32ti70wnLHaVL9XJIYXbTTiWQLPLGDIOGdEqeQ5bEEB3KknuDAAlAYoYaUc?=
 =?us-ascii?Q?5kEdzU3saABE3cV9+5nopbf9Y2M57EJacd60HoYcKiYSCEqcmPJ5UtxO8ZXw?=
 =?us-ascii?Q?03ZkVLVkHbOKQuV2ZfDW1LBpvDvN7rvQProYFN4f5P2E0JStN/UrJDUJyVcd?=
 =?us-ascii?Q?QPJMsSFsS5rlZMnSLcs9aJFT1HejHyj1+ax6w9z77K03k81PupPFFxSGqfq/?=
 =?us-ascii?Q?01LHeRtzLdQKRT0sKpEThL5f3l5fcQ1K/+FUm079e2e8oQQsku+odmqwy8Yn?=
 =?us-ascii?Q?S8KMUvEKsFnFKXz0ckkwuYCBlwAwkkIlT2YwtJrJoOwrQDiYzJ8m1AQNHh4n?=
 =?us-ascii?Q?gP16qEg5HbaZPNdE0olCaWgaBKP6p0F4+QKMKUbecb/MubnpuzVj5xuhrhfJ?=
 =?us-ascii?Q?4kX+zBD4lfyyTql8zMmK8cMyDwGYtJEIKqWuWy3ZGEutvUHBUJV27KG69Ay5?=
 =?us-ascii?Q?6mHu4run7qEPK4G00RX/aWSe88iCQqhRyS1ii4tv+VBjEFEcbxCDoP8FwIGs?=
 =?us-ascii?Q?2erqrSoiDgCqNy8kkWY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8373561f-bac2-4c2a-c508-08dabd0daa1e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 20:06:01.3807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88NDRk3g2BrZVS4HfbbapUpk5Ysx5BIfx6O44bMfhGs6HZqxgd2rf/O1bNjHxmDu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5818
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 02, 2022 at 12:55:21PM -0700, coverity-bot wrote:

> /drivers/iommu/iommufd/vfio_compat.c: 411 in iommufd_vfio_iommu_get_info()
> 405     	 */
> 406     	if (info.argsz >= total_cap_size)
> 407     		info.cap_offset = sizeof(info);
> 408     	info.argsz = total_cap_size;
> 409     	info.flags |= VFIO_IOMMU_INFO_CAPS;
> 410     	if (copy_to_user(arg, &info, minsz))
> vvv     CID 1527093:  Code maintainability issues  (UNUSED_VALUE)
> vvv     Assigning value "-14" to "rc" here, but that stored value is overwritten before it can be used.
> 411     		rc = -EFAULT;
> 412     	rc = 0;
> 413
> 414     out_put:
> 415     	up_read(&ioas->iopt.iova_rwsem);
> 416     	iommufd_put_object(&ioas->obj);
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):

Yes, this is legit, we already fixed it

Thanks,
Jason
