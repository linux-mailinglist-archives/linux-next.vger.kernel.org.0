Return-Path: <linux-next+bounces-6026-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2EBA723F3
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 23:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 007AF1786B7
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 22:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897061A76AE;
	Wed, 26 Mar 2025 22:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LGSNiuPB"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDCD4430;
	Wed, 26 Mar 2025 22:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743028244; cv=fail; b=bSfPgHml1kO7HKgk0o0JMBMdEDUtI+YJyfZevS3mTeHOYUhgluliS6yxWT+0af713HzZU4Lv1/kE7CDcqqzUVaHCVdUhNy+lT8BX+KfwLN0tih+z09HTCQppLsGJOFx+guWa2H8IAUStMEL8X3U6vI5/fo70ARpBgeGL9HWU6Z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743028244; c=relaxed/simple;
	bh=MkUAV3NoRiDBjEQpz1bHAkvZs86XKWiOmxagGQWuzW0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BNf2kSHx8TZ0UJUczEuk7Tt7NXogxGt4v8J2pcFAZk1eX9oGeFTxBOwv5YoBGwSjbPCwAJCNhfHYW1ULNGYyuZlPd2y8ABM7xEYQeV5wQmBUky4rckxsX3dOqc3sde8nDM6UL6JsimGDIyTBH95IBu2u5scEKEoNFR5M0CaGyZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LGSNiuPB; arc=fail smtp.client-ip=40.107.102.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5egB1gHw0/Nv7vtzvU5yyPZkklUT6SSm1lF5LUb5E53bFQ0EPVoOEN4UieLwGpPpj8/E3RabjgRm9ihgSMpIs3RUEFh22kiDyjhRoMCxgFivm/V5jWBp/UpMgvKzF7gU1lbPdk+q53upiaAhF1rzGKyXy/B0e6J8La/k3p2jEoYYAXS6N/UDu4G5ryNjBhovqcnLupxMzioD8RjNayPVvsivFah28HIgSrdlOat8BcYDTg21k+P9ehMtgJz/Zp4q18p2amYSsNWdjVFy4ypdCMPXjXQ2Kwofnnl2u0Ivz0w2kplq0Jkwjp1BbG0JUMhe6kYrpkIRuR7YdmKi/CZ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SUkR+NafxWfOyUfRWinyXvSZUSUP6AEsLumCb2HKmU=;
 b=R9d9AvfEiMZRFekewwMhfr31MR/LeTP47Fcj5YzjgJqPbDOWuuhen1jqha81h1t7zaGcWPnRTpNiSc+wkM66w8kEL7JCEf40qWbBv/ht5vG5WP8281H+DNpOIb5zfMo3tYU57Evoik1gACPwx9olJoC7SkbOfYPwLDJ1fX6SmjzCfsjWIXphnxD+795umYvnJWtf+Si/8DcImSnEjiaPGPJ2trgOfuSXElcUD/p7S77FriN5mdRJTOkAs87+XzYfIgZTagrnILAeayn+MIZiR1EOnu7f4ija+c6mXHSL2yO943jh+nUeLEjhWDRdWaBnbg+NXnVrhgoDX7nLKR3F/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SUkR+NafxWfOyUfRWinyXvSZUSUP6AEsLumCb2HKmU=;
 b=LGSNiuPBj7zq+hcPofpxJLOLSxVsjRfDY9aLkRkx6FbXJzXJMCLm00X6PGc3IIwWjKNjFhGqZEquvaZLn4jr5bCev9yNpg1l1AHJ8nHi9AZhXP+DxD7tm/VQ+mMc/cZaqndtoYLSq3iqdibjEde9kcb8XTu1SeIpD8qc18dRIII=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by MN0PR12MB6344.namprd12.prod.outlook.com (2603:10b6:208:3d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 22:30:39 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 22:30:39 +0000
Message-ID: <08981771-39ac-af66-e2ec-e8f9bf6aed0a@amd.com>
Date: Wed, 26 Mar 2025 17:30:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Aithal, Srikanth" <sraithal@amd.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Roth, Michael" <Michael.Roth@amd.com>
References: <363f8293-23e3-44d3-8005-b31eb5b7f975@amd.com>
 <rar5bkfy7iplfhitsbna3b2dmxbk7nunlaiclwars6kffdetl4@lzm7iualliua>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <rar5bkfy7iplfhitsbna3b2dmxbk7nunlaiclwars6kffdetl4@lzm7iualliua>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0192.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::13) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|MN0PR12MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: e3173169-84aa-4877-69e1-08dd6cb5d615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFFCK0tWUGxOYk1Vc0xWbFd0OU9RMWFTNTVIakdhVEcvVTlUNFpTaXUrSmdq?=
 =?utf-8?B?ZXVSUTBQSERpN1BJclBXcGhkd041NStRaEV1dGlmenlHN2psR0ZKUWdROUhX?=
 =?utf-8?B?Wmt1Z053Tk11Nk5JUmhJSHFPRGFhSE9OZWJPSGRMMFNobjVCTDlNNHEyMm9q?=
 =?utf-8?B?bUkwTm8rc01OSVRnTGFwWWRRVk1iWXVlVk5TR2I1b21SRTgvRGpmTnFwWHJm?=
 =?utf-8?B?RjZseVVFZGtabWRSbDZqaXhRMk9LQi9PUzhxTlArcEFUemprS0diUFNsSFZp?=
 =?utf-8?B?TDBLcnd6VWZiMTVTYUIxeVlLNVBqY0hXTkN4bjA2dTZNaThWWXMyNnB3Y3N5?=
 =?utf-8?B?cDAra3FKeXI5NFJvMlQ5dkJPVzNxejFXTTQ5aHg3T3hyV2tIZkpMaERoSTFp?=
 =?utf-8?B?cDhSc29hS0VHSWxya2Vqd2lmTThsOTNOdk8wdHZ4OXJ0SWtxbzRzZXg2UlVF?=
 =?utf-8?B?NFJsSlNxdXdENWNpRUJiR2xQdHlTZ2s1UzFwWGVwYUo0MHdzVzRRMFdlMnNQ?=
 =?utf-8?B?WXZUbm9Ib1laV2dPdG5EK0FJdkZtSWtQZ3FZYjNRTm03Tks5Q3pMc1c4T1pi?=
 =?utf-8?B?ckluZS9KMGE4V3dOR2taMUgvQnJRZmN1WTdVMzVIU0pUN2dkSmZuMHpWWExB?=
 =?utf-8?B?OWhOYkdQandzWllkM1hWM2VidDZKamQ4aStxejRyMy9tRzNCTllWRFd6M0NP?=
 =?utf-8?B?YVdQb3NST2N3WVQ3T09vaFlmejB4cEFVRVpBM1VRRWZZYnVLeEJJdDJhN1dG?=
 =?utf-8?B?c2pYS1dYRkk0akhZeUhLOXZZaWpMZjEzeFh4bEZSazRUWGJxYkR1UTRJOE5E?=
 =?utf-8?B?ZFc5TTBjUDNlNktyUXE5M1VxRjdUM1piRllWdFZtRG9mRFVQM2srRkJVV1ZE?=
 =?utf-8?B?TmRBNEFxMzErN1g3UC9yZVY4ZzRsQXpaOCsyamRrSmFreWhiMG5PQ2hpQ2Iy?=
 =?utf-8?B?cFJ4WVNSeEJFZjRNMm1sQWM5bkt2MjErNGhuQnVrMVBqb3F2aEFlMnhDcEx6?=
 =?utf-8?B?ZHZWT1MyRGVjSGdLcUNqWlZmaE92ODdab3JNOUJQTjEwUk8vM2xtRDBDQlJR?=
 =?utf-8?B?VFVmTysxRWN3Vk5qeWx2eVdkZ3RHRUdLL1UvNnZ0MHdCVEg1Q3o3WFN5WjU3?=
 =?utf-8?B?UU1COFZtNXRxZzF5ZUY1eERRMUZyQXFBZDlqd2FtVzR4ZDRnOENzZDJUMUtL?=
 =?utf-8?B?c0pWRDNZNDlPVFBkRzF0N1J6Qi9WVFlCU3VJMFdNbE5zcWU2d1ZWRVFSM1dV?=
 =?utf-8?B?Nll0a3c5WUFtUGFQd3NZTFZVQ1hkTVJiM1JtQWtBMEdPQlZpMmJYa05vMmM3?=
 =?utf-8?B?MWpiN0RDVTZXaE9ycUUxYVhWVEplMGZTRjlyT0phNGJkVmRCemVIQ3Mzd1Mx?=
 =?utf-8?B?bWEvSE54VVc0eVV2dk9DK0M4NDRGTW4yWThzQ2xudlNRSFhYTWdMYUpPZklq?=
 =?utf-8?B?MkZZRkRJeWhYc3lsTGdjQmZRN3RQOC9NV05uaHFlQytLZ3IvYjlhV2l2ZTEx?=
 =?utf-8?B?ZmR4YVRNS2dPYVVxMElQTTFKcGFZV2hyY1BZbTZ5NHRac3dHeDZFVVBlZUJL?=
 =?utf-8?B?VHh1Tmx4bDQ4ZzA2eFBzcThDcWhIWHRPZVFkNzdXQnkxbHEvWGpOUzI4UVd2?=
 =?utf-8?B?VkY4WmQyVkFBMjFkTThkQUFHZ3VqZmFzc3E4VTMvbkQ2ZkZtRjJNRGJBcmhq?=
 =?utf-8?B?TGcyK3VOOGdUV2ZuSyt1Mi8xbzNXWTRRRDRsZE1Va20xaXpBYmI3OGxaazhz?=
 =?utf-8?B?V0tHWStRNTh3VEEwbXBTRzNUZ005RVkzbnRabVExUlpWNE4xb0svM1dyWm13?=
 =?utf-8?B?Wk1pVytDUWI0WGpyWXpHU040VUwvZ0o5Nmk2Y1Z0M0pEbkhPNElZVGV3TlNm?=
 =?utf-8?Q?qApR1zHvrQgbE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk05V0NDOE1OMFBLbWRQZDJrYlU1S2l0RUU5ZU1OZUkrUDZQMmhrbmVVdzE5?=
 =?utf-8?B?TEdpa21jRmhvUGhwcjR3N3dUTlNiYzJ3b1B1dnFUbHlUZUgwWWdBa1MzQ2JZ?=
 =?utf-8?B?OUpDbHlscFU1RHNVTG14bFFzN2hYMDRrV1ZOejJpRzRiUERkeUk2OTZ5WGQ4?=
 =?utf-8?B?dlRDTzNtRTJ0RVhKbG14M1NFMXZXK1NqU0tCL3JQK2dFUSttbG52bHVXbXlV?=
 =?utf-8?B?azRYdW5ESmtmR1dkelA1OVRKUjVtNjNHTjJ5eFRXOUx5MlkzRWZKQ05oSzRJ?=
 =?utf-8?B?eGdqc0VqMW1CZXRHa2NORVlOb3c4S1hIUWU3SkdSY0FobVRRM1c1eDJudnMv?=
 =?utf-8?B?VEFaV0R5Mjlmb1F3QWNRN1N5RDRzWmE5aStERmpub2Iwdlk2Vzk0T09EMWxo?=
 =?utf-8?B?S1QxcUtkVXFtb21RczBuVXJzb3Z0SHgrUFRoU2RoN25abkdOcmFSWjBNT0xs?=
 =?utf-8?B?OXMrTnBmMjFiNzk4ZllWaHZwTnFKdXdyWXR2UldRSkRXcmZrS2tuME9QZmpI?=
 =?utf-8?B?bTJVRWdVSkRJbW5adVlOQnpqemk4ek9zaXhPRklDUEhKcXAvMERkUGtIaWkx?=
 =?utf-8?B?TDdjNUY0QjVLS0t0Q0xyaERVNUJaMnFBd0ljbEM4aTF4d0dQaHpBWUxrcjhj?=
 =?utf-8?B?a3I1VGtTbmI1WjdQWUQxRnlGZXhIdktkQktOL3VPN0VXRGlwUHhYVWo4bTJH?=
 =?utf-8?B?N1BCZHhpbGw0bHpEMUphc1RweTZFWVREbE9qYWY3eDRXK3p1WSsveVNvZG9E?=
 =?utf-8?B?WjU4UmM3a0diT1RuNTRGRjJSdGVldzEvOXFaM1NFWVZBM0o2M3JUazZhV1ZU?=
 =?utf-8?B?ZjdybVBPRitBY1dxdkdxTDY4M2oxckhNNmljdTRibU13S21zUHdkck1BdGk2?=
 =?utf-8?B?VUM5NFg4SmxnUzhXcWxDY0V6eENTRGI3UFd4UVFsL3ZXNDhDeURIbWVINFQx?=
 =?utf-8?B?MkRvSURMK1IxakZPNE1meDRreXRQME9KUjRNTmdQK1BZdFBrK1cydEJYYWJr?=
 =?utf-8?B?d2JCY1FrVEQxOWo4SUFUUDB2cU1tNlVISnNrNUVISzhZeDQ2S1hzZWVvQTVP?=
 =?utf-8?B?VFNDcHhUdE1XdTdkSWxVbDRIVWdmU29rZzIwa1hUM2dUcmptcExKR1BPZXJ5?=
 =?utf-8?B?Wm5LY0dyVW1FMkFDQ0lhUlhob3NZOFM3dnphUW5BbHNMeTdGK3JyWkpyc0xp?=
 =?utf-8?B?eHRVK0hoSnBXelg0aHU3OG84eXVnVnZUYVdaa2NuTEhSQnc4VHFyUWkxdTdi?=
 =?utf-8?B?c1d2QzFPMmtMTmtUNFQxbTNwY2YxY0daa0x3aTJkUmJCSi9LWWsyRENyNW1y?=
 =?utf-8?B?MUZsa3YyMUsvSzRRdUYyWnJQSk02emRwMld2dFhyUzhFMUhkL0Fvb1JsYkw3?=
 =?utf-8?B?eHJMaDUzV0l2a1RXTnJWQ1JCVjh5REpRWjRLdldVbjNIRVYyNjVqM3Bna1d2?=
 =?utf-8?B?RDdZTi9xUnd2ZUQ4YkU5RUE5b1FKU2ZQR0FWVHZsbEtBYjhvbUlRbDZHazR3?=
 =?utf-8?B?SXU3bWI3SXdwMFY5RVpPNUd1R0JLNmlQYXk3RHdBRk5Wc1VaVWtJQ1g2cWIr?=
 =?utf-8?B?RlJHa1VRbC83eTNuZEVodW9sSEdXUmI3cTF3enFubFY0ZVpBMDdwYWRHMDA1?=
 =?utf-8?B?di9Ta3BsU0pOQkV1ZDJEOXlUWVMwaFkxUHpZTjA0OEExakU3Y3lMZ1hpNWRS?=
 =?utf-8?B?bXBEZlZESXNLRW42MWdOTUlldmRaQlVOREdPN3Vmam9WRGpvZDg2VE5zUHYz?=
 =?utf-8?B?d1pBTzNkVXlHZFhWcFdZOFRiRUpadVZPUjdDVDk0OTlVSURxeFVmM01RUlVW?=
 =?utf-8?B?ajR1dHRSMlV5a0lCNGdnbnQ5UDFaRDlwb0JsTnh1Ylh4VnJhL1BVemxLaHR3?=
 =?utf-8?B?cm5raTNySHUxZ0VGdnpqeGRiclNlRlhBZVdZMGsvVVhvMlBrd0ptRTdta3pV?=
 =?utf-8?B?SERKRUxzQzFLSnNrZkwvYlRvaG1WVVNhaCsvR0xaTGs2RXl3QWhJVFlJTnRL?=
 =?utf-8?B?RVY4WnNDYk5LNEN4QWh2cFhiZXM1WlV0SlQ2MWdsUktqZzBrTGptYUNMQVRr?=
 =?utf-8?B?VlhZTnhNZE1zZnAxNGQ1cjU4OU1TWEoyQUFqZi9lVFVDdjczSlRGbE5VT3Uv?=
 =?utf-8?Q?J57/TAwVCg+WDtNsijKSxdyki?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3173169-84aa-4877-69e1-08dd6cb5d615
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 22:30:39.5571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbJjopw3yvq+MKI469gFhAqQUhHWS5aE/rvmipRV2IV1Ta/DPkHtm2XoVMcanKrRqZa9ar/ctZlZr/ewuq1tzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6344

