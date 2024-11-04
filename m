Return-Path: <linux-next+bounces-4607-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BD29BB65E
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 14:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4CA31C21DC8
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 13:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E7F1863E;
	Mon,  4 Nov 2024 13:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkstS4/+"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35260139CE3;
	Mon,  4 Nov 2024 13:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730727491; cv=fail; b=LjUnpG42YfKVz6rqhNS50xRD1+YlwhWaDjJZBh5cZecdv3C7TyswWw7O+OYWMEcp0CTDPJeGD+/T67sfBLO7CvG1V/5BipDlrTVpsXZlWo2PeGaQDwRKUjD93YOSwOj+KoGwtacZrtRi/FH1KGygQB9tZDz68hLJqLtkWL7x8Xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730727491; c=relaxed/simple;
	bh=6ciNbcPHGX9mHCwWU22tqblbY5Wh1VSNi9/ze1peEk0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gxagPr7TkWvi0E1hmW+HQrRzRahH9ayM8ho1HSxzShDWYiu8NpTxn0gyeoin5+G9JOAcqhmevwiG3baQwZMXyfBuFLJBsXqusFe6j9BA/foy97wZKng9Sq7lT8pklPXVEaN5vTM3b/eVPUMvSSVeYz0t3nc77WHiMEVWQL0pLTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkstS4/+; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730727490; x=1762263490;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6ciNbcPHGX9mHCwWU22tqblbY5Wh1VSNi9/ze1peEk0=;
  b=OkstS4/+jIonBiPwVSWT34q5DafGSRqJ2S+NCI9XfjWnO1VGmeHex6o9
   Skf0D1T1mb3TZUeJbzgsCflauI6AxoPS5r5TwGfpDT2Gmk93TzzabPjGQ
   KC5F4WdI/QsE3ceHwbPoP3UEXaq1rah2eGDUkCGkwV0+5RVQmqIB6Jc3S
   aIykZMIeKLEltfl4VX+Wwii7pbJHfqGRggUeLw+TgaNLfWk7+KkBsUdJ3
   BUFs2LolHNt24llbSa5ge8mK6J2jhpVdP3WaB3Wn9DufxlTXpjjUnYkOb
   m096o/wlhfQta/H+JbPsXHW+6Lz8DNEl6NOJKPUUYn7m41GxYxrvkVHWh
   w==;
