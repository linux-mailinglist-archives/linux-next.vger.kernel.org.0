Return-Path: <linux-next+bounces-6622-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BA7AB0721
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 02:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2693A980680
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 00:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DC2B672;
	Fri,  9 May 2025 00:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpF8nJCY"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B0417C77;
	Fri,  9 May 2025 00:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751102; cv=fail; b=SQ9SikK35gDzD2n4iWN52HqUbu8UHy8ZAkltxxuaVZ4pua3wewKaISQgk9bE7AoGYU4wmQJprBovpFOo4QPVLww16o6C0N4bCIPJSZwuY/TN2lgNod2bZPf2gc8OxnGSsLl0pjnpR/MQgewzujro8Y766LvmopeCFrLPTJ6V8Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751102; c=relaxed/simple;
	bh=La/l0CEZRiTLzCFfMpEO+AA/3Sh90coWp8FiKvslGG4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eKEZywV0gsncpjy72RQsr/uhfKA2pdH/BI7r7eN1Lv0OY0FAl36XFQ5nTh3AQcX08YRi1b9vFUSa1E09Re2jAFECAnBsaEu9ujZ78aL3HN8ysKeqvbjFWeovcOyxvMDsYze9RGHiSQ5eXwPKpN6C6EbymKUlwu7MgyWrWnCsAgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpF8nJCY; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746751101; x=1778287101;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=La/l0CEZRiTLzCFfMpEO+AA/3Sh90coWp8FiKvslGG4=;
  b=ZpF8nJCYma1cmcMXD2ErDM2aN9cNXWP668nA2LyJ4GaIldtqE083xEGu
   Dtrl7N1rtaqwx0VTXnSZize6RVocEZfxDKw2utmO8sZPyJsuL5wnHb6bL
   Xj0669RKVpx6warGKoEAZ0eZU63V16+JpbBhUkz00EiEZ96+ptdiUDiYH
   wVLH1SavM/rBJMxq7x7/cFd80d/0EKV1nN76mtLiPw+C4HyvnnPv8VjpJ
   SPZrnm+KxRDrzJ5Brh+7PtwTd2KCsDspKIB0S5Pgq7uzvYOQH9xnWyo/d
   KUvxGUajIcvVIOJuoDJSS2gvmL0lMACxq4yWSzDDYQ6qsnXIuHH3Ldr4K
   g==;
