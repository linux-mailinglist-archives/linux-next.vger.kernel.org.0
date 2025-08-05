Return-Path: <linux-next+bounces-7859-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F7FB1B5F7
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 16:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C6003A1A52
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 14:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D55215198;
	Tue,  5 Aug 2025 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qoXfRY0J"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE8C208AD;
	Tue,  5 Aug 2025 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754403084; cv=fail; b=rth2HMWmUgry61nh3gg2wn0k7XkEER3uVbzPTnTqYCkaG/vYfdcXmDTvBF42DovhiCCpKYH/NNrKE/zlWCyXOBOvAZy1AnsL5OhlmWH4cl6z81dNlh3ZDnTARV9EDfH3HxNj0Ukd+F4epK5csYVeuH0ohr2EPX65aS7Vo1Hqgr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754403084; c=relaxed/simple;
	bh=s0pFcN3n2yWgeMCNySXL1v0nnEsAZpM9dYkZIUlLSHI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GpRoTTnzEcACmpXfiQ3yq3MZxKm/Rp+Y5SZw1VQ1w/GYkrzdxO8uMBFhda3gJeYYmKKGTUEXOInTJtjCTVVh2mo9nxVZYNopJm5Kksi8/CO/oru4NCYdGVrGPlNACijVzqI5olciqBQu0IQl1WrM5tM6YiglqRUY96XqG2B3xvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qoXfRY0J; arc=fail smtp.client-ip=40.107.220.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUoVmMbac4YSRj0/q0pi72GVvoeRrUCcQg60IvRMUMWRl2g4P36GC/iwLS0A/G81Ydt7BTH49ksun3aGdb80N1pjC4Hk3tAIKJt967lp0nIZzz7EWjW5+49IPjZ1t+Q4HtmkPXvfsPkfRG5+h9JBa7cncT8PSUpU0sGDqEd8Va1fhyukAqgnyeVqJZ21n8k8dlf5huQdsO4wJa4Z7l6OW1/ODzKytDHKwOz7ijOed3oO0c7OVxHlaUS0WPX85M3puYiLOTJ50tZQMSI15+J6dM6gm+kCrlKqOKeZN9ayoDWvcS90dhPCsGoWCKrZrJkOPRt5SFAnLcJxQAG3ZZ9BQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edACmfrIVUGpO7zWOCMH0UjBt69is2jWpPUilNv7SNg=;
 b=kGU3T405j8q55+4Ll+5wAGI2eVNbkk+MyPFRY/ysauKuK77v5f97F+6Q+Hiqo9lX+4H/230HkVYIJ49/Ed5TQ7E2bk5eb26pthmEOYD2XA7LOyajf9uQgBrbYKooRPunAmoinJqZ8JStZQw0Fen/38FaqwQVJSGo+WK2nRG6Piwe9DCbqUFJylwOqabIFMfjc2UBY6vEsbYcV03gIouLAplg2RQzudxowRMHuMUfHeLPNz3NONtZbMGHeJI9pblB9KGUOKgRGR0aF0ok4h5i2/TGY20HW++IzYQQbLPtPs1IkLqq3jGCRUYau3naBHh1JSpZLsZKvLWPxfK6wyW8zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edACmfrIVUGpO7zWOCMH0UjBt69is2jWpPUilNv7SNg=;
 b=qoXfRY0J4/1K3oX98AukXx+oGifM/t1kOxkdLKNA01DqXbPJitJppYlQGuFXvaj+9E0jtD0u9m2Poew04lO0Ql/2om1FIWzSm3bdMpH4zJEDPH8GTMVSpstFdAxUEkiiB+tIyIrXV/2gTaAiMP9rDH/zufEfjKmJs3I3lW67vGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by SA3PR12MB8803.namprd12.prod.outlook.com (2603:10b6:806:317::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 14:11:20 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 14:11:19 +0000
Message-ID: <fab7d991-14c6-4b42-aacb-ffda5e4dd585@amd.com>
Date: Tue, 5 Aug 2025 10:11:16 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Roman Li <roman.li@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250805131117.2cefb8b6@canb.auug.org.au>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20250805131117.2cefb8b6@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0008.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::18) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|SA3PR12MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed3f94b-cc2f-4a40-7c9e-08ddd429f2ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUlTVmxrQVZ2OXg3YUNHTUhYcTVIdzk2bjZidUdOeDNFaVVVZjJyZlRSaVRX?=
 =?utf-8?B?cGtWUVBQeE1kKzJRNnlhUVJXT3l6dmxMU0dScXBmNnBlMFR1Zld4NW1FblFv?=
 =?utf-8?B?WStnRTh6b2tibDNScHIvYysxSS9DUCttWHlRR3h6V0RGS0tudUM5a2ZvckQ4?=
 =?utf-8?B?OVZlSjlTaVhUdzJUUnVLaTVkQXhjWHlrdmxNT3hZWVZrU1krNUduYkFvWWpH?=
 =?utf-8?B?T09ta0FXY3dlTmVDQVJWejlYUWM4THZzTjZMQWtWNFNJUDZXOUpEcWplaWli?=
 =?utf-8?B?SXJZODZyT0hzeE92a0x1U0U1OHhvbmZDbmFBY2N0THc3TU4veFdDaUNBNy9h?=
 =?utf-8?B?bG1JQkh0aFdKNkZaTnJ3ay9QYndqdktwNjJzUmZDTTlsYXU4M0FrRVF1OVRq?=
 =?utf-8?B?WG9hQ1ZHVXNCM0prTzJHQ3Y5UHZDSDJ1TFFGKy9obmVwMldpQ2pxK092alVS?=
 =?utf-8?B?UU9zOVhOUjZ3OU41OWZsbk1pTFpzSVBNN0FUMTNYSXFVa2hFZFhDUEh1K0xq?=
 =?utf-8?B?cGg0c3JhR0V3UzNyR1VaVTI5Z3BocmxzZlRISW9qdEJvalQwaXJzekxkYzZz?=
 =?utf-8?B?NGowUCtDSTdUVFh1a0RqbFc0TmtadmZDVFVmWHl6OUUyM25pSlNMcHJMVW14?=
 =?utf-8?B?OG9UWEFzUkZqN3RENDlEbkFzWFU0RWtPTjJ4MjYyNzZDVUdxZ1BFQloxZnRU?=
 =?utf-8?B?elRzMmFGcHZxY3FnRUJ2U2NTRHJNQ0E1SDNXUlErdVBCZ0gxYXAwVEVHR0Zs?=
 =?utf-8?B?U2NWN3c0ZGlFVGZkc0lUdXFCN3hQSWdVUGN6TjBkZXY5Y2ZGanBvN1Y2Q1Fv?=
 =?utf-8?B?bmNwK2hJRFhKdEZzT0RhUEhsU2M3OUdnb3hnMC9mTklmcnlucnFiMURhMzB4?=
 =?utf-8?B?VGdhSzlEaVpFZmNvZjVEM2ZZQzlndVM2bm5KckdHNnVMZEhjbXdqZXk1ZjFQ?=
 =?utf-8?B?S0cwWjNpUkkwWm5udXl6bEdyUGFOR2xpQ0hwMjNXamN0dzRIN1d6NVBRM1FN?=
 =?utf-8?B?T3NJNVU4YWtyYU53SmtkY2J3aTNEMWtnQ1JsMWlidWlxV0pJb1ZkN2JPcjJi?=
 =?utf-8?B?aXdDZFErSHUxMkN3WVhIVUpIYkcvRWdVckdYdzdONnljUXZRSVZ4Q2F5RG9n?=
 =?utf-8?B?bTlrYXhnemZVTHhSRERCUStyL1k2SS92QWhiQmlXVEhoV3hpNkRmTjJPb3NZ?=
 =?utf-8?B?ZDNyYVhoaXE0b29Hd3QycW1UL2VUdWUyS21IcWlEdnNOMjRkMEdyRlFKYWtF?=
 =?utf-8?B?a2RBWUM5VWdwVGNleEg1NjZvT011c281QzRDdFNkaFRKSFVBMG9SSVZPWGZD?=
 =?utf-8?B?OVBLa01odGdZRWE3a3NIT1FjNmR5UHRqQnRpc2tyZFAzc1k4N0loa2NSVlA2?=
 =?utf-8?B?OUo2bXp3b0crS29ORXVQNExFZUZuRWJSMURTaVFIck1tL3p2QXliRkMramdz?=
 =?utf-8?B?WktwYlRJOXM5K1lNeHlyWFpwV2JqejUwN1R0aFZvVWY3MVlyWXdPSTVsZ0p5?=
 =?utf-8?B?Z2x6MXF4NXN6K2c4R1ZGQ2ZXUGNPRkhsWkZQUWtISDIxQUZzb3NYMjNxZWMx?=
 =?utf-8?B?UTFJbVQzaVJSdVdlT0oyTHRFRjRyZk1HV0FMNmFIWm9sdld0Vk1HUS9IVFp0?=
 =?utf-8?B?clBxVy9TMnJHVDhZZkFpcloyWTRtTDRkbzFEeEg1OTI4b0NSSXlqU0R1WGQz?=
 =?utf-8?B?eGkxTy9NSDFQaVQ4c1ZKQnVraU9ZTWNVQVg3QVVkeDM2NWlkNnhZYUVsWkoy?=
 =?utf-8?B?SU5pSmdQeklCTW5KS0hRWXA5M2JhMk5na0FBeUlmazRTWlJYSEF1VmpGQ1Rq?=
 =?utf-8?B?Y28zWHY5MEFQY0NZUFFXcEg3bG0xT3BKbjRQaGYra1ZxNVh5RWV1YkNIM3pw?=
 =?utf-8?B?c2t4UlhuWmZXS3dYdHBzVDN4MHJCdW9kcjJTQ0wreW1TbStmZ2R5M0VZa0t0?=
 =?utf-8?Q?NNeSPDIEibw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5284.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWM3Vmx4WEk0NFF6L3orZ2lqOWZrYVFuR2pNRzBMZWxsRHJVQlNmMXFZK2Yw?=
 =?utf-8?B?ZUNBN0xJZG5meis3cVlEMmJ5dkpDeVRUcUxaUUZSQklKa3l5M1lXcFhSQyta?=
 =?utf-8?B?NE1WcUpGRmlQcXhNYnBXQ0t3MmRoNCtRSHkxeHRpR3BBbUtoREhCTTd3QmYz?=
 =?utf-8?B?YTdyWlJkanpzZm0vbGFERElSa3BOTzJJaVZxT1IyRVdXZzNiRDNPWTRyM1hH?=
 =?utf-8?B?djJBK2w5QXZRV0E1ZzFodEhtUFN3ZlEzT3A5NlhYM0pQemQ5OE5tdTFmVXdX?=
 =?utf-8?B?cHYrR0JXcWpPZmV2aHRjRm1iS210bk5naDFSR1RTQ09GWlpITHlQbWJadmZO?=
 =?utf-8?B?bCswRUk2L2xMRkdpQVJUaysrVUZHczZTbmhwVklkRUNVck5ZYzJYN2FQWXVI?=
 =?utf-8?B?cnBsWXd1dCs2Rkc3bTVIQlpYUmFRZGdZTkNNVUxnNFVvQ09HY01Rd0ZidEMw?=
 =?utf-8?B?VVh5c3lOY3BTcnpQVVlpYzZpZ3c2SkJBVzJPaXVteDR6QUZFeW9laTh3RGJG?=
 =?utf-8?B?RkhHN2tmQlo0NXZXYnZBaTJwNTFsQzNYVElVSnJMYWlPamVjODdhZWN2NGda?=
 =?utf-8?B?NDlXVnNvZVl5eWhHZStEalZHWkx2K2ROQXBrbHQrT0FXbURQeGcvcVFSY0p4?=
 =?utf-8?B?cWlrL1JYMk1UYjJVdkR4NWhrajI1RHE0NGttTnMwS2hIb25ZQWt6ODlLN0pO?=
 =?utf-8?B?VGZ4bEZUY1ArVy8vUVNOcVpsT3JaMTVxYUZUV3VzSXJ0YmV0bVRvUG9oUjVN?=
 =?utf-8?B?QkExK0hsS0xTYzN4d25JOTJOSXlOZm91bjlrR1BFT1R5LzJYQzhtYjUwT2hH?=
 =?utf-8?B?U0JabU81L3ppQWtaelZvQWg2OFJYYWZ5SVk1dDVoOGJDcHlDOWpsNXJ4ZVhj?=
 =?utf-8?B?MnZXNTVpU0hTeFFMclBZM2JuTTFEbmxHSldBOVVwdCtJRVkxa2FLaFlRaCt3?=
 =?utf-8?B?bS9sRGxrM3JzaXVVZzBnaTByMlZBaGw1UjlIVWc2TG1xbXc5WUZwemVNQTI0?=
 =?utf-8?B?d1Z6bE5LS0M3YWlIUmFiZk92bDU4MHJKYnMwSnZwdStvM3lITVNpWHdhUTFs?=
 =?utf-8?B?M3JoUGw4SGc0b3JiRXJoK2QwS3l1Q2dtcjRiZ0Z4NFRyS2I1RmlSRnlmVzVw?=
 =?utf-8?B?TlhMQ1k1ejJaazFleGJ5SVJzYmJEMHhCRXo4TVVoNWFma2JWWmUwaWk3bUpy?=
 =?utf-8?B?a0JsU0FNL0paMjFHNmtNYkl3YlczS2FqWG1kWGN5WGs4cjlJald4THRDVC9F?=
 =?utf-8?B?MlF3UTRNWDRTTEh1bnRjQXlXdkFSWlNxdi9vSTYvM1JZb2p0Q0FOVFJaUW5t?=
 =?utf-8?B?elV2eWhoUm5qQUZoandQQVYwU0kydXlHZzd1c1pYTnlzdUxaWSt2YmlXb0lv?=
 =?utf-8?B?bkNNUHl0bVpxRVZaUWI3ZkNoenMzc2lPZDlJT0oydll5RVlZZWcvemUrN0FJ?=
 =?utf-8?B?ZExCb2NMVjJueGpmVWJsMVVuT3hUU1ZrdHZhSE8rQnVZUVBLbngrWmlJdnJZ?=
 =?utf-8?B?SW1hTUg5U0RrUHZUaVVMWGZkSEl3SWg1YjlGUlRPZlVpZjc5L29YbnhkckRT?=
 =?utf-8?B?K2Z3czlOTzE3cXVSakwwRWQwNCtCdDV1dDVDZzVteXV1bHhaaEhyU0x0dkRm?=
 =?utf-8?B?WkYvTG5zekxPNzI2NnUyd2lrZzg0d3o1NEVrZjhXTWdaL2hHakdWQUFlKzhn?=
 =?utf-8?B?NXlFYVpMem95YW04eXVBQ1ByZ3g1OHZMVnZobnJQZkNkWFpDMjBDMkM4WjhV?=
 =?utf-8?B?bllhWlgwVFZGSGQyZWRoaXB6OGh5VHNiUzhvNTVxOHYxV1Q0STR1TkJ2Nnpl?=
 =?utf-8?B?WERGc29iM1ExdEs1YXUwdk1iNjNRaGs5dDd5Q3A5WFlJYTBXQWY5SFVaa1Uz?=
 =?utf-8?B?QzJMQUEvb2szekRCcEhVK3VXa3BSYTdvOTlQa3IrV1BmcnNrRDJ2d2hlYXU0?=
 =?utf-8?B?MkJuZVhUWENHR2l3N21iK0RWR0pFZWt2bG9kbEwrU1JMNWNmbXFtQThzUFdl?=
 =?utf-8?B?Si9oUUZ6ajNGaXBqZTYrdlNYVW9wbnNQUDMxSDNzdnJlV041d0NvRExaRlc1?=
 =?utf-8?B?VFZwRnFJY0o2U1EreFBDR1h1blR5L2xwclBwNWRqRFpkOUx5emlXL3F2dFhK?=
 =?utf-8?Q?2acj9iM8EMaA8w/C+I4OcdJnf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed3f94b-cc2f-4a40-7c9e-08ddd429f2ca
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 14:11:19.3170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQd+RL6tkG5oUzfcPSg2vVkaFEDjqTdZyXho+5DLr/87r0rnxPfEsA1JHqaeZEmlpKJym3ZpfjSMqdQmd7oB2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8803



On 8/4/25 11:11 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:168: warning: expecting prototype for struct dm_vupdate_work. Prototype was for struct vupdate_offload_work instead
> 
> Introduced by commit
> 
>    c210b757b400 ("drm/amd/display: fix dmub access race condition")
> 

Fix sent to amd-gfx

--

Thanks & Regards,
Aurabindo Pillai

