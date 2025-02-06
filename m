Return-Path: <linux-next+bounces-5381-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADDAA2A286
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 08:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDD91168AFC
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 07:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EA8224B03;
	Thu,  6 Feb 2025 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="bepa87rh"
X-Original-To: linux-next@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2115.outbound.protection.outlook.com [40.107.247.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65182144A8;
	Thu,  6 Feb 2025 07:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738827644; cv=fail; b=L3ctJaUkvUiAQiXL+vEMk3yN99qci2WSm7ie4S9znCO0ujh8l2hTy+8vhtwDlgr9cOFup+VHAd80NXATOS3VOc8g6TbUWlHsC5NYYTJrx2b6LSERMQVA9Ta5Nl+f6Pa5r2YLyqwva2kbu8CeXyqNXEcejbql5mDC1sS5VpMrQeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738827644; c=relaxed/simple;
	bh=i1XZKEr5/Irb6APTAvLvqxMdEIhhKZtAMWh3zotHw6U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PxrQsy82wdML/FkZs3kH9TWRFO/fOY14b8s8T6ZJjxMXGNy5dHjzIkuTSWl2YWxCfPignooBTADH2SSY6rMI5QQz4XUINDzad75duD+lkZDRt7zyMiXEnXP+JHawvjdWkfSA8eCYbLU/ERbWpjoMZrzeftUTJTgO/qXqkl55xJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=bepa87rh; arc=fail smtp.client-ip=40.107.247.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBweLYUCmqVS37++0IsQkELLPaj7vzLPP5GfxQX3V6IX0oUtg0TRynDVgi1NAhSz4itfwegaFQEWFSYbt6vUMzNiODD9YaVU7kyVK8/xz59OJBU294H2MUzyqqRW9ofjMqiyWmQN60E+MXlxhnWgMveb/70HXfRgnROMYVeKRPzUKE+wGUwfYbOcSCbvjxwVl6Te26ddVbTH66hWRqck7+SF4bOz1ogCZBDHEUPSKchE5ZsVnNYAJ8YKfm0LAWQx/+NvcG45wf3K+mi4seVAhihNgzmgSCN+ctcFTCjx0Yvc0D2pfM9n2HeW30yYKRyXsqPFsJJicbHgf+95/NW+EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6077qpwjnIPTuHaelxoJbIKFDPvYkfOGSIrmGo+4jY=;
 b=jN8GcJZDR2OprinVHYvSMKdsUep9ftsQ87YxLSlSr+8u07M0JR2hfmhAjjYMYLbLbbeMAnIFcnoBjZwh+JbA4G81kCTY7WAY1P278CAXo9eFldBu3S6qsP5evKKGnQqSHEU5bIfd1YLZzJQN8qEYMMbzLZOuqoSnrvTBZOhsS83WY5PxS/iBSzmutsh4hB7iKKxFMvfSs42rRCv8Py5fpULInhjLfHE6cY8cNXtPQ9oEu3YYz8lCMrmJO+nb7Ydum77I5AjbNEDlgd8r6iyj9fXrCPJ5/nD49KjJzNj5GBnqTIwjFb74o3tZipXcnWwotPUItUIPDUNWmWU1JkottQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6077qpwjnIPTuHaelxoJbIKFDPvYkfOGSIrmGo+4jY=;
 b=bepa87rhpR9XhUjvJ04vC30JoBwe3P3az2iYr39gTq2ZU3cqWFCyNGitZLR8RjSYT2b0BwfoxMDuOSlhna8Q9oiO911QZKEEZ0xpVpn0ABZJ6tH1VNYmKzUN3ra4/MJX9+z+bozhGMEo3IkFCthMXWIg+F+GjO2K6YB/ijNPWUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from AM6PR08MB4215.eurprd08.prod.outlook.com (2603:10a6:20b:90::16)
 by PAVPR08MB9210.eurprd08.prod.outlook.com (2603:10a6:102:309::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Thu, 6 Feb
 2025 07:40:36 +0000
Received: from AM6PR08MB4215.eurprd08.prod.outlook.com
 ([fe80::f8bd:a866:322f:7b42]) by AM6PR08MB4215.eurprd08.prod.outlook.com
 ([fe80::f8bd:a866:322f:7b42%4]) with mapi id 15.20.8422.011; Thu, 6 Feb 2025
 07:40:35 +0000
Message-ID: <647d4d6b-615d-4c0c-b001-fab43fb7ab4d@genexis.eu>
Date: Thu, 6 Feb 2025 08:40:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the tty tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250206135328.4bad1401@canb.auug.org.au>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20250206135328.4bad1401@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF0000459A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::44a) To AM6PR08MB4215.eurprd08.prod.outlook.com
 (2603:10a6:20b:90::16)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR08MB4215:EE_|PAVPR08MB9210:EE_
X-MS-Office365-Filtering-Correlation-Id: c4178981-ad0c-4386-b19b-08dd46818b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2JTaHJJL0R2RnFiUUVaZi8vM0hENTJjcEJNSmhCUVB4Tk1ZNG0xaVRDUHV4?=
 =?utf-8?B?TFEvUWZsTmhtdHBGUmpGeTBvdGIvdE01Z2w2QmZnSW1aWUNkQWp4K1JEY01L?=
 =?utf-8?B?SnBxVDNrZCszeG8vck9QTnU4MzBkRXF3UjBkWS9BdkVjelZVeUw4NnZjOC9p?=
 =?utf-8?B?RXZ4ZU9IeWM3T011SUFYVjdWVEtnSFZPcVJ2QkRQSnRWVXA2RFJ6UmJDTGZ6?=
 =?utf-8?B?bnp2MzY1K0l0QVRHWW5VZ09XUEF5K3dkaUdwbnFHTWl2RFBvcUVqa04rRzEv?=
 =?utf-8?B?Vkc0a1dxUEdVK2FiNjFHQ25XbXNLNmtHVkcxUlR0bi9QN0Vydng3bVpodXBO?=
 =?utf-8?B?OUhtbERnQ3JxNEJUcU1DZS9JRy85d1pBZFNqeDdWRWU0ckd1RWJmRk9xdGJL?=
 =?utf-8?B?NVN6RFRwWmVuRmtWMjZCTGwyb1NCOTZKaFBKYXpYYkEvbDVTWVVycnpEdENo?=
 =?utf-8?B?SVZ6M0daWVp1MXBYNTRUZTN2WUJaOGJ4bzgwREhJcktCTFR0UjlwTUlPZkVr?=
 =?utf-8?B?WjY0UEp1Y3ZGU1VhQytlUVVVK1ZqR2xVZjVzalVvOWx0Qk5ub3BkZDJrbGd3?=
 =?utf-8?B?Smw4QlhtZjdCdm45alo2WFJRQ3hUTmtmcjIyWkFXMHpVbjJpOGpEZE4vVG1P?=
 =?utf-8?B?Q3FrSk04MEptNWw3TmtOcWNPVS9WYVJiMHcyZE1WMlFXK0VKdHA2VFlYdnQr?=
 =?utf-8?B?dlRBelBTenFlRFFpbGx2aWVXWk9xQjNOYVYvMmJlQVE5WDRVR3ZTckVCN0pQ?=
 =?utf-8?B?RGRQVklBK1pxZkpHWnFqRXdHUnkzUVQ4alpTbXd4NGpFUkVpRmpxNlNyL1lI?=
 =?utf-8?B?emNJYk9rYnVzNGNiSjhyOEN3c0RaSEwzSk5vY2ZCTDhuK0Z3OXZUVW1RQk1W?=
 =?utf-8?B?dzhpK0pSQWN3cWpSN29MRWEzYzBRVllJQXdOMGdDMGtENzJCVDRQZElqeGNT?=
 =?utf-8?B?Yzd6a3ptWEgwd0MxN0luQXRPajA0Vm5SUGlzcUVqUEdGcG55M2pUVmxxNGZ0?=
 =?utf-8?B?ZW5jUldITlZrQ2QrY2poNlBJQTdzc2xGV21ldTJDK1J2bmVGelZqT2lRTnBY?=
 =?utf-8?B?TkZiOHVnYWpabGlJRFV4c2xxNkFTaGpvRXd3NFFpaUpxVlhKYlBmRldwdWl5?=
 =?utf-8?B?dXY5aVdkLytWNzJvVG82TjlHMVUzNC9CR3B4cTBzUWdCODdlVGxCS2FSWWpI?=
 =?utf-8?B?UGxqVk96dTBndzNBb05Wd3pleEtBVDdQcTc5Q3l1RTVDL1ZJQnZNRjJoeUt0?=
 =?utf-8?B?eXdKYmp5ejdCSlplK2xYSXlBKzJ6Sk5QaTlUMlhjaXAxYy9GempjSzNyclFv?=
 =?utf-8?B?NU0xTGZyakJ1d3gvWC85NGNPMGZMSEU0UkYyYlRHUDRWdHhHSTliS09qblJ1?=
 =?utf-8?B?dHJ5MTBWL25laHRyTmp4MzAxeDkyRGlIcFBmN3NJTVVIMDlwM0dUY1BJT3NK?=
 =?utf-8?B?ZWVOK04rdHY4dWpkQ3BabXNaL2ZKQzE2VHFYQkdobkM5QkhYV3ltcG00OXZR?=
 =?utf-8?B?ZS85dmlCa3pzS3dvQVRXNmNzWnNGdjNZQUJNZDdRTllCM0YvcnJUdExaMVBY?=
 =?utf-8?B?YkVzckZsTnEyd2phdndVYU9YU1FnRnBpbDJmMWlMTDNVTTVJOUx2UTVBYkVk?=
 =?utf-8?B?UHlyeDVEV3VqL1p3bDZzMDhzVnJwSWhDYk96MUhZVHl6S1BlcGwreXZqdjlG?=
 =?utf-8?B?RG9DT0tNUkFUbGY2OU0yY254UGt5ODB5ZEZVVEoybFZkd1N1TXFZU0x1UVY2?=
 =?utf-8?B?Tm9BNE1hOElOR0VpYi9WbDI1MEs1R0RhM2NYWTFXL0JwTjl5KzY2NCtiMlpQ?=
 =?utf-8?B?RlRJU0haV3ZVU1Z1dFE1cmczbWtVOExGTXREcVUvcFJJQnRKL3ByRjcxRXk5?=
 =?utf-8?Q?ge+qypBzVC3TU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFhVS0RJQUxvWjIrcG5UMEcwUVJIckxEQ2d1Zk92OGJObXpvRjVxZS8zQ3kz?=
 =?utf-8?B?bzhVWmQyeDdoc1BPaGhHYjFucUZTSkRldmZLWlVFZ01FM25lb25XZmJYYmhK?=
 =?utf-8?B?SWt6Mjc3eWE4M1ducjVRRnhaSHliUGltNG1paHhOZ0JoN2dFOEZRUzJ2K2Q2?=
 =?utf-8?B?OE0xOTZzM2tERDdRekIvRkUrYlp4dDlBaWQ5VkZKVjZFVExCWTMrZ1lraldv?=
 =?utf-8?B?TWdyQVdWaytza0xzRmpTN2pFbTdJaXFYV3lzaUNVRFdhbXVXMDhZVVVkZVQ4?=
 =?utf-8?B?TEFoM0QyM3J6UkhKQkZ4dmVNdVNTTlR3U3RQejdnZnJEeTB4MjNJV3JUdTNv?=
 =?utf-8?B?WjZDcWkwM2pjRERUWmxKSXFOVmI3c3ZGQWQ2bGVhbEQxcXpnbE9IS1Y3bWRQ?=
 =?utf-8?B?NWJWVHgrYVFVVVQ5WHc5REU2WGx5dHk1YnZwbmN1Umd4Y01vbTJVYnNJd1VO?=
 =?utf-8?B?ZTdER1dPTkZYSE8rL2gyci8zVWREUzRKcDNrR2o1T0NxUDRsYVJnaU4weHlU?=
 =?utf-8?B?WEhBWGRTdUI3c0R5LzU4Tm1lT0lEbFJlOHM0RDdmaENKVW1SL250VmJsRXJz?=
 =?utf-8?B?YUtuNDJTait0UjFOSWJEaklKMWRYRjFmTWx5aWlmeS9EcWxSb0hKbm5DR1dz?=
 =?utf-8?B?S2p0cGQxR1hwUHRIc2N4M3hqV3Bob2hxSVN4WXBRM3J6UFVuZVJYbytWY3Mx?=
 =?utf-8?B?YTRXVEpGMzdKU3dma3NES1JSQWVKOXk4emxBSmZSUGF0MkhKREJmdXZnZzFG?=
 =?utf-8?B?UnBoTFJlS1lIK2RmcjF3V0hOZjV1MExhRkVHdXNEcHRxYlJMVGZNQ0dlQ0xY?=
 =?utf-8?B?ZERJb3cyWmkzeXl5ZkhlT3Q3TmFGQ2xBOXFrelZjZkFWTG51NWYvaVE1OVhJ?=
 =?utf-8?B?SlhZMmk3WnNFWGFZVVVsZUkrczFpbnZpbk9tNVBRLzUycHRveXRSak9HYnpo?=
 =?utf-8?B?eW9TWmIyVmFoUFZFSXYzZGRnSXJwWi9KSU1mMGhNamFzSDAvZGdtY0wyQ2xJ?=
 =?utf-8?B?bUQ1RDN4VHRKaEZrdTR4b3U5NUcwSHlKM0JjbE5HbXRpT01GZWJ3V21haks4?=
 =?utf-8?B?RHQxeVlaSXJIaC8zMm1xMEtMekpmOEtsV1B2VTUxa1Bob2doZURLMzZUbXBp?=
 =?utf-8?B?UXFTTzhLSnBRaHM4Unl0aHBkU1F5V05PbGlBajBJcEowOWYrYjk4eENaMFJ6?=
 =?utf-8?B?Q2FURlhIdXAxaDN1bGpEaC84bGpNdUJTTCtzOHVyUnYyQnRLcmo5aUVNQ3ZL?=
 =?utf-8?B?UjBqVjlxZER1TWRBQXpvQ3RiOHQ2WDliRjNhYyt2TTVpc3lXb3YzWDlGZEJN?=
 =?utf-8?B?OEFiSmlJbGd3cTdkQmZjdEdGekVST3Y5cUhRQWFxTjJ1VDNOYnAwMlllZHpW?=
 =?utf-8?B?TlVZcHpleVJKc3BrZTk1YmtobGRVZjB6NUREaWFKRTc5ZU1iVlNpUXNyK3JQ?=
 =?utf-8?B?NjR6N2luKzIrN3F5SmEza2FoQlY3WGFTOEZUdEVGWnVCWkFsU0xxVER6bWpi?=
 =?utf-8?B?UDd4bmZ6MHk5Y3RSVG1SbU9DVUM1TXpiN1hyZ3ZLeFhzSHFBWDlHckQxekhC?=
 =?utf-8?B?dlhHZ0JxcXZLM0RnbVNPS3pubEM4UEgvbGdoa3JBdHNmM05TSGlsSkZpYTkx?=
 =?utf-8?B?aTJ3NHpLTVRUTXg1bmxXK0h2RE90QzRGZ2NUTXgwdUN1SzlldjRQaTNEUUZJ?=
 =?utf-8?B?b2JpbFJwTm9SeDJySHdmZG9veTZyN0NlbFFvMzZOS05idnN0VklocjkzaWsx?=
 =?utf-8?B?YXhaZ0F5b1ZiTzhoZjBtZWZtSHJLODZCSjJQaXlDc1lmUHZZOWs3N1ZEWVMv?=
 =?utf-8?B?dklQcUhCT0VXTXdGcUhrWmdWSzU2Q1dTQlBSSjlXZ2l3WXZZTkIzWmVrSUVQ?=
 =?utf-8?B?ZVhnSGp1QjFLM1BVSGh4TUpFUU4vbCtoeTlvR2JUSDBoY3NpbmVBdHBORlRs?=
 =?utf-8?B?bWxLMnZmbHc5R0JZYWs0eHYwbE1udWRyTkd6VlZrVHlCNnhuM0FWSERhbGlW?=
 =?utf-8?B?ajQ1Rnp6UHdqT2NIOGs2YlBGbTIvN21qUHNVVFF5SjVJdTdqY2szaW1PV2R1?=
 =?utf-8?B?T2F6TUlxdlU5QnBNRUl3Mml5RFpUQmZGNnFhcUpzRXFJSGhpd1pKZXdlMWZr?=
 =?utf-8?B?QVczVmlLdG4yeDQ2VFV4cXl2MmhKUEV5RXpYU001QTdaYm5PUytscXoxRnc2?=
 =?utf-8?B?ZXJ1NUQwLyttTElmNktFaFhNR21sRU12UkVXdkNwOEc1RTIyeVlhb1FoalNo?=
 =?utf-8?B?QXc1azZFNlFudXZ0VlJEWWh3OEh3PT0=?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c4178981-ad0c-4386-b19b-08dd46818b2c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4215.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 07:40:35.8000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzc69FfCOCD8C0zmBOQCuGggr7lyo2nNd/soM4ijssR5TZX9ZrJZXBmPz2WNPTBLCW+8wqoQehku/YRx2IvfINmE9Ay0MoI3pISALAR0jCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9210

On 2025-02-06 03:53, Stephen Rothwell wrote:
> Hi all,
>
> After merging the tty tree, today's linux-next build (x86_64_allmodconfig)
> failed like this:
>
> drivers/tty/serial/8250/8250_airoha.c:52:6: error: redefinition of 'airoha8250_set_baud_rate'
>     52 | void airoha8250_set_baud_rate(struct uart_port *port,
>        |      ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/tty/serial/8250/8250_airoha.c:10:
> drivers/tty/serial/8250/8250.h:328:20: note: previous definition of 'airoha8250_set_baud_rate' with type 'void(struct uart_port *, unsigned int,  unsigned int)'
>    328 | static inline void airoha8250_set_baud_rate(struct uart_port *port,
>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>    e12ebf14fa36 ("serial: Airoha SoC UART and HSUART support")
>
> I have used the tty tree from next-20250205 for today.
>
COMPILE_TEST seems to be the cause for this.

+config SERIAL_8250_AIROHA
+	tristate "Airoha UART support"
+	depends on (ARCH_AIROHA || COMPILE_TEST) && OF && SERIAL_8250


Should I send a patch removing this?

MvH
Benjamin Larsson