X-CSE-ConnectionGUID: HVA44m5BQFualsgNzKEv7g==
X-CSE-MsgGUID: GWZB7EX9RWSn0e3TSe2TKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="73943902"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="73943902"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 17:38:19 -0700
X-CSE-ConnectionGUID: eztmBPH4TsakT4kf2mTmwA==
X-CSE-MsgGUID: RVC8YmFdQyWrtaw2ooEHNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="140504916"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 17:38:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 17:38:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 17:38:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 17:38:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLR2fMm+0HTpW5FJw5UoqXf5sgMD2tCUJ5TtybyARxo4GreR7OCgjU9UkIm/q8Gayb6OfYeZCelqbBWeqQg6MQu7yQxZQoVrkcgOhbzUXp1DfqRbvMkf1G70xZg50hrGfsW92HlR0qy3/aIz2sn40lOJh/g31/J8mN9lMpO/xyAjq0gKgb+HWI061ruKWhAVcrpktQh4EONTeWBGgLUwiRhyLp/OR8hUXP/FyF9pTGy0Xqx8g9o1tnQaM0GhuvKXIaSRiv3f6PeU5eVydQFRff4FPN8gAxAyd6y0xFoi9/DsCAizPP+Ha9AwNCBaEJWcvj/N4Oy4WLDkiZ48J25BRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xWEF6bhvHRJA8UhDA1VjL0gYq+aqs236TxkfEXSdrg=;
 b=kEzFEJNlHTNrCF8N84qsuYYz7anBn8YD22LYVsS0LXs+YTL6X0/eJoCcfRO9GrmQcCW5h0tAEHRCZnnfOHKibp1d8cQDNBl5X67ZIPDExHrwD/Gm7BmzkxsVF0yipCuqICfc4DsJz2diBn4gyJb7rwflEUpkMbNrFXk1DrFbC/kCf2N3hOB3MSowfYQvsmAOm4xILXAtIQll5pB9RTpHamj0IuCZoZxeXABrgCc+mMt3RLb3sQ35fHhjO6zgNezjkwH4rr8I6Lo3vc0ndvSUPoh9qZqjaZjj2d4cNj0o064dkvWvSo/KPjYqZy7PDHSDk8qZSBwnWH8luFy9G6/jzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH0PR11MB5267.namprd11.prod.outlook.com (2603:10b6:610:e2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 00:37:44 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 00:37:44 +0000
Date: Thu, 8 May 2025 17:37:41 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dan Williams
	<dan.j.williams@intel.com>, <sathyanarayanan.kuppuswamy@linux.intel.com>,
	<yilun.xu@intel.com>, <sameo@rivosinc.com>, <aik@amd.com>,
	<suzuki.poulose@arm.com>, <steven.price@arm.com>, <lukas@wunner.de>, Greg KH
	<greg@kroah.com>
CC: Cedric Xing <cedric.xing@intel.com>, Thomas =?iso-8859-1?Q?Wei=DFschuh?=
	<linux@weissschuh.net>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the devsec-tsm tree
Message-ID: <681d4e5584d46_1229d6294d6@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250508181032.58fc7e5b@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250508181032.58fc7e5b@canb.auug.org.au>
X-ClientProxiedBy: MW4PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:303:b8::35) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH0PR11MB5267:EE_
X-MS-Office365-Filtering-Correlation-Id: 55140023-3dfa-4ae9-62a7-08dd8e91b66e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lKYNMpHCwZR7fo2vz7M6L4mn7+XX6lqGUPoiyAlwr68xeaofok+5cDNru3JM?=
 =?us-ascii?Q?W5NPhHTo7x0HuW0ZszZdxQpKvuVex42uNKzuGqjnyVhm6fzFbG5CD1LblbrV?=
 =?us-ascii?Q?DWfCOuovRe4FcovhI6BCWCfK9rMK619PGtMVoOLfY7+3k4kb8cJpxtRJzdWl?=
 =?us-ascii?Q?S1miHzNCJGcX6/4RpQ9HriZHr8OZj417uWfg+kFqn8sGO1hEeg/Hu6+cLsIm?=
 =?us-ascii?Q?APRH8+dbmZFemPruGf9vQbgO+QGUlku+J20ddtYZsCGMKTbwoAq6a9VDEeO4?=
 =?us-ascii?Q?iBnWCLVxrAFfI5jfemrNM/IdXu2CArxVVWOGp/vi5IPVPHSbKagcrIIFoDDN?=
 =?us-ascii?Q?QNhIAoOouvPFLnSo5fjyd0ZHVJun6XDvbSt7xFpWNcIMsw1W4uAca4YfIYGp?=
 =?us-ascii?Q?SycH798RtGoCoi3bOQzoDGrfxQiEIIS1HKi3bCqjeLTF+QYPLRB3/s/X/iVi?=
 =?us-ascii?Q?+x1tcCpYWb7hzSgtVyTUL3cJ/d+Jqk279okVMqQCUcGoczhiK4u8qdaBonGz?=
 =?us-ascii?Q?1cTOpduxrr2edhU0A0L2+CUyCXSuwm8uUzUXZUlRLU6oAzsmzCHm93U42hHn?=
 =?us-ascii?Q?xdtMdbMx9pQz6RryirQf6LStue5UGpCcAjEWlSmk/jCQE6iflgEPQ2VO8hso?=
 =?us-ascii?Q?+w4Mu6hcESwXTqjr91BPqe3diz8hc/cmNOYvHnpEt7SAnb5zwWyBnajDT9Po?=
 =?us-ascii?Q?eXiYL2wecSp6hogMbqY/dxvpqFsci/8JjfG3gyjn/CSoLNxv+PTgWiNFmDFj?=
 =?us-ascii?Q?a4PtlMLxUMTW9Pst1y4rYfQvvKXiopk+77q7GjAh0gMhikNlkP6eYMJfNqyx?=
 =?us-ascii?Q?lNO8hcaYXVEFw5QpgS3enEcsbbPpspZTjc0Fqo0mV835eA84r99ZPprFh7Z9?=
 =?us-ascii?Q?ksgIubxfhQVF7DFG0buovJN7MjW6FzSPUbcdP3qZqF5BIQYXJFSWQVDsSctD?=
 =?us-ascii?Q?1mrT0uyhiYgRj/tlZrZLp/idR+oelNvHvg6GbBEKyouehKN2McOpxm0DM4/w?=
 =?us-ascii?Q?JAxwD9lbLFCo/rNXGrVcg5lsZNZWGWrGYoegbM2Y0RJjpJkiVUVTuoMpOPxN?=
 =?us-ascii?Q?U0EQxhNwdBCqjdUVvp80L1mWlUB/Qay8mUY2KTeL6L5XVf8pb7cxihsvaxN0?=
 =?us-ascii?Q?LYiyVxBzXQUn2ECaOhg/euCsPf9aFj/iqGDuQcxJnjEgVS39plez5iCXvwu6?=
 =?us-ascii?Q?FAo1ciE/D/k6ikUIBQYfHYieT9GYl8RNCcyZqL5OACC/jIqlvmcbyg2aymLb?=
 =?us-ascii?Q?2P0LqmQ0iUP7qL0F6A5CITWhlAEPwXPMuHKoIk3ne6cONJ5++DM94rhgXZEw?=
 =?us-ascii?Q?it9LBIlXFromvx1ojwbIkp8+YP55k2MDsbgD0EmApqNFyCrr9sikPLFQrM6O?=
 =?us-ascii?Q?JGGcioLFGsX3HnKE7Lxm45wM6GjnOKiWNjIpBf9nI8J/UYQ32kgeEV/tUMD6?=
 =?us-ascii?Q?X0Qg0b+cfAm3XDf9S7/IxGCCDUHFCdHqdxtT8S2XvQoEO5YNBccNdQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NtZAHHE8KnyCE4OGmy4XKsdE4HUXCoJ3sIWnO3h53WWeQySgMbbyvsEFR8PR?=
 =?us-ascii?Q?o3ku1NBp05QeZCTETI5BlDew80DSdCwigIf1nkNo6ajB58DByRSU0lyR0sDn?=
 =?us-ascii?Q?i4Mcwh+qgCf/4yHD7wAxHhFuz1OxOJTNwXrtLQz+Xkker2VAmZc0P8gjJ0uS?=
 =?us-ascii?Q?ReoMfBfB2vRJJlaePrLWahm73g3GdJyDsmN6yVc8iFisurI2G1zbi7GiVwJ2?=
 =?us-ascii?Q?Z9wRE13B4kyUmvxyW1tbLcLN3JFs5/eBitaoS2rT9BdYBNKWbsZPZ0vQ2W2m?=
 =?us-ascii?Q?vYbHZfkddceaycNPnj24li16Vj5wAaWzNQ8P0mMEotzq0D3PahJO6hZXDB9A?=
 =?us-ascii?Q?ml+WQtz33+wjg+dEO1jpd9mE1OWAIuffvnk09S6Rw4wcpRliuIatub5pviPs?=
 =?us-ascii?Q?+V6qXA4QtbKatGcb5QrgsiYHBAEvi3TINZlne+syChe5uCSYYhdn3yJc8duI?=
 =?us-ascii?Q?bIvKXbpuz0j1Vb0KZK2hpInrzL35zkLKAMR8XobOr+XUkR9tBxsarF9pGCvK?=
 =?us-ascii?Q?U1DKJcGEIl91SJ4ncwJtGTuFNU9VKZaU5MWDqXZ0RP6xUngcSlv7XEnIW6re?=
 =?us-ascii?Q?vTRKmNo+RHt3miaz5I39WCLxV0j5YqNdQdWkJ8gL5AHF5BWnEdP2uulqpBa1?=
 =?us-ascii?Q?Q7bz7anxYJViMOus1/DOjCi6LBRn3IE2teHzAEE6xEJhHy9gWQppCtg7bO4u?=
 =?us-ascii?Q?G+4lMfKUqhgp/5DHEKH2o6o3Lj7K5Ivla8bxfqkiE/2nv3gI51qxHhvWBxYO?=
 =?us-ascii?Q?UhOMQmqKIZ0ZBwv7r4C/e1KNvVJd0pVOtoLyDG6MaTQT+wGoz+SYKvjlFb8z?=
 =?us-ascii?Q?SJk9SmVWY/uS9vMGhKxYJas7SRzQv/I36EAEIQf7Tqlp+7tsnETnL7t23cI2?=
 =?us-ascii?Q?Wq9kr0s6FWrI6XerNM92ytxT5Uti5/UQd+k7l80xLDyxBD4s+w1dRsH0nGrm?=
 =?us-ascii?Q?4AyLwpyXk6wymwNNj9Pvy75tU9aPBFFoQ/zdy48w5Pve8l5h4FBWpDtDY2hW?=
 =?us-ascii?Q?sockJ5dU3lEGTVnWRof7KJHHEwSKWuEo4o3CILR7XLdSJRrUsGWtakC371nS?=
 =?us-ascii?Q?tS2oCAhxGX+khNQWbouUyfcIlUGwyU9hxYwy36DOr9TcPuv0dm5eyn5zp24E?=
 =?us-ascii?Q?a2zcWGLk3kfPVn660k9oxr9AmiCmuIpljVx5o7G6+44bP8fXmdKnXSi9t3/W?=
 =?us-ascii?Q?BCIHMGYCbOS1UWRxQij/vc4Zm5aLpckGn0wYEkVzdmMXm5yDLJ8YpAtAAW7E?=
 =?us-ascii?Q?HJW5v577ZY2j0uM9OFCzeLbaCBFy3NnO0xYj8EO47z5b1oJnW7uhmUEuSpdD?=
 =?us-ascii?Q?U0tYvEeGIWs+JR4t4SStvy/9Iv20doFZnKgEetIXD9Epp4iCAY4Ta3AT+WJW?=
 =?us-ascii?Q?PItK+FG/54kn6kBYUb6sqcTFm0shIHy3csbPGL3X9Z8oaJnMlvJ6qvskTKM8?=
 =?us-ascii?Q?9xf0aOX9VhU4J0c1A7W8iSFHM6U07TvW55xdkWwXNkyr0iYVbFJUoRz7D6Yw?=
 =?us-ascii?Q?FRD3K+2Ss5uafGdjxEyS8+9yEGEFcFgo0Do/B0c4EnPjJek/JM8nXgtnmKcL?=
 =?us-ascii?Q?eUfsYjjy5p3+rcWApuVnF6ioHLkiEdR1+E0ijMMzw7MjtgjVGG5RBQ9ywcNw?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55140023-3dfa-4ae9-62a7-08dd8e91b66e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 00:37:44.0594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qb1eR9z1hJd/8ibWbjJWE1jGwtExLHbTOSmgsn4hHO6ExC+8LJR0SJdmvTlgUwxG9kYrqeU5nXCrmPe+xKGhlc+PDU1SYP8WCKfsndRhwaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5267