On 3/25/25 08:33, Kirill A. Shutemov wrote:
> On Tue, Mar 25, 2025 at 02:40:00PM +0530, Aithal, Srikanth wrote:
>> Hello,
>>
>>
>> Starting linux-next build next-20250312, including recent build 20250324, we
>> are seeing an issue where the SNP guest boot hangs at the "boot smp config"
>> step:
>>
>>
>>  [ 2.294722] smp: Bringing up secondary CPUs ...
>> [    2.295211] smpboot: Parallel CPU startup disabled by the platform
>> [    2.309687] smpboot: x86: Booting SMP configuration:
>> [    2.310214] .... node  #0, CPUs:          #1   #2   #3   #4 #5   #6  
>> #7   #8   #9  #10  #11  #12  #13  #14  #15  #16  #17 #18  #19  #20  #21 
>> #22  #23  #24  #25  #26  #27  #28  #29  #30 #31  #32  #33  #34  #35  #36 
>> #37  #38  #39  #40  #41  #42  #43 #44  #45  #46  #47  #48  #49  #50  #51 
>> #52  #53  #54  #55  #56 #57  #58  #59  #60  #61  #62  #63  #64  #65  #66 
>> #67  #68  #69 #70  #71  #72  #73  #74  #75  #76  #77  #78  #79  #80  #81 
>> #82 #83  #84  #85  #86  #87  #88  #89  #90  #91  #92  #93  #94  #95 #96 
>> #97  #98  #99 #100 #101 #102 #103 #104 #105 #106 #107 #108 #109 #110 #111
>> #112 #113 #114 #115 #116 #117 #118 #119 #120 #121 #122 #123 #124 #125 #126
>> #127 #128 #129 #130 #131 #132 #133 #134 #135 #136 #137 #138 #139 #140 #141
>> #142 #143 #144 #145 #146 #147 #148 #149 #150 #151 #152 #153 #154 #155 #156
>> #157 #158 #159 #160 #161 #162 #163 #164 #165 #166 #167 #168 #169 #170 #171
>> #172 #173 #174 #175 #176 #177 #178 #179 #180 #181 #182 #183 #184 #185 #186
>> #187 #188 #189 #190 #191 #192 #193 #194 #195 #196 #197 #198
>> --> The guest hangs forever at this point.
>>
>>
>> I have observed that certain vCPU and memory combinations work, while others
>> do not. The VM configuration I am using does not have any NUMA nodes.
>>
>> vcpus             Mem        SNP guest boot
>> <=240            19456M    Boots fine
>>> =241,<255   19456M    Hangs
>> 1-255              2048M    Boots fine
>> 1-255              4096M    Boots fine
>>> 71                 8192M    Hangs
>>> 41                 6144M    Hangs
>>
>> When I bisected this issue, it pointed to the following commit :
>>
>>
>> *commit 800f1059c99e2b39899bdc67a7593a7bea6375d8*
>> Author: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>> Date:   Mon Mar 10 10:28:55 2025 +0200
>>
>>     mm/page_alloc: fix memory accept before watermarks gets initialized
> 
> Hm. It is puzzling for me. I don't see how this commit can cause the hang.
> 
> Could you track down where hang happens?

Let me say that the guest config is key for this. Using that config, I
think you might be able to repro this on TDX. The config does turn off TDX
support, so I'm hoping that turning it on doesn't change anything.

I've been able to track it down slightly... It is happening during the CPU
bringup trace points and it eventually gets to line 2273 in
rb_allocate_cpu_buffer() and never comes back from an alloc_pages_node()
call. That's as far as I've gotten so far. I'm not a mm expert so not sure
if I'll be able to progress much further.

Thanks,
Tom

> 

