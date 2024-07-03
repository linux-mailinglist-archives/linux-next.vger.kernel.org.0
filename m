Return-Path: <linux-next+bounces-2813-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E78924CD0
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 02:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DA0A1F21DF5
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 00:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57698645;
	Wed,  3 Jul 2024 00:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="YVhSQbJ6"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2097.outbound.protection.outlook.com [40.107.223.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F221F623;
	Wed,  3 Jul 2024 00:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719967268; cv=fail; b=VMkP/205hRMtE6EApD8mumFbD+Qn0ERX+Z+L5kio/b/+74b1pV0hqSZsZwtJmFKLszBpkurggMhBH0DS2fHVkj1X2XYMdkwtLy3H/M114S9S7iFSrIHhDuTNV6o3to0X1wrimmhLJrOHApKjZMuzfGV+No4Ii3fOcPzkj4siXlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719967268; c=relaxed/simple;
	bh=KHA+y3S0NX59sjXXoeZoXQGMpvG/gGYSOf04WoaPiJI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T+jjYY21uZzx41aIr4n/cbIw4xwNh0nDzocdCEUb5vjNPaui1DnFM3TaD1huBsC/XrSyxTrmvSw2JclovEWXFTPJppM0SWgcnzlODScO4gWmzZlZmcuuS8u25DwSOF8D2vP19nexZgcgtF5I2hL9dLaotvjSQrhuGPhoWGZOnAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=YVhSQbJ6; arc=fail smtp.client-ip=40.107.223.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hw0APgafIJrll0yjK51TykDVGtgSvkh7IBb+bhWcKocvn2Fj3kK8320L6DKAwz5HPBuyk7LEzvSUXeHfFKdRF2mYMkNvf57pDIxNjbSew8WQ0ysU74PTKiKyOioG8GgdNqz5EhdNudtDZNC0W9Gy144MtH5jc4NZV7BPd7Wv63837MY6cNJeA4PSAL/AhgrSvSQt8Oz2DtPuiGbGYii2HKjUoWLipU08IK7l3D/epIhcwcGIvGigWHfrtfLB6xWgn+RxllKZ4U3LPk1pysgp0ELV8ZqKZ8ioFa3mAeci2H9N2ACGOgrs1hUG//tNex6K+mApA9W4LoH91U0Ue3Mmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MF29OXg8iYXUaKRe3E9LfYCdxu7ABNIuLaiwiOkG8A=;
 b=iMh0S4m8ec97t6LxyFBXm4Q5YoZKJVmf/UmKLzIYDc2uID9xI/ZOFtyluW5lejE1I+kCNgbafHK8vjHvINxuvKSOV/TIYlzFA+yOH9Q6R+fyNvFOgTmPA9lFwRy+TebKwJZ/DiJ5iFQ7aYGSd9VX/9XyxsCfoPiDcyF9ZSGnhwW7kIDX3oMLfS+B9VRsQ7u5N/oIOnP3RbFqpp37HrjuWussb1TSZslhR239F4rx07hy46TMXXo+UmiBxXVH30Tmgcf6zpwKLUEJJn1bFwhfxdIFxUjC9iSlychO/For2HW/f0N0BifmlgQlhr7gv+WawsJHCi3C+17d/qIJOlnAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MF29OXg8iYXUaKRe3E9LfYCdxu7ABNIuLaiwiOkG8A=;
 b=YVhSQbJ6MNX+iH4kQaYGUUunLQ+PRiWpI5AUzWG/1IGRqIQyB4j5EbqBDa1xeAjpJF0EvbNVkurtPEqVPGJ2zGC8B4oYj/iSNUUVA5x1lWBVObS/ElT+PmHp/uETKkNHFwruIQBI4PZDP5Izz0r3t7g/ba02Mlwdv+8OxaORgTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BYAPR01MB5463.prod.exchangelabs.com (2603:10b6:a03:11b::20) by
 DM8PR01MB6824.prod.exchangelabs.com (2603:10b6:8:23::24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.33; Wed, 3 Jul 2024 00:41:01 +0000
Received: from BYAPR01MB5463.prod.exchangelabs.com
 ([fe80::4984:7039:100:6955]) by BYAPR01MB5463.prod.exchangelabs.com
 ([fe80::4984:7039:100:6955%4]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 00:41:01 +0000
Message-ID: <2f8d6381-d693-4d16-b510-b74aff4fc55d@os.amperecomputing.com>
Date: Tue, 2 Jul 2024 17:40:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240701101641.4fea0ac2@canb.auug.org.au>
 <20240701110159.216a8d1f@canb.auug.org.au>
 <37b70d3f-c46c-4df4-b52a-3c6ba5feb692@os.amperecomputing.com>
 <20240703084440.3af9f526@canb.auug.org.au>
 <20240703092233.44f51416@canb.auug.org.au>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <20240703092233.44f51416@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0017.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11c::26) To BYAPR01MB5463.prod.exchangelabs.com
 (2603:10b6:a03:11b::20)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR01MB5463:EE_|DM8PR01MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 37af68ae-78ce-4c80-adc7-08dc9af8cfd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGFDZEFKMjZuV1I3UVI0aUs1UVpXTzYzb3VWa0Y4UmxGbURmSFhBWHMzQ1pO?=
 =?utf-8?B?aVV3RkQ3M20zRXY4eS8zaUEycGdGQ1JKekJKUXZBUkg2Zy92Ukp6M1lBdzNl?=
 =?utf-8?B?bGZ3NE1zTXFSU2lXNGJXcWpQWkwzOVVoMzcrQkVwZ0lNVDdKdURrUzh6TUVO?=
 =?utf-8?B?WXNLSkR3M0VkSWZmUG1qVmViVlZTdldJYi94MXliSVlHTEVxUElYcUNaMzk5?=
 =?utf-8?B?K1JlZVZNdTViUkhra2F6dTIyVkZ3U3BBTGRWc09rNFBNVDFkYlA3TEszN1ZF?=
 =?utf-8?B?TUorS3ZHTHhLZkt0VFFPSlZMRCtZV1BENmVGSmRYRlRFd3RnSFZVN2cvUjFS?=
 =?utf-8?B?d1lnVUlJU3NQWUhxRXBJdm0rY1pIRVBYdjRraXJ4V1NZZ1I0c3kvM0Vnbm5P?=
 =?utf-8?B?Y1dDckJ3SWNBMmtNOHJGKzJTM21UTitqZEdqRDZ2b3IvckE1RlFvWjBZWTk1?=
 =?utf-8?B?QkdhMlhmbWp2U2dTUFdJaHZib29EOC9GWjNHM2ZsQlJ2T3BxUDllNU9wSVhz?=
 =?utf-8?B?Qk1qNUVDamtLd3ZUMEhjdE5pNTB3aWVsLzZpZW9VOUxUVmIvaUlaWC9yYUVt?=
 =?utf-8?B?Ti9NSE5wTnBLOUJEWHVGMXZuMHNQQWxESzRMeDZUYW9RdXI3TXY5WHVuZHQ1?=
 =?utf-8?B?dE1VVnlkcG15OVRLcWlvQ1o5TWcvVGZrWlhtQ2xqOTNyNjFXazhVNC80SWlO?=
 =?utf-8?B?WTJWdVlMQlRRcW92V0k4eTgwZDdCZTR0bGR5eWJuNXl6b2w2NW90ZnA3OFln?=
 =?utf-8?B?T1dSQ3NJcnpxNHpOZHIwNDZuVUVOdHp6Sk80bjQrN2FxUEN1QXlRNEY0aDBM?=
 =?utf-8?B?Y1A0ZGdDRHpKQ2RvbmRwWDFKcEEzZjhaUzZCcU8yQjdrVzBpVXQ5d0Y3Q2hG?=
 =?utf-8?B?VFpGWFNIYjUxZDh3ZjNSbWJFbHkyS2U0RnhUWnVUaytXR0ZWcWVNdE1xdE5P?=
 =?utf-8?B?TTkvR3I3MzRhMXRtVTBPL2RUZTRLRzZYaVU2MTBuall3elQ3c0FBL1h6cHll?=
 =?utf-8?B?SnpBdG84NlVtZFlVbjJ6VDF3anl2RzhLeXptSHIrcHdvNGpUc29TWTRhakJ6?=
 =?utf-8?B?aGtuTkhvVjhuR2dzejlyNU5Mc2ZEbWcwOTNhdURMSVg1NnNhMjNYaDArdXBY?=
 =?utf-8?B?TTBmVGI2aFU4dkR6R2s3N2NsOHljelVEU3FCa0RuSmhtME9OdUJqWENDVzZ5?=
 =?utf-8?B?blVoUzQ1N3BGQ0c5UE1tbGNsZUhobmdvallENEdabWg3YTltdzZ3b1ZlM1M5?=
 =?utf-8?B?aXlRUXhBVWdaUEZjWjNvNGM5LzQ4QlkyUE4yNWxmTm9oRHFqVW5OWHdHVFJX?=
 =?utf-8?B?ZUU0ckJxSVUvbTdjYXAvRjJQdHRmM1VKL1V0OVFYNW1PK2VBUDhqQkhURWZL?=
 =?utf-8?B?SUR4RkVJZlg5NEJIcENtMG0zVmJEcUJRRks2R3BIZFhMODFmNUdUUHBJNHBQ?=
 =?utf-8?B?NkgwRDhjNHNmUC80dS9CakNZSXpxNkNnVkxBSTl4bEc1Y3hrU1VQMWZvNFJN?=
 =?utf-8?B?UjZwTzUreThKdFFHZzVwQTBPT2RnK2ZCOWZoRFVvZS9BUFhVK01xRndBSmZY?=
 =?utf-8?B?MGFHWS85M25JZ1lCcjJxdjZOblk3T0YzNGtweWJ5VzhIbllVdDltMWtWdTJW?=
 =?utf-8?B?cVZYWmcrS1Znazh3OUJxaHdjd3hHdFdOOVMwSG9JRTNUZnl6TG9qekJNK0J4?=
 =?utf-8?B?SCtMbjVPZCtzbC9UOURjQjRmMVd4MzBlbTl1MkVTNUpZcExTbXdQUW5kUlUx?=
 =?utf-8?Q?c4YgkGNE+JlSFJxOuw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR01MB5463.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGRJUEVqYW1KamtDNU5lM3M0cENOTzBqUGZlUTM5YWJBbTNTbDljRlRWNWhh?=
 =?utf-8?B?Ty95TGRrbkg2MXFwMTJTc2p2cVVpa2ZaRFlTQmxlWmZsNGRRUDZZK2xDbkp3?=
 =?utf-8?B?QVBTdGZGanV4WU1TcE5rUGRtYkZ5cmpQQ0crNUgxQm02ZmRaVloxNmZIT0lt?=
 =?utf-8?B?enp2SHIvcnNKbVdkYzY4cnBSZUtFdGJYeVpVVVRpUVN1NGsrSDlYK1g4cHVZ?=
 =?utf-8?B?dCtQenhGWlVRa2JBc044b0luc2ZrY2xwbSt4dHJSOUdyNE5pRXZDTHpNZllC?=
 =?utf-8?B?Sy93ekk1ems2dlhxZE5GbDFBdEVUL3pEY3BEMHFFUWtmNmdsd05hUTljYWNT?=
 =?utf-8?B?RTYvWklQMk5NcXBZMFhhQjZWeFBMWVV4ajUxVld2RjRXQTVrNFcvbHI4RlJJ?=
 =?utf-8?B?Q3k0ZXViQVR0ektCb0VKUlBJaVJXR040T2RFT29BSldMVGpVemhuUGQ4UzRn?=
 =?utf-8?B?S1lyRmI5SXZlSjg3QXplWWZwS09ZNlZrR0lKb2lGRTErRnpGRk45Zm9aU0RV?=
 =?utf-8?B?blNPbFJIdVlSazVXY0dQU1hqV1pSOVowV2hNeVNaRmROZmVoc3NSWUEzQ0xU?=
 =?utf-8?B?TkJhMFRqdDIvTHgxNXJIM3pLZnJmVVhHb3hBTnVTNEhkclFFV0Q2cE5tMW1F?=
 =?utf-8?B?Nk1jd2txd1JkeG5GOVlKaEhpRlc2SHBieWFIKzdQcU1LbzZjcHBWN1djM0Mz?=
 =?utf-8?B?WU1OaWpKREFQMFl1a3EwRGZJaTdzbHV4bHQ4KzJDdUxWZlQ5aTl5cmRJeFor?=
 =?utf-8?B?ZWNvV2M2OEtGK3NDOHVERElIVXBjUG5XdHY2bjdxd1VmYTViQXRJZjlDMnBE?=
 =?utf-8?B?bnBGZVFoR2o3d2tkb2UzU2RYTFZpTFlhUjFZR04rdnVodjBvL2dlSUEvdWZ5?=
 =?utf-8?B?MGFqY01lNTA0SmhKZEh4ODR3WmU1a0VNekN2VnI1TUVXTEpsTFJ5MWpiR3lL?=
 =?utf-8?B?RlRMMnJxZTZqRHViSGlmVEtnczBiT1NySnkrU0tGVTRmUytCNHU0NVZYTUdU?=
 =?utf-8?B?ODhjbUlGM0xYc3BMZm1JZVMyNFIzbU5reFh4SWc5WUJJbW9GdXZXc3pjYzJW?=
 =?utf-8?B?MkxtTWI0Y2xtNlJZdUJoTWNacVZkRmZYRmw3Wk15dEtJdnZ0NVdadVkvdGwz?=
 =?utf-8?B?WTlrTzFSa3F4WFVWUDFJTldUSjdiZHh3Tmh5YVlVVUc0K2ZLbXZGckJuRGsr?=
 =?utf-8?B?MXhHN0FXRVRJbS9SS3ErSkgrOVFRQnJoZkpqRnMvdHZoS2JVOVd6SzZaMm9X?=
 =?utf-8?B?RTNvc0d2WW5xTVExMjI5UUxGVHBzaVErL053UWdqcUVCd0JvRDdYbnZyY1Vs?=
 =?utf-8?B?ZFZvM1BCSEU2QWV0c0hFa1lUQ0tNSllmaExEWk1yTVJVVGpYL2dxLzVCODlh?=
 =?utf-8?B?OTRpa2pOeWp0RXZaZmY5bWo2MXVYYUR4eW5FK2swbnRjMVNObkR5MFRQM3Mx?=
 =?utf-8?B?d1J1VERtS2d2WENXRldKQW1NREgvZEJ5L0ovaHhHUFJNaEhrVTltUVRwU0dT?=
 =?utf-8?B?eTNodFY1SGNzTERKS3RRWG5nR2FWOWRLMVllQkFtWUx6UFlPVHBac2xod0hH?=
 =?utf-8?B?WGNTSCtRdVY2ZWJ2dklRemtseFhHb294RnZYdE1CMmpLMmJVNE9XWC9PTWRK?=
 =?utf-8?B?M0t6T29rcnZBdlU3UzlPZzFjaTB4YWtBbytwL0x1RlFIdWRoendxclk3Rlor?=
 =?utf-8?B?L0JKb0xvNUpzSS9sb1R2bGtBckw2SVNLL29HQlJOeitjK3UxbkV2ZVd4NDBH?=
 =?utf-8?B?SWs4TWlWVHlZZVA3Y1BReTkyUi93OEswMXhHOU1EeWFhOVA4UFlBZUNDMW0r?=
 =?utf-8?B?VnVYeGhGbFV1Z2JEcFZQQ2hoVlNFcFFTalh0NG85SytCQ0dzaCtPNFBuVkhL?=
 =?utf-8?B?a1M3cDdpalF1T2drSWN3WlFybDJJMm5UTzVUdTBTRklTRk0xQ1NOOXQ2YlJr?=
 =?utf-8?B?K3BaU3A3NktuSDExRlRZdHN0STBPL1ZsSWlDRGhHT3ZRUkRHenY2NmZPd0Jl?=
 =?utf-8?B?WG9qRm9sdkxoR1RQZ1lFdU1CMHh0ZWlEa0s2YmRQdzExcC84OFZJUXpxa0dy?=
 =?utf-8?B?Q2VUbGg5L096Q0dMNkk0MUhXTTVrNHFQancvQTdDZ0tXclNZdDEwN2dBbkRF?=
 =?utf-8?B?SW05R3JBT2tVY2NPVGV2UEVsMUIwS0xvNGJMMGpvYmR0b2NqODZoMEZncHJv?=
 =?utf-8?Q?77/3RJDsgdLQIAd824f4uo0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37af68ae-78ce-4c80-adc7-08dc9af8cfd7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB5463.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 00:41:01.0780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbOTNPmjRc8YNOao3Moi/n/LNPgqLp/7hCj5aTB0Zq1Pi+UUVj3R6Ws8soCIj/7/SD350Ax/DeEisTM8/irz6u4JiR/dvi/QWcp6XoyCAhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB6824



On 7/2/24 4:22 PM, Stephen Rothwell wrote:
> Hi Andrew,
>
> On Wed, 3 Jul 2024 08:44:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> On Mon, 1 Jul 2024 11:15:17 -0700 Yang Shi <yang@os.amperecomputing.com> wrote:
>>> On 6/30/24 6:01 PM, Stephen Rothwell wrote:
>>>> On Mon, 1 Jul 2024 10:16:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>> After merging the mm-hotfixes tree, today's linux-next build (powerpc
>>>>> ppc64_defconfig) failed like this:
>>>>>
>>>>> mm/gup.c: In function 'gup_hugepte':
>>>>> mm/gup.c:474:25: error: implicit declaration of function 'try_grab_folio_fast'; did you mean 'try_grab_folio'? [-Werror=implicit-function-declaration]
>>>>>     474 |                 folio = try_grab_folio_fast(page, refs, flags);
>>>>>         |                         ^~~~~~~~~~~~~~~~~~~
>>>>>         |                         try_grab_folio
>>>>> mm/gup.c:474:23: warning: assignment to 'struct folio *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>>>>>     474 |                 folio = try_grab_folio_fast(page, refs, flags);
>>>>>         |                       ^
>>>>> mm/gup.c: At top level:
>>>>> mm/gup.c:2747:22: error: conflicting types for 'try_grab_folio_fast'; have 'struct folio *(struct page *, int,  unsigned int)'
>>>>>    2747 | static struct folio *try_grab_folio_fast(struct page *page, int refs,
>>>>>         |                      ^~~~~~~~~~~~~~~~~~~
>>>>> mm/gup.c:474:25: note: previous implicit declaration of 'try_grab_folio_fast' with type 'int()'
>>>>>     474 |                 folio = try_grab_folio_fast(page, refs, flags);
>>>>>         |                         ^~~~~~~~~~~~~~~~~~~
>>>>> cc1: some warnings being treated as errors
>>>>>
>>>>> Caused by commit
>>>>>
>>>>>     5f408bfe0d13 ("mm: gup: stop abusing try_grab_folio")
>>>>>
>>>>> I have reverted that commit for today.
>>>> And I also had to revert commit
>>>>
>>>>     52cca85b0ebf ("mm-gup-introduce-memfd_pin_folios-for-pinning-memfd-folios-fix")
>>>>
>>>> from the mm-unstable branch of the mm tree.
>>> The patch attached in this mail should fix the compile error.
>>>
>>> https://lore.kernel.org/linux-mm/CAHbLzkowMSso-4Nufc9hcMehQsK9PNz3OSu-+eniU-2Mm-xjhA@mail.gmail.com/
>> It looks like that patch has been applied to the mm tree instead of the
>> mm-hotfixes tree - as a fix for commit
>>
>>    50ceb37037f3 ("mm: gup: stop abusing try_grab_folio")
> So for today, I have applied the following patch to the mm-hotfixes
> tree merge and stopped reverting
> mm-gup-introduce-memfd_pin_folios-for-pinning-memfd-folios-fix.

Thanks, Stephen. I think Andrew may misread what my patch fixed. I 
emailed him offline. Once he fixed it you should not need this 
workaround anymore.

>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 3 Jul 2024 08:52:20 +1000
> Subject: [PATCH] fixup for "mm: gup: stop abusing try_grab_folio"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   mm/gup.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/mm/gup.c b/mm/gup.c
> index 12c7b41712f7..5f58c95b3ab9 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -437,6 +437,9 @@ static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
>   	return (__boundary - 1 < end - 1) ? __boundary : end;
>   }
>   
> +static struct folio *try_grab_folio_fast(struct page *page, int refs,
> +					 unsigned int flags);
> +
>   /*
>    * Returns 1 if succeeded, 0 if failed, -EMLINK if unshare needed.
>    *


