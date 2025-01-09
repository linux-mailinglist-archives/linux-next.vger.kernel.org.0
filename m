Return-Path: <linux-next+bounces-5106-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39143A06CE4
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 05:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23F011668A8
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 04:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA99913AD1C;
	Thu,  9 Jan 2025 04:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hzBur0AU"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2061.outbound.protection.outlook.com [40.107.95.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD8B13C80C;
	Thu,  9 Jan 2025 04:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736396697; cv=fail; b=HNV50OwaO6ethxu0OsQGAIQ1EB5bIWkOXdOoBbjMA8C+ue3gpWiRlEhEldJa1/a7bAGYJp8lKYe2aXBumaiYUu9ZpWVC75DUUzZ25PyxKE+Z3Pzi1lYOarMyYWXKgzNNgaquxpPWU8IeS/iBl1lDgipp6l4g/KfHE5tOGVwQpwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736396697; c=relaxed/simple;
	bh=9uj3FDJj9k0UcSj9CkIbhMRR2xLDRRzeBHiamlzqhl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uSmdZw85iWUGBZe8YsCxs/rtiOtKpWvP723KoLDOsLsWZRUFhNxojk9qaUiEkKd6+4nb48eoV8eSAszGS3UyupiCsZtUNH4Fztpln4DtYU2Zx3+NjyrkyUHhhEYNWgeFz//m97Yjxq/q6i8bfKKTI7zBvlEtav72Ua0nW2gCyNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hzBur0AU; arc=fail smtp.client-ip=40.107.95.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0phhVUigGi7OUW4BFM2ThDu7hnhmGD7AoQ6BMcJNzLG7fukEVqZmJDOKox0hBJEelZJkf3lNT3zwl/iK1jYnON8kSNCN9vNy9RPalxJYMgb1YgMrQSfcHTBQUcjaSLGcbijsG4AUYUNh6KDqK++8GALeYpeZDHCl6tRyFToVygITnrjM5bw0PMT+NcQmChA8kz0JpfOHQYSl3M9S9dZmbjfkEVUo73vof2kyJuGe/XYMRRzNl6c6LWUDnNf1E3EW2rPOKfr6l3UNBKswTyjYQZV7hlSueLSkufhQTNwPRkued25qEVnbnWFlpwDzaM5NOHNTBkl6SfgnksR7VNhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoWdknM9haI3HOqAnq3pA/HEI5FjGRcNqjRso6UGvFo=;
 b=wcotqabbJJi2Nu+019KPe0DnnKas3RyMZMOIRsr/+fEg3l/0NxbtIwhh+P8luGDZtY6FYAHOtOkfDcMCZlPiAcq0nW2ZeoC4hAeh4Zysg1D+QnWDbbh3H8XTbR3gF52/6mQEaesZE8GIG4fxu/mot5e+OGCXOB8gQhrhfAJPhlxr3zAdYPaFLlXcChwTkDoH4/MtMCd3QPde7I/lT6xUnP6D2e70PHMy6vYuXppKk1SGdFXBPPIRpmEPbleZbaRyofyM+HQNiFOu0sPWke8F1hK2U4O0G+301PRL9DT63V2AytnWIT1PRAC/2etnwAEmlUeAWxRqDo50iXaaGaHUIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoWdknM9haI3HOqAnq3pA/HEI5FjGRcNqjRso6UGvFo=;
 b=hzBur0AUeEtWYNj39p0SIDRBzzrd3NNj5XVwweWvUAyvXi/KgzZbEM+kvMucT+THSTXBhzfzNPPcBBzkf/SsBBP86PxAy8DZ5wLUf6NIGiEaad7WpanQRGctUk7Rzv4gNq3KkJe89TqGA4ZNErue6MlL67aDB5Juh4WBqf2HxsXKetTFVOVO+cdSQyJy6A5vU4Idl+oq1cr6HC3lmq3RZ3B+qAnOWBFM+OusYcSYb7eNXzzXl1kB78O49vUaXShB9Swy2ill15iD8qOETeFs5y+T7FHwlio0cAApkEcC2KH841A9KffeFrWhAcL7oZTnVKeGsjk3FOY2GJiOUCMzYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7987.namprd12.prod.outlook.com (2603:10b6:510:27c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 04:24:52 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 04:24:51 +0000
Date: Thu, 9 Jan 2025 15:24:47 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <76quyzrawwtchqwmruopws7bidvcm5idluk36oudoeum63wc3y@dk5jfmxkfwgb>
References: <20250109100646.7b0ef3b7@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109100646.7b0ef3b7@canb.auug.org.au>
X-ClientProxiedBy: SY5P282CA0133.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:209::17) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: b07d8e45-3814-47da-8299-08dd30658f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VDwE7nupYMvEezedke9MaZe7THbG+1lMuQPkdid19QrXZhiPQ7bF+Rfaazng?=
 =?us-ascii?Q?TsLpyd4TX2BPe/OSZxCExxWTDwJiBgXlQcT6hhoOW1rnbIuPVES3FsYQb/bY?=
 =?us-ascii?Q?7eIObruZLRiz3n9MSgHohEDwemNDn2xysu0p7nxBbVcAnNzthDoQI8ZcWTwi?=
 =?us-ascii?Q?bG/lfBQnNdtCQW6C3Qixy8l3vM8a5KUSczdabIbSPMpW4TlrXWISTGYSPiER?=
 =?us-ascii?Q?z9Wj0MLb+QKJFmY9V+iy/zsm80fnK4g8viFSNku6XrDrsH/Wv1Wm1vOVioqJ?=
 =?us-ascii?Q?/78PLHXrrKa36sLAvsr2ybqqX/+2GdJAXjR+lag9jnGLTCBPKL5eOM9LyNqh?=
 =?us-ascii?Q?I+TLLLfho0gIHhTAbxjvszasukIRmasfQUyQeAaFQtGSOLWEMmCrYKGnmLUv?=
 =?us-ascii?Q?i1SKfZ2c5EwBdx/HtKzafQxBeYn/8Em0c4emr2t7OdzewP0MTD/mx0ExCgew?=
 =?us-ascii?Q?qUdQzTcUrNc1WJfJZQfz18xRDAdgY/czX60CrF3IMs8PRAMFWO8kko/pIztp?=
 =?us-ascii?Q?x1W+y5hzIm4iJuHFW4W+G4+B8J6+Oow8sOLAOP/n2B/5mlBxpgQE5IbiaxbC?=
 =?us-ascii?Q?IgTbxDri33Pz5+VgxUasjaN2QdfYWUck1Iu3Lm6Bpz1J8rgQs2/GQkeUmS8G?=
 =?us-ascii?Q?YOIar6+RKHwBTXgDFLNUbodfej95KxwUW8qAprPqqDjQ3JK8Q0gEPNPqpqJj?=
 =?us-ascii?Q?3BBz35cfD2tMYKAksY+fTdVjBD7S8752IzVaZv/vOvcCuUkdgjTfG0WV+0dm?=
 =?us-ascii?Q?Kt4K7Ymxw8bgwCWW0gL8DdHxd7KP1kf93NlYaTqdV6aHULdx7/iUhAwLiu/8?=
 =?us-ascii?Q?bsrHy7F/RezQcMZEuE5Y4z4Y/6+LOWsjzsO/bfC69JkLqAscUXrBF9elmpab?=
 =?us-ascii?Q?PqLEwUpVLRt5By4TaMydUzMsFHn5EeCKAuQ9wMPqBROR257s9IC07PcldoeQ?=
 =?us-ascii?Q?Ygb6qYdJg0U3u8+hTy48u51OuS0R+4iUplTsaj0AV+6cRGWRbtMQ4PGpGs/a?=
 =?us-ascii?Q?6tipVqoo4TYPpBLqbcfSawVWZK4RGBzf2IzWouEY0t62ndaFZwj19KyYPZV3?=
 =?us-ascii?Q?KaEY0wMVV9cSNE4Jx0LX1kKZMdJ4ST+6QnuTsakraCw9fko49D+6CQErBnRm?=
 =?us-ascii?Q?m6DS92+2Amr8DBMuxVeWTO4ecIKtI2rcF5efQCfDn9vxt8Iobdyn0CpyAg71?=
 =?us-ascii?Q?LQyoFw2dah2yFDjdPoWUsjqetePKCNQ1AlT5IFe2wiY9Yx33uKMSpl3MMVdW?=
 =?us-ascii?Q?/fwDt0v6vWOVuixFrOr1/US600GusIiyp6mxg9hSEq01cy8CpIB7/ncN1l2d?=
 =?us-ascii?Q?N5v059XmMotiMFY1RI52aM7R7vU0CdT+qKokt1aKgaZePF/4jPWFQmjWI/Gy?=
 =?us-ascii?Q?skvryKRo9XG9t9rxzgdpzk+Z5oF9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J4cs1JnTww9+P+6QRGwhnwrv+MZTfQqHD7HAkiajuVuZpJvZTEyq4NtnCZhf?=
 =?us-ascii?Q?pji7mzZKqmRTNwMhSoLrhEp/wG+Iiqyx5UYr6stnRvN5wM1lYtZS/Mw+SuPB?=
 =?us-ascii?Q?E6BkxLkE+cnnwKz6O6333/iVi3u6AbB0UpK0PC9oO5nAOrOEez9FNsm8ESZv?=
 =?us-ascii?Q?Flqz1plF4lGqoPgxgXW1fq+fmjDYoxQ9dUWR9ARfCXT2yHA8eLID0VyH3Oke?=
 =?us-ascii?Q?ysDw5fjWjUa4CSTGbVyMT59h0s3HkzPhvAuEu7MfFS9jFSyzcYkSZtoDWZGs?=
 =?us-ascii?Q?jBenO+ob3+1l7yOPiBp4qNGPJkcl6diuwRa/tUJRCTnGMqIctrdPQPs0qYsB?=
 =?us-ascii?Q?iUpm0YdkhCHdHgGKVrvflVd8FLY+RA+Rjzksr+ruVEJHqfLYDXX3e3M62I8U?=
 =?us-ascii?Q?Jt7wDxiRhOvnphJ2rvOIsNVbovGTsJabZiLBk+gpHSrw4S59A3fmUThjU1pJ?=
 =?us-ascii?Q?ShSI41jc0CznXmrjiS1VmZdQB2Z9n7hDVa7bKNzX5ZWGQmtAHN64ZxslOnnN?=
 =?us-ascii?Q?9dGorXCkArLvz/VPxJFD47U0n+WhEchVsocwelft+3Z0mU5qDekBHFXnV7mF?=
 =?us-ascii?Q?qkPb6Nrvot26CLjRZ+crsMVrur5M2yUrGLwi8VBEGmquxkKbNcoUV3W72h/A?=
 =?us-ascii?Q?kpEGbYUzlFs11t0U7Xlx1qK/gCujfamVMmrswLcjHCPap1khUNvz3A9fSX2N?=
 =?us-ascii?Q?R16PXSD+lbLl8KmsBnM7JabBcscoBcMAGevb5LwYEWogCgghuTXS1zFcOtCh?=
 =?us-ascii?Q?tcUjhcqYC+o2SAt9WPn30E8Afx8/5MN43gQBREplsYF1duqvAx+lRlAMZ/dG?=
 =?us-ascii?Q?6glxUmBik/sGE6QwOv0+MNz+BBagF6b4SuFdBXLjJ/x2k+zuGs3nUA+H8FxK?=
 =?us-ascii?Q?cxRVQPc5WcAs/H4Tns3bO4lxRG2gzasrKGxzOxmzFD32tskMeouCBnEXSotp?=
 =?us-ascii?Q?K4z06LUGOGjNGP87yBvtlYiG0vH6+ftyiEQmYbfYjUcQrMP853/ROJxKTHnk?=
 =?us-ascii?Q?lLYXMFuIqbXr3WrgINZhIGgW35WfW+DF3ZetUWP5aTf4sDayABr8uGtqmlGd?=
 =?us-ascii?Q?O66tVd5M1X50rfCVtTpb0G4QsSXRtkj5kwP6Pwk+yhbl8Aw0stySn7K3IMe/?=
 =?us-ascii?Q?5lrGsx7PUbDhSBqZhroElV/7pmcmB0LNvOzUQsBSTgQfH1o4avHh4CAAiSSd?=
 =?us-ascii?Q?CEDnDf5rwbQiVNNrkH0pLmAdGCAKjXa4oqZeeNIXp1dwvz1GU3LuIJSJXGMl?=
 =?us-ascii?Q?2YVu3UDXEJzoHtW6EIQ3TO2H7fcmj7Lvl3lSB82xih91TtvXtyTM0Pz6x+J+?=
 =?us-ascii?Q?ebc7ta+/uEb/ejeSsk+P1g4r5X2VlI3H47Xr5Z5Y8rjntMrXqd7guG/kUQAl?=
 =?us-ascii?Q?rdDRVEgZer1/4xELfKahRpkNwh2p3MzOsjgn/SpvN9JHZcFa7t/b0m92/H61?=
 =?us-ascii?Q?J7+vq8TirCmnGCQoKP4IMY04nIp3ryukOzJsWEfi2diMQ7qH0rP9Ekyeuqz2?=
 =?us-ascii?Q?QJrdz1SbRJEL7zyUvt7IDvXNwKISEZp3wgUPpCRjXq1M0Sx7qxoFjVI1bM7l?=
 =?us-ascii?Q?kH/aeu9zQvW5hUpPQIcU9I57mKGLb7oaK0VPeIog?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07d8e45-3814-47da-8299-08dd30658f9c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 04:24:51.9033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3DbiHRX8fD2hBsWWcFcNtEkzi0PCI690apCfIm1H/nnHxY9LqhBFiHCJ2YvuFQn8Cp+vZ0Pd+L0gOV5eBsqJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7987

