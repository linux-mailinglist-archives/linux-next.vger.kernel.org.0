Return-Path: <linux-next+bounces-6358-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D83A98BCC
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 15:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7EE81B80892
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 13:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6271A3A80;
	Wed, 23 Apr 2025 13:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WD/VTj74"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2048.outbound.protection.outlook.com [40.107.101.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EC01E4A4;
	Wed, 23 Apr 2025 13:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416073; cv=fail; b=QbSvGc5YP3J87Bds4kNWM7hN9CQTHg+DF6ZApkR4gA2VIMRIH3dWf3jSjxjJA8xUbajPJCCJdguUrw9MrtzsN/aBX3gHFiX5CuBxYNnCV7FBPCBPh6YqjElUAkW/KTEWKUximIYwy0czIn1p5he61R2wNq2PBlVTk94sxFkF9Tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416073; c=relaxed/simple;
	bh=yq4ZNtBmCTa2OvIIXW+cC9tlpVIF61uWhwC06d2T+Qk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cNb4IF/lYTvjnztrtCwVqq+BlhTFlY4nKx15NtOHT/MbkPB9MdmQ2cK67zguEtfXaYgZXAMM31FDqIuw7RckR0KibSqJZy4jkVBLRlgqWxe97Ift9T6SlYIbWhTzhXdd2unSymBa+Bq1AIsi2BOqy4oNt4NoJfjTdV9FBhfNSL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WD/VTj74; arc=fail smtp.client-ip=40.107.101.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HiY5uGi0hneyPVTIA9JgHprB/vdWIQvtIJH4Lhl1gIXRlUGmnhn16s/meSzbUPYdlSHGlVheVSMpLjWbiOpVLNpXA9FvxLGh2rDvfetxpzuy3T/kFfRmkaYiZbfLcCjLgdVrMcLtElLyaDH/3bQOAAeO7o9mXEFPobG1pZO9SjsLztv7R7iLNTWe+kkd8y8POhS8/Et+IbgmgBvR1YfZt2W4CKqp6M8UyHxI9Q5rOuPlYNc17ZtfKqrDkcpIgpsj/LZJPibO58jlPqL3wCQJUBABGoB2YBH3B/a2Cnp5fLwRb2eljkc1u7Qoq0kCOgQq8qUoWJp+WGEIkbPwVftrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryNdEUJWNZ8YE5hhwIkxhiTA7M/ohfYAkWBE9dZJRqM=;
 b=ULTSqgYdcMhtBGi/8na5Z6SnUfpXiAQniypBicNOp/tsPhV0Lg+CMZmXGmVVdh2IgQ9pBbicEvZnwXJIPLlCQ6G6q9AVsT3rNOr6qfFJhwjUz9sW2T+QqY6cnpHZyN+Ae3Xbv/ow3cLrrifk4TpF1IDSc23ZdDZkbq3HvkzHWazAH2nXkCj/GI/4kcVurbEnfSk+dCRxmSNQxWOSTpagK+Cw8xmXR4whPgDO/y1Gu/NYOAuaLcPZIUT7UV//WpOzbfLgspM3ZlWYyXXoTPvX0+8tdp0JLogu0DfRwSkSQHk/W3+FoP027NlyIYz2fxG+ASBHWn6P3/K3aibpDaTlIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryNdEUJWNZ8YE5hhwIkxhiTA7M/ohfYAkWBE9dZJRqM=;
 b=WD/VTj747E+Ihd+Jaa0QLeItpvzRlX8O3i/qhgVZxuI5RhB5rQ91NjGxbd4tXLE2OADg1Wyl9HhWFyFNsqmgMsL/wGerviDLiQ2WMIihDWCh360EWYqZoT7hW7HQYr0ahsOMhqdY1DnmC0nf861Tb55idaJjCq/O5yofP+CtSBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by PH8PR12MB8429.namprd12.prod.outlook.com (2603:10b6:510:258::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.43; Wed, 23 Apr
 2025 13:47:49 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 13:47:49 +0000
Message-ID: <8f7671cc-32f1-4028-a1b0-c7dccf472f76@amd.com>
Date: Wed, 23 Apr 2025 19:17:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: commit dd4cf8c9e1f4 leads to failed boot
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Bert Karwatzki <spasswolf@web.de>, "Paul E . McKenney"
 <paulmck@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Mateusz Guzik <mjguzik@gmail.com>,
 Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
References: <20250423115409.3425-1-spasswolf@web.de>
 <647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
 <20250423094655.2a0e25e0@gandalf.local.home>
Content-Language: en-US
From: "Aithal, Srikanth" <sraithal@amd.com>
In-Reply-To: <20250423094655.2a0e25e0@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0143.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::7) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|PH8PR12MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e64c45-6960-4c7e-0724-08dd826d6f87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWtuM1dyN255L2RDdmwxTjhGcE5aVjZiK0d0T3hXWmhKM1dVbUxRV2Z3SE9w?=
 =?utf-8?B?aDJ1eG8wNkFjMldkcjgrMUFraVI3T2V6bDJTSW9uY2dQVkEyNnNYbnBNczh1?=
 =?utf-8?B?K1BJZEZHZk9kWHdEKzlqSitxWTNLaml4ck15UXdzakgxUTJ0R01ncnVmbmVx?=
 =?utf-8?B?MFBMZFVUWjBJWkNXM3k5ZDRaWStjRUxxb2RieFBBbjdIaTU2OEM0VGp5RDhF?=
 =?utf-8?B?TnlRcVBzNTNTZTJyL2txVnNTMWVNZXpsbjk5MFpQV0J6Mk5aNFgxVW84TmlM?=
 =?utf-8?B?Z1pTTnVRcTExQzNuMkNjQ3paalM5RkVnU2FOTk9sQTZ0WFFPbThDdStrNGQy?=
 =?utf-8?B?N3ZEUWZzSVA3NjEwTDllY3lTdndzTUpwVm9yaTFXUVZ2THl0ZFFGdExRTTFi?=
 =?utf-8?B?UElWM0I5MWRGVkdybW0xcGtSdG1yV0VmQmwyU3dhc2FxMzJ6OU52elZYNDR5?=
 =?utf-8?B?c3BQZ0M0M2RnYTUrQjRXRjJ6QXhvcE44ZHBrbWthQ21Jc1VhQWoyeGExNVg4?=
 =?utf-8?B?b081aXZmQ0U0RVFHeG1YYnlITXErOUZFQThuYlU5OEUrODh3UUp1SmFuRUg2?=
 =?utf-8?B?eFJZUnZubXpUMTR0eUtLNXR2V2tOcWxFNnNqQldvSGlZakVEbmI4Qm5sR293?=
 =?utf-8?B?eGlkZm1zVEVpU2R4Wm1PeUx0YW1UL0tLUGMrRThmblNFcFVkZzVnb3haekpS?=
 =?utf-8?B?bHpjYy9CV2JlK0tXeDQwcFB6b0tiRXlhcHlGN1FSUDV0OEo1NzNpQ0E3N3dj?=
 =?utf-8?B?WGZ4dENqaCtwT1A2T0lvdGxHNGVGYzQrZHRUYndwSnArTEgxTzJrOWJYUFV5?=
 =?utf-8?B?NlZWa1dXd3V2MERiNjNkNFhPREhwbktwNUlIM2xHS1pGeUwwNmt1RjdHZjB5?=
 =?utf-8?B?RTA3VDBIdmp6N1ZNRnZ6UldLdEV3WUQ3WklZSDNsRzg5eU9rWEZvVklzcVMw?=
 =?utf-8?B?K3ZaLzRmZTRLaFd3cllCYy9oa1RWMkRlZDU5TUZhdmJEQ3ArME5keU9mVm83?=
 =?utf-8?B?MHJSVlpxeDd1N1lxa1JLbjlmakR6MkZBMGZRYkF5QkgvZDh2dWlSWWxNUFhI?=
 =?utf-8?B?L3o5LzRaUXdkeEcwd2Q0KzFhTjdvbUNoY25JeE8yZU01VmdLdXR4MXMvZWVK?=
 =?utf-8?B?VjRmTkpWOURpT0ZnTXBrYUlQVzRhNlpHekpQK2w1eFJyRDVHVWJGdWlhTVlZ?=
 =?utf-8?B?c04xVVRnbHFKNk93b0Nac3FsY1JhSUVJQ0I3aERtWk9Ed0Y2dnYySFhpOVUw?=
 =?utf-8?B?ZGxlWXlyRjJxVjJYQUMrS2ZlTUtrdklHaURxazAxdnF3SmVGQzJ4M3lVZnl3?=
 =?utf-8?B?TzA5MGZ3RGlxdGdSSld2cTFkSGcvcE11dUlhR2VucjhqRlV6cURxKzUzUXVM?=
 =?utf-8?B?ZklsU2hMTFd6bER3V2ZaMUF2WlFwTmdVWVFRQzR2UWthOGJwL085UW1DaE9Q?=
 =?utf-8?B?YTVNWUUrTS9McXRuUlJ5NUtXdWY5anBrNmVtMGFOTWlWSEYrOVNGOUl1R0hL?=
 =?utf-8?B?bS9jNW1FZUpWeGs2MVRZTmR2bXlhNklPWlB1SHZIOWVJYVlQZmppdmo4SC9Z?=
 =?utf-8?B?ejRPZjlCUDg4RDJKUFpKaURWQkhwYkUxbTg4Zysramd5M0hIWTgxMkZFMFZw?=
 =?utf-8?B?T1ROamxDMEhFNzVYK0cwZmZ0NC96dDFOSWlNbTYrNXA2NGlmZFlGdEMvNG1x?=
 =?utf-8?B?MzZpVlNtbk1qMzFsU3VDTWdqMFhNMlpJRkliNTJnTUdVaXZrR2FpemRIeWRG?=
 =?utf-8?B?ZXNmUG9NYjBCSmgvVGlsOWE5SlJBZUU3N3E2ODhsazJSbHVZTDJkZVlXUUtW?=
 =?utf-8?B?ZDFhTUpncGR0bUd0VFIwYjRiUTJzUm42N3FpdFhLcERpc1lYamNLQ1ozTURR?=
 =?utf-8?B?djJWZXZ0ZngyOWdnalAvekpranJjM2J1NTVCclo5Q1V6aDh6NWc3MWRSVm51?=
 =?utf-8?Q?eBrnnZnmeKc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWNtU1dXUE9BK0dVWFRvcXpNWGwxMm1DenBMTis0YW1mWUUrdHhFY2YyWUJ2?=
 =?utf-8?B?dlZhcFN4bEpaZW5kNmc3V2EvL1NnK05lK2ZaRE1keGQyRERIYkxwZDdrNjhw?=
 =?utf-8?B?dGdKTUpLTnRxNDdzVUo0UnNjK2FhNllkVkUrZ1pFQktSeHoxM0dvVi9QZnVJ?=
 =?utf-8?B?ck5UT0l6L3FVV1FmeVpoOGNVSjdZaHpUSWw4aVRabW5nN1d5YU85OUhFUU1P?=
 =?utf-8?B?eWQ2TWVBb3V1TnpFeGVxTDNlUDR1Tnkzc3pCNzVNN2w0ZTV0RlVjRTArNXZ6?=
 =?utf-8?B?R3ZnTm5tMEpHQUo1cEZjOExGclJGQnhFMlpzVEwzMEFlblFRNDhicHNKOVVJ?=
 =?utf-8?B?SXZyeVJkNVhySGpHckRsQmNmazdVd2hxRTd4b3Fzd2lvd1FYZW5vLy91eGpC?=
 =?utf-8?B?Y0NQd3U3WER6NUl2eC91ZDVMVFFBOVRVVHNKeUM5MTZJNm1nblJnUmhGemdp?=
 =?utf-8?B?TjVqMWZWVlZKQ3ZNRGs3YldvYS9hNXU2ZWU3TTFWN3p0MEpYQThpQnp0OW8r?=
 =?utf-8?B?R2JLdzRFYmpScEI5ZS9sRFVOVVpZRWR3Q0RvRHhnSGsrcnNXdUV5NGJqcno0?=
 =?utf-8?B?TFpDMktOR0FjenJxNHlobWFENkdiQWF6MjlwTG42QWNHRE1OaHJsUm8xbndn?=
 =?utf-8?B?cXRkdmFtTVJKWHEvbEV2d1NCN1lQL1lTSjJpaTN3RTQxRXQvZGxHRWpvTjk2?=
 =?utf-8?B?eWxiQlQrWmpkUHh5Vkk1ayswQWZvL3JLN21OSHRacGkyL3VudHYwSTdmK0Jv?=
 =?utf-8?B?MTNNQytGaGZQOWt5UEplaG9adUl2M01KWXBYellSbHErUzEyM0xJZXQzZysz?=
 =?utf-8?B?SUtZaWJsbXgzc2R2elRldXdmdW0zT2VGb0V2emFSUUx2a0ltRWx1VUpiWUMy?=
 =?utf-8?B?eDliVndrTnlMUHBrSWNlWWV5Tm5kSjJMd09BU2pqS3NjSmV3dm9CNnN3Zy9K?=
 =?utf-8?B?bFpsaDMya29UWkFEb3paeHpQOW9RanFyUmhXVFRzS0VaRS9sZXZMSzZ0YXdj?=
 =?utf-8?B?YVNDbncxU1FuaUlpUzJrWlRwM2JlaWNlbkRnV0FPTXovNmh0Nm1kTWtKeUh3?=
 =?utf-8?B?ZnFheDFBNWxDa0FKMzYvNEtheG16bE5aVm9wTklmNXlBVmdXT1hCZkpvOU9I?=
 =?utf-8?B?VFd0cjhkaVJyOEw0YndMSVVYVDlxNXRsYnpDSmhiekVXYndpWTJLNWFuVnVi?=
 =?utf-8?B?QmQwUGdoS01pZGQzOUVBVFF4aTdCeEt2QkdUMDAxOWxkejdiYmpBUFNpRlNr?=
 =?utf-8?B?WDhqS01aWUthMHFycEJrVWRTRGJTbE03Mk80bGZQanpFZFRCa1krakJnT0JL?=
 =?utf-8?B?b24vTkdYZnh6V2JTbDIwMVlta1VvRG9NQmdHcTFYM2tkeTdUSUJGWTd5YXk1?=
 =?utf-8?B?TVVXQjlNTS81bG5WWFlMT0p2MXlvSXV5TjlWMjBVZjdaTkdzdU90V3Zlam5U?=
 =?utf-8?B?aWoyekd6SGNrMDc0ZGQwZ2J2QlV3L1E0cVhiWVFKVWFUZE1Ra2dCZFo4UjVF?=
 =?utf-8?B?YlJSc1k3SVFnZ1VobDJqdUVUTmt0RjdvOGNPYnZxS2NOVTZ5dW1TNEpOeGgr?=
 =?utf-8?B?OEJIWStWdkY0dVVuc05UbHFwS3pVeFVOQWxHeURNVlBFWTFleUNNbC9rTEha?=
 =?utf-8?B?b1VROFZEVmJIVlRjS2RyY2pMeXNmSnNseHFMc1ZNbzJhYWNHelI3S3Q0VVZD?=
 =?utf-8?B?VTlEcEdoVnEwYm5IajlnbWFTYUJtaGRhUHRBeFNwVFVBUjE2VTlWc1RwWUhG?=
 =?utf-8?B?SmdYRGxHMXRXbmdqRjBLUU50bFFHa1BRVDdEdXZJU09uZU5qOWFZN0Q0cUFj?=
 =?utf-8?B?allXaVlEWTZObnhMOVZOT2JVTEM5WWppcWhaVHdXaHhZMUZJWkkvOS8wQVpP?=
 =?utf-8?B?VURSSDhWS3QwbmhHaVIwOFJWbGRNejR3NkMwUUFXLzZSUDY0RG5ETGtNbGM5?=
 =?utf-8?B?SHV0Rzc2aDZQcjZVY1h0ak16djR1bVVXeDlyOG8xUjM3TnIzc3dZTWNodUtX?=
 =?utf-8?B?S1NKY0pWL1FMeUlTM0RiY2U0cDIvcjRrVU1mVkY0U0dOSmVGV25rVDF2dDd1?=
 =?utf-8?B?ZjRDdkJLallVQU40WVJ4VEJrb1d3OXV6enE0NDV6aTFGM2NudXB0bUFNRThu?=
 =?utf-8?Q?nqi/IXC2JkF1oAyEwbM0A2fZ7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e64c45-6960-4c7e-0724-08dd826d6f87
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:47:49.3553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmRK/+epSPqOwCQRlDFElP3vNLee8D3twrJ8xnig0C/PObWX1DZRVx7FBz53ksbogLpFMteoLpgBBjp1qDSIZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8429

