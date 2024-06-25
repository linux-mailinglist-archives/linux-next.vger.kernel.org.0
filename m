Return-Path: <linux-next+bounces-2658-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08879915D1B
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 05:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22C381C2113E
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 03:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708D226ACD;
	Tue, 25 Jun 2024 03:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aC3u/k0n"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615E63D6B;
	Tue, 25 Jun 2024 03:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719284460; cv=fail; b=Moe9vwQ+89lLAWifXbx4jz3gl8/CGEChODJv6jF9Yu4hPAI505rL+f0YuXAFi5bZBgoCVGec9bmETNxb7+jL//8+8Ay5F5UfB4mrgbhvcjjD51XKRp81ocxuWN84QmwvUWc36MGJyz5DZBAnOEZr3LnP1UYvMFFqc03Pv2Iyc3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719284460; c=relaxed/simple;
	bh=xb8Jz9aUNY5BVibay0i3NXLJaPYYx31p++rW2ejgblU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tH4CSFbfwtZdyFAot9SflMe1qMW/H/eZ9ZcXsSRJYl8/KG1lMIEpf4yxYa1NWZljPf0b5PuGHKGtrmGgNm5ZsexmaIzMz8KCbMR8unhPMvC5afzpGYDSXkEh7IUjEhxkkwoVBqyyukMMwCjYUo+WmqLsri/4KPE8DUrXZr6qlmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aC3u/k0n; arc=fail smtp.client-ip=40.107.244.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETVaRcT8jI0fp1mEDxkTHV96tJU30us590ujV5waz5lbk4NIik/32IQr6SK940poFCpSlv2pa2jSIq2MKXoQHhqzBIXGpBVwfslX4WFIAmqT3A3B3SVUuanjl+ZQap/XzEmLiSTxvdBQx6el8cMJj8f5e1vazEi8zQIxkuirEX1DyW44CJAdxIYFgTHrWBF56ImDIDVnSRXs6q9XIz9YBxNuA93O+ZWGxoA2RNNScQXeaIUJZ/wAC/RUQDWXAIp8iMYnSWVHujo/xamKHRSOrdn0zcfW80/Rn6ZtXLXEMCpv10SCtYcTuMxdj+LIC1XoedJxkYqUU2IaMMPlbCaZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQMtvuOsLp4pqI8xBSkOfsEGTAFETsXfg3hr3WXxlvU=;
 b=FIkJy0Y817gXp6w6xdIE8zLzKlsnLg7OkuIt2oW9BBHqBBAFDktKrGB4ZrW1VEemtsaUS5ZDYNZWgGNReN3Uwl5GXm4+qS9WhF3Zu+7os1BsoanPkz52LIan/mF7EoYNXyzs5YRilqKT06PIGY97DGrq+lNCsXnlMXrTxd41KpMBD7+kpXflAeF+L+AT/fHDVTgf2d3ZVSrmQwnGKHvV7elTVBpthHjm8QYgZkHXInnYERHJOr+I6hp16ZgG3GZt5BvOmc1f8iLQ/XH/JM1jW9nHwGDdAPVOOutknJnIz9SIpThMATi3VtXTmmDBAtV9ixVTrKa0cTlsRWaRjVl+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQMtvuOsLp4pqI8xBSkOfsEGTAFETsXfg3hr3WXxlvU=;
 b=aC3u/k0nUVaG8qwwvq0JOSJfGJyjoABEY++pKPCN2OLY1muVJ3bB/UYAi9sQakUrHy14ij+XNaJI92BpOcXhQoH4Bj8CgzJbYvgsAkNf8Y81u0+Srx1zjPLuai1+/LP6wVsySq6YNVXkJ/y3ceVF5rzLNCJpuwrzr3IzkLnJgu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by SN7PR12MB6861.namprd12.prod.outlook.com (2603:10b6:806:266::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Tue, 25 Jun
 2024 03:00:54 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::bc87:6c1b:cadb:67a]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::bc87:6c1b:cadb:67a%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 03:00:53 +0000
