Return-Path: <linux-next+bounces-3403-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB20B95D605
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2024 21:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A255D283EC7
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2024 19:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7237018592E;
	Fri, 23 Aug 2024 19:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1DS4BZn"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2258F6B;
	Fri, 23 Aug 2024 19:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724440856; cv=fail; b=ghSVoKLtn1s49PYeeljrzkbp1q01ijOjJnmhxSMhkCiz7fxoIQIUMIbFyepJvuPbFPlzqIrqsaIyVt5BB4JwPmv8dBaAKWRnrQ9JFhd26HiRNBhtdmV5dKNUZH5PRLGz/WJsxF4CnSvzpdGVAL8kStgcnewRXw9oZ7kBMl+JDPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724440856; c=relaxed/simple;
	bh=P0TBcTpD20t8KjuQAvoZJAQRtpY4/+s74ZYBk0RT+Ns=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ReOrVobi/qxww7COMPnOZFCfN7vTpVMLbHufwlkE7ySTd8BXug/gHM3YiR/FLvpF0vV8lEmIWJYcZJeJWn8a1zgIb3GhfoIfjiYJRC29HzLLeVz9RKj1eqiyqMmyleZzO0ZaX2fqddzAokOPu5g6GFEts6JYhEz6Lf2jyfKZbKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1DS4BZn; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724440855; x=1755976855;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P0TBcTpD20t8KjuQAvoZJAQRtpY4/+s74ZYBk0RT+Ns=;
  b=P1DS4BZndE/KvxXZlDDc7xa2z8iAEa2w3or9ZEdskDBqBMJepHR8OgJs
   oszVsjzabDrHuQNxVk06R/zOl6f0NVDtg1l3aN7UWXq7mza2GeXAJxrz8
   mYPRmuhZFRxHX+d27I6X9kreinf1X3wWPzrcFWuNDDHLI1RA7xCnlqFaf
   RexQsbcoXtb8yF6PEFTnir0fU7M2a6qXHyQk7SRljXko+UaRMgQkpps7a
   E/MQcvQGqlpcpFW+qSATbCwWsxdKzIyUnfStludCcBIR1Q/pu01KGSt2g
   zQdtBbPQ8QHYBB7NlW2nWzRZJU7b6ScZtGmhTnftDvOTVFolK+p6/6tBx
   w==;
X-CSE-ConnectionGUID: eYCq0i9RRaeDov3VoniDjg==
X-CSE-MsgGUID: CRJw3UYaRc6eorpPab/FJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26684395"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; 
   d="scan'208";a="26684395"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 12:20:54 -0700
X-CSE-ConnectionGUID: PejbGfWWTamm0Lrfwl8+Fg==
X-CSE-MsgGUID: D6cgYsv7Sk65kuCO8cAidQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; 
   d="scan'208";a="85068510"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Aug 2024 12:16:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 12:16:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 12:16:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 12:16:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 12:16:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3dogvVcPaLCWB5dNvSmFspd8+Ba0adp2OjY/vL2NETO60G+YgK+73CS9FyNhJ8JkWmQPl3Kcz/XKVm+3GLaOyMuezhqP5Xs0vwKz33JAdB3YArM8jThZ1IXDjkXNHkgI4z2DWKOALa/W0shiKeR7678yjO1g++SeK9c+OfbgAuRNR+jegyLnL5DiKN+s0u/0HTJE6/UJeiXYsRJnPCSD7ZbrWlXHNyCjHiy2gQvQc+eUHGLq0aQHdUsZmBE2J7AKlt+jQDEzfi//SyLUdncVtBAKJ3m209O3uetIoJlacNuRRRquYp8M/X7aTGFc9khtcXtuIsrI8Hl9zDgjayGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEwl7BbEuYl5W2RM120lutVl1E3FeEwyHbmPJ56o2DQ=;
 b=TghtaKeZJkkwSpdTM/PX6+uSzXN8yfTRF61gdQ5Se3yidahKjIp+Q0q2U5/2x4gmzzavikZDofqgscUT+L+BkbllFUM3LVs17hKT8szrRoGrK09JwY5zDahyQZYKRL14fCT8uoOEz6jL8Ha53QByAUdtQ+4PtDegRcsRJhrNf+HE+0CNokHfbvE7HLFV106llBw953iIvPlMUAD8acuarFiu+S3XJEOzUgKTKofBwio2ZRLwoUJm9oRzNw4Y9lyK/6WdafPDlSfQ47CQRXSJoe8CkBvEOvwHJZwcEo7hZk+FiEvwxgSJsQDucHVdfJ4lONfD341syO/BTNIncdVtYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Fri, 23 Aug
 2024 19:16:54 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%5]) with mapi id 15.20.7875.019; Fri, 23 Aug 2024
 19:16:54 +0000
