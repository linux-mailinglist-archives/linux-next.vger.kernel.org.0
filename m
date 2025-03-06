Return-Path: <linux-next+bounces-5668-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D7DA5429E
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 07:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 322963AE3BB
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 06:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DA419D892;
	Thu,  6 Mar 2025 06:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G/ETnawV"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BFC1917F0;
	Thu,  6 Mar 2025 06:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741241769; cv=fail; b=hZyGF3I2Aa0gtkNK9Bds5DbfxOPtV0unX4zkKDsSsLWJFBeysgdcOE4I7jbg9gnSnhFGz33U2PnhrKEakaXSz7I95KlLGUQofZxFcus4WDLN7WOfaKFgSsVHQZuxNXbub7kQpNarvOxyBMWE7RwRFjRjwe9THzx2GDHI39IIleo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741241769; c=relaxed/simple;
	bh=CmNwJZGfXiK3Mn60ruLMrsAY0lxcnPyNcePCUyyteGE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b0fa+RmqpG6N0MBFwd4rMIrcL1WYOhTJQJWGSzEop4+1Do0iQ2xlVRxbWEhCmdyYu6boZM4nkuoJsX4W2UrMxtyCQ7nvKztnDDpToCUa/WAzGxP22czMdWiVY+JKqIgNL8mbTrUo8H/Y04eO9q2DpnblPb0t9nL5ko/SIBqkZ1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G/ETnawV; arc=fail smtp.client-ip=40.107.236.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9mlYwVAMQpFvYwDlimglwK0+CjJG0FKDR1XRlHGVxjCLgY423FmlGDmv86Y2MNMOXpq8iRNlCDSplrJtj8BieSynwashaVMoX9tSqgCgV2LIlr4ZySnc+2e5yvVQC06t8JbMkYVLVTO2Bq7OHZ1Y/j+uYsNj3BGXEMXnxVOWwCaztwzDHJCOWUXACbq7Ow/5Pqq2lq56psfG49xHahfqrUZW1G2TTqDg2mwoPQCedJRKBk4a9+S6apIiPYzBMdcWSFuqd3ZeyudkDd6Fy2DY7MAhA7jC58qIN1RgiElCM6d5rzpscMvLxKfZ2PCdGPcDuTUwJymyGKBlDErNgrkCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOvOxc2aNv+6k+VGq4lS1qTuvb5SJ+R4AWwkAbr35f4=;
 b=cEhuLdHCAMNTwit+kSI3M9Q2BsZBvaGQwOjlvlCAMdJx5kRzaJrABVgGIJZhzIDW9PMXUBXGnpZAKPUdVwphDLiw070KWWSAAgJdsYihZQ+BTtShguH2Yr+bZxlzNKJbpwNIZ7C8XgPYeaw/QL4zv5gu40qXuNmH6b8grItUKUYWQEGPWHEUTIe77o4GFgc39BN2HYaf1J5ZtanZncaT66h9BBtm2MkH45jUq5vHhdbpwqYd+1jx0PAGfyxOFcX0F15Ew3W6AIDbuz9w33N8glzfJNoyRKK7TctFtpQkLgxy8zg62YOxd37Oi12wXv8RMPjcspfVUj4eX2txlRNHaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOvOxc2aNv+6k+VGq4lS1qTuvb5SJ+R4AWwkAbr35f4=;
 b=G/ETnawVJ2tOQnZHHQtgZgQAX5Cbi1vfU15+UIDcucaVN1IJtEOenV//y9J7KEgO9FddFnt2jKPqDNzM4w252gwUjOcRAm6gUHEPF2Kq8tyNzcAU9Uohi+7CnogUDFzGZX5CgSClc1L0hpoeVWz4dzkdDnz0OR/Xht6kR2eeOtg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV8PR12MB9207.namprd12.prod.outlook.com (2603:10b6:408:187::15)
 by DS7PR12MB6167.namprd12.prod.outlook.com (2603:10b6:8:98::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Thu, 6 Mar
 2025 06:16:04 +0000
Received: from LV8PR12MB9207.namprd12.prod.outlook.com
 ([fe80::3a37:4bf4:a21:87d9]) by LV8PR12MB9207.namprd12.prod.outlook.com
 ([fe80::3a37:4bf4:a21:87d9%7]) with mapi id 15.20.8489.025; Thu, 6 Mar 2025
 06:16:04 +0000
Message-ID: <8664c2f4-122c-4798-8a12-3797d07a9522@amd.com>
Date: Thu, 6 Mar 2025 11:45:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the pm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250306082858.70e08bc7@canb.auug.org.au>
Content-Language: en-US
From: Dhananjay Ugwekar <Dhananjay.Ugwekar@amd.com>
In-Reply-To: <20250306082858.70e08bc7@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To LV8PR12MB9207.namprd12.prod.outlook.com (2603:10b6:408:187::15)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9207:EE_|DS7PR12MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5e09e0-3e76-4e27-8658-08dd5c765ffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejBJbjA1QTJGQmd0YWtuQXhOc0o3U29VVFlud2NHd1dVTDJWYk9XOHZaUSs3?=
 =?utf-8?B?N2wyMyt3NzF4L2d2aGh4TFdsd1puRFpWWWxLaytiQmVpN2kvLzdtTWtMbWJD?=
 =?utf-8?B?RVdyQXVOeU9abTBLenFWVmVMWU9lY3Rpb0daR1NQaHVWdEZKVENIM1Y5bWpy?=
 =?utf-8?B?QkpibVNVZUlIcXhpd0crbjZXMkUzTzFZME52czlUeGl3MGhmSmxiTGpQay94?=
 =?utf-8?B?a20wSlZIMUxpaWxOWW5IWDZqaUh2aU1HU25DT3BTZjBBZ3lodU5nWXZ2c25q?=
 =?utf-8?B?dFBsVDA3STl2NXRqajRuUnB5U1ZzcnVBQmIxaW9aWGxwSlZIMkxNVi9yakdO?=
 =?utf-8?B?V1E5WlJuajFXTFlXWlJWemR6QkN2R3pyaUQ2TUFiMSsza3ZpMU53YUMxdGg0?=
 =?utf-8?B?R3ZtV3RuSU5EZThJSEhaNXRubjNiOS8yWmVWUnlJWXFBM2VrSXJnbEVnWWVw?=
 =?utf-8?B?YW5YS1kvL1N1b2xoNDl4ZkFtTDliUjJpUlF4eTY3MVZwL2pON05NVm81bzl2?=
 =?utf-8?B?MitzRXR4VWU2QWdCWTFkRzRPSEJDL0ZKeXRaWTg5cEdHQmNUM25IWFdtU0VQ?=
 =?utf-8?B?UGtqWTJPUktuSjU5dWdkbG8yZnRWS213RmN0djdhRmY3WnYrNWdSc2pLaFl5?=
 =?utf-8?B?ZDZXOGVCTDVKN2dxcFlCMmowQUlLOVdrR2JSSndiMG9KVjBaRCtMYXVMc1NN?=
 =?utf-8?B?clJMNk5QbEtBZTkvRld2b1JpUnZLQlJ6YTZOTUdOeFFYRjlUYk9sbFlDVFlB?=
 =?utf-8?B?SGZqb0JoMTVEY0JRUjJNWVVseDR0Z2xWcVloa3pNaG5XdlZQSGVyN2krYzB6?=
 =?utf-8?B?NHdGMUpEUDdVQ1hjQUNZVXc0MndOUkxPczlxNk5GcWR3QVZhZFZxV1hpc2NZ?=
 =?utf-8?B?UWZNOTNkdTJnMmM0N1Z6K0xSYlF4T0taMjY2YXpuK1UwT1VmK1NoQVNtWG9h?=
 =?utf-8?B?R2ZuUUV4N0V2bjJySGs4NFA0dXhNakZ4b0t4TkxveEtucXdvZ3NGL3MwNTBa?=
 =?utf-8?B?eGhjRWlsMEZFcG9rNjR6bTlKS2ZyQ1RPbkJMdTdoVFZHanVORGUzcTBhbHR4?=
 =?utf-8?B?OThyZW94Y0V6MDZoQXFyQ0QzV1JhM2RhazVremlDV3pXV3dSdG91SHNpYXBy?=
 =?utf-8?B?WmRXU3llQWNIM3ZKc3Bkb01XbElTenpEWElLbldpNWlJZW1mSnNYWWFyVUZC?=
 =?utf-8?B?NFoxWWYrU2c1TytFNWM4aGtBMFoyOEpXN0VEL1R0T2dXZFRPTDU2ajlVcEw5?=
 =?utf-8?B?ZFpJcTgvTGNmNEJKZWhVcHlnQzFXK0ZHVlZrSEdMRXhtZmFnUUJ0a2RnTFMw?=
 =?utf-8?B?N3g2eUpEeEwrRUpmOG1EdGJPbXR1NjFxeURrMEljVnhzbVIvbkxoWUIxNWlH?=
 =?utf-8?B?QmQxY29Cc2NrTzFBYU9kWDBmbEFnbkZOWXVnWHNxMjI1dVNsVStTZ2hXanJp?=
 =?utf-8?B?TFdXQllMbTlxQi9NRVNYeGVlYVlIU2VCakliL09BVmF2dmQxaTZHRzYwa3JZ?=
 =?utf-8?B?NXJkWThkQkMxTXg2V2FrYm12TDNNYjB4WFo1TCtGR0tqMTltZVRza2NRM2Z6?=
 =?utf-8?B?OWEwMFlVYzMyYzYrK1Z4azltWE91MFBFRjROWnhqSUNoUFpzRTlHRW1ETnE2?=
 =?utf-8?B?Um1pQ3c4MUpIRGNwazF1eWYxcTBybWJma3VXeGF1bnZhd0psUkk3SnBYd3Rv?=
 =?utf-8?B?Rng0TWFpb2VYbFZUQmxhY1I0MEN5b3N0dVB1TU5FZFBWeERRTURCb1RTSWpL?=
 =?utf-8?B?RXZLRk13bDJmVVhzN1A1S3lYK3V6K0c3MVJUSFZXc1lBZGZpdW5aT3FVMDZC?=
 =?utf-8?B?S2JSM2h3d3NEVUF1K1RINnVDQ0p6SGIzQnNXdVRveit2a2NZbnBWVEsxZXNs?=
 =?utf-8?Q?h+iH3kIfoYe+N?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9207.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym14Um9zZWR2M3drYWttNzFVcEJ1U1huZUNjTGlkTHJJc2tTYTVUemRaQjNn?=
 =?utf-8?B?TUU2T2RWTmxJNURJck9aaW9pZVBXS0lxSTQyNElPY2pibDI2Si92cjNEcmJG?=
 =?utf-8?B?UUhQZjB0VHR6b0hTZkpBZjVKMEpMd2psNDBVbHM3QVMycXBNZkdlTnIwZnJv?=
 =?utf-8?B?Y1FWUWVaYWk2WXFsb0kybXBqdDVBd0lSOWxSbjNuaXJQaHIrbEdJUFRHUDh3?=
 =?utf-8?B?RklvWi8yeXV2V3dKL3dRbU9VTjZsTUg1YTJZRnZBWkxyUi8xQUtZZlpSTy9p?=
 =?utf-8?B?UlZHQUJMekZUbmJqaTVLNHF5bnUycjBLMGNYNGh1dEdPczlLRnBnY1o1WGlD?=
 =?utf-8?B?VTNIWjNBS25POGJjSkViRnF3c3graFBES2IzVTh0UVFXSUFKYWc3VWpvZ1Zq?=
 =?utf-8?B?dU53RHIrcXhLa3FaYitVcEdsVlZqUWNITStxVkVFWFgwdllWV0I4ZkFPcjZp?=
 =?utf-8?B?bWZMS1B2WlJOYmNDSkU5L2RKK2tDM3dWZnVLYUxEVlA1YSsyOWhTQW9KU3Mw?=
 =?utf-8?B?bVhYbTlKTFRJckZHTG5EMS8wMmJQcml2UTNrclpaL0p2am5IRTg5SzJMQWg1?=
 =?utf-8?B?SjJ1alhzZWRURGRhaFlrUlNiMis3dUVaczYzeTlZOVRDQVB4bktPbm5Cc1N2?=
 =?utf-8?B?VkNRY3pHUFdFZkY1Z0ZSUEZqN1lJTWdzVWR1RzU0U2xaODJEanllZENTSlVC?=
 =?utf-8?B?TVJOVnNnZnpSSkQwaVFMQnhoeW5ISm5aTUVRTlZsOFlwQmR1bHptR2dFWlVU?=
 =?utf-8?B?c2g1SWo4dDhVbGtubHNJRTRQcldZUlFrMGU3cTlnSTFFc3NnYVhVSGdkYjZF?=
 =?utf-8?B?U2JnUGpmaWpnekdMQ1U3Z3BOOHVOeXczUWt5Q3AzQUFwNlBaZTllZ3c5Y29U?=
 =?utf-8?B?RzN1ZFpqeHlrS2dud0hwekpMNlRRSmV4VzBmRFpCM0w2M0pLWUFGbURqd01m?=
 =?utf-8?B?SG9BcXorUHlWZzhMU013OFdMdWtzb2U1TTFiR1JUODZNNGVZUkM5ejFHRXFs?=
 =?utf-8?B?YXNJdm8rdURQRDE2Q1doNWhJaGMzTDk0clNtK256ZStObXB4eU80bHNEWU1I?=
 =?utf-8?B?MCt2UTY5WHRFZVBZbmpnMDFUUWJIbkxKVndjTTV0NmQyUy81TmZRWXlUN3F0?=
 =?utf-8?B?UmNzOW5ValhjY2dpOHhQMzgyc0xSTnNpUVN1cHFJYlhvWFM0RThrSWZJcjVt?=
 =?utf-8?B?SWxzOG1KZHViQ0sraFhIWVpJdGIxWmV0LzNnQkJtcXREMGloSlFlUTRhTUJK?=
 =?utf-8?B?S0tKenpvV01Ua2JNTTMvSy9lekFaQkdXWWRFdDhtNlhsdUFKQm93NmNvMXNC?=
 =?utf-8?B?dWxzWDJLaDhTUk9BSGJuV04vakVaSDB3VTdRUENQeS8wVGVZQ2JCTGJTbFhL?=
 =?utf-8?B?eVFOT2h3VzhRS3dJbVlMYnNQTjJaMEQ1TmE0ZGxpdFVJQXVNNjdBSzVLMzZv?=
 =?utf-8?B?SnpnY1lSNVdVTjE2THZMQmpOanc2NjFBKzA3VVJPeXZzTWRxV3FmVVFrdWNo?=
 =?utf-8?B?Q1FBcGdpT0JZSHhqT21IZ1drL2VxRklodW13anVrRjFhcFhvT2NZeUZLenR4?=
 =?utf-8?B?V3lzbXBFQWJST3RpL25QWG0zSVM0akcwcStvUGFnbW5mdGM3SGdoSEFRZWNa?=
 =?utf-8?B?REo4aWpKL252WjV6R0M5K1Vwc0ZHazJoV3I4d2MzQmVTTHJOTEIrRGFKRHNq?=
 =?utf-8?B?Z1JhNGgxQzdLWmMyN3hEcmRsL0dhL1VJL0w2NDNLWk9vRmJpTW4vMjc5MGtt?=
 =?utf-8?B?YzgxNysrUDhHTDkyYWM5MlNHWEFwNEdNTlFKaWFPMzlpTnJickVvVFpOdDZw?=
 =?utf-8?B?c2xScVBKcExuT1VOWTlJM3F4Zm4wMTI1SENVbW1UMklJWHJFYlhvaXg4U0tF?=
 =?utf-8?B?ZUNjQ3M0OXF0MXN2Q3lTaERrY3RkcVpqKzVSYjk2b29IbEkvZUJGNkNkS3V3?=
 =?utf-8?B?OGc0dzI1L0xKRnphQnQzYlhZeDlLRUNmZklvUkVhdVpxUk5oMDhDYUNCZEg1?=
 =?utf-8?B?cEsrWFA0b1Q1aktHSjBkejBpb2xxWHArbldJeHZJYlhDRm9RSGZhMEFvQy90?=
 =?utf-8?B?Q3Z2UStXR1RhaktJd1FGZ0ovZk9mbXVxaEYxVEVmWDl3ZEFaZmo4ZG8rNmsx?=
 =?utf-8?Q?gQX9h88zKzlzb6Go3eLyghLIi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5e09e0-3e76-4e27-8658-08dd5c765ffd
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9207.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 06:16:04.6537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvQc6kHcMexDoBG7vkclHf+ddcXQsWAyCdKPzAe+nN0mHxDGaL+N+q0EW8sQUSseV7WfulZrdiGJMhSw/MXSPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6167

Hello Stephen,

On 3/6/2025 2:58 AM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   f6c0b7602909 ("cpufreq/amd-pstate: Fix the clamping of perf values")
> 
> Fixes tag
> 
>   Fixes: 305621eb6a8b ("cpufreq/amd-pstate: Modularize perf<->freq conversion")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 620136ced35a ("cpufreq/amd-pstate: Modularize perf<->freq conversion")

Yes, you're right, I was referring to that commit,
https://web.git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=bleeding-edge&id=620136ced35a9329f4d1ea90e51bee2dfd7ee5b0

Rafael, will you be able to fix the tag it in your tree?, or should I send the amended patch separately?

Thanks,
Dhananjay

> 


