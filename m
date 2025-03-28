Return-Path: <linux-next+bounces-6063-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66945A74633
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 10:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 984E03A9949
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 09:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDEB2116ED;
	Fri, 28 Mar 2025 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JWhKEgy8"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603EE2116EE;
	Fri, 28 Mar 2025 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743153578; cv=fail; b=fNDHM0rglRl7EkqfZHAjd/yLM8Uf+XgSfLYZaRuZEz+aKGzOdXfrhBNjWQiXR93quWDPNakPO8Ye4Yr+9DRo5REr2UK+xN5q7KBPPRzqklUWzL4kZvAkGNv2lt4szs2xF0xPkMHH7joiYsl/5bgbQCm2qlpouuX68w2zKGVtXOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743153578; c=relaxed/simple;
	bh=MBhOWyAm7ou+/UAk6e4KQnVWtWyBqMlKZOSq2wadHP8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n2JQ2pH0jowPJ+LYBQfnyqTMm9afEkp9l6FnyutxmFWngwPTjTy+TdGBzv6Dx4bn16ncgJ2GN1guYUuXR9kmBkEx1FCLncV9AbK9jYmx4v7lEScyUQvaPJKkYONJwELSHImj/CSTttzl72JRceBQqPXQQZVm5Kdwihy/N9IO46E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JWhKEgy8; arc=fail smtp.client-ip=40.107.223.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xl9MhGRbz0XWsabflzwn/mf8xskjlucikczHCV/XaRMxhzNiTX3vBwljoN8kfZC3uxZ7ANfrhBaRNa3QyhL8Aiytnz8eOjnMh2q8ATQIAYFcETs4ztFh5H7mdw57kTnJgRrGmsmeqeU/q9lMYqIxJCi2EvltS6HIHzuI1VW8ZGCOLtYIe/B8FKgOa1NVxmAEF3rQ4GuPApG7gAb8+krVgtf/1YJ2cNNcc574/n96bhwUTrndclzOZ2ASFTl0PMYNxdMcm0vlwibWNYlRDgfVwqtRHeZzPpSdAtPuCyJ2Vqa3XNLsJpEPoAcqjtqADsRvLCCxU8fvmTPZk1r2G5TUNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWUDemPyPtR19x3G+B5nybZ8h9jNkT/PPYul3uFoL+M=;
 b=UGsqd53x7PtSeBq+yI3A2z/uQBPiWtC6zmGyFSPIEcjIrl5TU84+xV8geFlz53Wdj+UHEzYP+xC5MTGVAlDbnioo0Vhzkqk16I9WZ0UP2yFlgOwpiJRkgIFggcRZMylIlA+pPmj67p7rV++mQU/xL6iDsQMZGPalyipUZmvocfz3EsK7NL5KKw3ig4mZy4kWDBfAQc9qhGubwG3zhG5Fa8Eof5VOdbB1gYY0hayKTkags1q5BU1unJK2Xtd2c520OfNVZgfYdOAIiTGsyZdNTPALhM5dtyjr1FY7taMrVwEaCwUrHValSHM/HtQi4RXd5QuyLeHDkr+acY1EVHoQrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWUDemPyPtR19x3G+B5nybZ8h9jNkT/PPYul3uFoL+M=;
 b=JWhKEgy8fPZmln+pPl4o6M4DeRIYQz/wL0LCLU7h05nZ9Gi/Ee9r9q6tmBhYCNe0nTpi/UuZXJG7kH39udQ73h4UJ7AiDAAhi0Y/oo2OpXoPtJyrLjR7gk8M8YFXbpNsQnQH3tdR+SqZ8BaEeBKIU729Suq5sQmeVceqwUpEYoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by DM6PR12MB4468.namprd12.prod.outlook.com (2603:10b6:5:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Fri, 28 Mar
 2025 09:19:34 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 09:19:34 +0000
Message-ID: <f25ba003-7644-46ed-a1bc-760231534a1d@amd.com>
Date: Fri, 28 Mar 2025 14:49:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Jason Baron <jbaron@akamai.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Roth, Michael" <Michael.Roth@amd.com>
References: <363f8293-23e3-44d3-8005-b31eb5b7f975@amd.com>
 <rar5bkfy7iplfhitsbna3b2dmxbk7nunlaiclwars6kffdetl4@lzm7iualliua>
 <08981771-39ac-af66-e2ec-e8f9bf6aed0a@amd.com>
 <idlcitykk3hxg5by5sltuljyjf7uanmve5fspu6dectubhy5za@mjmv4i5vwyby>
 <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
 <4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com>
 <xcxcte6tzti7e6gcucf2ylfptie6kkvs2q5edup6mtzo5tenft@d2rm3p2yjoue>
 <20250327110224.68c69c78@gandalf.local.home>
 <2kwzi2qxqualhskbgckk6m7oc6vsgupquceqgfx2gnz5xbkier@rwdrhym7yxhr>
 <vhwle6fj3ifmcouppec5adegqludggsxcsxxveqa43hugtsdgy@pb7vd5cqjmx3>
 <m4cubsijicsrtq3blyzxeknsuc4cqswg35yz45uk5lipza4lps@yeqq2j5hf4y3>
Content-Language: en-US
From: "Aithal, Srikanth" <sraithal@amd.com>
In-Reply-To: <m4cubsijicsrtq3blyzxeknsuc4cqswg35yz45uk5lipza4lps@yeqq2j5hf4y3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::21) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|DM6PR12MB4468:EE_
X-MS-Office365-Filtering-Correlation-Id: 478954b0-2bfa-44c9-a2f7-08dd6dd9a71f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnZrNi9zTUZzUTFBK0VsVVBubWtWMGptMGVRWHh5Rm5KMURGaGtqdUpVOHhL?=
 =?utf-8?B?L0toRHljR1VDa1FKdWlGRHZ2QnZ6dWkwNFJGUTB6K0EvMnptejRTU3hBM2c2?=
 =?utf-8?B?c3JtWEJaMjZJL1pTSk04UmlSUzMwVUY0dzV4TXRuMEhHbjJ6NTZzYUsrKzQ4?=
 =?utf-8?B?UnBMTE5td2VrK2hoOWE2ci9RanQveHJtbEVzcXpGRkErTkwrcEV5Nngva2N5?=
 =?utf-8?B?L09xa2twQ0NwdlNyMWo0ZnFpQ21yWXBBNFA0Szk1S1IzUXBFYTNGT2ZRak1I?=
 =?utf-8?B?Y0hHNkcycVlMS1ZoaDRIQ2tXL09rTHlPQlJHV1NzMnJxMWY5OWhxOFpqaGQv?=
 =?utf-8?B?K2N6TUdQZHExZVFidjgrTlJTS1ZzMHhRYklQVHV3UGJjeHM2c1RuNllxWmNS?=
 =?utf-8?B?aElyRXhHTGdyVHpka3VmV0RsbE5PalhJb25NekhpMEw1cHNvY1dlOFpZWFVa?=
 =?utf-8?B?WTdHTlE4STY0MmRLY0hrS21MYUZmdHNpSmZsMXhpL3RXMzd2WStDM2UrUFBm?=
 =?utf-8?B?b0hEdlBEejV5UmtjN2YrbWI3WWNIR2pUeVhPUExucXRsWWVFcVZGRFVQWmIz?=
 =?utf-8?B?QkpTQlpFZ3FPV2xSeUJaeHZKS040a0xZbVFEQVNPR3dPN1VsY1kzOEtoRDdp?=
 =?utf-8?B?d3l4YzlHRU5nMk1aNmVGRXpFUGVuTkUyaWV3Z3YrcWcwNmhjbEhHRXpCS0xY?=
 =?utf-8?B?K2prVC9xTkdkSDNqWS9RUkpVb2c3OFBiTVVHUHgraTVwWkFlQWZoOEd6UEd0?=
 =?utf-8?B?ZmM2NzN5NTRtbk1RMmJUUXo4OFZmZ1JkVER2dDZVczJoSndRdTdoWjNYbU9X?=
 =?utf-8?B?WG5TTUVyd2dnbkdqWkdtTjdOUFo5Uzh5L1pwLzFqc0VCdnBjeTNXWU9OVmdj?=
 =?utf-8?B?V3NKMG00Tk85YnlNQ0xaSm9wN0hXRkh6U0ZSNExRSjVvODlhZkRhK1VLdVYr?=
 =?utf-8?B?V2VEMnVMVnowbk1Kc3dabHIxLzZxRmlRaGpOTU41WmV6Q2FOUStrNTVqQUdX?=
 =?utf-8?B?T1A0WEU0eFRMdnFkU20zZU5SVG1JUnpGT0FhKzNNODAvVkFJRmpJQVpWYmpJ?=
 =?utf-8?B?Z3lRaWYzS1RvVjNYa1Zza01LWkxyODIvd3NvSzFFZnd4RHVoTWdSWGpWQUMr?=
 =?utf-8?B?SGNWcnNqbFlFSVFOUGlWc2VQelRaVVQ3VW9PU2dNNlYydFVaUE9LUWtFNFgy?=
 =?utf-8?B?ZEQyRENMT3NuaWw0ZCs1RldzWEtUT1BNRWFNb3FqRGU1N01FclRncmdIWWRU?=
 =?utf-8?B?T1MzbHpWaWJOLzhPUDNhZnY1QSsvbkFNVTJETjh5NjBPREs3dE9UTVN3VGky?=
 =?utf-8?B?cHEyNVVvN0Z2NFRnejhQdFVhTGppYXoyYnEvZUhKYlZuVktaeUxiTXlQNWY2?=
 =?utf-8?B?NHA3TXFmejdwbHNiVUIvVGpaYUc4QjVXdTRvNEZlUmhhZUNvb3VYV1ZnNi9N?=
 =?utf-8?B?VmszM2RrN1BobVVVbkdwVzg4cGlnZkFVaWdNQmVKZUFUTXJVdW9BRVZBZnFZ?=
 =?utf-8?B?UDlyeFBZa1hWM1RjNXFqY1ZFR3hJRjlIR1lPSjB5bkp5TmNleHpZamJCQjdh?=
 =?utf-8?B?cU95cElUVStXZGY3cEc5YWhMWHliVWtJTmFsQ2lGeTI5dDVuQ2JVQ1BPemZT?=
 =?utf-8?B?bmxmNVNRaWpoU2RzR1ZaL2RsQmxPNFpqSHFjT2tiQ2d4WFJyVlZUS0JqQitz?=
 =?utf-8?B?QnB3dXMvVmpvSVFkVVh0bzNiQ010STI2bmNQSFhsbzRnWk5pYVhVMmpiUCtu?=
 =?utf-8?B?a2lpVjJrd3ZOL1lleklYbDR0WGcrZENYUHk0c3g1VjZ6dHVGQlRuT3RLRURm?=
 =?utf-8?B?SU5ZS09aWmw4eXdVY1htK2loRHhaQTRmMzNyc3gwR09QbWJPdHpvQmpRZUJo?=
 =?utf-8?Q?E2ngD84J4PMfh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFpYcEIrWWMwNUpnSjNmczQzazBHV0NlYkdmeU94NW5ENkdTaVJaQTYrekdz?=
 =?utf-8?B?cWdjbWtWakd6Y0Voa0Z6M2xqazBZVmJ0N0dZeVZJNmNmWGdXRU5wWlZKSkxv?=
 =?utf-8?B?c3VLbFJ6eWdwV05MTmpwYzhtVjZnd0dxUy9oVW1OMXJMWm9VUE42eDlPYUZK?=
 =?utf-8?B?SUdsdmQ2b0c0aUJSSXhOWDBkWWp3Z3JJdEpaWHIvS1dFV3d2eFpqWkg1dm8x?=
 =?utf-8?B?VmZjWVltTlovRE93UmFXTFFYajhPZGM3YWNYT3F2YmZUdzJ4WU43TEhpUjRx?=
 =?utf-8?B?ZENlcEcrK2twY3g2TDVGNGdrMktVb28vcTdwMnJRUnhROExkUEVWNW5lWE8y?=
 =?utf-8?B?NkpjRERpV3FaTllmeXlNcWYrYmZSeFdIOTNDejRvVjhKMHM3bGxwUVZ3Z2RE?=
 =?utf-8?B?MXBPYU8yMWJ0OGtUMGVLeFdBMlZEc3kxbnRnbnFNYk9tSFBhNzNCZEs2WGtn?=
 =?utf-8?B?UXFZTGlsMXBoR1ArRENQNk0wYkZDRVB1Z2dtVFc3WlNlSkVwVjErZUZURGU2?=
 =?utf-8?B?UUlUYUNHWVkreXB1U0JPVnlOaStYNHNHSHVOb3ozZUhEWk5XbHZvZ2VCd1pP?=
 =?utf-8?B?ZmM2OG9SV1BoYkZER09FV1JtV3IxV21iVzNkRVZRODhYbWd1dXc4c29JRTBt?=
 =?utf-8?B?MVFzc0V0VkpCQkhZL0dnNDQ1SGxpdElqbkFaajd0eklMUUsyclhyVHB2VlJz?=
 =?utf-8?B?NldNL3dMcjJ6aVQzUEhWaStGbXNMcEw1Ym5ydzdieTZlb2JOb2NOVGpUQy9p?=
 =?utf-8?B?dzlRQWJYbmU1S1QzTmNqK0JYVHRLUU8rOEFlU0NMcDhOWk1ieFNCQmlwY052?=
 =?utf-8?B?WS8wanc1dU0xU21XcXp0aGNmME1vS2lvd0NpcmRucnZFRVZldE12RDRuZWt3?=
 =?utf-8?B?ZFdIM1hMYkhpajRSNG1YWmtJajEwaDl3V2Z1VkxkMjB4OVFPMnZnRVQwbGdj?=
 =?utf-8?B?aHlvYWtycElHOHFDbm1sdElzWWdaUEQrWXMzSy9uYnM5aTFzdnplUUhtS3hQ?=
 =?utf-8?B?YkhObGVZVVJiY1cvdzlVdlExRGgwUTFOeGdHTXFpRXk2Q0tqSzgxQ3V1cFY2?=
 =?utf-8?B?Rmt1S0NKVFBYRzF5bWFMcHN1TDdwdmR1bTI3dzIvN0dnYkh0SWhxd3pSVWtD?=
 =?utf-8?B?TWM0UDk5Ymk0aWpBcjZsKzVKMk85YWN5S21GTVhiakVyTlE3OUExM3VaYmFE?=
 =?utf-8?B?d0I3ZHlXeldacE1kTkNneEluR0pLNHpkd0pGVHRqMUZpd3NhczdjY1o5UXpE?=
 =?utf-8?B?WGFOVFV2bmQyTjk1SnRSMHhrazNYYUZzNW9mMlhsekdENXFUVWtwRFBsa3Ra?=
 =?utf-8?B?cGZiUWlYckRDRkdybm9Rc0UyN2xlMnV6bnNDVGNVOGdMNTdjb1k3Wjh6N3Zi?=
 =?utf-8?B?eVZMQ1pyaVgyeHdqVWxTRHdKcWk3NVlFVWovZXlPQW5SaGhNNmlMKytMUytu?=
 =?utf-8?B?eVpnZ1pHRVNmY2FQZWxxNm05SDZmOGc1SFhhcm92TTdPL2dTWVFVY09tVXI1?=
 =?utf-8?B?bkRWTURiRjBZRVJJbjA1bFlCQmpqZzVPdFRUZVVqRWVYRzRYY1ZvK3RwU0tU?=
 =?utf-8?B?SXhuall3ZmFmTjhDTWVHM0t4Q1ZlQ2tJeEYzMVMxZThPMGJ6S0xBZk82VDlH?=
 =?utf-8?B?azIvaUtibVlrdjRSc1o4cUx5UHpEVFU4VTNWbk82cisreXRLMVRNUEZwc3Vh?=
 =?utf-8?B?K0hsV3A1RlpZTWl3VTAzM1Q2Z3VwRVFDNmhBNUFJOWtsY2xyNEo3cDhUaFMw?=
 =?utf-8?B?SStRR1NsdkIzTHQ2NkNmNVJQdUt6aVdMcXBqNi9oc3NoYkVuR0R6L0ZXWGtH?=
 =?utf-8?B?UTRJOElrTUtLWExwbGlHaHZkQTFMbzM3UUxheXE0eUJOVGcyOWhsVUpHMzlk?=
 =?utf-8?B?TjRjc3hqVjk2ZDFOQy9VSEtxS01oNVVTNWMxQVVWbUxjWEVBYXlPUGRsQlc2?=
 =?utf-8?B?bXRLZlhwbm05MkRlN01PUkVKTk1sR0RyT1NtR2trS1V2cGFtTlM0MmNrVkM0?=
 =?utf-8?B?TVNJMlJVMDVLMnpLRWh6Mng1cjNaa0FoM2Fvd2ptODRxWHpMK0dLMmprK2l1?=
 =?utf-8?B?UjNJeXdrRXFiNDBOU2NudzBmaytRandRN2QrNURma2NxTE1BNjVRb1ZBSWRa?=
 =?utf-8?Q?x5oEj/04oKyMO40EN5jd3qIkG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478954b0-2bfa-44c9-a2f7-08dd6dd9a71f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 09:19:33.9424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZyea98+rQ+hdzK3oMx9y+AkUeKbZBgm41DbrUzFOyTPQbRr8GRp4YgpLNCH/jT+la1CExBDd2KjTq1c3eKeQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4468

