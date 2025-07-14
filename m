Return-Path: <linux-next+bounces-7533-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2D8B04A17
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 00:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F1EE7AE20F
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 22:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF50246791;
	Mon, 14 Jul 2025 22:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AVp2NNeU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ckL57iNq"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FC77464;
	Mon, 14 Jul 2025 22:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752531126; cv=fail; b=Eqm3qfrtakYP/DLA+9noeJxazHSn4yYu8DXpsoKakbv1F3snvI86Q3QXuz3SFSQPjvEOTn7QRp5g+18GU1Yq54MvJAV6Jf/82WcZwRIiFlQY7OO6Gv3H2+NE9UreoH3FvqM7R5lIe/IHgamsoRxzLL/29o1U9l8xmUmAv/01mdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752531126; c=relaxed/simple;
	bh=bdViuGlxtWfqy+NScTCcra9nKy7/+rwDqkwmdk80Omw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MgDx9breZeJr+p8s7ziRpEqNfv5Ws2IxV74NQ505BpvdP8t4ECDYnhPFJTM9oP+cadyKk8A48TpGBMOjbWEcylBiMXnnx73JDITsYOP0qOhI/vfIwN6/ZvQd8q1Phtbm8C3CPnn6efGCCDp3ZgsBE35qHhGZFsqG4R8oQlo+/jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AVp2NNeU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ckL57iNq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ELZCER013340;
	Mon, 14 Jul 2025 22:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=QVXwjUhCCg0DDOOvBGrmOwCpuwOKZB4/rV4BvzRendg=; b=
	AVp2NNeUYq0Yc86fJ8w+xDKBewiklYB1kpjt3n3rsSCkRqNwfg9yUxMWDKoFxFwv
	Qa4WxZI+RU9NYANXCak4S8NZ3NDLRFumUJxGMLGhO+OxDQbzL1r63jiKljYz+YaP
	3lTyIMm19jAxkvDqKyjWWH+c2+DisqOYIkVp5GVJ8kDyufJXP8UsFzDe8h7n7tXR
	hQ36D3do/+ccLd9B1Hx2d/0askPQAOaxJn9SpOtdswkJ0C5RP1nwf7uk+WSuspdx
	0dcJRNsloACCZjfhmqaOxOlcLaKKIxUV6yYbnUcbyzGhslDrTP4I1vMOvBIVBaFq
	nnb7AiRhyFnxZ+TbZ8HcLw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk1awaqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Jul 2025 22:11:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56EM2Mn7013034;
	Mon, 14 Jul 2025 22:11:53 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011011.outbound.protection.outlook.com [40.93.199.11])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue58nh6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Jul 2025 22:11:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=afD/KmptMwMbO5sSfav0SsLFOLLrLMFYzcjYOxGPfigSKSaH9A33rMh4N6/Eu7yC6pKSrSuhs/2gHu8a0Xql/sKQIOddADnV7PCwATQoYhuY30jyOsRNtcXmtL9mtVioNU0KBd/JS2f9nYkXXWZhZ2iCg/KD8KfOBz9ej9pn4z5xs2OzZKfWKjFJfOQ7LG2x+NQUg07w7MFgz8z+wwBtX6FDcT+8hPaubBCmEodW7AhKeSbi5FuvxD/xInGsq2AYF8NhTQqykvxs7JfmQjyelJZb+qtqV7HMsPQUGmQL1MXYE8pQ/krhHIhjr20uPOWflOyhOoI8GsCMOI78QH5PCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVXwjUhCCg0DDOOvBGrmOwCpuwOKZB4/rV4BvzRendg=;
 b=Efryaq69BgpdVgfiGBTA3SoLQAD0EaR8PNztoHgLJipOKYc8seFK6945ZkPpMsaN5gzAk8tpYKL4xdwGyqNCXzqD4MgiYuhWG4ZyITCepk9juGwKqrJ3sqLMfzYx6Fphavveuar4eQjwlTq8whM0QHer7UahjoqW5Eamx5HVS2WC0NZNTeEj3ioilWgwrpV1fpx3RMBkfl+RAYJuNbTzN2pqrYbHDo8oKef74H2EqUnf2xAMV0QKv0VOL1stjwjK/ilz7AkIsxPf94HdnMsD4FIpO2gal4bvD2mr5itU4Khj2I7rA2LQ5RP/7gcR8uI0CzsYhJmPKpDP+C+Fy9VhQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVXwjUhCCg0DDOOvBGrmOwCpuwOKZB4/rV4BvzRendg=;
 b=ckL57iNqzzLlUu7x+8r+4ulXv9oNWnE4PIppbM/ARseqiJHVwAvF43CBODhtvnn6Frl6Ey4NCjeYlWN2y64XbEJ5vNjdgkXC+G3TbnZDSS+J7Gn0qIfKaVDRtgV5uLSlsxGijfUOEreEdCyaFgN6lwcG+3KbesGaYNmLJNQmcq4=
