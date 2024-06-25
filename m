Return-Path: <linux-next+bounces-2660-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AFD915DCA
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 06:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E15A1F228ED
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 04:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA2313C818;
	Tue, 25 Jun 2024 04:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Tn+HzTEm"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCED41EB3D;
	Tue, 25 Jun 2024 04:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719291135; cv=fail; b=tRcFX2YMfpUHOffDlSAIb82faZLzs65F3+0yO6sccxJc+81oEfc2y/yU8kJ8jy/bcY9S8ojQtbnHIjXs+3CuNHtVPCTYPXOG99Rt5Q4GCPNK+hl96E0HLGod72tJ0ddMLTbZEttLaGpG7wxYjuHLhSPqISv+HaP5kefNTHHroiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719291135; c=relaxed/simple;
	bh=M9sPgOd8e0zKyxjU7s/kWccRGqk5V2pWrD3wxznah5g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SGw2NP3DMHpBdxwmq5ZAbuWc874/YUTN+asVPIwssHLqgmLuIFY68tVZo/31MtKGCgXLFnuTh6j4jep4jpmxWmcVgkfXK3jMQeHCXGleuALrMvlw/S6Jds4cVG2suxHfOInx94R3ypu3eU5DaIO36+JikUSu40cW0R/6jZ3sKy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Tn+HzTEm; arc=fail smtp.client-ip=40.107.93.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWrnhyCyO8g7NOdhNAecJE1kkMlvlmRrcUcdvWt/JKxFKeUGQkJ8g2Ksv5o5N83Slc5vto7iHvdvVKhYFxJGXPppnHRgRCRKyb6VZmoZl0hkHiAh7/X9qilnN3VStuA3kH/VW/XNe6gYBXN2wB84DeK0on6gMhdl4pt4d+w9D4+VpmLESfv+jTQ1Fjr1o1bmM6arebdTgLDg6YhQaYc2cKVGvWmFwBqFEVTLwMSOeuIzgULAU7dpox8FjIGhG8nirCpXLkTgWYARepMheKJRcPvZe/4Evn2pPJdFt7InNbDyDtgFbvB/6GXi9se1043qPBaVGgG48J4a5T/W7siJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9sPgOd8e0zKyxjU7s/kWccRGqk5V2pWrD3wxznah5g=;
 b=gEq8y7pp/R5203S+5NhPqDoi78PlOQ90TVuW4i/blpgmpyMBUQGwpP79pZsAIaZeOMZyq3CPaOY1l/K7F636mnSmgCeLhV1l+3UySskHl35y577K5yRFNRR8CGS+DxdVMWoRUoBjQP9AyXhyUNnJYf/8hT1L8qTJStvr3yX1/JrhJnCIuP4DMWC+GKPt1op433zB8wc/rV0NmdC2di+XVxXqkvIaWD0eKadUBNiPUxFojfNiZOe2/ltyzU08jm75WiEQ8lXdxruKnmrWl9v9MBpx5Bady4ffdE82pK6hw84Brd7EC8OKHz5bBEeJmIwKijCPHAg5WCfXxGuAV9g0GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9sPgOd8e0zKyxjU7s/kWccRGqk5V2pWrD3wxznah5g=;
 b=Tn+HzTEmayB7veelxUSaome9ylsU1bsCrY6QO4lbZjd7eYM6TNX0Jwzo0ENAAXGx4GbcO0wH+86CEleKa1FmxqtAwhlFe9JoAmjF/21ey1T2CtmeqwX20ObMZCltv+qKaAdOaIYi+LDcQG4xHXwlQoSUxEdqjh9XQDFWkv3A6JA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DS7PR12MB8274.namprd12.prod.outlook.com (2603:10b6:8:da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 04:52:11 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::bc87:6c1b:cadb:67a]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::bc87:6c1b:cadb:67a%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 04:52:11 +0000
Message-ID: <537fe4d6-7778-9772-beff-e4a5c06f4016@amd.com>
Date: Tue, 25 Jun 2024 12:51:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
Cc: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, Xiaojian Du <Xiaojian.Du@amd.com>
References: <ZnmnqjCZ_dx0xXjw@sirena.org.uk>
 <db2165ae-2086-d60a-df31-dbf7711060ac@amd.com>
 <20240625042557.GBZnpG1S2p6X_7F-IY@fat_crate.local>
