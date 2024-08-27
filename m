Return-Path: <linux-next+bounces-3453-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43724960DB0
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 16:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA4CE1F230E9
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 14:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897371C4EE8;
	Tue, 27 Aug 2024 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QPm0oLLJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tRj0K38G"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98C91BCA00;
	Tue, 27 Aug 2024 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724769269; cv=fail; b=WKyXYoxID3uzHDCZXDhPNNtHEIqwnZX26lWR0F8KwX/qv5DRh9Ftd1jsfLL7k9mCm92RKslQv/bO784vls8mLy9JcYSBnzSKi18VAal3Gr9d2d6YIzQnvG2tEb3EJieNROZESJLW5CCct/wgBd1FIbsE5czSY9D3h+dN9pG0q8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724769269; c=relaxed/simple;
	bh=ms9E4NZ2hTSsvyfGi7Wq3f98tMpmmLq97x5gX6PAo/k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XPKp15MI3JzmHkH3Q+CoefHlV1iTjPKVpqH4ao+z+P8+ShejUA1nBMjmdyaObBA3U7ZnIWou/vS7I2L9E1FGspnffnCiBdmUWHbTeWc22U7+0yJrqT3FYO0ZEcA/jgwrzzSp6BqdZ0qTvH9rY1wU5EPo7wAkbZvt0UCUAKz4cgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QPm0oLLJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tRj0K38G; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RCBVED006492;
	Tue, 27 Aug 2024 14:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=corp-2023-11-20; bh=ms9E4NZ2hTSsvyfGi7Wq3f98tMpmmLq97x5gX6PAo
	/k=; b=QPm0oLLJuKHcUFclI9atsvc8yhB4gu0vP6iMOh7YF0Ij8PpffOxPmAPpS
	h1V065oYz+HwUS+wGPQh1GomuaAMgkHTvb+S4MbDq4l1AdDLMSpJGMd2z98+mmfo
	l1KVRnmTT8SCiGEDhZLjxsHi8nra9Fd9CkfWIthFV1OQRZ3RmP/YQaw1L+LS10y7
	8N2Q61II5TYxvHoCbTiStFwIdjm3JcDIwDFeQUBSfjfgOHILaVB7kp41UF27610y
	hsJ4qzmQp1cdrLA7pCGLb9U/YB0q7qfQ8DbIF/L/M5lKt2qABshjo2/egV/S5CyA
	ktuTzPsKi9FHhsBIR4TzPsnZUSvyA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4177nw5mvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Aug 2024 14:34:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47RDDgDX010631;
	Tue, 27 Aug 2024 14:34:20 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41894n19vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Aug 2024 14:34:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqdJBEpaZSsBsjESwIRZunrYUwXyuYlQM0kh2Pbk5HCYP1ayP/97xmVsOclvogIOyoGX2vUzJRD0o/494mPSNXnf3iZl8SdMozkcTLmkaLqOkleCkV0hpmbOkuQWVigbwR0B0HEHLil/2e7xn6MKcVaWm0GS46sdUhswKfG9E9xRb00QEMvi/vghxs/hi/23KLBm/+7fnEsaUhukE5j2tzdZpVkuKZr/RNdsu5/888q1xD/gdkIFA67Tepv48ZfSbXBnIUEXcqhLrn3wpsOaMC0ALIotk93YTZwvT4LLQx+uKkXn5Wpc0HpPnShS9uXeaxOuy9mwqqQpqiOjqjhHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ms9E4NZ2hTSsvyfGi7Wq3f98tMpmmLq97x5gX6PAo/k=;
 b=bQ/JczVaq6e0RJinsudKLk00byDJ0T0Vh0C00jPY+FrtdD0k0mPtwDRY2XKKLZK/GquYDWUNoWs9vd0RZHUWhH8sfrCP/j3ZoYkb4UnuGQH4YoRSkt8UYvojsnUV0MgN/urCHOY++tyYRLJRlhlJX9/tzKGsh3AY9QNLHAWuvPx26JQC8+lK01HyT6Q9vdFJCfmD8uy1PTujAye6Cma0jxClgMlpHsnu3afmg/S5nMHq+cqGATsn3dEmgZAP7o0QyQr5FZmCAnlprnAQ4yy25WEyUH2AkzdcfbUOMZ0UVShFs2L9ZsrtLnB1+KONm8Y1a7jTMihc/EJakB5uXFxofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ms9E4NZ2hTSsvyfGi7Wq3f98tMpmmLq97x5gX6PAo/k=;
 b=tRj0K38Ggr+Ov7URwTAGiPjHbEq1WQUy3sk30RGgoyvf8BS5TJylArb75xK4FQvOSHqJF21FGiDqLHhaOArXjACD0uKxQYHtsvIEtZlB9h4Vd303DH1HhpLxGz4bm1E5mZ1rgWukNUJPBS4f9om+wutNoy91U6yHTT9lynyWuFo=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA0PR10MB7603.namprd10.prod.outlook.com (2603:10b6:208:485::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Tue, 27 Aug
 2024 14:34:18 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%6]) with mapi id 15.20.7918.012; Tue, 27 Aug 2024
 14:34:18 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the nfsd-fixes
 tree
