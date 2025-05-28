Return-Path: <linux-next+bounces-6963-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDF3AC6B81
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 16:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2710D3B30B2
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 14:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014D128850B;
	Wed, 28 May 2025 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mSMSB54D"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2074.outbound.protection.outlook.com [40.107.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FBD28642C;
	Wed, 28 May 2025 14:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441684; cv=fail; b=DMwTXzce0HrDTCoDrG9U8ZnYhBLkh/kVKTMXU07UMd3++hXS3VeRq0UpgF6CyHTWsGNr1adVng1/5O4qbzLvu9KWt/YsjdOT59RZCHKyI5hLlXevW3zl/1D2Wgnl56ypDEFsk6XiZJKygPFlhYewDYzflsQqmwTF67ND6YGp+as=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441684; c=relaxed/simple;
	bh=1mVYw4VdZ+IQsddrTcXUFjuyJlyJXzLXDB/tny971ck=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Mxnz8v2FBeBzrG8Mr4jTz1lME4pP8VNqtXqAavViZHg8exZizPpQp+PpBRerIog/KpFrrLh6GOWmlm9wYDZ4a60+X4NURNAJfXxKom8kpd8FbUAYQ3LwToHjli6bLpRTyNsy8WRN+w9YmkHZdNoLFuElDebOPAh4D2DuNyNBv8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mSMSB54D; arc=fail smtp.client-ip=40.107.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhPmp5UbXbbzgrqHtCxVzyTfEceah1JDtmNM9k79GVKeRY3Ez6M2xP/37d9UySBwkqI3BTujOF7Xkg20Z4z+IBAgGo5sYfiKJgJ4rsGJM4qlMxtY2cEmmqqVgkBHfrNQd+RsfeTphbZ2+ex09tPKjlegAOtApB/QRMSUxJTphvxe0MUZ0fty/4J4ZaowrtLBSJwchF1rY+4LNfyjpA6xsoKdbY+nmtcZfOsmTpKIu0l0RHAWLZobTO87AGWIar1XKvx7GPQk9097j0rLrUMmTQGl40T8ltKIj6SRXj090DWPOnTJrULqSCzDXvNxcPIAsjFym3brTrLTKDt00kTKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mVYw4VdZ+IQsddrTcXUFjuyJlyJXzLXDB/tny971ck=;
 b=YuqWvC6yi+eOzNKMZ+TmuekNf6uKdu+dwWNi0anO5HlA41WXMmK0uqCqdwFcO/2usoiCg1cVBbkhiBq0MtC9BT0XdYQBMtSQqKCFTuCb2tQNohvNzIfKsxoTuGoPWMFNwEE3HiDBGWOdlK7jnwvobnKGDZYK+qlvCf8XG/MbDgDGjfpkiW2mgj/x8Ta4GIk+H3CW/tjsoIz+PDTJXd+OKF73PK/xWwZHfgCEDoTtUutQnwuNw4vc5S6uqsIsWqJ2UgrANX50sLGnjrTFsTzopQqhMP4aOYtCHVTgD0plWSyf98vJAw1n93rq8fjSqFa1/w+SvG+KtDI5ndRU891vXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mVYw4VdZ+IQsddrTcXUFjuyJlyJXzLXDB/tny971ck=;
 b=mSMSB54DHUUiLdyeVyViDVwi1k83TBUggD8DLxkvlXT9d3NxRXkIBIIK68AkhTxFQ5ivIEmBQ+F4jjJnjzmMdYZ7SLhtLt16fp1R6+Y9ge1VoRfYX4Vt5iCMo8s2W02vancjXU/5MpVgG3tmkEWxbrjUbE1ul+g3p4JQvWB5o9M=
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 CY3PR12MB9606.namprd12.prod.outlook.com (2603:10b6:930:102::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 14:14:40 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%6]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 14:14:40 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Rafael J. Wysocki"
	<rjw@rjwysocki.net>, Ingo Molnar <mingo@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>, "Ugwekar, Dhananjay"
	<Dhananjay.Ugwekar@amd.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Thread-Topic: linux-next: manual merge of the tip tree with the pm tree
Thread-Index: AQHbwvoUOif/c+EZnkiNnTIGpgFimLPOdgUAgBkLSgCAAK5vgA==
Date: Wed, 28 May 2025 14:14:40 +0000
Message-ID: <45b82a09-07a4-4bbd-a71c-d86010542dfe@amd.com>
References: <20250512145517.6e0666e3@canb.auug.org.au>
 <20250512152326.3f2f0226@canb.auug.org.au>
 <20250528135020.79fec9ca@canb.auug.org.au>
