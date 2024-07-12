Return-Path: <linux-next+bounces-2969-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7092F9F3
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 14:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2FAC1F21B0A
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 12:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006AF154BE8;
	Fri, 12 Jul 2024 12:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UKUeKhkv"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A96A26AED;
	Fri, 12 Jul 2024 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720785967; cv=fail; b=HauCrSshkOR5K2xqYn9UDhoFXk0yP34dFy778TSMg9CAKHZSSRLQmglwSNQvExmyY8XtASeNkW8J2vL9RYjPAcDQ3HCkzYcPOJsK4ggSApAsKwV1mpkHI6B67X4vxmJ1uKzmuuqn+F7Yl+Y1DbYAyrlERYR5E/RvdGjWGdrZuHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720785967; c=relaxed/simple;
	bh=BvjryQXi2yoVh96WdAzPKz6fuWmJfrFP9+frhPHCU6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PRXrospAxq+Q1Py1LACOzEshcCStBgAzmyNhSbuugQwbtrz5+AJcX7hICWBzadvHlf/sjClm20ZpKGTjw8jSapINsm9anFmUqU9N18C7nxEkjbEQPsliioiL3LRtBibPFao+PXC2FCUABSTpXwFoFtuLEJCfwhnz8rEJnYtimP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UKUeKhkv; arc=fail smtp.client-ip=40.107.220.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqPTmgqqlo6p+ziFajoJq0RZEq0C83HaRyiA3ENZ+cMzBZ5S4f3QFEcmQqaAyLsdX0+ny9i4o4mpBIELGtSy4VOLGp3F6VVY2VKPv7vAanyED152frDzKIZHceUsAiCFcy4m116LTxpTqBg34G2Nv+phVzW/rOI8klXdRTwQ1ncZi45wHdBiOT/vvKX/3wp3JwtS7S7lpF6n8chX7BPLdLFjU96p81a8epiTeaKOfZCu2uuK3FQcS3QD9DzMga88u/8bQgYR8lmGN4PeSA8zo7Qf4wMpLe+tRcxz2vuvqO6m8JB6WwX7m3NOwMXUgcgTv7dVAXQGVV0TMiVAnW53VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrD8YteUfsevcnFV+SjyQNsfNX1DacnBA0wzC0C4E2w=;
 b=XcgLTi10jdtoQ1OV1ZWyYg6MnTYpD3eqAijdzZf2SEY/HroKxzAJLu+bURYKC3aRqqUTzaCGTXKQP2CK+oEenJwDjpisk0sVNa5/YFPb+xAgzNAU8NXR/ctnG6/mGuxf9rSjxxU6xTxeFOb7wbv4wEqJLZMTwItRjw+2C+kdZOcIJ86a1fYDUtEDl8+69DZ05c8jyNtYFTKhNuuS9reTGNnfTXLDM5Jk4Lo62FhutUiPmJQOuBOpquT+mRq3F7+nkpUZHhWKSpY+T2vBUsXnYzN8mIMskLUimp3AVytuF8n0131n36hWqAl8NL/oqda2X89RJ5SztsMm7Drfc7E7wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrD8YteUfsevcnFV+SjyQNsfNX1DacnBA0wzC0C4E2w=;
 b=UKUeKhkvs9hfq7GFK4HLud1/sqDVHX+tyzxfonomOB/YHhAaxox2uFYpAakt6P82QTLwM7kDZtExK81401nM71yPLEZocVXTO34X+G8m6d55KHnJLH+4FwAheEwDRCaYH8nFdsrXlJsTKYF5ylpHFIFctP6fpXbI+D2tnQUPEIlGmIis+cTQu7KH72FdmvkK7jALGXvrikiCmd8Y7z0nvyfLepQwUHh3pa136FfLY4aqFBEzHHSloKovqP0R6CFMow6Voor5zKhs9sTclwNYEayAKZtcU9+76ExFJD/XV8umpHMstu8G59udEKKvpHxxNDDXmid4O793TlHetj9Xcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SJ0PR12MB6735.namprd12.prod.outlook.com (2603:10b6:a03:479::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Fri, 12 Jul
 2024 12:05:59 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%5]) with mapi id 15.20.7741.033; Fri, 12 Jul 2024
 12:05:59 +0000
