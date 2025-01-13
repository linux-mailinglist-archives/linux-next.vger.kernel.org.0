Return-Path: <linux-next+bounces-5180-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE63A0B1D0
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 09:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6064F3A7200
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 08:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29E7237A4F;
	Mon, 13 Jan 2025 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="CUexYcdE"
X-Original-To: linux-next@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2134.outbound.protection.outlook.com [40.107.22.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0005231A46;
	Mon, 13 Jan 2025 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758444; cv=fail; b=BM/ORBRuS/ngMz29H+7gQ5MNvVw2qma1/EdcKZQjgZ+nfd7tudQ8ugZbbPBOqfxqAY9TW9xcZsYnq/40U7um0HhbRI2CTcb12hvMXXyaQfoSPbwA+LRt9ksH/gxQ154W0dde3U2knUv0/TRl88E1Ld15RZVwPUe5idKom5Qy+Rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758444; c=relaxed/simple;
	bh=s0/0xguqf6+eq4lCCblD04YLOJGLIs7amEFROUWOLuw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MqMU442dQl/tNM21sP5+fquHpuHq6QxLs1WXY91Vjypktqle2zFfCH6I8b76v0YTnlzoYXCBf/AhoDGOXowUUnMgpmmY59IgrRWlVcLlJOrf/tZ8MLJHCKKtFxT5Yer7QaFbx7SkFPF0aP6/jbqYeUXCCL/JIAOHmUbTHcx0XiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=CUexYcdE; arc=fail smtp.client-ip=40.107.22.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EczlQ3gGob3INizN40fFooMBazjEm4al5eOc8CWtrhL29yk0DwRzELy78BHxFHrCQtPfaqDwgx6IuZkwIi7VoBNINcSVV7hphc8WxP8acFKljB5Xh4NX7ccrirubVe8e18jKTof0Z4OqombuGSva4grgzdIzfoDLidbkw+GS1Hn0t7WFpaI8PaXVZYLC1vMK4hu3PgnFWClM9hzSQofZwtlpHdumFndTMStFo9fpIU7EWQI2pKLWuEaQ7e67issxD0iS6UlVmSe8jK2jmIVM3a15tkbJQnK/TiG4H1gahETubykNqAlnOaMjqx8ySq/eH1FhUJB1y4+Z3o6grNdrVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ol1xy2U53r1abh0f1CfprGn1490kdNO+1YTIIdusW50=;
 b=d2xA5ALULOCgmiWgcDQjRl8uIEW9VpCLx9rPuna5BwyC3u5AaUdERPPMeOWy5epkENO9+Kfx8nTr6zhDma/xMxLXC5ggJJWou/aonyG6rS9Om2iJc6PfpFx2qaD2l+mc2BnPWv6hgB6mqHb2zQTaJRzge+vgwKKTpPf/MJk0chVe7xdilccYLgDdjIJ02THmpuIGWn9cGgo9N10XbKBkT4tBFzrp+hZ59L2RWJgQc8nctgv2LyGKKyDyEDxMzuqrUQYn4lKW0t+aZgkb7TlJTq5Uxc+j2P9tKr+GB3W0SDmn6Ph9hr/r+DUnMAA/lD/7knciAkxGS9jc8wHbxNZAFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ol1xy2U53r1abh0f1CfprGn1490kdNO+1YTIIdusW50=;
 b=CUexYcdErwXVb7iLOMboM5Ja5NmB582ycnnaJJbUjaRDMbzqL8772+vDYGQHyAaLIVFon4CnEsbVU0e7FOlpCvv6p4kgIg+rs/Rfvlyq+3bPWnlR/+MwgO7aSet/O8vATx1gRBgXe1p6XMmgen1iHSJuYFcXliabI+sxhFdywHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by PAWPR02MB10321.eurprd02.prod.outlook.com (2603:10a6:102:365::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:53:27 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%6]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 08:53:26 +0000
Message-ID: <133f3d1c-19b2-db19-f4df-c67d1f57b946@axentia.se>
Date: Mon, 13 Jan 2025 09:53:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: linux-next: duplicate patch in the mux tree
Content-Language: sv-SE
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250113142640.54d5eceb@canb.auug.org.au>
 <2025011357-deceased-press-cbae@gregkh>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <2025011357-deceased-press-cbae@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0008.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::9)
 To DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|PAWPR02MB10321:EE_
