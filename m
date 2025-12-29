Return-Path: <linux-next+bounces-9508-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BA2CE654F
	for <lists+linux-next@lfdr.de>; Mon, 29 Dec 2025 11:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D13B3000B79
	for <lists+linux-next@lfdr.de>; Mon, 29 Dec 2025 10:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EF119CD0A;
	Mon, 29 Dec 2025 10:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsqTHyLF"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803468821;
	Mon, 29 Dec 2025 10:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767002596; cv=fail; b=Tf6+2Yjc7cFbJIbu9A7C+Ezr1PCi/qzso+EIUfHUkA6pJtNUAknWubZgYpFc+YAJBDq/aB2OSZD7hrcthHzm23RPBFcwG5yU13eBEDoILHfpaKuupewuflkZNPLZU5ZNcwuVIinPxO06QmEs2AYK+5zv8gbOH10HmZx8un9n7iA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767002596; c=relaxed/simple;
	bh=B7VvhmOKCIK8jXNy8WkgfJJwALy1m0UDfBqSajiFMR0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XwZhgxADLhloVO96zZ0MHDgIwRjPrFNgosM9Sz++kcPAm1DurvRSc1z3JFuO9g0lfGPFoQXBuhUH7dCNLZQw7Rg9j6JfhyBy4nv8YC7VIDNcGyKfz772vx3rvK5exvULQ1jOVHo5/YquenZhpa4Z2MmV/8+fsE3d+b37PTkT/l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsqTHyLF; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767002595; x=1798538595;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B7VvhmOKCIK8jXNy8WkgfJJwALy1m0UDfBqSajiFMR0=;
  b=jsqTHyLFbq/Jd0BjPfHfvDtSqtDJZzUDXs8ejQWvrX8IiMjJcMeL3LT0
   s7ZLys2DVCiJltvhFLB178Kp+j6dNHcV+gVE4qr3xKA5b6GW3S51Um8Or
   Ei+Asz55vQgt3RsqFDXHTq8qbm5JBnhbAzyvVaDipOK3tSNCaOqGICsTs
   y0GY70J6NG3wAimQXc3MBF0FqyECV0bujoEfEMXCAG/nUUSYFcfo2y+1l
   ClltSCIge1NcoYWRrgA3T+NhcoLh97BaK80WdQ9abBajyETDCfh3F5mOx
   5uqkPLJPmkK5jtfnCLWeHdC3+U6UD0NvypHbCqGjWFy+GpVpBdwnrZuFy
   w==;