From: Xiaojian Du <xiaojidu@amd.com>
In-Reply-To: <20240625042557.GBZnpG1S2p6X_7F-IY@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:4:186::19) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5136:EE_|DS7PR12MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c75caf7-59a6-416c-3338-08dc94d292ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWpMWUJCMGRTUExYRFFncE53MVVubHhSalVlZVpJVnVDSzNxbFp2d1drUGNK?=
 =?utf-8?B?OWYrTXEvZmZKT0FXaXV1Q0xyQ3VlUDIyNnhhMWN5U0NFa0NQQnpzSFNkaGxv?=
 =?utf-8?B?T0I1VSs3dWFtNDhvd3dlWnZGMjk2Q2xYaG1OWXRIV0gvQ2J2ZEtHMUFGaU5F?=
 =?utf-8?B?c1BFdUt4OTFBSzhvWVBrTG9yNGI1VTliaGc5cGs4Q3FYV0hoQVVVZHcyeUxI?=
 =?utf-8?B?T011QkhlSm5xL0U0WmR0Y1pFemhnSGFQN3VjbHc4YUhjWlZEdnRKakdNcGZN?=
 =?utf-8?B?L1dHOWE1Nzh5eUxyTlZ0WlhNMUZwU3lyckJ3cmtaTGpBZ3g0NXlPOHdtNER6?=
 =?utf-8?B?TmFNVXlobjhOT3FucURBNXFJSWlXMnArYWJaVE9NRjJsbTBRZXJsZ2MvbU0z?=
 =?utf-8?B?NXMwTjJYQk82ZER0OFREMUZ5WHMyaVlZUFY2YStBRmFzVkd5RWhWcXN0RGMw?=
 =?utf-8?B?eDBjS3BpUW1DeWJUcjVGZVlSMEFKZWpmcnVKL2JCOWdRa2lsdlMwK29SSzFh?=
 =?utf-8?B?YWZMVExCZmZmWUZmV3hsSXZMQ0VzYXJCRDJSMHFZckpLcG5WVVJTOHRJY2xu?=
 =?utf-8?B?K3FZeVNVQXRJL1VlWGN6ZFFrYWZBS1d5WEZwWGo1RFpjNmJaV2p4U2tCWUFq?=
 =?utf-8?B?UXhGOW5rRERDd0NrTy9oU1M5MngwcTFmVGIvOVFkdFltWlV1eVEyYmQwdmdM?=
 =?utf-8?B?YnZzVjBzYnUwem5XUXV3TEVmcjljeHpTV0FqYjljRFNiTE56S084dlgxbHhs?=
 =?utf-8?B?czcxWXZMa2h2MWhreVFwV3U4L0RPbUJDWk02MEFUV3B4NTJib243OGdBUDZZ?=
 =?utf-8?B?NmlQU3cxSDBla0Jnb2toOC9ZYjlyNVdTaHFHaHkxdnc1WmRUYlh6WEZIUmdI?=
 =?utf-8?B?dW5IQUU3UUh0WGlEQnZ1MjUvMFBwbkV6RDNRMVRNaDNTUjdUWkp6blpnNjBq?=
 =?utf-8?B?RG5JWnJRL3R1eXRxd25KNVkxcllRVFF6MlhlbWNGVWRqaVZPMWp0eWdjMDVS?=
 =?utf-8?B?SDh1cjJrZnlwK0wzajdlam1VbGFqR1EvQmFjMCsrNno4SmpOSjF5ZzV2Q3Y3?=
 =?utf-8?B?QldFcGdmV3JIT3AvdkxaTWRra2dxUGhuTlVtYmxnOUttMFdwcDQ1MjF6MHA3?=
 =?utf-8?B?MXdzVmFrZU8xc0FPeXFOVXFrZU5HVTU5WllWWjhRc0pWTG1rSlZxa3hySjhh?=
 =?utf-8?B?V0IvU2F6UlA4TDlqQmh0RWdQSXBtSkc0UUpyV2ZOQUt5NElyZkQ1bW42T1Fl?=
 =?utf-8?B?YVBQNnpUY3d3M1NvelRoVTZFYlZmenRCbHd6ZEx4UTZxNGVzb2Y5dVlmTlpC?=
 =?utf-8?B?NXozUmJydUN6bTJrRHB0azUwY1IzeStXNjFDMWh6WkMvTDArai9IR0l0UXFR?=
 =?utf-8?B?bWtaQjZOL1l2ZzRSQnpIdjQ2NytNaTlJcHIzZk1hSXpMSXkvNkNaN2dGYjFs?=
 =?utf-8?B?cGJ0TkxQcGdnL1VDQ3FtYm9iSUF6V05LS1dqT1kzSEhWbW8xUFBhcjlzUDhZ?=
 =?utf-8?B?OEJURG5XUCsxaWoyQnZock9GOVZNSFFOSjV4dmMvTFhjbFUxYmRnTHhzeEdD?=
 =?utf-8?B?Snltdk1ZcllvZHdELzlOSjBZdlJadEw5TysyNUVDSW1QbjVoUWhTSmFqem1T?=
 =?utf-8?B?R2ExN3NBVEorT0lMcEppeXVpdnVMbnVrMEV2b0c5aWtsV0l0SmVtWG84bzFl?=
 =?utf-8?Q?0U+E8OEcE1IWMC5GLl30?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5136.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V284Ym5MY1hsRXNHKzFxZEtBOUt1V004aW5iM0RuMXVjM3JnV2MwSkQra2s5?=
 =?utf-8?B?TEpMVGFNekpzRWwzU1ZWLzV2cFRtbWNVNzBPbyt5U2pDbE90amFiSHA1azBM?=
 =?utf-8?B?NGZERnBMczhWS0xpbjdVUFZoYWhhS2ZZS09OZy81VWc3c2hHVHBuTmgvbFov?=
 =?utf-8?B?cWw2NUJ4ZUlwOXBRTzV0a21XcVFFTHZ5VE00aTVXQkxqWEdnZzJlS0pVZlUz?=
 =?utf-8?B?ZnFmeDRNUVlBRVE1MXAvYmRxQ2ZZVlFaUWRVenBLRzlmU09YLzM2ZTRFNWJI?=
 =?utf-8?B?MzRWbThlSWFkRXhMQlNJaURGazVjRmMxOXlGNFNnZm5kUDNxY2Q5MVRJT20z?=
 =?utf-8?B?Z0JHRkUvbEx6bVhReUdpYy9mNE9aalY5VlFSWEFrZCt4VFBoRWwyUGtEZklU?=
 =?utf-8?B?TXNXNW9mWjJiS0VjRlB1QkNVeXZ6ZUN2dGpmcnRsaG9JeVNrbG9qTUpxRzNK?=
 =?utf-8?B?WEk5TE1ka1lOVVQ5WUsvNkZsc1dFUk9jWVI2enp5aTFJQkhUNTkxd3p4Y2hD?=
 =?utf-8?B?NHNuTWYvdFoxMWxKUThuOFNLa3R3ekF4c1J1NllXSVJObDNjUXlqK3RhZ1A3?=
 =?utf-8?B?U3RFS2VOS1RPOHFrMDJLT0dES2lSaFNQQjhQTFB2L0dBcXdZTkQreFI5TUNS?=
 =?utf-8?B?TjlhRUFobmt6dWZQcUlXQ0pJblRzUGdnOHhJTkNnWmk3TlB0MEtIb3p2TGVt?=
 =?utf-8?B?Q1MxM2ZTbW9VQmdIQWpQSjRJMkRCZmpPR0hVcnIrREVzbVFVM2RXNm5KN0dW?=
 =?utf-8?B?M1QzZDZaZlRMVXZISXF3V3lNazFsTDN2RmJXVlVjVStPbjQyMTg1K2w5a0dM?=
 =?utf-8?B?ZmJvSTV6U0dxNVJDL0RWdHpxRHJRSDQ1c29pT0p6YnI1M0t2RHFYWVNHS3F5?=
 =?utf-8?B?RzdPY3cyRlQ5MEtoV1FNUW5zU2pSRUdpMzBDQ3Y2REFaSG1Dc0RhYmpjaFhs?=
 =?utf-8?B?SjhQQXFiRGhESVJYak14MEdQcXJjTWtLYTFNRUZ3Y2d5aDlhZ09qa3BhTUJp?=
 =?utf-8?B?VkMzTjBod1hXQ2ZOM3BvYXQ4WEtOZkUyRWEzRHBmNGF1VGp0REZPdGY1TU44?=
 =?utf-8?B?cFZNYkpBN0xIUlBSWXlDdEJseUcrcE01cnlMS0VrQkE2MTZCWHZvMDR5alpR?=
 =?utf-8?B?VHZ1Z0RSTVF4NFYrZ29OcUlKTWpqZHFFdkVhUmw2eWgxTC92ZzY1SndFc2w3?=
 =?utf-8?B?ck9zc1lwSUlLK1ZYS2cyZEZTdDRpZVptU2ZTOStrWUc4dmRVcWVYRStIc1Jn?=
 =?utf-8?B?Nm4rbmUvU1lwOWNweWljTjJjNnZMTjhjaU5kVm5DSW1PS2hoNEQ1aWdxc1Qr?=
 =?utf-8?B?Ulh2dVEwSnp0WUZVVmNLZHJGQ1lpcnlrUkZjUlF2OElLV1RuZ3JsSlFadDVo?=
 =?utf-8?B?Y1pkV3RQeVZGaG9FcXJ3Q1FNMk95K3k5aW1sR1hRWi9HOHd6MjJlTjBDVXI2?=
 =?utf-8?B?ZVV0YU96cUd4SnNTTS9VdHhYVmxHaStYUzkxTXdzeXJRck9aSnlncy90amtQ?=
 =?utf-8?B?VkR2TlB6MWE3ZDZkdU42T3o3RjhDSTByNXpVRm5Ia0pPeDJSTmxUeFY1MVor?=
 =?utf-8?B?STVja2FIMlg5cWkrVmZ3MXNGUnJlNGRPRWZvNGozdmp6TTU1b3orU0J5VWVq?=
 =?utf-8?B?b3hBVDdST1djUEpVb29HYWtDeks1TFprVmdLZzRQdU5aRVU1dTlyWDgyUGE1?=
 =?utf-8?B?ayt3WXpDWjdWRnhLNGc4K2xCWnZpV1VwUjRQbk5GL1NCUGc2OHlJR2R0MnRW?=
 =?utf-8?B?QzZBK09HcTZuT0pnTGh1K1I0M0o3dy9uYXo2MlhjNDdBRTZJUElvc25uVnEy?=
 =?utf-8?B?RUZsRndhVkNsV2ErdzFUQWxUZnhCTnJsYjFpTGJyeWdzN0hma3hBZDAydWtM?=
 =?utf-8?B?a0lQSW1VWCt2anNwMjY5dzhES01jNlhRNklqeDkxVHFha09vVVdmVkdJNWRr?=
 =?utf-8?B?RE4xWFZ2dVpERXFMQy9jSXFlcXBLVFYzSHhqUUZybUoxS28vWk44TlFyQXBr?=
 =?utf-8?B?T2MrVm1ZNUJ3R3BMV3VUejJqcmI2ZXdMbWFsWHhvM3lrK1R1YWt0YlFoZWgr?=
 =?utf-8?B?MFRUa2FOOE1sZHNJanNvYlc1WFV4czRsRHlWSVFoT1BWc254MjlDcFBwSEhm?=
 =?utf-8?Q?LEdGb2v1EEr1U21fW0rvT6PpA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c75caf7-59a6-416c-3338-08dc94d292ee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 04:52:11.2102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28d5hsaM1R4XthPZL7WfvkccPIG7L1Q9WKR0PcHCUj0G1gIs+Og5yNYYbiLej/amc0sGMp0heJ/Us8FOh46Lsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8274

Thanks for Borislav's comment.
Didn't check the recent change in "cpufeatures.h".

On 2024/6/25 12:25, Borislav Petkov wrote:
> On Tue, Jun 25, 2024 at 11:00:26AM +0800, Xiaojian Du wrote:
>> But it is better to hide this new flag "Fast CPPC", prefer to use " /* ""
>> AMD Fast CPPC */ ".
>> Not expected that "CPPC" and "Fast CPPC" are listed to user at the same
>> time, it will cause confusion.
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=x86/cpu&id=78ce84b9e0a54a0c91a7449f321c1f852c0cd3fc
>

