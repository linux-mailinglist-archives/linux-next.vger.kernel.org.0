Return-Path: <linux-next+bounces-6161-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBDEA7C7C3
	for <lists+linux-next@lfdr.de>; Sat,  5 Apr 2025 07:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9397B17C95A
	for <lists+linux-next@lfdr.de>; Sat,  5 Apr 2025 05:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9131C5F06;
	Sat,  5 Apr 2025 05:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UB0QL4hg"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4B41C5D58;
	Sat,  5 Apr 2025 05:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743832502; cv=fail; b=jANTyclRgH70DraWROx+9xlThBw3aThI5pmr1ykHAl7Ehq47iIin6y3YVpqUJ68csERB+zT0i8zjZT221KNCeCSxDDhOemIqK/5XZYxQawzxFRmZ0ghnyOIEt1vkd/5uBYTXFzF7/oTXCsCLQuGIiNWM1kD6EXa+VZIw4E0WejM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743832502; c=relaxed/simple;
	bh=Ls0WkVfgvTyWUyE4wlZtpb5133Qm2j2AkIHC2CMZwd8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aoxGCVgSCHXVat69dFOJrbb70McYxQJo+ktsW3zRcsAXi2D//GMv24DqpdA5rm//Aj3ioD6GZ/RO4RpV4qswZKSZF7a88Alz3ZLPfeMXC8R8eMwKHKr8WXKRBP9WV6Lz5kG+DHFWG6C0qwuCIaP8eJQA8GX3oz+5KCvmxQTj2yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UB0QL4hg; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743832500; x=1775368500;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ls0WkVfgvTyWUyE4wlZtpb5133Qm2j2AkIHC2CMZwd8=;
  b=UB0QL4hgQxLkvHZf+vBUDPdHpz2Mlf0d/VNFylYvSwOrpxhkhkPzZQQA
   jAHTUCJaaef8TE6bAqY+SgxO3FGssi7+iRuCDwMDu7SCp8Dgw+x1v8se6
   //CG9dT6sZPP3reG8GIRRoJh+QMldAE+Pffsn1bxFXtFT5gSz1OKQnhSz
   XdOfUZMVc6WCzY5XqCqlIcpF7rUW5L2dqf5KT6MKf1C2a0ZzadEqdT5Jr
   LQGovE9vEg4b8FkmklhzNzZ4Wd67JHXA8h8ELDOKltsDZLmrI1nUjVGS0
   HIQRbI4WgPRk2l66E2kk+OdhqjwI5wQVoWY8vwQ94QDhBxQAyoB4tEGE1
   w==;