In-Reply-To: <20250528135020.79fec9ca@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6095:EE_|CY3PR12MB9606:EE_
x-ms-office365-filtering-correlation-id: 0e18d9ce-4593-449d-6751-08dd9df1fc3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1Mxc2sxc2Zlc2FtUkpHVzFHMWlHQlV0cGlKamZNTXFkdXJUYWY0aGx2ZVU1?=
 =?utf-8?B?RGVKRjQ0V1pvaTJSUGduMHdBdkw1R3RpZTgza3o2MWtyTXlqSDhFUGNyRFdj?=
 =?utf-8?B?V1h2U1ZvanNEZis2NHFaMGs3ZXdSN3hzWmlBRUEvNVVNaG9QL21yNHJ3aTh5?=
 =?utf-8?B?UDBiM3FqQVlBRWl1MjRZeHFDd1RlanFMZ1dtWWhJS0pnTHBuSzRROVN6aHJi?=
 =?utf-8?B?akRUU0QwYjhLbVBPRDdyeG5aNGE0WTlsOVpJbVVYRERzQ0EvUmRpSTFmYnNH?=
 =?utf-8?B?SFRycE5SajZWcHBIL1hVYitTTjFxcGZrL1IvdGRyeCsrQlZmZWM3V1Rld1g3?=
 =?utf-8?B?WkFNN3A5eE9SeVRGdHFKRmlybnVYcHlFMVZyWlQzc1VkRFVnTFMxTXBpSFpu?=
 =?utf-8?B?MWJpQ2w3WFhoVWtOT0VDa1ZTaGcxQXorWkJDcXAxQlBVaHdCWk5LK3FGSm8w?=
 =?utf-8?B?SGN4RURjZzlaTERaeTV0cGZDQ0g1VkxLMmQyRGVtRFVMLzZ2ckVrdVNkQWNL?=
 =?utf-8?B?ZnVHSk0yZlFDTldIUXljenhKM2VmeUNsZERsRGJ0a01mbSs5bTd2WnlSTFJR?=
 =?utf-8?B?YS9RMHI4cWN1V3FNbU5ZbTBIRVFBeXI4MXRsYUlSbG1uRm50U3hob0dpWFE3?=
 =?utf-8?B?VzBBOVU1N3FOWmI5ZUUwaFNra2Z0anlzNkxUazg5T3c1OFh6QVFmd2tBYUlV?=
 =?utf-8?B?TFI2NEFNL0REcW05V0tWbnE1aWZpdDZXQUN2b1hIcGRRVjhVUUdxNE9iQUFh?=
 =?utf-8?B?SngwTFlmUjJnUEJWRlo3YVozZzg4VlRxUkxTL0N1UGhWeHNwQlBBaldjd0Uv?=
 =?utf-8?B?SVZUNGIvbTBORWlzajJoNlBBWHJIVjZlRlg3S3hmdzJxOUZZSW5xMW8zV2Nl?=
 =?utf-8?B?WG5hT2VTdmZmRnVwZmRFNWRvVDBldUxQWVJGYWFwMXJvdmlLQ0dBUzlGVERh?=
 =?utf-8?B?U25zMGRvL2ZtQW9IU2R6OGJVeW5mK1ZYbU50NzluMklmakU5RlBPQy94aDg5?=
 =?utf-8?B?bVkvZkxIeVVLN1BoMDIwSEZUWUhPUytha3BqY1NyQjY1UngzRkd4Snk3cnZq?=
 =?utf-8?B?aEZ2U28vWG9PaCsySTc1a0ZybUtnRTlpenprYzlzMUlvcnR0UFBBLzN3U3Ra?=
 =?utf-8?B?ajNvTFBXVi80L1NIRVpON2wvSUtRR05GcmUzZnFNY09wd0pjRVFDM2ttdWs5?=
 =?utf-8?B?NEs5TTRuN1F3Y29pbEVqRzBiNHEvcXh4eVF5Y0VmWE5FeXIvWGZSelM5ZTlH?=
 =?utf-8?B?a2VISWNvcnJ3RmpPUThFM3VWS3NUV21IWTlPYi96c0h1aEtReVQzRmlPeFpN?=
 =?utf-8?B?T1Vxdy83Q0k5ZmxuYkRNSjhsNlZHZzRIaGFhUWpBbnVXQW9tMFA5ZkltTzFZ?=
 =?utf-8?B?SXZ0dTRoc0tnbHFHSElrMm9KSjVLR2gvQmh3aG1TV3E5TE16cEhKdWtBYUdh?=
 =?utf-8?B?WUcxdkk2NDFIUTlBUnhnM0Q5cXd0UHlJME94VTJrREtSYUZldWdVMWtRMkI0?=
 =?utf-8?B?MkRFdTVhYXptS1JZUkRBNkFsN1E2Z1dBclVhSmNWUXh6WjR6ME4yR2cwRTZP?=
 =?utf-8?B?eFhHUHlNdU1HSFpXWjBsRFlkYnJhb0lKdkpNZVF3MXZETWNLZHhGSG1ITzZP?=
 =?utf-8?B?R1hPaFNZOE1EUW5hU3IzSFlSVEh2N29yeDdBM0o3MzNQc1FJNDJ2SVhrMVVR?=
 =?utf-8?B?OGRUaTg5aVNTZ3QrZ3p3UzRrWUE2S0FUMElNNytXMGJRTVF6OGgxcUdlcGc0?=
 =?utf-8?B?WXpFZjVCdDRTYUVrK0xTS0xBNUdPWDhjVDl5dGxOZDRpdHhUMUd1NzF6S3dh?=
 =?utf-8?B?VXJoUnZyQ2ZhejlYUG92V1ROMmhuSHB0WXVPeFVWNzR3RWkxSXd2M3NsSGZB?=
 =?utf-8?B?LzNlRFV5aGRjOGZCdmw5MTdvWjVoNTNyVnpRVnBodUJ2RGowbzR2Y04yck5O?=
 =?utf-8?B?c2o1bGN4SzZVbGhpREtRSVZqR0JmeGhqRlJkRS82SnRkMHRyQnFqZXVGbnZK?=
 =?utf-8?Q?PzodFdDzhr0x7+RAUfAOaA6EvrJavA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHhLTlRkWFRzMXJ0TloxekNnRjIwRGdsb0JsYVRzWEo2VGRGaWNlS2Z0VXFx?=
 =?utf-8?B?UjdlSkhub3V4SUQyUWJJTkwxQnJqT0NoUVpCK1F5Z1crNU04cjZCUzdLUmJX?=
 =?utf-8?B?VWFDOFp0d2pHWnZYenY1STU3WXlwcmRsLzZyRXRueUozd0hIMWtsSlZhQ2M3?=
 =?utf-8?B?MTcvTHJ2b1ptb0pUS05xaFZBbGRHcUMrU1FIOVJEblRveEhsTHBta3g5ckRn?=
 =?utf-8?B?VDB2SHpYNUgxMWVqam9PZmoxWGRPeXdQcTBiSTU0RjRUOU92YUNZTWhFV1Jo?=
 =?utf-8?B?RHR2RVNHMXhxYVJHNjBpZWxaRVk2VlF6WElSdEpDVkRIY2kvNlNJR1NPMWVM?=
 =?utf-8?B?ZElPZGdDWjJhRFY5VjhLeGhwRkVuZkQ2QTVLSUpxSnVFaHpRNjNid2QzeFNN?=
 =?utf-8?B?N2tpZTNrNXN4bXg2Kzcxbld4d0U5QkZEaDRFVTd3c29KSTdnUCsrczlqNzZI?=
 =?utf-8?B?Z1RMK0I1NFl4OGRITnMwN0ZFSjVmMHhvU1ZlR1pKV2g4d3NRSWxIbWFrdHVw?=
 =?utf-8?B?QTI5cERvWnFTTnpRemdWTGxXOVQvK2J1U2RXZlMvK0ZkODd6Y09raEVWUUg2?=
 =?utf-8?B?TkNCTSthVVQ3M2tDa0MzeDVuenFmTktMQ1F6WExLMmRpRVhvTHEzaHloWWJz?=
 =?utf-8?B?MmdlNGhBTGx6NFVlUlppcTdYYlhwZC9lTlpPRWk2ZmZ5Y2V3bTZQazUvZHRP?=
 =?utf-8?B?dHU4ODNsNExwUVQvRUxjL2N4aTVKQnZ6OU1vQ3BhRXBTSmJKMXBlVGtDWXRz?=
 =?utf-8?B?Mkp6bGRmalBFVTZLelZNd0pFU294MzhsNUdLRnRDZENtRWxPQ0hFcUlFa2E3?=
 =?utf-8?B?dlZRSWpST3dQQ3NEeVplTWwyV0M4alNZb3NTQWNSeWo4c01RZ2ZTVVRWWXRh?=
 =?utf-8?B?bDRnSEQrWTBPVGdxTUp3M1dzREF6c3VxUFZmWHg1eFI0aDkwZDlCd1lmZzlr?=
 =?utf-8?B?R3N1MDRjME1YYVVHWktFUlowL1Q3R0VLdmVVVzYwV1p0Smk3R2lSbnI4S3gz?=
 =?utf-8?B?dk1CVWdrVGNteVJDbEROWEUrWHJ4cTd3ajhCQkQvcEFGRHdWcnlPZXNDNTJh?=
 =?utf-8?B?bTNzcGJVTis5ODQwd0toSE1yVVF4d0ZqRDh3VUZEcVlsN2cvTzl0cFJsNXFo?=
 =?utf-8?B?VGw1R0xoWDliR29wMmo1ckdaT2p5bTE1YndpRWZNRU83RXhCSXBYZTVwZWMv?=
 =?utf-8?B?cWZ2N1hVT0ZTakJsUkhwN01zRFpOcTRJNGg3NE1FVVM4U3krU2lNRUVoNjF0?=
 =?utf-8?B?K3UvMkZOUlZRZUN0ZzNzeUM0d3ZhOHNlY2ljTU5ZVmo5QUQ2cnpLWGNYT3Zt?=
 =?utf-8?B?U21wbXlNd1paby9DdWZqcmlYUFZzTjBMU3JWeWJseXR6dkRZdEkvRzh3Nng5?=
 =?utf-8?B?MVZLNmE4Tld4Vy8ybDI3WVB5V2dTKzkrSlBYa3AySk1SWFd3TFUxOG02UWw4?=
 =?utf-8?B?S0xwTFhUTE1sdWg0UzBGQ3ZsYnFYR2JGbVFyYlIyeEdoVDhja1V2d0pXUkJR?=
 =?utf-8?B?eGRVZnUvV0RqZlN5VGR6eVV1UnNEU3hvS2dqNWVTL0pTczRpS3N1a2czRTUw?=
 =?utf-8?B?V1ZZQmVxaFhQNUM5VTdCcURPUTd1UHRjOFRXQXVZMzJLVjZkaUtrOWkzMVAw?=
 =?utf-8?B?cDJ2YzdQRGF6dVBiMXBBV09tak05OElRejZ4R3VDekl6UllXdWlQdDIrMC9D?=
 =?utf-8?B?c3NnMUIwZ25YQ00yS1locjJFV09VQTVlWk00YW1tbktrTElWZitqeGNSb3dl?=
 =?utf-8?B?Y3VYUG9WVVpyMWc5Sm81eUZuNnNnUmNER0l6TWNaeEMxRVVQWXZUUTV3b1dI?=
 =?utf-8?B?bVhvTDhSYjVUa0NhYk5yK1RROFJsTk5NRzJBdjVOd3FYSEw4b0VSd0dwLzBl?=
 =?utf-8?B?L2J1L0dXc3NyYWxMMThaemhFcFR6Wm5KejkvTUhZaGNlbFU5SDVrWE9xNDRy?=
 =?utf-8?B?emNIZHhick1zMHJxR3QwVFJ2VTlLM3hpL0hUMktWRjJBWW1walA0WVlURU5o?=
 =?utf-8?B?Sm1aTXU1QldxdkhHVHArcjBCSTAxK1hHQWRWYVVPMjVMTFZ5Y1JkM3dQZzRs?=
 =?utf-8?B?UzFvSzRNc1pWVkpRTEFTS1BPWGhJRDl1dnZseEgyNUtuYkZabDVCc0J1L29P?=
 =?utf-8?Q?+qJ4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC968EA40821924FBB41BA76663B375D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e18d9ce-4593-449d-6751-08dd9df1fc3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 14:14:40.0953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ScStfpNMjW0hgjdCo3/i9HeZSGcAIfaQhCWtR8QoMzcgmVWcBG9geVkUNLf9HhKvENbDyndhtj06AdGwXVLoqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9606

