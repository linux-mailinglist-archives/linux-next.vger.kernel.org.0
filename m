Return-Path: <linux-next+bounces-7891-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EC2B20895
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 14:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23D0C426039
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 12:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82AB51E8320;
	Mon, 11 Aug 2025 12:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="x5EFE2M3"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA24F9C1
	for <linux-next@vger.kernel.org>; Mon, 11 Aug 2025 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754914683; cv=fail; b=PPuOJM/BuvMgUM2qAEfgru8Z+r8QkUWPW5ykmqAEOQd2fxThEo6JOXLxLV1/ycJyVtwkAq/DZPla/2JBdC/xa1kvxIcojDzQVy3kGoVef8Bd8h83HbO3vyAqYl1d1680UUhbPJ/dapeFFk0F7Ie+FFmbUJaAt3jFG/nGzH3sBLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754914683; c=relaxed/simple;
	bh=xTORGCKxZySyAvJMnMo1BkP6ECOW1KfyNcvJ1BlJHzo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q1voZ3i5eVwxa+Abp03eQ80eWPlK/akHCGyGz3QkNUlXLrwbbWA8rwwQmlZNtLh3dqNq2yPO/Mdn5Ft+vH9KWGOqEYYAyx+efG+KFeIiMaY5SGPBAwpILQmdxQk+caI7y2ru1+NMkWYG4Wh22b3wWAv7asxqx3jlfN4xUcaQmW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=x5EFE2M3; arc=fail smtp.client-ip=40.107.236.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAQnVMOSjGoaGyAVQz0hmm50dQOh54X0l1TCjjx1RSLcAabQdTKC72LRKdY4wDxgnekIs9rs7rGq4cPnQgRxZofH3Wn3tHe8Dxab5xLoypigZ0gLm6UyxIQc2jToN7Hjr9u7xLNKVvMsiaHWBraOvE/087XhI5ZE2Beaj18LbBh0xUh/c6KGU4YfJ3dj/1HasdeJ8W0239VJiBVTssM8YsF12c8EKRBVWNSKK+uovfvkjpPTQLtGbkFZf7u/FGTqw2SZgRF8Kgw+c+6hGEqgSGuM/ACoCDB8qnZ9k0kNOxA0H6xJU5soRw5y9PJQQ4TB6/D9DDBAaSFd+/aNdl0jvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bMpXGs1ypbYhu13YUyZMOg2wHIitO/cVsVLo9p+qf4=;
 b=sFUErYCkJC2cLntuFajJc4UZ6R7j6+Zg2Mzbp0pvHFXUbhXSjzb2vGQXZLEjTTyxlGTb5oqnvtb/elT9m/65O6a5R1r+K6vC1kBnvo5NSuSiuqWOZ4Y8WPTaw8LT3yVaV3I7L7EuA4U/ztFmwCmCM9IqfuQUNWWquJVLxpjsS6vx5uDr1G8nTk3Xid+2d/cNL2XkJNUUOv8bLqELP7c7kpKZdkPTmfr5+/XyRGlPAeYDAK1IzXr1eRG9tBYCPQu/VHB5JGiJHA/MDeRSCsieJJCYh6YGBnRRfmG/ei3Soicle9aj9S2A4VqC7GgFQUY1MwXJ0zWFWpc/QEAQhLJ7BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bMpXGs1ypbYhu13YUyZMOg2wHIitO/cVsVLo9p+qf4=;
 b=x5EFE2M3Gh4fHYV78QpYGekXks+1v5KlAQvvKbSAkm6MxK7fc63B3jn6hBCqr1/2ptu7SrF5mflA+LFd26TGVtwbzUf4Qt7X3JzrvwPyV4v7lPJrI6Jov4wkMtB68J/2S3s83pbyRSPlDKnqriJ28VdCUY5AHgMDtFaSmAOlT9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY1PR12MB9649.namprd12.prod.outlook.com (2603:10b6:930:106::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 12:17:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 12:17:58 +0000
Message-ID: <a6da8462-e0c4-4bba-b65d-25ba3f5cdacc@amd.com>
Date: Mon, 11 Aug 2025 14:17:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon/r600_cs: clean up of dead code in r600_cs
To: Brahmajit Das <listout@listout.xyz>
Cc: airlied@redhat.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, linux-next@vger.kernel.org
References: <9846b386-87c4-4f86-ae11-6361470cbce7@amd.com>
 <20250811092125.22630-1-listout@listout.xyz>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250811092125.22630-1-listout@listout.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY1PR12MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e06542-eb0f-497a-cfbc-08ddd8d11bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3pSZVBTVk10TDlja1o0RmNuNWtjMnZnbGdTOHBMTmdEY2JITjAyWjNtM2VF?=
 =?utf-8?B?ak5WMUpmZDh5U1Bmb1hOcTMzaHZRRnNoTU1nOHFvMS9aYVFMUzFmSFdFdndU?=
 =?utf-8?B?REJjMGxkMzRkRllnMGdocHUxbUZza1k4Y3ZLNjZUaHErNW5NcDN1SFkyaHpV?=
 =?utf-8?B?NjZiWDdrWWtRSmpPQWV2bVhNUk1jWTlMb1JDUE41RHZRVmpCSkFNcVU2TU1T?=
 =?utf-8?B?ci8wbHJ6MmpPcGNvdmhyZkhzY2o4bTh1NjY0QVR1VnhHb0hyN1RPWVg4OVdn?=
 =?utf-8?B?bWZ5b3I4OUgraS8yTDA5bWlYMjdncHQ5cVYxOGxpbWpmcUhTT0RUOE5OWks3?=
 =?utf-8?B?TEkzWlN0RndxSjErdmFNKzBOaE5BVnJWekZROWFvT25aU3VwakdDbTFUZXIr?=
 =?utf-8?B?UG8zNkJmVmJaV0JnRlgwU0NlM0hKdUoxN0dhUWgyV2M1QVl2R1VDMTM2NGl3?=
 =?utf-8?B?b2NJWGZOMEIycjdqN2pSV01VWGhWM09aQlh3QnFwWWZNUUlJMUcrcVYrQVNr?=
 =?utf-8?B?dURrK0FKT0pPalVpNVpDaDhJc3VHb3JFZWRYa01XU2dvYXB5U1FMcG1vZW5J?=
 =?utf-8?B?alRuSUc1cjhwV0hRZFhnczVFSkZLWWhVQkw4Nmd4RVFCYmk4RjZ5dEUvcG8w?=
 =?utf-8?B?ejZ6WUxYVHpiMVpjTENKUXVZTHE1SmJIcmNIUm9pay92YWpaRTZvM0s0eWxy?=
 =?utf-8?B?QWhZSEdsVEZhNG1LTjltV0pkeEorQVQrNnYzOTlUcjlEelRtUktkNzR0MjZK?=
 =?utf-8?B?bnlYMEc3cFV3dmV3ZHExTXVncHU2UVEzTnFQcmkvNm5aQ09qZUZBcEVWRjRk?=
 =?utf-8?B?SHBsUWZ5ODhFaG9UTFRVOHpvcjE0dTl1eDd5ZDFicEtRMGJjSy9YSWhTZjRq?=
 =?utf-8?B?NjZ4aWtGM2YxeGVpekRkcG92K0o1aHpnTGZUdmxxWW16WGNMTUtMS3o2dlNB?=
 =?utf-8?B?NzQ5cWZ6L0w0UEZSY2lWRUxhTlc4ZEZ3MHNHUUNOK09RTnpWaENibnIwanVK?=
 =?utf-8?B?M0ZsbzBDbGt5UUtmK056QmdyK2VTTGJnaHdTU1NvbFV1ZVc1Kytyc01NMURX?=
 =?utf-8?B?SE94bWozTFN5U1RvaWV2VmplU0VGRDdOMUp2cTc0cmNNY0tLL0pPeERLM2hy?=
 =?utf-8?B?dXdxSEw0dldQS2I3VXdvQU9HZm8vK0FrTngwZm9HSDZPUGhmS3UzQ3pBbjdq?=
 =?utf-8?B?OFBsMzVoU0hPZlVDQnhEQlBiZm9zS014SGNEdWdBNEpXK3hUYzEzTlVsNnpo?=
 =?utf-8?B?UlkxOTVqdFpRMzdnTnUwUk4vM0xNMFhrVTg3ODZjenRnNG0xS01idTdyN0RK?=
 =?utf-8?B?SjB0Y3p0SmsvOXFKcWwxS09OQ09oRlJCTGJDa2hsdWlkQTg4a01yNU5xc0FH?=
 =?utf-8?B?a0tPZWNGV1ZIc2xMc09zSkRURk5yZUREUGxIT2N6NGsvN0JJdkhERk5nT3dK?=
 =?utf-8?B?SXhLd2t2SC9LOG1xQTRBamEyWEFQcEpUMEZYTGFyT24yZUVGclp0dlBDT1Vn?=
 =?utf-8?B?RmlIc1JNUTUzSUlIdWZLY2pZMUUwQXVIRE15RkZ4RkwrWlFQRGhoTGZJQm1I?=
 =?utf-8?B?VnI0Tlg3c21yOVB2dTdQNk44anJGb0hXWXdIUENjeGsxVGNWaU45eWZnWFhU?=
 =?utf-8?B?WFFBQVY5TFNLbWVzd3k0VHZ0L2VZN3ZNTmwwL1RqdnVjMmk2YWZRM0kwYjFl?=
 =?utf-8?B?THZYU1pjMGpObkR3bk1UbDZCQnZaRUQrZG5EVEgxbU9LQnlsbEh2bk5XbmZl?=
 =?utf-8?B?THhTQm9waHBOVTV2RlUvdmszbnd3NHZMRGM2b3g3ckRVcVRhc3Jpc1lsbm9r?=
 =?utf-8?B?MzE5UWloRE5oVEVKazZUNFBlcVNCVHhqVWI2amZ0YXNROGxzSjVmbjFpbSt2?=
 =?utf-8?B?Ym53b3Q1bURuMUErekVCcHk2clZiRi8rWG0wc3phVXFScm1pd2xUNng3cGxk?=
 =?utf-8?Q?2vXOu6sa9Ek=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE1HMW96NzE5TzJJTkcxcXhoUXRPaDkrNVRxUERVYTdpdXY3RFdTYmFTK2xo?=
 =?utf-8?B?RkxFTUFBcFJVR0I5ODdiZmo5OFkyVlBUK2lobXUxTzJHcG5kZTdlUGRKbFJS?=
 =?utf-8?B?a1JSbkxQaE5wMzhrRmowZHpZMlc3Ym9UdkdoMnQyVjgzclExNDQ0ZTdsZng0?=
 =?utf-8?B?OWxhT0pzbWs5cXFwblMvWUwrZy9iRG92eTUwY2RIL093cmJaY0JlbFZvNlFy?=
 =?utf-8?B?MDE4a3JqNG9adW80eU8ySGUxbUw3UlI3clBjOE9OL2dnTW1LWERKZnV6ZmE5?=
 =?utf-8?B?SjV6VHB1SUxkZVlmblIvckYxeDZ0WFV5YmNyMUhsRDl4NGdBV09wb2YwbnVw?=
 =?utf-8?B?bXpWV0hyeVpnOVMxcU9VVGpTdFA2d3d5c1lGSGtPOHZxaUY5S25xbHhaTHpF?=
 =?utf-8?B?SU9YZXR5QUxzN3M1QWtNZHhtdW9VN1J1WkRscXpsTFJ6dlFZbTRTOVdxcUhk?=
 =?utf-8?B?MTlZWit4OWd0R3hFd2Y2RFRDRzBtOERGUHh0b3JRdzNVTXhjNDZtOGRWaHJi?=
 =?utf-8?B?SkphRmM3UXdiWFNqMmx2azA4eUdsMFFSMjB4dkd2SkpoanpzTG9HVU4yWmNy?=
 =?utf-8?B?ZkN3MVBCZEdQb0xqYVdSOE1iY1ZIOU1oOGIzcG5keHRJK1hXRzJYTnlHRkZL?=
 =?utf-8?B?dDBqOTQrZ0ZEWDZhTVZRUHJPaGliWkxaSnpFTkp3NlNRNUkzR3BVMU5GNDNj?=
 =?utf-8?B?c1Y5dWNTKzZYVHhFVnBrM0tnV3I2YzVxZnBTd21XV0NTWGZYU3piVDJob0dB?=
 =?utf-8?B?NWFEMGF5Vlh3VFpzWnQxaytTaUp3UU9iSjBPS3VPVjlJb1R0UzZybEJ6bkl1?=
 =?utf-8?B?citqNEYxSVlVM1ZCNzJOZU1xRU0ydDhjbXRZbk1mU2VpWXNQOWVhTVJVQUkx?=
 =?utf-8?B?OG03VysrM1plNDZSM1FCa21tR3kzZlZ0RnFvcXJXa2RGSG1YK3hLMmNzZUdi?=
 =?utf-8?B?MXFtaVIzYkdVRm1tcGYvaGpYTnExcEFoNFRwbm8zT1pydGFINEE4UzVtR21q?=
 =?utf-8?B?SFhVL25Jc0ZZdDFWbGd0Yk5UQ2c4dEJGNllYRHpHejBaNGxkUHNoazA0V1kz?=
 =?utf-8?B?Q0NTalloeHJpd29HeDlwM20rWGFsM2FKanVMSW5MMVg3NDJHank2NXlacjJn?=
 =?utf-8?B?MkNsMEEvOStxWG5CekYvNnMwb0FqRCtMUGw0OVkzcU91WEpvNk8yYjFxK3pn?=
 =?utf-8?B?YTdkRGl1OU5neWdob1FvMmRZY1lUWERhR1FMWktmU0lQR0ZtSW05QjdodUR0?=
 =?utf-8?B?SnZUcGxrdVVqMm5mdFBJUjZLV1ZXWjJhcFNmN1hiV2F4UlM5Qm4wc3pubVhj?=
 =?utf-8?B?ZmtkYlVhSWdnWGtyK3lvc2ZjTVpRSFBQdS83b3cyREM5OGtDN1A1a2JrNkpk?=
 =?utf-8?B?RTJpNDl3a2FJdUdObmx1czZMUFh2OWhUTjBEYXIzSTVWQ3FQTGlpaVNrbG9k?=
 =?utf-8?B?SWU1NGRaMW9TQnN2RmtiL09MK3FaRERwS1FqM3ZhektNU2xvQnYwM3QzVlFh?=
 =?utf-8?B?WTk3MDVWUHNwWFhVd0FlUUlBUVZvRnE2US9Qc0VwaFRadkRra0xLUWZkSzcv?=
 =?utf-8?B?TVlWQXFMd2JOQ3lxdmxCeXU5cUhFQUJHT2Q4RzFNMm1OZFRBcmlNeUhta0Rp?=
 =?utf-8?B?aG83Y3k4aWVnb0E1VUxycUszSWE4cElkRDREWDBnTklyZDJhaXhJa0pkbVEz?=
 =?utf-8?B?SlFGblJDRTV0aUtUOEpreXgyRXNPeEpJbmNhdU9EbWFaeTZhdWRQZ0FwczFi?=
 =?utf-8?B?NlQ5TEFvY3o5NmNvK0dvY254VXAvT2hVR3hHdEZOenJTRnhySzUrUzIzd2FM?=
 =?utf-8?B?TEIzVldhaFlUUnQvOTFEa0JSQ0xaNm53SzBpRjZQK2RiT0Z5SkYxSG1aMTht?=
 =?utf-8?B?TUlIMVYvVmFtZDdmZDMzZ1djKzNLNWtmdGZ1NkNNZ0J6OXRtK3hLcmZiWHQ3?=
 =?utf-8?B?Rm5EUDNndkxlcGs5Sk50QWF0UktCNUZxN1BUczE1ZFp6YzdoR1pPd1FVZldL?=
 =?utf-8?B?cmFmVmljZkM0bXk1MG9UcVQxc1lUWWpha2UxNHY3c0lkWGJWcVNnZC9rSXk1?=
 =?utf-8?B?amFQZDk0SmI4UXNYZmZVTVZvbXJrdGtHU21JK1V5YmZqOU5SVUlIMjdPSUo1?=
 =?utf-8?Q?aoeGdNw8Skv5EvvJAEuz+l2Xt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e06542-eb0f-497a-cfbc-08ddd8d11bac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 12:17:58.3229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fkkfDmF7VE8G2Y9vQ10UO7IKDlnzj8gnlT/rhnja0T60kASRD8+TtqqSxx1mq+7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9649

On 11.08.25 11:21, Brahmajit Das wrote:
> GCC 16 enables -Werror=unused-but-set-variable= which results in build
> error with the following message.
> 
> drivers/gpu/drm/radeon/r600_cs.c: In function ‘r600_texture_size’:
> drivers/gpu/drm/radeon/r600_cs.c:1411:29: error: variable ‘level’ set but not used [-Werror=unused-but-set-variable=]
>  1411 |         unsigned offset, i, level;
>       |                             ^~~~~
> cc1: all warnings being treated as errors
> make[6]: *** [scripts/Makefile.build:287: drivers/gpu/drm/radeon/r600_cs.o] Error 1
> 
> level although is set, but in never used in the function
> r600_texture_size. Thus resulting in dead code and this error getting
> triggered.
> 
> Fixes: 60b212f8ddcdb ("drm/radeon: overhaul texture checking. (v3)")
> Signed-off-by: Brahmajit Das <listout@listout.xyz>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/radeon/r600_cs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
> index ac77d1246b94..811265648a58 100644
> --- a/drivers/gpu/drm/radeon/r600_cs.c
> +++ b/drivers/gpu/drm/radeon/r600_cs.c
> @@ -1408,7 +1408,7 @@ static void r600_texture_size(unsigned nfaces, unsigned blevel, unsigned llevel,
>  			      unsigned block_align, unsigned height_align, unsigned base_align,
>  			      unsigned *l0_size, unsigned *mipmap_size)
>  {
> -	unsigned offset, i, level;
> +	unsigned offset, i;
>  	unsigned width, height, depth, size;
>  	unsigned blocksize;
>  	unsigned nbx, nby;
> @@ -1420,7 +1420,7 @@ static void r600_texture_size(unsigned nfaces, unsigned blevel, unsigned llevel,
>  	w0 = r600_mip_minify(w0, 0);
>  	h0 = r600_mip_minify(h0, 0);
>  	d0 = r600_mip_minify(d0, 0);
> -	for(i = 0, offset = 0, level = blevel; i < nlevels; i++, level++) {
> +	for (i = 0, offset = 0; i < nlevels; i++) {
>  		width = r600_mip_minify(w0, i);
>  		nbx = r600_fmt_get_nblocksx(format, width);
>  


