Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC0B616E63
	for <lists+linux-next@lfdr.de>; Wed,  2 Nov 2022 21:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbiKBUOd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Nov 2022 16:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiKBUOc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Nov 2022 16:14:32 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24EE2C6;
        Wed,  2 Nov 2022 13:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1uvMVHfXC6VRZqmu/i6BrdmFLuxj7CjtxYJQ65xVsXxB6OEJXLGnIVv5wXupWCojqBGYJS7ah9BL38QFEh/SoKHFtUNjzksWmHvr0LEDqvOCKvue9fxcDeGu+GixAIpqzYnFT6+k3VL5h3owvZFFYhRjDWLgpaaee1sAGvDW+8FgOZSqNKxUBPqOXQp8nedJE8K89M8X/3oGXoUh7dTlQEtfuOG6FbwED0BZHNEQBrrC7ROQhjznhOym/dZjuMG8azHNiAbrH3fB5B7dqwVXH7eSkJuBaO7S7jA2j8NeDWYkXGL0Z5/CpItn/ozyPKOW6zo+x/zv92RqqmK+S6rqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDmxyyNYjA+HaeuGyujLTqQ3rxyNBto876TY01Ag1oM=;
 b=EzZHmmHKDpA989BO7RXSVnzwT4p3z6MR5Uur4SDu+qMEksAEHDzhwJFfuKsc4ZmMFtG6XkMUq9OngxvjkVUIHIVaXf9pwJ1ikQv4kL1BZja+HD/QZn60s+9MML7lfQTn9XciU1N1dtPGhbE8mu5KDT1v36kWNq1o7mtAIWmqnUXTEnnyZMAzqMdxsHRCW8fCuj5O10gQBQr9dPvR+8IawhD2GlXi7ir71JH7x0rhMWR8jlqCPbHTeab7pz+hMEIWFOt5nsgDGqlxicpTCn4ORs2LUhglWNXDJgw2sVikoyJtB5EeSwR+Ktb4s3clyDkUEBfxGTsjSPUj8u9B+bGukQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDmxyyNYjA+HaeuGyujLTqQ3rxyNBto876TY01Ag1oM=;
 b=JejFMMaUF4/jVIdLs9eRX9CsHwId2I0J+Au2QvHIjDEj3YbvG5U1L3zRS7OcDkpP3JQ4adDR8WC5jkr6Q+KpxlEHvKFpK7s9DZJjGuYR+DJcx/pc68nDSTcqL/MivOv09cUOOn+d3MLgrSeBl1iIOoOG9miCJxdjH6Dk2/3MPPp0KXn5DYn4qzqH3mfvKQq9d435q7J7UGqoWcrMq+8ftzsvbOt7JsxhhBNHJ+oDg1Kz4iFeT3vbE7Itw9NLN9JuOU87+eNhI2G17tQMsu1FnoTDEvzLPjfyLWAUO4qLU6ksd6MIhpd4wQwG7w9I/yiESJ5ECs/bEBNrlFjn+riB6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5239.namprd12.prod.outlook.com (2603:10b6:208:315::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 20:14:30 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Wed, 2 Nov 2022
 20:14:30 +0000
Date:   Wed, 2 Nov 2022 17:14:29 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     coverity-bot <keescook@chromium.org>
Cc:     Nicolin Chen <nicolinc@nvidia.com>, Yi Liu <yi.l.liu@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: get_md_pagetable(): Control flow issues
Message-ID: <Y2LPpWrCK8rq0lIO@nvidia.com>
References: <202211021257.AF0B3BA7F@keescook>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211021257.AF0B3BA7F@keescook>
X-ClientProxiedBy: BL1PR13CA0280.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a3f4f5-0bb0-4490-9f29-08dabd0ed9a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l6/ChdgfuOcnP2ko2t5cLvPFfFscSuh/Wl4xXvYxBd+74JIOrdX7QJGKdw8hvxaEGAeB8DAHhXJ8w/KE0j6fCMA1aXj44CaBUW/+r+4OcZsto+TcsjgS+Z28j0AsdiC7rUOiM0Z8KowKUsLhgZpTQqfT1P+L72SeWmpHPGDIKjRn8Q9+dRSKpPpwxuiRdMMN1fCJ11ngqmTYjc502lqrSUeiqvMcfJlWuSQjS2Sm78wnONOzscqTC0NN+fahLiWc15OSnQyi60bx+9YEG5R17IdIwNSG8PpnMi0xvpSQJP2rM3czt7FzvCnGjV0eW60gxBR4vjVI7+8ekkxn8E2SCHXYS3IDt7PJF2gbB+m7rv/TI8plpVN4oT2ZCznzUrCNcOjYVA/p7lbjk9nmVBFYcC8oVOaercfJyJ9DbV3Tz49BZ3032uUfq3pA5dTTHucjQD9bhgd6b+BVRGadSPuDN2ZzcbD+V11NvFU0ANIc6KLhxdov9LucOqY8hBi+TIgctjFG+bsP1W8KHH1w4v5ZaaYZKY4Y/PBUCsdFyOnA90jwd6X1S3zAcUAErcPkADqhLTJffwLNYDn7t3ueagBzmJVcrZF20GcUebp2Yq4iPS6NHXNnkk4bMJeTvLLHSLgrzLfyEFA4rECpf3ybQ9/nyJ348MceoorDUvLuTgRdCfC6e+3fcd1DOrJWIvPKKSRKw8supvDNMR65nXa8QAu8DQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199015)(66476007)(66556008)(41300700001)(5660300002)(4326008)(8676002)(2906002)(86362001)(66946007)(36756003)(6486002)(478600001)(38100700002)(2616005)(26005)(6512007)(6506007)(186003)(6916009)(316002)(54906003)(8936002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UAKrKUPkAyxdevn+rTrYjGeOypFJVWmwGX0FPHnNkMC78mAtItFel0RmSjQj?=
 =?us-ascii?Q?1UXVUhXe0GC1ak7gLgXtbe7+vSWMrJD3vL8T74nDiypoe+O2gfQfcGyWd4pE?=
 =?us-ascii?Q?gpZUiF63TC+vTRgGyek/XLW4FU/PO6TD3ub0eXpTv6Y95TdBION6ajC8NqAB?=
 =?us-ascii?Q?5onWzKWHyPoMrqRoyNxBVGg/o9ZMLvwlZOLxapUeEqq9AobTjo1Vj4T5r8YE?=
 =?us-ascii?Q?kxTJPD1TltJO028WWphjzI4p6FMIDnN2+UDBe6JZ4iXuIdCi4wf/W2Tf5+h3?=
 =?us-ascii?Q?tr7ETtYwNInmfPbLX0bbsf+oon3h9ui2dOsEXaIMQiTeBqlfI5jZZipOWEpd?=
 =?us-ascii?Q?O/126lJrMxEzKRaCUhamO3cy/zaGxPv80KTIFnIJZ+rWl7V6+5golYNmXT3s?=
 =?us-ascii?Q?s/ZDgV7ePzqw7+AAsx1hiz4dt9VjZW+KL3fe/LkaD2eN8uZ/NDi0+eeiiK90?=
 =?us-ascii?Q?0le7vF9mhhnndmEuRP7Fv4R4y1kXVRKgJko1VG8yG0mx462SE+ib1dHvT3mL?=
 =?us-ascii?Q?Z2UKZ2sN0l4S0oKHYXz62pS8xUEnYMFH4m0xNKSmknXS+McsmonpM3yN0oMH?=
 =?us-ascii?Q?xSR60BkPL/5Y8C+CuEYAEIsFn4E196gNjoE8efT1XR5swECT6qcp5XN/P+eg?=
 =?us-ascii?Q?CLgNt563kGopcvWY6DV6brM+yzyn7Z11JJwkKEwiWXdwTqZ6cMxZKPAw6oJA?=
 =?us-ascii?Q?1vmDLhRVwWEiWq8NgfwKoZ+pym/rj4yBx247B7Q2l43SpboicNQTBbKsJcJC?=
 =?us-ascii?Q?y5XQo8UtAiwY/oUynKJ3YzMcuWzBLp2G6I1DzRSH+SnrwrcC8FzfkVUr9Mvj?=
 =?us-ascii?Q?zyTLBChVa8asqRFC60y5zrQMI6WzRNd3BOaD/QatPn1JW/Qrc7didO4Bw/2i?=
 =?us-ascii?Q?Df1vYgaQJTh4U1WI3ZaCaQy1WPtQyuGYU5xWBKtkFh/Hr3aGrCO8VO8R6Lb9?=
 =?us-ascii?Q?em5uhiA2e2l0vYHIFPdygGGBwzbnocJcHchF0RLR5NAFIQO9AEMvO2rXxQ2D?=
 =?us-ascii?Q?eX9wRKk5pgwVMSDzfuE4botLMJzKkLQSFCyJ/ByuTuQ0amkLy4/LouyMSBoJ?=
 =?us-ascii?Q?PUocmh6bt5C8DZoG0d+Io3cJ/bOuS+WUbiFWQnv6VW6fHzxn3vUltPMCv6+K?=
 =?us-ascii?Q?/ui51zlQAI5F3xMl3JaBvpQuCKF7tJhPtkszE4eqnlxGlR3u5rapno+EHv1U?=
 =?us-ascii?Q?NjgFjD0iqh2SBcBXBLqmtpbhWhKLpC9ApPSxy6vAf20EcVr1yFs1caHiMcF8?=
 =?us-ascii?Q?iEqcCot28ZmV5vx+vPbq+oQEO0cP8/4q+dr+XoFI+7cqohstdpFbAoY8fr27?=
 =?us-ascii?Q?6zq+wJKScoRXjKPD7nGp4J9F9xpwm+VWgDT4uSsDlm6bRqdD+4J1Td6YbAiz?=
 =?us-ascii?Q?0X1w8CeOTXDA3k5PntgO3iXIwm3PP+0fhbBLB+AJCuVeuS8i68BreYuwe8Yj?=
 =?us-ascii?Q?0mqcMd1/hYlDULF3RcP9yYi3W973wMcdQsG9w/qleoUoyY1ZVAFITDQfQ7be?=
 =?us-ascii?Q?xf508DvjHmxi7xBeZrj0Z5uW47VJ65wV7KuA+QAp/JLZcVWLgeMmh00rEI8M?=
 =?us-ascii?Q?6fBUDo4NzJ5MhZCOolI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a3f4f5-0bb0-4490-9f29-08dabd0ed9a1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 20:14:30.5703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kg2pjcp1WOf2q0zc15jgsuizoP7TAK5MTH6D+cE0EKdKHPZ2bw3a+jaCMGigS9j8
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

On Wed, Nov 02, 2022 at 12:57:33PM -0700, coverity-bot wrote:

> /drivers/iommu/iommufd/selftest.c: 248 in get_md_pagetable()
> 242     				 IOMMUFD_OBJ_HW_PAGETABLE);
> 243     	if (IS_ERR(obj))
> 244     		return ERR_CAST(obj);
> 245     	hwpt = container_of(obj, struct iommufd_hw_pagetable, obj);
> 246     	if (hwpt->domain->ops != mock_ops.default_domain_ops) {
> 247     		return ERR_PTR(-EINVAL);
> vvv     CID 1527089:  Control flow issues  (UNREACHABLE)
> vvv     This code cannot be reached: "iommufd_put_object(&hwpt->o...".
> 248     		iommufd_put_object(&hwpt->obj);
> 249     	}
> 250     	*mock = container_of(hwpt->domain, struct mock_iommu_domain, domain);
> 251     	return hwpt;
> 252     }
> 253
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):

Yes, we already fixed this, thanks

Jason
