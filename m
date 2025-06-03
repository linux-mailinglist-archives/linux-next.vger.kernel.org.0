Return-Path: <linux-next+bounces-7017-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B32EAACBF4B
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 06:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73F031605FA
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 04:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB66918B464;
	Tue,  3 Jun 2025 04:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4jzqNITd"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2047.outbound.protection.outlook.com [40.107.102.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE49B611E;
	Tue,  3 Jun 2025 04:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748926033; cv=fail; b=YLE1NCT5KjZIJECV3ngImq+2/0exmeG3vN2TNWElzvnCee+tn9qYdTlFdURTjM5hLqMfrpsS/mYoq1a/9W3QQccIML9OyjCx5oK1XOH96idYhdJhpvgNVgrxKW0Hw6PYd+JdCN4z0t6L5EK929kUJmI9fWVvIOpS+mJpkHvvwuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748926033; c=relaxed/simple;
	bh=rfc/YByWG9VwfOButk/w+zBblUfDWsURWrNXsp7+Zuc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FN6Ytjg6SZXN94O09a+PVzAf0+QjYKCNem2+jrM1Qa2yDx4OyRYLerXw6f+ui03+Kou8xkxVssH1teu1SBpq+Q/t9fkoPOx04hu6C8yB0lmvxuK3wGtN+4JMarvF8WGqOcciE3200nD4UP5lBAS2WLUWYOdFLQr7pUihZLohCUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4jzqNITd; arc=fail smtp.client-ip=40.107.102.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVP8q2TREzTGnvasGHLlkKGBUCrkoPBpch3YQq/2YxwOo+MXN6IVpmCL+ipZYuDJWAJ67J4SPl/ZH4pqLrxg1luxvuRx24TvS3336E+gt+aqaJkZS+wfIIDWEa3r9mF0mNjYZOtn+G3TmEJ/gvZBuqLJYdEVQQS4TFd39BcZ5fgYNiB35capadO8/vnCMZytjcol4g9ffLIq7hgxn6LLNEwVTrENePw7HHL98Kr7bSS+PaVIvwpkwAXeCS2u5roae9AXdKNWl+aDfqUjypiFaAfYm/i+ukkISl34+sWmdxO9F/glW7A+l0YzTdGoDUnnJeNQNvOEhTJtS6s3VGtplA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eOTvgvit69eGYvbnWYpbjcDaKr7Qs6McD7UoLE00O8=;
 b=lKLLMSMNyGpVtebTkdElGjwnfTqLPw/OfPfydfRwtjk8EG1OnNxX9JOBy71VJqWex69BcjwHsgxX0+UnQjnl22EJNdyCqlLR0LVpQvd1uaWDbRRBepIxvwQejZavAWJNsikMA/qXKj5UsrUoKmWIifIt2ZeEh9ulCSHXCf0qQKWhORTygTRplTO0ImY38a3gSl3N25vxLc7QUO+9uBEjJdIXayYTyGU2JTfWZlonajIv6AON/aoddSGxJFrS6FsfBhx4nLbyN2QYwyfTmRoBuG5V3rvReAnd7RN+bzOsZr7hxnWaaOPnU1k+Z8urP8hBg7Vwyu5hJL4aq9cAvz6VPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eOTvgvit69eGYvbnWYpbjcDaKr7Qs6McD7UoLE00O8=;
 b=4jzqNITdMfGzYW5lODSpLyRkpxHdq10o3uHIrCDf8vSPBQbB9v17k2h9TGRVr0fqs0lIZIQ4k5069xW5Xut7EVDm2jJ5n8i+U+fOTrGruakg/oHJ8xMCmFpEoyEIHpw6SZ497W6Ik9Lbia1RPHSZ8JqUda3m5YSEpolYlV0XpKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6226.namprd12.prod.outlook.com (2603:10b6:930:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 04:47:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8769.035; Tue, 3 Jun 2025
 04:47:05 +0000
Message-ID: <91b4b206-e518-43ab-b6da-ce337f5a348c@amd.com>
Date: Mon, 2 Jun 2025 23:46:56 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86: Use i2c adapter name to fix build
 errors
To: "Nirujogi, Pratap" <pnirujog@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: rdunlap@infradead.org, Hans de Goede <hdegoede@redhat.com>,
 sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250530200234.1539571-1-pratap.nirujogi@amd.com>
 <20250530200234.1539571-4-pratap.nirujogi@amd.com>
 <ea615c2e-d306-06b2-10b0-2423ab59a8e9@linux.intel.com>
 <46a1ad3e-3419-4f03-b5ce-a36d2480037c@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <46a1ad3e-3419-4f03-b5ce-a36d2480037c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SCYPR80CA0028.lamprd80.prod.outlook.com
 (2603:10d6:300:6::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: f1fdfe59-56f3-4d80-c218-08dda259b052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2RiRHdQcHlXK2hzL3cvQkRtR1hLMEorQVFtV1BrUHU2UlpuUWp3ejVsdXA5?=
 =?utf-8?B?bER0MEQ4MDNFN0drYzg4SUFkYUtUMEZOdDB2ZkR2TU9Rc01PZ1d2Ylp2eVA5?=
 =?utf-8?B?dXB5azZ4MC9oM2ppUVk3SXZObXIvb3l3VW5PUGJmMzU1cE85MGFRdGNMSVRP?=
 =?utf-8?B?cUw4TXBOQnd4VU5vVEhrbERUU0krYSsyUUZwOUJhakg2cDRxdEo3NUtQbnVS?=
 =?utf-8?B?ZGpsLzUxVTBhZG1NZnNycU1vbW1GMTdKY3plN2xPVllWYWt4TXFuWHAzd2JD?=
 =?utf-8?B?K1J2OWQ2KzJsblEvK1ZEc2FHdDllSDByZUE2RUF2bHZIUFdPS29pempjR0wr?=
 =?utf-8?B?QXd6V3FIMjhBeUFQMHoyajl5ZFBhQ0kzQkM5Sm0yMVZ2V0JqektBbUdOSUh6?=
 =?utf-8?B?VXExdWNvcWxxNVlNQm9MekVkbTV0bDVTY0RwSjVWODFNYzVYQm90d2Z3Qkl6?=
 =?utf-8?B?RHlFTGxyeUpUdXdvYXcxc0grdWVQYlptWEJmN25uSUdMSm5jZWRNVjFnNDU0?=
 =?utf-8?B?TE1rNXZGSWxsK01OLzl6eHRJbjFGTFFsZXJ0bGd2SEdjVGFFREVIUzBjYnF6?=
 =?utf-8?B?WS9zb1hXRndzZkZ4YVBBRE5tTFU0YnlUbFhPcVBhS0ZOWjhqRnRBMUtGbnhl?=
 =?utf-8?B?WjNEZ1p3NnltQnNROHhEM3k1VkUyZjcyc1owcEwrTThzNWNBcnQ3MkNSeWRH?=
 =?utf-8?B?R2hqU3N1bUpuRTBzOTd3UnpMYWFYa3VHUDhwOFJ4TWp6VUJCU09OdjNCdjlO?=
 =?utf-8?B?WEVYM1FUY2EwQWRyd0FNT20wRkpGbHNSc0w5NnNyaEg0TmdCV3YyRWJuaVh0?=
 =?utf-8?B?WmJQdUV5dVh1MDAzWENOYnRsM3lTdmlBMEIzWjE1UGxwMU5ndFAyOSt3RUxt?=
 =?utf-8?B?dldMTm5uUVVlL0dMRitRTjZCS3p3TEloTDBFOVhTSktVWndha2pDSGZyS3Q3?=
 =?utf-8?B?L0dwenBYWlEyUlZHMGVzSjFhM2tjc29WWEtSV1NDN29zMkxPWHpWa0ZPNWVm?=
 =?utf-8?B?WWVGdUlmZzNGemFxeHMzdDhlQ3NQd2NhaTdqay9UMzVkR0dBQjJIampRKys3?=
 =?utf-8?B?SUF6dzdEbWd6TDZSNWFndTBBQzJ3NFRXakJmYThJMnZWMnB3RXF5OTR4KzVX?=
 =?utf-8?B?Lzc2d1I5bmhya3VCTHMvUGJYOGlBSld1NE5pUHdnSUFWWFJZTXVmcDBua0Zo?=
 =?utf-8?B?a3VJOUNIcG80ZmVxcjhrNHh6Y1ZMTlQ4RFJlNXpEYzRyRHBNSzlqNkNBNVNN?=
 =?utf-8?B?V0JESUp2eW4vZWY1L3hWWWJRaFF4ajhxNVdDMmdLK0tnOHp5ZnhTNDVIM0hN?=
 =?utf-8?B?NXZCdk40WGxPVEhVcTVUN25KUmc3U1IydDV4RnlKck5oK3J3QjNic0M3TVlm?=
 =?utf-8?B?dHpxdVVSNzZvaVdzclYzVUNHa1F1bWFndVdNUFhoYmNiTHVtcm4zci9NVkVl?=
 =?utf-8?B?Z3JDSXhvejU1TEw4TEJIdytlMkhCWXgydy9MdEpyblk0MzkvZVNNb3dTbEhF?=
 =?utf-8?B?dVZGL3NpK1hDMFBHMDhWWm51Z05hczFWb1NpSnhEVzMvVExYd2xSZHBNNExj?=
 =?utf-8?B?eHNUUjg3VjFRWkF4QXdYK084V05pRXNNYkVWZ0cwK2FiL25HQU9tMHllcDE2?=
 =?utf-8?B?ZDliQzVYcXBScndTZUJQbTlTTE5FSXEzNjBxWTZmTUhIbVR6VlFEU3R4YTVR?=
 =?utf-8?B?aW1Sdm93ZmpKRVVEMmVFTzVvYmltbTRtTWpqcTZSazJQMm95MTZZZjBDOTh5?=
 =?utf-8?B?bHVhZW53VUkxbUxzbWZMZ2xGS1pkTGJ1L2Z2QjFqY1pFMUR3dWdBVDJxWnQ0?=
 =?utf-8?B?SUVXUlR0TnJhZ2JKZ2NqV3grekMremVYSlVKZkpuUlFYanhUa2g1ZXVCMmhL?=
 =?utf-8?B?eTN5WERXeW5kRDM4K01POUVaQ1NIR3BqVUFNZXgrU1V1Wk42d1JTZUpKcjhN?=
 =?utf-8?Q?ky0lvqWEQYs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk54RmRSMy8zbkpvS1h4QU9XNVRBNzNUekhDb0dpaXY0alZXZ0dsTDZQWjZS?=
 =?utf-8?B?QXc0VFZlMmhHa0JxdmNLaVhRKzJ4ZG1JWFBPbTFFOUw3NUU1OW9Fajd5Nk92?=
 =?utf-8?B?bkZIVnFFTVpFaTUyVy9CUjZsOVpMRzJCQkVpL0dKWXZQZzJNdkhheU1mcC9V?=
 =?utf-8?B?T05kSlJac3hsSnAxZ2cxOERabEJnWmxjQUlCZjhwaW5wQVdXTU5TTWlUWkkz?=
 =?utf-8?B?M1BUM012NWFoRUVZc1lYZmRNMDU1NXJ1YnRIbHo2emZsQnZtL0t3T3ZGYlRC?=
 =?utf-8?B?bTZzd2pQTG5RaVpmUU1ORnNrUGZHaGQzWGNPMmVKU2MySVhyZGQ0VVBiOW0r?=
 =?utf-8?B?WHJUa3YrRlo2WjViVTJya0NCOVFFdWJ3VmhaVyttUnRKeUloekpyMTFnWWRu?=
 =?utf-8?B?M1BtQnRZZ0NxVzA1YjR0YVJXVnY0UlhBczNVczRzR0JXVmVqN3RKN1hCT09O?=
 =?utf-8?B?YlBQc01yTTIrcU1VdXAybzI3VFZBZ2NyWWVUckVsT0tabnlnUDNMSFRGbGZS?=
 =?utf-8?B?ZDFXL2ozdFZDeE03dUhTWTNFRERRMnIxN29pL3NtZEZJdjdKc2lNV0NxZ1VO?=
 =?utf-8?B?NVA1NU9lQ0dZb2ZCYnpzLy9veUQ3c0RxRGZ1RlNJOWFDMjVYeFRTWnEwYXpv?=
 =?utf-8?B?ekpxTjhycFc1NXVqK0ptdFdZVkN0MjZaZWZWT0NwQ1VQWVF3azcvck0rSmlU?=
 =?utf-8?B?R1ZHQjFqd2Vyc0dET3FBKzlrMnNiQWhSNy9DeHdRZk9xbm9tSkF6eTBudkg5?=
 =?utf-8?B?UFhDblpNMGRYd2F0d0VJb01DL3VUaFBkVlFDT0N0NzNkQzNkUXFIck5rM3hG?=
 =?utf-8?B?MUZJTTZEeEZuZUpRci9UOU4vbWg0bGt3NVdKVWNoQmN1WXRLMGFhRGFEaVBo?=
 =?utf-8?B?UWltbnJjZWd5SHNMWXFCQkN4N3dUeG5ING0vNXpEb3hZeGNPUGdWQWdQZXpO?=
 =?utf-8?B?S0RKRGJ0NnUwZHYwaFp3bG9qNTFRK3hhWU1MeWI2d0ozNkMydGF3VkRGbGI2?=
 =?utf-8?B?WW0renpuNFJtODJIUzdCeGJBQzB6aStSK3BkdFQ2anFSUWI1eW05eTdhTjZY?=
 =?utf-8?B?SFFGKytZRlNSeStscVEyRUZwRUluUDVibDFUcUoyWXlSLzNCc0x2b1A5TEdR?=
 =?utf-8?B?YzVRL3FZbXdyNGh0SEdTTEkyMWRGdXJPUGY2MDhQYStKcWQ2QzNFNDVsV0Fj?=
 =?utf-8?B?L1FDamlKb1RjVGwxRGtxMUZSd0ZLMGxPM3BBSGl3cXJjdFpKM0dHZW1OS0th?=
 =?utf-8?B?TzNqRjJxTW1iUk94dFkrRnVlazFrdkRYRU95UkdzUklSVUU5RTYyN3ZleUcv?=
 =?utf-8?B?ekloRWtYNWRMWTFpT2hVdWZVaTlCVWQrT3hUaVJYRC9qS2U0c284WERRRndJ?=
 =?utf-8?B?K1pRZ1h0Vk5LMDNkRG5HVDdzdUdSb1loVHpmeHRjL2VCN3BUL0hldHlwelpH?=
 =?utf-8?B?cldncDJpM1NnSkZqR29BMmVENDVRKzkwOVhKZit2NzUrUENFSUh2YndpYStv?=
 =?utf-8?B?ZXhYSVFYODFUWTFVb0w0MmxVK0NSWTR4NzNIcnhPOGRyQ0cvZkpXeWxZckRr?=
 =?utf-8?B?ZXREUkhjU0wydkFmNW92bmxmV0tsei95SDN0RUZHb2NpQTUzOSs2NjVGbXVs?=
 =?utf-8?B?ZERONTlpcG4wMkovTERoczU5SmdPUWswdi9CTG5YS05ia0RXSEx0SzFBNjFL?=
 =?utf-8?B?cGF1cHhBWmZpbWllTWxSR3FETHB5ckRlc2FLSHVqdXJrR0ZxOFdpNVFjVnRD?=
 =?utf-8?B?dWJSWEdzcHN2K0g2ckpHTFl5NkxBVlQwMjRtYmJ4Y083ZGJYMUVQZGhjOWxZ?=
 =?utf-8?B?WUMxTjhybnBWWEE1VXAyWWIzSmUwQmJxTzdQWFVjdjdXNnNLc2hENWdWRHFK?=
 =?utf-8?B?ajRpcmpLTXIvWTNyNGVhb2RkQ1BsU0hYdko4NHVEVlNGek9wS3l1TlhIcEVn?=
 =?utf-8?B?WHNIbXRkUVgrcC9yek9YUHlHMldIMTdsOHBHK2tGeEUrQUpTY0xsTWM1aHRZ?=
 =?utf-8?B?b1BOVkpUYUMxbHNoNUhyb1QyWkplUC9wRDYzSmFudURjMnFBUEg4Rm9vNE1K?=
 =?utf-8?B?aW5LbUhhZEV3RW4yZFQvZ2llOFpjZ1lzMzZWcGNzVVIwQjB0U1ZGZ1ZvdGxt?=
 =?utf-8?Q?CbuFbGoBzxoHvYTxRuUtBJM+d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fdfe59-56f3-4d80-c218-08dda259b052
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 04:47:05.2999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRssvW59ZNQpiL91OAYxNG+3caqQIIqUyvMR75cQS7daTgz6dY/0u9NCQk1DcIQzCxiGckVHf1yeScIsVsmDTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6226

On 6/2/2025 10:35 PM, Nirujogi, Pratap wrote:
> Hi Ilpo,
> 
> On 5/31/2025 1:11 AM, Ilpo Järvinen wrote:
>> Caution: This message originated from an External Source. Use proper 
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> On Fri, 30 May 2025, Pratap Nirujogi wrote:
>>
>>> Use 'adapater->name' inplace of 'adapter->owner->name' to fix build 
>>> issues
>>> when CONFIG_MODULES is not defined.
>>>
>>> Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for 
>>> OV05C10")
>>
>> This is the which should have this Fixes tag, the other commits should 
>> not
>> have it as they're not really the fix (but this change just depends on
>> them, but since stable is not in picture yet for this driver we don't
>> need to indicate even those deps).
>>
> Thank you, I will take care of keeping the Fixes tag only in the x86/ 
> platform driver patch and will remove in the other two i2c driver patches.
> 
> Sorry I think I'm not completely clear on this statement "we don't need 
> to indicate even those deps" - Am I good if I submit the same patch 
> series removing the Fixes tag from the two i2c driver patches? Or Is it 
> about submitting the i2c patches independently from x86/platform, 
> instead of keeping all the 3 patches in a single series. Can you please 
> help to clarify?

Keep the patches in the series, but the only one that needs a Fixes tag 
is this one.

> 
>>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>>> Link: https://lore.kernel.org/all/04577a46-9add-420c- 
>>> b181-29bad582026d@infradead.org
>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>> ---
>>>   drivers/platform/x86/amd/amd_isp4.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/ 
>>> x86/amd/amd_isp4.c
>>> index 0cc01441bcbb..80b57b58621a 100644
>>> --- a/drivers/platform/x86/amd/amd_isp4.c
>>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>>> @@ -151,7 +151,7 @@ MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>>>
>>>   static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>>>   {
>>> -     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>>> +     return !strcmp(adap->name, "AMDISP DesignWare I2C adapter");
>>
>> Since both are in-kernel code, share that name through a define in some
>> header.
>>
> sure, I will find the header file that can be used to add the adap->name 
> definition.
> 
> Thanks,
> Pratap
> 
>> -- 
>>   i.
>>
> 
> 


