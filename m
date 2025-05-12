Return-Path: <linux-next+bounces-6707-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D385EAB43F8
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 20:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59CA016664B
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 18:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287781E5705;
	Mon, 12 May 2025 18:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HARxvgLF"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E19238C0A;
	Mon, 12 May 2025 18:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747075550; cv=fail; b=hqI33x6NpEsMK6F0SUKEPmGrmnzUyCX0cEJIX64L9DunRBK2tr72WSOhWmDiIrA92lZ5P1hfKtnFq3OiRPAbCMWSrMl8fltdF5ibqj4iyX1YK2A3o0EpDo4Dc8bLxXz8tcN3hl0TDUJaaxC2Iowllajm69+mlko1mJBUux4eR54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747075550; c=relaxed/simple;
	bh=RlkhPxSAq7If8GDjCm/rjtxCL8ip0LQdrflnP3zhnJQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FkBOoC5BD/PWBWF4EB60hOHBjyXioMjdguPjidbHWAUndp09QsRtmqrRP/jHYvqRTxbYaUKdGt4Q2QI4M006e3fzWHmoySRxNY/VO1fREm++/uczHhPPvHKT0+d/k75OOAYGdhgW8TSsWxlp0Gf58lcr9Hk3rwvW2dlUCzVBWtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HARxvgLF; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747075549; x=1778611549;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=RlkhPxSAq7If8GDjCm/rjtxCL8ip0LQdrflnP3zhnJQ=;
  b=HARxvgLF7ZYIlYaBUuJYrWZ56+2FzyxHlsYSkVSxaeP+d2ZIb7m0mzI1
   nfv3qtHJ+nmB9wNU063D0Tqhsc6tqjl0hQ39WjJbyekbusegPrdWD2oZ/
   cwSjbC9RdAmpB8XBaZRWYxDFh409FTC8XoAa2uSay4Y51zDdpxTNftgRv
   o8OiG2WG9MZ0wgIMA4RUp9IS5nXUTlhqh5F6qXZa1+XQmfS0W1Tujnebq
   7+DxfvsW7kV1KN5WrIXx/oYuYl21gqxUSvEtZRIlWyh3Un+uffgytNxJl
   ejk7g0C5m0ci2l+hevV/O97BZIKiUeOKQfT/EIud4Le106F0SqFd9xz2n
   w==;
X-CSE-ConnectionGUID: pDiiAZvBQJ6OgpmxjWQfdQ==
X-CSE-MsgGUID: G1r98Y2PRm2+WPFwSULsoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49053467"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="49053467"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 11:45:48 -0700
X-CSE-ConnectionGUID: +mGa74yWTQmsKfaTl8pYgg==
X-CSE-MsgGUID: Z5nW1T2JTVSbuaFfUrWXSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="160721712"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 11:45:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 11:45:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 11:45:46 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 11:45:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0XL9nxTciQdcs4fXu528s5XKonRbkMeeox4BurdeU9h+2cs7gVNWDdsoP5A2790ApqHW8lSCPsQzFD3zp7MaPi3o/O3My3Q3sfpoo6o3QYkVwWmzwngmBBuVwOjFE4mHhn2jnSYip0mtRbu+Sze4V16fUFmbKeecRejGq1EfvXN8Xsr2tDRfyN9tJlVf32+zKxnJQS8a3JpE32ye3wmVvz8eTknzM4EzoGU9H37ZD4yrlv5q214B6HKpxvQBrxbaRe0wuAPMQ/e2J5bkjPZHv+wVEFhMrnC61UvhL1etcUNRotQ2ZDI6nTdkqsDZW8nmiZ6VE0fFaYtneMXtT2jVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G80Cm8t2CXqrJGQNnWBz9jItzKYmDfhvERPhy59KrVU=;
 b=mduq48fGTb6gFebasCbA2n88R43y8/LzYTjNg0X6IsyOMt8s+43Z3ivZgHanKkwwP2OF2lg+cUG0q2hY5lEY2T4eHS6sM76OQf51+yPQi/yGbdxRb2VqUd5rLORKuQhsp8m1ZuNxRxJYZo1XW/9RRchsIr/sQ4RKyU3WooCV8jqCeQeP+PWGBfRq2GgiOS/odFerd3rpLcfHzQp/0DY1fX78SxzOoG+Y0zTrBrsbxzwv7O6ZaG0MsY3HJqnlYbjZXkd4/k18vclsIJspF1lJpJZ+Q6NCxBlDax32603IAaeyJPDvW8WDQ2NJ5Hf1LrkBkp9bI0g7YbqeTMESS/twTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Mon, 12 May
 2025 18:45:43 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 18:45:43 +0000