On 4/23/2025 7:16 PM, Steven Rostedt wrote:
> On Wed, 23 Apr 2025 19:09:42 +0530
> "Aithal, Srikanth" <sraithal@amd.com> wrote:
> 
>> On 4/23/2025 5:24 PM, Bert Karwatzki wrote:
>>> Since linux next-20250422 booting fails on my MSI Alpha 15 Laptop runnning
>>> debian sid. When booting kernel message appear on screen but no messages from
>>> init (systemd). There are also no logs written even thought emergency sync
>>> via magic sysrq works (a message is printed on screen), presumably because
>>> / is not mounted. I bisected this (from 6.15-rc3 to next-20250422) and found
>>> commit dd4cf8c9e1f4 as the first bad commit.
>>> Reverting commit dd4cf8c9e1f4 in next-20250422 fixes the issue.
>>
>>
>> Hello,
>>
>> On AMD platform as well boot failed starting next-20250422, bisecting
>> the issue led me to same commit dd4cf8c9e1f4. I have attached kernel
>> config and logs.
>>
> 
> What is commit dd4cf8c9e1f4? Please use human readable text. The sha is
> fine for lookup, but without the title it's meaningless to me.
> 
> $ git show dd4cf8c9e1f4
> fatal: ambiguous argument 'dd4cf8c9e1f4': unknown revision or path not in the working tree.
> 
> Don't make me have to download linux-next to figure this out! :-p
> 
> -- Steve

I had referred the commit from next-20250422 tree.

commit dd4cf8c9e1f426496d63fa4e19fbf4edd5623b33
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Thu Apr 10 09:52:53 2025 -0700

     ratelimit: Force re-initialization when rate-limiting re-enabled

     Currently, rate limiting being disabled results in an immediate early
     return with no state changes.  This can result in false-positive drops
     when re-enabling rate limiting.  Therefore, mark the ratelimit_state
     structure "uninitialized" when rate limiting is disabled.

     Additionally, interpret non-positive ->burst to unconditionally force
     rate limiting.  When ->burst is positive, interpret non-positive 
interval
     to unconditionally disable rate limiting.

     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
     Cc: Andrew Morton <akpm@linux-foundation.org>
     Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
     Cc: Mateusz Guzik <mjguzik@gmail.com>
     Cc: Petr Mladek <pmladek@suse.com>
     Cc: Steven Rostedt <rostedt@goodmis.org>
     Cc: John Ogness <john.ogness@linutronix.de>
     Cc: Sergey Senozhatsky <senozhatsky@chromium.org>

On todays linux-next build the commit id is 
c8943bdecfc76711f83241e21da9d4530f872f0d.