X-OriginatorOrg: intel.com

Stephen Rothwell wrote:
> Hi all,
> 
> After merging the devsec-tsm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/virt/coco/guest/tsm-mr.c: In function 'tsm_mr_create_attribute_group':
> drivers/virt/coco/guest/tsm-mr.c:228:29: error: assignment to 'const struct bin_attribute * const*' from incompatible pointer type 'struct bin_attribute **' [-Wincompatible-pointer-types]
>   228 |         ctx->agrp.bin_attrs = no_free_ptr(bas);
>       |                             ^
> 
> Caused by commit
> 
>   29b07a7b8f41 ("tsm-mr: Add TVM Measurement Register support")
> 
> interacting with commit
> 
>   9bec944506fa ("sysfs: constify attribute_group::bin_attrs")
> 
> from the driver-core tree.
> 
> I have applied the following merge resolution for today (there must be
> a better solution).

Indeed.

So it looks like while there are plenty of dynamic binary attribute
creation users (see sysfs_bin_attr_init() callers). There are zero that
attempt to assign dynamically allocated attributes to be registered by a
static @groups.

The @groups publishing model is preferable because the lifetime rules
are all handled by the driver core at device add/del time.

So, while there is still casting involved, I think a better solution is
to make the allocation const and then cast for init ala incremental
patch below. Cedric, if this looks ok to you I'll send out another
partial-reroll to get this fixed up so the build breakage stays out of
bisection runs.

