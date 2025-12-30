Return-Path: <linux-next+bounces-9511-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EC9CE93A7
	for <lists+linux-next@lfdr.de>; Tue, 30 Dec 2025 10:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ECE130034B3
	for <lists+linux-next@lfdr.de>; Tue, 30 Dec 2025 09:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E71E258EE9;
	Tue, 30 Dec 2025 09:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KujHFAlQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0E123AE62;
	Tue, 30 Dec 2025 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767087403; cv=fail; b=i2ctbLGA5vnB8YtgOODs2Cml+un4pRhMl4+SYE4FYWQzNRtA1Xuvc3d5QrXwyowvkdD2c2AGC+KrtabgrvMogdVIVZ47RcGBVc9ufkXtg9J70ZVRSTM8MDTMm0OMzp6xK/AFrmXfS04NqrHj+3zgQOlBTogypQITYde4vxoEksw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767087403; c=relaxed/simple;
	bh=gM98JseyAlz/BHz4ahGGcFxjRQr5b4pEFEO6y1uWomU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mtRqGURQHK88h80d5scGxG6rlUClSARWNKzltbiSNs0ru4xsjIHq3kePC/mBDHXGaDYJHgckhKOEOReukqcaL76iDAt3n4GpDgrYBMrQRWez6qGWYXcOUv9jl9uCixD1MMhkRVV3bguvV84ma8jS/Jak/cH7P8iuE0zbItnjLt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KujHFAlQ; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767087401; x=1798623401;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gM98JseyAlz/BHz4ahGGcFxjRQr5b4pEFEO6y1uWomU=;
  b=KujHFAlQ2YPphwCNyYlBXNB4syZbgh74EOnZbcOJx1G2enrL25gFhovp
   zqaB+mmYwb/Q92DHGEHAG2rFcAccAHRpXg2VV0c07GAq6adgM62y4hzd+
   U8VOdnim8CpnEZx4+LQPkxEIR762YTTLDuvOajmMgfdgYp6uQjC3SkCZ4
   G6dEuHHrt9H2ytRbtxcFO4gHDQ6pyguXSavwqgTDCMtz/ITLLCZSuDenZ
   56UKgeMPLFNfwM7/CX/LFwHEAOhXzhI210t179XhjW44FCfC5gg93p1I3
   NaCdmFADEn8ZQCE/WmLUpUWa2JUy4/XFUvX/RnM5JTOtoeN6QgxbWdjCb
   w==;