Date: Mon, 12 May 2025 11:45:40 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Greg KH <greg@kroah.com>, Dan Williams <dan.j.williams@intel.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <yilun.xu@intel.com>,
	<sameo@rivosinc.com>, <aik@amd.com>, <suzuki.poulose@arm.com>,
	<steven.price@arm.com>, <lukas@wunner.de>, Cedric Xing
	<cedric.xing@intel.com>, Thomas =?iso-8859-1?Q?Wei=DFschuh?=
	<linux@weissschuh.net>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the devsec-tsm tree
Message-ID: <682241d45df91_260429420@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250508181032.58fc7e5b@canb.auug.org.au>
 <681d4e5584d46_1229d6294d6@dwillia2-xfh.jf.intel.com.notmuch>
 <2025050909-muscular-lanky-48ac@gregkh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2025050909-muscular-lanky-48ac@gregkh>
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA1PR11MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: 571d40d9-7293-4799-8ad0-08dd91853312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vsHK+PJWFFOnuVGFYaO7Cm679WHZwsnpXUv7F/5RfgQ8EdTjVzlFQI5ssaIF?=
 =?us-ascii?Q?4fpqMW5c1/FlsVq0fRl4eZb5MYigPgWpNDBPCyWtBBL6Rj77NSkKUxa8gWt+?=
 =?us-ascii?Q?TNg7SRY+CrWvZSpkovhi3d/Uy+sRTiaH5VVEoxLX9vCAJ2MYIAX1ONu5oVz4?=
 =?us-ascii?Q?qMQPsgzZIkfdVDznw2kN2x3Ygc0N2tNLysAae2Vv4LVottMVPbyp333apjz1?=
 =?us-ascii?Q?Cn/nYBP0T+P8+DCPULIdgeZPcbngnVn6U9w3K0sIdG41Km8goV72lB0DC5kE?=
 =?us-ascii?Q?iHJk11SeqA5vg2K0MJbQ3tcjs5tCefoBM/b3I7iqUX180JtIQahi+yQxYPfj?=
 =?us-ascii?Q?4wPeqDUhQ78cPVaAv3msOsvLFuyzUUNiIV+J9SvFtOC5+Zr0Sj4cg/p3dLag?=
 =?us-ascii?Q?xDfoS8thRC/c1rmuRZn8fN3veVaitGSebWWpB0EIxdoXb7+q7EoXkbELFQOo?=
 =?us-ascii?Q?F6LioW+YCy2N3xY2dIAZ/LDm0TIr25YuWUKWqWRJJD8GcX7XSOMXDLaxz2V5?=
 =?us-ascii?Q?V+ajeQrdD83iOrOgXxx0UQycdxEOdO8rMYC8zgu94QghI7MDZv91t59Hd0OQ?=
 =?us-ascii?Q?HR+SKBHEoYGYezwgRfhDSodw4cbQpNLjh+KXC6mNY9EUE5wFBuMFVZ65bFfG?=
 =?us-ascii?Q?tWdBOAq7XQoAH/ylSexgt4TM4iZShYT5+DsYuTOPaHualQ0UQ5ieRCm93MBF?=
 =?us-ascii?Q?V4Yhr2nrunJl9pT1+JifupdHITZs0sdPJqHBdTvWgDYLkar8ZdaZhUJh/rla?=
 =?us-ascii?Q?tUxCmyBN4Fyr1IA6/4pXrn6DKGRIgAhAr5mKgpuEFS2oBYWUC2U/T6q3W//J?=
 =?us-ascii?Q?6i/P2H0O0BYJjMwhj9OZ1j/lgZfbVLBcy9J8v0+TUhd7a3E5M5CrTjrm5j9e?=
 =?us-ascii?Q?4T/hkQbF64btwpc5OUSRsTCSpD6g/rikaWSYq5gi7/8KkEHOblFKD7Lie6rK?=
 =?us-ascii?Q?zFUPQeqP0v0oXdD5OZx8bPX1egHi7NudshuN/SmflKCuy3qTFPx0Z0ekRVSS?=
 =?us-ascii?Q?qDU5cUNc6vMR0vjHISddw5x4kaxmJkrs/gU1Ym0s5rqaGZ/8+P0HLmMUlRAy?=
 =?us-ascii?Q?TVl8yimpvBi2pEjmCBIV4/7ee4jjNBEXNs6qW2qjA09JhXjNFCzHgT6h/93f?=
 =?us-ascii?Q?2saqGwL00d9iG1Pf0kLYsVVilnTux67s64OSUqn3vSurXVFKfWONF6udiGRX?=
 =?us-ascii?Q?cGh3Z1zCn/Gn+KG7li9gucschUJYYLBbKj4SHWhL/jkeDHp6Ym/XoutqSfSm?=
 =?us-ascii?Q?xbtpRnEgTW7ptRjRE1kch//Dv7XoywlZg59mEr1MSzSEO7GC167odZ+xZg0w?=
 =?us-ascii?Q?v4zuc7XZIU3udpZ7K5uaRkU6a5Q6inr8R9H3gzDw94tubJF5dAIoVnmqwI9O?=
 =?us-ascii?Q?OPep5ENRK27lmbWZNuqFqcuQd/VqbP60l3da7uUvUA9J34+mW/d/julSHwI7?=
 =?us-ascii?Q?12Kr/obuQq0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ebSSAMvQm1uXEwqfOdOJJBkgR7vtAWW4JT5rPAo4DvlMXtPZnFDrRRRUBURc?=
 =?us-ascii?Q?DPq/coriKkDylE0+O0NndwfYTmrKlqSerDhiml/v7I8U29XQwfmk9wd8wvUo?=
 =?us-ascii?Q?wnEnyvr3pjzxunC9Ta41zhG6+ovphbdzIW/apljLGChsYIEDpjt2gTrPIIDl?=
 =?us-ascii?Q?nO2AB2NkSs3Sm3W42L1Enp3+EfcowZQDbTlHtLIt4U3yJqDvu6Br0xT/q84i?=
 =?us-ascii?Q?oOPyB3u1W529+oZutKaiyjKN1b4mgUidr9fHY0Wv6yS8uYEe6m6cex9HqMig?=
 =?us-ascii?Q?ccWmC83kYiDHjUdEYQZ0Ss/shtwEMJTmnGQLfPbCr93w1U6CEuW2lYYID2Bi?=
 =?us-ascii?Q?v8s7AXUTR8BinssYZseIqfr8SqALADERELZD6iPwN6Ap6IwcmD4wAqgCOGI1?=
 =?us-ascii?Q?laRJ86n6DdW3zntpXNsfR93H5ueVIhtE9QgXJotXIaKmEuY0MxZ09ehBPxJa?=
 =?us-ascii?Q?TTbJLQzLdjeQryg1pC+eUJzLA2NW3f1J/uWvH+DlaGmYZ2lT+gfOyCJD8x2z?=
 =?us-ascii?Q?dVGslwIwi0XIQn/vapSVKi2CnVNpn4+0rB+LZ50KlnB0rlIs7GHQIJ4zl1bZ?=
 =?us-ascii?Q?x++5fZ4Z7qnEfAq57433rRrp5xnrrP40jGw2AcTcTrwPLWPCFm50Kr2Ygew9?=
 =?us-ascii?Q?+NC5SmIQvqirYY6xCaS1Ogrz6zvd9LZ7bPiQsdF75XaRq7cnoKEQv/Kg+KMg?=
 =?us-ascii?Q?/sctTZ8HTym/0jJY0VJ/dtdxkawOi2qJyaCUF7xA5xbafuQq/mQsPFOUwcwX?=
 =?us-ascii?Q?poLBd7X9fu7Y5J+A5iNn3j241KoKE7bdx6BBVFC+jVvi560GoVh6griI0bKS?=
 =?us-ascii?Q?LjzCPVOsG6MOzlBdidfJtZsVwcfgnKk0Ca3hDzu5IXwVwMMneZGxIhlvRDE3?=
 =?us-ascii?Q?1zJZ7JxXcIm0+wQm+FNMoAgpggUZ2eWwqH6Gi2HkRU6gpa/mDzV0Sc32q6zf?=
 =?us-ascii?Q?yjCBKHLOGG53+N1PRg0/t89+D6bXAKatzIiTAMsTiNNx1+Y5MGpklqiDJOBv?=
 =?us-ascii?Q?PpdVr+kAmSmjdgrZ4r3xNt08RMTArNdYIPWuxUvlxa4v78mrRwKy56lV0iGY?=
 =?us-ascii?Q?Bxuuzco/EI7hErmSAtBxsSqTCKPjxDUnIbAjpfO3reNpTbno/hQv3mjoQ9Si?=
 =?us-ascii?Q?g4TGh0PwqvcMbRe2IPm7dpRDED75gcgvZqPI3RKy1ILXVo//wozZHBrbrG+u?=
 =?us-ascii?Q?NMjJm/CmiOH82w8BZYt+75yDD2JnVGmC8sl+UfVvVUT6WsW2erjQzl/q1oue?=
 =?us-ascii?Q?gDb5hgxhVsvM1EchvRaVUhW2lq84VGyf5BxmOh4luJqjKYmuDbTtYtV2knr4?=
 =?us-ascii?Q?KuSiDukCS6y4RTLFoe9Cc5q80c4kyV48blt6Q2saGLppgZ+Q2FsXKSiBqn6O?=
 =?us-ascii?Q?nUdZ+AKHhb9MJsJ+bryE9CCbT82udduSD5TpG8n7r8omgX13ouPmOOymZs/I?=
 =?us-ascii?Q?2prNorkJb7nhTUCHUNm4AGetsY1p2vNvDUyDuxyEbFFJms7ZggxvuJhpPqXH?=
 =?us-ascii?Q?hqrYLW10OWCbHGPSnWG36b4Mp+IFSWwciHe27Dykac7lUaEoIhVGlylfxy/f?=
 =?us-ascii?Q?PZvyvbb8rKCDa+lp1CAxvBtI41k2Nz89HbGe5T29x6eTccqKDMTAMi3BH4w1?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 571d40d9-7293-4799-8ad0-08dd91853312
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 18:45:43.1421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhRiPExe7i7pkdDltSiAZvOnYe05Kj9o/i9rhl2wJl5oL6HNHJZ/aNIPTIy0GBNa7quKoKwxPEIlCz4p1KFxJX2vLxtpGwLRD3jiLqtwgUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8200
X-OriginatorOrg: intel.com

