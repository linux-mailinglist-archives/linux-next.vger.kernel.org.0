Return-Path: <linux-next+bounces-6943-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CE5AC5B4C
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 22:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 894653B18BC
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 20:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515362063FD;
	Tue, 27 May 2025 20:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ApTUxTD2"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01D61B4242;
	Tue, 27 May 2025 20:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748377448; cv=fail; b=Z55no5+8jrsd3ggHvlMPXq9lz06Wy5Xgou4/lVAC0//WXG/EizMSpMnjeo1KiL15hdGShd/HTCoTzDUWZe40IVENMlGGN70rSIMxIIr6SuKieuvbgdjGp3Rfnxe/ZQFZIpDN9OiDyWSy6KQTuCYNkYAI7gSK5RpXBMPqUZ/x2Os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748377448; c=relaxed/simple;
	bh=285YwTWgyrpjC5P3/Fz2wboepZHwOlUkvMkxhIb5msw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wr/s6j+us+iNoxKmIZvIsmnFYuzJGtbLsamJ4x8WMFMzQ060higxBuHKzN4ESAuFMi5RKBciw/UCoBe/WZcqCerZwU75144erAsaCV+8ZMSVSyDwdcpNaD5odgYGQL2URyVstR1YSqJ7asFVvptZy8S4ggf+icNUOFuHIH4zWqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ApTUxTD2; arc=fail smtp.client-ip=40.107.220.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiDlIGsKdcYjI1tVDR+EI38XZv5HnYN45Vqv+pVWmnXGtA36dJvoIQiaYMFJ3EE83xhwPhkVA0X8tRzg7dd2/qL3WB0QBmoE8vgMtFINmTw9qQrw2dOflW/MchtHQRIRzXYYrE/v3EsWuRLkdfo9TXyAR80wvLwR/tnGAMUOMrFzmLXYhFladzehP/hMBC0L5DJ/FfF5AwLyoD2qLDrBun5/50QMCAdz6Rzk31ASQxcxPIqSMo8dUtlPEkfAkM25ktZ0UWLlcxF+rbd9VP+uzyqAIGxl3+g2Tji5hpL5ZcgSu1ORTwjhdDjbon0jNKEfxtfV1MkFmNx2+y+ujU8qeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+uGYMfLsNkAs6X/NI4vp7hqQEDqAATZPwb34dzJBJk=;
 b=y2ehWiQhAm/2M1V+S9F0F3c0Jy+B08jKhOCnI3vCVNOugU+U87+RuXsJGhhHx/A34SXooGp7kG5MJsrOSHWvTg4rCA0Gd490CFeNv1AJkjw7APGmqrOII4dVIDKBhWZAljjXZByZTKza3X6LrEyH8ZTpKQulyB5kGBFXxxwvdc/DoKIwiV7diyJyz6s2Yr7ZubhS8r9v5DMtbJmxfvZjckD7vgOxn7jC2lx3xcnLhVXqRvg7YD8aqmRHeRybf1RI6Vp+1tR7Yc0+kR1/viwT+R8RGfFHfKYE2t9oQWg/0nocUqnuH4rt9+tAIO2oP1lAWH6h/MZIecCKlZXwit8E2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+uGYMfLsNkAs6X/NI4vp7hqQEDqAATZPwb34dzJBJk=;
 b=ApTUxTD2zf/XefxDd5Mqp5QODOFbqK4t8EMKvSWdvZUSYr4D8iwF3TdAP9+b6g4YutNMGdiJoWrdOtiD/xILpc4S+xq4EdxxhIm+MScfLYQytFC/xAFN3bhr8ZCTDBbJpB4kBda+vgmAyaBo91mFtS6yWE8AR+JOU5zqZm1rwgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6441.namprd12.prod.outlook.com (2603:10b6:510:1fb::10)
 by BL1PR12MB5852.namprd12.prod.outlook.com (2603:10b6:208:397::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 20:24:04 +0000
Received: from PH7PR12MB6441.namprd12.prod.outlook.com
 ([fe80::145c:ebd6:56e9:a527]) by PH7PR12MB6441.namprd12.prod.outlook.com
 ([fe80::145c:ebd6:56e9:a527%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 20:24:03 +0000
Message-ID: <b712a69d-e899-4286-b5f6-06d87d732ed8@amd.com>
Date: Tue, 27 May 2025 16:24:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 27 (drivers/platform/x86/amd/amd_isp4.c)
To: Hans de Goede <hansg@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER"
 <platform-driver-x86@vger.kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250527203231.3c6c0b9d@canb.auug.org.au>
 <04577a46-9add-420c-b181-29bad582026d@infradead.org>
 <d2ac901b-f7d2-46e6-b977-0ad90faa46f2@kernel.org>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <d2ac901b-f7d2-46e6-b977-0ad90faa46f2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:930:1e::10) To PH7PR12MB6441.namprd12.prod.outlook.com
 (2603:10b6:510:1fb::10)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6441:EE_|BL1PR12MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: a3dda132-aedd-4eb5-6e63-08dd9d5c6c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkxwSjVqK3dwUmc0aUlXdUdtdnRpS2tKWnlWNVJ5Qkcwa1ArbFlQVFhWbFJy?=
 =?utf-8?B?ZTZqdEJWai9WMVVVNjV6eUk5S1AvalRsMk5wK0VQRnM4NzFDbXNiOVo1T1Z3?=
 =?utf-8?B?dk5iUlpQc2lPL3E4b0ExWW5saGVDTWhIa3JOY2cySFJBOXlrUElHMHk3Vzhu?=
 =?utf-8?B?ckJhK0NFQVRUbE1zcDBEcC9OQkx1emdsSXJCR3ZacEZqUzAxTFRZMEtNUlh2?=
 =?utf-8?B?MTJvQjdvb3V0VlpQTDJXdlFRcEM0bWgyZ1FiTk1aY3g3NmY0VEoyNGtTaGd0?=
 =?utf-8?B?RjVRTzM2RmN3K1FyOGNnVGdKZU0wU1dIbDA3WTJVM3NQZjFUMWxFelk5c0wz?=
 =?utf-8?B?S09RcURpRHY5YjRaWjhRVUtjTHRZMHlvMlZzRjVNMEZLeldyZEJ1Q0lPSldi?=
 =?utf-8?B?K01CY3A0aHFGa2JJaUtzcjhPeEJ6bUZaazdEemthQ0MzUHo2azFjcUswOXQy?=
 =?utf-8?B?aVBkN3RrcEdKZ0FOckxYcm5PN0E0aDdZbDJ5VDlLSG5oMFJUb1hBTGU1bWRa?=
 =?utf-8?B?S1FnbXpyVzVJNFJuZ2d4T2UwZ0h0bFE3TWxKOUtBUmRIVnZQVkJnS0M4RXJp?=
 =?utf-8?B?V3JJbEk0dFhsbjBSM0xkR2pYQTFnQitMcVR1cmU1ZHFKRW9GT1VhY0dMZFhx?=
 =?utf-8?B?WFBrK1NZYnNDR2tUKzFrV1hiVVBLeUtzNG80L1A3aU5sZ0ZVOGtscWtteFJ0?=
 =?utf-8?B?ZnVnWWI1QXdCV3AyVkxWR1hJcUxMZ095OFRDSGtQZHVMMzZCKzNFNGhYWFFJ?=
 =?utf-8?B?ekRaMTV0aExUcW9nN01ZMWQ5empiV29ZcVVNODlINnZxV3M3UjFWNk1ZSWkx?=
 =?utf-8?B?UmtIaEJ4RDFsVWt1UHhmT09VU1FHUzl1d2xqU0p3UTdaaGRzdjhIZVZjdWpo?=
 =?utf-8?B?cjVIL1NtYXdZTVpRdlRnKzJTVUpqU2RrYlRVYVJuM2hGd3R0ZC9QR25aNkNo?=
 =?utf-8?B?S3ZFRk9LU3FNUmpETEJOYzZqRjl3ZVlVVkUxZnRFekJqdXZ4UitWTm9Wei9E?=
 =?utf-8?B?OGlMSndwRnRnd3J6VkR1MUJMd24rTlRIeGJ5VVpwY25pampPK2FLMTZvS2sr?=
 =?utf-8?B?UWJYWVVlLzR0NUFNdG9TVG00Y3hTRGFPVDVnZkxaUDRnTHlCNlhlRDZvcmxQ?=
 =?utf-8?B?NFl4dHRFVmhCNDJudXUweEtBZGRSOXMxajg4TXNaZGV3YjBuUkpxQWtJdldD?=
 =?utf-8?B?MVRrRmhLd2FHNjhhdmwyYnRLRDFDMzJKdnZ2NXQvTGl0R2lPckxNU1NldDBL?=
 =?utf-8?B?dmVaNVpKUFBUSHZ5K2IxRzVER3RxNlpMZUxpVFBjSlRta1JKTTM0OEJ0d2N0?=
 =?utf-8?B?dGtZMUpoSS96Kzc4UUZ4Vjd1UTc2d3djK1RvdmpFZ1BwUHF5NjF6ZnJqbDg4?=
 =?utf-8?B?UmFPZ2VPRXBVZ2FpaEZzVjVmV3ZXTDlnVFFVYXZnQkJWZ0pVVlVDRTQ3bWtQ?=
 =?utf-8?B?NXVlUW9XdW9XeVQrdzAzZWw5M0REeUhjMmw3WkhORU93VkNnbE5tYW5FSjFv?=
 =?utf-8?B?a2ZUT3Y0bVJLZ29WWHhoVEJjNkdlUU9MZ1h0R2RVUEZSajVkYm54Y24wU3lB?=
 =?utf-8?B?OGd1REFZYXprMnQ2eEIrL3ZlZEZ1Nm1aNi9Mb2wrSWlvejlzNnhKdDRXRk81?=
 =?utf-8?B?RFpna0ZZOTVLSkVtbk1pZWRlYzA3MlF3d29SSjNEVllCaVZFNDYxbFUyV29R?=
 =?utf-8?B?Nm92QzJzaUlYWEcxMXRzMHhJSVdEQmJqcVFlRG94dG9UZVgzQVN2RjhKY3RK?=
 =?utf-8?B?b3hMVWFtT0tzc1NWQWFWcnJaWXFrNHhCUlRqZXAvRWNrR1o3M1B2L212bXFH?=
 =?utf-8?Q?lqI0zx8EYVV1PfXkkNNXesmyzjL2jd/GPwRaA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6441.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djhJc1JrMi9sZW5wTVQweFJPQzNxeGlDN0hpc0tTbmZYZ1IvMW8vS3NhbU9F?=
 =?utf-8?B?L3YvQU5QSzU0elNHZ3hWbW8xK1dzMGNvZ3Nrb0lLR1FZSDMxcXZjeTMzejlt?=
 =?utf-8?B?emNPYVpaSEx4K2ptenZjLzRRVXhTeE14M2F6dyszZmdWRUI0NGpuZ2ZTWDZU?=
 =?utf-8?B?UW9XNTdVUUo0OUZtM29QTzYwaGV4bks3OVNJQUhKZ1FuTngyZURYZHVrS0JR?=
 =?utf-8?B?cGd2ZE5Mb3o2WU1jdEdLelpBaGExakJJaDlJZzhWZG9BR1IyNUhKQTJGeWo1?=
 =?utf-8?B?S1gweWUvODR2U1JLVDhoZlk3Y2U5RmRvK0ZrVDNLZGxvaU02My9wSHdiRW04?=
 =?utf-8?B?L0dFNmFYOHR0SmE3T3g5WHBYaVNObkJkSGYwYXdtdEd3QmVtU1lRT1lUVTIx?=
 =?utf-8?B?UWMrbm1RU1hUSTdlY2VtL0E0bWwyZlRDc0xDa2lISlE4bUMxaUhVTkVyeUpV?=
 =?utf-8?B?RmxsWGg2WnRaSE1EU3dVa1paeStTV2FieVdYc0tOYUFIYmNoNnhWY24ycXpD?=
 =?utf-8?B?MWpYSGhzWnl4bDdlajFlYWJlaXZhNU5kbGZ6QW80RHh3cG1wMHhNcktZbm1F?=
 =?utf-8?B?WHZDVUVJOGRidXhaOW5lV2t6aldyOG8vSDBsOWRWdk5OK2h2MDRRSmFyeTg0?=
 =?utf-8?B?K2xQSGcva2lRYTAwdlkwNkZ1Zytocng5azlnaVgzSGZzYUJwVDE1RkN3TEJJ?=
 =?utf-8?B?QXZXKzUwUGRYME5IOFU4SXEyOTk5Ly85dTBuZkNRQWhRcTJPTkMvK21QbTBD?=
 =?utf-8?B?YVl0OWkvei9nbU1rYjNpSlc2ZzlCN2V1ODlVbjJWcC9yK2lVQ1NTWkkwd3Rx?=
 =?utf-8?B?bFpDcFBLNFhKajZyeS90ZkprZW5LcHp2cXJDNm9Scm1ZMFJQWlBHZ2ZndXNM?=
 =?utf-8?B?TkRtaEk3dzJxYjhzbkR1ajVSeENFd2h3d1dRNlVBZUtaVnI2N2RFQkVtRE1n?=
 =?utf-8?B?RFFCT20xQ0NMVFVZclJJMWJnRWNxWU8wU0hDZGR4N3dzUjJzWGxNdFVnKzVS?=
 =?utf-8?B?S1JOM0dnOGF1dThQQ1hNcXFnb25wRHhSaUNUdjhCOUJtL2ZQVWdPcVQwZ3p5?=
 =?utf-8?B?WFozOHl0VmhzM3ZxTlczc1ozcmlvN0EyYU5tR09PblJvYnk0OUZTWFU4NXZ0?=
 =?utf-8?B?c3RUK21NR3R5ZENJTjVuaVVheXY3cDR1YzQ4NFMvVnU5NEdncFYwN2pIa3RR?=
 =?utf-8?B?RTZtemZLWWRSMTEvcXIwQkEydHF4MjlSYUN2dExDbnA5eTYza0V2S0pjdnBU?=
 =?utf-8?B?Mm8wdi9vUWszYnFVZmJLRi9IMWYwR1ZuNm44WWpkbDVzMlRBQjZTNmV2dXdO?=
 =?utf-8?B?Sno4SlZlemdxUGpHSVBEajAyZUxFOU9HaXZuWHp1ek42MlNyVVRETmpDL3F6?=
 =?utf-8?B?Z2haQk9JRytQWHpNY0ovT1dISHFuNkwxaTZNMVoxNkkxai91bGIrQndYM3dG?=
 =?utf-8?B?ZUZ5VnordFlZbmF3TUhndVBUektoN2pQdEhhUitoWHBJNURkZEJpTWhGeG41?=
 =?utf-8?B?V2hPM2NEMFR3WS9ObnBxUTZpcjdIWDdYcTQwUmhycUtBOENEckN4K2FJRjh3?=
 =?utf-8?B?QXFLSnE5ME9PSzFVNXRJajAyUHFRUkgzTVFmenVleFU0WTlSZXovOG5Ccnpx?=
 =?utf-8?B?N2RTZ3RuQkFuamVTNXNHV1hReldGeklIV2RpRXdudlpxbzhjc1VScWh0elZ2?=
 =?utf-8?B?WW9BVkNrdStkbnBPdXFtUUhpOHhtSkREVjlDRWdxczU0MXRzeGhMekhYcXow?=
 =?utf-8?B?cjl3VnVCRkY5R0lhMklNZExnNUNGTWtaVHJOZzRLZjlJSGJaY3RNNkNwaDMx?=
 =?utf-8?B?YzdmRFhPQ2t2a2pVcVhPN2tLR1M3eHArQktZWVlRYlNBS2JYY0xCTExzaWdO?=
 =?utf-8?B?TTVwWHZ1eUE5eEdOdjIzeVR5Ujk2R1RVc3dqejNFMllnWDZXbUdLOUI2Y01n?=
 =?utf-8?B?Zkk0NlBza3paM0ZmVG1RQjIzMUwvR1BJaGdzckZaTjE3Ump3ckttdm9OMlR4?=
 =?utf-8?B?Wk94MlNkWHJTK1IydVFBNks2akx0UGg3SUtMSHB2RHVHTG9kL3ArUzZKemx1?=
 =?utf-8?B?c0tua1p3NzNybDhsT2NyWlRsNlhua0J1U2M3Yk5BcVJZRGYrbkdOZHZBanZH?=
 =?utf-8?Q?LL9R4oAG/UTlJgQiasgkaqBy0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3dda132-aedd-4eb5-6e63-08dd9d5c6c53
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6441.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 20:24:03.8442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHNPfJ+fEHMBUPeoKcFf40B3OXrrhI9+UCn1J9+ulbQHRuaKHpb7fHsDWCbpJVVRZTRcQ8wJhNWJOYkA1JwycQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5852

Hi Hans, Randy

On 5/27/2025 3:43 PM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi,
> 
> On 27-May-25 8:56 PM, Randy Dunlap wrote:
>>
>>
>> On 5/27/25 3:32 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20250526:
>>>
>>
>> on x86_64, when
>> # CONFIG_MODULES is not set
>>
>> ../drivers/platform/x86/amd/amd_isp4.c: In function 'is_isp_i2c_adapter':
>> ../drivers/platform/x86/amd/amd_isp4.c:154:35: error: invalid use of undefined type 'struct module'
>>    154 |         return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>>        |                                   ^~
> 
> Hmm, this should not check the owner->name at all.
> 
> Instead the i2c_designware_amdisp should set adap->name to something
> unique and then this should check adap->name.
> 
I noticed the unique name set to "adap->name" in i2c_designware_amdisp 
is getting overwritten to the generic "Synopsys DesignWare I2C adapter" 
name in i2c_dw_probe_master().

https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-designware-master.c#L1046

Inorder to use unique name to detect the specific adapter without making 
changes in i2c-designware-master.c, I used adap->owner->name.

Since it is causing build issues when CONFIG_MODULES is not set, can I 
make a change in i2c-designware-master.c to initialize the generic 
"Synopsys DesignWare I2C adapter" name only when adap->name is NULL. 
This way I should be able to pass the unique name from 
i2c_designware_amdisp module.

Please suggest if this approach is okay?

Thanks,
Pratap

> Regards,
> 
> Hans
> 
> 
> 


