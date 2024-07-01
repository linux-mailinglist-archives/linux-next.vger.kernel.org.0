Return-Path: <linux-next+bounces-2771-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D59D591E3F4
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 17:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BA4B280D61
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 15:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FBB158D7F;
	Mon,  1 Jul 2024 15:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Oyd0twTn"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38389522F;
	Mon,  1 Jul 2024 15:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719847395; cv=fail; b=b10KCUOV3PrRT7I4Kxxd7ptfozolhI42E/5pjrcQIFlVIRxaHk7UAmwTnMuepKXfgrn4XlvZM0MlQ5EiNywXN62XffYxoSBmcuNQlHVLG2bz+euln4xAeDJMb5L0wlJOM/YMQJHR/xMdikXIQQfxmc5oGt2MQCIyC4uW174VR30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719847395; c=relaxed/simple;
	bh=VAbBbuIsrRwiQvkeAU/TCROFowxqNm6Qf1V9gCw8twE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KMqpbP9m8pBYkK2co6V9hhROyqVuLFQcAJkLcN2gauya/9UMuhULjnMBv7gvf9KoccqZGK1RkHWFjCTYqz+qx6JSOXt4jATZpmVUKvHkRFajZUqmmGUIEyH7uhPgwT1xAR81f/y0A68WPEB2b5xeI2HDXKz6eoq4BeumpsVneWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Oyd0twTn; arc=fail smtp.client-ip=40.107.237.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMvzKm0juIk5+OSF9Q8/JmDg38VoMuUPJjkG/kd8WtGfcYrv1nqCdaKRJd/Xb8Ra8t7h6eqx+6wzG8v5BWJbc1xj81zXJqBnaZjn4aWqI3muTas5k/jwmiXQxHfO2V4XrcxXEXfOqjyYpOpuW9aM8Nk2VgA3+PsHtxFaH6WKODSJsVnHPO/Oa/RPoZncAbqls0DkcLEkShKkTJDWmRTEqUDecNYif32dXa3GGSETe8k/juJMetZ1t4NGgymaLFpsBUGkuSuefn3CZxGvjGFYnQUPikDE/fL2B/JFGUgE7Id7OD6JIQ1aLyG8bhRIZRlE97JQDRKeYQ1eVKEHmt+4fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwYCm0BiGlPUBg2W2DQCWtwYguEzX27IEmDpmM2ctDE=;
 b=YNDssrL1hMKKZKj4W39g9Ee1zL3w3i7yZZZFVt+FqDvCzoosDDzki5Lig0F44hFEwMfSYZ/I9XEGq4NtTPz9TEsIX5R867cP/8A0mZqjkx6sfW/LE0WpzacE/LNGcldTpgDlYkUIPJwHf0jaX9LFNpc0aWqygxY37hAvmyYhAJ6HmjBo+kqnv1UITtROtYsQ4ZYswDq1j4b9GOv3HTUW2OyzDiEMEmO7Q10zPrFwI/po9RMVMG+TkyE644JFrTES9vBqX3andHOq0c+36JvGoRProfQkmDTFmmzLXhkf0S/uFxcjd58d0SlCi0PwopBZHHU80K2DK7kIEc7Hrw319w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwYCm0BiGlPUBg2W2DQCWtwYguEzX27IEmDpmM2ctDE=;
 b=Oyd0twTnLcJe1DXfldmZuQWIDS9jKdB/iojByI7vrtQy/coEhatV2DXNu7XdOBwVpxQOCpwbYwZXrV1CJnptSCvC/Ys1Aac44IBtKjK9XatkZPvFL6daBjWg3hIhvInh11k6t6ewLUllnOruqbvV3Fa+eh27+Rbn14/vZzdu950=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8815.namprd12.prod.outlook.com (2603:10b6:8:14f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Mon, 1 Jul
 2024 15:23:08 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 15:23:08 +0000
Message-ID: <733dd371-7204-4766-9c1f-9450fe6b245d@amd.com>
Date: Mon, 1 Jul 2024 10:23:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the pm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240701091549.08218e8e@canb.auug.org.au>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240701091549.08218e8e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ddf474-fbbf-4d57-bf58-08dc99e1b63e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1BBSHI5eU1pM0pMcWdTeEhxalZnaU9zMXFJcTk1dTVYOThhaEI5ZE1zWGtR?=
 =?utf-8?B?Y3VXelZNc0pkZnF0NFVjUklWWTlJZVZLbHNWYzM5Mkl3MUZQZFJCVjk5Q0NL?=
 =?utf-8?B?WFBiOG16SnF6OEpFdHQvdzNrYi8xaHJLTmhSSFplQWxlVDY3Vng2b01YaHlY?=
 =?utf-8?B?QXU3T0tlYUVramsrQTZWUHhwY1JrOTVxczl4ekxKcHA3bGV1aExtKzVrNXZ2?=
 =?utf-8?B?ME5GQmFXMWFCQ3hxbFVUYkFHaDcxSnZjMEJlSEFybzNtak9TMWY5bjhhQmwz?=
 =?utf-8?B?c2M5Yy9xWHFSUk5wTTVCdnNFS05EejZSTkIrSjBDS09PbFl2TWRsMW1paTZi?=
 =?utf-8?B?cjY4L0RFSzJ1OEVmUGh1Y0Jsc2UxWlRtY1lLd1NCbEdiaDJ6WGhkaVUxbE5i?=
 =?utf-8?B?VEFORFYyQWxSeWlLSE1scHNzdlBreWlPL21sSVM3NVIrY3R5T3RZQWJGN3Z3?=
 =?utf-8?B?L3dJWDNpNDJqd3d2aUk4Mlh3c1dKWkIxZGlhNlF5ODJkTHRrQnMzejRyZEEw?=
 =?utf-8?B?Um50SkhCZk1UdmNEM2ZDdThiQmx3RVZFMnoyenZnSldndTBBZVZ6c3VCTlVO?=
 =?utf-8?B?SjdPa2l2K3Y0dmxHUnN6MEt5Q1FuWkk3WXhYTjJtT1pNNzhYTUR0cWEzNWdB?=
 =?utf-8?B?RGlkdm1GSW9EWG9Sb3NMUkIydWRDeVZOYVpVUUdQNXkyWmdOQUR1djdjL0kz?=
 =?utf-8?B?VlVvS05qblZ3clYrMzEwN21BVi9qL1l0TlJRUnI4YWFaZE9Nc25PcCt5VEky?=
 =?utf-8?B?Wk13QjJXTWRUT0t5cHp2NHQxQXN6TlJqUnFXOTE2N2dzUGRXbjVvUjNxeTBD?=
 =?utf-8?B?bGx5RjBUT2dIKzFhdHpWbVFiWmtPeU5JaHdhK1BJNUdNRkh2SGk2ZTFKd3RW?=
 =?utf-8?B?MkQyblY3UFNlaGVIc0xBN2lVRXc0RWZYNXB4SUg4LzBpUXNHbnlmaXZNWWFR?=
 =?utf-8?B?aGdTZEU4R0RkUFluQ3ZSc1JlZ3VtOFRjdTk0c0VkRkxubGNoeFlFLzF1Vmp0?=
 =?utf-8?B?aUJtNnRoQ29STUp1dzB1Y1NqT1REREpXdWZrQkRHQjZ6WjBieWdUZzZnQW82?=
 =?utf-8?B?Vi82WTA2NXF0Sk9veW1NTXRUTGgxUG42QlV6SVVyZDhvaFhBZ291NGJCTitp?=
 =?utf-8?B?WnVweWd4NXN0Q0QwdEFwb3I4SHlFNkllUWhIbi9kQ0V2OGNtZFlUMUdKek5F?=
 =?utf-8?B?MW92MVZkcU56cDBPdXNvWHFiT0RtT1ZXd0gvTkMrbGJyT2FaSFZOQ2hQaTNU?=
 =?utf-8?B?UjMzR1FJOCsvdTdTVDRjd281eHdsakVGUzhabWhyaGpDUnNtYU9hUHVBRC9a?=
 =?utf-8?B?UUlPTmRyQURzM0J0UUhuOFRMOVV0Sk11UnVoYWN1NWFpYk0wQ2tNV01YZ2Fw?=
 =?utf-8?B?MVUzREpFanpVbUNXWkZVekRJWCtLS0tDd2h2RjJlUXRPYkFLUjAvUFo2WWZv?=
 =?utf-8?B?UWtrTGpMM3NvdzFRK2xWSDZqeVpNUTVmdU0rVTdoaEpJZkt2QzVPb1lGb2Z2?=
 =?utf-8?B?K3ppRk5yNnNyeWdkOE1zWGdTcmJjSEQwWGxPVEtja205VmNLdlpEcE9oUUpO?=
 =?utf-8?B?K1lMMEtRSll1dVB2R0Vac3ZPZjNuc2IxSWNBcHZ4ZDU5ZnlPMmo0MC8rVE5O?=
 =?utf-8?B?akw0NGJ5LzR0OGRxekJocXo2ZWtqbnpIaldTY0pPMXNFblJQaWtqMVR2UWRN?=
 =?utf-8?B?Nmd3TitEd3hPVG1UUFZBVGtENEdqVG4rbG1QM3FKKzhFLzRadlIzek5wSXpv?=
 =?utf-8?Q?OatEZ5wbwEbDGiGPs8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3NYeGVmT05nTGt0SlhCK3NJaklBYk1jRFVaeXpEZUlwS2VBMzZBUEdCMGRa?=
 =?utf-8?B?SDZSeHlBUEtrM0NzbGNTR0NUQUV1WTNMeEFaZW1iUXpMY1ZvZjFwN1RhVGtt?=
 =?utf-8?B?ZnJheCsxNnViVm5SbE1CeDNTNjUxNXZXbnlRODlXUm5aS0xSV21RTk00WHdU?=
 =?utf-8?B?V3BBc0F4RFQxYi9NYlJnT1JxcndBRWd4ZGhQTWZBdERsVHRKRmRRZXNxcmha?=
 =?utf-8?B?dU1sK2VCWGU0RC9wek02d2xBaERFQzN2eHJlc2hCeVpyY0dPZmFic2tqbXBX?=
 =?utf-8?B?WWJlTmhzTityM2I1U3RmbVo2VVJ2Qjk4STFLZ0c4ZnhCY2poellIL0ZveVBx?=
 =?utf-8?B?b3RQRUYwa0FrS1dCZ012U2luTnhTTnRpcmQ2bFhYc1NMMDgrYVdGdm1URU1F?=
 =?utf-8?B?djYrdE5tZlFudnBwY1AyZ0J6blhLaGdsbGNLMG5WdE9LMklxam9Za212LzdV?=
 =?utf-8?B?YzdNQStPQkNvR05TV2dNTEtnUFQvcm1iWlJ6WXlEQm01b0lZbUhLcnRoZW1V?=
 =?utf-8?B?SUtORGMrSWRGVVBsUmlyanVtdzQ1RlI2dGl0UVRPejNkb1BYbVpacEN0bTZP?=
 =?utf-8?B?Y1dSUVdQTWU5RVd6dnhnWHpSaExyd3Fka2xaQkdMRWNvZldJelZWNE9EdERz?=
 =?utf-8?B?cHJwVFhFSFEyRE5ERDlXM09LZEFqc2V2WTJZZHFod1FBaFV2TmFadTk4eXhp?=
 =?utf-8?B?SkIzVERHYUdVdDhjbFppVHlyaEhJR2ZINVVWR25FUzlsU1RiTCtiR1lJNG5Q?=
 =?utf-8?B?UnlTQ3o5Vk5heWhaUnVGU0wvTndLOXFSMU9xQ081ajBDTWJ6dUQ2NDNYaU4x?=
 =?utf-8?B?UVhSY0k3cGFlOWUvR3JqeGo5bVVsRkpCR1BDZGtuWEo4VlRMbDRuSDkySGgw?=
 =?utf-8?B?a1E3eEV4Uk9ReEJmK2xQVTd3aklWS2lLSytoZTBvcS9mNFlrcCtaRlZObTdn?=
 =?utf-8?B?aVNpRDR0QjFmZi9UWmJ0aW92aVNVdUE0bTZTMjlNOVlYOSs4ZWVVb0hOV3VZ?=
 =?utf-8?B?UzJoN3J3UmNpNndiakdLWk9MYmlEKzJYMmxHSmFYdkVubWlDQ3ZYMGczV2N1?=
 =?utf-8?B?TWNMaDQ1d2hzMnJoZHI3MmdZTWFmb3JWcXBZS0wzdlBid0xsLzJPSXE1Rm5n?=
 =?utf-8?B?WnR1VEcvZFVDUUgvVHNwMStNTWNLZWordURXNXZvbnpVWGZXSVBVbDBvNSs0?=
 =?utf-8?B?SDV6Y0dvK3cyQUNFNDA4K0xRWmVkS0w0d3Q5TDRFZm92WnpjU0dUUDBKSnFD?=
 =?utf-8?B?NEZDQ0dzekZvYWRGVmo5Ty9PMGYzdDFPMzN3NmV0bWZEK3lVYW9hSXl6VDVI?=
 =?utf-8?B?WnlWU0lYM0s1TlV3MUYxOWpyNmJBVDg1citCK3J6K1Y2WmYzbGF1alpIa0Z3?=
 =?utf-8?B?ZWFTeWFQKzVEMmNhR09PZHFjVk5TRjMzOHpaNzN3VTZzR3RXWU40OHVDVHdT?=
 =?utf-8?B?bXY1UWZkYkUva0p2SWFodDJGdXM4Y0M4UzFFRTdqbDkvVERkUjY0dnRqT1Ez?=
 =?utf-8?B?ZDFWT0Z0c3lEODBlcjZrNkhxTER4cU02bzgxS2N6bFJNdEpzUGZORGdwMG8v?=
 =?utf-8?B?TUdiM1krQkN3YjU2SE4zUVBtMkdrRnJnMmZldDNlQ1duS2RkZy9kT1AwL3Ar?=
 =?utf-8?B?aHV1eFdzQ3ZkVldJb2lkVExGazNRU09LRTBKVU50ekFPdyt4QXpHNjdzZ0Y5?=
 =?utf-8?B?eHhmTUdUdC9HVkpVTGc0Qm1GOG5rUk1LaFExdlF6L1djZU5tV2s5Wlc2RzFQ?=
 =?utf-8?B?RFVLZGhBdVFPU1RpSmZFTkh5VmllOFZmMlJ6bHVtWVU4YU9wUCt6eDR2b3NO?=
 =?utf-8?B?NkQyWDVXTDdyRzJvdStMVmtDNytMUkZwbmU3bndGWGEzUDIzclNsT1RSUEZw?=
 =?utf-8?B?NzloZVVXMnZBeWZTMVpxdjZCUkNCS1hJdTFTak1QUTJlSEk0dXAvTlhUNmRT?=
 =?utf-8?B?VzJzQkR3RWN5WVUrOEVIR29UYWJIYW9YVjJBc2FOOU11M1dlcHl2aVR6OGJq?=
 =?utf-8?B?bkRHYUg0VzVJRkNQRzZaeHpockpDVG80WFJDTWc0cVpVd2VzOVZLMjRLR0Uw?=
 =?utf-8?B?Nmp1Q1BrTmZkS09YMVlUSWlsMzNnZEpOWFV5ZjlNTXYyaEppa251YXdtT29w?=
 =?utf-8?Q?kTy9uEJQwRlDfupuqVuysoDdX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ddf474-fbbf-4d57-bf58-08dc99e1b63e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:23:08.5397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPn6loZqoPmUeYdZInIlZE9NbvgwiEz51Ya2WXXmqYo9xlGwOCR3Zuu20NR/v/O6YvhZPoMLXVBpt9luqerFgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8815

On 6/30/2024 18:15, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>    c00d476cbcef ("cpufreq: amd-pstate: change cpu freq transition delay for some models")
>    c7107750b2ff ("x86/cpufeatures: Add AMD FAST CPPC feature flag")
> 
> are missing a Signed-off-by from their committers.
> 

My apologies; this was from my first ever PR and I had make a mistake in 
not using "-sl" for b4 when I picked them up.  I've done it correctly 
for the others and will continue to be cognizant in the future.

If you can amend the commits here is the missing tags:

Link: 
https://lore.kernel.org/linux-pm/e717feea3df0a178a9951491040a76c79a00556c.1716649578.git.Xiaojian.Du@amd.com/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