-- 8< --
diff --git a/drivers/virt/coco/tsm-mr.c b/drivers/virt/coco/tsm-mr.c
index d75b08548292..7fe90fae2738 100644
--- a/drivers/virt/coco/tsm-mr.c
+++ b/drivers/virt/coco/tsm-mr.c
@@ -169,24 +169,27 @@ tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
 	}
 
 	/*
-	 * @bas and the MR name strings are combined into a single allocation
+	 * @attrs and the MR name strings are combined into a single allocation
 	 * so that we don't have to free MR names one-by-one in
 	 * tsm_mr_free_attribute_group()
 	 */
-	struct bin_attribute **bas __free(kfree) =
-		kzalloc(sizeof(*bas) * (tm->nr_mrs + 1) + nlen, GFP_KERNEL);
+	const struct bin_attribute * const *attrs __free(kfree) =
+		kzalloc(sizeof(*attrs) * (tm->nr_mrs + 1) + nlen, GFP_KERNEL);
 	struct tm_context *ctx __free(kfree) =
 		kzalloc(struct_size(ctx, mrs, tm->nr_mrs), GFP_KERNEL);
 	char *name, *end;
 
-	if (!ctx || !bas)
+	if (!ctx || !attrs)
 		return ERR_PTR(-ENOMEM);
 
-	/* @bas is followed immediately by MR name strings */
-	name = (char *)&bas[tm->nr_mrs + 1];
+	/* @attrs is followed immediately by MR name strings */
+	name = (char *)&attrs[tm->nr_mrs + 1];
 	end = name + nlen;
 
 	for (size_t i = 0; i < tm->nr_mrs; ++i) {
+		/* break const for init */
+		struct bin_attribute **bas = (struct bin_attribute **)attrs;
+
 		bas[i] = &ctx->mrs[i];
 		sysfs_bin_attr_init(bas[i]);
 
@@ -225,7 +228,7 @@ tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
 
 	init_rwsem(&ctx->rwsem);
 	ctx->agrp.name = "measurements";
-	ctx->agrp.bin_attrs = no_free_ptr(bas);
+	ctx->agrp.bin_attrs = no_free_ptr(attrs);
 	ctx->tm = tm;
 	return &no_free_ptr(ctx)->agrp;
 }