X-CSE-ConnectionGUID: tTtDW/E8TFSAS8Oh+VAgGA==
X-CSE-MsgGUID: 19SYoAhxTIaNkSRhCtcRbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34211480"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="34211480"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 05:38:08 -0800
X-CSE-ConnectionGUID: GMdWozSrS5Capd6qtygIQQ==
X-CSE-MsgGUID: h31nVaurQLSDCVDVdlaaqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="88794265"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Nov 2024 05:38:07 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 05:38:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 05:38:06 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 05:38:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+Us2ChBNYIwqdpMS8SvZaqadmVRNEE85oJ++xLtAddW12zhFLhRSp8QzkceGT30D5wRhy4ttSe4nXaRmf99HQNGwr3ddIDAoSTgWrgpe2sN8BOFX6mpueABk4vGilOFNehy5ADAPWIdxPAheemAGGbHbusiwXDSHcTp2nmsY+LIzfMU2gLeR4sFojX+6hvyOgGMpaTYKEOSRbw17lmCRsqRMFQK8Ae64VMMiquuSyKI5h542XrL1R4WcbgC5gTO+tQSqxIh9B8YQpTYoqtHLKTN9ET7aqU387B1GLcjeTTDb859uXyfpoNs2sjXjEk0EdYyTe7q3ZEJivKI2kozjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymUQkoZ7lGBYLtROjUgKpYHaUoKZwrO+W58E4OTS16s=;
 b=fbFE0zvULjrAdb0R8EEiCHZ37RIg2DsQ4wbrSsLwRa1JO95iUfdg6OyVkDxdDpDqcqDCuFS1q4e9D5zLqfQKVG+CqqUlge8HzX2eWhYKBf3CpjIHWtbhCInHfpCZEzrYO22Tf4Alc5pNK8PdlM30I+0z2ZF3kmjcAuFPaDuJ0tj+OvbcsiI9VknyX344gt80smOdIeTcqlQUfiZcoPVAWIh4udPX5ZchWKrogYaIzgxR2+gwjk0HFb9GIdV0r+8fBSnxoDCoiKjf+s2wEFw5/+AcBSAFQ3BpqplRWCwm0aY+l+j6Q2AZGpAlOFkkn5Lycu3NoS1ZhSZKZY5rq8TMUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB8086.namprd11.prod.outlook.com (2603:10b6:610:190::8)
 by DS0PR11MB8115.namprd11.prod.outlook.com (2603:10b6:8:12a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 13:38:04 +0000
Received: from CH0PR11MB8086.namprd11.prod.outlook.com
 ([fe80::984b:141d:2923:8ae3]) by CH0PR11MB8086.namprd11.prod.outlook.com
 ([fe80::984b:141d:2923:8ae3%6]) with mapi id 15.20.8114.015; Mon, 4 Nov 2024
 13:38:03 +0000
Message-ID: <dd740dda-a03e-4f3a-bb46-e551f0799c50@intel.com>
Date: Mon, 4 Nov 2024 14:37:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the tip tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
	<hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
References: <20241028165336.7b46ce25@canb.auug.org.au>
 <20241101141952.4990f238@canb.auug.org.au>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20241101141952.4990f238@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0135.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::14) To CH0PR11MB8086.namprd11.prod.outlook.com
 (2603:10b6:610:190::8)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8086:EE_|DS0PR11MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 5611cff8-6763-4552-b289-08dcfcd5e84e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnF1aTJnaE1mOGV0QkxONGhESllYNzFPdVVoOFozdCtIYU1GMGp3Z0ZKRkxq?=
 =?utf-8?B?YnVJZTduRlVLcHZqQU9ZSEMwMFYvalAyUm51RVNYeEZlcVVqYjdtdnBXM1Qv?=
 =?utf-8?B?clRiMFBObmpOMTBXNjFFU2IyOExpamN1WE03bStvYnY0TC83WEU1RlJCc3Yx?=
 =?utf-8?B?MHZFTkRGbmJOTkZRU0lHVXpkdm1wYXI1bklkOWxIZXpnU29CcVJUb2NmdkhV?=
 =?utf-8?B?RXZGeTdRYWozbndYOTVnOUVtbzRSSlhJeG5wZUF4V0hSTWN2dHdtWVN3V05O?=
 =?utf-8?B?T3plN0thbVFQWXA0eFJuaXdQUGhnNDVtb2VPNXRxSW5uNmllT0tQM1Yyc1J1?=
 =?utf-8?B?Nm4wMTlJTVg4UzdJTTNGMDNEcFBMTTR2bHN1d2d2SUxmZHhRZnpRWlZxR0w0?=
 =?utf-8?B?MUVqcmFiVXhWVCsyekd5aXhaaWZOUTJYQWU3dFlYTFZDb3ZTYU5xMC92Yzho?=
 =?utf-8?B?ZVQwSTVZTi9QNjJaNnZtdGpScXBwcGdOQUdVYVA3NTBuSHMweTRhcXl5UXpq?=
 =?utf-8?B?VGJ6RGptNXV4dFpKQ3RERXJVUDNsV1ArdEdqK3Q5dTFyNmhtR1ZJdUdVWkw0?=
 =?utf-8?B?WFZleHRCVXUwTUNpcjd4Z3ZRY0RzR2JsMDhnWm5uanByRXEvKzh2TnE4SWJ3?=
 =?utf-8?B?NUZYb2RoRW8vRTlDUUtDUWp2bkJ3RnFoZHc4QXZjeHRiMkNtTW5CNmZWbnhU?=
 =?utf-8?B?bTZMN0NDMlBmWG1lS2VIMHh5ZUc2TW82SHZqZ1YwbVVXUmJXVURaTVptcDBm?=
 =?utf-8?B?bThnUVowNUE2blhuOFRQU2s2Zm1ZY1Y2SWphM1ZTME9GeXlkQVpVSFRkTFR1?=
 =?utf-8?B?QmN3UzAvb29abi9QOHdLUThSUUx3Wm1NL2VjblV5djJKSE5mc1lqY1UzdTRr?=
 =?utf-8?B?aFlicTFidjVhTHhha0tpcEtIZmh4QlNWaFVVdkpXcmMzcmtlcmpaZG1Jc0ky?=
 =?utf-8?B?L1JUQ3QrbktkajE4c3hvVlloZ2ZmSHp5WmNXNDdrbnFwMGhDUlhKdVd6OWdv?=
 =?utf-8?B?QWx1LzVPeDBlbjR2cmgrdU0yQVBURjNwNnQxdk4rLzlFRFpRRWhIa2RBS25o?=
 =?utf-8?B?YXpxTjdzWXBVcjRqb0VOU1UyTWFCeXRwb3ExUk1URFZ1VDlKUTQxTzE0MU1l?=
 =?utf-8?B?c3huQ3RmVm52M0phb1FmZHlUMTdia1B2OG8xcTVINlNNdVVvUUpMWkhrZkEy?=
 =?utf-8?B?bFRTL0oxUWtrRnlnWnFOZ2F3NVIva3ZVeFNTdkw1TDFueHQ4SDlUcUd2eVBR?=
 =?utf-8?B?ZU01N0ZYUFNLOHY5MFJWeWs1SXEvV1RyanQzdGo1UUk4eW96YU1ZbDEzU254?=
 =?utf-8?B?UHVIdXdEQlZyWnpzQ05BSmJLQk9rWks2SjVvRmVmZGQ0VTBNbC84bmYyYVRR?=
 =?utf-8?B?SGFNN0cvbFM0VTlwRGxLQ1JPVmtpbWE1OUZjM0dISFpobzFUZFBjQTk1eHY3?=
 =?utf-8?B?aUhiQnhNRzkxWDJ0dnRiQ1Rkblh4SFNOQXE2eTdJbkdVOHR4N1JCZUt0SFVD?=
 =?utf-8?B?REFRUm5hdXFUeWltM2NVL0twSktrWWUwZjU3ejBnTlBpWHhSMW80ZHFvUG9S?=
 =?utf-8?B?ZlpTRXhPR2t3b1d1Mmh2N1c0Rnh6cmVaQndtTmMyQzJxdGZtVlFWYnlmMEYr?=
 =?utf-8?B?TUdJN2NFOEpGeWhlZk13Vjd3Z3p5Tk01T3Q3djB3alRNOTNIMXMrenBGaHRO?=
 =?utf-8?B?QVh2T2RMNEIwcUd0Q1dONWw2dXBSZlVtVEduYTB1T1Z2N3lEb1VTeG1ERGdO?=
 =?utf-8?Q?1cY7PM697WWPIJZ0Na0LMniZKAa3+bBd+zFsP77?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8086.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGNNTzZIQmNzeXdjanlzbVpPQ0w4TVpQYkJzQTYvOFRVOTR6TTdnMlJWcWg4?=
 =?utf-8?B?c0pqK0ZGM2hXY3dDR0FEK0lxd1UvNmJ4VzRaeldxT1ovQ0duSGE3V1lUUm5q?=
 =?utf-8?B?Q012MFJTRFBaSnFKTHA4SFhHcUhyZmkvM2lVaFpYbkNmZ2VuWnVyMDMvZ3dO?=
 =?utf-8?B?M2dyVmFHT1J6YklNeVRKVXQ0MGhLbXVlQlZtcWpqUWs5Yk1OYlc0THZpZWNx?=
 =?utf-8?B?Z05FM1NkRkpMUHovTnllem9LZ3RkODB6T1BDWEZnblR5NTM0NzZVUFkyRlkz?=
 =?utf-8?B?R2ZUeEFXekZzWHYvNUQxbzdVaTBpZCtCN29uNDMzaFNpc252TEhEazVSRS82?=
 =?utf-8?B?WkYrdUJKWGlaNnBDais4Um5qOU1GUHYwVnRmTXg1dkcwd3RjKzlHcTlyb1Y0?=
 =?utf-8?B?Vkw4Q0IxRGgzeUVBMFBNRDdLOVZvL3Ntb2NjOEVpbGdIVnc0NlpZMSsyQnho?=
 =?utf-8?B?N1ZtdURxQ09yL3pZSWY2dHNIeTJyVlYvakVLSnQ1b0NuRjJObzV4M0F4RkVs?=
 =?utf-8?B?UTY1WDBoeURQU2RaV0llR0FCQ2dvdy9pam5hWFhIaUM0dWNyK2ZTd1RDYWQw?=
 =?utf-8?B?dkdlYTZGeXN0a0dzRzNMMjBra2ZUZDN0M2NnWFd2c2xScklrRWU2emc0MHNO?=
 =?utf-8?B?bXl6S2dURXIwOUtmcWNMRGRWQXYzUU1YdGpQdGpqNWNTdHBiM0o2cU95U1Fz?=
 =?utf-8?B?b0R3cU5maHlxK3ZuS0RJelBCVHIxb0I0VGpmVmpqQ0o5RHlRSC9IeFdtZkFE?=
 =?utf-8?B?RmNORmtWSWpTd3dWRTFQaTRuWUUrdEtrbmFFQ3UvWmVwdnp6Ym42aW4vK1Ju?=
 =?utf-8?B?bFRraGl3elBWNmNpZVB0Ly9pN1E5NjduaGIrc1J1T042MXpyVVM2SUpkQ1l3?=
 =?utf-8?B?QkdzMjNEbTY0M0dtL1RXSldQY0RWb1NwNkloZWhjUDkwYXBDeUkyVzNaakk5?=
 =?utf-8?B?RGNNTUJvWnU3N2lSTmZBU0tFOTcxdXEydHJDQytWaUd0bm9ESVpBeCtrdito?=
 =?utf-8?B?ZzJRT1JjTFJ5NnFwTmIyUzRISXlqWEVHaGRzYXgzblZwU1dlZ0FTY1FCZ0E4?=
 =?utf-8?B?QVJOSjJOUXh0MzlNUnRaeE1aaXNrR2luWjRPOVVSWjlRam9DSE1CdnFSVUFw?=
 =?utf-8?B?akFHa0ZrRWwwWmJFN1dVbkRSMmlUbkNQVm92Y3BwblBlZXJkZXhvUis5a1FO?=
 =?utf-8?B?UjhOQW81enZTV1I3K2tYZDM0WjJVL0FxL3FtTldhZlQ4ak1KSUROMXV5N3NW?=
 =?utf-8?B?MTRiU1ZZaWk2M2pIVjc3LzBKYjk1T243VXc4RVA1L2ZXWkVnYWRhWlV1dFhM?=
 =?utf-8?B?dGlndlJGZXljeHhqUld3MmdKQXVzTHlmd1FSaVpDSG82aXc3SHlQZHFKRStK?=
 =?utf-8?B?VmtySzJzdS9SYlpDN3MzcEpPZjZ1eDVlci9qS1MvRlZkOXg4L2c0dmZKb3Nl?=
 =?utf-8?B?cUh4Q1ZmN1A4U2JSNy9DUDlwRzdWcElzSExjTHBRRS9PanFnd3NzREtIRlFT?=
 =?utf-8?B?Q1VjaDhYdVQvellIdkhENTY5UGlCVTROWXJMVHpEcDRlRVJvblg4QVc5S3VV?=
 =?utf-8?B?aTkzdXpaRlBTWWxheTI2dGx4aVFjY3hJQWVvMkQwenhZLytCLzIyS3Fra1hu?=
 =?utf-8?B?VkgzTTV0UC9kZ2hYblIvRXlzeG9nclJ0eE14SWRCdmFHaTVCcXRFVnBnMlRy?=
 =?utf-8?B?ejRDWDhTeTZBQlVja2RtWCtmNldXQlRzVzhBbmxRYStMWklYaVJUQndIaEpK?=
 =?utf-8?B?TmNlQmdBZUZKV1M1L25rQXlWZWh5ZzBIV3hyT0plcWthYzhiMjRJT01xNDdN?=
 =?utf-8?B?cy9sckxyYnpCS2NGSnVCUWdSckV3SXcyT21vbnpOYWVpRXkxaTRTOU5yMENN?=
 =?utf-8?B?cExhK0lrczE0YW5OZEJZMnVKeHdhdlUzVjg5S2Z2d2NDVEREZTZLWHVjZ251?=
 =?utf-8?B?RUdzYjIxY3I4QXFiOUpWZmFQVG0zSEVMcEFmUldzbkdyZ2owc1ZhWERoZzYw?=
 =?utf-8?B?TTczRzcyRGhZQ0V4STdCK00ybnJUZFExTXE2bFU4bDZZaXNwVXJNYi9CRnBu?=
 =?utf-8?B?SGtwY0d1T2wyYXZmcFB4ZGhpNlJZZFl1TVRZOXgxc1U4N2ZwMldacUU0Zktw?=
 =?utf-8?B?bkNGeDdtcEp2Vml0WkZFTkVFYUM3TzlaUkZ2blNPUkFRa1ZZaVkrbXRpMHow?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5611cff8-6763-4552-b289-08dcfcd5e84e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8086.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 13:38:03.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8B4Y+OW6q8mrKF7N4QX26hCpKf6dN6iYfUhcx7Cf8nmSNHKVk5lXdy6iw85MioQ04kGcpYn1Nv63tcdQ93MApDrJlpZzoV8TJtBhj6/33Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8115