On Thu, Jan 09, 2025 at 10:06:46AM +1100, Stephen Rothwell wrote:

> Caused by commits
> 
>   c0c3319917db ("mm: remove devmap related functions and page table bits")
>   f9a01843d366 ("mm: remove pXX_devmap callers")
> 
> from the mm-unstable branch of the mm tree.
> 
> I have applied the following patch for today.

Argh. Thanks Stephen. I recall this was caught during review, but I must have
accidentally dropped the fix up change when I rebased. Will respin with this
fixed.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 9 Jan 2025 09:33:31 +1100
> Subject: [PATCH] fix up for "mm: remove devmap related functions and page
>  table bits"
> 
> and "mm: remove pXX_devmap callers"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 1 -
>  arch/powerpc/mm/book3s64/hash_hugepage.c     | 2 +-
>  arch/powerpc/mm/book3s64/hugetlbpage.c       | 2 +-
>  arch/powerpc/mm/book3s64/pgtable.c           | 2 +-
>  4 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index bda0649b316d..1d98d0a5984b 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -1361,7 +1361,6 @@ static inline bool arch_needs_pgtable_deposit(void)
>  }
>  extern void serialize_against_pte_lookup(struct mm_struct *mm);
>  
> -}
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
>  #define __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
> diff --git a/arch/powerpc/mm/book3s64/hash_hugepage.c b/arch/powerpc/mm/book3s64/hash_hugepage.c
> index 15d6f3ea7178..cdfd4fe75edb 100644
> --- a/arch/powerpc/mm/book3s64/hash_hugepage.c
> +++ b/arch/powerpc/mm/book3s64/hash_hugepage.c
> @@ -54,7 +54,7 @@ int __hash_page_thp(unsigned long ea, unsigned long access, unsigned long vsid,
>  	/*
>  	 * Make sure this is thp or devmap entry
>  	 */
> -	if (!(old_pmd & (H_PAGE_THP_HUGE | _PAGE_DEVMAP)))
> +	if (!(old_pmd & H_PAGE_THP_HUGE))
>  		return 0;
>  
>  	rflags = htab_convert_pte_flags(new_pmd, flags);
> diff --git a/arch/powerpc/mm/book3s64/hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
> index 83c3361b358b..2bcbbf9d85ac 100644
> --- a/arch/powerpc/mm/book3s64/hugetlbpage.c
> +++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
> @@ -74,7 +74,7 @@ int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
>  	} while(!pte_xchg(ptep, __pte(old_pte), __pte(new_pte)));
>  
>  	/* Make sure this is a hugetlb entry */
> -	if (old_pte & (H_PAGE_THP_HUGE | _PAGE_DEVMAP))
> +	if (old_pte & H_PAGE_THP_HUGE)
>  		return 0;
>  
>  	rflags = htab_convert_pte_flags(new_pte, flags);
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index b6aeb306ec0b..49293d0c41dd 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -204,7 +204,7 @@ pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
>  {
>  	pmd_t pmd;
>  	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
> -	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp) &&
> +	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp)) ||
>  		   !pmd_present(*pmdp));
>  	pmd = pmdp_huge_get_and_clear(vma->vm_mm, addr, pmdp);
>  	/*
> -- 
> 2.45.2
> 
> -- 
> Cheers,
> Stephen Rothwell



