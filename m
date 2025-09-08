Return-Path: <linux-next+bounces-8235-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAE0B48F6E
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 15:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EEF17AFE58
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 13:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0084F1DF26E;
	Mon,  8 Sep 2025 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7DnHK/4"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F21305961;
	Mon,  8 Sep 2025 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757338012; cv=fail; b=MXAG0lrdBRNBh+vRgfM4VoHWUkCmjeccQ7YHuJsH5wYFMAOqnZRxY9Dcr5l3WMOercyD9fcHh/t/vU+Wh+TDTsTWU/fEBRioZ41j+MLfmAobbqlfEuAeYVYmvLqFQbAn91xmVFwShWJD0O03/NLFXDygv9uQGMYURTsCoqiZH6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757338012; c=relaxed/simple;
	bh=C+MgENtMhCkql06EMPe/GrJ0k/ibkD5cqg743RVSJkw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PMOT7YkPLNIAc4yUol5tXDmxm7WF66BMLL9tW6Tef5AbYjjmWWYJTakPEnN6omVcQvwUNIo32alA6GmqWvcyesictThxW8xkPW29Nbb0s7je8KC1a9ktUF8hCfCXs+q97HwZjqx/l/LSyXIYy8xfIwdRbRQETqkrTty2QvnvNO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7DnHK/4; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757338011; x=1788874011;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=C+MgENtMhCkql06EMPe/GrJ0k/ibkD5cqg743RVSJkw=;
  b=h7DnHK/4dZi1XgTiD+4lRrb4gswpxAsQajP3XXFdal08cfCg7XVzvN5d
   bRpTNaYB1DybuHZEqiSNFmV710cxsJYvRsYj7FlHclxn1QP6fk/UHSvNC
   Jx2NfTuMpd2skAQZh+C/WaykkiCoJbpIOJ182sVTyPMpC/8ORRpbwSJyy
   sjeVBcl5tPXwGYgmWkbYoMr+CDkz93zBrW4RvguN9vrEAoh4WpsonnKh6
   B820Ej3eXYytsaNzsGk07Nj1qwXfOo18TRiMs7oZXbE4Spk37KLKJeNzx
   Ik0jRmc7r/7fVzotgoTeTC+/88OrlAzuETagmYBxAvC437pGK9g5FSKGu
   w==;
