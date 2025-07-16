Return-Path: <linux-next+bounces-7589-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B929B07E22
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 21:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D578BA43887
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 19:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797D4286D46;
	Wed, 16 Jul 2025 19:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DijHlF50"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DD21EEE0;
	Wed, 16 Jul 2025 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694849; cv=fail; b=hwcPig9wxvl/MDw1sq73QuuaqyRHhNnhKLgWE+wuuu0/Seu+GvwuPv3O9II7pnJcMQRAHM8cr1FcF3P9Zf37YxFUAqhRqil5Sx34rK/JpcHqgQL/yPvBMA+0Ta5nH5b5R9pv3ZkOLcigDmDQ5+HaWbM+UtOT4cgb/Z4UWsRBaEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694849; c=relaxed/simple;
	bh=n35nI6nd3wVtyU0flxSStjFaAl7rDba9Mitud0rwejk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HA7Brd0S80zuMJk9a8hijcgVTQAePHNSoRZl5dGfIF4aysBBnlNC7ElmeiNThiMfwdtoObC5L8BE8JyvdFv7YWHpSU0ByhbkPbWb80Z2iVESSwzk2Piooo1iWqvBNKDGaTn+Whx6tkZBZl6sbLIAWIWHThVti6/Zpmt8z/Ribl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DijHlF50; arc=fail smtp.client-ip=40.107.243.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TH9uC8e1+vPtJnGPfnFEsDdLYmYlrDwI9ZlpmpeeqfpJJ/5KTH6sf6G4HslhWm/PPArizyDDm3UypLq8teL5i87K3JBjUXDL5m4QjqzhCGzKN4aGXo3eC7U3fXtNLbLvHhamuzEgPUyym4RRsY0IE+ipscq4MF/lvXKa84BF3aAIcmhiu6Th5fBzKWLMEa0ni8CJuah+SHJ96dvtpilAfQJj1aJNfqU9FAKTH+3ztRJzPWhQ141iyncnlx6jJ0ME/Ywq2ospg31xlJwM3hxnDk4oR5tlcjfw9ztbRCxo1gDhApGKRY+3Ld75Hdh7iy9or/P0r+8qOkg3Js3KoNEAqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+TXKt713oxkFZNtorIB9ANSUNOz1kyy9Burx58+SmI=;
 b=B98iwMjQr7xwYTXbczt9VMpaig84JfHlzQmDBXqIxbCGOUWosLF8YO8u4HeCrhqbP8ek+P5bbZ/RVllsveUINmRdpKXYKRkLGdOh/EHyRlI67LL/Hqn86tu0FcksQkd0cSoHE5yJ1tqV9fQhtDY0u0cPufKwfgE4KB9fHCsd9b1EAReKM0x/qlBTCv8Pk8HwHkp6OU5rZHN6e2/th94o9LNFocWpIYDH1lSd0vLWYDmaPtpiSRE2Z3/W2V774Gg+mAGrhlCJYPfKeeacl0HvUqXXIT0uE1rBK0Ze0sLY6uhzRNF9xJ4sp3ZbIn+AE/ZvJBvlL8lThbDydT9NnoKUvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+TXKt713oxkFZNtorIB9ANSUNOz1kyy9Burx58+SmI=;
 b=DijHlF50uEKz2nQsypjj36OE2sEv5JVeYMbqp5Foe1ApwCob3ct1iyAbOBbIsKTGPJSdcxW8u/qfo8RZbtL73m9rukNt4Tbr9Sk7f3X6CNSNhvImcwGlT7izu9VQzErHMHs/TpHnk+rgmAmefdIpr5SlrenpSD6LDa4AWaVSd4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Wed, 16 Jul
 2025 19:40:40 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 19:40:40 +0000