Message-ID: <db2165ae-2086-d60a-df31-dbf7711060ac@amd.com>
Date: Tue, 25 Jun 2024 11:00:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, Xiaojian Du <Xiaojian.Du@amd.com>
References: <ZnmnqjCZ_dx0xXjw@sirena.org.uk>
From: Xiaojian Du <xiaojidu@amd.com>
In-Reply-To: <ZnmnqjCZ_dx0xXjw@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::23)
 To DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5136:EE_|SN7PR12MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d3f119-ceba-4d70-22bb-08dc94c306f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aG96OFovNi9YQ1JCQjBLMlhObExYM1dlWFVhNERqZzU2NmpKWFN1Z0hDLzFO?=
 =?utf-8?B?VW1ZVnBXNVQ0bVNLNmhPWnNFQ0JMbEJMWHltLzcrN0ZzbklDdXJ3dXVsRDFr?=
 =?utf-8?B?a1VldUNXWm5DcWdLK1oyWlJ1TlJnbVJsNlhucm91RUJFZXdrc080MHl6S2xv?=
 =?utf-8?B?d3VSUXlMTHJYSUxEMGczcm9TN0ZQUm9WcmFVSmxHdVkwZEQzeW01dVQ4U0x3?=
 =?utf-8?B?L25ibGpUQjQzWVhuNEN0MEVlUUJLZ01HWnZZa0dqMTFDbWIyaXhqcTRKenlM?=
 =?utf-8?B?ZytlRDBvaFdZZWZWSEdjQ1ZuMGJlWTBGOFB1cWpxUGNuV3hBcEVrNk5CenNW?=
 =?utf-8?B?eGE0czllS2tsckJXem93RzFnNHZiM3orWmtXdWU1OGR0WTJ2Sk9XTGpjYU9z?=
 =?utf-8?B?cDFpc2M1UkUxc1FFbXJTZXhGeXhOK2RDTU9mNmM2eTdyS0hDSUhnb09odllY?=
 =?utf-8?B?bHRlamN2MlZmR1BBMUtEYlRFbEdiTjRTaW9VUkVGUkhpQ0tidnJVN0UrL0hN?=
 =?utf-8?B?UTYvbDZRY2p4WHFmbTkyU0NGL0JTK1JaSncrcUJZU0VTTDVyUGhDTzZuaUth?=
 =?utf-8?B?REJGSDNIWWJJK2hST1NIWWNLa2xyNzlMQTJnSEZPOHhHUmtocjNSdHl5YXk2?=
 =?utf-8?B?YkZ3OW50clM4cTczUk80VlE1THhjTzhyNjl6djJaV3ZhcFF5VGx6ZzQwaG5l?=
 =?utf-8?B?WFZwcmFYWGRNVTRXYWFxTEtNWnI5QTR0cXhnVk40aXArcHU2T1JycXE3QzAr?=
 =?utf-8?B?SlhGSTg1Qkc1OW9aMTBpbU1BY3VaUU5sdmZ4Qm56U2ZQUXdhaW9CNFlMN1Zy?=
 =?utf-8?B?YjU2NmFFbnVNNnRRdEM2RHBuRHR6bGFFVmhHdGJoUkpubitqZVg3RlIrbmNl?=
 =?utf-8?B?aUE1UTZUVElackVBcnpLMmlFdW16VGtQajhCbWhhYnJEeXNCYlNTZGFPR1p0?=
 =?utf-8?B?RkFhSnI0K3Vua0FIczBqOEJ5T3RSVElkdzluNW5UVVQzdnAyZzF3MGlpQWt2?=
 =?utf-8?B?bC94ZFR0bEphZzZ3UzBYVDQrVlRFeWdKSVBSZ1l1SEpDNmtzZDY2M0kwdHNz?=
 =?utf-8?B?WlZlT1NrMDFBS1VGbmtqdDBob0lpU29tNGJmbVlwWjRhSTZaMWNGdUo2U0Ja?=
 =?utf-8?B?Y3FwUk9qRHZmaXJUSE5scTNIZ05UUzFTQnkzRUlQcVNjUS9Ib1BhcVJ0aTVw?=
 =?utf-8?B?bkw4Ym9Zb1kwT2pCVitCZ1lhUVVyK3J1MTk0eTlEQzdkNnlKSlh2d21lQVMw?=
 =?utf-8?B?eFVUS2MzWXlmaTlUZDRLbnZhWm84dFhmMnhlRzcreU9Kd2VubCtSSmxyRE9T?=
 =?utf-8?B?UlcydnFFalE1aXg3dDNDcjFrNnpGN29lVkNnUUY1ZmZvVS80QlNJMDd1azBn?=
 =?utf-8?B?aklhalJZK3ArMDR5VzI1NXlaRWx5Z2U4UkhkMFRhdVNhNHpYRWFPMk04bEMz?=
 =?utf-8?B?djJ2Q1JhY2NxWHZSZUlwL0FnOWg4R0p6dGJ2N3hzWnJJR3R6QllYZTZJMzZy?=
 =?utf-8?B?bFowVGtrSTJzTnN4QTFGQjJ4MktwM3pkTHUrQlo2d3A5NUtsd2ZBcDhwcTRj?=
 =?utf-8?B?ano4Z1NxNVVpNHRHaVVqR2kyaEFmam5hUGNESVpJSmdQamJSSDV0L1QvVUsw?=
 =?utf-8?B?M2NTaUMySlBLOVlRbEMrVTJSdWVSYlhodFRUNGVsUjdJWDlpaEpiaVpGVmRS?=
 =?utf-8?B?L0p1WkV3NEluZFUzSnByb3RvUm5iNVRVdi9ud04xWGF2WG52ODFNTklqc2Rn?=
 =?utf-8?Q?gFN1V02CLq94vWkuX8FWMqEK4Xs4392ekGUs/uW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5136.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejdKY2RIRTdiRGw5cW5HY095S2pCWmtGbDBhSmVwWERicVA4SitQV3hTL3c5?=
 =?utf-8?B?ZHJKNWhHTUE5aENjWTdjYmt3SmkyelloNll2SGFFb2JhcUhoeFV4L2lUakZp?=
 =?utf-8?B?RTZPQ2o5NVlvOTRwZlhGbUcxSkN6ekRuVFk4YXhqbXg4VXNvTFliVk5DV1Js?=
 =?utf-8?B?L2hTVnBaVmNBWG1yZ0NkOWprLzJkcEZTcDFXTkNCZUJMOHVTRXJnZzVTc05W?=
 =?utf-8?B?VnRGZ1M3NGxTT1dBN0hGN3NsM1orNi83cXdWOWdNM1RNc3lRcjlxSmFWaU45?=
 =?utf-8?B?QzhqSjQ5QWc4ME0vbzB3SnNZNmRNU1ZCVUlUZlcrams4azZSVGFreC92SjY5?=
 =?utf-8?B?TzNVQVc1ZDFBRy9GSWVObEYrSTJEVDF3UnFtc3MxQWtjY2Q5eVV6YTVvaUxS?=
 =?utf-8?B?dGhJenowaUtsTFhlem5jeitwMEtUQWxvR2VpZFV2V2JCTWtJNy9sbVMraVVP?=
 =?utf-8?B?bjkvbURCQSsrcmVobnhEdFF6elhsMHRXMUsvOCtBcGNJVWRnTDdwQW9TRytP?=
 =?utf-8?B?OUZqQjFWRDlLbGNkc09FZ3p2Kzh1NGltWlFtVVAwQVFwMTlVRGFpZ01mSC9r?=
 =?utf-8?B?MWhxUkVyWVo1eFN4bmFxdkdsZjNaaUJ5dHlYZTRScGVqZ0x4Nm1wWUFmOVZ3?=
 =?utf-8?B?Z1E3dFhpWkxOcGQ3NjZIdUlPRUVTakdtTTJydW96RkcyVVd3QTdlN3ZUNHVY?=
 =?utf-8?B?NWtFRUUwVnJHSWVHV2xXampjRkM0THlHMzVhK2pybHdwenBnMVpYcVo4TnMy?=
 =?utf-8?B?WVNCWFdZQ25mMHNqSStkNTZiT3dpcUg3NDlJMXhWRFA2K3BxdnNud2VYRnBP?=
 =?utf-8?B?WVBVRDg1QjFQMGQyaVJkYXNVQmQ5NWlVckZoOFF0ODF2OGVIMkltanI3akpa?=
 =?utf-8?B?ZjZiUHFTeFFzZ2FIaVFmanpBNGp6QUp5KzFqNnVoM3d2dnFWT2pVdEhIK0Ir?=
 =?utf-8?B?YzJxeXBRM3RjZkhhSnVTZWdYMjFLM0xTNHUvczdCOElwazlOOERvT3QrN2dz?=
 =?utf-8?B?MG9BMC81SUt5ZGhLTkx4cUJVb3RCOFZmVnJjTE5FN2tmaUdTRmtnWkRtZzhG?=
 =?utf-8?B?NTZBWk91ZkdxSWtsZXJCUk8yQlpQN3IvQ3pWVHJPYUhES1cxUjF6aHBhRWNi?=
 =?utf-8?B?eWZkaFlNK2t6TnhCdjcvTENhUnBBaU0vM0lqQkVOc0krY2c5WDFHYmliNU1U?=
 =?utf-8?B?Qmc0V1lDazk1N2psQnFsK2JMRWlpRnJrZCs2VXBXaHVGLzZzUXZpTlFuWWFh?=
 =?utf-8?B?T2E0WVNwV1BxTzB4VThlYmxycG1MaDRQOTZjVnN1R3B5ZENOUS9rcHpZdjJs?=
 =?utf-8?B?empobzhSWXBid244QUswZFZ4MjVkTmVROFVYQnpncDBhTUdNVlhqcWFJVXdE?=
 =?utf-8?B?TERjMGc5NktvV0kveDk5YjJxNzlVT1Z1UDZCd2tCSi9JNHBQVE8zRzdjMzYv?=
 =?utf-8?B?dnJ4N2c3UTdpNDJQUXNDN2xXM29jNEtGcGU1SEFUcUErcW1WY202WnBBV0NL?=
 =?utf-8?B?R003QXIwL1l6NFhPOFFJeXcyaHI2Y0VudkJHYUtac1pKQkFobU55bjBvQWNE?=
 =?utf-8?B?Z2ZpaTFYMExRVUJHTWExTm1GWEZmUW1yb1dTUU45VVhQK20zdEtkcExNVG11?=
 =?utf-8?B?VU1qS0ppWGZFanVpN2w2OG15cjFpd2tGbWg3RDZ4U1VMOFQ5eDR3eEdSVXVj?=
 =?utf-8?B?a2sydzkyV01UOXExU1hkZldxbzBRYWFQSHdDdzJweTNoaGFWSkVqMU5iZ1ND?=
 =?utf-8?B?blRueWpxaW4xY3V5d0FKVXhjaXkzYlNaTFNzdi82a3dreVlsTDNoa0hOQW9l?=
 =?utf-8?B?UUNMdFlxcVlML2ZwUE5YcnBVbDlQeGJOR3BOS2FiUEFnYldSM2xkVEtZVjVU?=
 =?utf-8?B?bjJYOU5FbXFvWW5CT3piNU5TaDdKZjY4WkQ0d0pYYy9YTzMrb3hLM0FFaGhw?=
 =?utf-8?B?S3N6K2pZY0Q3SzRabzhtWEdqNS9TbDdsdTVXVEN6ZEFDOUpRQnpLNC9oQmNH?=
 =?utf-8?B?ejV2bGNHVHVDSyttY3B0VDBVeW9LWEc5cHcxYlVmd0pRUTcrbGxYWDNpTE1R?=
 =?utf-8?B?ZWV2ZitQc3NTQ1pKL0FrT3dRUk0yUm9JWlo0c212UzBicUptQ20vOFhJSTJi?=
 =?utf-8?Q?kcGQFIjw9MciX42PH5jjdt63E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d3f119-ceba-4d70-22bb-08dc94c306f2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 03:00:53.9001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSqjWcbAMaMcSqt0v3XI1znK2yTd5erwdrHVe/D2BMIxMRJeMoG+DQfr2KUk+O+oZH4SVN6Lh/iPyTskrs5d2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6861