X-CSE-ConnectionGUID: 9UWg95B0SeWudNSwJdbHdQ==
X-CSE-MsgGUID: 4jWFXj/GTb21hEnTelLnuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49070810"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="49070810"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 22:54:59 -0700
X-CSE-ConnectionGUID: PxYOxAVkT4WVhOq4gB2JQA==
X-CSE-MsgGUID: C0JeHsPuR9ubDcRXbh9fNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="132694472"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 22:54:59 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 4 Apr 2025 22:54:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 4 Apr 2025 22:54:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 22:54:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isxW9D8sVelxbzzyO9ertQtPG6UNXRfmegfzhK7rt4Z5LMFMRIeJ/GfPEAz96JBdPe9E1NeohcBDox9UxBv0+8PakXLJXjSGYrHwiiKSvaGW7UvAXjvdR0aRmkD6/T7Or1VqQrBSOmqdgTqDbwJ0Zpbo+53yEwIYcMyq5AsR19FVYk/6s82u526kF4lUWB3mRaoKU6F+Tp1uv47zanI550zHWXv+hqz48HSvkBocapYbQQg6uNXLvIyKy4GZQ1aBXrOk8ry3kBaM8i81mvUYljQ+v7DKokA9RSnxLxZNmuirmU9SmiNG7uDwTxRL9I+jxCmUox7u7msojSRO0KXEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPTf34vniTkdIpW56H5h4cC2DiUE5E+P9sbocbA1oCo=;
 b=vCT3lbmb6d2H84AXN05tk5AV4rRD+5Ag8DJ2kkI2vuY+WOIrWpECwqR7BYnQ0NcHO7GrCjJAIEfjA+iXvvkYgp5purEyKV+DaLdCtI4b3TLOntPQzIsENMRbY+SNDkL+4a41nI/dMFTGb3DYmiUE73xAVhXBuQuPhzpyjFiX4JoLDuf6QLMdyDIPI3+Hr0A3WUB0I5QsGaz0CS8zWjD/zx8moqw2fRcgu76eJq18At8lbQwXiHEhPXv6y4xBtselzoUDnE7tWsPs+ovygw+HOaS6jDM4GxBgtiHQ2E/FORI7RZiOMrQ475oxKWQvCSm+xrc/t+0MGZGzRKc8CvMhig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8478.namprd11.prod.outlook.com (2603:10b6:510:308::11)
 by DS0PR11MB7681.namprd11.prod.outlook.com (2603:10b6:8:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Sat, 5 Apr
 2025 05:54:37 +0000
Received: from PH7PR11MB8478.namprd11.prod.outlook.com
 ([fe80::6961:eda0:dc93:5b4d]) by PH7PR11MB8478.namprd11.prod.outlook.com
 ([fe80::6961:eda0:dc93:5b4d%5]) with mapi id 15.20.8583.041; Sat, 5 Apr 2025
 05:54:37 +0000
Message-ID: <58a19e30-aad4-4701-a5c6-cb57ad04102a@intel.com>
Date: Sat, 5 Apr 2025 14:30:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton
	<akpm@linux-foundation.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
References: <20250404131422.405a5652@canb.auug.org.au>
From: Zhiquan Li <zhiquan1.li@intel.com>
Content-Language: en-US
In-Reply-To: <20250404131422.405a5652@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU1PR03CA0004.apcprd03.prod.outlook.com
 (2603:1096:802:18::16) To PH7PR11MB8478.namprd11.prod.outlook.com
 (2603:10b6:510:308::11)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8478:EE_|DS0PR11MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: ff48c887-0181-4151-dc88-08dd7406595e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sk5TNU5SeXlDS3lGem9vRzI4TVZnbkpXSitUc01GNVo1SnpaRjJ5ZUdKT0Jr?=
 =?utf-8?B?WTVRTDlpWUlIbTkybG1PUEl0alVOUDhZTE9iM2lnbllCVXJoMVhVUTdqTjhJ?=
 =?utf-8?B?Z1FLTTlBL2dsbXBZOU51R0Rtdkw1djVySWd4ZXA3eEgxVUptbTV5YkpBMlh4?=
 =?utf-8?B?SkRDMWtXZUZaaWNaRDZyZzIyQzNxeFZXZ01EcStmUkdBbHZ5d0s3VE9JZnFQ?=
 =?utf-8?B?WTA1ckpaanhhdkcwcVdObGI4SDExT1BvL1R3WFlzRndRRzVPb0h6TUNaVTdh?=
 =?utf-8?B?UzF5VDUyUWR4Z3RFTUQrOGtqMEFoMDRHV1EzRFdpR3c3RFFOeDE2bi8wa2Iv?=
 =?utf-8?B?NW1JOFdNSmRMcS9lR3liS3BQenBXSU1XYkllbmV5b0swMlB3R3JjZ1Qvcyt3?=
 =?utf-8?B?ekdldCs5azBLQmR3c1FpVFRuOURsSmNVaHJHWWhNS3VQS1ZSMjF4TEhJZ1R5?=
 =?utf-8?B?NG5YUkpzUUU4a2lOSXBhUFUvcVVMelovUmo5YmxrZmNWN1JoM2EzeUFtUTl1?=
 =?utf-8?B?RDJIY0cwUlBOQjRJcndicWZHUFI5bGpnOGdSSkZLMDhpZTd2QkZsUmxaaHdi?=
 =?utf-8?B?aFRqTW1aU2pvMVJrMnM5a1ZlczlJT01mb29KSzdyZFZMaEVyY0JSUGhBTlYr?=
 =?utf-8?B?OTB3M3dhbC9OamFCK2F3ZmJTZ0d2dm02MEIxVTR1ZklPZ1lQeXR0MnhwTjVV?=
 =?utf-8?B?ZEEvLzVSQnZPTzgrenYvbXR4VVkzTzVUajRTL0I4WVlXTCtkYkxFcHh5L2h0?=
 =?utf-8?B?cENjdDVEUHF0Z3VWY1BlYmx3b2k2Tk4zN1c3c2piTUFVbFRnT0pBbUNwNStZ?=
 =?utf-8?B?Y0dhckc3bEFiRkVLd0FlOWhOajZpQnl0VnBHUUdWelpJY2xYcEpGcHZRZmNp?=
 =?utf-8?B?TmlXMnNzUko4NzVEUCtjbGdjSHFVdlBTSi9sU05yZG9UQ2p2TzFjcmMvcUNm?=
 =?utf-8?B?VEdhWWIxUjA5TVlyWEN4c1Q4QmdnZndjTnhnMW4wOWtWR2ZKZ3VkeGtYSURM?=
 =?utf-8?B?ODV6bVFLVkZ1WDBBd1R2Z0xmREJYcjFjZ095ejFoam9jN21YK2Y2UFgreU5K?=
 =?utf-8?B?NjB1d2JwQUVFT3ErQXZiOTVicW5Cdkg4LzhJZ2JxRytZZnJSdjlRdUU2dy90?=
 =?utf-8?B?bjhhL0JXTHR2Y1hRT3hTTmhKaXZEdWh4SHMwUEwxMnFWMHBPOWpiMEFVRGUr?=
 =?utf-8?B?SlZ5TVBvdFRkUjFxZklUWTR6RTRydFAvOVNXQVI1eStSZTdWM21jczR5R0o4?=
 =?utf-8?B?Rys1b1JlMWJhcE9GUjZNamdZeUlVaklvMWR2blNTVVZXM0tYNGRhWU1WT05K?=
 =?utf-8?B?QWp0LzZqVGM2L0xRUmlFYUt6TG5vYzUzQ0dib0VqNitVMVZ6dUJkcHF1VkZS?=
 =?utf-8?B?S2tVUUZWQUFqeVNLWXJxTDdBeVQzeFYvTFR5UjN1WkRJVmhDalcvLzlZQTZO?=
 =?utf-8?B?VW9iK01ubmN2SU1vVUFPYk4vM2RqYUN2cEFHVnJLV2NsWXZLcmRsbDZhMW5Y?=
 =?utf-8?B?SVNoQnBzcWtKbjNIOVByRGh6anRNYzhPU2svaWZsM1ZSWWh3VmtlWUJRY1lN?=
 =?utf-8?B?ZER6ZWt3ODFtQnF4dTNaTjhWMktVUUtRVUFHOGQ1eXVhSVRwanRnSmllUndj?=
 =?utf-8?B?NmxiaWhvaW9DeU05dSs4TFpjeVNTVjBUaTFxY2RsaGlaRFVPME9aL0poaFQ5?=
 =?utf-8?B?TzNoNGRYQm1rSW84U2hMUnhjSS9TRktXa0t4c3lWSkdmbVRoMHNGTndBY0RB?=
 =?utf-8?B?bkg4WjVkSDdjdEs5OVYwVXhxa0tLalEyMVlnbm1qMGxRQ1JOSWtCQncyNFpE?=
 =?utf-8?B?bUVDUzhoZ2g2NndCMkIxWjMrUGZKVS9vY0h2RFpVa3V2WndNRm1zZWRrSjBs?=
 =?utf-8?Q?aqTyTw3AWdvKN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ai9FaDNSUnlDUGk4UUZkeXQvcHRCT25KVlZjUk9HamsyNFZpQzQ1dm1UYlk2?=
 =?utf-8?B?Yk9aYkw5V291enNtSzNmL1ZJTXYzUXlKRGxoZnUvYUJTTVFWS2VPQWNFUjVt?=
 =?utf-8?B?NUNDdlBsK2pvWVk2aUxlUjJ2YmZxbmtsYWowL3JZTjZNMGs2QWZPaEdJNlZ3?=
 =?utf-8?B?dzYrcVRRQTlKcG51UWRvZlNyYThVUXFJVUJsRDR2a1ZoSW9vUTdjeTRyTzkr?=
 =?utf-8?B?WlpFTGdKdXdFOWxFUlVhVjJNQnA0Q1J2LytMc2VERHNtbHhVR21GcnRydVJ4?=
 =?utf-8?B?MU5mRkhCaUpKRnIxZnJmM0k2YllPVHl3L1AreDVUMllnMFhwaWpiS05oNUNJ?=
 =?utf-8?B?QkJQOGVTbkR5VEl0VmtMOTl2NlpvR1VZaFVLM2J4TkYveUpWTUxmVVZVZGZR?=
 =?utf-8?B?TnQ2WXVJU1NvL2xlMWhBME5KQWdOUUlPVnVEcDJXcnk4L3lVUWY4R3NldUYz?=
 =?utf-8?B?VytTQ2l6RW1OUVo4T0pmMHBjc0I0enZsZ1JVZTZMWUZNNDRwMU5uL3VOcW9i?=
 =?utf-8?B?eTVlWUtaNTZHWFlOVFcvNmxXWDU1MndYVForbWFXYzVuUmNUUm9wckhjam5H?=
 =?utf-8?B?YUJpOWMxdFBTelErTHhrREg1RTV4YWFTTnhvOFUxUkdBL2hjVkFBQy81RXR0?=
 =?utf-8?B?QVVjOWxaQUlESEoyS0lHdWR3TkNGbmU2N0c3dGgyblpTZldJZFZWT0xQelBZ?=
 =?utf-8?B?SGxPL29xOTNuTHZwQTlPVHVzNVhJNElxbGFDN3VPL2dRUU9lbXJwTTRRUDhV?=
 =?utf-8?B?dnJ3M2RmVTZmT1o3NG1EempBQkV3YzdmSC94eWlmQzQ4dEpZd0kxRTlObDVr?=
 =?utf-8?B?QW9JVkd1MEVCZlNsTXFSZDQ1L3FubFVzMDc2TU9oMjlyK282MkliTTBTWVFY?=
 =?utf-8?B?d0ltcFowYWxRT1lVbXdKQUNpTWZFTDM2ditLVXhxMXhOaFdYWm1tL1hkZTI3?=
 =?utf-8?B?STU2MW9oUzU3Y255ZTZlekpQZ0Fma1NlN2EvUWdtVGordmd5V0lkVVZoWGhq?=
 =?utf-8?B?SG5ULzZiZU9EeVBXd3lWUHU2Q3BscGVoSWVWRkkvcUwvMTliY3l2MHBpcHp3?=
 =?utf-8?B?cFNiOC8wUzFZUDA5dU9KS0dQV0thK0o0TmUrZ2ZNNG1xVDBwVTc5YWM5K2V1?=
 =?utf-8?B?N2VybVRSODNzQWVYNnMyTVJKMDJrZmNmQnNKd1gySy9ndFlrVnoxdlNnaXds?=
 =?utf-8?B?cllJQ3Q1MEpDRFEyUXpJU1lyRnZ4ZUcyZ0lGUHNrek1xMXcrZlpwUW5mRWg3?=
 =?utf-8?B?bDI1MmxTclQ5aGQwclBuczVHNmxMb0pXY3ZJSWV3U2RjUFVEMXNNditNOE03?=
 =?utf-8?B?WDVJWGpRKzh6SjZRelBzYzB0U3E5RWRmcUdXMG5FZzBFOU1LSW8wNndLTThC?=
 =?utf-8?B?MS9MVW1CeFJCWTJHQkJqMXFpUWIzNERPWTU4T2xQNFJ6bWpBcUpmdnZONmUr?=
 =?utf-8?B?Y0dnRDlENnZqTDE3S2NBR2Z5MjViMFMxVTJvMnBCUTNjOElZUnM0K0M3ZFZ0?=
 =?utf-8?B?cnRmcU44Rnp5b1huUUtHa29HVVl2MmZOeXBSTzhRTi9HS1pqVkNsUzdYTGM0?=
 =?utf-8?B?eXkyU3VMUEo3Q2E4N2ZEQUszMHFKQVhqcHlzVVVPTzhRdnVvOHNETnUwQ1Ux?=
 =?utf-8?B?Zm5hSWlEWmRxeE1wYkIySGxGdEhUclJlSFRIaVFhVkxoRXFFZ1pRVUxmaUpo?=
 =?utf-8?B?RkJGcVF4Z1NTam42YmVHYjZUL2QxSmFqUnVacnVFVE5ya0FlVjVFSGN2QVIz?=
 =?utf-8?B?Q3l6MTlKMWY3eXQwVHdqampKaWpNbVArOG96RjRJZGlLUDJaUWZPZ3AxbkJp?=
 =?utf-8?B?MnVralk4M2Y4NmRWeGMwTHhDRjNzQk43Q3NFRG5ITXBBUThPeFlrZDBJdVdV?=
 =?utf-8?B?KzZGVSszZ09qczNXdHpDeEFYSk5QamlhN3R2Vi9FV09KN2p0Y0xsYUl6OUdi?=
 =?utf-8?B?OWdnS2svaTQwRGdCSFJOYXQvUUhneTNSOEZSWDBxMmxsTVJxRVd3bXBPVUg4?=
 =?utf-8?B?bVVZbU1qZThtajlsaFJ6dkl4TWtsSWNZUEtJTURGZUFocWZmNk5wZi85Skxx?=
 =?utf-8?B?TG9DdHRMUFNYRlVyWXdXazcvcnZaRHh3Q3dlaTZSUkFsUWhMQlo3enZHTHo4?=
 =?utf-8?Q?xsE5C9lTrdFsvOb1Qkr9TbC9q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff48c887-0181-4151-dc88-08dd7406595e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2025 05:54:37.7387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yY6uxlTplBfsNav1P1Ur5JqXFF1rh5UmdO6vrMUI8VuPKlVYEfBEAnPc8EUAdq0r/kqYzeWEfTTcmFRWtlJWpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7681
X-OriginatorOrg: intel.com

Many thanks for the reminder.

The 'Title underline too short' warning has been fixed by using the
correct length underlines.
I have verified it in a local build with "make htmldocs".  The title
appears as expected.

And V3 patch has been sent with the fix:
https://lore.kernel.org/all/20250405060610.860465-1-zhiquan1.li@intel.com/


On 2025/4/4 10:14, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/admin-guide/kdump/vmcoreinfo.rst:335: WARNING: Title underline too short.
> 
> PAGE_BUDDY_MAPCOUNT_VALUE(~PG_buddy)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_offline)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_unaccepted)
> ----------------------------------------------------------------------------- [docutils]
> 
> Introduced by commit
> 
>   77b3dbad6b01 ("crash: export PAGE_UNACCEPTED_MAPCOUNT_VALUE to vmcoreinfo")
> 
> in the mm-nonmm-unstable branch of the mm tree.
> 