On 3/28/2025 2:39 PM, Kirill A. Shutemov wrote:
> On Fri, Mar 28, 2025 at 10:28:19AM +0200, Kirill A. Shutemov wrote:
>> On Thu, Mar 27, 2025 at 07:39:22PM +0200, Kirill A. Shutemov wrote:
>>> On Thu, Mar 27, 2025 at 11:02:24AM -0400, Steven Rostedt wrote:
>>>> On Thu, 27 Mar 2025 16:43:43 +0200
>>>> "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:
>>>>
>>>>>>> The only option I see so far is to drop static branch from this path.
>>>>>>>
>>>>>>> But I am not sure if it the only case were we use static branch from CPU
>>>>>>> hotplug callbacks.
>>>>>>>
>>>>>>> Any other ideas?
>>>>>>
>>>>>>
>>>>>> Hmmm, didn't take too close a look here, but there is the
>>>>>> static_key_slow_dec_cpuslocked() variant, would that work here? Is the issue
>>>>>> the caller may or may not have the cpu_hotplug lock?
>>>>>
>>>>> Yes. This is generic page alloc path and it can be called with and without
>>>>> the lock.
>>>>
>>>> Note, it's not the static_branch that is an issue, it's enabling/disabling
>>>> the static branch that is. Changing a static branch takes a bit of work as
>>>> it does modify the kernel text.
>>>>
>>>> Is it possible to delay the update via a workqueue?
>>>
>>> Ah. Good point. Should work. I'll give it try.
>>
>> The patch below fixes problem for me.
> 
> Ah. No, it won't work. We can get there before workqueues are initialized:
> mm_core_init() is called before workqueue_init_early().
> 
> We cannot queue a work. :/
> 
> Steven, any other ideas?
> 

I have booted the guest with different memory and CPU combinations and 
have not seen any failures with the fix so far. Are there any other 
scenarios that could trigger the above case? Please let me know.

