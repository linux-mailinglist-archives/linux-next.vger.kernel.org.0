Return-Path: <linux-next+bounces-7493-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DFBB01E95
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 16:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CE837BD50A
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 14:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915A02D29DD;
	Fri, 11 Jul 2025 14:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jpaWr9bC"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B150A2882AA;
	Fri, 11 Jul 2025 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752242657; cv=fail; b=P9dw5eOh3n30CXSpljOcfP8p13/IFEXONkuLf//C0mJO8iZ72X2Hac3ZKj6jJnbE7oWiz0g80E3r57SAP6BOD7Pk1Z9ineaQDMQ7Tr0RMNMeydHed6s9IGwb2+VIC2yp7KLqsheJexJ3JmRPWpaCmH7qrJsTum2VKrtUlAYyRK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752242657; c=relaxed/simple;
	bh=oFAV31TfIZNt3WtBwnvITfc3spbxxiJn8TPRPxxLfL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UYz+ztaEJlbdQ9ww/z9EnudAjj5wOKBXAt6dWgIwOWBrife/hL7NEcX1oVj4aBqtNa09pdGFUem1iuL7ATMBvfxbc4Fc+anFFfQ007wXQHZyeYH8yXVT8g9IExgreT5EBBLZyXaYivZpSEcvob6HLwIOnPQNRlT4EQypAsHklOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jpaWr9bC; arc=fail smtp.client-ip=40.107.95.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNnz/RCFgGpXPP01uIOIP/rJAgheL3KufZ3Ox/UqRwXTbY/b/uVfi2cJdyLG1YpKu55L2YKHUEpeevayjTvDD7lAHjdwUkKUg0OE0a6V3Feu21D0BYLkft6P6Ci/JmoIn7QvksY33GRNinAfMlsYYxHmzOhwO5ErpmlMKZjcx6aOas1rvFfLnUYlZq1cArlQarRdrQQLkZuWlg6k5um9Ui7M8/eA//GPadatJkiQpidoPdgqBImxtYPsGdfxfmRZR+z9kjDg+Mh+pKehcASnvbC7zRjdKkd3dMq/6bd0rRcF0B3R55qLmRJQJ8cFNIY2C217zRUs2RRqdf0B0yKQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nf/19uG8XU45EFqz7rxFP4Tv53lCQy1D4IgARLKsxyE=;
 b=Sdy86gjPo7jYAwMb5umG2cmZaUVyZd789ruDmqTgvv4bPw8m87LK/LibqOG/R5Y6qcJpYWq30/8b5OGsftnDr0u2URFCLXwHNEIstpP5HzSL9++HL31tdEt0xjYPP+NPD+l8pj+vlwThuPe1MD7H4WlHrauGPNAyoT+wVvCijbDay9jzmifVGS1QF+EBgvrUr5e62YRxGb6GZYEToGvrJiq3VuE8L9zWIeOYdIJ5w0NtWqWjHGqEWzryDwoKpxlh9DOQbFQwgQwK2w0MHpq57oNY1GJUWCgH4jzPR5dtBnTS6smwz5MZOv9PrAnnfo/9/fvOyI3Pf0LuQTqMZEgIww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf/19uG8XU45EFqz7rxFP4Tv53lCQy1D4IgARLKsxyE=;
 b=jpaWr9bCxfmc9WrPoh6pHubNbMtjlT4wAix6/A/QiX30XBrmoFLR0qO6PLVdALP/5ffe5qQ0ebynwaaMJ9yVVwJXBabg3BjvGR2n6YE/tCM52y12zHJtwk8xek9zbdhNolUsjR2zR06Ft/C/hacbeyE7afqdnDasJyV7RmHz1iyXznE7UgLkwsfemp6NJF9lb1ZyW+uSZe/ly7ZCQ0yGpaivva4ifpxrf8tTIjc3vkbbNReB6kuJJUQwAoBxayA2EVCkskxfUUBrmfC1fMZ4nOXAT8KtIKq8YFgiHvJip425V0AI4u1VtawLRiolzVPDrYGCOH8Qw9hC6yQx4lt/0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH0PR12MB7840.namprd12.prod.outlook.com (2603:10b6:510:28a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 14:04:12 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 14:04:11 +0000
Date: Fri, 11 Jul 2025 11:04:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the iommufd tree
Message-ID: <20250711140410.GB1951027@nvidia.com>
References: <20250711183526.5c9df5ea@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711183526.5c9df5ea@canb.auug.org.au>
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH0PR12MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e6556f-3510-4506-e1ba-08ddc083cf63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K/WJEi+DJL4MIAbiXEQuawUCiMMnMkzM46vwuZstoUUQRYVB6ePorWcI6T91?=
 =?us-ascii?Q?LcTMVtVKN6av5JxsBw0P/Q+cjlPyfbZdaOQhnHcf2gQ0MJ0UbzgylPmeIh2a?=
 =?us-ascii?Q?v73weoZTGpNSSkhtHBEQvNmsf/CjmecR69Eqj25dcyFrMuOu8BaBy1WwlEYf?=
 =?us-ascii?Q?GIcvz+O+uRuQIN9lHy8L8n6JzRu5C4Kg6gdwCNAQIKqoz5cCOJlb73bh8kQY?=
 =?us-ascii?Q?5ovrkwVy+SpSm30YY5hED0teHKWd9VTfnjW082iBYyYrC/aY2kd/otGh8eog?=
 =?us-ascii?Q?wArP3zPgvMFPldNfd+ffBldClKcwZ2viF7QmPNLUWEUox7onPCoZPQANVumt?=
 =?us-ascii?Q?k54iK31Z60Dh0VLbEavfurMldpi4Ae79mszjW1XuEZWyVyhdgQTxFx0JPp4H?=
 =?us-ascii?Q?0sG10TGF5lbY74jZudIGnl5akDEnqGrenMw3HMxnVPJCirEXUMQh8pk9qgfX?=
 =?us-ascii?Q?9Fh+VxvywjIYvhAN7mZxxEWm0hNUt3+Ehzg4r+8vokMBj/Us3fMisoUtD6ad?=
 =?us-ascii?Q?UexE5eujbRC92fqL5HHppGB73D9N91hdkhzS3Pw+5/+sI9uAmDHKGbc8D0O8?=
 =?us-ascii?Q?/sAOBjk9eIZsE+dN/g2nnLZrLwhj5eqAnLu0YaRb0A19YxPWhDPh2LgPIkjY?=
 =?us-ascii?Q?OQMoIwgkUl+DuYOjgQCCxPyLOZ9oTYhBpWXOFrwzQjdqfUK9hZOX6CXVo79n?=
 =?us-ascii?Q?C1k2+vg1ILuvPL+L2uDYTu88Nl4DnL48wphTSUkn/jg7ytvCopSS3svnQUmr?=
 =?us-ascii?Q?81UNHPaOSvgdVsg6SoEXCSAzFD7hqhbd+69fV2PQcmQsUA0YYPj+qWhDUby6?=
 =?us-ascii?Q?CTK1K8Cq1LHfY4LQz+In9OGH5t/yjW2V/3T3o6+tx8n9koUjmzv5GU+t2YdA?=
 =?us-ascii?Q?rRuSoQzUfxV81qoYuoyxrV0nqDZkEnpWqMPJFwmuDEHSTchkUC5lRLBFQ0I5?=
 =?us-ascii?Q?a0Bpvl8aZ/Kb46zRGy010tRPdnVTmjYeaxzaLiG4TY/z0Ya1Dv52LkkLJR1h?=
 =?us-ascii?Q?v4F//rLvM+F4ouBBWY1wtwrv5tKwipWsknaUvrEY3OrQBiECpgvjuKFYp21F?=
 =?us-ascii?Q?YIzvQhIGuQiT0TqIVqd04ed/0cFstkAkvWiOrAdyNmeultwVJQ0Ou2m4F5Fn?=
 =?us-ascii?Q?ZLNGpobKQrF/CWrQDXfkPnZlUiNWQeAcxiC1wOHP03wbBpY4p4nWOP0tk6ZO?=
 =?us-ascii?Q?XZ3JKnYLcXU8REqaowsCoRcvd1WiJdj8HOua+hFqFhcScwdXgN72lN5lkEj5?=
 =?us-ascii?Q?JURF+R1aj5AZKgR726fjPEvkIFKk0M4QFofaIj8y8ZG72AUjt5eS8yAx1XEB?=
 =?us-ascii?Q?7PR8g2bmlk17yjTuEw1oqq5i/gAzDWcmgfQe+beIkgCawMVLC89zUt4hfjU0?=
 =?us-ascii?Q?8v2GJEDWTpdFARp40DCfaPUUjutQKkt8M1V/xVfcoagxq0vBTnNhRDdWT/yT?=
 =?us-ascii?Q?YzEPSanDvQA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ukN/pi0h7srzeNKq0wkGsUr92HYlg9DDe50oz6xybN3i/98QM/LwEi7rrvYy?=
 =?us-ascii?Q?7yAEXKdTscmGOzy6Lf1nJ31R3tkiAzsE2hGetaGHXe0f2P1+qCUyF6pgKV3C?=
 =?us-ascii?Q?qNKXSScyRPBVBfBJakxTrz8iC8D0GPniL6CFY9fSqdXASKPb6UUkkakUIaIo?=
 =?us-ascii?Q?zMEU/GDQPSf5Lq36Sg24hKdvk8E2FN4NQxLEeE0r2dfRcfMKd47ZOYRTzlkO?=
 =?us-ascii?Q?bkLeBOJiUeq8emFv2B7erhLv5T44qDUpOdbsEkzcjo0uL+ejoPblHsx5QMfB?=
 =?us-ascii?Q?c6Lrbo8ZDP0bl0EjHBn+vBeBlrOOxmQIjaJeXMgTFcW9Q0bazuX5zvyGFMHN?=
 =?us-ascii?Q?MUDs6TPzRnk5B+rbSw+aE7iuY9Nr9dbMl96Kf5DwCJekf0CnsAqDdsUtqOax?=
 =?us-ascii?Q?5oSo3iKEXprYMY4KuySOlpV+WNOq0FjvHHy1Z/s3mJ1+rj3KPWVEj8wK6Mhm?=
 =?us-ascii?Q?g6tHcDaFo1HPkZIMkHQ58RmjCd94okgQ5jryPzY0NTGtOApB9og7Fs0FBZFT?=
 =?us-ascii?Q?gUJTc5eZD4uEBShy9MwhJ1dXFuEbfDwTTVxtIrVby1PifPOTLO9xGsrQt6xV?=
 =?us-ascii?Q?HN95i1OBpQWNi3KwZjqSEu7zaGJOEKCmw4k3HvrAlTR/F/hVXjcCMFPOken6?=
 =?us-ascii?Q?X+nG/CgPmqYz8rb9GJ/GVZ10igLi+JIvtDQGzgDtInkbsEGZh/jQ1CKF6uLw?=
 =?us-ascii?Q?v1mOYqfs43JD5YXH6uQMDH2tGVGhl3OmuFN8MwUgP9vku5wsg3PrJc6Wt6im?=
 =?us-ascii?Q?8FEs1JUIDKhBbNp1GxjAPx6UgnaiyTeswuVMnJ4T8+4C706LejHb7xBz014R?=
 =?us-ascii?Q?QgZvO8nS2etaouhbxlDcVck0bc7l1+lpit5Wu+h/a6AJOEtkBmWoVMbFNMSC?=
 =?us-ascii?Q?PwBr2EOZbWCu/JuvSFnqaooqDuufpmIBU5UgVFIxER40gxQFD7qwGY2x6f6v?=
 =?us-ascii?Q?SVtsZCONXJwh4ONCzi7fhmqLFvD2151l1oUsbeayFAC9s/yjJGADN0sReQdH?=
 =?us-ascii?Q?FHloDXFhTPzvsaOxjdnMdo9U+pGZJCRUR0ZC6tLGpYismlckIu6uGbYFw4+U?=
 =?us-ascii?Q?a09CWERNv2yVL57K/BjgnRszpkC4F2pCRlxblpsot8P4TmDPgxQBsGopWo6m?=
 =?us-ascii?Q?p9uBzUHxaG7o7ro4mq1QCL4u3EC7mcIcPjB7qabSNNVPm1efR1REcLyhtffd?=
 =?us-ascii?Q?sJXckYy4+2twpG5wSav1U5weokccVR3pYc9zyAFNM7yDQOfiZf23C+ge3auc?=
 =?us-ascii?Q?dmkS6o8hax8D/+7bgqoQGwH9MZX6kPL+7933Smiwjp16GFDUNQSJybgOCdol?=
 =?us-ascii?Q?+blRXJDoVQZIIZVpdwyaC/jCDA8fV95prvjjb4XlsNCLXMWlQZemmuQLAAGe?=
 =?us-ascii?Q?GqkYJTQkNeWfs9wziuR0x15TEMbknR6/UejEJ6Zgnv7mMTYO/WzgBSaGLmak?=
 =?us-ascii?Q?o1AE7Rz0tBhNKySxBOrt5zxgZOOXVCFLuFwYVzmeVgkOxkjwHapSDTpqXbnJ?=
 =?us-ascii?Q?sg6CdHEGoJLhR17OslTttUY7OtaLCdgl9dtJye9oie9b7bAFkgzdPyH8TdWO?=
 =?us-ascii?Q?zTlPrvGJjN//f78bx5WHeFFAAKhajfZmvJyKS1Ao?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e6556f-3510-4506-e1ba-08ddc083cf63
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 14:04:11.0962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zhl6JabSqzxTY4s9krrG/Zee4GDBWlytSoMGDhAmJr/1QhuOt5dDQr9yyTWB72Rd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7840

On Fri, Jul 11, 2025 at 06:35:26PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the iommufd tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> include/uapi/linux/iommufd.h:607: warning: cannot understand function prototype: 'struct iommu_hw_info_tegra241_cmdqv '
> 
> Introduced by commit
> 
>   b135de24cfc0 ("iommu/tegra241-cmdqv: Add user-space use support")
> 
> You forgot the "struct" in the kerneldoc comment.

I fixed it with this:

--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -592,8 +592,9 @@ struct iommu_hw_info_arm_smmuv3 {
 };
 
 /**
- * iommu_hw_info_tegra241_cmdqv - NVIDIA Tegra241 CMDQV Hardware Information
- *                                (IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV)
+ * struct iommu_hw_info_tegra241_cmdqv - NVIDIA Tegra241 CMDQV Hardware
+ *         Information (IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV)
+ *
  * @flags: Must be 0
  * @version: Version number for the CMDQ-V HW for PARAM bits[03:00]
  * @log2vcmdqs: Log2 of the total number of VCMDQs for PARAM bits[07:04]


Thanks,
Jason



