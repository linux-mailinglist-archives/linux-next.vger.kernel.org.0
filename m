Return-Path: <linux-next+bounces-9701-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E84D3AED8
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 16:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB449309B060
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 15:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E9336A01D;
	Mon, 19 Jan 2026 15:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5txCENvm"
X-Original-To: linux-next@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011004.outbound.protection.outlook.com [40.107.208.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B5D23B62B;
	Mon, 19 Jan 2026 15:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835883; cv=fail; b=NgS4xDJVjTXS4Ctk+tsZUWitp0HGZwwbQzi/QXnB7V7RReIdOKsJGJvx2jZlEMGH0q1JjR/z+k+1cF3YvtLrozujSMfCwP+pV6uLEyyMUNkFaS5D5Rg4QdiTv6Acf0AUXkg4qrmbf92iWmh3xAUEzuKTlNeNWGGV69+9YtUk53s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835883; c=relaxed/simple;
	bh=AF1/tHyCSrmwn0YlEQqBWeOxCq73QubrvXOvaKfL0KE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZyOxa2zuXaBktKN3gJ/M3Qo3QMJqTnr4X95lLsO9H+T7wUtV1Dvv4PDt5KpRO840G5of8y+V5zvQ/4bjcbUKjqrqmILt3FiD3cQAfHjGc2TvuGvGtXYBSPCy27o4LGi863z+zxxFfASolw1j6Fx2bEgM3Lx0hvz9cjQHNU0ZgaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5txCENvm; arc=fail smtp.client-ip=40.107.208.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ej3/5xqINHegEHxZYoE82wRqdM235O9zHIc58AelRlRUuN/90u9Jl0ClabXa7eVBSf0IXC4lpwOIYAV9iQUdmL84mLi5zCS7JioBmRUEBGZ1roV297+C8134XBwnVR4h2Luq99O2DoKymEhFNShH4EumC0FnUNYZL2jDu0ni/xpOV+UfLE5LcgghuYtvQ7b8mFZHQvGJLjecZ1XWIq6ZPTXFP+pb7oCvMJ/GHBSDgJcc7FSNuPPcFSvmto3I/+S6x289GnIDfRoK4dQfV7t4n+Oj9s9dqrg535M6+H+LfyJHqwnH/DaPxiEfhgnnZUC579XZafGjYu39iq674YiSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiS6ABkQTWGvjXtiyjMElgkyxjd+dV3ydmnbJvxIFTA=;
 b=fHDMZVhEqCTzimAr65SS+iCyMrG6GKFqL5W6H4q80+Sh1othaTG40LEZ5QbwQ5/ruY3TQ3jXNqTASkmWmd1LPZZaOsnxVGpKRj8/s9fBTj7sjCvS+oVZTukGofgcJwjoY0YiRxX2+2fT0EZoQzvO685w2WdDIixGsEdXScl/jjILlVbRf3o6Riqz7561oj99pO2Z0A8jdhqsMBD1gn7bPMCOuQjqOzIXrH8P5vgU+dJjY+H6mnhM8wm/eEbMlVmn/y6+z0UVaFELQjXvhlVd0wU6CPWI7u1P9Ros2dGjSuuiLaddv857XwoDGAx3S8A8CVFoCK1sMt93SLbUeDGlJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiS6ABkQTWGvjXtiyjMElgkyxjd+dV3ydmnbJvxIFTA=;
 b=5txCENvmte83UNSOlTukHo54WuqcOvoETdMuQH0OWv3bEh2jfU8ziYQV3K66YCKDiItR4qF5tTEVNvn1BMBVLacyxXls6R2QdYSU8yM4o3rJbbosKJqMNEVOS+E1VvFsDEgPgP7AZazynYLACTRV+Cz5DbtbNUYbluEkDheThG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 15:17:57 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 15:17:56 +0000
Message-ID: <723362a0-579a-4ed4-ad90-dc5eea4ae902@amd.com>
Date: Mon, 19 Jan 2026 16:17:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the xilinx tree with the ti tree
To: Mark Brown <broonie@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>
References: <aW5KbYimWKx7obE9@sirena.org.uk>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <aW5KbYimWKx7obE9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0192.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::49) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|DS7PR12MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c11cf5-81b5-4afb-cee8-08de576dec92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjlIU1g1RjRWOFZlczBTQ2Z0MVFTWUV2Z1J3b05sSEtLdWNFQmxjZ3NYQUw1?=
 =?utf-8?B?bEVSUXZKVzNCdTBTTWNKaUZYRmYrRG9PeGtqWEFBcUJSV0YzMjIrZHIrbk1i?=
 =?utf-8?B?RjdraUxTK3BialltNVdiVE1aTzJhUmQyTnZTREs3UWxvS3g1YUtNVVFVbE5Y?=
 =?utf-8?B?TE1SMTJiVmxmKzFzZTRvRUJUaFdaVnNJbU1TS2RqclFGY2ZkTTR1djdySkFq?=
 =?utf-8?B?TEJyY3FlNXhwQWRzUk9UNU1NYUlBajBrcGJhSXRwd3dtcjU1VGtuVHVhUFpJ?=
 =?utf-8?B?K0NDdlNoSUx0cm5IZ1MyMlNSWkYyaVBFVmJzYzhobzhjSWlLUHJWbWNVdDE1?=
 =?utf-8?B?RjN3MWxNRVp1b0VEME0ydGhHamh3WWVmM3dIVGVCRlhXYWRIM3NLQ1doSmhR?=
 =?utf-8?B?UVFoYmgzQ2FhOEl3MkhkNHJGa3F5L3puSmxVcGoxeTZHaWJwU2tuZTg1bkdN?=
 =?utf-8?B?cUk0aWJXMXU3QkVXSjFNelVYakFpTHN2Nzk0QTdTQnEyeWpabjk2VWlLVlo2?=
 =?utf-8?B?bS9UWGtSTGxOVVRrVlhZSFBQYWkwT0R1QWtpb2xmanZ5M2xLelUvbjVqb3NC?=
 =?utf-8?B?TXI5YWk4MUpDTmdNZSsxUlNOejJ0RnZheVRqSklaK3NYSm1aT2FxcWJqVEoy?=
 =?utf-8?B?eU9zWXhkZnE1c0FJTjdacXlvaFltZXdhelpKc0J1VC82cTQ4VUErV2F5L2tI?=
 =?utf-8?B?dWcrR2VzbytHUjBraHAxMGVnS0JpTnhZR1B4aHM0TlduelgxYmt6QXlOZ3Nr?=
 =?utf-8?B?clRBQ21ZZURlWTdWYS9UY0lmQnB0Tmw1VXpCR0xhVGNhLzNNcUo5UTZBd0hQ?=
 =?utf-8?B?QlhkT0RGUWNuODgwcjFzRU9GN0JXOGdNaDhGZk9UTXdkVGszckRuY0JqUlBv?=
 =?utf-8?B?ZjR6WTJVM0tJL1Nwb2dHTVFyTTNIV0pxM0JaTFh3bWlqUjdDYVRadlhTUVFT?=
 =?utf-8?B?c3ZVR2kzNXROSFVlZGxYV01OWlJqTFVDWWdsNU9IVjJGcWZBQ3ZqbWIrVjY2?=
 =?utf-8?B?dmRlV0ZXak41N3R4bDBnKzA3bGRFd3F4ejJoVlhlYkFZaUh0eUU2dEdJNHJr?=
 =?utf-8?B?SGtJck5ST25CdkZMNnNYcDBkQ0EzdXZBdGhBaVVCcm9SZkRtRlJPVnUvQU9X?=
 =?utf-8?B?WmFSV1RDaEZRckJONitHWFBtc2ZkLzJtRE5mZ1lUUTlhcnJsZ0EvcmRVNzdM?=
 =?utf-8?B?QjhrVEI5emdoUWgxbFVEb2ZwYWxBRWVySm9mRndleW94emtDaEROcGFnZW9z?=
 =?utf-8?B?V3phR1Y2aDd1VURNaTV4aFdxTm1xYjdiT0JwN1R5aUNuakY2SUlKcWlLUVZz?=
 =?utf-8?B?RHpXS0tKZGdWbkJkdWpma1hHRXIvVTdKMjRNemM5NGhlclMyRHBGSHVLamxY?=
 =?utf-8?B?OThNb05KZkZ6NkJmcW4vUmVodU80cmF0SnRWYVYySnFBMWt5Nkw5bHJKQ0hu?=
 =?utf-8?B?MGllYjdmbWo0dkhZbWFWS0Q4WnQ5RVpNVXRhTlNIUHUwWEVyMUdkQkVVUDV0?=
 =?utf-8?B?WngwMnJvYzQ5WTZPQzdZblErVmRDL1E1S0RTN2NCcGx0ZWlqV1pIeHArZU45?=
 =?utf-8?B?WUJlT0ZZdzJsM1dQbzFtWHQ5NmlLZGRkK0RtZ0NwNkxwUk4xZGZSSDV0SzNy?=
 =?utf-8?B?THNtV3ZTNmxGVDVPZ0hFQW5PZC9EaWt4WEpaQXYwRjR6WVE1ZWZ4SkVRMFE0?=
 =?utf-8?B?TjBqUDZFdjNMbkw2cUhUNC85elB0c3dHeXd2eEIyN2FRTjBkY05ZVDhENnBI?=
 =?utf-8?B?QjFjcTRxRlZWZmFHUnJQTllBbjgvWlViYXNPNlhCMC8xTnoyQ0pCdEhLWjhP?=
 =?utf-8?B?N1NSMmlmdTVvbnJRMzVsT1Q5bVpGVzh5Uzkwc1lGaDN3MlVJcVpUUVVyQjNK?=
 =?utf-8?B?MkR0a2lzQjc4R0hLNWI2WGRFaUUwcWhqV0hhNXR6MnhxbnRPSTF4cDhiU0hP?=
 =?utf-8?B?L3dtbkdBRFEzd2cxRnRHbW5WOTh1VUlvZ3UwVHc1ZkJobURMd0FwS0hYTE9Q?=
 =?utf-8?B?d3kyTXM3a3c2N3d0Vm5YS0Q4Qm03Mjl4a3FPdHZPbFpHT0p6SjZQdWhYc0ll?=
 =?utf-8?B?NEwrMDNkK0NudEJoRTZqUkVpSXAzYjZkbHhqck5FUWZmUFJrMmNCSTZZR0k3?=
 =?utf-8?Q?ynbc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djE3bnNwL0ViSWZtc2tvTlorOUY4Tlp2QlM1T2xvbVd1SGVqNmxBVkhwaVBj?=
 =?utf-8?B?eW9PNTlqUFNVdW9zUmxFWnZUOTJNOWVJRDRiK0RrMGx4VGpaZ3Jhb1RxTVJV?=
 =?utf-8?B?OUR3bVpybXh3KzdGQ09kWWJ2YjhLL2VIYnNVd1hrYmVESUg4L1ZJOUlCTzlC?=
 =?utf-8?B?WW9HNHlZaUdaMkwrQlcvU2hOTjhIeUFXeThGOElMQW1vNzZ4emVuRHZaWVhG?=
 =?utf-8?B?aENtOCt4WU9qV01BT3oyRUI1SkZVTS90WG5WZTFwMFZPM2F4bFdyL0JGbEY3?=
 =?utf-8?B?M0xGeTBzNUoxdW1IbFlhOXNsK0RGOE9NVUY0NXJydUV4TkcyS0xhT2ROdlEv?=
 =?utf-8?B?VWQrK29XOWd3ZGRwN244SUc1WDViWm1odmNZdXpFcDRzRFdZWHBDM3E3YStG?=
 =?utf-8?B?MEFUSm1UMjZHYkVkMkxEMVhVVTREbzBCa3pLZlI4MTJ3eEdzcTlLZGg0UXho?=
 =?utf-8?B?dTNCdVJNZTkyc1NTN1RvZHpPc0JNMnBqZ3VtZlZhenMrZlI4aExhbU5PS085?=
 =?utf-8?B?cGtmL0ZRMStOMFAxUlJGajdodjJacWNsb3llYUFFNFlFZUFlM3V3N0txT01C?=
 =?utf-8?B?ZUNpWjdmTzBzbVE2Wlg1SGd5a3hBTmlOdmE1NkRDbU5sZ0V1YWtxRnJ0aW55?=
 =?utf-8?B?MEdKS3JydVRDVGFHOUE0ZC8zMU53NGlDcHUxM0V1Z20zdEJzMVduMVBLVUdN?=
 =?utf-8?B?cnBDaEZhaWd2YXBzVy9oQkhPRC9KQTFneVVxRlRPM3FuSkJJNkJYZTF3UVZT?=
 =?utf-8?B?WS9rbVlFelV5d3VicHNqdG1sOEFBQUltaytvWW9ncG5rVTFJQndBZ2xaeWZN?=
 =?utf-8?B?YkZRM0JndXErWHRzK1kwT0hkWktFM1BWdGp5MTRPdW5zbDJzNlJ3UUg2emZI?=
 =?utf-8?B?Qk1kWW9zNTVGNFRrb0pFMXozM2s1NjRNSU1VY3MzUlMzdXdJQTU2OExSb21C?=
 =?utf-8?B?M3o1Uys4SUJPRG9XNkp5Q3d0RmJwU0N1SnM4VHVyZ3pJZ05oNFJkMkp6Q29R?=
 =?utf-8?B?WlZFWm5kZEhxYmRVb2l5ZXpCbzFoYjcvam1raWdGSjc4clpLamZSQkpZWDM3?=
 =?utf-8?B?aEo1KzBZdnJocjVMUW1WaVZEZVdFc2tsVXlCSFc4Wm1rR2oreXJ1MldkRUJz?=
 =?utf-8?B?S3l3WjNJRjh0RkNMcC80ZUwxNzJZL1UzTm1iZCszQUlXdm1uVzgzVmE3Sy9a?=
 =?utf-8?B?S1VnckNwODFXSWJXbDhNTGlNem5JRGhvYTVlSlYvZ3E4TTBVcW9zYThvdERj?=
 =?utf-8?B?WWZIdzNoQTdPWm5Ba21tNFBGYjhVczNqaUpvcmUycDRlYmg4VlZDSmZCd1pR?=
 =?utf-8?B?VnorNnpPVFVhRWlMUEsxWmJSdUU2VTZuVWMzTkQzczhlaXN6V20xSHB3QVJE?=
 =?utf-8?B?aVJDd2RVdXNNL01LZFhleVVPRTUxeXBkRktXSCtCTXpaSVN1blFxRGlweUhP?=
 =?utf-8?B?eUlxazNwcEdrNzRWcjdIbW53NjF1dDhYWGY1SWtVS0pLSkhvbGVOU3JZblVK?=
 =?utf-8?B?cjhoWFljZzRkcEh5ZUNTQ2I1V1RvOWZNMGJiZVRnV1JxYlIwaUJ0NExDNU14?=
 =?utf-8?B?VklQa1pmQmFITThWMXN1RXZadExWSHl2ZkE4RDBCOWtaZk1VMFVzUTNteDlW?=
 =?utf-8?B?eFBza1hhMWFyYVVLWVB0YzRvcDdyekJrcE9TTHpHTjg3a0s0ajI2NHZlT2w2?=
 =?utf-8?B?ZVdrYlhCaEhIdVdNeG04TVFDR1EwdVJ6d2Z5dXJTclFQalNxVU1DeTY0SzV4?=
 =?utf-8?B?ZXRxQ0M2QUNoSWdJOVdOUFdvc210Q240Tmdwb1RmbTJBbE40dC82YzRWYytP?=
 =?utf-8?B?SEpnSjhXenhoZjdZeDMxSGd5V1BreWJ5WldoenhaelUrNUZOcDB3V2xMY3BH?=
 =?utf-8?B?Rlh3UGNkcGF5VVpoMHdjeWVHT2YrOUR2VnJ4WmFxUlE2eHRRVXh0aFdEaGYy?=
 =?utf-8?B?Tmp2NXN0dWRMQjJYRm1meGwyN3kxVklLMGlVSG9iZ1NZaldNa1ozUkZGemtz?=
 =?utf-8?B?UVR2bHAwTnB3RGFBTDhSaTdMcFdWQVN3Ri9ROWFrSEwxaGVCRHErVTl2Z1R0?=
 =?utf-8?B?NzRVUTFVY1JzalNCUVVyeTV1S0x2WndsM2hlT09vMllKZnowaFRjbXpHZHg0?=
 =?utf-8?B?OXRsdGVEUGRXTXNRMXNIeVd5Qmc0dXAxRUlaY0JZdnQ0WGdtNGVIaExHVXJa?=
 =?utf-8?B?ZW9VaEVUZVUrZzhsRkxiK3JNZDNpQldIYXd4bXd6Z04yQVRCM2pYT3FWM1dG?=
 =?utf-8?B?cUt2U2pSamFQKzVIWGgzempaQnhQMlRheTlxZ0dhYWI5Z2cyMmxHZk5uZDNW?=
 =?utf-8?B?Zm1pa1JiZ2NTNlBFV09XUlJ1TGN0NC9taWU2SVlQOWNNMHdDU2lRUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c11cf5-81b5-4afb-cee8-08de576dec92
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 15:17:56.8363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 787Klg0xw2VS2/oDy3w9BXMEBeSW2XIlwCF4p+E1x6DjWhGRcfv3xwaKjGBEKk85
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5984

