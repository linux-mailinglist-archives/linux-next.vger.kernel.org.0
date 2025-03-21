Return-Path: <linux-next+bounces-5932-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A46A5A6BBD7
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 14:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29B273ACA82
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 13:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811D422ACCE;
	Fri, 21 Mar 2025 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jRdDLrkW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rieBFLy+"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB71722A4EA;
	Fri, 21 Mar 2025 13:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742564471; cv=fail; b=Qx/2gqf03zKySIBVV7lkpLEf5uimADodiMQ2fFcrjhZY+kDIZUIE2OBAJZgrHUbFHqsB/ErL1Ip7sfAHf1d0S1mA5O6lHUlCcGurOqgicEnAlhbp5hZyQ/q71ZWBozRY2wMejbewQvNeCVpig8nfVPadgJTC5ikcWrZtAaa40RM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742564471; c=relaxed/simple;
	bh=rW5qzLCemzFYovZNTjIYlujr5T60SJ2AqVhKSoZFmWY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SplvLx2259KS8JpQ3En2si0vPO9fAOBEouBJvMpPb8YYnYwtVoHS6eqjhmSrW+xUssRB5Niq/h3EdxgvPR+ia8e/v62Q0lsHIMGsj17A7h2euJqfGApd/4F0dsqeRdjRxoBAEgoRbV6Mdr2ETCUnbjqwmYhFOuyEOKrYiDk4sLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jRdDLrkW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rieBFLy+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L4tk1d028228;
	Fri, 21 Mar 2025 13:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=t6+Jo8tUE4cq+rlQXY/tsj71r2fM23+KWJvnz31fqqU=; b=
	jRdDLrkWluHU37yEVOE48KNNMwXnD6WVDRGVvzX1oP/ME0430aoeC8rEybPqwipF
	feXhMiEAehSEFtCfKusOPnlDnw8UpMs0UZ5L5+SmotOdTY+f7f3lOJN5LPaluOTb
	W2g8zP1B8eNDan+o9JqqTKW8owiMYo8X9kPxlsAHHY0hO0gUxIZrFCfw+72uWvq/
	jpBDgYKBK5zeFGNgN8nF+rMcTHf9pAMkUHjtuB42VlE8vutiUvF8SnWr/AQDDXX0
	6AoltfL4r0qZN7QqyAoYMWlnRfKawM1DfqDvCrBQm7GQ8nqsH6PxrpkgmZuDPeIt
	3cCafJ3GoAE6bePZyZME9A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d23s8psv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 13:40:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52LDQRMd022461;
	Fri, 21 Mar 2025 13:40:58 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxekr2am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 13:40:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxEhXDThgks7yO/vVr8nhwPP/fcARQbjoxTy/37BT7kWbhe0dMjEuvkCX6uFTW2A6evfC0mCENXZQQV9jJxAiGwmB7+h9YUSxPkgpzUbvNG/dBtO2cTgfULDl2Dboi9pKTDeoTd6nZa/4Q0nh5GsrcZaJVRk+phHcnYRnMxsz9kXG0grddun3qrpkLjK/L+fXDZv2BVRFScfl9tnZJffz2iGFLdnmqAuIrWrgmFHQUuVfzzlj0FH/wTc261r5v7Ia8y3OLixQD23qto0cKfh/7gKXFKMQ939QOyeb+sDtvpUSYfeux4MO3Ei5v9ehEq6sfD2oj/WcgB2xovopkSJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6+Jo8tUE4cq+rlQXY/tsj71r2fM23+KWJvnz31fqqU=;
 b=zRfAJJR1IoA6ddADa3sYDEGwdH6x0UwQKX3FMvf8BUFlURLYymGGIa4LbnEoj0fk7dROqDrnJOfPR/Bz9vQpvw7TF63WaeDd9zn/9/+ofBIX/3a7Yvd193/QU7fB2bOw2NIOna0QN1rlOp6pb4aZjWIYsow5zkcKKthoEyKyQaJDYl8NUrDx+UqkNt91aCGmGltFBBsBKrMe0n7hB31/lMifdvVCh+R4QXcIuT9BTFkhPgbfqm4XCmgYowCnMO64ucs6ABXWJh5GbQOoW1Jlwgr91Z0JhAgppiH2ZhZHXt4DZE636ZMSjMV4AyBrfwSLEAjQrHT7kQEcazre3TvD2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6+Jo8tUE4cq+rlQXY/tsj71r2fM23+KWJvnz31fqqU=;
 b=rieBFLy+I4u7ABro4zHDywM2NllLTAxvHvtasyJ+wTdDntM9gGeKe9GyhSjUOt1jg6gqA9LDyrGDATSlHQA0TkkBp2vqohY0hrAVdp7Jage3nJEp3WFTBYPlGlqDi3PD19g2cd3X9t0aa4t4h8cWT0iI+lmVXWSZ81zyHd4oJCw=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA0PR10MB7232.namprd10.prod.outlook.com (2603:10b6:208:406::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Fri, 21 Mar
 2025 13:40:56 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 13:40:56 +0000
Message-ID: <1b8ee72d-73c0-49f6-bdaa-14faf712f5d1@oracle.com>
Date: Fri, 21 Mar 2025 09:40:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the nfsd tree with the nfs tree
To: Trond Myklebust <trondmy@hammerspace.com>,
        "jlayton@kernel.org" <jlayton@kernel.org>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250321091151.2fd07db3@canb.auug.org.au>
 <0c875429-1245-41b7-8573-6b011eb4d923@oracle.com>
 <c4d6be529fb349f43b853ab701c5ebc70bfe43d6.camel@hammerspace.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <c4d6be529fb349f43b853ab701c5ebc70bfe43d6.camel@hammerspace.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0330.namprd03.prod.outlook.com
 (2603:10b6:610:118::22) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|IA0PR10MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d660ed7-7a3a-463d-e5f3-08dd687e01d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnR5WXEzeS80a25nc09va0dzVk5NdFFGOVYzcURkcFJ4L1lLWWhVTVJEaFcz?=
 =?utf-8?B?TTFLYW55U3RPYXg3RVNiUEk1NTVSSm1IVjdJdlprQWZpVXBYQ01RSzdMeXha?=
 =?utf-8?B?cGlCdmNKcXBjcm9KSWtZSW9nRWdJbTN4UisvbEY0dWpTNE44dEgxaElsaHZL?=
 =?utf-8?B?K3VOTlBneHlNenZkZHFRR1dMc0p6Q0daOUtQekhLb3NJMWRiblhUYVF0bkls?=
 =?utf-8?B?MkJNOWtDQjQ3dnVKTDZhUFdiRzk2bDIyZDRybEhzUWY1UUNlc2phalBNSU5Y?=
 =?utf-8?B?dDFFK0NFcWVteExkVFhNa0F4SENBbG5hNEFEQVpwODlQQ3hlYkdNai94blI4?=
 =?utf-8?B?d1JyNFprcWZEOEpsK1g2bFVoTXA4STdsdmhJcFZuTEdkTU1uMVpsb0RwcTdV?=
 =?utf-8?B?RW5PRDNmVGRFV1N4d0VZcmFteXd0VFVPdGlJSEREeWhsVzFEdk42VHFlb0Y3?=
 =?utf-8?B?TEVhQW5rdXJUalpMa2lha0MwS1MrTHhsRHIzSGhvdHFlUHJaUWVxa0NTNWZz?=
 =?utf-8?B?MWszUzJ4cno4bGU3K2prbU03Rmx5M1Y1cGN2c1VnR3c1OThCdXpLajl5VnBx?=
 =?utf-8?B?SXRENzIvNGIrbjZmNmRTREFVUVpJc3JaOTYwbHZNQXc2TzhaU0RXWk9mWXhB?=
 =?utf-8?B?aVBnbjlyUUk3RnJPemVFNGxBTUNrbldHcDFGYktSV2FBZzhtbmxqZG9RejZN?=
 =?utf-8?B?VFRDM1FOZVFkNjFGemFNTnNualdxYkFRQ1ZsRDNZUTg5UEdjaEFwWFdzZ0F4?=
 =?utf-8?B?SDZoTnFSVlVwMFNqVU9hZFl4VEFOeXhtM0loODVQRXIxQVVaRHpqMkt6Qi9G?=
 =?utf-8?B?WXJuZ0lPQzZwUVFVRmNOUko0OElXSnF5dUJpdzZmWFlnOTR3S2c4WU5PU2VS?=
 =?utf-8?B?WkIrbjU4OHFyQVJvYXI4cTVFQWRobTZxaFhYVEF3M01NcEVBWm0xcTYza3BI?=
 =?utf-8?B?RUc2K1ZFN0ZIaUk4OGdxSDQ2TXNCVzlWbHZMbFVnQVVOc0FQOTM5cmk0bDA0?=
 =?utf-8?B?Y3YxaTFsanRNaTJ1LzZLSHR2QnJ4MjZnOXRNakwwaWdlTXQ3VmtldEluamlP?=
 =?utf-8?B?UzVUeFNaakhadVEzcGg0QjNlUHIrZHFQZ01IWnFmdDk5SHhDU2NUV1JqQVBC?=
 =?utf-8?B?eE5nano2bzByUHlRRTJFZEV5TUZoVmtUOVI1K3FvTDl6U2hJVmxuVmlUU1Jn?=
 =?utf-8?B?V0ZocXRNZFFVNDA4aEpSWXFIREp3NDUxZk4vbzh6RjFoM0pnSE1FU3FUb051?=
 =?utf-8?B?OHRVUXcwTkd3cWlBYzBBOEhsREgyUzdtRDhjOU4va0NNWVpTWHNSbEdSSVlw?=
 =?utf-8?B?dk1WajRmRG4vYmZMQ3pWdDBKQXFjYWxVR1d3RTVYYy8yTzZFWVRuMVkrSDJm?=
 =?utf-8?B?Wm1EV1lrd1NvVTFYS1Q5aEJKQW5IYnN5N1dRRjRQYlFxRzJKazFuSE9JdEFh?=
 =?utf-8?B?V2lDQTNyNmU1eEk2L0daT2ZtdnlOWnoyTmxIRU9ieUoxZGZWMTd5QlMwMjJ5?=
 =?utf-8?B?TE5wWHM4L3ErUW9NbytLa29MNGtNVzdWYnRBakpCYUVUeE81SFBQampRaGdj?=
 =?utf-8?B?NGxHZjRSWnZPZXA0TjVVSWhHS2xnZ090UnF6a3dSQ1JoQ0xCa2FzN05CM2Nl?=
 =?utf-8?B?cDQwZ0NFN3FLdHdzN3RSUEtnN3FZVWs3bkM1QWw0bkpDY2sxd2p2Ynkwc0JT?=
 =?utf-8?B?RmVSam50djkzSnpDTTJCS1djODNjL2xQcVBUTmtmRFhocVBFLytrbTIzVVFQ?=
 =?utf-8?B?RnQzTitJdFBBUEIyelArd1ExaGlOc0xSNnZkVHdlOXl6MkRBd0hDSFp6NDRz?=
 =?utf-8?B?VjBRd3pRQWVKQkJmaVZEUzRlcnRwZjNmcmtmdnI4dGNHU0dacWZnamFLVGpp?=
 =?utf-8?Q?MxZVpVj7VV+GH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEQraVFXT1lnckJ5cGl0RVNXWWZLSThNdGdxK1JlblJYVXdJNGg4Q0ljWTlT?=
 =?utf-8?B?T1lzWnh5UFdCNzBjZm9GTm9jMGlPZ0VBd2E2RGNZNXdSdkh6M01nOHVZOXp0?=
 =?utf-8?B?V1Bkc0hpTGlEV1VXNk9SNTdjaVN5aHhWbm5ZQnMrUzdUTkRHSkhLdDNVd0F0?=
 =?utf-8?B?eWpiVFdlR2h6U2xWSUJPVjJ1VWZDckJBTy9zS0RGMDZoc1hMckx1eXpGVGdO?=
 =?utf-8?B?cEFGcFFPTzVsRy90ay9GWWNyT1ZnYnQrSUJ2Y2tCL21RUG9RL3lpd1oxYmV1?=
 =?utf-8?B?YzVXaE91MFMvN2dEb2g5MUpqcVRmc1hMREFxaFVycWRJTVBtei9JZnlpcUVr?=
 =?utf-8?B?Z3QwaTFnZjdLM0MwNnMwTGFJNjFtWDFVTlNqanY4M0YxbWxObWxnQnZoSDRP?=
 =?utf-8?B?QU1rT0UxOVF0TUl3a05HKzVaNStTQUVGYnVVdkxtRmtERC9wUU4wamNnZGE2?=
 =?utf-8?B?Yzdab3h6OTMrbmpSNE1nd08vbkQ2S2VmK2ZEcDJ2RW9FdVhPUnh1RndzM1hn?=
 =?utf-8?B?OTdmbEFaNVd5R0FHdmp5alY2aGZaVnhhOHdaWk14YXk0ZHhFTmNITUJQblpN?=
 =?utf-8?B?ZHd4b1IxNzVOeE1IRDIydHVObGlwNWNtd2JQSzBaMUNzRldxVmErMHVtWU9O?=
 =?utf-8?B?Qm80VkhDSXg1MjRXNWhHUlVVZ1RuRkYxUzFGVFFUSktlcStkdzRZYk1lNGVL?=
 =?utf-8?B?L0dhdUdNczMvNGl6VnIrOFVHYzFtVENPZVpmOVNFNnQvZzIwSXRDOHp6Zm5r?=
 =?utf-8?B?cTgvSURKdS9RcEZmREZqNk8xU3RENVJKQzJyNDl3ZFRjSVpZdUhsbXhwanB5?=
 =?utf-8?B?UE4yeDQ1aUVseHFCQjYvSkFGRk5MR21aRGhrUmRFY1FBelJJUnR5aW1nNXN3?=
 =?utf-8?B?QlIzaFd3TmVTS0JNbXhXL1RDTFNpd2RXR3JUNnhqTHFqY1pMa0dPVVdlRWZB?=
 =?utf-8?B?Wi94bVpUcWg2Lzd0WjRFaGg0SnB1aUlxMU5zRGJoZk9LODAxNlBKdjZZa2Rt?=
 =?utf-8?B?QmYzbEoyanFHRWM0eTkxSHhvZnppSFRveW5rN3ZQb3luUG5aeWwyWm5vc2s0?=
 =?utf-8?B?L2RFc0N5WEdFL0VRblRYYTZ6VkQ5cmV2TkRTa1BQaVEwdjZuUncvS0lQU1Ni?=
 =?utf-8?B?SVZnZDJhYjNyb3hoOFc2Z3pHaldXRVFBVW8wMW9McmsxL2JkVEYwMkIrdHky?=
 =?utf-8?B?MUpYMXRnMTYzaEJGbGhOMlJFelNOdHp5YkdMSy90RTFxNnUyQ1Z3TEU4N3ow?=
 =?utf-8?B?eWRyWTdtQTRDNTdSV0dLWFRDK2xvQmZVNlBHT1MvRzlaMFJhakxMenRvc1Uw?=
 =?utf-8?B?Vk5ORWQraSszc3ZkZHpqcHNMRTNXaXNjUC9Wb3VicCtBeTh0UGpZT2RuVGQ3?=
 =?utf-8?B?eDJjRGdlblJXM244RXJhdlpmeFZlbmhMa1ZJbyt0alMyQjlGRUtNamxFRUZh?=
 =?utf-8?B?bzFPS1VnaUwvUjUySUdvM0g1NFExbG4rRGkxRC9qMDNXSUdSUTlKM1B3aURh?=
 =?utf-8?B?OVQ0WWdTUjZPU0lPZ0pPcG02UVVwV0htTWhCeW14eXNJUXM1SWxKMHFDQTJz?=
 =?utf-8?B?c0NFc0c2NUxPUmQzaTNiMkQxdkx2N2JQVTYzaDF5ajFGbXZXbVJZdHdZRUFM?=
 =?utf-8?B?ZHc5ZTVWWEROSGY1eGlkUHY1VzJyeE4vK0EvcDdWUDhoSUFHd1Q1YTdTNHA0?=
 =?utf-8?B?RlNqLzl1TTBhMGVtTkVwODJvYWpNR0g4aUU3aldtNC9tbmI0YXBjaFJ6Y0VV?=
 =?utf-8?B?VDVhWFdyMnR3SzJpZkcvemZIb3NwWHhKVTlpcnhuV1oxUlNHemt5KzNXQjZI?=
 =?utf-8?B?OG5yVUYwbDllOVVvRk9UclplcnVDUUg0Y2JhRFBaZTVBQ0VaaEVkQm1sNWJV?=
 =?utf-8?B?L2ZTeVh4MnBPb3lvREM0WTVXc0YwZEFGV3Y3TWdYcDNZbkRtOStvTjJTeGVi?=
 =?utf-8?B?SERwYXRTM3Q1aVg3a3BGVVExOEJMSERKWVZjL3h6R0E4SXFxWXBRUEdMS0ox?=
 =?utf-8?B?cjJJMHA4bkxmMDFnMzZCQ2VHd1VRVGJUWCt5NFhaZ2hOR1ZYSkZhQUp6bVlJ?=
 =?utf-8?B?SHk3SHBuUXJ2KzREU3k0TTQzRlZFSjhaU1hKVVVqVVV6K1lyT1Zmb3FVN3hx?=
 =?utf-8?B?WHYzRlIxZzUwY0RiWnNzLzh5TFhKdURMM1pPME5VNm1FL0taemZ1WXdrQ1c3?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c9BbHWjz1Odj7Qvot+S+6+rEXN7CXhUwCJVDMxpL2upw0DXfs71a1rfmMEvOcs3kc2KNYnNAB7U+xzs0ymPKLK9oGSn3RCqFVYyaAn0QhULK2WY4Irk7orhWa4LXJ0wfqeByvQBKNYszLNbuSAEhvx9l6xuxMvuvy2WLqETsLS6Ut+tPvbd3+V4W7f4uSTxPjtM+v6yanD6A33kmBK2wjKilrCZCdAGbyZFHdEf2cc5GbrNqAhjpVHhRIiQoal6WySg63WaX8o6bbkco98be4S9AWkf1DiHqjUUS2BwzJ33kN20HheB2HHRi4hsfUL1f2UyyF4EVFhtll0sTCypxEgKP3BDVOAhOuJDGPG3zZcShLGK/TAfm/7v3tX7WnRZer8JyEvb+x+FZqs9DIPE+672wA3RJtEdgOjxffwOBFX93r+J0oD7imbgZbpifP86P3O/C4LWh5UtVclVmsn+NJc4d93nlphc3u0LWqeBN+7L2y9OaHSkXJJ46+GF/sqVLodIgjxTMTDyNOgZ2Wej0d7n75ieWoe0e1NMo247E9CZlV3MWgF6wgfb5ypfdl32CVG6ZglLkoA7SyU+YTU4Lr8a1p2NfbSbm0zcLRX7aRnc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d660ed7-7a3a-463d-e5f3-08dd687e01d4
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 13:40:56.3465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GDahOoxtuUFUpK9wnW/azO4de1nvntnPYLpJ0cnfW4xk957J2SifqnCKYRrBYC9VTJbaeWhpNiBHm61fAP5qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7232
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503210101
X-Proofpoint-GUID: 9nbmaYz1yNsWJB7p9G_j4S9theGg7fd3
X-Proofpoint-ORIG-GUID: 9nbmaYz1yNsWJB7p9G_j4S9theGg7fd3

On 3/21/25 9:37 AM, Trond Myklebust wrote:
> On Fri, 2025-03-21 at 09:32 -0400, Chuck Lever wrote:
>> On 3/20/25 6:11 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the nfsd tree got a conflict in:
>>>
>>>   fs/nfsd/nfs4callback.c
>>>
>>> between commit:
>>>
>>>   11a149e09d58 ("sunrpc: make rpc_restart_call() and
>>> rpc_restart_call_prepare() void return")
>>>
>>> from the nfs tree and commits:
>>>
>>>   6c1cefb84b3d ("nfsd: lift NFSv4.0 handling out of
>>> nfsd4_cb_sequence_done()")
>>>   f049911b5b98 ("nfsd: only check RPC_SIGNALLED() when restarting
>>> rpc_task")
>>>
>>> from the nfsd tree.
>>>
>>> I fixed it up (see below) and can carry the fix as necessary. This
>>> is now fixed as far as linux-next is concerned, but any non trivial
>>> conflicts should be mentioned to your upstream maintainer when your
>>> tree
>>> is submitted for merging.  You may also want to consider
>>> cooperating
>>> with the maintainer of the conflicting tree to minimise any
>>> particularly
>>> complex conflicts.
>>
>> Since 11a149e09d58 is only clean up, I prefer that it be dropped from
>> the nfs tree until v6.16. Trond, if you don't want to do that, then I
>> can include a merge conflict notice in my pull request for v6.15.
>>
>>
> 
> Removed and rebased.
> 

Thanks Trond and Stephen!


-- 
Chuck Lever