Message-ID: <98e7c093-4b1f-409d-97da-65bfc9c4bf1c@intel.com>
Date: Fri, 23 Aug 2024 12:16:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Hans de Goede
	<hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next Mailing
 List" <linux-next@vger.kernel.org>
References: <20240820134354.2aec355d@canb.auug.org.au>
Content-Language: en-US
From: "Joseph, Jithu" <jithu.joseph@intel.com>
In-Reply-To: <20240820134354.2aec355d@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a03:505::16) To BN0PR11MB5758.namprd11.prod.outlook.com
 (2603:10b6:408:166::18)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5758:EE_|DS0PR11MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5dc796-9b63-47e1-599f-08dcc3a825f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b05ydEJUWjBPREVOVVhGdlZuTmRtcldveEcyRmZyUlJQWUhoQ1dsT29MSC9V?=
 =?utf-8?B?aWQrcDczZmhqeU9LcmVNQUh5ckMxZ1FBTW4zcTI3M01VSklyMUxOREN6OVp6?=
 =?utf-8?B?bURZdXN3eUYxZkN3Y2w2YTRCdzVSaWRzLzhNbFJPZHdRV0g3U05tbmEzRk1L?=
 =?utf-8?B?UTllTktwcDRTenhSK3VZdUdMQWh0UzZCUkQyWXRJdmdrK1hHL1NGajB3T2Va?=
 =?utf-8?B?Um56aTduemhKb3c2eWdvVWwzRlNlV0g0RzVRSzlJVVZxbS9zbVlpTGhwRXUr?=
 =?utf-8?B?VEJReFd2SE5OV2lIVDB4VUF0VkZSUXhveVUvNkhTalAvSXd2emdCZWlsQS9h?=
 =?utf-8?B?SGQwbGJLQk0vc0dSdEhGQTFHaEUxdldkR1FXcXJUS3ViMnBDU3RJVTJsT2xG?=
 =?utf-8?B?QVZOK3lkN09VUThsMFp0bVoyQ2NEYStYS0IwSC9lSXV0a1BwNVBLTlJ1SHpC?=
 =?utf-8?B?L2R2WENwMVlMSXNLaUNzRlF2bDllWU8yTWlkNDg0Q2xQMkV5RUxaQ1ZGQ0VJ?=
 =?utf-8?B?VjdUSE4vclZNTHJTUkNXczZuZmovZ2VEdGFHeUloaURnOTlrUVNibk9jMGt1?=
 =?utf-8?B?L2liSTNvczh6VHkxUi9acXQzaEZ4NTNqbTZVQnFsRnVxcVBZZ3VMYjczZ2p6?=
 =?utf-8?B?U1hNRWlDek9OdlR0NDh1WG0vTURubEd1QkZvR3AzNXZoUFZaUzNTcXdubHdm?=
 =?utf-8?B?SWNHbGhpM2NaZGVqSTl0OU1pK242M3prNjFOYnk3S1pBZ05KZHFtL1dUODg5?=
 =?utf-8?B?ZktPREJRdE5UZ0xXRlRUYjBSWWtQc29TN0FpakgvUWkyeTBZRHVqRDM3a2k5?=
 =?utf-8?B?UzV3WVJaUjQyMWZva3lLN0ZMSjdiNGR1dlovYVJhaHM0Vno4MUZ6dEtSNkQz?=
 =?utf-8?B?MzlzaG02Z0pPb05uUTYvVWpQMmNUdi96UHZEdzZxVXdDYlBjTy9BYlhPVS9S?=
 =?utf-8?B?ZHVWbzNuZDROcUNiUlhLYmlMQTFRaGpRbkNGb1hNRXNOaG5WOCtKemlZd3RC?=
 =?utf-8?B?RW5IS0FzUHF6VUVSZjZ1bHVoU0t1R0lsM29BWURobE00cHBBS1M3QkNNaGZU?=
 =?utf-8?B?S3FCZlE0ZWpvZGdZRFdxeThJVnRzSU1jRTlPSjUrSzZvN2FTV0ZwSHdDd1BM?=
 =?utf-8?B?V2g4VHpSbmI3bnFpbGVsR0pZOFBJYlMyaTQ2andsQ0VYemFzL1poQUFraHBM?=
 =?utf-8?B?Rys2TVBqUWduRkN1TGE1QSs2Wlg0ejhDNkVVQTlYVVQ3a0xta3dwMUg0NWpU?=
 =?utf-8?B?TFloejhZOERoN0tMbzRXYnl6bGhOblNhMmJvcHdnaEs4SmhLeU9kcmd4K083?=
 =?utf-8?B?R0hqa2dxSU00eDlRSSsvUFQ1eDdReElvc2lvbCtmNU9MbVNOV3h6VlRUaExn?=
 =?utf-8?B?eVlWS1o2YjBva1U4ckdkczlZK05kZUVSVjRXakg3YzRLVTlRZUZBWUF6WEJt?=
 =?utf-8?B?K1NjUkdqQWlOK0kzMW1lVjBqa0tRNG5EdTVyanlIR2N0bHF1akdVbytTM3Vu?=
 =?utf-8?B?WUlCZUJDUDROZTZZd25TU21PQm1JOHROUDdkUzY1OFhHQWczQ0Zpdko3dFJt?=
 =?utf-8?B?c2JObjlxdEtIaTFtWGtDV3FQWHhNM3dnSnd5VzVHQVR2bFdJVnk3ZHZUK1Bq?=
 =?utf-8?B?QlBrNWJZWURIb3hWU3YrM0UxKzM0anpmdE41eE1zSDVaTkxDZkhSMkt3M3Zp?=
 =?utf-8?B?MzZ5cmI4aTUyQ0NKUlFJTUU4b2crQmJhTW90Z0NsOW1jSmRZa0lJWm9wS0FT?=
 =?utf-8?B?Uk9HVmNlUHorK0MybTBEd0N3S2hpWmlCSEZkQnVMRlkrUTNBa3hRb1pqSlpw?=
 =?utf-8?B?dTFHSlllZXl1bk0rYk9xZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR11MB5758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1B0aTc5b0c2WGcwekpXaytKY0hzVDZnYlFZbXQxdTdmTFlRTm5jQm1KWEhM?=
 =?utf-8?B?TTB0elVPWVRYNUVEcHdnKyt6ckdFUjY1MExFK2h0RTlPNDQvcTIwRkFiMDAx?=
 =?utf-8?B?WEp1ZkRnMkI2QXFYVU9XQ3FFdnowZFNiYlZ0cVAyTEUwd0FmWjJkMEErMWY2?=
 =?utf-8?B?WGE4WnpjTGs2MHJneXpJSWVhb0MwWFJSSXNlMlZrQjhTdGwxckF3aURoRTlX?=
 =?utf-8?B?dVhUTHA4RTMyaGxGVG9xeXd2SElEK1h0KzJlQnRFbnR4T3haSTRHU01HcTlz?=
 =?utf-8?B?MmpBSWRhbUplemNaU1dwcEpFY2xaRmZMV3VtdGtmbFBnblIvVVFFQ0ovMWVI?=
 =?utf-8?B?UkJyR0dXWlAvTldoSW5oRlJnbmVPRlFScmZ3enFGbXBZeXl0aG9vbS9BZ2Ux?=
 =?utf-8?B?YUt6MGNUVEduaGN6aHJqNkZtQUgra05TU1F0Z0dETTJqWXl6NGcyOVJCRVNP?=
 =?utf-8?B?NXp2ZDNGNlpBSHoyVWFmOHJ3UFpNZEJVZDNjdExqM3NBci9oTTEzZ0swZStH?=
 =?utf-8?B?MEdOWHFSZUg2T2ZBbWlnSG9BLzc5QUZHVU0zOVRIV2hWVHNCTXhvVUk1UW85?=
 =?utf-8?B?cnQ5cjJqT0d2akh6Q1F5TUVEUmdzV2dWUC9kby83dFhTQi9tT2FIQThPbmZ1?=
 =?utf-8?B?WURhamNkMkFDSHRnWXNzOFp4aXNBYTM3TGlKdGxwWndaazZZMzZwNGZXbmNB?=
 =?utf-8?B?WVlWTjVJWkJFNnUyaklLNHByQjNuT01qVlZ5Z2ZPbEZsSlNUMFZDdHd5ODBE?=
 =?utf-8?B?T3VMeFMvMTBJS3dtbkNZU2Y3eGtRM1ZmNUVMdWFqNWNkcUp0bmEwQjNtUE84?=
 =?utf-8?B?bzlVYVJHSFNLeGdWdWVPRkVkUHJHWmw0a0MwNjcyd2l5UkJ4dUowM3AxeWty?=
 =?utf-8?B?WlFRcW1sK3dlZ05tU2lYMnZ5b2NoV2MyYVppQ0lxUm1VSVRYNFBiTVVMREE0?=
 =?utf-8?B?d29yZjUwRUhaK2UwZE53emRGZ1FTUU8xcTI1MlhrTGxlTVhrTmZRZUIxQ2NV?=
 =?utf-8?B?MVNvNHNmRVc2VlZ1TzNJOEZEb2Z3cjlBbGE3NjFCMFkzbG13cjV5VEF1b0lZ?=
 =?utf-8?B?ZGVlMGswWWczcnF5c3VRTWNJbUJuWUFhdm5xRVFRWmRWOTdOMWl5bkg5REt1?=
 =?utf-8?B?RmpBeTR4RXpkeStnb3kwZ2RSYmR4cEJONW9Dd1hUbWFSdmluZTF2OUtwVVp1?=
 =?utf-8?B?aUM1UDI0dHBwYlRkWVhsMG9GSTlNUnhDTS83ZjNqQW95YUVwY2Y5cXhwajN0?=
 =?utf-8?B?MGNxdDBncFBLY25ES0RyY1VYbmFseXV4YzRqQjVneHlwYytJZmlvRk9iVUg1?=
 =?utf-8?B?Qng2RGlNK1JYaXNJTDdtUW9jSndqTXlkVHhJblZNaXE5d25oQlpYWjNKMFFq?=
 =?utf-8?B?bVVVeUdwK2lrcXArRHIwaDhHV2pqUHRhMTRySXpMTEhmUEtnOWJiclVsOG5P?=
 =?utf-8?B?YnpHYStZcVRNYlVXbkFxYkRYVXFTVVdWcFFBOSttamMxZ3FSZkFsdGZ6ejhC?=
 =?utf-8?B?aDg3MjhiYUxLNFNwbGREc3BOZWdaTk80bE5lSzFkTWJwdlRqV2pnT0JSR09K?=
 =?utf-8?B?WU4xN3VaeWhacFJkd3ErS0lNdkJlcTJ5WjFQaG1aSTI5VlhWY2drUmZIRDRK?=
 =?utf-8?B?VEhFSlhyeXh1ZU5KSXg3RDRKWFhLN3kyV1F3RWErM3V4b1lESHZmU0NDN1dk?=
 =?utf-8?B?L1I4bHlaV3BXNWRoT3JMZmZ0NTQ0UVZRSlJIbmRQeCtsNDJ6bW9RR0VGRjgv?=
 =?utf-8?B?VlcweFU3MVJhMUE0cUtyN3ZIRkRnNGxDS2ZLMGdrY2Z5SmRSdkZuS21kUFdV?=
 =?utf-8?B?NUorRW1NQXZTM3dYamZISXB0RVlwTW9lNi85Tk5CUFN5UUpPYnBqL2crMjBP?=
 =?utf-8?B?VjFEV3RHNko1ZXFZTExhLzFYUHVKSlluZXVaWkE3ZTJEb29EZS9La0VyKzdH?=
 =?utf-8?B?NmNJczYwbVZyVTVob3NFQVpiVHpmYXdEa2ZOcWo1dDJ5Z05MZ3g5VVNCbUhl?=
 =?utf-8?B?R3h4NDBlTHFuTFVOUU5SYThpZS9LalV2ajVEMUYra1VWdWRob0E4blNTazg5?=
 =?utf-8?B?bVpTVzc0eG45eEV5d1BNOHhKWW1JR2lMMmExekZLazFqSmJ0V05CRGlSVHlh?=
 =?utf-8?B?cEJZbmZZVi90RGRicUFHTUYzZkN6UVRCUVYzVFF6RVF3bnlxWXE5NXcvM0Qr?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5dc796-9b63-47e1-599f-08dcc3a825f2
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 19:16:53.9796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PC52koixNzffBK83A3wdJ+1L79z4CT35DrFmlnTwC9orMu5ssCIWuB6Glma9Kby6JNjQfj+fCErs0/L7Z5j0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
X-OriginatorOrg: intel.com



On 8/19/2024 8:43 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drivers-x86 tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/arch/x86/ifs:2: /home/sfr/next/next/drivers/platform/x86/intel/ifs/ifs.h:131: WARNING: Title underline too short.
> 
> Structural Based Functional Test at Field (SBAF):
> ------------------------------------------------
> 
> Introduced by commit
> 
>   0a3e4e94d137 ("platform/x86/intel/ifs: Add SBAF test image loading support")
> 

Hi Stephen,

Thanks for reporting this. Below fix has been sent by Sathya to Hans (and the list)

https://lore.kernel.org/lkml/20240823184337.2923179-1-sathyanarayanan.kuppuswamy@linux.intel.com/

Thanks
Jithu




