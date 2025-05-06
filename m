Return-Path: <linux-next+bounces-6550-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 489E7AAC920
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 17:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD4ED3B3854
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 15:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059512820CD;
	Tue,  6 May 2025 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gi4v9d9X"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8864728137F;
	Tue,  6 May 2025 15:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544131; cv=fail; b=PT9Io705av/TvFxKkzYhvc57/AvQa/ENZltXqmrbDfrvZepKGtuzjuPDM4l/VptiH0sgCab9nRq8aKDg53+uLhAHRT9BIFb2bIl2is61tpVltgqvHPJ+QZce4ejsbD5atE77SsgUK6wU0TKLryVrCMdF39WvODeKY905KvUt6sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544131; c=relaxed/simple;
	bh=bXEXzvho5kUlQq/o9uaeSaooAZSR4OXXeH+OuQBvWtQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GW9SeXyMzn1HPhRElJFaFtlssWaztiRlk78pA7AlGHbjW16F7qX4gA2PC+D/f2OVj3OJlMI8erJnbI0ApY9xOgIVPmMmr4wV0+tjAGwLPmEBjAUBveWFrtNgi1zUtO3GYibTb0M0bfu7zZHaYvGB+Do4SyC6e07KseFqA1tQWjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gi4v9d9X; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746544129; x=1778080129;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bXEXzvho5kUlQq/o9uaeSaooAZSR4OXXeH+OuQBvWtQ=;
  b=gi4v9d9Xb7O2C9f+55it6bl0cyp7jR0TyqD+ONmK5iDloz6DhZ0XaePp
   vXGI3aR1KsXwoeP3k9y8PkHJbbYiTMDhv0hBHMAhY+Ng/fp/dzUmlaH0v
   TaBg2JUbVcoStWAm6E2uZK+n+XEybWarRncSb1MW+i5ucYgBCTyzTYDKK
   y5IC7kCVlcg2vCDnGESuFsagaLBHW3b3Yqa48MGew1J1Mhg8aInHzWc7g
   5WAd+n1JvN9XTEnsy8HDAlZtJ+N9Ybyynflauihf/gg41QBH7QWJV/v26
   YgvRpsWVeF24uy9/nqa9ylqjd4wbaWiLVh8fvDAuM2SoDuZkZeA/wYlCX
   Q==;