Hi Mark, +Arnd

On 1/19/26 16:14, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the xilinx tree got a conflict in:
> 
>    arch/arm64/configs/defconfig
> 
> between commit:
> 
>    f69f88211c84d ("arm64: defconfig: Enable the J721E PCI host driver")
> 
> from the ti tree and commit:
> 
>    41de0de8033e7 ("arm64: defconfig: Enable missing AMD/Xilinx drivers")
> 
> from the xilinx tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc arch/arm64/configs/defconfig
> index c46c678c8f6c2,cdb7d69e3b248..0000000000000
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@@ -233,10 -231,12 +233,14 @@@ CONFIG_PCIE_MEDIATEK_GEN3=
>    CONFIG_PCI_TEGRA=y
>    CONFIG_PCIE_RCAR_HOST=y
>    CONFIG_PCIE_RCAR_EP=y
>   +CONFIG_PCIE_RENESAS_RZG3S_HOST=y
>    CONFIG_PCIE_ROCKCHIP_HOST=m
>    CONFIG_PCI_XGENE=y
>   +CONFIG_PCI_J721E_HOST=m
> + CONFIG_PCIE_XILINX=y
> + CONFIG_PCIE_XILINX_DMA_PL=y
> + CONFIG_PCIE_XILINX_NWL=y
> + CONFIG_PCIE_XILINX_CPM=y
>    CONFIG_PCI_IMX6_HOST=y
>    CONFIG_PCI_LAYERSCAPE=y
>    CONFIG_PCI_HISI=y
> @@@ -608,11 -609,11 +618,13 @@@ CONFIG_SPI_STM32_OSPI=
>    CONFIG_SPI_SUN6I=y
>    CONFIG_SPI_TEGRA210_QUAD=m
>    CONFIG_SPI_TEGRA114=m
> + CONFIG_SPI_XILINX=m
> + CONFIG_SPI_ZYNQMP_GQSPI=m
>    CONFIG_SPI_SPIDEV=m
>    CONFIG_SPMI=y
>   +CONFIG_SPMI_APPLE=m
>    CONFIG_SPMI_MTK_PMIF=m
>   +CONFIG_PINCTRL_APPLE_GPIO=m
>    CONFIG_PINCTRL_BRCMSTB=y
>    CONFIG_PINCTRL_BCM2712=y
>    CONFIG_PINCTRL_DA9062=m


I have sent merge request to Arnd today. My 2 patches are in Linux-next for a 
while that's why it is new change coming from that second tree.

https://patchwork.kernel.org/project/linux-soc/patch/CAHTX3dJDXwA-y-DaJbM4x+UEBJvwhCr_xz4xGf0kF7_8ufvNWQ@mail.gmail.com/

Arnd: please be aware.

Thanks,
Michal



