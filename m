Return-Path: <linux-next+bounces-3264-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C0F94BBEB
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 13:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAA172823F5
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 11:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA16318A95F;
	Thu,  8 Aug 2024 11:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s/idMPwk"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168F718B471;
	Thu,  8 Aug 2024 11:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723115082; cv=fail; b=fow6hQxzovvAUWU/Aez0g0OlMMjq/1D1UdTyr50E5vZyvZxdjaT/wUzUCl2HnokgoOJp0c2owYW/8sJwdZad+17hfhganUVwEDg92gf68J5DMH4gENtmMvmD9aNiCEcym1UjByMfQlUJ5up0MpdiKh9e4jjSgUd96MZkSN/yCWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723115082; c=relaxed/simple;
	bh=oZYM/TI6e5grmNp2+0WUF60n7esnZpusp2XvaCHGiys=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kU11aJQkIYEKOPDlY870sYNgK+frgeWGIMmFCr8QQb0QLRexc/fV91PNR5W0fy++ZPGJghmVXnNVM0OLWK+sPUGJ8I9ahSgPn135KXEdHUKbc4lGLBXbtaHJ9+aOG1XxHa+BDyXkgg+p5lI4jkC6NbBKYiFCkw0u3yH4Ntpvbmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s/idMPwk; arc=fail smtp.client-ip=40.107.92.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhnMzK/hfZLjkzh0tj0bPs12dv3dOYu2EGNwBEDzCOWfHzju8Iz5eyISymxMTJ5S0noWQ9FZWLgcYlAswglOM5AGSc8LI8OrJRvujWPzpgmzQpnfAjkDAybBJ4DYro3ssJStQQj8lMS9QOT8oTPunk+8HKXHKihJWHBVNgi/g+cYSVw+MSLSrZo+DSUtD1zZ7JUPjhwF/78FNK2q019Wi9Wis4zcuTKexPBDNkezUlr5CVi8bLLlJzPrk++VLxFXnY3r5vV0Rj1N5fc13Y18XXq8H0UQ9f2hVtBH7rQ6h+kVqJT6UZRydAfv12virGsiAqjGwyKbzXY7bQJp2ggRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EftbrDNA4T27EqI1h/yczgvn12YFvKcdy5mobNbREvw=;
 b=RoXZjsFc0TXHqktmwCk6skm7RXl4el619UKQVLqWyg5H7Z/5k5IsWzynyZeC3PceFv79w/otLtswRHy/A9QFxqp/YPfEZ+FkFC/m+CFNMnzsq8O3kta60DIjqYpNS8F2/iSq+TTOcxya1AEy98kVRVhSTAWtS8NzEmsh6iJHMs65nQcU8uBu51Nw+UBUfmPkRBBbqs6A4w5zV1kvX3Tx/uQtaGHKOw49UCVYR2bIo8CBAda7mP/23KET5n78r3ReyYdWPu+sljhSIkXJV31+gH1tmjyUre/aqpEhY5RiZOet6ZMoZTkkMv6+7VrK3aDQ/e1beTi4LSgqQFGVxKTGEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EftbrDNA4T27EqI1h/yczgvn12YFvKcdy5mobNbREvw=;
 b=s/idMPwkAL5Lr47T5q77XpL8XnJDlNKQZuSyoNY75XmFrbciYM6YPeRKgQ4bS2SuAoPryIejDYa7pu0B/PHop9mqrNiCx0vnCnp58kU4sCSLGF3otkrnJI/+DS/6LC1AXa5PxTH4bwea/NKaBX07jRpIRznebZXrphIT/6xlsow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 11:04:37 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%5]) with mapi id 15.20.7828.021; Thu, 8 Aug 2024
 11:04:37 +0000