X-CSE-ConnectionGUID: RjSvRyffToCnmjx6mAPw1g==
X-CSE-MsgGUID: zzjvWZS2RAGGIoPoffbm8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72301266"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="72301266"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 01:36:41 -0800
X-CSE-ConnectionGUID: VJSFOJC2RzqAxIcmQtlqtA==
X-CSE-MsgGUID: qiBnWFK0SceuxOUtQrmuTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="238613610"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 01:36:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 01:36:40 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 30 Dec 2025 01:36:40 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 01:36:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umFI5KBdu6galiAfUxSJvUnhlkqJ1QRSEovMjKe6OTooX2RGU2gU5zCurHh5Mxoy1v7pzJyDUw/TlfCJzUh8s0YZ40cUhQgQh3llqRs5sWyjd8GEu/qB0/Zrfg6S6VdpB7J2wu7DM5Z8irzX0J0nxrVVOeS3Xy+DyMaQZ9X8frs0VnVHkib91NSJpj2jowiFpzmoll4uDmPrcB0S1OfODeZ/6NbA1pf+UolcOSZ/AEwLZomJsQby444Xg56gIR20IqYZyna2uSxxPhOzB6eHausecK/jR0rX1+06L4aMWSDPLnlZSwAiBZ08blW1fDjOAKNK2oKH4Nrh22sjPv1UjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6j264mfmVn9jKrkRoI0JUmfOFSKbN15O2+2cNNX0pk=;
 b=D0TM3WQaZFw+lnFrQOK3KqfRU0+oOCbx8JDzV3LWmqWBA1hBmzkaQC38OvgXaM+uYlad7Y9MmOaqJIiXXwKLh5LCZQYmkyNlHqUERvR38hcMLL9LbBYB4s36ahPYFw+oEbNvBfEwaFF3Sfpi5HnNZ88ovstMphNOL8U3PSlfU7kCLUCCu9q0mPmqt8Q0BvkQujV3GV+zG8lPODeCyre1Wl2XNEtsv1BVmanTLy6HqhUuGoSZwJMWuzZyto4k3XKXQsLLNNHnMmpssXIXkcW02ymw02YqNJbYdEy5poZhZfLCtVhBydctef0cs3WiOFjNKtFN++OIEo/IRWm+vWlWsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by DS4PPFCE18D981F.namprd11.prod.outlook.com (2603:10b6:f:fc02::50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 09:36:33 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 09:36:33 +0000
Message-ID: <4b85c90a-727e-43a2-b1bc-91dd00045e90@intel.com>
Date: Tue, 30 Dec 2025 10:36:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: avs: replace strcmp with sysfs_streq
To: Brahmajit Das <listout@listout.xyz>
CC: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
	<linux-sound@vger.kernel.org>, <linux-next@vger.kernel.org>,
	<liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<tiwai@suse.com>
References: <20251221185531.6453-1-listout@listout.xyz>
 <176650962400.445350.17331328109538303145.b4-ty@kernel.org>
 <20251223192409.50a6e4ab@fedora> <aUsBgVbloPqBa6sZ@localhost>
 <877bucgpob.wl-tiwai@suse.de> <aUvP7FL6c1snBc_S@sirena.co.uk>
 <3cd18fd0-6fef-4804-9474-41a500329e6f@intel.com> <aVOKgHJ4NXs5mKe_@localhost>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <aVOKgHJ4NXs5mKe_@localhost>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0083.eurprd04.prod.outlook.com
 (2603:10a6:803:64::18) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|DS4PPFCE18D981F:EE_
X-MS-Office365-Filtering-Correlation-Id: 058c9f4d-7102-42c5-ba72-08de4786eb67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHBWYzA3MW9xaEVtSXd3RWtlY0Myc0pLczIrcTM2MFZkOXMvTmFDRXpVMWdu?=
 =?utf-8?B?cVhGL1JHNmtGU1hMMXpCZW9qTXVSa2NhUFBiUThiRlJQa2ZQNDhVcEhrTDlY?=
 =?utf-8?B?Vy9YWHh1T25nOUJuNEZWZnJpVGpSbFhIcks1ZnE0N0g0eFliTmxIZnRJeHYw?=
 =?utf-8?B?Ym1wd1kybERlTGpVUzIvNTJFZVlLRVRIekJMQlJ3ZjZDbCtFUlJEUlkxTXg0?=
 =?utf-8?B?WkcvazRVUFJUc08yak5VL2h6Zkd5N1gyR1NuYWQwSHlkSXFrUjdlTTdLckxn?=
 =?utf-8?B?OTlvdDkyWkY5RVU0OXZoY2E1U3I3WmJYZ0Vzc09qa1JaMHFxNUxqSld5NFJC?=
 =?utf-8?B?b2NUZnhqR3VJemU1eURpUEVxcVhLYmZzalZTMG55Y3VZZVk0WGF6ejVoNUwz?=
 =?utf-8?B?YnowOEZVbmhUK3hQUzVrNWk3QjVVODR2YzBOdDIrNmhxMVR2Lyt5N3JXaXJK?=
 =?utf-8?B?L3JrallQbngxNHROVGpNL0h4U2daaGl1MlNtQllkS1E1ak1hNzd2ZlhwVjh4?=
 =?utf-8?B?ZUxZUHIzR2hHeGI4aTdkTndzR1VIZGhtcDNyZmhBUForTU9renRGNHJYdlkr?=
 =?utf-8?B?cVNvR3dyZUtDS0MxK011dnNwVkR1UXhwQWRvQlpscWJpT0dQRDBFdlRqR2pW?=
 =?utf-8?B?a2Z4Njc4eUNEK3pNZHowODRtUEZwaHh0dnRtMXYwTnBLZkp5L3hrV2dWSXhS?=
 =?utf-8?B?b3J3Sno3UDlEYlYxRVFPS1c1dXlrVjM1cXh6QnVJYW5ja3UwMlFlMXVWNVJw?=
 =?utf-8?B?UkF4dFY0REtKeEJHem5XY2hXU1BQcWxNUVpGSXNFN3d2NlFuOGVTNEVhd2ZH?=
 =?utf-8?B?OWlJZWRVNXZ5ajJYdWtzT3VjYlliMXA2Y3h6cys3aVoreGVndGV1MHQ5WDJk?=
 =?utf-8?B?VDZtZy9SL1EyZUUwY3dVaCtMY1FkRm1FM2x5am84TlFLeVBZRkxzZ29MZW5u?=
 =?utf-8?B?Vm13SkV3OGtxOEJvbnk1eW9qOEN3akdmaFZjOHczSlhjbWdWUFdlUHNjbWJj?=
 =?utf-8?B?TTV3VkRWbXNVSi9ZNG4vdGh4YzR2T1M4dnJ1ZmpNSTZhcEtlbmVVSGJKdnhM?=
 =?utf-8?B?YzJlQUUzK0s0L0hyRnVXRGo5MkF6VWFveXM4T3lwMEIrdTFMRnZ4c0UwV0Js?=
 =?utf-8?B?Tm1jMzU0UWRPbHVlMWhubTIrVjZtNEx0citUTkJrcUxIVVVjQnVwaHZvc0RP?=
 =?utf-8?B?R1I1TjJraDlrWUJaM3RNS2FYRDBxZExWbk9rOUpLRGpKdlY0NDhRSmk5QXFj?=
 =?utf-8?B?aGJ5bFJHZ0hRVGRVcTU5aitkamt0dTlhbC9VNmdERnBnUlBSUmo3aEJOWHpF?=
 =?utf-8?B?dVlyZEc2L2hHSGR6cURKVi9wMmtuNFlKQjI5WGY5T1NQUlBIaGZtOFRhTVJY?=
 =?utf-8?B?VTQ0ZzFESm1HdE0vK3hxS1hoMkZVUy9tNllsMmtQbE5iNHhyWk5wdmVZeGN0?=
 =?utf-8?B?RXQzcnNBaTMzeXE2WkxDeVZJdEJMVVZJRnhwbEFXVmVFTFV0WHNNdkZYNGtH?=
 =?utf-8?B?SHB3UGUwR0w4RVh1N1lyWHBBb1NBU1lOeStoS09RRUQ5aS9NNzFrNWF2RDRZ?=
 =?utf-8?B?dDBvRUsxa3U1M2FSeUt5MURkNXYxVzI3TlBTNTNOSkpicjVlTVUxbkVrK3Fp?=
 =?utf-8?B?bGJIeHN0aks2WEI0S0lKdU8rSE5wQm9YNkhva1p3ZXNpcnpzTHhmYVQyekNq?=
 =?utf-8?B?ekh3OUUvcW5jRFJzZXJPdmJxQ0JHbzlaeE8yQzV1U3NvcXhaaFBwNlVkUXZm?=
 =?utf-8?B?bGc4NzNyb0lGenZTYUM1Rmc1NFk3clVEZmNJRzA4T3ZseEFZblR1YUVnN1BK?=
 =?utf-8?B?Snp0L3ZtRUdnbHl1N1VLUzZJYW4ybnI1SEI4UlVDcGhUWUI4Z2NHRmllbVBI?=
 =?utf-8?B?NHEyQ254T01Gb0dkeDk1UlVRTGZvL3UwTytML2htRGVXMXdHeU1NMVBjN2dN?=
 =?utf-8?Q?W9NLRpLSjBcG5XmdthBPC5ZjKlHMQEhU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0c3WkRTVjd1MWduMytoRGNqNHZiWDJwZ0IxMWZLV0I1K0hZdERuV0UzdDFZ?=
 =?utf-8?B?SGI2bDBkZTJ0S3VzdEc0N1JxcnhoVFN3Q2t2T3dyTjJqbVNycUhPa1BSc016?=
 =?utf-8?B?MlNlWnNjekdHY2FPZm9SNjg4MllDMXZiMXdsMUVSblBhU2Y1Z0xseDhSQkRD?=
 =?utf-8?B?cFlDR2VkbWQxSkQ3SWhOUE1rajZCVXNSOER5dzlHbEpWVjVnM09iS2hScXh2?=
 =?utf-8?B?ZnBsV25acGdvRXpDSnN3NTdGVytpUkZoeXliTEh5OG1mRG8zTm1lL2oxYUVk?=
 =?utf-8?B?bWk3S1VKc004SFg0VnptZHdFMFVGdGpVZ3h2VWE1MVp3VUR0RStCVU8ydWgx?=
 =?utf-8?B?cHpMSWNoZlREL01hb2V1dG9nTTBZaDRXbWNLRXlMY3kxMTJ3bU82UE9SVlpM?=
 =?utf-8?B?bHpwV0VPczlFaVcwTGhMZTJ1R1VaYkpKZlV2TTUzQmwrN0JKQkhVaEw5eXdE?=
 =?utf-8?B?SUJRT0tYRDVKZ1RtNldDTHN1RHV2ZlVlZnVsaklqMThOaXkvb3JQWU44cDVL?=
 =?utf-8?B?amR5WnNCeDlnaGpscDlZTmVwb0JZRDFlVUlCZXZmd0VoaU9xcTM4RlhGajJN?=
 =?utf-8?B?THJ1aDBKWWl0cDc0NUVUdkkzTWZwSmlFeU1xd0x3WEhhdmM3TXErcUsxMk1u?=
 =?utf-8?B?bGhjQUNoQlJzcVRJZUJSL0QxV1dmRlNnTmxidHV0LzkyalV6N3FSVEVjR2hU?=
 =?utf-8?B?Z01RM3kzb0Vva1N0d2dDdDU2czBRUU9rQkVEZzZVNzl6VXIwL1E2cy9SdkU3?=
 =?utf-8?B?cHgwbitVcXprNGFsRzVOMXIrNFVQR2pIVzh2TFpaM2I0WklkcDFOVitsZzh4?=
 =?utf-8?B?cElYSHdnaUFBYkw1Ym15Y2ZYMXYzOVBtRzlNaTJPMGwxNVNCb3I5Y055MGFn?=
 =?utf-8?B?c2hQbWt4Z0FzdnpzNllHNGhab1R6ZGdncGZGSU5CZlVPQnJPUGptL1FNY29G?=
 =?utf-8?B?N3ZIWXJWNVJZaHlRRFdQaU5GMHJUU3F0cGFsTnMrTzk4L2txY21JeTRoRWV2?=
 =?utf-8?B?cHV4b253SHlZL3ZOUlh5MDdJMlZvZUVPOUxabTAydUxtWGwxRlRXTWxodW12?=
 =?utf-8?B?TS9HSFY2TitNTk43NHAvc0tXM0J6cG91Nno4QUhkM3JEcGU0U0prQVRIOXdE?=
 =?utf-8?B?S2xnYTlGTVJ5Vk1FendjMkFhbHB1eUUyQVEwenJPOFhmNWczZzA0eDZHWVRL?=
 =?utf-8?B?dnJXeU5QbmlKOVp0TjNGQnNBY2p0N3J0eGdYQ0tnL3pkNnFGMi9tSkN4UUVG?=
 =?utf-8?B?Nmwvb2VkL2xuWW1NK2p0bGNEVkxlT08waG1MZThnd21hVUJ2cVVDSit0RldP?=
 =?utf-8?B?M0pZbmtlclR3bVpKZ1NIaVd3M3lKUm9MR3R1alcxWnRYendMV0RyQmVVWnVP?=
 =?utf-8?B?MmpkMGpOT3EwUVZHNytWQXBlZnNhb2hNRWpnZ1h6bk95NmdmaFphRlBaWSs2?=
 =?utf-8?B?VWxWbkI2Z1dnTVNzNTdxeDZlNzlRN29TTEl1aytOOTBaOXpJMUJpejRvTmo3?=
 =?utf-8?B?Z3BTR3IzWlpnNUJDbmRZUFNXTUR2VWJURXVjZjJ3dHM2S3I5YnQ3cTRqalRz?=
 =?utf-8?B?UTlxNDl1SUdYcUZwTmtjZE80NVFSM3psMW5id0o5Wk04MVlKUmR1ZWtLUjRa?=
 =?utf-8?B?YU44L25kQ2wxWDhaZHFFNjQ3UEZmMG9DdHZBZzlSbi9DejlPdzZsMnJJVW5y?=
 =?utf-8?B?THZWZU84RGlrbTVLZTZoNHZMZ2FrdzFkTTdvZERpcHBPR0RoUFhvR09lTENm?=
 =?utf-8?B?Mi9RVjNIUWlBYmFzQ3pMdDNrb0ZPWXp6d2JrMEt5SVAxVkNSVDcwbTNKN09E?=
 =?utf-8?B?QktET0Q2b3czdWN2WmRZbkVPNHl0V1BZNXorOHlPR2dIMDB2WHFENUlQS1lS?=
 =?utf-8?B?ODV1WmVYN1ZSWHplS2xnSW9COEMyRFp0SzQvcUt3SU51c2tsU25pekZPdllR?=
 =?utf-8?B?M0xhNmpuWU5QNFNwRzJYTFNDL3FjNVlWcmNlTnoyVGtrdDBZT04zeWdGTEJZ?=
 =?utf-8?B?WWNQcHJZOXNibWxiU0p5ZGtTU0xCV0xaWnl5Q2orNVRQOS9yTjdlMTZwenZS?=
 =?utf-8?B?bzAwK0xVQm0weFRPczJiSDJDZ1Y4T2tUL29oK2RYUDlhT0xBSkpCZWEzWVNs?=
 =?utf-8?B?ZEtqUnhrcnVPWGMySzhEWTVvM1lRenRjTDAwNVdGL1IrU0dRRmRlNHNLSkhw?=
 =?utf-8?B?NWxXMk5GQm1BeXcrcXJQTUZ3bmxFOURiOWlVTWZEUDMraFphN1Z3L1A1bXda?=
 =?utf-8?B?M2VueW9uZXg2YUZaUkRFOGtvTm9iL3BlK0R5dmZNczU1RWNQbjVkbzZvS3or?=
 =?utf-8?B?VS9May9pb3BvU2R6OFNXc21nclBjZ3FoZFVLMWxvdHRtd1ozc0x5Rk5VZVBI?=
 =?utf-8?Q?Ggx0PYgBsuXVhd4M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 058c9f4d-7102-42c5-ba72-08de4786eb67
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 09:36:33.6170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hATpxRhb3/WoAfchmbr+hwl6aJBevNNcjZDBFEweqywUCvpT8SEKbTwLNcsyjQystHmgvYwL+7yqUDJ7tiZAyGkw1/wW6HfVObu3tEYU83Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCE18D981F
X-OriginatorOrg: intel.com

On 2025-12-30 9:32 AM, Brahmajit Das wrote:
> On 29.12.2025 11:03, Cezary Rojewski wrote:

...

>> Brahmajit,
>>
>> While I'm sure you did, just to be sure - did you try clean-rebuild with the
>> 44-hardcode proposed by Amadeusz? We wouldn't want any old-artifacts to get
>> in the way.
>>
>>
>> Kind regards,
>> Czarek
> 
> Czarek,
> 
> Not sure if it would help but I tracked or narrowed down the issue to
> this section of the code in the avs_condpaths_walk function.
> 
> 
> 	if (avs_tplg_path_template_id_equal(&template->source,
> 										&template->sink) && dir)
> 		continue;
> 
> If I just comment that code segment out, then it builds successfully;
> both with and without the hard coded name length.

Outstanding! Thank you for this exercise.

> I was also looking into GCC bugzilla and there seems to lot of reports
> saying these kind of error could be bogus or false positive. I'm not
> familiar with GCC internal or experienced in compilers to say/understand
> whether this case in particular is a false positive or not.

Wouldn't be the first time, though having successful builds ain't wrong 
either. After all we have git log and incremental changes/reverts are 
not a problem.

> BTW I can't seem to send the email to Amadeusz, hence removing them from
> the CC-list
>> msmtp: recipient address amade@asmblr.net not accepted by the server

That's weird. The @linux.intel.com is gone but what you mentioned is the 
correct one.

