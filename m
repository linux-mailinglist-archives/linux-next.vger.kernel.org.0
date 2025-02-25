Return-Path: <linux-next+bounces-5564-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C521A439E2
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 10:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D0887A8062
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 09:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EC925EF9A;
	Tue, 25 Feb 2025 09:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oE/Sb0dk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kYz5rq2s"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987008F5E;
	Tue, 25 Feb 2025 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476376; cv=fail; b=Uv/U6KI/xmXWTOm7RG5OuHE2PlhGN80DIcXSUXNmY33AgCQKjMXfa/7vnE57Rwg95agt2Ap7DJnY6RECktnSN3/9rXaXhov6s78g8gPt7JGsX6//3B7ut8lt5C4Da11qllVaXVRHJYLiZYZaps0b61Awa9gQA1Mi/SFfqMgeAcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476376; c=relaxed/simple;
	bh=sm7ACOfqyar23LPgwfFf+ggIBP1uu58la6IMpYqgmt4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pfi/Q4yY1iOAJENReT3NiCV4aGSXQ8KEd/pChxEQnuKTZWplkWAzFzEphqaX+2ozN3R1ZbczMXryAFsThhwB0WHvq75JlSs9z41bzTwBOc+lw2WPxxaxNwkAtQzYPjYfA69n4ChBw0clqYibU20ovG0bma7pN2IcCrUTpW8TxqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oE/Sb0dk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kYz5rq2s; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P1Begb002668;
	Tue, 25 Feb 2025 09:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=mLkaIvOyGcpIV+lcna0NOGekw9rSVp1c0b7gaLY9npo=; b=
	oE/Sb0dk536CaUcFZZM+P8pwK5CaFKYpzlK6dRAduq3qGS1iYLEPGXIvstsDzhaR
	BEMZhy1/zUEC1ZDqYLZn0jh8fGK9OTjFTBubPJjagENGUcJMBNLS9vv6E092B5cX
	XyOiclQZf1W9uX5Dy2FZS7aH7KLxDlKrWfuIn9Oxpof5h83DjNBfKk3vuDqHsG0C
	yJHQyycz2zcX+sD+o80Gg0w6cnxKu5WF0lA3afm9jydQzOAUe7pQbaIYe+wKu2ZZ
	dxlmlYvo998xgCRDQ8I92J0dUwBUeyDtGg88ztvv+YHSFBlmoaBN0v5M3fTVVyXu
	qPOrv9X+SBBgb5PDNMt1QA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y6f9cjc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 09:39:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8LYUY010097;
	Tue, 25 Feb 2025 09:39:03 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44y518n06t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 09:39:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFL2jBYF0OpGJoTn/zbaLbXnLRTPIE8rFEwi0SKMYgNQ2Ll8B/T/vrJ/MGbnU2pmgUDvvdJzeTPreH238+90wogZXNOrUtV37wguLqUNCx40D+qkGr0BGFahevHRl8A0BqEogS8+jqsA6jLuA3kWDNTIG/Ljm7RXnNBLsoK6miohmwg0hU4T0jR1fiPB27v6cIxQm52ApQxj4YeMfYDECh/8RUwXJxnhjDwV6uQ99eH42b6jeqeM1bfGppeYt1miF8gdvtQR4mTXUhZ+E6ygI5sYUu64BJBeMq4QcjtekYrADOciSzXalvq2XHkPOM34d6rwVgHYeEeDQShyZU7LdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLkaIvOyGcpIV+lcna0NOGekw9rSVp1c0b7gaLY9npo=;
 b=ndMt1ty+vV4SWuK+wxomlhvTAYj3Y2cPRCx4Rrg5SFkYZuoWwepDHBJcTTzqHb/aH5RhltbyYJooKj62U4uRPSvH/iFBamtlFgQLHKLSpTGQE5rnj3h5tGFEkXBtoTOd/JuYvRi0JtzRgqMdxG1mY4yb/EjV3EAJURi2xjmSkLNQ81VtZcSTjCUU1abCbG4vybYcgY89Q1oUkbNEy1GACATctWkkDrzpuo0vl2Ma+SsLdB65oy3/f/tSENvNFQaF/ggsuJstga76y1gWZesSKdVn9EJcTOF9UZDeElyQzzyUlkNRlkzXYFFUDDYhLioupfTss+QxjJJMatic5Vx3Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLkaIvOyGcpIV+lcna0NOGekw9rSVp1c0b7gaLY9npo=;
 b=kYz5rq2scpTEAIrDDJ+KUJoCjgR9Vd5J10A+ASblKSN8fbLQ6FbWB2cehly5ivPHs6jyrqj0p6sXOiAntrnjgjALkz+u/jESumYhx8adXegLzO/mu8NYK6W/P2mHqKPbwKO3/E4A3IqK7r1j8N78kcZJa9W1u1DOarfAXpjXHjw=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by CH0PR10MB5164.namprd10.prod.outlook.com (2603:10b6:610:da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 09:39:00 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 09:39:00 +0000
Message-ID: <a902ea86-132a-4b64-8710-575a798f1a18@oracle.com>
Date: Tue, 25 Feb 2025 09:38:57 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the tip tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nam Cao <namcao@linutronix.de>
References: <20250225153200.00773d86@canb.auug.org.au>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20250225153200.00773d86@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0278.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::13) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|CH0PR10MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: a5a43751-1ed7-4fe8-ea20-08dd55803bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3RzSWZmZHZXeVFua2p5UGlxZEl3M25zcFh6V0k4VVJHaTh4dGNBNmRLT3I2?=
 =?utf-8?B?Q3RDeDNLY0dlSnlzL0tSZ2lpcEZnem1WcmxOOFM2WnJPRnNqeThmZ2d0VmVq?=
 =?utf-8?B?TWpBb2dEbDNWdGc2UCtQSDVaNkxDYXpHOFN0UWxPOEdJMXEwMU1LQlVteW9O?=
 =?utf-8?B?RWdXODVRU0NxSE5mZmIzRjRKd2NMaFNGYzdUVEFHdmNwUVRvK3RyRnJremFa?=
 =?utf-8?B?UG9oWXpsWElIN3hpRVkvajRONml1RG1jOUJXemlQRWdnakJiN21yYnljYzZW?=
 =?utf-8?B?Uy92RmlMbWRMRzBFcTRBY2crM2toSnZXYzZjaUhzYmhCdWs3VnZWeVlNUWJh?=
 =?utf-8?B?c3ZmL3hHMWtiVTJENzIzZ3AwME1ibWhlaHU1NkR0dERaVy91RWdtTCtUODVL?=
 =?utf-8?B?dzY5dHJNTUVnOHhRNDYwZkNiWmlvVk55bXNLRUR6QndpK2pMZWIrN0ZtL3FK?=
 =?utf-8?B?ZFNJbUxGdGlKNjVZOE52WWROdG5jVkZiQ09wQjYyV2VqQXV0Nno5U0tUSDJt?=
 =?utf-8?B?YmVZWCttb0FKbXV6RW8xNFQxUENKWlIyRHcxQXVtT0o0eGducmc2SGw0MVh4?=
 =?utf-8?B?WFliTW4rVzliTU8rclAxZTZMcGtMQThsR0R1OXpGR1NyTDR2VjBBWHF6dzBG?=
 =?utf-8?B?VnpvcDZEQ2tzVVUvRUk0Nkl6Q1BBRCs3V3o1RnhrVVU0OTZHcXdYQTVJWUt6?=
 =?utf-8?B?ZFBRUHM5TkRjM1l5QmIzQXhMNGNCSmlPL2M2QVRWMmRqTDBxaE85M2FUcUZB?=
 =?utf-8?B?ZDRFT3dhRlVUZjQzeit5RjI3cEM1Z3F6V3lZbUNtM09WQ1BMQjVCa3Zrckd3?=
 =?utf-8?B?WHlpUytvRnBPQkdZZTBNTjFuR3RCVTBaeEc1VWhyd1N4aENDT1RxQXplZjU5?=
 =?utf-8?B?ZDUxdXRwSmRZUHFjaEpsbnpQNGZnVmZiNVJCVklEWTVERUcvUXVKUWpuMG9K?=
 =?utf-8?B?RSsxSDV4dUlCSDQzZ05uNmE5TGFkRFRHUkZJcCszbFNtSFJkaVF4UkxwTUpE?=
 =?utf-8?B?NkpndVRyL21wekNsdVh2Y1dwd05hVFBNQjBBTXZnWWFiK3F4TUp6WWY0UFg2?=
 =?utf-8?B?TGRSZVBsaS8rd0taRnhPa0UvZ0V0Zm8vNDFaSkkrZEZibms5UWQ4eXlJVjRY?=
 =?utf-8?B?THBVZ0tWa00yTkJQMzFQaXc5dTNWN0dIRmhoMmdMRVZ2QUxmQlRUV0p2MWdu?=
 =?utf-8?B?dGRnYS9ZbjF4cS9TR1NHL05tSmZrMGJHZDFjZFFtdDRVS1FpQk02U1pBVVRC?=
 =?utf-8?B?WUd2YS9LSzFET1JtNWVPb25Ja3hqVk1nSm5HQUtKMHdxenZQUWgrVmhwLzRT?=
 =?utf-8?B?cnAxZDJPRWw0NTd1clVsRGh6UmlwLzErUUlOdG1MOTJCbERtL0RxbnN1WGdO?=
 =?utf-8?B?Z3dnbk1kd1QrUHZYY0dTOFdybU96Z0kwWEdSbGJON05XeEtVNitER21IUWdF?=
 =?utf-8?B?Nzg4YXozUGFSVG5YeEpad0RBM3JjRXUzUis2dW5ndExKS2hMRy9Zb1k5RzUz?=
 =?utf-8?B?RFlNUDY4aXYrOTRYKytCcEpJZk5EVDAwZ25EV2ZGUURhLytDY2hGM1JCa0t4?=
 =?utf-8?B?QU5zbUVJUG9OSURYZ1g0d0xUTllDVzVKeE5JcmsweElvZmhuREFYMTBabG94?=
 =?utf-8?B?QTFvUWNOYmQ4M1ltSC9TUkVvWDRFbkJxWHBXVzRSdDNKWHErdXlaemxDSm9m?=
 =?utf-8?B?L1NQRDF1RmdBejlNS2JCWnBtQ1RvbkQ3TGdHcEd3ZGFUL2dmTzJSSXNXUXJh?=
 =?utf-8?B?NWlPalpNL1dPbVJaTlJhRXZFdW93eVFwTlREekpiYnhDQjV6by9JeERjd1Qy?=
 =?utf-8?B?UlArRk56UWRGKzk1cU5FVE9DODVDWjZsVm1KUnJLWXNCa3lKUDZlV2pJbVlQ?=
 =?utf-8?Q?gQIgfMmNbDVlt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUV6elVEUHQ4UytNN0hZZmd1bWw1VXAybVpDajVaalJ4YUszeVhiWmlqdWJS?=
 =?utf-8?B?WTZ3UU5RcDA2RHlhK3B3Q0E2WmhNSElkaHJPUW10MEx4UXRLaG1Wb2h5cU5z?=
 =?utf-8?B?cFVkWVBBQ2ptWW9XaktHQmZSbEgxS0pGSzBLdWdQenl2YW9oRzZ0RHFHaSt1?=
 =?utf-8?B?NDl5TFFlQ01zb2RjQkZuYWF6TWV0MzExd2lVQ1U5dXJjZWtJSUtNVWFxYjRB?=
 =?utf-8?B?OXZOenBJTGxRZjEvN0RDbTh3dXFublppTTlCbXFFRmxLK0JSYm5JRVoveEdp?=
 =?utf-8?B?T1daeHhPQkdiWnZWckdTbXZuNWZUUFlNL2pkMHZpVjdLMWl2NCtLWURYUjRS?=
 =?utf-8?B?clc2ZjlRKy9NZmQ0NitSQVJpenhNa292NGpvUDF4V2l0M0xNdzRsbVNiWDNz?=
 =?utf-8?B?NFNPUmpIQ29CSThXWXZvdnVCRkJ0cGlzM0VmZjBuaURyUHIwTzE5UjFHOTNw?=
 =?utf-8?B?VUVqT1dnNUk0Ulp3Y3Z6MmdUSEY1QWJPOWhac1pBbi9NWHI0SERnbU10S2Fj?=
 =?utf-8?B?akJ5Y3hoaVAyd20rWVFqbTFZNGRCMEpyZDRZSEJPRk5LTVFnd1pjR3BXQzEx?=
 =?utf-8?B?Y1NwMnRUQUd4UjdFN25CSTl3U2pYZE5CdGxxTVUyQVV2ZVc3SXBEb29yNDFH?=
 =?utf-8?B?RlR4SjdpWEJDdzhKREhZUEVONnoxaG03eHNETHRUaGNPYXNxUHBETkZ0MWhj?=
 =?utf-8?B?enRSZWpzZDBTUjZibHhZVE41VS9wa3d1M3I1RmhNNHRWemM2N1BMTkY0WExZ?=
 =?utf-8?B?MGdyakZEU3lQa1R6UmFmdE05V2JwbElWd3U3eUJ2bjh5MDNXWEtkOWhiVEp3?=
 =?utf-8?B?cmRaa3FsNVY0VVIyUGVjWG9yVHhQK1FwclhtSGdjdEREbXIzYnBmcUNZejdr?=
 =?utf-8?B?TWJncXBBbG5ZbnN6ZjNtKzN5VWJ4L09kbTNUSFk4NGtWMW1RYjhlVVhuQTFV?=
 =?utf-8?B?SEFnM093U3VFcEdJVHlsVkV3d045NDFnMzd5ZFI5UGhqV1VhSHc3Wm02UEVz?=
 =?utf-8?B?cS9xL0dlRitrRjVzKzEzZlhWVEZzdmQ4TGhURHFVSmFUbHpwZjQyTjB0TWY4?=
 =?utf-8?B?UW9VTzBiQjBTZG15SmUrSFZUMWU0L0lsOWtKS294VzNRbE50WXNFSFZaSWZF?=
 =?utf-8?B?LzduYUhLMHpPVmpqeTVuZGJoWUp1YmMwOW9jSjBHeXNRVXpyWFdtM3ZYYjcx?=
 =?utf-8?B?ODlnekx3RVRKMEhtYTZGNlZ4MmxudVpVbVRwQ21NbE4vQ3p1WXNKdXVKaVZG?=
 =?utf-8?B?N1VOL1k5WVVuVW1yanZRS3NXL1hZODJXR3lMc2M3OURYem9Sd2lmSmFVWHhZ?=
 =?utf-8?B?Z1Iwby9qMjhBRHNHcDhtUjE2WTJTbkxaL2xvQWJpSkFPSDVkWDhhTWZNYXp1?=
 =?utf-8?B?YmMvenMrVkFBMkp2bis1L2dyNXhvWjdYWlJEemlST1hCeEQwVTh3eHdHbVB6?=
 =?utf-8?B?VGp3ZXNYbks0d1BCV2JySFoybnROdU51Tnl5NGMxaXhiRENEV2x0dmRjZHh4?=
 =?utf-8?B?S2tibldqQldibDczRS9EYU9yTU5pRm9KMC9QSU9ZbWdxMkVPdVFyS3B3ekNu?=
 =?utf-8?B?ZVRFb3ZrV3pQb1NQaVMrMURtZ3dwZDYvc1FMOGorZTB6ZFplam9Sc2RnNVB5?=
 =?utf-8?B?ZUxkU3dDekdab1IvdnYvUkd3U3NPM3dzcFNBWmNlL1d4ZzBGWlUvZDYwc3J5?=
 =?utf-8?B?YXIwek4vbnRzMDRMblFRUjJrMTRvc1V4ZVYvbTlhMElLc3kzUXJLMDVWTk41?=
 =?utf-8?B?RHVvbGYyUUQ4SitFK212L2tBR0ZTalo1K1I1cEUrdTAwcGZzcW5UQTdxa2hD?=
 =?utf-8?B?bmVUcGkraWV2L0tHbkVYNmQ1d2x2K095a3EyZ1hEakJtUW00NEI2eGZ2M2lr?=
 =?utf-8?B?ZlBQbjlRTlllcjJ1Yy9Tb3RMaDNFYndsdlVYc0FFWnVvV0VOOG5xOG9CaHVo?=
 =?utf-8?B?SU5PcHlUMVk3Q3lLTGNQSk5OeGdwT24xRVZVVm1hb213K0hhdjNJYjRlYVNZ?=
 =?utf-8?B?dUZad3lPTE1ZaTJUS3lJdTRQUVYvTVE3d3JwQzIxeHUwT09yamtmVk9PdzNW?=
 =?utf-8?B?TEVJQ3ZIZGpiVWFUczdULy9MUmpLYzYxNjlHQmNKalVlZTkwemRZRFhsbUFy?=
 =?utf-8?B?RVpXWTNxRXRlM0Y4ODM4UnJUdVQvY0NrRkZ0RnVVL3BkbFBaN1lVak1IaG5v?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HmNdT2tDzFMantvF6ez+vjj7PWKBTM4Rd//6BSS3QgZ2vWFKyzry8HXIzjswU46yH43h1120f9Q7ll1VyDHGlTGCNAfJAY8vOty1sMVm2KfRP+UHKCgORTvL2B67LoBiH1gtbrLdq1dPkrYsJf7pD+iDtnlC5mkZ29F2KNT3w4x8LR5ABqDimgam39Jtrd47YomyBdhTZyuvxju2ZurHhUefNCop8U/L+7S5HWJL9RPcUL5/BPV5zgawd09s1xIYuhK/q3MeUFmuq36gkVaMujTJ5EsomzhXmrEXWmCJpqCT/Jl56iOaJVaP1uKhNomcSFW4WpE6K0MPTj4MW4IcSqucWKmXpKKNiYYcvwMkleNTcKU5VNNifYdunlo8UgXLAlojbZ4bbk3iw4EhDGhGSerELFiwXQzdMQceU2MKBTWoc+4XXnk6DbIY+gZJZ3uwoY1dVRpqlapR2heyW+OytoTlmCSd9RiCspSUEwDK6f530Gwjy8OnPorh+bpy7xGEYJb+uUInd12D2RwdUNQBZoWt03eIVWEw+riR6MxxQeouwXJjmbNv+txA7j6y9yKwBihGrxHwu0WLbDBx85LpxIkybcwK4neuxgApvyb8iJA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a43751-1ed7-4fe8-ea20-08dd55803bac
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 09:39:00.4609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/tkCV6ZtRMg2eZRXdd/Z7l5Fk8nJLjqq72VNVIMuLQUe3tNLhtXXgQm3bUmdTlTBbYhA/4tsAMHw1aO3sD6pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5164
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502250066
X-Proofpoint-GUID: DHBwCXwUh_3qICL4o9judRWzv3IRtz28
X-Proofpoint-ORIG-GUID: DHBwCXwUh_3qICL4o9judRWzv3IRtz28

On 25/02/2025 04:32, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
> 
>    drivers/scsi/scsi_debug.c
> 
> between commit:
> 
>    b7011929380d ("scsi: Switch to use hrtimer_setup()")
> 
> from the tip tree and commit:
> 
>    b441eafbd1eb ("scsi: scsi_debug: Simplify command handling")
> 
> from the scsi-mkp tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
static int sdebug_init_cmd_priv(struct Scsi_Host *shost, struct 
scsi_cmnd *cmd)
{
	struct sdebug_scsi_cmd *sdsc = scsi_cmd_priv(cmd);
	struct sdebug_defer *sd_dp = &sdsc->sd_dp;

	spin_lock_init(&sdsc->lock);
	hrtimer_setup(&sd_dp->hrt, sdebug_q_cmd_hrt_complete, CLOCK_MONOTONIC,
		      HRTIMER_MODE_REL_PINNED);
	sd_dp->hrt.function = sdebug_q_cmd_hrt_complete; ***
	INIT_WORK(&sd_dp->ew.work, sdebug_q_cmd_wq_complete);


I guess that setting sd_dp->hrt.function explicitly, at *** above, is 
not needed (as hrtimer_setup()) does this.

Thanks,
John