X-MS-Office365-Filtering-Correlation-Id: e95a96b6-1cbe-49cf-13f8-08dd33afbe99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1R0TU9TVTZMTEhVelZwcjE3aXpBSVkzUDI4Z1hmMHhzSitpY0NyVnlqdTBT?=
 =?utf-8?B?T0s0clozSFVQWWxjaHJYc0pZRldJMmVpdFhyWXlheHl5d0JKdlBSd3ovSHA3?=
 =?utf-8?B?QVdBNVhlWVJzajdLenJ5ZDM0Mi81S1MxNmJWSGJDVkFaclNaL2JJQjdCREZw?=
 =?utf-8?B?WndSRHZ5UWJzVnc0NEtmd2tsN2xJZ1Z2dG5BVVZIazcrNVZlMCtOWlA3MEwv?=
 =?utf-8?B?TkV5QytOYzBhV2NudVpTNWdYYXN5YzYxZDhlckxCOGdXNjNINEhveUR4bGVz?=
 =?utf-8?B?aVVPdnVuU0Ewc2xiaHhTVmRJL2pnWHdNZXBmSFFCQjF1NXhZRE1jZXNqZTd3?=
 =?utf-8?B?cXlzMDlKQThLK0NyNzQ3dmRoY0FUWmZLRmVBUVVESHMwbko1ei85KytjbCtH?=
 =?utf-8?B?ck0vMFJRbGUvUEVFN2lPYWFFZ3RCOTk4NDlCY2FsMXU1cmR5WDFIV0RHNXc2?=
 =?utf-8?B?UTV5SUdJa1NsZ3BFdEhhVlVJNFpyd1QwbzNOdmZRVVVBQnpHK2RUK1lnTzF2?=
 =?utf-8?B?L1R4MUVweTlEL0J2YlVnNEVlY3piajRFYjEybzR3OVdQUEJSRE1PVjE5VTZm?=
 =?utf-8?B?MWI2cXZDZE0zNnoxaGIrNHB6Tzd3WmNGbU10S0wxd1B4S004eVpKR3JXT2o2?=
 =?utf-8?B?dFc5ODE5KzlwSy9wM21TdkJldHdLUEQxYjV0UmpQQmR1YXYrdnNUVWE3eVBH?=
 =?utf-8?B?SWxTOVdVS09rNjI5MjlqNWd0aWdsVmtzYkpGRTNjNXhHNUdwelh4MXQ2NERl?=
 =?utf-8?B?aktxaVJBN3J4cEJDQSt5bTdVWVVkc0k0MnpoR1FVMnFjTm9ycUErSmhseTNl?=
 =?utf-8?B?aGxKelhOSDBhTWREd2s0aUMwVHI0M2YwK1Jta2tkNld0emV4ejB5N0pVNUM5?=
 =?utf-8?B?WHhYWnhBQjREL1pZZVEwWUt0bVd5b0hZdnN3R3hUZUk5UFdLYWh0aDk5NVN4?=
 =?utf-8?B?c1M1bURoZEZFRE5Fa2FoTTBOVllsWTBod1hLV2h3WGlaeE9WWHlYeDBWK09N?=
 =?utf-8?B?NThBR3YvWnVaTU1qeUZNc2xETzgrcTl3MGVhR3BYWlNPMFdKb1NJZTd4VTdS?=
 =?utf-8?B?ck0wNldjN1hnV0w1Q3MyaUc0bURia0tnZWtBdWErU2hRZkdyMEZTalZ3RFk2?=
 =?utf-8?B?cWsySFBTK01PM0pod3lsd2srRFRoZnp3ekZmRlFQVmNuWHVyRU5VcFUzalE0?=
 =?utf-8?B?alpYZHZsbkFNa1NyaVZuU1dBdDNORjNLOHh0N3duOUVjYmVzYS9DdEd0dldZ?=
 =?utf-8?B?b2JrdUZOeVArRDVTZEx1ZlFoWW9CSE80VUFRUWJ2NlIzTTdvcWNVUTd5OTZj?=
 =?utf-8?B?L3pPSlVHcDNaYndISU5QUHFaMmlzNmYvOWlGSHNOSDRaWDlaVzU0Q2VrK1o1?=
 =?utf-8?B?NUw5dnhTNmFSUHI0R05RNyt4SzBoNUVJNFlqYTVjKzhrSStRNFYwZmR4RFFo?=
 =?utf-8?B?U2ZhT3F1K1FleDFZUlZBN040SWJhRGloUk9sdnJuNjJUREZBVDlaRzZGd0s5?=
 =?utf-8?B?MG5RU2o3aENpVk9pUFNVTWFnaThJWCsxZnY2dm5vNGE5WUZ4K2loRHF1clh6?=
 =?utf-8?B?dVpnOHAzWWdheGJITUVoaU5pdlB1WFErRUJCdUxxcFBVT1R2V2hUY2pGYnZQ?=
 =?utf-8?B?M1lCd3ZLRjBDajgvcVF0TFpKS2VtMFExTFBDamZRcjJBT0RpS3Q4aHl1VGhW?=
 =?utf-8?B?SjBCTno1dHZpS0VyenQzeHF1VXBUVTJvVngyYzFYVGpqWGRlTDFxemw2bEw5?=
 =?utf-8?B?aVVvdkdwbC9zUWNHRDluSmsreFJraDcycUo1V1R6NmdpRDhRbnY5ckxiZnZO?=
 =?utf-8?B?U3libVlUYjI2RmJsZG9ud1hEUEZRaEFvaFJDd2ZGZnZtblQxTWpFL3lzaTRP?=
 =?utf-8?Q?T2m7FANr3hztV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjJIWW9oL3EzRzZkbGNjQ2Rac2RGaGw3RzhUM1NTM0FoeEdGL1ArWGlDVFRq?=
 =?utf-8?B?N0ZadnZhTFdNR0tlaTM2Y3dIUXBKd0EzVkF6N2FFd3AxR3BJOVhQUCtUeHNw?=
 =?utf-8?B?c3NDZ1B3QnJSek1zblJ3ZlFZN2NVWFJULzdhU2NOSk9YWnBubmEwais4emlH?=
 =?utf-8?B?TG14Z0dDZWlMMnFxOUhrc1QxL0NVTkpaV2hrQWFVMTNPN004WUFkak5nOWNP?=
 =?utf-8?B?TEpmS0ZHczRnd1lyUDQ3RDRqUnN1Q3JrSi9LZDNIcmkxcjZmME5tR1ZJbUVP?=
 =?utf-8?B?WlhmU2tZam5ZM2R1dWQ2NUZqa2kvakRuU1VNWjRRcVlSUDU4cVVUTVJpaVdr?=
 =?utf-8?B?Z2ZVTVMyYmhRNEdzbkpsNVJGNDdFTExqLzRBZDUweUdrZVNML1dyQ3M1VVN3?=
 =?utf-8?B?TGZvTWJvdldHYWZrRXpVRlVWWnE1dkV2UmozbWxiQ3hzS3crZk1zWW9RSWhk?=
 =?utf-8?B?cVFFc0tEamlUT055ZFRHSGgyUmhXbjZITmN4SE1haEtOczdhN09lQ3U0M2JT?=
 =?utf-8?B?UHg4dDFwVHhDaXZlMksyaVYySUs0bExZaklVa29oV0NNM1grYWZqbmZSeC85?=
 =?utf-8?B?RHlFdzRwTGRvZ3JGY1c1QmY3NjZvUnY1NjVVQnZHWWpYSEJ1VzRZZmRMdlRE?=
 =?utf-8?B?ckdsQzhCbFFTTkh6TFplRjJaWHU4dEt1enNQdm9EakdtZkIwbVB3MDJsNTVQ?=
 =?utf-8?B?V0EwaHQ0eUJQdUVtTE01M2VwSzBSRDRxemdiWE9jY0lmTXRhdjRIYU5udy9l?=
 =?utf-8?B?ZGJIWUVDcGp2R1l3M2NTMEwvSjR1aCs2bDZtZUx2REZ2Tk0xZFVyN3JIaXNk?=
 =?utf-8?B?Q2k4Ylc1ekIwMTZQR2FMRnZ1aVg2Q09pekFObFBKeDZtOG1ITmh1M2loczlp?=
 =?utf-8?B?SDhHald2STF1TzRnMS9Yd0FWL1ExOVlnTGZvcTJKTTZwWldndFFNWmV4bG9U?=
 =?utf-8?B?UVVORVhCaFpWU0FJNENweWNPSjJ3ZDV5NGVNN3pKZld4R1BQU1ZTMzRiVzZs?=
 =?utf-8?B?eng3U0lMRGE0Q01PcXhVaWQ5YzV5TWY1cWptZG8xZy8wRkhwemRxYzBoOVRD?=
 =?utf-8?B?aUhxTWErd0M3SVF4Mm45d29LWFg0dXlqL1pCa2QyWGpXUjFQUFZTYU9UUEpH?=
 =?utf-8?B?clhKak1LazZDSVVRUXJSWncvalFpcWsxa0x0aFl0c2VyVjJDNGxhQmJKUm01?=
 =?utf-8?B?SkhJNjdoQUloa0hXbXNYN0lIay90dXdnUFVnS0NZV0owVXpIV3RsWWtjSG5I?=
 =?utf-8?B?Tk9BL0pQcmtlZ05BS2hESUcyOUVaUHdtYkFiMmRNRC9HMS92eVVCNjZkWGVK?=
 =?utf-8?B?cmxsMzRKcmVRQTFIbzJTVUJQbGhzOG9oazFKTkVjT3UrTmZ1cENNQ0YzVWl2?=
 =?utf-8?B?YWNCdXpsQWJiODVNZkpOdWMvZVRoblYrdTcySWhUYkozUlcyNTU2WXQ3c0hi?=
 =?utf-8?B?SDAzMXFVNWZXRFU0TDFIKzJ0MHFHeU16d0dsYU5SOTZDUnQ1amsyS1ltZ2cr?=
 =?utf-8?B?T1RsUUU1Z2FFMVUyM2ZCUXVNMHpVZlhRQkFHc1N3bithV0ovQTZQcEZJVWk0?=
 =?utf-8?B?SWFmdDI3Mm51bGRTUEE2UFl5N3p0VC9MbXQ5MHpFN2Z2SGtuK2ZUbWNYUW1v?=
 =?utf-8?B?ZDRHV0drM1M5WVYva0JOV1NrcUVQeE9OWWdISW1hdm1jVldoWVFKazdGSmFi?=
 =?utf-8?B?WEZuTGMySVBFOGNkYzkyS3FacmdCVHNKU3dSa2VGV2FKZEZWMFh3SXRsd0N4?=
 =?utf-8?B?ejhlVy8vbi9DWDFTL25iNGFPMGljVEkycG1HalpacGtrZDVCSkdpYmViRkZW?=
 =?utf-8?B?QnArZ0ZlQnl2bXlFdHBOblRNR1c1SkxIdzIwaUpnTTNNZXNhMjRrS05OdlhV?=
 =?utf-8?B?OUsrbldkVFlEYjZVRS9jaEt1VHA2K2V3dUlQNUNHbzVUTitXZ1RzdWJxKzRU?=
 =?utf-8?B?b1c5NFZmYTY2MmlwbzBSVE5jQ3Z1SzhQMUVLWmlFa0J3dmlhTGhVT201QXhP?=
 =?utf-8?B?d2hlVVhnK0tYMnNCRk5ab1BGd1BVR1B4REEwMHMrZWV5ZlR6ZlhtL2RMbGhQ?=
 =?utf-8?B?OFQ3aGVWWkowWFZBZk0zQnJ2MnljRkNYaXNRSWhPbFdlZ3ExQ0xpdXJweE5P?=
 =?utf-8?Q?EqdE3BK1diaRGlvJ4gZ7dgCwj?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: e95a96b6-1cbe-49cf-13f8-08dd33afbe99
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:53:26.8148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQc76hjvytzEe3D59Ya6OBgDxn8VEwMBoTbPF7ZPfkysAyj9TQkw6Tn+oMpxEN3r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10321

Hi Greg!

2025-01-13 at 06:20, Greg KH wrote:
> [You don't often get email from greg@kroah.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Mon, Jan 13, 2025 at 02:26:40PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> The following commit is also in the driver-core tree as a different commit
>> (but the same patch):
>>
>>   49a9b01803e4 ("mux: constify mux class")
>>
>> This is commit
>>
>>   7685ad5f08d9 ("mux: constify mux class")
>>
>> in the driver-core tree.
> 
> Thanks, this should be fine, I thought no one had picked it up :(

It all my fault. Sorry for being unresponsive and thanks for picking
the patch. I have now removed the patch from my mux for-next branch.

Cheers,
Peter