Message-ID: <f6f7bd35-cea6-477f-84d3-f3ce6bf5bd85@amd.com>
Date: Wed, 16 Jul 2025 13:40:38 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To: "Zhu, Yihan" <Yihan.Zhu@amd.com>, Alex Deucher <alexdeucher@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "LIPSKI, IVAN" <IVAN.LIPSKI@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
References: <20250716202831.68661f12@canb.auug.org.au>
 <IA1PR12MB6044F52C3C58284B49DD77DCE356A@IA1PR12MB6044.namprd12.prod.outlook.com>
 <CADnq5_MUdC_odm9LM09V31=KW+Td64PkodmvS9VJuFv0e=3w4Q@mail.gmail.com>
 <IA1PR12MB60448C621D9999334E7DF264E356A@IA1PR12MB6044.namprd12.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <IA1PR12MB60448C621D9999334E7DF264E356A@IA1PR12MB6044.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0265.namprd04.prod.outlook.com
 (2603:10b6:303:88::30) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH3PR12MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c2743df-7962-4332-59b4-08ddc4a0a504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmVqcnRPRUpSRVQwY05sQVphVTU2K045cFQ3WlEyQzdvL1RkVGhVUkRBcVZO?=
 =?utf-8?B?SlZranlzOTB2ZEZ5ZDBuUS9lVVlTOGQ1L2FQS0ZvLzBmNCtlVWt4TTVsQXNq?=
 =?utf-8?B?VEVGV3JZMU1RK0l2OVJ2OG5IMzk5eFhUdUgrT0RsMUpreTlqNFBNQkEwbzRt?=
 =?utf-8?B?aVFYeDE2VWQ2N3A5ZmRDcm0xMWE3eEVNQUR1aWc1a2V6VHp0UWVHdHdyOHhY?=
 =?utf-8?B?c2g5Y2xwNDd4b25GUHMraVkvbnR3ajhxbWRvTnJmQnRHcWRFK3dYVzhPWldG?=
 =?utf-8?B?T3BPK1RjVk15RnpobHUySnArZXozZDBUYzlPRU40MDdyN3JsRnkwaE1ndzVh?=
 =?utf-8?B?U002UGdoWm9jTTh1Unc5QUZSNXpjK3JIQTJEQ29Pa3M5RWREWnJ0dkc5TDll?=
 =?utf-8?B?Q3pPOVZMSDdEVm1iNk5lajQ0eGMwZitGS2lkdkM5dW9md3pEZ3h3aWV5V282?=
 =?utf-8?B?bU41cXorZjY3WUdzbUxubllMSFN4NUxXQmRZZTF6U3MwbmdTaE5qenZZcm83?=
 =?utf-8?B?RmNFdVJIS1RjOEdHVGlOYkExNW9udlpyY2lkUXUrOEJpcHpXbkNYbTBCOEZB?=
 =?utf-8?B?OUs1N1FMYVNna2pNU0ZsQXIzVHlaclpvTWowTHRwRE5oYTVtaFNaazV5THZQ?=
 =?utf-8?B?Y1RWUS9tZEYyTXd1RTRac1QxRndySXdqcCtwS1dGWU9icWQ0MUx0d3hDTGgr?=
 =?utf-8?B?b2NSa0dSM1hFdXFmR2c0ejNLMWtGbHorR01ISVc2TGVLbnJTQUY2aGxxdDNH?=
 =?utf-8?B?MmtpN0FKYkk2TWFvcFRrcFFHTXRoZzA5UVNNQ09ZR1RpWkg0WXlaZW1nRjh4?=
 =?utf-8?B?UjNSZXdmeUhIK1p5bWpSaE1nYVprRndBWTZGSHBQRG1lUXFRQW5BelpCdGQw?=
 =?utf-8?B?Q2NPNUIrdVk2NnFvV1lvU0dxNGtJQ291QVd4ZFlHcURycGNZcjdmcUJGc3Ro?=
 =?utf-8?B?dWFXRVRoeko0Uy85dll5eUZ1WGlSamVPUitBOFNWL0M1WGFVU0czQXF2UklP?=
 =?utf-8?B?K0F4UlZwQ21NMDE4SGtxUUc4SWlEYUp0eHd2ejRoM1ZjTFQ2TnQ0OVVWbXB3?=
 =?utf-8?B?REpERU1uU0tpenFpRzNMakVxYUkxeFpnRDJiREJXMkFiVWZhb1J1RUs0aXFT?=
 =?utf-8?B?ejlQMDdBMHZUdHJWOE8yN1Znb0tZVmJDR3prODkrcWlmSDNaNG9SSHBvVTEx?=
 =?utf-8?B?VnFoR0FCc0hzbGFGQ0R3cjE4L0lyZ3o5aVBMNGF1WjVZY3UyUVBQTWVoZERN?=
 =?utf-8?B?QlZDR2FrdmU1bDhZSFJ6WDVDVVhuRElVcHhORkZ0ZVdreGxLNjEycEh5T0hq?=
 =?utf-8?B?NFE3K1llUFRhVy8rWm0rbmFjdERlRHFJbURPMlVwcWpBUFhYUER4ODJlUFFv?=
 =?utf-8?B?UFg2MUpWYUU5UkhaWVB3aHhaZlN0ZlJDdW9jTW5Kd0xUcUVZVk5mY1ZZTjgz?=
 =?utf-8?B?bXR3NW5pRk1nbzZnV2pFdE9JUE05U1JlQUd6YVdCK0dYaktpK0NVelB4Mk1L?=
 =?utf-8?B?czZwemNFdkhUMmd4MTVhb0pJN05RUERnMm5CcHN5WlBGUWpPbm0rYXdwMGdq?=
 =?utf-8?B?VHl3cWNqdEFHSnNtQmZweEpiRFpzdzQ3STh5THg2KzhmNG01QUxKVE84WWxG?=
 =?utf-8?B?OC9XTnRGdGthclZTZDd0Vy9oSTc3ZHZaR212WlAramRVMlVWSkZ4Wm9qTlRV?=
 =?utf-8?B?WEJMUHJ5Wm5pN1A0MUVzQWdZand6OVVLUXM3ZGRTTDZYYWROclJCcGl4RUVM?=
 =?utf-8?B?dFFVbjU0ZCtid0pFQllkSTRMUTR3SHF2aHUvSjByK3E2akJTbWpNbDdITjVl?=
 =?utf-8?B?ZFNuMU5majRjbUJHYkwrVkVOOVN3bFdkM3U5aEszTzIrczJUMk9BV0dkbk56?=
 =?utf-8?B?UjdBVzY0SWI2aVYreGs4TXlBeDl0UzR2SitQeUtEakNzSHJXeStSREU1dXk5?=
 =?utf-8?Q?OVF+FyGURTM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8476.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1dsWmJiSFpzWmVLRldOaUJOMzhkcm1YOHRjVU9pV0NtU2NRcVA3NVQvbUgy?=
 =?utf-8?B?Q0UxeGhzaUlUU0Z5ZDd6OUNwVGVBZUEzNTVGOEtiU1R3SERvK1cxcFVtSlBB?=
 =?utf-8?B?TmZpbWlqTTdNeDlNR1dIY2U5b2VseVl0b1Z2aGlja2VxSjhWUmZPZnc4bDR4?=
 =?utf-8?B?K0lTSU1HOCtib3U3KytXUGNSYmJPYytaVm9Oc1YxZldxVytQOHQ0d1lrWFQ3?=
 =?utf-8?B?cEJpejc1N1JRUUJnTDRkY1FyTUtzM2tvU0I1cXRwRFR4aDVVYitUYURqdDF0?=
 =?utf-8?B?NUFxcURjTmtFc0lSelkwNHJwcFJNWDlXci9PcnFFRnZWQkw3ZmFrQlpMZW03?=
 =?utf-8?B?RXFhSGJnVGY1N2J5RWx5c1diRmtMN204NnRwRFZheElYdHVwaUFTRHl4YVJ3?=
 =?utf-8?B?YWxlaWhrRXlON0Z5YW9UejBYdkFYOHVxdSsyUkZueVQvdjNKTlNpL21yeWRG?=
 =?utf-8?B?MkVNWkNGRGw4SjF0MEJjK0Raa1l3K0VhKzU2SkZ6dXl6eWRFdDRodTNaV1JB?=
 =?utf-8?B?Zkl4QjRScXc5Q0JuVXhKVHZvVVVYSEtNYXVxOXcvUUhGMmpxWnp1M1F3cVcx?=
 =?utf-8?B?ZkM1Tk5rMDZlMFdpVG1WeEhhdlhLRXBpREtXUWN5ZXhmSDlTbGRPR05MTWlZ?=
 =?utf-8?B?NlpMbWlRZGs1c0h1U1hPbnZ6QjQvY0NxaC9MTnJrblBPemd1dldsRTU0cVRh?=
 =?utf-8?B?SmtRcEVkVS9iS09iVnk1bVphVFo0Nld4Mi8wQVp6L3h6NExENHdiVWg0c2dt?=
 =?utf-8?B?VVRVb1EvS1gvdHlEMXNuSWkrdFF5UEZySzJLMzJweGxYQU5zK1lFd1hpcm9K?=
 =?utf-8?B?ME94Snd2bzVxTzZWcmYzZFNqMlp0OWRrYUZ0Y3BoMXk3aGlsOGpyM1E5YkVU?=
 =?utf-8?B?SVZLRHJ1TFZBNTRJMDlaSDd5ZXNVeVlhbWl6YjVoWnhWdzU2NCtZOEI2ZmJz?=
 =?utf-8?B?TTdvblRXNmxma0NtVTlKL1FBSWxLOFB5SngwWGltV0pyVnRWcTB4YUZNYzMr?=
 =?utf-8?B?T3VoRm1scWpsR0FYSVFpZnUyUFZhUFhhSWw5NnNqL3MxZWM0NnhPZklpU1NW?=
 =?utf-8?B?Z2poRi9KMnd6RFRYd1VudHd1U1VGZ3dtMHo3S0RGM1lhTWYrV2pjb2d1c1Z4?=
 =?utf-8?B?ZmgwOWtOVmduMEZrVjR2UDNGcVdkWVBxNmM0K2xBd2E4QWdnZWYwMlF0cHp0?=
 =?utf-8?B?cVhoR2pBM1BYUGNIdFRxMkdmSG1ZdXkrcVJuT0xMWlFObUw4NUk3WHl0Z1h3?=
 =?utf-8?B?Z05HcHZhT0tKOXFVN1N4OEdUejkvczhyOVlwOVBJdmYzTGllOFdYeEtpR3cx?=
 =?utf-8?B?c3Z0bmIvNkcvZEVKT2dKNFpnbW5kM283dFRIakxEWmJVT21ja3kxT3Bqc1Zq?=
 =?utf-8?B?Y2RyMTBEQ1BiS2xxTmZPRy9nWkZVbWM4UkwzZjJTUWo0M0xFMDJMM0s3bHdP?=
 =?utf-8?B?M1o2Z0h5YmNlRHVIdS9yZTFVcTM3K2VTVmdOcU1XblBSSEp1cWhKQUtpTXM0?=
 =?utf-8?B?dGpvSWNabkJEb2tWYnlUMUZoaVZ5SGM2b2tTNFZqeWhLb0NoUkVabHhhUCtN?=
 =?utf-8?B?cmxuYzZLLzh0dzliNHhhR1ZqMUhacU5GNDZYYnFYMEVlYk82ZnFYV3gwc1kr?=
 =?utf-8?B?VkdBcEtlVkpiYTRQdzBFdGo3NHo4bzlaTHE1SDVoajdKR0tnOHJzdnVoRU1k?=
 =?utf-8?B?ZFEzSzYzSFVZbWJPZDBwZnlQWjZxbTFWWjRkT2IyUlpLUkRCWldIM3BWbjRz?=
 =?utf-8?B?NU5DQitVZWxPQmZhL3N6NzFmUk9hNTdtVGx1UDZOSGpuNkNCeGhPdXdoM1NF?=
 =?utf-8?B?RytFUzZZZjIxZklCb01ka042MVhOdWw0YzAvMk1BSTZtaURsK0lkWWRtMWV4?=
 =?utf-8?B?YU1NWlUxSDQ1UFdyVzB2OGI0SCtxUXZZOXdMMHJqb3kvbU1wNFVSaG95d21S?=
 =?utf-8?B?M3pzb2FpdFBpZmdaN1MzSm1hWVlPN0RGanpIQkFFNmlyWTlhTVpQNU5kdFAy?=
 =?utf-8?B?VkJtR2ZFOFVET2RCNkkvUGtkbUc5S3llSzk5ZnFTaXMxTUhVK1Y3THZBZWwy?=
 =?utf-8?B?Mi9MVVVzNXNuUGV3RGxJdDVHWWl1SFd1L2Rua1NPWk43eWFnY2l6a0MwQ0dz?=
 =?utf-8?Q?LPagorHmqmxdybHCZIOBB6L0T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c2743df-7962-4332-59b4-08ddc4a0a504
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 19:40:40.0954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZYCn9pLxGeJxs0AsiCxZbhBqzekwTRwcQ5YV1suOONxDgmPiHsjya7tVtQH4lJ8SU8bKH2TOzLEdSEnz5Fhdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9194