X-CSE-ConnectionGUID: vQXiLwcCTEWQ84DA2S+rUw==
X-CSE-MsgGUID: 5XGTtkQ3SVCXCo7S0JocRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="91268463"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="91268463"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:03:14 -0800
X-CSE-ConnectionGUID: zqvkrQ7qRNuX6AhbJm+ImQ==
X-CSE-MsgGUID: Oss/NLa5T0yK8kZSJdWmtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="200782867"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:03:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 02:03:13 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 29 Dec 2025 02:03:13 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 02:03:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXhPVm1FzI/vVWQP0y7QhuDRd4FcaCD02GgYGs0/bgq/5TDhMlBHX8FIjfA7hFrphCY4QaCxBjS/DdHlkb8k5/5a0zQk6EBOAlekSHI8SkVcSXsxCKXyMf63ExSI7pmCZkiv22axx6+0dHk7a5S8x0Wm9JQAeNQSmDts8n7mz2b5IJf0GUn9MEvJCuwCA9GfPEryiNon8htbWB0uFe5/ddLp8PYLgfG8ENemv0vz+h+evIv+Qr7n01O1koAx9YnEBCL9fPLc0fvChpjhqC/qjaa+k6JPDkjvnLs1VCQ5UyR5xuxdC4S+isjF9HKJY8TNv0VmBAbQKE1+C3yw9VNzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgXsSSP+VwJsqprlAtxgVuMImx09tDtS8fEXz3qAE3c=;
 b=ohoAuabyPexHIbiUAHP+2lggxXmpcgJ/gM+VZRjB7dhcramifjGAK2PJ4f+Lg2nwIM6cjdXAav0cBOg68wfVQJ53uiUI9oDPlhpBv0JZllex7Wxyy2J9/bmRQN1hvZ91rsZIJt0W/fg7f5rbIVD/vth1B/5CuXl78hOBXAYs0mmv1Telyv71pNx17+lXVeOol3QhQZv7E4nHIjMzg5l7JFLXbNgOeWzRG6KWxCYd5xhBdJVXM6/DgLZif3vYum8/0HE9ncOpHb19MkeN9hYezU/8LH0rs2llYochQ89VuUEv1YqKVd8oNjsF1B3Qg/WPo/Ig2l9bFls5UTWdM86U9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SA0PR11MB4541.namprd11.prod.outlook.com (2603:10b6:806:94::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Mon, 29 Dec
 2025 10:03:11 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 10:03:11 +0000
Message-ID: <3cd18fd0-6fef-4804-9474-41a500329e6f@intel.com>
Date: Mon, 29 Dec 2025 11:03:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: avs: replace strcmp with sysfs_streq
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>, "Brahmajit
 Das" <listout@listout.xyz>
CC: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= <amade@asmblr.net>,
	<linux-sound@vger.kernel.org>, <linux-next@vger.kernel.org>,
	<liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<tiwai@suse.com>
References: <20251221185531.6453-1-listout@listout.xyz>
 <176650962400.445350.17331328109538303145.b4-ty@kernel.org>
 <20251223192409.50a6e4ab@fedora> <aUsBgVbloPqBa6sZ@localhost>
 <877bucgpob.wl-tiwai@suse.de> <aUvP7FL6c1snBc_S@sirena.co.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <aUvP7FL6c1snBc_S@sirena.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0040.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::24) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SA0PR11MB4541:EE_