Hi Mark,

Many thanks for your help.

On 2024/6/25 1:06, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in:
>
>    arch/x86/include/asm/cpufeatures.h
>
> between commit:
>
>    c7107750b2ffa ("x86/cpufeatures: Add AMD FAST CPPC feature flag")
>
> from the pm tree and commit:
>
>    78ce84b9e0a54 ("x86/cpufeatures: Flip the /proc/cpuinfo appearance logic")
>
> from the tip tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc arch/x86/include/asm/cpufeatures.h
> index 6c128d463a143,6007462e03d66..0000000000000
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@@ -465,12 -466,11 +466,12 @@@
>     *
>     * Reuse free bits when adding new feature flags!
>     */
> - #define X86_FEATURE_AMD_LBR_PMC_FREEZE	(21*32+ 0) /* AMD LBR and PMC Freeze */
> - #define X86_FEATURE_CLEAR_BHB_LOOP	(21*32+ 1) /* "" Clear branch history at syscall entry using SW loop */
> - #define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* "" BHI_DIS_S HW control available */
> - #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* "" BHI_DIS_S HW control enabled */
> - #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* "" Clear branch history at vmexit using SW loop */
> - #define X86_FEATURE_FAST_CPPC		(21*32 + 5) /* "" AMD Fast CPPC */
> + #define X86_FEATURE_AMD_LBR_PMC_FREEZE	(21*32+ 0) /* "amd_lbr_pmc_freeze" AMD LBR and PMC Freeze */
> + #define X86_FEATURE_CLEAR_BHB_LOOP	(21*32+ 1) /* Clear branch history at syscall entry using SW loop */
> + #define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* BHI_DIS_S HW control available */
> + #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* BHI_DIS_S HW control enabled */
> + #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* Clear branch history at vmexit using SW loop */
> ++#define X86_FEATURE_FAST_CPPC		(21*32 + 5) /* AMD Fast CPPC */
>    

But it is better to hide this new flag "Fast CPPC", prefer to use " /* 
"" AMD Fast CPPC */ ".
Not expected that "CPPC" and "Fast CPPC" are listed to user at the same 
time, it will cause confusion.

Thanks,
Xiaojian

>    /*
>     * BUG word(s)