T24gNS8yNy8yNSAyMjo1MCwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToNCj4gSGkgYWxsLA0KPiAN
Cj4gT24gTW9uLCAxMiBNYXkgMjAyNSAxNToyMzoyNiArMTAwMCBTdGVwaGVuIFJvdGh3ZWxsIDxz
ZnJAY2FuYi5hdXVnLm9yZy5hdT4gd3JvdGU6DQo+Pg0KPj4gT24gTW9uLCAxMiBNYXkgMjAyNSAx
NDo1NToxNyArMTAwMCBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4gd3Jv
dGU6DQo+Pj4NCj4+PiBUb2RheSdzIGxpbnV4LW5leHQgbWVyZ2Ugb2YgdGhlIHRpcCB0cmVlIGdv
dCBhIGNvbmZsaWN0IGluOg0KPj4+DQo+Pj4gICAgZHJpdmVycy9jcHVmcmVxL2FtZC1wc3RhdGUu
Yw0KPj4+DQo+Pj4gYmV0d2VlbiBjb21taXQ6DQo+Pj4NCj4+PiAgICA2MDhhNzZiNjUyODggKCJj
cHVmcmVxL2FtZC1wc3RhdGU6IEFkZCBzdXBwb3J0IGZvciB0aGUgIlJlcXVlc3RlZCBDUFUgTWlu
IGZyZXF1ZW5jeSIgQklPUyBvcHRpb24iKQ0KPj4+DQo+Pj4gZnJvbSB0aGUgcG0gdHJlZSBhbmQg
Y29tbWl0Og0KPj4+DQo+Pj4gICAgZDc0ODRiYWJkMmM0ICgieDg2L21zcjogUmVuYW1lICdyZG1z
cmxfb25fY3B1KCknIHRvICdyZG1zcnFfb25fY3B1KCknIikNCj4+Pg0KPj4+IGZyb20gdGhlIHRp
cCB0cmVlLg0KPj4+DQo+Pj4gSSBmaXhlZCBpdCB1cCAodGhlIGZvcm1lciByZW1vdmVkIGEgbGlu
ZSB1cGRhdGVkIGJ5IHRoZSBsYXR0ZXIpIGFuZCBjYW4NCj4+PiBjYXJyeSB0aGUgZml4IGFzIG5l
Y2Vzc2FyeS4gVGhpcyBpcyBub3cgZml4ZWQgYXMgZmFyIGFzIGxpbnV4LW5leHQgaXMNCj4+PiBj
b25jZXJuZWQsIGJ1dCBhbnkgbm9uIHRyaXZpYWwgY29uZmxpY3RzIHNob3VsZCBiZSBtZW50aW9u
ZWQgdG8geW91cg0KPj4+IHVwc3RyZWFtIG1haW50YWluZXIgd2hlbiB5b3VyIHRyZWUgaXMgc3Vi
bWl0dGVkIGZvciBtZXJnaW5nLiAgWW91IG1heQ0KPj4+IGFsc28gd2FudCB0byBjb25zaWRlciBj
b29wZXJhdGluZyB3aXRoIHRoZSBtYWludGFpbmVyIG9mIHRoZSBjb25mbGljdGluZw0KPj4+IHRy
ZWUgdG8gbWluaW1pc2UgYW55IHBhcnRpY3VsYXJseSBjb21wbGV4IGNvbmZsaWN0cy4NCj4+DQo+
PiBBY3R1YWxseSBpdCBuZWVkZWQgdGhlIGZpeCB1cCBiZWxvdy4NCj4+DQo+Pg0KPj4gZGlmZiAt
LWNjIGRyaXZlcnMvY3B1ZnJlcS9hbWQtcHN0YXRlLmMNCj4+IGluZGV4IGQ5NmJiM2UyMDJlZSw2
NmZkYzc0ZjEzZWYuLjBkNGMwZGU4OWEwMA0KPj4gLS0tIGEvZHJpdmVycy9jcHVmcmVxL2FtZC1w
c3RhdGUuYw0KPj4gKysrIGIvZHJpdmVycy9jcHVmcmVxL2FtZC1wc3RhdGUuYw0KPj4gQEBAIC0z
ODksMTAgLTM4OSw5ICszODksMTAgQEBAIHN0YXRpYyBpbmxpbmUgaW50IGFtZF9wc3RhdGVfY3Bw
Y19lbmFibA0KPj4gICAgc3RhdGljIGludCBtc3JfaW5pdF9wZXJmKHN0cnVjdCBhbWRfY3B1ZGF0
YSAqY3B1ZGF0YSkNCj4+ICAgIHsNCj4+ICAgIAl1bmlvbiBwZXJmX2NhY2hlZCBwZXJmID0gUkVB
RF9PTkNFKGNwdWRhdGEtPnBlcmYpOw0KPj4gICAtCXU2NCBjYXAxLCBudW1lcmF0b3I7DQo+PiAg
ICsJdTY0IGNhcDEsIG51bWVyYXRvciwgY3BwY19yZXE7DQo+PiAgICsJdTggbWluX3BlcmY7DQo+
PiAgICANCj4+IC0gCWludCByZXQgPSByZG1zcmxfc2FmZV9vbl9jcHUoY3B1ZGF0YS0+Y3B1LCBN
U1JfQU1EX0NQUENfQ0FQMSwNCj4+ICsgCWludCByZXQgPSByZG1zcnFfc2FmZV9vbl9jcHUoY3B1
ZGF0YS0+Y3B1LCBNU1JfQU1EX0NQUENfQ0FQMSwNCj4+ICAgIAkJCQkgICAgICZjYXAxKTsNCj4+
ICAgIAlpZiAocmV0KQ0KPj4gICAgCQlyZXR1cm4gcmV0Ow0KPj4gQEBAIC00MDEsMjIgLTQwMCw2
ICs0MDEsMjIgQEBADQo+PiAgICAJaWYgKHJldCkNCj4+ICAgIAkJcmV0dXJuIHJldDsNCj4+ICAg
IA0KPj4gLSAJcmV0ID0gcmRtc3JsX29uX2NwdShjcHVkYXRhLT5jcHUsIE1TUl9BTURfQ1BQQ19S
RVEsICZjcHBjX3JlcSk7DQo+PiArKwlyZXQgPSByZG1zcnFfb25fY3B1KGNwdWRhdGEtPmNwdSwg
TVNSX0FNRF9DUFBDX1JFUSwgJmNwcGNfcmVxKTsNCj4+ICAgKwlpZiAocmV0KQ0KPj4gICArCQly
ZXR1cm4gcmV0Ow0KPj4gICArDQo+PiAgICsJV1JJVEVfT05DRShjcHVkYXRhLT5jcHBjX3JlcV9j
YWNoZWQsIGNwcGNfcmVxKTsNCj4+ICAgKwltaW5fcGVyZiA9IEZJRUxEX0dFVChBTURfQ1BQQ19N
SU5fUEVSRl9NQVNLLCBjcHBjX3JlcSk7DQo+PiAgICsNCj4+ICAgKwkvKg0KPj4gICArCSAqIENs
ZWFyIG91dCB0aGUgbWluX3BlcmYgcGFydCB0byBjaGVjayBpZiB0aGUgcmVzdCBvZiB0aGUgTVNS
IGlzIDAsIGlmIHllcywgdGhpcyBpcyBhbg0KPj4gICArCSAqIGluZGljYXRpb24gdGhhdCB0aGUg
bWluX3BlcmYgdmFsdWUgaXMgdGhlIG9uZSBzcGVjaWZpZWQgdGhyb3VnaCB0aGUgQklPUyBvcHRp
b24NCj4+ICAgKwkgKi8NCj4+ICAgKwljcHBjX3JlcSAmPSB+KEFNRF9DUFBDX01JTl9QRVJGX01B
U0spOw0KPj4gICArDQo+PiAgICsJaWYgKCFjcHBjX3JlcSkNCj4+ICAgKwkJcGVyZi5iaW9zX21p
bl9wZXJmID0gbWluX3BlcmY7DQo+PiAgICsNCj4+ICAgIAlwZXJmLmhpZ2hlc3RfcGVyZiA9IG51
bWVyYXRvcjsNCj4+ICAgIAlwZXJmLm1heF9saW1pdF9wZXJmID0gbnVtZXJhdG9yOw0KPj4gICAg
CXBlcmYubWluX2xpbWl0X3BlcmYgPSBGSUVMRF9HRVQoQU1EX0NQUENfTE9XRVNUX1BFUkZfTUFT
SywgY2FwMSk7DQo+IA0KPiBUaGlzIGlzIG5vdyBhIGNvbmZsaWN0IGJldHdlZW4gdGhlIHBtIHRy
ZWUgYW5kIExpbnVzJyB0cmVlLg0KPiANCg0KSSB0aG91Z2h0IHRoYXQgSW5nbyBhZGRlZCBhbiBl
eHRyYSAjZGVmaW5lIGZvciBjb21wYXRpYmlsaXR5Pw0KDQo=