X-MS-Office365-Filtering-Correlation-Id: b102fa5d-0bc6-4cb7-e7eb-08de46c17943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2t2S1BRSmpSWjVWeisxOWg1akJpSGFNSmFRbzNRME4wYWZQb1JqdGM4c20r?=
 =?utf-8?B?aDR5ai9YSGc0YVpGM2Z0MDZ1MXJSaktKL0g0QlhCbmc0Q3YweUNHa1BqVnVy?=
 =?utf-8?B?VSt2SERsdERvK1lqUDk2UjJTWHJaVlBQVXJhdjR2ak5TajdERHZBMmRpVnZi?=
 =?utf-8?B?cGRIeFhXQnRuUXE0RWQ5S0hEZC9vc2FRL3V1TmZMTFRVNzNteWJ1dDFMTEEw?=
 =?utf-8?B?Si9FZnVpajdOODMrblV3RURXWVR0VHllMFluU21Ta0JZWWNwUDE2R0tYVzNq?=
 =?utf-8?B?Y2ZwQ3ZvcEk0aWN4YkpycHpwazZwKzUyYVFnM1R4WFJYSm9PQU8rZlNkNURJ?=
 =?utf-8?B?dUJ2QUVUcmtOa1RMUmRKelhEQ3ZPaVZkMnI1L0RwNmhLR2RRVDJCV0kvd1Mz?=
 =?utf-8?B?WWk3MlF3bG1sZkpCYVlFZUxxQXlmRlJpRUFndC9NczZhYy9yeG9GUHJhTjZ5?=
 =?utf-8?B?ZlRnUzNlUjZubWZHMnJzblpiRkMyVit4SXJOODJkRTc0aytEbWZUeWtNK0lO?=
 =?utf-8?B?dUVHckE5R3plRlZybjFFa1BCQjIzYjBhUG90NWRIbzZQSkc1YkJXV3EwRmFu?=
 =?utf-8?B?RUk1Z21sUk11dGc4eDIzSGRFR1h4UHBhR1lIS1picjcyMjQzUVlleDZOdjhK?=
 =?utf-8?B?VDZxNGFtMFlrYW5mbS81RWt1QU9ta2thM1UwdmU0WUxYSUdud0hDbmJPRE9B?=
 =?utf-8?B?WCtYbWd3cXBpdW9FYkFHOE96endiVG54eUw0Nkh6VW5XaGxmRmNjUXNkK2tP?=
 =?utf-8?B?ZmcxdUE3MkFaMzhLL0hzZTNNZXRLTWNiNjJ5UXdyRkVUQitrSDZIM3B0Szh2?=
 =?utf-8?B?RTlmOFlTQlNVakg0TStLeW9meTNWRERMVmlDejRieE9RMGtOZUw0ajdGRjJ5?=
 =?utf-8?B?RkVmYTRaaWdTN24vV09zRldmemNuSGU0eU8rUWZsZVNIK0hJZENxRDkwcGNU?=
 =?utf-8?B?OHFzczNRZzA4U1JtN3lEMHVGTjJsV2xtbFRqQ29oN0dhVGp1WHZHbVVGeDMv?=
 =?utf-8?B?bW5nZlhVYWJqanM0VE9oR2d0NmpDMXFEQjMyK2x5S1JGRmxoUlRVMHl6S1lU?=
 =?utf-8?B?T3FIVitVNlE1c3RvZnViL3hwbXVzUWtVWS9mYVYxLzYzNG1JYlRHS2FZK2Nr?=
 =?utf-8?B?NG52WC9JRmZrZG1TWUI0VkFqVy8wTVJ0VEtaN3dTc3lJaDAwZFZLSldxZnFw?=
 =?utf-8?B?eUx1M2VhOS91TUxlRnk5T205V1dwNkhZNzZ0d3hDZXJ1bk1HUC9FanoxV2dZ?=
 =?utf-8?B?R2VDZ1RCL2N0bTRLYW4wNW5oRjlpU2t3RWcvZ09LUDBCb1JTaVV0eHlFUTNR?=
 =?utf-8?B?d2lCMGhkcTNrak5uYTNhbW04N3poSDBGNSs2Mi9pWFFCMkFKRUVDR0ZyU3RP?=
 =?utf-8?B?UXlXWDhwS29LQmlNWmlxTVpDZU9rSm5OZnJPZnFuUU5VLzZPK29JeVFWc1dO?=
 =?utf-8?B?NjI2K3UxS2c2OWgzci9vZmx0TlVYYkI2eUlWWUt0R0FpNEFaZmp4U2JQZG5Y?=
 =?utf-8?B?V2xnbDFIVlR3ZzNISXZoV3pxWWsrL2ZkVWhoakVnN2RJbi9yUlNlblJ1TW80?=
 =?utf-8?B?ak5EVUJtblFrQTRNWlY4b2RuZlM5T3FTQ2xraDBOM3RZYytTTnpxbkk1TDQ3?=
 =?utf-8?B?b2ovcGVkNXhUUDhWU0hJUHhRY2lhMlZUK1g2dE9Cays4V204YTNGNmEveVVE?=
 =?utf-8?B?Nkt2QzRQYjJXNjR1OWRRSWc1QmxvWFcvYjlrQWZPSHQveWhpaXFlSUswNVR0?=
 =?utf-8?B?WVBGRzE3UlQwMG9hWGZsL0R6ZWd6aXRUK1I2VEpsc0VaVjN1Zkcybngvb0pl?=
 =?utf-8?B?UFEvR2JJaGhzTk1NdFhhdFI5UUp4cUdnaFdLRE1iSFNFcE1Ec2NQRGZJa1dI?=
 =?utf-8?B?SDg4elBmRHlyaXdKNnU4RU5tVUJJU2JKU1dHYlgvcVg0Y2VDa3JyYklpbnRy?=
 =?utf-8?Q?pMHqChOfwPD0YtTe95df4GmLzo9Na7Os?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDdOVHkzZUI5VjBpUWFwWndQejdpT0Z4M1B3ZGk0YnVTRld2a1ZIRFV2ZVlL?=
 =?utf-8?B?NnVwWFFJb25WbTh3cGdjVzU1S3FacEo4RkpXYnE2QkVlWENrWkFhS1plRy9V?=
 =?utf-8?B?SHpZQzN4SWxGc1JwWGFJV2JlallZUEdZV0tFZ1M2RXY0YmNFSXY0dklpbWQ2?=
 =?utf-8?B?YnlWTnZYek1YQ2VHZG5rVjdNenQvUGJ6ZmwxRUNQZ1MyUE5paUhtZnhRSWMy?=
 =?utf-8?B?UFMxUmJoeGhSL2VmWHdrcVVMN3BWTENqOWVYSWlKOERER2dtUU1vQzB3SElV?=
 =?utf-8?B?UVhVSmgyazlBOEFBVXo1VlBNcFhYak1SdWJoVVUwZjVKSG1pck53WUtpNXp6?=
 =?utf-8?B?NmF1ZUp1VUZ6UUtUNEVMUURkcFllQWNBcUpiNEo0T3AyUGt3WVlHUm9DbXlz?=
 =?utf-8?B?Vkhjd0xZYWlZSEFodWtJbGRma3lsN3FzNWFZSGVzNy9FVllnL01RWmM1dzhz?=
 =?utf-8?B?M3UrWWxHWkQweWMvOFF5bWJIQWJtZWo2UVRKcnpLcExmRG0zVmRYbG52ZGgy?=
 =?utf-8?B?RU1VdDdKYmttVE01R0xJZ0M2ZDBjUWZXMjdkWlFrRWRHRDBRS3BHbkQzckpv?=
 =?utf-8?B?N2FSd2VTMGJEemUwUDRZUUQxUGpoajhpa01VVS91NDVMMGFaeHVXYi9tbkQr?=
 =?utf-8?B?alI0VFdVblNCQTRRc01rWTVzbDc1TGtmSjdwcHlaZGw1aTFIOEhpdkE1bnZE?=
 =?utf-8?B?ZkFqK2tBK0RpbUZBYy96Q053Ni9HM0diYmpoUElvTjI5T3AzcmtkVExvTit5?=
 =?utf-8?B?T0NvVVlkZ2ptdXdNL3pSVk5Cei9raUJ1dkt6Tk9LTDFpNml1WTJhWXdqMWsy?=
 =?utf-8?B?MnFMSFdUMVU0dzl4ZDl2dWFRV1JodXVOVE8yVFBHMnVua05CckxjOVk0K2tq?=
 =?utf-8?B?bG83aTg0UmFKVVIzd2VUcEFoWGVGREJJOHppeVBpMFhBdm83MlF4ck9FalZ0?=
 =?utf-8?B?anpsVUxpUWNtK1QwQ3lsenRHUzh3L3pPMGozbWxSZUgyUDlsNzlhOHducklB?=
 =?utf-8?B?M2w5SEQ0eXNRSEdJZGRWWTlpN0xIUXNUWGNORkRtdFF2bEhNeUwvakFpL3BO?=
 =?utf-8?B?dVdvTlQ2RDk5R3BaMGhLSmZBMDgvQ1FwcGlodm13UnBzQVJGZkZnVkF4MDly?=
 =?utf-8?B?T01tRjhKMmpKeHRHcUtSQ0JPUDBTdGFEbERWR0ttdnNHU2FCNEFBSndSMXNG?=
 =?utf-8?B?SkZEZU9PQ3RvUDlyL3hrQlJxbHBweXJ0bzc5aW9KWEQvVmtUYWxVOVdvZEFX?=
 =?utf-8?B?VDlFcGJCaDdqaFViU1ViQ0lQNkNMYmhWNG00Si9NZXU1SzM4YVFMVVhYK0ZL?=
 =?utf-8?B?cVRncTZQMzJGTDl3R1dpK1YvajVZYlhHN0Jpd3lTbDdRMjF5UStCNTZ4Znc1?=
 =?utf-8?B?dmgvWis4SFlSM3ZFbTNrVmtualpUcFNtYUhjaXptN0xla2hQN2QvbFlRZGFh?=
 =?utf-8?B?RWVCR2w1ZkNwc1pFS0thVG8yK29pbVFaUXV4cmoxSFFwc0tuN1pyNThiTitM?=
 =?utf-8?B?K0pxOFNOTUVKaGhsMy80NksrNldQMkZqRGNURDg4NGdCY2NWT2lEdkJwTHF6?=
 =?utf-8?B?UHdLbUJMaFFiUGpDaE4rQXk1VGQzd25KWkhCam9pQVVGSVlMNWoxcFBCSXlt?=
 =?utf-8?B?NXRjZGRuenlCSkJqazZnTjVBTkVBampHbmk0eVpZZTRjNDNLV3VTRkNZeGd3?=
 =?utf-8?B?czExYnlOZzQ4NlFObDNNZWxlRWVFbFEvVklIOEptOE5XM2lpbC9UWi9XaVBr?=
 =?utf-8?B?WE1aZWp5YW5OTjlXd202b3VDVmhlQzByWXlUYzY0NXNkUGN2RWtJMk5hdFAz?=
 =?utf-8?B?Mmd4NVYxK01Wb1B6WDJwRFFBMzVLbjRTTjR5bEI1RjhQRFFYbENmOFB5NDNw?=
 =?utf-8?B?Q0dzMEtQRWlaVjRyRm9ZdWdkWGNudGtwSm5YaThvZ1FDOUxFTSswbFlrbHBi?=
 =?utf-8?B?L2VqUDJUSzljeFlxVjhVcmljWDluOUJrV2hOOU5PbnMweXpUeDRjWGk3RDA4?=
 =?utf-8?B?dFdQSFo1a3VTQzg5RWUxUDNNSEtkNk1ZdnJBR2tBa0liYUI2ZDhGdVNGSDRM?=
 =?utf-8?B?Vnc4eEsyTzMyR2RJYlYzQ1RuKzNtdVMvcnc2UGZ0YVpCV3U3TTVmSjlTQVhB?=
 =?utf-8?B?ZjllYUxNVDBIdU9tdmpRek9yQWpkeWkzRnpTeWFrWFdLdGplU3hsOW1MZmR2?=
 =?utf-8?B?WkswM0duekRac1htMThYL0toZ0RkYU41a2NrOFZvVnBNdHNNR2FSMjNoNHZl?=
 =?utf-8?B?WG82NS9NdnRPNjh3eStnNjVDaXBpVlYvUjNtei8wL1VGOG5KV0cvYTVrSlRr?=
 =?utf-8?B?VndIamZxdEI1ZTlnL2FGb2NMMWsxbGhrOGxSYWo2S2I1cWxaSzNNZkh5NVJX?=
 =?utf-8?Q?Hak7QLxIJ4QV5QbI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b102fa5d-0bc6-4cb7-e7eb-08de46c17943
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 10:03:11.3573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZJ9Oupz/K7vbPAskDMvlomQ2rWIsABdRiUU1o8mnarTi+8lnUJafLJzSJWaW4Gjf6GVIHBH2Zram61qDi4VvIdukyUJ6jBckTvrNr5UhoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4541
X-OriginatorOrg: intel.com

On 2025-12-24 12:35 PM, Mark Brown wrote:
> On Wed, Dec 24, 2025 at 11:05:56AM +0100, Takashi Iwai wrote:
> 
>> I believe it's a false positive, too.
>> Or is it about potentially unterminated strings?
> 
> Regardless of the warning being spurious or not the cleanup seems like a
> sensible one.

Right now I leaning towards Amadeusz' opinion - looks like we're masking 
an issue. id->tplg_name is being used in strcmp() context few times in 
this file yet compiler complains about one particular location.

gcc-16 is quite recent. It's good that we get the kernel building but 
after the Christmas break some digging may be in order : )


Brahmajit,

While I'm sure you did, just to be sure - did you try clean-rebuild with 
the 44-hardcode proposed by Amadeusz? We wouldn't want any old-artifacts 
to get in the way.


Kind regards,
Czarek