On 7/16/25 13:24, Zhu, Yihan wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Alex,
> 
> I just double checked this parameter might be missing from upstream. I will work with Alex Hung or can you pls help me to add descriptions below to patch? Thanks
> 
> * @num_rmcm_3dluts: number of RMCM hardware instance

I will create and send a patch shortly.


> 
> Regards,
> Yihan Z
> 
> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Wednesday, July 16, 2025 3:09 PM
> To: Zhu, Yihan <Yihan.Zhu@amd.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>; Hung, Alex <Alex.Hung@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; LIPSKI, IVAN <IVAN.LIPSKI@amd.com>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.org>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
> Subject: Re: linux-next: build warning after merge of the amdgpu tree
> 
> On Wed, Jul 16, 2025 at 2:45 PM Zhu, Yihan <Yihan.Zhu@amd.com> wrote:
>>
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>> Hi,
>>
>> +Alex Hung +Nick for awareness.
>>
>> Thanks for the information. I believe Alex helped me to add the description in another patch. Please let me know if any further actions from me.
> 
> Has the fix been sent out yet?  I don't remember seeing it.
> 
> Alex
> 
> 
>>
>> Regards,
>> Yihan Z
>>
>> -----Original Message-----
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Sent: Wednesday, July 16, 2025 6:29 AM
>> To: Alex Deucher <alexdeucher@gmail.com>
>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; LIPSKI, IVAN <IVAN.LIPSKI@amd.com>; Zhu, Yihan <Yihan.Zhu@amd.com>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.org>
>> Subject: linux-next: build warning after merge of the amdgpu tree
>>
>> Hi all,
>>
>> After merging the amdgpu tree, today's linux-next build (htmldocs) produced this warning:
>>
>> drivers/gpu/drm/amd/display/dc/dc.h:255: warning: Function parameter or struct member 'num_rmcm_3dluts' not described in 'mpc_color_caps'
>>
>> Introduced by commit
>>
>>    26ad78fffc66 ("drm/amd/display: MPC basic allocation logic and TMZ")
>>
>> --
>> Cheers,
>> Stephen Rothwell