Message-ID: <ee7817d6-8521-4855-9b21-17f04e628009@amd.com>
Date: Thu, 8 Aug 2024 13:04:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the nvmem tree
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240808083050.6ac578f9@canb.auug.org.au>
 <e8688839-7686-47e9-a497-31b57abd46e2@amd.com>
 <aef4aad3-ea26-4ad9-ac86-f0906a0524c3@linaro.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <aef4aad3-ea26-4ad9-ac86-f0906a0524c3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::16) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: d114fe6b-6e4b-411a-e30b-08dcb799e465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODl1MjdJRml0dkhBb0dnUGlzTmt3SHc0T280NUVobjZTNC9ia0VPa05ONHFY?=
 =?utf-8?B?NjNvUGlWMnlQbWxZMFpqOXo5eVRUZzhKMTZKc0lzbS9QYVF5UmZiNjNoYnNP?=
 =?utf-8?B?YjcwY1RERXZRMEovRnFMUXZvZWwybEs3dCtrVDFRV21DMkJKUExrSkExMWUy?=
 =?utf-8?B?cDRNSVA5NjEyamtqTG9lZEg4Ty9xT3A3ckY0ZFE4M00zeEQ2WHlKekJFN3Ar?=
 =?utf-8?B?R0U5b1JJK0N2NElKcmNTSHRwOXVkVzRzampMMXVIRHBLbWM5VVNDMzU3RzBY?=
 =?utf-8?B?bWN0Y1NydGpUdUxZbE5iVjF1ZW1WZHNRNXc1YTQxUjVyQ0M1NHRXNmc3OEkw?=
 =?utf-8?B?SXZnd3c0ZGs3amR1Y3FnL2pyRDE4V0RodnIxN3BYWWwzMFdmRmt1ckFDWmpv?=
 =?utf-8?B?UkE5eEd6ZC9HSUEwQ21XNHdYRCtocE5RYXh4ZWpzRHIxMjNlQk8wUnVmczds?=
 =?utf-8?B?UWkwZ2hOMG9RQkRiUUFDZVBDZDR1Q3phYyt5aEF1aUFNRXdvd2VpUDBqQ1RY?=
 =?utf-8?B?eFUvWU0wdTFLQldGbnAzWUlxK3NYRldYSERQai9LT0haUGJFcWZhbERWZDNJ?=
 =?utf-8?B?YzZMOHZrcXQ2RWZvZFNCT3hmSXB3aW1jY1dqcENZTkcwWmg3NWZ2QXpLWHk0?=
 =?utf-8?B?eVJsSXM1ZWJWbmQ4aEdodUY0RUZNVXJmUnRqNk9XZnpvTWljVGtaV0Fyd2ZM?=
 =?utf-8?B?L2prNlVIT2lGNnVmUm1lUmFjVlpYVnlmM2x4ck5sTndaMnE3RlBldnN5emFG?=
 =?utf-8?B?c3N5bEVvd09HSnQ2MjZaYTZ2QkxycE1takl6eDcrUU9qQjAyWm14Y2pycHdy?=
 =?utf-8?B?TW5PczJ2VXVYVnJ5bTd6d2NGMEo1aUUzem1ITjJFdW1mekNpWmptR1ZUN3Aw?=
 =?utf-8?B?SzJUT1ZpSHVxdUwyS2ZnNW05TDJZQ3JjNHh5OWxYRnBCV3FKZmpCSGwyQm5t?=
 =?utf-8?B?N2pMUzYzd2c5d0pJYnljdDBjbHVCeVBBYmlXeEZYenZSdGNHWlFzSHJMSjda?=
 =?utf-8?B?V3AvK2VkOTl5aVRFNnp3alFveStQZUhXMTJtcEZmOGlKRlE0Zzc5Y1A3dGh6?=
 =?utf-8?B?T0YyZk1QdTV6VjZDWE5DamlCZHNYNU9KY092MG5ka1B3WEdtbFJHZWVpR2xJ?=
 =?utf-8?B?ektZZjNtYlNxZEVVQnlJVGN5ZWRyK0FYVFVFTVdISTk2RHkwd09VY3ZJMUZ1?=
 =?utf-8?B?ZExweGpGdklkcVB2WkswWE5SR2t0dlE2QjZlUlZreHFnNVlDY0ZnaXNkUGJB?=
 =?utf-8?B?b2FPQmlKT3NnQ3RGMm1xRzU1ODR1azk1OWJKTFlHUzRjamZhODRNcy8vWEZw?=
 =?utf-8?B?WWM5WjdVVU1XdExleHorV1FnMW0zSmxnVVRQc1hUZUg2ZVoxdVhISm9wVm1L?=
 =?utf-8?B?ekZFRlY1alRGSjBiZ08rRU1tNXVyRkdkMUxtRTNNUFc2K3UxaTgvai9LOVli?=
 =?utf-8?B?aGpRVlZaM3R2MmJYYXNjY015VGRPcDJZOHlpQ29EUm1ybG44dVRHU0NvdnQ0?=
 =?utf-8?B?RzZrTHhwQXRqVEUrbmpDbEpxaFFsR1drdFprSTltbXl4K2ZPci95YkdtREMz?=
 =?utf-8?B?WW5lZVl1b1RsVklUaDZjSkk0eGEwd3Q0VGw1QTNaR2JoNHhqL3pTNGczbkpM?=
 =?utf-8?B?MzJZZ20yTUtKRzFvMjU4QUlDM0dEK2xVMTVDUHlaeTBhcUp5UzFYdXQ0aHJS?=
 =?utf-8?B?NjFtV1QxeWErREYyaTlsSktWcjhJRGttdUVFTk45VXkyWXdWUVg0Z0h0Qmwr?=
 =?utf-8?Q?AcgUuwFRrcucQ+ZZ2g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW5xd0FNM0tnK3Ywb1lOQi83N2swMkhLUVJNSUdoZ0g0dnNXbVZHV3dJWEZM?=
 =?utf-8?B?LzJtRG5FbXFoVFlZeTNlWFAwVVFST3lvMHpmamYwZS94eHBLbWZGT3R6U2xy?=
 =?utf-8?B?cHcwcXZTL3owTEVFVjRoSldHTHB5Wlc2ZEc2MksxUDhFR3JtWitBQWZZY2wy?=
 =?utf-8?B?Zy84Y2MwQU9rQmFOb0lqUDlHSkN0NTdXKytWMVo5MjdWK0tDelRHYnBha01C?=
 =?utf-8?B?NUQ3Q1YxSzdRK3RLb3dBL2I1YXZjSk5QQTZPL2U3MGFEa3V0NTJGV2R2dHdh?=
 =?utf-8?B?dURvakI4Q1NkOTFIamhEeEFka1laSDV2aVg1Rklrc0o4UWRaa1Fpd1FmZko5?=
 =?utf-8?B?Wnl3WFJvZ0tJNHdITFdnT2c1MVBYcUxMTXNBcmlRM3lUM1FRQ2VMQXQ1RG1J?=
 =?utf-8?B?T2h0V3FLcmwvZ0FCWVpVVTBPYThOSnZIeGRzOUM4UWZjRkpqeUtieVJtZlpa?=
 =?utf-8?B?Rk8xb3ExS3BzbjdDMWNUZUdYQ250c2hpQ0RIQkdZdnljakdMT0ovTnlIK05w?=
 =?utf-8?B?Slc0WkF2QktFNFU3YjBOU0daeHlPUFFsY3pFR2hsZVdHaitCSjVOaDAyU0Jn?=
 =?utf-8?B?MFhSNkR3Y2QrT3A3RTlTb05CUW1EMiszcm5DSmE5K0dva3NncHZKc3NsSURN?=
 =?utf-8?B?anRsaDFnOUtvSzZZVzJnZXluUXZtQ1U3WDl1dzRkK0RZa3MxWkhUNVpoNUZv?=
 =?utf-8?B?RTBrejc1REdhR1dWbEZlSlI2SCtyL2dqZ1ZRK3dsamw5MWliOTFheUx5N1Rq?=
 =?utf-8?B?Y1hsdjAzVE04amFPci96WmlROWJMaG9QcTlrdzVhMUdEQ0lZNHJ0ZGJKSmFV?=
 =?utf-8?B?bmtjS3BBdW9PVERYRVBEY1ZzSzUzelVhUWpab1Vwb2ZqQ2xvQ3RaUUJ6NDJi?=
 =?utf-8?B?eWxsdTB2anM2TGhsSmU2WUpGZmhHS2RiTExZV3MvelhZR0hYSkdLQkk0SGt4?=
 =?utf-8?B?cHArS2VuMkZXQ0hLN0dNeTdBVEIxUnd4SnZNUWxDbmxiVU1BSmJubkwrQzZj?=
 =?utf-8?B?b084TEpaQjVHMFY2azdCS1B0NC9ueDlOWlV3alNIRVhEbkhxbjFab2daYy9R?=
 =?utf-8?B?L2dyQnAvbllYclkvYUt2R3RIcHVJLyt6YkkxUk9TZFF0SG0zeVpJYnBJam13?=
 =?utf-8?B?RVdKUXlnUWU4cTRWQkx2VmJXU0Y1QUpiOUNaa3oyZlFZQ21kNjdmbjZCTXFI?=
 =?utf-8?B?VWtYYkVDQVJoMHpFbmhFWjFyRitQdlIxN0Z2cE5IWkZKaHU1NXErTE1MTTg2?=
 =?utf-8?B?bmkreXlhb1h6T2VXVWV1cXZhRW1va2NyL051aVQ2L0lFZnJ6WFVRUmoyc0NM?=
 =?utf-8?B?dm55akplam4zTHZmaXFvbnVKd05tMGV6Q2hnempoc1g2c2p4WG4zZ1ZPdFNi?=
 =?utf-8?B?SmFycVFtMUJwWnJEVjRFTlc3V1VnR2RCQ3hOUDlVWmd2R0laREJTbDVZK1hu?=
 =?utf-8?B?V2NKYnJVY0pxTGpsT3JNeVJyVWpvYW9YdEJIUHdaSCtmeTlEeTJrSER4Uzcv?=
 =?utf-8?B?NlFQUi82RjF4L2lXWmtJbFh0cGRsei8vY0VYUGpoOGUwSGZjTlVGS2x0K2xR?=
 =?utf-8?B?L0FZU1JhcUNtTHlhWmRFblpWNGIyYm5vWVFiOEtycThBOFMyOTU2RnFyYzFS?=
 =?utf-8?B?WXlGM3ZrVm9PVGd0TVA1VFVtUVJ1RDU1REJCTmVmVlJmMlpYa0U5NGtJa2k0?=
 =?utf-8?B?UUV2aVNvalZ6K0Y0UzBMVSthTXdvcjNhWjE3OXBzeVFOVTJXVi91R1JjVFRj?=
 =?utf-8?B?Z3UrQThvTllWLzJJeHpwYmFzbDJEU2VXMU9maGpHbDNWTTFjeVI0YWFGYlZJ?=
 =?utf-8?B?K3RmWlI3N1BVc1E2NWh1WWF6MGowSVB2MzdLNm1va2NqSzVRK3hVTkJPbTNU?=
 =?utf-8?B?cEdEYVppRk9LOUxmcDQyTW1KTUNNNE5DZHQwSUhlcTVZWUMza2RXOHJUTlVz?=
 =?utf-8?B?TlpYcFpUU25YTk5rMjVERkJnUTJZU2l6VlpRdnU2VE9GenFlVml0cnJPQ3Q3?=
 =?utf-8?B?SzEyb0VzRTJpM0UxM1c2cTUxTEk5dDhZS3Fac0pYZklnMlVCV3plS29iS29F?=
 =?utf-8?B?ejgvaHBQWWJSci8yMTlrdm8rbHl4MmlFRXBkeDV4eUluSE1ldjFwdXlheVZT?=
 =?utf-8?Q?1TymONthLjVaB97z0W9XuFz5t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d114fe6b-6e4b-411a-e30b-08dcb799e465
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 11:04:37.0044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Qpfb6GIvHXlUgSbMcU2OfGjY+MDs3mVjFwKyelpsBD2UytkGGqXcArmdiFAlrpm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121