Thread-Topic: linux-next: Signed-off-by missing for commit in the nfsd-fixes
 tree
Thread-Index: AQHa+AT00oMLtRlTxEecb0Ry7i5S+7I7LE6A
Date: Tue, 27 Aug 2024 14:34:17 +0000
Message-ID: <9D9347BF-4C4B-4599-B63D-753BC0643693@oracle.com>
References: <20240827081141.051462a4@canb.auug.org.au>
In-Reply-To: <20240827081141.051462a4@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|IA0PR10MB7603:EE_
x-ms-office365-filtering-correlation-id: 155f28ca-c96f-475b-e41c-08dcc6a5551c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?akRaeVNIWlBtdFhKbHFPTk1RTnR2dXJFNEZLWUU4RXBTS1JkclE0NlhHR0xq?=
 =?utf-8?B?b3krL2syaUZma0FxUzdrZk5aWENJSmFnZXdRVEpyOCt0ZnpLMTBOS1BNTnB2?=
 =?utf-8?B?TmR6Sm4xczZvUUYzeTJiL2NVUjN0ZDd6VmtBSyszalhDcXlQSlFQa1JCbzN0?=
 =?utf-8?B?K2xlM1JpbHVZZlVvS0V4d21wcVlMRGhlUHFudU40bVptdXdBOGNYRjQxUVNW?=
 =?utf-8?B?M0QyY0plZVVuS0d4bUlxSmpWc1IrVFYvOWNVRmpJcThzVncvSVVoYUtUcGln?=
 =?utf-8?B?dzhmQ2d0RFBNZFd3a0xNWXo5VjNnY291VE9PWDliMk9VMDdmbVB6TVhvQllM?=
 =?utf-8?B?bVppVC9CUnlTa0NSckptK251YitBQ3dadG9QN1BFMzR1bHBLa0ZSRWdybWJq?=
 =?utf-8?B?c3E1MTZsUkhkQ3AzTTV2bG1BbEdSK0doWDFtNE10cnJIdW40T0xqbTRFWkRq?=
 =?utf-8?B?TldYc2Y4K1JJNWhGakVmaDl1eFBFMy9tMUVKUUltbUpwNXVId0t0VGNsZ1U2?=
 =?utf-8?B?SDY1MHMweHk5ZnNQZjFhL1VuNjAxWVJrTkRBSUZZVnUxNnlRVzlqTFlSeXJJ?=
 =?utf-8?B?aURXekp3QVFUYXNocjZZZ1cxY3RULzlpZFFFM0xSTkdHSVB2Nk9LZzFOZHZB?=
 =?utf-8?B?ZnMzK1JyMnFUbDdIOC8xbnJOR0tHSGZ0RWtPNUNEUExNZUxZaVYzc2xWU1o2?=
 =?utf-8?B?ckJudTZkNnVTZnhaSWJ0Ry9hZlZSQ3hqUUJtalZPdVJZWjloQ3VuQjBwYWlM?=
 =?utf-8?B?VGtndksvdmRZWXNQTzB6OFVkQzRWa1lUQnR6RUV4Vmw5NUpkRnFHTnY4WFBK?=
 =?utf-8?B?azlpdHBJaEZRK2MwQTI0aDZ1TzYxWHJ2aDR4b3oyK3poc0ZwOEMzNHBlVFZj?=
 =?utf-8?B?QlNmaHNDUHlxY1R2bnVjYW5Rb3M1d2lIZ0ErVE9GdU1lVTg1ZC9ZQzNXTHU1?=
 =?utf-8?B?amNWcjdMNDEvVWRoVUJCM1RPNUtmdUZldjZZbVZPVG1FZE5ZZVRXdmdSQ3J0?=
 =?utf-8?B?SVlDenlwakZ5MXQ0bGtZUUZYNGFUN3BNNmFkdnYzUlNBRHkzMGg4RXdKMlBV?=
 =?utf-8?B?aDZ0bElTNGlyMGxmOU95UWpXVk5uN1g5c3pDbFJFWkNvank0UWUwZHFrV0p4?=
 =?utf-8?B?MHZPTG02aXU5STNHZk5XVUMwZXo2VkkvaC84MVZQQVNubjBOd3AwVzNjNVRt?=
 =?utf-8?B?ZWdnZjdEaU4zQVM0OTROSUZNSks2Vm1aMTQyT1hsUDA3SHltYWVlaDhZYTFR?=
 =?utf-8?B?VEVocVJuVEd0bmVSMVlyUlpBT092c0ZEVHpITDlPazFpMWF1RTdsWXFGbXVt?=
 =?utf-8?B?Rk5LREp2RmcvMUJEcTNUZ1cvbGdNd3FSR2FxZHB3TzRVK3A0dXhjQXpYcjk1?=
 =?utf-8?B?N0pQNE5uK0ZFeHJ4aW5tMS9aQjgrczM0ZnVOeExuQXZ5aTgwK3dRWTAvU0NV?=
 =?utf-8?B?M2k5Y2tyc2dXQUN5d1JDVWdPcVdUb215cUVrTVRXNVBSbWtBOGljdDQ1ZFI5?=
 =?utf-8?B?TmwxbmVOcitFMGlpS29DeDVuRkFHM21pMkJlQUhxR0g5K2RaM1RJMTRMQWFE?=
 =?utf-8?B?Wi8xZlNQdklkLzlqNDVJY1pBNnBkbmJXSldvRFVnNTZUd0J0Q3hlSWNYU3ZG?=
 =?utf-8?B?emtOWm1sd0tHcmNzNndOWndrOUJlcUlja3Q1NnYvOVh3L3loTkgxQktFblc3?=
 =?utf-8?B?ZGZGeFkweVJlYllhamFqNlV1WEtZOTRHaklaaWwwcUYwaG1obGJYb0tJbWpp?=
 =?utf-8?B?QkJzM3duK3hWRFBQUk9jbVhUM2RId1Q3am02WUljRlhOcFY5VGZhY3dxTHNG?=
 =?utf-8?B?UHpnWUREWHlvY1djUjlrYThlY3pybW9GdHdVSXhNSXNpKzRncDZjOHIyN1BD?=
 =?utf-8?B?THV4bFU5a3ZDUENOajRYVmdDQzl4eWZCUkFmTThNWXMwU0E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dDNXTEM3dlJTRmVOb0JsWWZLUWE3Tm9lZFBJVGFaZzRQVVBJcU42bkxQNjkw?=
 =?utf-8?B?S1hCNWg1d1dUblBkdUVCTk1TQzR3cDl3YmJwUDZ4dlJ6THl2OWtQcVE5NVow?=
 =?utf-8?B?S09YamEya1JkMTFxMk1NS2NuU21wQ1c3MUtnN25uM2xpQTIzT2ErMFRIeGtY?=
 =?utf-8?B?cjJUcjREenI2RWF6cEVac0V4WjdLMGtESFphczZvb01jNnVsVGRzemFvcFFU?=
 =?utf-8?B?bUxaTlZTQy94MDg2alhxSE9mYldkb3lkUWxERjJ3aXQ2QUNaaUJ3RGROdndv?=
 =?utf-8?B?dTZQN0poMmlvcXJLRzRFK2NjajlKOTZYTjMxMTFCVGkrbE1JdFJML0FwajFE?=
 =?utf-8?B?c1hDWEU2TktBMFpVNnl5UEVHejFZTUZUTm5ISDdxc1pGMU1aTmdyVlRaNHU3?=
 =?utf-8?B?TnRHS2w0VW1XNm05VnVQR3R4TWk2OW91VFlYc0FxTkQvZkxxUTZNL0p4K3dK?=
 =?utf-8?B?TWZUbFUxb1hvTGZKT3pqek81YWY0eEhmRTcyUlFqNTg1cGNWYmluZGthS0pi?=
 =?utf-8?B?anBHb1FsWVMwcnVWYjhRU1NWU3lVS1U4eXVHbEg1YU4yVCtPLzVYRWU0eVAx?=
 =?utf-8?B?Z29kN0QySnFvVTMxa2xTUENWZE9pVUx0MTJBd0hEMGRURFdTMWdkK3RyT01s?=
 =?utf-8?B?RFRma0VFK3l0eVN6Qnl2RTh6d2cwbW50aUNFcmppbHRKckRXdHYwUWlLNFBN?=
 =?utf-8?B?TEtCZGpYMG8wZkhHNTU0N3MyKy9HNmlFM3MwN0V6WXA5M21VOFBOMXVQWFlY?=
 =?utf-8?B?UHZnanB0MnV4cmxZMDk2b3dSSTZhNzFmVElWcmpkTFZjbmxZbjl4VjhTbk91?=
 =?utf-8?B?SmlSbDMraHFaVjM3RHlLcmgvUVVyUUZMMGJwZjlCcFpaMXR3OXFwb3ZaWVh0?=
 =?utf-8?B?VURDK283QTBxMjZFcFVNUERXNXJheFFnR2tlbHlUc1VQWU5jWWMwbnBTbzFv?=
 =?utf-8?B?d2RKU3BDODV1NDkvTVVhSUhKMHFMa3phKytzcUwrdldleHZPaUFMeWhMVWRm?=
 =?utf-8?B?MEhROTRUTi8rdkRXNWdxaGllUXF5VHdXcTRqZ1dwRzhSN21jSHR1UFZDbXBr?=
 =?utf-8?B?MzhVTjdRU09JaGY2ZlpWK0t1L1JRR09DdTg3NERuNk9UVms5amQ0Vk1Bakw0?=
 =?utf-8?B?SEpPNjRzWjNqKy9NRDJCamdkTVd5K2ZVeFc0QVZPcWo2V3VaTUhJRHB5N1JD?=
 =?utf-8?B?bTQxS2tYVHVYR2padHN6alBUanB2OUI0UUFSQ01WZjFWREVlSVJjUjlnZUto?=
 =?utf-8?B?RXV4YUhvb0xsQ3V0cEZLdjF3UDF2Qm1PVytPOUtQUTZjUXllVWtzb1g4R3Bu?=
 =?utf-8?B?c0tXNVc5b3lOcENtaFpWY1BKY2pSckpLdzhjNDBFazhQVmdzMXMzZXgwL29u?=
 =?utf-8?B?VW1xN3FWdnFVWXFzdmo3alU4Y1A2ME5wVElmUXZTK0tzSWF4Q2MvNk5KWTVz?=
 =?utf-8?B?NGdnSG50Uld5dC9WalU1MG5VOW1mbm1IWEVTbFNYR0lDV3NVOXpqVm9jc0NE?=
 =?utf-8?B?d1ZyQ28vQW15Z0FnQmhCTWdtckhtOWg3dmMwZm1ybVdXK2FEUld5cHdKMzVV?=
 =?utf-8?B?VmNTOHBVY3NDVU1mT2U1RG5lNWVZZmtBQjl6VThMbDF2VjdIcEhnV2oxOFk3?=
 =?utf-8?B?M0hRa1ZKOVlNejlsM0ZvSksrYVc2Qk9Td2lDNTM0VnQzdnJYYldFdCtTcHlQ?=
 =?utf-8?B?YUdid0FMSjhnK2l3dWUvNzAyMGx5cEwrYlJYSXYwVXR3cXhrQ0txK21HMkJS?=
 =?utf-8?B?RE1WRGEyNlJoOHAvUmxaUTZ1WG4yQXA0Q3lKSWVNUzRZeWM0TGpzUUxFeVVt?=
 =?utf-8?B?enF0UW1KUk1DZUp4SW5oTE5vOURvZEdXSHpYZThYZWJYOG8rclZmYTJ0U3g2?=
 =?utf-8?B?ZGJkRHlsYlVZOVBGWnh3NWJtQS81MkhNU0VESm1nTkZ5bm1FUEw2VDhSWEg1?=
 =?utf-8?B?OXhrcndPb1lTYXlHQ0IwOWhZUGtqZDc5N0hEME1PNWRVdmdlNXZBTFZDc29z?=
 =?utf-8?B?WDBSY0czUnRYdVhRNDUwZTdXbEZUY0hvV2p3bWhzOXM2a2kxVDdjZHBPWHVI?=
 =?utf-8?B?WmxHdFlTaGhSa1ZOcTRJWHJIWERZNmhVKysvK1pRMjgvSnFvMDAwWFRzK3Rh?=
 =?utf-8?B?UU5SZ2hUL1NsOUVBSi9KY3MxZElpRXc3bHgxWnYyWmU1ZUtBbTdHUmJ4WVN0?=
 =?utf-8?B?Rnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8AFB9274958464B8990B5016F0F47B3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F7jAVdwOX0XNUiHqB9OfEDLCK0RbGj1D9rvZ/dP8zwkV91qKSv+J9VHyCtdkeY1NYWcbt/FsVmPAfh1a9wTiDD9eMnp+G5Kyjk/nLc8QXwLYsXQhge3/PHQGsgb2/4mIub98seu6ilAZi7xWJNR/6aJ5hv7qtLnbutPiH31/ECVJ+dZGoOPWwAErlr/A8nJesKt/QZLoI2oFCMMyhsLTCWJxPmXIhfeXvpi4vHHooZRgtC//frMIFOD1RmhYrpopyA9DVltlZk6GUuIY2M31wya4BZrbSsA6UtvnDvq2+AOAsGYeTfE+bb78Nb3xG7FGRCI//PCOBTWb7C5hveUs8gLlAnFKnSx26LRlnGf+rTNmHAtbQ/jetj61a+wK2CyDkoLc20xNDS08PakvcAoEe6k+fYSYID9sAbesBqN2EAdo1KeVcUMniint3HQ0urACtF2KWZhN26AsvXnEUt5C0TtC0HcqXlVJYCmkQ/4KNK+Ai0Z9jj4Ag2n5kaFI9faH+QmGYKFWjb6i9aPXp0Z8g0b4dP+clqCli3NnIFfR4VvIubPjaQKWZS8aGEfIaeXlI6s4NIcRygGYJ2RyzRcmVj8XtvBjfg8UGHuod1rGB6A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 155f28ca-c96f-475b-e41c-08dcc6a5551c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 14:34:17.9519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LUVSUML6PZUxafrQ4sCwlQHEvnSqSTRDsCJvZDtmjhMYRq10xQ5TgcNjzyg1jf4mWZOjzOyKqe41NbjEZFavIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7603
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_08,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408270108
X-Proofpoint-GUID: Dnz0L4GV8YV2AvSrQXFYt1mZVCuLp0pB
X-Proofpoint-ORIG-GUID: Dnz0L4GV8YV2AvSrQXFYt1mZVCuLp0pB

DQoNCj4gT24gQXVnIDI2LCAyMDI0LCBhdCA2OjEx4oCvUE0sIFN0ZXBoZW4gUm90aHdlbGwgPHNm
ckBjYW5iLmF1dWcub3JnLmF1PiB3cm90ZToNCj4gDQo+IEhpIGFsbCwNCj4gDQo+IENvbW1pdA0K
PiANCj4gIDIzNzhiMGZlNzdhYyAoImZzL25mc2Q6IGZpeCB1cGRhdGUgb2YgaW5vZGUgYXR0cnMg
aW4gQ0JfR0VUQVRUUiIpDQo+IA0KPiBpcyBtaXNzaW5nIGEgU2lnbmVkLW9mZi1ieSBmcm9tIGl0
cyBjb21taXR0ZXIuDQoNCkhpIFN0ZXBoZW4sIHNob3VsZCBiZSBhZGRyZXNzZWQgbm93IGluIG15
IG5mc2QtZml4ZXMgYnJhbmNoLg0KDQotLQ0KQ2h1Y2sgTGV2ZXINCg0KDQo=