Date: Fri, 12 Jul 2024 09:05:58 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lu Baolu <baolu.lu@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the iommufd tree
Message-ID: <20240712120558.GO1482543@nvidia.com>
References: <20240712155842.240a85e3@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712155842.240a85e3@canb.auug.org.au>
X-ClientProxiedBy: MN2PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:208:236::18) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SJ0PR12MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ea66d7-b72a-45e4-26a9-08dca26afe35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uqvto//dSMg3snPMgvgIq0v/+D5QYV3fdYx3ruASq4zla7JiQrIMSZavrA3U?=
 =?us-ascii?Q?XsNdM4sZ6VUX0xi7Y6eLxkEK8lgqwIqoc+s/93i9ultdIFfGFJonRJpCQFYQ?=
 =?us-ascii?Q?rowf/aoFePcjXgLrf2WTTNuaJQgotqhl0hRU+CsO+MJhv6bJWU2nuu46zlqi?=
 =?us-ascii?Q?7wO9ssBq6QuxxBtr4JNrrQoJ61nbca2GYlWriYxalN+BQwaycHITpg6JV5c2?=
 =?us-ascii?Q?vWYZFU/4ZgvVh1m25/RWCBqdT/Ta5gsQwd6dTEV0YxOH33hxTx7uPtEIVjaJ?=
 =?us-ascii?Q?xj6OIPZVyvaI60spQUX88rHe9W3YTU0MeikSiApy2y5Jz/Tdwso338FZJqm8?=
 =?us-ascii?Q?7LSy/wt9+tZTARdq2fQ6FXk3liCAw9gbYWoy47f2V9gTztnjPBTZ2pUS2YVG?=
 =?us-ascii?Q?i3w1nskBivulWvTy1E0kw/EU7YeDMpGtrrKpyZm1VjQ5PSQxlU7ZW2Nb0Zcy?=
 =?us-ascii?Q?+z1d+5cdk6MFSG07gGhAIHTfwn8rFT4yH42/Sf7/89b/rq/lR3/QuvEEOGE1?=
 =?us-ascii?Q?zIeIXEyhCKSmVFoBzUUziZW52fHKVGGlgvFCBARtPpH+zuRuT5Wv+gg1w4SB?=
 =?us-ascii?Q?t1UAUbr2m+978FRQ9rYODMo0Ua5JHkmK5WjRUqsNRc+txucxcH4oGrbxjB3h?=
 =?us-ascii?Q?NyKMgOKfvEusTWj5BNMI/ujv6tQu4MrxT63UytvVCVNJevcjPKdd3Ut/JkmX?=
 =?us-ascii?Q?ntszorh2px6qMi7Db67vlr1GVjKzHjYPU2eAESgajFeNGrPieDPHrGPhIBDO?=
 =?us-ascii?Q?C1hEz7BrDXlIn6FyeYAed789PqtxioFE58ztFU4DuuvmfRfgdLdhqBdbMii6?=
 =?us-ascii?Q?U/gzpSlysbQGEm9ijjTmYHLljxDBUvPvzMRpox71K4v+GomIxBxO0OnXwQzT?=
 =?us-ascii?Q?GWH101YHGDlAzWG0I7O1IIdeKdW7I6++wP4eBKGnxEIWqgVIorriIlc+GshJ?=
 =?us-ascii?Q?LkuakjPZHQRA0vz7F1W0P3VKjOUXLoge3SQE8/wq1NSg8ZhfKPqkmCKwWXc9?=
 =?us-ascii?Q?iOwmxTweKMaLOEMoZe9RH2KHNPZjOBwCN9ElmHk2yQ6ne+MZNJK0SANeJ1kO?=
 =?us-ascii?Q?1kiZYi/4Ce+uIj0FGTJ9Tu7ZnibBazx/EFq+BszetQqZ28I8teJJSLANamrq?=
 =?us-ascii?Q?yUf3h/EEFeagBXygOUSeF9yDqCc4xf2mdLdH26AqhzeD6iksK5ssMceI1oXE?=
 =?us-ascii?Q?qd/VCZHzyVfvrCOxb5nk2W8adQISyOuOumt2hlErg3QvrPEkkrEWmmQSD6cc?=
 =?us-ascii?Q?chNtuyENphek3f5yz02eMD81TQo98NuZCuVuRAKXBgqSgGgp2tErGhWsakXp?=
 =?us-ascii?Q?VgE+zWrwmQmsEC14yCTl+AsURLkSn4PnFnIjkGSyMMmw/w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OScspbuVqNWOyRlEMLEkpTpY/job8pVaMQMDsN0pJV/PLaINAT+EhhA9MCh5?=
 =?us-ascii?Q?VABGtUehp8NQ5jq1XemzHuD5qicKI/2LXTjE4BtkygvUM6XT6/1ccEsFhzVi?=
 =?us-ascii?Q?qi4qOT8hNQ+MKsd+DKSJSxB21LnmfMTnbO+19xGlzRVDwm0UdbJj12YfgWVQ?=
 =?us-ascii?Q?yFC21BFKzie/BAvFwcoZfWn5mXw/OgPD8PRQchy1zF0wuPsViwMKnm27+8bb?=
 =?us-ascii?Q?HvVWyfWQK9ECnq0ZUEWdGCVelw1uMaITF1PsuV9v1gGXr+FiC7QBROHSETLg?=
 =?us-ascii?Q?dzKWe5Sg76zRqUYeuj/7ePxHE1KEnZTc51hEt4mQSI/sUC7xk9Bvzcw8Lnw3?=
 =?us-ascii?Q?dzXewGKuLkwmlpdit6UDihbWQk4viDQFEcdWTrszeyLRJhFpDohTJFrlED65?=
 =?us-ascii?Q?QuuZOh6ppfL1v9IqS0GGwqV51rzrMFT7s7H52XceuUtn+C/MCLdYydVup2Ww?=
 =?us-ascii?Q?p2Zv5ryorkcctPDkUKYb/XRP9CE6rciRe67M3kLlklAgub1ZrVlst6iA5JUz?=
 =?us-ascii?Q?vtUHqE8jo5d1EsXkBESxI/OnotwwKH1dffuvF23LAJ291MovARL6we4XBHup?=
 =?us-ascii?Q?0U4j2QKMbhxPbvROghA+7RXD0Elp0/fkgWSBC+TjjSv8d5skPIR0NIfe5Qx4?=
 =?us-ascii?Q?mI6FrC9jBL9tjeImcxJXo0tw+kbdZiD8u4BhstSWUMBnRsZ3exSldYc/esF1?=
 =?us-ascii?Q?Sd2cMs30WY3huIlvhCQia7ZVAX7GmtjBylL1OYLck1roEHEy9uMtixHpsQGI?=
 =?us-ascii?Q?A7aXmFN/dydlhJmGzLisq+6FZ5vasT+xbUJIrEPaQJSvlcEoqdzjsakrKGLc?=
 =?us-ascii?Q?B1Q89ajI2HZZ4Qr0si7UnnuQ04mTl7DpQDOlP59XS/wFhtgro34rid4Ivt7W?=
 =?us-ascii?Q?g2gcP26GFksL0SYUcbqA24LLL0UBRy42ue31dP2FbCZGfTv/a+bzIvmzA6vN?=
 =?us-ascii?Q?Wnuq+TR6PwYIm3IU/67VhJneZkU4GVAIHJXoSauz4MWgiqW0vG/YlNoXYPte?=
 =?us-ascii?Q?zPdd9aAY2QbmCyyJIDSqat0+qRTruzlqsn02EsCVXE5E4lFo8Wjk+MX5+orB?=
 =?us-ascii?Q?8OXafWXwbuINLWcEsSokNkLzKgbpuCDGRPGYybd98godftVJHsPcQhGDZz1r?=
 =?us-ascii?Q?Vd4pBMmx3bKLzrfZ9BTUtb9vYBoGIpPrHSq3mX/W3XlLkpypUxyPtDYwN+1G?=
 =?us-ascii?Q?rw6i0kAvKiE0chCMbi4T1dDxARfq2DI7wNfE3VDTKNQWSAificGWHj9fqP5T?=
 =?us-ascii?Q?+DmHoyHdK4YZzTyuEaoHJ3J9o+GYQxntz2VtaAxIlXRlYGlZRizCCRCIHEMs?=
 =?us-ascii?Q?ljVyytBey7+NEtCkeQ+UfiSNHuWyCIowDDGme5xzYv2T8f597uIwmOEEtBXh?=
 =?us-ascii?Q?xXYcevWZ2ZY8IBMnxZLhi7We1TnZgE+1yUaKrJ4XQfGnkqs7MzYNh0L/5Jvm?=
 =?us-ascii?Q?gjqPGsHCuv6whfS+vl/Ixl1GaKnOl8BIbak6dIo0ughWYDU/Jua3oOktpepe?=
 =?us-ascii?Q?nLY/tYUzw5zWfALNttoxYFNVLutQA0UsM0wuSJcxJHGkTUOWXRrw9gwbMe2l?=
 =?us-ascii?Q?tdgN8oHk3mDnhOjvI+w4KmJkcTMT1DX62xzE0K3T?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ea66d7-b72a-45e4-26a9-08dca26afe35
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 12:05:59.6083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6HOuec5tmJEwF2uwfTmmeiGnvBG4oAzveevHpMSX4u0WXPWgi3chFzKNYiQ3CuR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6735

On Fri, Jul 12, 2024 at 03:58:42PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the iommufd tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/container_of.h:5,
>                  from include/linux/list.h:5,
>                  from include/linux/wait.h:7,
>                  from include/linux/wait_bit.h:8,
>                  from include/linux/fs.h:6,
>                  from drivers/iommu/iommufd/fault.c:7:
> drivers/iommu/iommufd/fault.c: In function 'iommufd_fault_fops_write':
> drivers/iommu/iommufd/fault.c:308:57: error: comparison between 'enum iommufd_page_response_code' and 'enum iommu_page_response_code' [-Werror=enum-compare]
>   308 |                 static_assert(IOMMUFD_PAGE_RESP_SUCCESS ==
>       |                                                         ^~

Oh my compiler didn't complain, I added some casts

Thanks,
Jason