On 8/8/24 09:18, Srinivas Kandagatla wrote:
> 
> 
> On 08/08/2024 07:00, Michal Simek wrote:
>> Hi Stephen,
>>
>> On 8/8/24 00:30, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> In commit
>>>
>>>    c258adca4fb4 ("dt-bindings: nvmem: Use soc-nvmem node name instead of nvmem")
>>>
>>> Fixes tag
>>>
>>>    Fixes: a0cfd5e99782 ("dt-bindings: nvmem: Convert xlnx,zynqmp-nvmem.txt to 
>>> yaml")
>>>
>>> has these problem(s):
>>>
>>>    - Target SHA1 does not exist
>>>
>>> Maybe you meant
>>>
>>> Fixes: c7f99cd8fb6b ("dt-bindings: nvmem: Convert xlnx,zynqmp-nvmem.txt to 
>>> yaml")
>>
>> thanks for reporting. You are right and I have no idea where a0cfd5e99782 is 
>> coming from because I even don't have this sha1 in my tree.
>>
>> Anyway that's my patch and issue on my side and I am sorry for it.
>>
>> Srinivas: What do you want me to do? Send updated one or are you able to 
>> update the patch itself? Please let me know what you want me to do.
> 
> Please send me a new version with fix.

here it is.

https://lore.kernel.org/all/1184b2799ecdeef04128f4bab3db7460fd8edb10.1723114978.git.michal.simek@amd.com/

Thanks,
Michal