Greg KH wrote:
> On Thu, May 08, 2025 at 05:37:41PM -0700, Dan Williams wrote:
> > Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the devsec-tsm tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > drivers/virt/coco/guest/tsm-mr.c: In function 'tsm_mr_create_attribute_group':
> > > drivers/virt/coco/guest/tsm-mr.c:228:29: error: assignment to 'const struct bin_attribute * const*' from incompatible pointer type 'struct bin_attribute **' [-Wincompatible-pointer-types]
> > >   228 |         ctx->agrp.bin_attrs = no_free_ptr(bas);
> > >       |                             ^
> > > 
> > > Caused by commit
> > > 
> > >   29b07a7b8f41 ("tsm-mr: Add TVM Measurement Register support")
> > > 
> > > interacting with commit
> > > 
> > >   9bec944506fa ("sysfs: constify attribute_group::bin_attrs")
> > > 
> > > from the driver-core tree.
> > > 
> > > I have applied the following merge resolution for today (there must be
> > > a better solution).
> > 
> > Indeed.
> > 
> > So it looks like while there are plenty of dynamic binary attribute
> > creation users (see sysfs_bin_attr_init() callers). There are zero that
> > attempt to assign dynamically allocated attributes to be registered by a
> > static @groups.
> > 
> > The @groups publishing model is preferable because the lifetime rules
> > are all handled by the driver core at device add/del time.
> > 
> > So, while there is still casting involved, I think a better solution is
> > to make the allocation const and then cast for init ala incremental
> > patch below. Cedric, if this looks ok to you I'll send out another
> > partial-reroll to get this fixed up so the build breakage stays out of
> > bisection runs.
> 
> Ick, yeah, that seems ok.
> 
> But what are these binary files for?  I looked in the documentation and
> found this entry:
> 	/sys/devices/virtual/misc/tdx_guest/measurements/rtmr[0123]:sha384
> is that these binary files?

Yes, and the expectation is that other confidential archs (ARM CCA and
RISCV COVE) will also publish a "measurements" group.

> Why is sysfs being used to expose binary "registers" and not done
> through the ioctl api instead?  That's an internal kernel-computed
> structure, not coming from the hardware, or am I mistaken?

Cedric clarified that it is coming from hardware/firmware, but I will
also note this file interface is in the same class as
"/sys/class/tpm/tpmX/pcr-<H>/<N>" and
"/sys/kernel/config/tsm/report/$name/outblob". I.e. platform provided
attestation evidence to be shipped to a verifier.