X-CSE-ConnectionGUID: fP7+gpBnSd+kTFX6XREJ0A==
X-CSE-MsgGUID: uwoyhxy5Rrq8zXEh+WCHHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70212501"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="70212501"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 06:26:50 -0700
X-CSE-ConnectionGUID: rPenV7hCR6OIKhGdYZcrXw==
X-CSE-MsgGUID: qQjvk7rcQhm5np2UCiFI+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="172050347"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 06:26:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 06:26:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 06:26:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.83)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 06:26:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jm8mTPDuMCU0uVZ4gvChcZuY+ivBuQIsmRsmlYdCUjY3HwCxEdJIzJUV5BPljQxbBlISyKrMdVCbQmsP4p9Sg2EhVe0ZRbeaGBfSNcEnKkmfiJRw2RymlhG0aS5D/rKYBFVCckzXjQe6a3BGA5ZuMrMXqIoe6HggMP9cekFpc4xHtrv/633BT7uNmd9yTrjq9XszTtj4AIaGe1wB/3+TWGU0SfYMmmDCIB5PWHyR87dMeCcbcxaVLfxmnm0l0XH7qGjPuRqjbMawRv8Skyd7am3ry6gW7i/G9zUvOsZnwY+8VvefgKekEGI/cJlRhXMnwQFX1N9rGePMMMBAAkBtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGVcTZ9a4wAwoPjAncyuY7p7lgsZQHQUhZk/1myD/jI=;
 b=BHRZ97dauPcvoIUsXT/CFRk5OaolqE0r8IMpih5qFpZQGdy6xSD0Yk9Ae3zG0mW9T43LFohHdUuGiL4PB17majfSLtctIopNT6xRuyTglBWj8PTWusK+fGaKfq4sRIyzPpfyKTO36Wz0/em8iTjxS1SPUD19JGCBXlhIC6BQoPYJpMAwRh1cfPjUUkcffwWVpIbMGfu1we6urkaoZWRrfYfS5ljrhMDepDg2KycrkRk/vh+Cacia6V0KTN6szGyQbpCOzy9aBtqP25ASgNjQWkx5ZJGIcU/KeyrrT+aA5NtJfLDEHdVvjAlgyTmaeLdXg7p+7QozyGBHsD3dAf400A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6745.namprd11.prod.outlook.com (2603:10b6:510:1af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 13:26:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 13:26:41 +0000
Date: Mon, 8 Sep 2025 08:26:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Shuah Khan <skhan@linuxfoundation.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
	<thomas.hellstrom@linux.intel.com>, Michal Wajdeczko
	<michal.wajdeczko@intel.com>, David Gow <davidgow@google.com>, "Marie
 Zhussupova" <marievic@google.com>, DRM XE List
	<intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kunit-next tree with the drm-xe
 tree
Message-ID: <deyhm73xdrnlau54pycgquovbdr2pcqzeumdegavukzly6d6hf@xtgrsovs6i73>
References: <20250908172938.68a86c52@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250908172938.68a86c52@canb.auug.org.au>
X-ClientProxiedBy: SJ0PR13CA0111.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 866469b0-219c-4437-23c6-08ddeedb5902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cHQIchigHIvIMAJPzg/vkXV2kW0mT6xDIG76XFiVhIaPIw15L+F+U4o+FpAv?=
 =?us-ascii?Q?ZofXeP82ACH7+7NaFyJvblYeJY5/INutVIFwu49RRoF9MfeHLFQR1tmD1M7+?=
 =?us-ascii?Q?bOgGkx02RnM3NedBEkVdMG4oWnbmJibh9T1tJwbR6MjLFlwBSVsueayd88qB?=
 =?us-ascii?Q?n0kTKVuPqdrNATRHEsgiTweGzUkYwTvdzaPXaInFA4/aCmXZydpsXUEBI6ew?=
 =?us-ascii?Q?AA6YaX2KZg2VCnS6/zHKIlnNweWeIAMY4g44YbiJ8xIpjRFPoYbFQV129ngd?=
 =?us-ascii?Q?6D/KpHUv1qfNurCbhKcuvLyFVQZ5dGyUxdoY7olKjaiJ8gCrahjTf/Ggsd9C?=
 =?us-ascii?Q?jlUMW1Yr3N+5tSx8DgQAjIQMFkrrq93ITqNPCdPQX8TGv8zWB0iYRl4+dwL6?=
 =?us-ascii?Q?3ut0gUxxKvMK/VktnsnrE7jFPFhG80TMGoPiIMQpE4npSqP20qnae5C9zzhx?=
 =?us-ascii?Q?yaTLJbkfLWupvVxo7x/Lh757hqDr65pAnDoTJH6mNVdQvPTEsIwEYHj8hZ5s?=
 =?us-ascii?Q?jIg00+qrnN+hjlOOAoexYbSmGMsJPAIDH9H7zdDEylAFTDxh4+cNKQCmnglY?=
 =?us-ascii?Q?L4POz+kl6DxFDVeJaNg6CQjVpFQI97pNyfz2cp/S+MRqjDIZdphccVcXpn0c?=
 =?us-ascii?Q?FS+YoOIrZpr+zwDsZKhuLjZxl5HrqaB/Jcdc8Dltudd5UcFGQYVSkoQ5VtSf?=
 =?us-ascii?Q?EXS+ifef22DaaiMkJ/zYKMZIghHjbcOVUPww01Mz4wnINfE6qHcW7zM+pIUr?=
 =?us-ascii?Q?c6lll8/Boti/PvE3MsBeMOBdKcG7j01UAfFPIjTPKxp9iOzoMNWZSutbIrXu?=
 =?us-ascii?Q?SUegz6wgRDEK9XshB9HX9hwhjPaT5UKgnSfMX4hztss098nl7b82m9YfLxxN?=
 =?us-ascii?Q?jiYkklqGpuNDj3xMV3ph2Jkoo6gltGt+AqcOZeEKviyhcgELdutMwZMB1yCp?=
 =?us-ascii?Q?BFAJOvZEobJMtzW8PZmeUUQdSg2c8Z8rP92nMZo9HK6F2BaiCCQQAcnWWn3a?=
 =?us-ascii?Q?eUz84ukyE1q8kuNSYD2mD4W9HhnuY9EpdPyFX7Km8MegRd2lyfeZHBi/MJ/x?=
 =?us-ascii?Q?cPFPf+Hku8PuUVW1pHJj/A2LQHRdo+yBb+zbN+A8xTwyWnlIh1/IhPdKGWGr?=
 =?us-ascii?Q?s3Um55lTHMzPz8JmRaSVsjVno2RVsQHgA3SltZbDTlaBH8G6Ggcp47w7vT2J?=
 =?us-ascii?Q?QzRzK2H1MJ1/hkE3pWJWHu6cJ4mnkSXYbJlqkT+H/YBkBHCq1rd2mR1nyniU?=
 =?us-ascii?Q?dSfgBLV6+cskfdP0QzM2Jfw1sFwf+yYLlEsS/AsRdAkWmHaaV4790r9tv2KR?=
 =?us-ascii?Q?G9YOtjWw4JS5Ezzdz4/rvTcMjhveg6VvLGgvQ6tvUhm6AT0zOz5OJMG0NxEB?=
 =?us-ascii?Q?ebrif7MdFr6GgRg0Nr0tnssk7iaSBXcRvR2R4wBhRxo/81CtzaXK2GvQQeqY?=
 =?us-ascii?Q?n75J62RInpk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4ZCMjrtdpNyJC0bEevDL020hq/GaG7vrkCQqkaAxeNLQvA18zgkAjm1pCBEH?=
 =?us-ascii?Q?FP5ZxszhTXMD84i0Hhu85y3a88eizdct+csVVh1ZygStNXwp4rq6zC7njtix?=
 =?us-ascii?Q?Qz4vo9ccp218UWqzHx06d4IM7EfwKTaJUfIjinxCI2kJP0vlCFopVEReDODj?=
 =?us-ascii?Q?noRwelcH+lKctwB8gXPKNF9eUaoRd0DGoXKH7sMzPW2YkSl+QJHuT27ZRk2/?=
 =?us-ascii?Q?21duIMzoz1Phh4+Dx4PdfNNYT5KqXvkONs324+ZAZZNi+42DN4c6zW00bTP2?=
 =?us-ascii?Q?QG2/H40nj85pg7nr4LzQUzdjmnmzWgdkt6IZlWNED3x8LUBnRxAXvWDEi8Kj?=
 =?us-ascii?Q?iTAI5WHRDSzjc5L+QKHSlLV0RGGBbava1lWS5NzEx67bMPwNkFHrz/JXIchC?=
 =?us-ascii?Q?T9L1aH40iDuvaaZx7TgWR9J5IoEUNhSSCnFUWVecZJ0y05bRFBQUkCcoU3/D?=
 =?us-ascii?Q?TurIvfajSfuocl7TFOu5QkROtNMIc/VDl99JQ4ASG/DqXXQWhkOPp2izowjf?=
 =?us-ascii?Q?L4BGFNWTQCUGKN3IDATjv3v9Td4wGpGnzP62aEnMDysPTKRXq9rmmlE/RRr9?=
 =?us-ascii?Q?lrdYML7KN1f5IH2A3odcoDAESZpbIpjZeBsYMkcIAKxn037gWgjgtKcaNXLy?=
 =?us-ascii?Q?z73JSDSX0x8PA2ZytsB5Ry36K/SC9qo9KL/dAdPzqVtn1lrzCpR9i4rGmuTC?=
 =?us-ascii?Q?K2NGxRA9TSo7AfVul34h9RixcFd94RUXTvQGBM5Xjk/H7I8v4lp5RRXKN9s7?=
 =?us-ascii?Q?Nm8RJbxTv2giSlwyt+uGpCh9k+z3/iV+rnHu8ezmdam7HBmT0t/LAiSFNb2h?=
 =?us-ascii?Q?UaK2T2oQua/hXnBOvlDjFDS1QxIGU7+XNxwQUVAX5/J9azc4DJpraon4EA4C?=
 =?us-ascii?Q?n641UoDSitD4zAuuy5KXinWs7KmQS13ZNzx2cOW0ajeCQv1cUaxUsAOc42cu?=
 =?us-ascii?Q?b5gXfHuQCYpBGveJzM3FnvSLchsis4RewUlJIToInDooF5V5H6bZWfOlVAjs?=
 =?us-ascii?Q?fYYlry9fJQoYhn5B8/OqVCSvxpdtR4aPVnB3tFjGqlmwfzadKH9rMi+mS19w?=
 =?us-ascii?Q?s2IN1mtUhqtSSLk5g3d6TU+TzEj+EX1e+J2Hg5HKAUnWtSoOhhZpi5Urd6N+?=
 =?us-ascii?Q?Tq9mGuJ6xKYwj3n1qlk4Wx7dXCx4Pgxkj5T3YxlfBxHiReVwG9FDJ0kx+qFH?=
 =?us-ascii?Q?g6SchAkTSE36rUAFrUUqV9N02V5weK8R1HWbHazIeI3QUWIC+MAVaEFwmFGo?=
 =?us-ascii?Q?tS8h3Xlh1Ac7XnARGp7ScNtKwd1CX4PgT3mUYsXPvo7atUEZlwH8E6+df8ky?=
 =?us-ascii?Q?xa4kjUxchIzjQGBCPriqCqdYfwmgzuHHtGz65rkyGbx6cgkwuStiw1HafXjn?=
 =?us-ascii?Q?HAyTsyWbtarhAhtXV7TlMyKPzcdC/1GCIIoGNywHWD5V+Lk84OGCPanTpULb?=
 =?us-ascii?Q?V4ensHo7a6SXEnutz6lDRNoPtxipUslHHJuPUe7NjvgledwEYH6iCk3ZRY3S?=
 =?us-ascii?Q?inZeEMti4/DSJ2gbLgUnAMk0xXltUCzkPoirQAcUzViBJpno6CN/a4N/bGjN?=
 =?us-ascii?Q?8iv64YymcvDeCGtprMVpXOQLTfF58jPCr0yWtyx7SqlLCbbRKibT6bJi6SPt?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 866469b0-219c-4437-23c6-08ddeedb5902
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:26:41.7412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySc7lZ4PDi02LqzRt1QkMr71bXhX97fToLfFsSUF+l5uT19/DlwawnSEk3NWcm6dKccweXzuPblSQMtyo/OoZv394alx3CIKQENubB3W5IE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6745
X-OriginatorOrg: intel.com

On Mon, Sep 08, 2025 at 05:29:38PM +1000, Stephen Rothwell wrote:
>Hi all,
>
>After merging the kunit-next tree, today's linux-next build (x86_64
>allmodconfig) failed like this:
>
>In file included from drivers/gpu/drm/xe/xe_pci.c:1104:
>drivers/gpu/drm/xe/tests/xe_pci.c: In function 'xe_pci_fake_data_gen_params':
>drivers/gpu/drm/xe/tests/xe_pci.c:80:36: error: passing argument 1 of 'platform_gen_params' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>   80 |         return platform_gen_params(prev, desc);
>      |                                    ^~~~
>In file included from include/kunit/static_stub.h:18,
>                 from drivers/gpu/drm/xe/xe_pci.c:8:
>include/kunit/test.h:1729:60: note: expected 'struct kunit *' but argument is of type 'const void *'
> 1729 |         static const void *name##_gen_params(struct kunit *test,                                \
>      |                                              ~~~~~~~~~~~~~~^~~~
>drivers/gpu/drm/xe/tests/xe_pci.c:65:1: note: in expansion of macro 'KUNIT_ARRAY_PARAM'
>   65 | KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
>      | ^~~~~~~~~~~~~~~~~
>drivers/gpu/drm/xe/tests/xe_pci.c:80:16: error: too few arguments to function 'platform_gen_params'
>   80 |         return platform_gen_params(prev, desc);
>      |                ^~~~~~~~~~~~~~~~~~~
>drivers/gpu/drm/xe/tests/xe_pci.c:65:19: note: declared here
>   65 | KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
>      |                   ^~~~~~~~
>include/kunit/test.h:1729:28: note: in definition of macro 'KUNIT_ARRAY_PARAM'
> 1729 |         static const void *name##_gen_params(struct kunit *test,                                \
>      |                            ^~~~
>drivers/gpu/drm/xe/tests/xe_pci.c:81:1: error: control reaches end of non-void function [-Werror=return-type]
>   81 | }
>      | ^
>cc1: all warnings being treated as errors
>
>Caused by commit
>
>  b9a214b5f6aa ("kunit: Pass parameterized test context to generate_params()")
>
>interacting with comit
>
>  a9c8517058cc ("drm/xe/kunit: Promote fake platform parameter list")
>
>from the drm-xe tree.
>
>I have applied the following merge fix patch.
>
>From: Stephen Rothwell <sfr@canb.auug.org.au>
>Date: Mon, 8 Sep 2025 17:15:21 +1000
>Subject: [PATCH] fix up for "kunit: Pass parameterized test context to
> generate_params()"
>
>interacting with "drm/xe/kunit: Promote fake platform parameter list"
>from the drm-xe tree.
>
>Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>---
> drivers/gpu/drm/xe/tests/xe_pci.c      | 5 +++--
> drivers/gpu/drm/xe/tests/xe_pci_test.h | 2 +-
> 2 files changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index e29ec1ce7231..c789bfb8af96 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -66,6 +66,7 @@ KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
>
> /**
>  * xe_pci_fake_data_gen_params - Generate struct xe_pci_fake_data parameters
>+ * @test: a test pointer

to make this the same as other functions in
drivers/gpu/drm/xe/tests/xe_kunit_helpers.c, I'd document this as:

@test: the &kunit where this fake &xe_device will be used

thanks for the fixup

Lucas De Marchi

>  * @prev: the pointer to the previous parameter to iterate from or NULL
>  * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
>  *
>@@ -75,9 +76,9 @@ KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
>  *
>  * Return: pointer to the next parameter or NULL if no more parameters
>  */
>-const void *xe_pci_fake_data_gen_params(const void *prev, char *desc)
>+const void *xe_pci_fake_data_gen_params(struct kunit *test, const void *prev, char *desc)
> {
>-	return platform_gen_params(prev, desc);
>+	return platform_gen_params(test, prev, desc);
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_data_gen_params);
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>index e2f8d65e9e33..30505d1cbefc 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
>+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>@@ -25,7 +25,7 @@ struct xe_pci_fake_data {
> };
>
> int xe_pci_fake_device_init(struct xe_device *xe);
>-const void *xe_pci_fake_data_gen_params(const void *prev, char *desc);
>+const void *xe_pci_fake_data_gen_params(struct kunit *test, const void *prev, char *desc);
> void xe_pci_fake_data_desc(const struct xe_pci_fake_data *param, char *desc);
>
> const void *xe_pci_graphics_ip_gen_param(struct kunit *test, const void *prev, char *desc);
>-- 
>2.51.0
>
>-- 
>Cheers,
>Stephen Rothwell