X-OriginatorOrg: intel.com

On 11/1/24 04:19, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 28 Oct 2024 16:53:36 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
>> failed like this:
>>
>> drivers/iio/magnetometer/af8133j.c: In function 'af8133j_set_scale':
>> drivers/iio/magnetometer/af8133j.c:315:12: error: suggest explicit braces to avoid ambiguous 'else' [-Werror=dangling-else]
>>    315 |         if (!pm_runtime_status_suspended(dev))
>>        |            ^
>> cc1: all warnings being treated as errors
>>
>> Probably caused by commit
>>
>>    fcc22ac5baf0 ("cleanup: Adjust scoped_guard() macros to avoid potential warning")
>>
>> I have applied the following for today but I wonder if there may be
>> others.
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Mon, 28 Oct 2024 16:01:15 +1100
>> Subject: [PATCH] fix up for "cleanup: Adjust scoped_guard() macros to avoid
>>   potential warning"
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>   drivers/iio/magnetometer/af8133j.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iio/magnetometer/af8133j.c b/drivers/iio/magnetometer/af8133j.c
>> index d81d89af6283..acd291f3e792 100644
>> --- a/drivers/iio/magnetometer/af8133j.c
>> +++ b/drivers/iio/magnetometer/af8133j.c
>> @@ -312,10 +312,11 @@ static int af8133j_set_scale(struct af8133j_data *data,
>>   	 * When suspended, just store the new range to data->range to be
>>   	 * applied later during power up.
>>   	 */
>> -	if (!pm_runtime_status_suspended(dev))
>> +	if (!pm_runtime_status_suspended(dev)) {
>>   		scoped_guard(mutex, &data->mutex)
>>   			ret = regmap_write(data->regmap,
>>   					   AF8133J_REG_RANGE, range);
>> +	}
>>   
>>   	pm_runtime_enable(dev);
>>   
> 
> I am still applying this patch.
> 

This patch of yours is necessary, could you make it permanent?

Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>