Received: from DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::c1d) by DM3PPFEACE3F2B7.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::c54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 22:11:51 +0000
Received: from DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 ([fe80::731a:2be4:175e:5d0b]) by DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 ([fe80::731a:2be4:175e:5d0b%4]) with mapi id 15.20.8922.025; Mon, 14 Jul 2025
 22:11:51 +0000
Message-ID: <e1075c6e-b676-469d-b63e-cb8eedeffad9@oracle.com>
Date: Mon, 14 Jul 2025 17:11:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commits in the jfs tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250715080244.375a152c@canb.auug.org.au>
Content-Language: en-US
From: Dave Kleikamp <dave.kleikamp@oracle.com>
In-Reply-To: <20250715080244.375a152c@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:610:59::34) To DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::c1d)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF35CFB4DBF:EE_|DM3PPFEACE3F2B7:EE_
X-MS-Office365-Filtering-Correlation-Id: e5cf7a09-5c9c-4495-a225-08ddc3236eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0dFMEFlSGNVNWtHMlRYTThidzNvR1RyTmoxR1E0Z2NJMkhoazl3Ykl4aEMy?=
 =?utf-8?B?QlpOMFJzM3V0dzBBZXIwaXpHN1g3dHBiYmZJUnREZXp2bnU0NjRKU1RNaW9Z?=
 =?utf-8?B?N0JVQWJnbytLdm1YZitPb3JCdHBBb1JmMkR2RytKNmUrOUFHVkFGbkRzSDNI?=
 =?utf-8?B?S1NpbEt0UmptRVc4aXBJQm9qTlhDR3Q4N1cva3Q2L0xYa1piQ3RWS3ZYTTVX?=
 =?utf-8?B?bk8wRmFicGQyUUprdlJIb3M0Q2x5N09LWGhVeUZ0Slg0NnNRR1hwMHRGNlhz?=
 =?utf-8?B?bTJ6d0RNcThHVTkzaFhhYzB0NW9Vei83VlRDdGRtMUIyZ1lDaXJyaGI0Q0wx?=
 =?utf-8?B?R3BIRCtiZW5JRW1xZWxab1Y1ZGJxZ2RjbFduZVo2R0NoUnJhN2NqcFFpb1pB?=
 =?utf-8?B?ZUZUZDJ4Q3dRazlONHNkdlZvVlplbTNIV2NuOFl0UmZ2N1ZoQWhTcWhNdDhY?=
 =?utf-8?B?eU5sditYazUzbzRhVTlCdFlZYkdHV1FwSGI4aC9mWmxTY21BUmlVcmJJVlJy?=
 =?utf-8?B?T0VjWUlDTDVTQzBEVkMwODVuSlRXZkY2RDU4ZjY1amdGMWxLWHl4U25CS1NW?=
 =?utf-8?B?OGZwWUloczVlZjNPcGtKTXlHQkJ0MjhuallEa0U3cnZKYU5VK085RHJRSDB4?=
 =?utf-8?B?T3pVUmlaeThseVIwTVl1cEsxQThrOHk2YkhUckdZQmQ0dE1kYncvZHkyUWFO?=
 =?utf-8?B?ZkJIRzZsS0xoQ1lRWUlKRWZtR21mMS93amFQOHFSdmVqNVpjc3dMV2VRRU9R?=
 =?utf-8?B?d1dEczg4Q0ViaE0zL1NPcGh6NlZab3I5UlZUY0xjOCtES2RpYkxhb0VSbDFS?=
 =?utf-8?B?K2ZuL25rRWZwZ2REMEdIN2QxNjdwV2w4ZXRWWXRWbGVOZ3AvajJvZzB0eXRG?=
 =?utf-8?B?VnBiSFFlaU9GOHIwZk9td09GUzh2am5xWkgvOEtnYTBUZ2hFemJyTVRQY0dt?=
 =?utf-8?B?MjlUY3ZjaGQ2OUE2NE13SUttQldKc2hnTVFHYVJCYzNTNGYvdVJvczJWWFN5?=
 =?utf-8?B?OVlQSzBwMlh6Z0VQSjFmY3FhWk9NZW1IUnpRQnJuOTUra3dkTllWQ1ZUUlNR?=
 =?utf-8?B?aktJT3FHZHQ1YUxrNzFEMnBaNWdQRnlTRDRJV0ZGZWpVMG5hZlRZMkJ0MWRQ?=
 =?utf-8?B?cVZ0RTMzaTU3OTNNYnNhTnp1QVhnUlZ1UEdVV1FMVm5hYkliRmRMdW00Yldl?=
 =?utf-8?B?d3FOM3V1ZW8wY1Qxb1ZMcjJrWHd6RHU0MUVseEZld0tjaFdBeXplVURuSy9H?=
 =?utf-8?B?aEwrU01pb0FKazVZSFRWaWVsbmdia2kvZ0JwMWVFTEJFOXZ6bXd6YmhuSnUw?=
 =?utf-8?B?VGdpN1FzNXVQVHpLTnFBa2srQ3VIRVY1cWpTTzh4QzA2V1pHUkt4SUIyTUha?=
 =?utf-8?B?c0RreU9sUFBSbEZldldDNUhqVlJLOTVaakFNa0N3U3h1azF5K3lnc3BVd05T?=
 =?utf-8?B?VUJZdkVjUUhvanVBRTJrMUE0RmE3MmFnYjg1enBwb1RWdmlISlNlQ3hBRW1t?=
 =?utf-8?B?TWgvN0ZxTWJIaFZQZlEzN3ZmVTlRd2FWM24zM09pK0xSYi9zRkpqL2NiS1BR?=
 =?utf-8?B?QTRYYnczZnpiVnZhMERHWUxrMzUwTGMwTzgzKzFMQS9rSzhVWnUyN284RUN0?=
 =?utf-8?B?SW9ZQUxIWW56UzRIaXd2WVo3dGJXR1E0OEhnb1BIbFhuekNFUElVYzZMSTY3?=
 =?utf-8?B?WUFLclozYmtWTUZ6M0wveExoL1R3eXNqelo2VnZmaVNBNGpEWUNIeS9mQUZV?=
 =?utf-8?B?cTdXVjBTVWYrMTBIWDlGU3ZqR2t2MFR1Lzhubk0zSjkwRmhHR1ZadlRUVnFy?=
 =?utf-8?B?b0cvRE1HakVsM3NOYnVHOUlYcWFSZHBCaEd5a0N3NE5FZG5PdmRvcW9nVFF2?=
 =?utf-8?B?dHFNUHNwd0xxaEo1WVBDNmNhWTN6UExDZkZwMTlqL2ViNFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF35CFB4DBF.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1lTL21ia2I4ZTduemFVVXlhQlViVTZtL2ZkY2hXcEZGNmtUazQvbWxnVXNH?=
 =?utf-8?B?LzczSTNRQ3NRVXdhM0Z5dnJuM25uTnVXQm03QTl3Tk1FUHc3ckxtQ3Z3N1dk?=
 =?utf-8?B?S3JscHJQckRuWlVmMXlmSllsS3YreVQ2Z1BXakFCRjlOQjVZdmlOME1LMExI?=
 =?utf-8?B?MjVkb05rMHdLYWtaUTRwWjlIK3VpQTFVR3ZKWmJEVG5NdzhVLzdJSlNPVkxp?=
 =?utf-8?B?cm1vWjRPbmhOeWVaZURraEhHVHZzNFpMZXdpZC9FUHZ5UWZ6cENMVVhRMWhS?=
 =?utf-8?B?WCtMUnNpUGsxN1dQVlJUdXF5L3Bic0FWb2ZSYlhIZVJOT2JYSC8rRjJDV0M0?=
 =?utf-8?B?bzdjbVI1aGUwcngydjh1NU0vSTFFMnhiajJ1cDNwaFUxN043dkxSOUJjUmx1?=
 =?utf-8?B?aTVoVHdlQ0kwWXk1WkhvcWhhSEVkVnVjZ2pHa2J0WGh6ZWg0YXR0QXpMaXRy?=
 =?utf-8?B?dndESitmOWRlU2J1S2tqeUVhWnJSalBMYTNHQmp2ZXhSKzRkOXVUbjlxY3Zz?=
 =?utf-8?B?SjZOUlk1dTRwNFhWMHFZYkFOMkNTMmRyTTljR1BMazFCMlZVL3dBb0JSRHdZ?=
 =?utf-8?B?MUltQzNuMHcxU0hlRXVURXdzVXFlNW53eVUxN3dXYlc4THEvMTlqZ21EY0tE?=
 =?utf-8?B?dXJRSHFMLzY4ZGF2ZWRBTlZvTUJpeFF1aUZHS2N1b0NrQklNYnVWYVArVXRu?=
 =?utf-8?B?WTErY29TY3pNUERzSVJoNG9hcWg5czBid1B6VWxOU1BrbS9oYTBFV0FXTkll?=
 =?utf-8?B?Z0Z2Sm5vNis1WWVxSTFiQU1vcXNwcW1oellyaHBlaWMySnBXQW1ZVng0aVJ2?=
 =?utf-8?B?aExHaEVyTHNIZng1MldocVNPek5JcHlFTmoySCtLa1R4MUNraitKTjlmQ3d0?=
 =?utf-8?B?OEZKeXRpMjhWNHFxWUp3M0Q1anJ1WjR5UUxsQVJUYmpvaVBLY0NrVVYySThN?=
 =?utf-8?B?WlkvNkhjQk9tOTBlQjJJWWxqaENJWGp3dnNrQUZlSE5wNzVZUFF2WXRnZ2x3?=
 =?utf-8?B?N3ZiM1lUU2NJbUhxY3M1ak0yaVRLcTZ1bThkWUN0MjZIYlByVy9nVWdva2RE?=
 =?utf-8?B?T292bkZDK3BhUy9hdlpZd3BMMmUyamg1NEF1TEYzQWpKK1YxQkoxbm9BZ2ZQ?=
 =?utf-8?B?TnoyYWxTVnUrVzhrQ1BpY1JSaHp2YTJkT0ZjWnJWNi8xZlVxN1Q0d2xJbmNN?=
 =?utf-8?B?UjRQSUxqdzBvQ2lPc29MZDBnUEt0V1pHUGE2V1VXZExwN2xYYys1QlF4U0FR?=
 =?utf-8?B?cEpWdzVBcHJibHRSdkFuMlduV2dDOUNrNmdaNTNPaW1YY2NtR1NxSEpFaFI4?=
 =?utf-8?B?WE9scGZaeVMvUG9WRGZVdXVGUE81dENJTnplY0tHWXpzSW42YW01UXpnNFNI?=
 =?utf-8?B?SExGd2Y4ZkhEUXpZa3FCeE5SbVl2QS9SYVBNelVFT24wem5yT2xtNC9IWHFw?=
 =?utf-8?B?ajRCSGdIZ3prd0FIYW55VytWT3E2SGdpbFdhaXpOSytvdDBTMEpTelFBamtV?=
 =?utf-8?B?NFVZQ2VCb3RUOXhsZUhuSzB1WGV0Y3ZPaTVPbXRyQWg4aTVzV2tRWmdWczdN?=
 =?utf-8?B?aFh4TG5uMXQ4T3JyV1Rkdk0yQXVtSWZPRk1ja3N5bjdoTjVNeUZjZFU2Tzh6?=
 =?utf-8?B?VXhnRlA4bzNlZGI2RStFbWlxdWtReFU3TzRQQWdVL2JIOFNBVDYwZWZvcEZu?=
 =?utf-8?B?elUzeHNncW1Id0dGY3FQMjRWMDlXOXJqS2duWG1pS2l1Qmsza3hkSW83MlJM?=
 =?utf-8?B?cVF3WTlkVjNGaklvM3BIVkZ3Q2lzTUtkOTZ4ajZNSXpPQU1FdkJWeFRLamRR?=
 =?utf-8?B?YXB3eTBmV2lwUk5qU2RsWWR4RWpIdjZHUkc4ZmgzalFSYlEwZnZYYkh3ajVP?=
 =?utf-8?B?SURHTUhkbmRQTzVtRWJBMHVPYStSYVhhT1BzRHE0U0luaHVFRk9VUkpTekNW?=
 =?utf-8?B?ZHF0MDhFcWhYVlhBUWJxQ01vNWRzekpteHYyS3E0em5YblRrL0JLV29nZ0da?=
 =?utf-8?B?UjQ3MlR0dzN4SjNCVlIwVVRSN1laY0RGbTRvK2RNYnFFd05XNzg5YmhGWUlS?=
 =?utf-8?B?NTRGajdHMGxqeC9aTzVDQVY4NjdWeDZ4Z0UrbXdqR2gybUJUUU9Sa1hGWDZD?=
 =?utf-8?B?d0NGbTZJSVRYcng1RHprcDZMSmxYK0Z6eVFWUG92WXA5WWczakdjekV2RVRN?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zmSg5W/QL5IXDpKrvKz4OY1DwS2CSown3aPnYEYK3w9jB7iQ6pTALsgIm310kcO+1yLQkzayaB9kQvRXi7ScsL5TYGJtdNUxng6AKRKmDFmqyGFodBbJeNSb/6bBNY3TE2EQfSWkeR7FVY3uz5X+lIhvnpBO0aYm9OsZPBW92kVuqUJhK9EZJWaJUVS4ym65qeEwxVe9Dnw1/tWQhpBeRR8TnC/nsDmKRt30NKyVkfPdfcKasS6you7lSWiPKaZdHn+y3/EJz841TBShLb20yGOvf6QWMVITp67LX20NvRqrHKW9SIkeciPnuyE8JbhDxsfM6nLA04a4r4DJWNIiXs7T7gh2hAOwLcO4f2+pvzHxFzJD7t6PqWsO8/u18+2fmlX81l6BqTniqP3Si19gkEIwESHD8847Iu1CDXg4/cvx1o701icluLnQIAAX4aSEvafjYx35YgHMPh1hcvIAP6/DrTtQbhM+L2EjdVnah2de0VgV+WNjCRlVJ/ZTp2QpDzxCRe/GOLT1YFqaeZbXFg0U9Qmska64iraTpoNWQ4tI+tnMk508e8lzPqUc4cm86BuI2QDlfWNE78gxIO51iT2sQEDbBXcnAK12vtpmsiE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5cf7a09-5c9c-4495-a225-08ddc3236eff
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF35CFB4DBF.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 22:11:51.2171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HI4VlUiz48+L2hLOfBNRPtrkUA8d1ytt+KIVBQ9ndp7rgruHLm0jJOPwyqn+hohvDsOTSed4uaDj2y6e3boRQ5T3wAkySiSiaV5STw8VA4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFEACE3F2B7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507140153
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE1MyBTYWx0ZWRfX8T/uG9OpyTHY AFxVJ+dHC56W+3n31TPkBRhKaCr+rlm3ySHm1PqFhelU1wbGw+S1Hv+SmYE6eSBXULTaqnKLCkV F8Un7sfJUmXCiVtFajsz3GIM3z0EWAwFPf7sxd//jhLkQcSnT1cm7QxHVtheVbk2Q0lgR1Agtpo
 r9gFJ6CPOKqLnXeFdS2W+Y9vfXLAvJIHOc39xShOY+3qUi5xFhJaOPnfkE/lWYydFrmvoc15InD WroWTOJISpj/rE1j/04p1jS2PDEE7J2u4ARotpDjS/MUW/ZqeWP49NWBN6N+kfAGfJAGRb/Jzyr RcwtdHP6Ko2cJ6tC/+ZqACXmvKdcZ3qrDBhVZIJT3BBOPFT9cKj13eSWN70Ub1zfplj61c2xdQM
 orBSR88RnFNBbm00bDh+fxJCHEqP0Q2/suiTRpR9aArajEUC0Jt/UQFyzGt+kSyRltKeekwd
X-Proofpoint-GUID: UnYNQhtDDXMmC31i9CAm7RDHtLHHsG7L
X-Proofpoint-ORIG-GUID: UnYNQhtDDXMmC31i9CAm7RDHtLHHsG7L
X-Authority-Analysis: v=2.4 cv=J8mq7BnS c=1 sm=1 tr=0 ts=687580aa b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=OeaBf9qcd-L2rX4JhCMA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10 cc=ntf awl=host:12061

On 7/14/25 5:02PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>    4c5232572aee ("jfs: truncate good inode pages when hard link is 0")
>    96a7c5605a49 ("jfs: upper bound check of tree index in dbAllocAG")
> 
> are missing a Signed-off-by from their authors.
> 
> Please fix up these mailing list munged addresses e.g. the Reply-To
> address is probably correct?

Fixed.

Sorry I missed them. I'll make sure I check this more carefully in the 
future.

Shaggy