X-CSE-ConnectionGUID: 0RQcC7nQQv6/HQT4a8pN5w==
X-CSE-MsgGUID: QS8qmxHGQ0KcUmzR791Wdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59613284"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="59613284"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 08:08:48 -0700
X-CSE-ConnectionGUID: PKGEChwFQW+Qy4HhGyNV/w==
X-CSE-MsgGUID: GHtgHEMuQr6bsotyVq1L5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136152362"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 08:08:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 08:08:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 08:08:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 08:08:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVqaMkaMoJi4p/haatFw0Sq23vjYldqhJyVWQ+FODfO7G7tGEXsXQxQBS0MpdJ+bhtO9fbeab+l9Jcle10zNy8IC+fBmSCsrNgFR8YFFK7YMXEFuinEs2xxyFC4jdbc5XrgiYhiKVEtyNNJHYuloVl9WEvxPiRSpZS0XwI+OSzs6aRl9ILw2fIcpMQc3iNxw5BHtxCM935L8oOGl3i0xA5LfjQjlfH4Vd9+w8D/4q6nmsMaJ4rVGNEAfBR6r5ico6Zl9lZgekEFAo1PVtoxzpQN6X+avVXs/I0PrhX9BNJziXDnMGnIJ4YMSZoOxlMZEeLD5A4c9qTolWnhBEWNaFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWKXoI5kLqH4vh/RxlMP6NYwZHbJzV6WTmFopSsGxto=;
 b=VYIgZKxYBcp2RSnExRv5ueuYlfnZ7AnHlZQErjfeEsHXSdBMc6HtSpByIW081mZ8gkbk2kWmpJlVglhgVQmKraFrv9WISXYVsGJeM58vMtYIK+P94DbOLc4jXkDzGmEEIu79eYwvuqmbLPTuxINzuzau1CV1izExD/lTajv+TnFkPFIFQT+keVG2ewiWguX45dKUKM7IXOgTJ81kDhhwEWPtVbjHhkEcZDMEO2G8pkns1Pld/3+jO64ZV2MNRtCRXVNa+IQp6CzfnL95DEjUEY79rfy9ciuFINeqrm332YEOpubMsnC/m/SeNsQRpFHCmRGsHtKDNWWZIw5I0Bdukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22)
 by SJ2PR11MB8514.namprd11.prod.outlook.com (2603:10b6:a03:56b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 6 May
 2025 15:08:03 +0000
Received: from MW5PR11MB5810.namprd11.prod.outlook.com
 ([fe80::3a48:8c93:a074:a69b]) by MW5PR11MB5810.namprd11.prod.outlook.com
 ([fe80::3a48:8c93:a074:a69b%7]) with mapi id 15.20.8699.019; Tue, 6 May 2025
 15:08:03 +0000
Message-ID: <68b54a90-b87c-4b74-a24d-0faaf0f76e2d@intel.com>
Date: Tue, 6 May 2025 17:07:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
	<hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki"
	<rjw@rjwysocki.net>
CC: Ingo Molnar <mingo@kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>
References: <20250501135827.214fac1f@canb.auug.org.au>
Content-Language: en-US
From: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
In-Reply-To: <20250501135827.214fac1f@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0215.eurprd07.prod.outlook.com
 (2603:10a6:802:58::18) To MW5PR11MB5810.namprd11.prod.outlook.com
 (2603:10b6:303:192::22)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5810:EE_|SJ2PR11MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd3a5f6-43d1-43e6-6e91-08dd8cafcc2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWZZd3Bqc1FSTU5HejdsNlNuNExURWl6dUxEVTJibHI5ZE9pMVpPeXhBTUw2?=
 =?utf-8?B?UVN1V2twMHEycERqcm5vOG0yMWlNWFVRMFV6YklYaExNeG9qL1dxR1JXS1RQ?=
 =?utf-8?B?UmoyT2ZLWGNFQmZtV21CUTNSajdKTGltWmoxQmRBb21BNDhDOHdwdnpzMjds?=
 =?utf-8?B?WXZHeEo3bTlqdWc0dENrSmFaZ211UVVaVE5rN3pnemFrZU11dDZRUFRDRGVC?=
 =?utf-8?B?S3BzT3QrTVBFUVhsSVpVMXMzeUtFQUFhN2cybzR1WnZRTXJycVo0WG9jejV2?=
 =?utf-8?B?TWprcVRhc2FDUlZvci81Wk5uMkw4TmVTemt1TXZaWkRNeFFZT2NZVnducWc1?=
 =?utf-8?B?c0JEQm1wUm5sdGRtZlY1QmpTck5EUVhhNENmYjVSaktML1lWUjlEYndSZCtK?=
 =?utf-8?B?c1pCTTZscElHRHZ4ZTZJdUxCU2QwVFZ5VzFUbjFIWCtkb0wrUkV1MlM3RCts?=
 =?utf-8?B?Z244ZFlqZG11Z3gwS25Sd0ZReXA5Tm02T2VLOERoVWFGUER5aDByMHZnSU13?=
 =?utf-8?B?TFZJUVEreHRNUXFXaCtPdW5rSThUR2tnZUZQVU1SYnlLU3FHMWFtWDYzT2xn?=
 =?utf-8?B?ODh3dTJ4ejgvQVN2cy82YmdSSy9vbVlLSzc0SGlxTnJTclFsMGIwcVg1dXk1?=
 =?utf-8?B?T1B2ZTdvMmFsbzV4Z3MvUlZGUk1zRnJObWZSeW0veG9zV0xjT3BSQWxrVVcr?=
 =?utf-8?B?alhXNjh6UDBzbVNQMkxrT0J3TG15aU1haldUeC9rbGpKOC9weSt5Z1JWZUtV?=
 =?utf-8?B?TktCbHZldHhqc0d5MVhoenBJZjNFR3AvdUh1SUdRbjVpR3VzbEdZN1BIUW1H?=
 =?utf-8?B?cFRWRjhNaGUrVE92VXFRME9pT1pMTG1DOENZVHdNRTZzdVNEK2dYSDBZcWVY?=
 =?utf-8?B?MTJrQlpadkdZOTlBdXMva2djazBGdUxGdWFiUUptb3BtdTVEYmdiellLQ0NK?=
 =?utf-8?B?L3lCdGZKdHA0Nlk2a2tueFVqU0xuZCtqcjhsU0IvNHo4Mm9UQzR6MUZHY0xX?=
 =?utf-8?B?dkRMc2xLY0VQZWpORXRhRVlIeXFtSllsNzhJYU9qWko0eVQ3amxzNjJ5dFlp?=
 =?utf-8?B?ZW41V0NZOFFUKzBiY285OERpN0V6enBLaXB0Sk5RbVpJSi9SYVV0QXl5UlNn?=
 =?utf-8?B?Ky85bmhzWEVYTWsvUFVNdTg0MFhLRUliNy94VEcwRkJLT0NwV1ROVXJoNll5?=
 =?utf-8?B?bWFaK2lweFJIRHBWUmMzUkFqRjBRaHpBdWQvNDFJNG1zY01zV1V2ZXNqdlRL?=
 =?utf-8?B?ZXNuSXIzU3VKU1dXQmpxZlFnYWlKeVpVZ0pmVXJOcCtiNEpYREZrelhYaTFa?=
 =?utf-8?B?ZzBvQUhTS3ljMzBKQVR4SC9KRTdJZU1vWDNLczJMalI3cHJDVzlDL1FXMFAr?=
 =?utf-8?B?MWczMk5uYnM2UVljZzc4RGRIdDI4TEdUdEZSUkgwRVVZUkVsS0U2SURxb2lI?=
 =?utf-8?B?VC9DUHBWMHhYQjh6aytIWGZCakN3eGgvRk1JUTJHVStQYkF1UUwzYTBZYyt4?=
 =?utf-8?B?TU5PckpIMnM4YmgxOW9aamVzeGszOGM2QTUrQUF2cUtHSlNhb05UT2VPTFRl?=
 =?utf-8?B?UDh2RXRCM2tBNXdTYjlRc0FpempSZUtPL0VtWjlGajZSelZiWVNCWVFpN2Vw?=
 =?utf-8?B?bG5LNDAzdjQwaFJYZlpRSXcvYlM3S2ROU3plb1VDRFMwWld6VUNWbUpnckEv?=
 =?utf-8?B?SVNzU1VMWW56K0RKNVZWUEpEb3ZDdjg1a1RKTkY1dElPdFhici9jcTZRNlhF?=
 =?utf-8?B?N24ydVVkSGtnSnFKTlRMdjJONlY2M0tnOFRCZTdFVVEvWHFqQ1BSMlBsQmJa?=
 =?utf-8?B?a09SOVhzOXhTZkFWdTh4UGpaaFB1UlUyTC9FbnVYMFA3eVh0Tm8zeGJqYTBG?=
 =?utf-8?B?ZTVtb3ZlZWUrTkgxRktUSGVaRHg4MkcxY01MUVZtUjNhYVYwNVRPYW9rTUp4?=
 =?utf-8?Q?fabwJFlCCso=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5810.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekhPV3kwUmYzeTFueXhFbG9pK2k5bXpHV21IM2hKR1ZLWGhtZTgxbTZseGVo?=
 =?utf-8?B?SFNtMWZmQmdQZStkZlNDbTQ4aTNaQStxcWp0RlNYSFIzdTlJMjdZM2RiZGRM?=
 =?utf-8?B?TmRMS2tpQVVVa1RFWUR0amN1WXRQZDdsWSt3VnZhK1NUdGIyektaN1pNdjBC?=
 =?utf-8?B?NlYwOWNRVHdwbVlVU2lHbUZrL0Joank4c3A0QUhGRWRGcGVBZnBESi9KL09q?=
 =?utf-8?B?VW43NURGUnB5MDdGdTFZRHBDUy8yRlpFRFFRZ0lOTmw1ZXJVTFd6UVRYTmlO?=
 =?utf-8?B?MjdPNnVOaSs1eEtLTFdGdS92U3E5NWt4Um93a2tremlFeHY0NlRwN0I2anlY?=
 =?utf-8?B?UWNsMmJWelJZbVlFRHV1ZXFXTnpwSmJxRWMwVnR2QS8vc0hPSTJLOUg4Y0VF?=
 =?utf-8?B?UTl3MnNwa214RklBenFTR08wL2xtOW0wb1c4MTVxVkVDMEJEckg1MUM1WVNT?=
 =?utf-8?B?ZHJaM1dOS1IraFlub3MyQ28zNG9WVHlMNEpqZ1IxNVhZcWxRcXZZVVpzSTFK?=
 =?utf-8?B?RG5UbnIxenRzakxxMDZYV1JQdDdGMHdMN0NlSm9zdkFqZW1Land0a2FNTHVo?=
 =?utf-8?B?ZkZWdWV1ZStaMFQ1WG9JSWQ5OS9HdUJ5WDJFcUU5YmpnY01mVW5XMkl5clRm?=
 =?utf-8?B?RWRRTm4wczlrUVMyd0tQUGt1ZkRTTEh2dm05U1YwQTZtdHRjeUQwSGNzWWh5?=
 =?utf-8?B?T1JLNVZUWGU4WEhSR01zTEVWa2JhK2Zaemt3ZjRybkFaMW9Ub3JNTXZWYWMy?=
 =?utf-8?B?MVEwdTRBbVVUajFnUzRKVnY1bXVMQ0FIeEhybE9JY1hGNWhEczR3eUtGWEEx?=
 =?utf-8?B?NVBqMVNrZzBFbzk0d3QvQWVCcm1YeURPVVJ6ODNxUjIxNHBRUVQzdmV3bXlH?=
 =?utf-8?B?V0ZiZzZHSklFQnVKWC9jTlpON0FpV3FabDVNMG9WWGVDWmo5aTBMNi9iVHV1?=
 =?utf-8?B?SzhaNmFHWXNtTjQ2VmM2VGU4QnN3b2d6NWNaRG12MnRVZ3RsRE9DMjVRVTND?=
 =?utf-8?B?NmwzMTlsZmJOaG5yRmNtZjcrd25GZVQ1UFVqdVpzT1h3VTRzS2t1c1NkUC8x?=
 =?utf-8?B?YWg0QUd6ZzVISHB5THY3YndOOXpsUWZCVlZnRWRRYUZBQWtVOGI4dlEyVVFV?=
 =?utf-8?B?YkM4UWw3ZlFqaWVZVGdId3oxcnlJVXUrZUlzR1FhRE1GU05xNnhsN3dWMnVo?=
 =?utf-8?B?NUFxR0pUMUU3VXltamZxRTRGcHFtM3hHSWovMnRiakh1MmpaVkJGdG11azNE?=
 =?utf-8?B?bWE4bVdiRjB0ZGFienpRWmdqRTRGNlN3cEtFZU56U3hMaW5WYWgyakFkdTN3?=
 =?utf-8?B?a2Vib1hReStpREdFbXBUUmJXTW9GS3NsczhzNG82aDlUM21nUmRoYVFqcGt3?=
 =?utf-8?B?NUhzZkhLR1NpN3FLOEMwa2xMUWl6eFNjSmhmL0pyUTNiZ09Bd0pKNHJhZ2w0?=
 =?utf-8?B?aDg0Q1pDODB6KzF2alo5OWNtRWJxajhCeXE1L21OTEJTR0t2SlRXeU54UURF?=
 =?utf-8?B?c3JtZ2R5M2pFc0owVEZxa09wMk5KcXZESWdEeCtlTkducVpkRVdYNG9rSE8y?=
 =?utf-8?B?RzZQeEFRWGRPUzlUaVA4TDBEWk81ZE5sK2hFTmtlQUxycTBQK2VaeEtJSHNP?=
 =?utf-8?B?N21CbE9yU0dtSXd4R1pSUDNGMVIrRzhEMndWbzdiSlJwV3Rpd3JQWkt6MVdz?=
 =?utf-8?B?dmdnSFJWajZrQ3M0eWpNaTBsOUZiSlQ2MWtjYkI1SDg0ak5UWlpMTFFLcDVk?=
 =?utf-8?B?NW01K3U2RVhPa0N0ekdZOFFGMVd5dDhra3RvY2NQTW13Tjc4WThtZlpCREhl?=
 =?utf-8?B?RjkwNlFxUHR6c1NHcnh1TVoxMW9rcjFiSkFJR09QL0Vmb3NXbHcyaThOanY2?=
 =?utf-8?B?UENDN1pxRXhDQTNaRmhoaUNSZnVsMjlGZWNBZW5NK3V6STRhTDA0VFpiaDdo?=
 =?utf-8?B?R3hoTThOcUFmVlFuR01RMDNjd2I4dmtVRkdDTnhCMDhkTHZaRHVBMGFwTU9D?=
 =?utf-8?B?Z01Ob25NV29OSUVRWTU4RUV1c3dkRkR1K1diRmt4NzJUTFFGQXMrUnBwL2JV?=
 =?utf-8?B?ZWFmMlk1QjlRaGYvR3JLb2xEVlgxaGljcUNodytFdWdUY1RUaDc0dkphaWpy?=
 =?utf-8?B?ekp0Zkx0R1Bwa2xxZ2tJb3BLWGRQK1YvR3JTbG1MZVFIclp5UDYySm1TamhU?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd3a5f6-43d1-43e6-6e91-08dd8cafcc2e
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5810.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 15:08:03.3518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WegIqT+Pxzkdb+DRVYjk0L5dQK8tVx1ogCCRtElSPO+FuaqpFklwBm1Cu3Ilr/0KJAVtV6OlCQjYkjkL5B06MkxGFxSqUtElfQcoZ9PaJuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8514
X-OriginatorOrg: intel.com

Hi,

On 5/1/2025 5:58 AM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in:
>
>    drivers/cpufreq/intel_pstate.c
>
> between commit:
>
>    ac4e04d9e378 ("cpufreq: intel_pstate: Unchecked MSR aceess in legacy mode")

This one has been merged into 6.15-rc5.


> from the pm tree and commit:
>
>    c435e608cf59 ("x86/msr: Rename 'rdmsrl()' to 'rdmsrq()'")

So this one will clash with the mainline now.


> from the tip tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the report!


