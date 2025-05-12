Return-Path: <linux-next+bounces-6709-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C31AB4598
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 22:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9348B1B41118
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 20:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2148B25C802;
	Mon, 12 May 2025 20:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mAgITm7q"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E52A296158;
	Mon, 12 May 2025 20:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747082711; cv=fail; b=JHlWXL2ZTvdV/i+YwP/h+WUiCJxS2thAxJzI5KIaf/RYQd0ym9/gnfPpIxTGIuXZQZbhLezu7iaYqEDaPoS/9RANGt3SjKtWe7lik6J6pZ4ro6YkOeZEGycYGZiZ8gCugwMLZhnzQ4au5X135xIynhBW4eUm5T1xk61vM5XJIK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747082711; c=relaxed/simple;
	bh=DwULQfEaqgqVPaKz2dFeRWbapozpag3kcdeZQl4s9XI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Qg+KJ9fsnv4X53GzaM5z0TlOZBysN4osp3FkSDf2iM9pr6a0GX6LVghWSWOcp1ny02Nxtp91tI+L22BJ3yg5y1NFUPtTgbz+HXi9XdrqU8l77xL9BuSG0l6w5aTsdly7c4u+ZdLXHKmY3X5owoKMb1cY17PFDzJ+1SdpviyakF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mAgITm7q; arc=fail smtp.client-ip=40.107.93.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1RzywvHzAlswGn3lFaJB4VLc4PqYwMifMZPAWe6wSMsBjyG81jccVcMBGDyhcA+txC3+cqRWUPGR9JVdN8POWyxJv9pWcN/35CsPW/ioc2P+UhXny6RpeTTbtGTHhXTLG3Pr+0v30LXgLQSCJ2KnKoDjlKvkVt1IrJYrU9ppY8A/D7+oS6z7zP/TE/VoIQpQj92FN6wMmGfuNvk3SjBgn54/8XmUCKD7NwDN6n4JDGkTIkTbTLbPboAP8utOnPgsT7bP/slBKkvClC3SuuY97X5ldHHdsj3gEciZqTL1cUFpVD2Aqc95kpIEgX3JnIEBU+k0QdOj0gW8e8tnyXArw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZphWGTFT4fDzHMdTu388ZgTzYGHxSeeq0jaCki+MVcA=;
 b=qvbUhZ8QRsetGww0sX+DH51DHe1AotBZHmkqaDO57tnZk3rSIYJEbJclmBwTh+bhnrkDTiUf/QPYLcjjPooEIXfduquZ2lZY5xymAs11ysxh4OeVNwA3SwF94pnIkynCvUY4EYVdjPoStM95byfI2N8QhIII5KYOxIg7eMpDCHcmWx6mI0y5zGT60L/thLAYBEeAhLujZJgPgYTSC+DoDvHD9eV77/vMftiHVtYfVDEWnOuFsqkCsMDH3ziouaFvHCH6cD9us3I0qO06zzn5eINvpRmKEIoJn2yIMeeAK4R1LV86UbA7rzLIVDC+vu6qq3xEIXlA1NST/UBM2UVtvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZphWGTFT4fDzHMdTu388ZgTzYGHxSeeq0jaCki+MVcA=;
 b=mAgITm7qvIaZ3BYy0nMEszLO41ZtemSqnrbltEw+zbaloPL/kyIKc8ZRMUERDVJagX0YxBYPW4vCnS732bmTbbh43u1nuybm9dIoCpY9HDOcd/S04lnOt5wViYxTbBv/s1dYzZpSgu/teUkW4gn3MOuvopDkAIA/Mq3fuOBockQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6331.namprd12.prod.outlook.com (2603:10b6:208:3e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 20:45:05 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8722.020; Mon, 12 May 2025
 20:45:05 +0000
Message-ID: <8c4ab851-1853-442e-90a9-225be16c804c@amd.com>
Date: Mon, 12 May 2025 15:45:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Dhananjay Ugwekar <dhananjay.ugwekar@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250512145517.6e0666e3@canb.auug.org.au>
 <20250512152326.3f2f0226@canb.auug.org.au>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250512152326.3f2f0226@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::35)
 To MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf383f7-b41f-4251-d562-08dd9195e037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWNuN3g5SHlrL0xSWWxLam5vT3ZYVEFNU1FHQUtXN2d1MzB0dUpuaTBKMy9z?=
 =?utf-8?B?MHJTaWRTbTIxK2I4aUxRUWFYcTF6Z2lFTDVsNGM0dDNxUm51N0xJZ0JxQzZi?=
 =?utf-8?B?c0dPZFVydWRxMVhQakhyamVmQXlHZ2NCUkZHblVuVkNlZXhFSUFPc1NsYzVa?=
 =?utf-8?B?V2RJeGxnL2ZTZDNWSS9zNWUvTUtQUnFMR3FxNlZucTBhdGpvUDI4RlNRays5?=
 =?utf-8?B?WEhHS2pTMXZiUytSK1NTRUowcFBBQUZGc3g4Wmx4RWRjNWhLSW1nU20vbEdI?=
 =?utf-8?B?V3l1RnMzVTBpeE9aQU9pc0RMWjJzaHk4cWpoRDFFc3oyY0tUdWhxQzJxUEF2?=
 =?utf-8?B?dmNULzNLd2lJZVB5TXN2VTE4TEJncjBFcE5hcDNlMVlYN0t2ZTFUbmF5N3Rv?=
 =?utf-8?B?OWNGcVZTalAra0RhYVhEVmxJL3c4SU1ySFlvb1I3V0ZKRkVWeU5nQjFZa212?=
 =?utf-8?B?OVllaTVXZWxUWVFPVTdTQVRyc2FnODQzVTZwbWR1bkVtOFo1ODFNKzFPM2Y4?=
 =?utf-8?B?R2g2c0RkeVVRYlQxck40NlE3bWZFcmdjeFJiN3VnY3lEem9SMWpnUTF5d1NM?=
 =?utf-8?B?aVVlcS9YZEVhMnJXVDg3UzQwVW1UbU9Td1JOUHhWM2tLT21uWnAydE1sTita?=
 =?utf-8?B?am43TEpVWlNjSWxHWWMvbXYyMFpwMHNweHdYUUl3Znl6bFhMamNyeXVBSWgr?=
 =?utf-8?B?V3RGWDhCd1IxL0VleWVYWE1EdFVEZ2VhdERTTE8xRTBBU0pUcHFYNkQyRng0?=
 =?utf-8?B?STJsWHZoQzMvc0o3STJ0MWZQek4yZlZMcFJHaG1tbXR1UktQNlVkWFBBdkw4?=
 =?utf-8?B?OG5QZXFVVmk0aTcxeUtpUmRBS2Zta2RmdExOTS9ndEJ0cnFWamFsQmI4Mm9H?=
 =?utf-8?B?eFlyTkZuWUN1M2JYdDQyTTBRN0VDVlJKWGNjY1JTKytsK2NaZ2FTSlRxK0Vm?=
 =?utf-8?B?eFJBQVhxYy9MeGZiZGJHaTd6TWxVNkpDblkyUTlxVEJ3YnJwci9mN0JKRWs1?=
 =?utf-8?B?cGhrUEZjMU11WUZEa2tHcXBNbStlWWlHZ000QSsxRWhZSFQyNTlTYWFJQlYx?=
 =?utf-8?B?OE1wWXNRNnhJL2NhWnBqQlFBZ1puOGFGRDVyd3pxbHd1N3dxS09nWnU2Sk9W?=
 =?utf-8?B?Y25zaWFkYVdELytrVitOUTF5LzJHUkpQWVNFdm52N3hYMGhhWUsrQWlZeHNm?=
 =?utf-8?B?b0p2NXlRQTZaUWJOQTV3OUMwdWtkWEpjL2hvR0VmZUNuQk9mU2xTODY0a0lD?=
 =?utf-8?B?L3hvL1NxaWQ0dytmU3BISlJVZVZTdEpQTkc0Q1ZaQ25POTBQU0dtb1J3Sm03?=
 =?utf-8?B?Y1ZSL05XVWY1byt5MXZleVkwZWt4Y08vUkNVWVpUSElMT1ZtWkdFZXRtTG9X?=
 =?utf-8?B?OXRFOE0xNHBGWVlKaE5BZHJvMGVDOVNnanNSMmZacmRRLzc1ZlZnRlpKV2dk?=
 =?utf-8?B?YzhUMWY3ZmxLUjdUY3ZSTFpvRE1QenhJb0RET2JRRzh5L251N29CeWZFaTBp?=
 =?utf-8?B?bm5rWWwvaWhVeUtodkJoblBrbHVXU0tVSCtIa2Zld0swQksyMjNPOFI4UjJv?=
 =?utf-8?B?Z05jcWN0MEZZUnZjazZHb2ZFTUJsZmJHVEREV2xtZGFraUFrVDN5ZjIxRGpV?=
 =?utf-8?B?QllwbzY2dDB6TDBFL2NtM01LVXpMY3VESnFvR3lxSTNJWk9kZTczTEtFU3Er?=
 =?utf-8?B?WGJzYytQamJiS2UzK0JnTmp6eGNMcGh1L2dsTjc2aXN5SzhQYmZqb0Y4YU05?=
 =?utf-8?B?amVWcGd6ckdFb2Vkc1Q1cmN3dnJaVFNFWjFJYTV4Q1JueDBQWW1Fc0w0djh2?=
 =?utf-8?B?dlB0S2ZRamE5SmJLOFNMZ1JRbnlubnhnT1c0b3VCZEdDRE41RFJ6OHVwd1NF?=
 =?utf-8?B?b2sxcy85Z2xrMHZKaTdkTGtYd3ZRMWxQL1h3blRnSWh2RVUrY0xFRlVqR3dC?=
 =?utf-8?Q?QcRs9b3ZtAE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1JDcy9sdStxSXYvUlpPS285YkduTlNXZjlsaTJKQmdGNllYMGJVekEzRTdk?=
 =?utf-8?B?aEVKc1lDdHJMREx6UEJWcktQVFdEQVE3dTJ6OUxBc0ZqemtSMjZsNnJiRlo1?=
 =?utf-8?B?OGVTOUIxeTFJWnRFUzlEUS9WK0pkRHlTallxQTBxYWR3OHRIZWt6MnNmNnV1?=
 =?utf-8?B?YnJTeFRVZlQ2cFpkSTZvWXNwdXVzT3hVeWdqVllyYWJ6WFJJWlZJWGYxKzVC?=
 =?utf-8?B?ZER2VjhSanp2NVFQM3VVNGxKNEZWZm9waXppKy9EcjBXMThrZFhyRm1PYmVp?=
 =?utf-8?B?UExoU2xUcEw5SHdjdU1oNmxSN1JoTk1CNWpXbXZGLzdmZHVqQlR1SjlnQlNv?=
 =?utf-8?B?b2w1bEhsY3Zmc29sQTRXbDVsRHBSS0xEMUxYb3dwODhsbXcwd092WVQ5NXZ3?=
 =?utf-8?B?OERVYkVQbFdvU3RlSzdiM1hqaStuYUM3Yk1pNmd5YUZacmlFV3QzSFR5QjJY?=
 =?utf-8?B?aGhocklHRDE5ZDVSZ1lSYkUwNTVaT1hlOWg3V0Nqd3FRcWhGMFZSMWVJOTRH?=
 =?utf-8?B?K0hxTDdpU1drd1U3MjZiVG9JdWQ2SkpFTWVnUUYvays2ekI2WTR5Rlo0M1J2?=
 =?utf-8?B?QTNtblNrdzBwSzVKMkpFTmtER1FzaDBTbmoyK2lPbU9FTkc4SnNZT1Y3Q1lC?=
 =?utf-8?B?dnhoa1lKZmc0eUc1L3NiOTc1ZVlLTUcxUS85a3hnNzR4a2gvQTFvdWUrMnlC?=
 =?utf-8?B?TTcvNWx3VGdGK3k3eVB5VmFVV1ZpTGlya256czhNa09laXhsV2RlaHFncGdj?=
 =?utf-8?B?MFNTb0NJajBNR0RPU1lZRDM1QXBKUTRHK0sydWxFZDk0L2JYamo0WTJMZlV3?=
 =?utf-8?B?bEFWRVlXTGd2WUpXcVVkNnZNK2FMVWNncEtLZ0xyZm9GV2tCSWJRbGErYTVm?=
 =?utf-8?B?eitFZVplVXkxdW1namlDKzlmQm9vWVVFUlZGQ1hXejNXQXUwUFRQOUM5QjhN?=
 =?utf-8?B?NHR3aTZaUWh4Nk1tdjc2VDZnb0ozK1c3cVhwQllNUWR3MWhJdzdKUUhKaXZp?=
 =?utf-8?B?dzNrOXBrNTkzK0NodGdJRnV0aldKOERHR2x2ZmVST2h4VjNCekIxYzVka3cw?=
 =?utf-8?B?bHlORXA2R3dFNEpBU3NzaXpaNVNBajkxZGJkb25iZk03UVQ2S2dSbUdQSWZR?=
 =?utf-8?B?eDlXVjI0TXNUeEs0WVkrcWd2akZBL1RtUUNvelRDM1FiZnlzUzdGWUZEbldp?=
 =?utf-8?B?UmhsRDdkNlk2NEdmUEtYUkxHYkJEN2VLMGZCNVZlWmFBRHdLOVl6czJCZEo2?=
 =?utf-8?B?WDBNVTU3U01SYXhOalVNNDJBaUZ4MUdnZkFSRFF2SDRvMlg1bEpHZDZiUlMy?=
 =?utf-8?B?RDF3V1pnNEU1UktaRWg0M25MNWxHQ08xbzMydmVIMk03N09yU0orMURXa3Jz?=
 =?utf-8?B?YmFHM3M4V0FoRFNodUpTbzNQYzZ3cDlnTlcrK2FWbTQyYjhxZ3Ywdk5EUlRQ?=
 =?utf-8?B?SE02QmNVdzFnWWRqaUh3SEY3Q0xFN0M4TUE3ZVBaR0xKdXFZL2VhZVN4dzJz?=
 =?utf-8?B?R0MwRVFOWThOUUkyWVlodzhKWFhJd1kzUW9Hbzg1YTVlTmdtMjk1NkY3bXB5?=
 =?utf-8?B?a05IVUw3SU84bWNGUGV1cXp5OUtXdC84bFRuSlh4OHpSdjh3VTJvdkNIVTBo?=
 =?utf-8?B?Q0h5MWdlZ0h5L0JhRllTaE84R0Fyb3lFWDVHRHI2aGt3TFZ3YTlIcHpPMHNa?=
 =?utf-8?B?b0FYTmxGTVZ3M3pwaUtxZHpnT1g2aHplTTd0NkY4NklwYy9BOE8veXJiT1l3?=
 =?utf-8?B?L1J0c1d4VFJBSk1nNW9EYWEvUU82WE5uK3NKbFhmZVRHb0lRcnQ0dnBWZDBz?=
 =?utf-8?B?ZndMakFFQkVJQWYycUZqMWtyV1hmbURRRkM2RHdTbGdkYy95YjAwVGJkTlRl?=
 =?utf-8?B?WFFmbGJhNTZTek5hNnJ6T29hb083anh6WXhkdWY3cStQbVp2KzB2RFNpVUU1?=
 =?utf-8?B?dGFaNVRvbkhzN3VRdG9HR3hnSUUzYUpmYUp1Yk5lK0xCUTRFeGM0ekFmUWZZ?=
 =?utf-8?B?dDJpNkdLNGdHUTcydVc5anlNc2poRzI4VmswdlE1cWtQWkJpM095YjJsREJn?=
 =?utf-8?B?ZVpCTzV2WDV5NmwzK3MxU20ydWhvNlZMaUd4bEt2WGJHM0orcTgzeTFZUzAr?=
 =?utf-8?Q?cuqbv5Lse+wst59yS+0f282Si?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf383f7-b41f-4251-d562-08dd9195e037
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 20:45:05.6891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gu3ifapCaUMyOdTs6jWk9CtUBoa0ZlVAUBqH8MW2xCgvrDY5CzbouQSetFOvYq3I/w7X0O91LgON087IuTV2kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6331

On 5/12/2025 12:23 AM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 12 May 2025 14:55:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the tip tree got a conflict in:
>>
>>    drivers/cpufreq/amd-pstate.c
>>
>> between commit:
>>
>>    608a76b65288 ("cpufreq/amd-pstate: Add support for the "Requested CPU Min frequency" BIOS option")
>>
>> from the pm tree and commit:
>>
>>    d7484babd2c4 ("x86/msr: Rename 'rdmsrl_on_cpu()' to 'rdmsrq_on_cpu()'")
>>
>> from the tip tree.
>>
>> I fixed it up (the former removed a line updated by the latter) and can
>> carry the fix as necessary. This is now fixed as far as linux-next is
>> concerned, but any non trivial conflicts should be mentioned to your
>> upstream maintainer when your tree is submitted for merging.  You may
>> also want to consider cooperating with the maintainer of the conflicting
>> tree to minimise any particularly complex conflicts.
> 
> Actually it needed the fix up below.
> 

Ingo,

Can you guys make an immutable branch for Rafael to merge into linux-pm 
for this change?

I can redo the amd-pstate merge based on that immutable branch.

Rafael,

If you want to just carry the fixup that's fine too.  Just LMK what you 
need.

