Return-Path: <linux-next+bounces-6334-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1D3A9742B
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 20:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0D501B60A60
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 18:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C8A202F8F;
	Tue, 22 Apr 2025 18:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dsbR1/7+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SzAVgbWI"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D1E13A26D;
	Tue, 22 Apr 2025 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745345130; cv=fail; b=K5ZOcIJ4hA4fdCqx6m7/o6sNFgvfeFCJ66h7NvnYox0Zicx6+kwoDbyt/kcmA5EdfmE7tuT9nfpqITreWZNSVNNchcZFNALIuWmokuozd1DMSAeSS887USskWxHvCCUxtw9Jey9U4eRD7DBYn1b8oG7fEeZJZR+1V6HIYPwxUZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745345130; c=relaxed/simple;
	bh=gRJ4rOrNMXHpQzqnL4q+9H9p/HSXkkJIwwDinEKCh5E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=krg3gdDO5d1SA5aa4CGcg050zLM004UFPdBL4oG1VfgNjHB3XTpYGZKu+neXOc1s+03zjHP2lznZ2a6lBQjJNGZQnYcX3AgLuTayNtMBA+LffgJluEh75smuQcmGwhm4jD+vxvK77eIWMAWBSBHFAuF7P05eVz46dgnV//v1qzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dsbR1/7+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SzAVgbWI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MFsplC002886;
	Tue, 22 Apr 2025 18:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=UZJ0Dmbb4Psucil2c8YNCobqHMckDMtt6tfkRhPWtgY=; b=
	dsbR1/7+jDiyrRWQxyt+r+q7Xp7lpaDJEF4t33sU8gz3miiu6fUX/KOMstS1AbzH
	ZMrSMehXsGijWN3SEY0G3VRrDA4Iftd9EeG5uXK6ore760BvEqEn6V9i6ZEQhXV4
	qXQZypuW9xniiv/QmdAder/F4LNbNy66XPfvZINgsOO3erxtb4lQzxCgZKzNGTsp
	HNSOTkO/8KI9E9gjXdGcamLu6husqgvbUeXhdx6NvnQmqzLOqJo5zf+sKscVYl0F
	jousO63uaHfzDsTgOOpz/ucWQcKc8wnY9ce5qFFx3OJ7Vdlv3dPadT8D+tFp7Xt2
	KvnBVO//PO0y4/a5zxfyAg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46428c565u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 18:05:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53MGtw8P005163;
	Tue, 22 Apr 2025 18:05:14 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazlp17011028.outbound.protection.outlook.com [40.93.6.28])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46429a061y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 18:05:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/26+73eKsvn/80oXIodmyDrqydXOVcNTOoO7ImH2jrD1PiGILvyJObDZR6GvU2iQV6Kkm6FCCm3wZdtJ424jh8HfGotb7vV5ysbTMPqxdFzbNaSivt7wYa9rBH5AM3fLDCgBAYHRLNAFoyXIyunQU2bUkZeNIkj2EkAQti8AHPWjkDa8RxpAsGirn5CbBzOJLDQUXV78tD5lUTy76cqvz/Y8E9/xWE2c8D62GX/awNhtMQWUpc/NM1LZOvavlfYwDdzkXKQNr3rOlgSGj1qggrRH/xlsjAzfri+KPJgp8FYMep6p1fjMVhHpwqSkd2dfzgsosyaFn8tzzhnWjaKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZJ0Dmbb4Psucil2c8YNCobqHMckDMtt6tfkRhPWtgY=;
 b=SNolDYYhjMhN1TOAtews0Za21/XLhYBwhxvnPh86FQnMcbh5g0J7YlV2hsiTtsU0tQy6qx61dNMLVmjrxzNYqSiOqFKc3hq7gGqt+q+/wJDUNlfTZfPgGnkmdLq8I+BgntTeyDnVunyKAdbFdfR/7IX9GVMy4cjFlUjCbwTq59L/ZtZOBcmOA38dURbC+fHb6S21bsLgMIzlscq5Qd7A6Dz75RV0PNG5RXxGQy0LIonuOd977jbqot/yJv4483fj7F7K22hssmiRpvMp3jtEK4Cs+Ny39KXjF08hg0OZltArnlG4uygXdsD0A5e06KdOyK9cQ+H3afsT/LQENDOvog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZJ0Dmbb4Psucil2c8YNCobqHMckDMtt6tfkRhPWtgY=;
 b=SzAVgbWIDP1AaGuIScAn/s2Pn9H6NKF6EL9QyTP2EKAlDIj3oK8SInX1hBrxbnbVoSVB8YfR9V+0WmYiDEULVXPl8eS9BmycWqaN9XsXZOAa/EjOolKNbZxJhISIZV+pCxPSePMiZ3qWkpHTEiDD0p9yGN49rHPu0lqfLRfjzwM=
Received: from MW4PR10MB5749.namprd10.prod.outlook.com (2603:10b6:303:184::12)
 by SA1PR10MB7663.namprd10.prod.outlook.com (2603:10b6:806:38e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 18:05:12 +0000
Received: from MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454]) by MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454%3]) with mapi id 15.20.8655.022; Tue, 22 Apr 2025
 18:05:12 +0000
Message-ID: <5628676b-e1ff-4570-a1ee-c87742e5363c@oracle.com>
Date: Tue, 22 Apr 2025 11:05:10 -0700
User-Agent: Betterbird (macOS/Intel)
Subject: Re: linux-next: runtime warning after merge of the mm-unstable tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250422205740.02c4893a@canb.auug.org.au>
Content-Language: en-US
From: Libo Chen <libo.chen@oracle.com>
In-Reply-To: <20250422205740.02c4893a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::33) To MW4PR10MB5749.namprd10.prod.outlook.com
 (2603:10b6:303:184::12)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB5749:EE_|SA1PR10MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c676d1-ec1e-4121-d06e-08dd81c839c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1I1ZVpVNWUwNG5lV05ycERoVWE4MlR2SlVlUFRVOU02Qi9EeExhdVJacWFD?=
 =?utf-8?B?UXhNUTBrdW5NNENGR1QzdW1FRHJUcFAyc2tROFJOSG52RFQ5cHhPR3BCMURZ?=
 =?utf-8?B?alI5QTV6a3dUdW5IalNudW5KUlRBUzRBT2ZmbGZSZjFZZjR3SEg3Yy9EOWdp?=
 =?utf-8?B?YkNrQzFoU3Vkd2NLVVkwSytiT2w1dEwwZGs1aFZBU0w5UFlwanBwN1JvV1ZI?=
 =?utf-8?B?S3NFWUs2Mi8xcXc0OHU4eXN4TVJHbU90M0liQmR3V2tCZUpEUEYwOE05SGdV?=
 =?utf-8?B?elpkeVlXK3M1eFo1K3NKeXNHZTZ0MHp4UW9TWGwwMzgvekNoWjAwRyt4ajI1?=
 =?utf-8?B?a0FIcCtXbkNDVTdwZVVnL0pwQzJXcXJBeUo3OFVqcTVCLzZzc0F4UXY2Ykw0?=
 =?utf-8?B?QnlFNUJVVlFQZFk3QnRYUldMcVdCeTByMnZ3NERmWk1wbHlmci9XV0tJSXg1?=
 =?utf-8?B?eFo3aFBvbUhYSExNZTM0MmFDM01LaWUxSUJ2dlYzUmNlQXdGTHZ0YVVYdlVU?=
 =?utf-8?B?QW8yZERzNGIyaFozM2pXVXdoeFhrNjI4dHhJWW1mN01XbEdLVDhCZnVOZGdC?=
 =?utf-8?B?WkVQVXJ3YzBobXVMMk1JMGt6cXAxR0lXbFNlWkZzTGhCYzZ1K29WUTBMNlpa?=
 =?utf-8?B?U21vSmtqV2tyUUxsVW1aNmEvc0crdDJjQ1BVQ08zSXV4VGNsQ2VhTHNwQnlj?=
 =?utf-8?B?Sm02cXRHQjB0UFpmalMvQ0UydjNBVlE3d3dBTEl3aFBTZjYzamVZSXpiRExB?=
 =?utf-8?B?aVJiN1hvVVJQQU1mTXpVaFRLcFBSbHV5Zno0WUhEbjJXUVYrb3AraXFnVDdK?=
 =?utf-8?B?bTYxdWtwa3JRZmxCL3VQaHQ5MlZnSTU5Vmx2NkNFK0tBaVMyY2pmMm5HOUI1?=
 =?utf-8?B?b1c4a1BVWkliVFRwT04xUldMd2pNby96U3RDNjJkSDdvOC83dFlkZG55MFFD?=
 =?utf-8?B?REFsZ3hyNEtBTDVCZHh2WUdpWWNuYm9oNG9xM1J4RXYvVWpoMHdPWVgyTzlH?=
 =?utf-8?B?ekIycVljWWpQNU1lbmxyN21ua3A5bm5xYTVCZFVaTlpCNW1tSU41TERTNkNh?=
 =?utf-8?B?MGxoblBQRVRwcjM5dHQ4QXljOC9HbGdSSjR3Z0R5eHNNYmJpc2N0d2craHhQ?=
 =?utf-8?B?MFZVVFZpQ2VPS3JUUGdpYWY0S3pwQWV6MHA1NDlzWTlvYkJVUDFzUE5wNXBu?=
 =?utf-8?B?TFU5blhwMTNMTm5iR1o1UnN4WjdHN3Vsak1iTFhVQmpiVXJyMGdrRUo5emlq?=
 =?utf-8?B?YWdnOWtpdVFzcEY0bk5wYWtyRmRkKzk4R2tlWEIwWUI4Y2p3a0pRZHdORzNW?=
 =?utf-8?B?b25vcmRIVmpSSzVRcDFvMmgzekQyY0JRMGo2Kyt6RkVpbzk0dFpnMGpSMUZZ?=
 =?utf-8?B?TXV4N3o2cWRWSG9pMFczcnIzSUpxVjVBNmI3ZHFlUXJSMFZHYU1YYUE5Ujhq?=
 =?utf-8?B?ZjA5RlZGaEpQK1dkckVIYVNMalg5alNCZ0JQRjdmcksrSVBuZmVQTEJSN3I3?=
 =?utf-8?B?YkVsaXlyTWp1bDNKY0N4SFI3Tjc4RnVtRE1tNDVtVE13Z0x2dEx1RjZiSnh6?=
 =?utf-8?B?M05COEczdjIyTGRBb0hkQXBLTUFkRkpHOGhnRUovS216MW1UZkUxOUZlSUlr?=
 =?utf-8?B?Q1ZGZk5oRmZBUVhhS0hNbGR3RmVhUy9EZkJVcHBNOFF2N1JFU0RNNFE5VXR6?=
 =?utf-8?B?NklCL3FOdzNtRVJkY0FHTjdQSWZqRS9weXlPb2wyYmovUGUvWkM3b3dwUzla?=
 =?utf-8?B?THhZTnU0VThjTWFBaXF6TEkzSWplOERmUzQzS3FGYWRqMzBhVm5TOHZTR1Fv?=
 =?utf-8?B?QldFWVFQSXpucENNNHhUblRVMkhZKytSMGhGdDV3SUVzRFExQ0lXV0dOczBX?=
 =?utf-8?B?YmJreXpTUThtSnprTnBaMDYzSk5QZHRKM20vbFdqMDVVN0wwdUl4RUFMNkZv?=
 =?utf-8?Q?C7xTxG8/wHs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB5749.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXJrTEgrbVFSWWt3UVJwT3kvRUFaNFJJbTg3dkh2MkV0M2xnbTErVk91VnQz?=
 =?utf-8?B?VHhJUkRKQjFnV3NRMGFDNGZRRzdWNi9EYUNUOHNETHJaY0thZm1SL0dyVzBI?=
 =?utf-8?B?NUNUWjllWURyRXBrckNMVFVSck4vR3FTYTdrS3lYc0hEVXhYcUl6bTVLM3Bt?=
 =?utf-8?B?eU40T0x3TU1zWHhHSFhBbjhXRStYM2tjc0tITmJLTXo2WFp1VERZQ2dGQS94?=
 =?utf-8?B?MVRFd2dPVDNXUHZtSGhYcXhmUEd0eEhPd3pwZHUybGJpUlVpSzNkd3phWTF1?=
 =?utf-8?B?MG1XVWJ4a3c0blh6QUFOSnF6V1JjTDREdDBZZVZybi9FeHF2WWRhSjI5VEZP?=
 =?utf-8?B?WnRzdytWVUhzb0RyWTRTTExZZmM5alFFek90UWR4akNYUG5TN1hreU10OXJU?=
 =?utf-8?B?RVUxdzlNOEQydzc0UUFldDBmb3d3Y05XRVJvdGlHSGFQemhCT0dWaXdtSHYx?=
 =?utf-8?B?WmhtMGxrNVhTa3JSckQxKy9pRzczVVJDbG4xWTJlVDAxSklydHN6RFRDWnJs?=
 =?utf-8?B?OTdTa2F2TnovSXlXcGFCSlYxTVJYRERQSTdxR2FpL09nTm9zMnJUOE96cFJp?=
 =?utf-8?B?VHU5V091VTBGekZmVnkyUkhQOUIySkpQSW4vSkl1WHJId1YrVWpqaElCakhy?=
 =?utf-8?B?SUd4TldUSFE3aHI3bk5xUXEwWVVsQUl1emNYV2lpMDBzTzBEc1paRldZZFFC?=
 =?utf-8?B?R2FlV0p4ZGdISWZDMENRSDdjTUtrYVkyWDJ0UEpUUUtLTVlvQ0NLYzAvUkF6?=
 =?utf-8?B?ZHh5cWUvSWM5Ynd6U0VQOVBzb1JNbGdoaSttWnNra283dHkram5EUGVkV05Y?=
 =?utf-8?B?cG12ZEhETXRQZEc1UzJuVERWSDlhWGxaNXpqbjFMSnI1eXY4U0FORU1OZS9P?=
 =?utf-8?B?MDVLZWhaK3hrN2VkV3JiQ0c5ZytLYWJEbWVnNFNxYmhEMmpDZGU3V3A0NUda?=
 =?utf-8?B?MTRVZVBGZ1oxSWdFaXdQWEFtL0lOZW8weGEzYmU5VkZhZGJJWlhTSU1FNXFS?=
 =?utf-8?B?d3J5TnFJM2FLdnZuNDdJcDdlNlRmNHJzcjRUWnZHU1I4Y2tpa2RXYXdINVA2?=
 =?utf-8?B?NkFvUmZ5dzdiWWI2TjkxTHIvV0F2YlN4VGh2ekpoNmpuSHJpajNVazRtTFdF?=
 =?utf-8?B?UDFkQU50dnoxRHI5WWZDdWN4MmxTam0zL1g4SWxLcnF1enA4Zi9mZVRQZ3R6?=
 =?utf-8?B?bUY4bzYxeXRKZkxhVjFHQ0duNTBVNmNVdmJQbUl3MTdYdFRjK2J1MFlVZDJU?=
 =?utf-8?B?Uzc5ZXN4bU1JT0JuMTFua1BzcmMyVitnZzNlMk5VRUFkRUZWV0xkRXpSMThM?=
 =?utf-8?B?SGdsVGdmTC9FMlExVE5OeFpSaUI3WGNzVzFMcEQ3WFkvMU9QMTlNR09GYzJQ?=
 =?utf-8?B?OEpaNklWN2dJbnEzTEFyY3N1K0w5R2xDMlpJaUFNMUFXd1RXRkhkRHBGbHJm?=
 =?utf-8?B?MnZPZ2t6WTNSTnY4M0lBVklRQkUwOE12YnU2N2tKK3Z1MkZYNlVIclNOQXcy?=
 =?utf-8?B?TzdIZTVoeTI5b09lbE1VaHZvaFlBTy9XVTkraEZNK1p5YUpZVUNaeGw5L1Fz?=
 =?utf-8?B?Y0MvSUlzY1JPWHVtV2VMTlBVN05EcG5JeHY0dU1POCtGRlpaYmR0d2swcTBT?=
 =?utf-8?B?UTZycTNhVGZNQ0FRVmsvS3JpczFra3lCK09aSVMveU1wSTNZOURtUnR6ZENa?=
 =?utf-8?B?MjRPRXM1M2lDbHM2Vkl2SFpaR3BOcE9wSEMrcXlDTDY5K2tRbHMvK280VFZQ?=
 =?utf-8?B?Q1h4QllxZWxjVmNUYmI3b2dPNjZUYjBZSWtuc1FwcW5iOEVpa28xcW1nYUZ1?=
 =?utf-8?B?ZHE4VGxhTDE2b0hDN2Q1ZTBMYjNTR25PRHh3TFZuRHZmTEFHSGx0eDVmdnpI?=
 =?utf-8?B?SytrWURSV0VxOVArcGQrUURsdmdSK0ZpUWJDN21UV2EySzhMRXoxMFJidFZV?=
 =?utf-8?B?aktWNVVJSTBrRFhUemIwd2FES1MvNUZ3VFQwa2JkTmhuOWRSUU55azQzNm1P?=
 =?utf-8?B?ZWh1eHZKV0hjN3lPRW5rYVFpUXc0RUZXOVRnU1VMTkJNdTJUMnBYRDJqZmhL?=
 =?utf-8?B?RjZ6dmNVQVFWODV0MHVLRHhiNFMvY1ZNclFCOGRtMmlPQXBRcVBhNDBXTHFn?=
 =?utf-8?Q?gyZy6wPPIh94+mXJQxSn2PdUv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XbqcgS5AoHqfWssw+K9VSHULlJOGneEdrFZ4V0sw4LorBbwDNHv414OsEdBdLeOvp294VvAuL3v4Xv9pxdSxvsccqBdVTv27LGl68iE8QqxoCvdmQNJjYb2e66mduPCgyc9Sb93iunhdR3difebPDLKGwui8IkFPVF06Ly77O1UqjOK9NJPEDmKvhXXsW27z/KGpsFDuSVxk19bXoI4G/i9Q6pmuBgtdqgZyYWqR+pTgtyUxtoBsgR0qFOClTuuhtTG5OEopMWvwNAe2452HT3JhBk6Y+jPCWeDNJ7zLGFNGprCtK/G4yU5cFyyYe+n5IxxagY222qLS0/QcdnEwZO2I7CQyQ8Eur3BLT3fxEGa17NJcnytBncVUvRSRMI+J8vYZsqfK614EimXP8jZYL2gwTiTK561j3PeFb0+GjDDmgGtx4Bl8h9kpeoKf/3uBzt/o4Nv1OIMlkutEVyuOULiQTm+8fV7VJGYaUmTM62P41FdRjpFz4UdjSukKdbC9a564MGqfQdfvbSHgjVMDecHqOPy00P8qVkx8gLzvr9kGXPG8d0I3/ExNvlr645miX8cTNLfzGHRJ1C2bs6JEe1SII2R0Q47rLc4MnAhxoSY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c676d1-ec1e-4121-d06e-08dd81c839c2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB5749.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 18:05:12.0697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALYkfMAlfQeyPNac+EJc/ae4RokhbS5l4k+FgUD/jE3AeUku5dxis1n3AaqPlSKlhbF0fSDoHkg/GVtJ4SlFXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7663
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_08,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504220136
X-Proofpoint-ORIG-GUID: 4NTVUr0laG_mLzC0R0xEqL-KBSCfMI4R
X-Proofpoint-GUID: 4NTVUr0laG_mLzC0R0xEqL-KBSCfMI4R



On 4/22/25 03:57, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm-unstable tree, today's linux-next build
> (powerpcmpseries_le_defconfig) produced this warning:
> 
> [    0.000000][    T0] ------------[ cut here ]------------
> [    0.000000][    T0] WARNING: CPU: 0 PID: 0 at kernel/trace/trace_events.c:596 trace_event_raw_init+0x1b0/0x6d0
> [    0.000000][    T0] Modules linked in:
> [    0.000000][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-rc3-05418-g16441530e08c #1 VOLUNTARY 
> [    0.000000][    T0] Hardware name: IBM pSeries (emulated by qemu) POWER10 (architected) 0x801200 0xf000006 of:SLOF,HEAD pSeries
> [    0.000000][    T0] NIP:  c0000000003efd30 LR: c0000000003f0140 CTR: 0000000000000000
> [    0.000000][    T0] REGS: c0000000028f7940 TRAP: 0700   Not tainted  (6.15.0-rc3-05418-g16441530e08c)
> [    0.000000][    T0] MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 44000288  XER: 00000000
> [    0.000000][    T0] CFAR: c0000000003f0144 IRQMASK: 3 
> [    0.000000][    T0] GPR00: c0000000003f0140 c0000000028f7be0 c000000001811100 0000000000000000 
> [    0.000000][    T0] GPR04: 000000000000005b c000000001617716 0000000000000006 c0000000003efc7c 
> [    0.000000][    T0] GPR08: c0000000014dd6a8 ffffffffffffffff 000000000000005b 0000000000000000 
> [    0.000000][    T0] GPR12: c0000000003efb80 c000000002aa8000 0000000000000000 00000000019e40b8 
> [    0.000000][    T0] GPR16: 000000007e68eef8 0000000000000001 0000000002d500d0 00000000019e3f38 
> [    0.000000][    T0] GPR20: 0000000000000093 c000000002654c03 0000000000000000 0000000000000093 
> [    0.000000][    T0] GPR24: 0000000000000005 0000000000000000 0000000000000000 0000000000000020 
> [    0.000000][    T0] GPR28: 0000000000000000 c000000002656c68 c000000002654b70 00000000000000bb 
> [    0.000000][    T0] NIP [c0000000003efd30] trace_event_raw_init+0x1b0/0x6d0
> [    0.000000][    T0] LR [c0000000003f0140] trace_event_raw_init+0x5c0/0x6d0
> [    0.000000][    T0] Call Trace:
> [    0.000000][    T0] [c0000000028f7be0] [c0000000003f0140] trace_event_raw_init+0x5c0/0x6d0 (unreliable)
> [    0.000000][    T0] [c0000000028f7ca0] [c0000000003f2768] event_init+0x68/0x100
> [    0.000000][    T0] [c0000000028f7d10] [c00000000203e62c] trace_event_init+0xfc/0x4ac
> [    0.000000][    T0] [c0000000028f7e00] [c00000000203d4e0] trace_init+0x6c/0x680
> [    0.000000][    T0] [c0000000028f7f30] [c0000000020042f8] start_kernel+0x664/0x964
> [    0.000000][    T0] [c0000000028f7fe0] [c00000000000e99c] start_here_common+0x1c/0x20
> [    0.000000][    T0] Code: 72d60001 7c8407b4 7c7e1a14 41820430 4bfffca9 2c230000 41820010 3920fffe 7929c010 7f7b4838 2c3b0000 41820064 <0fe00000> 73690001 3be00001 40820014 
> [    0.000000][    T0] ---[ end trace 0000000000000000 ]---
> [    0.000000][    T0] event sched_skip_cpuset_numa has unsafe dereference of argument 6

Hi, Stephen,

Just to verify, does the build have commit 'tracing: Verify event formats that have "%*p.."'[1] or not? I do see linux-next/master has it but just want to first confirm that. 

Thanks,
Libo

[1]:https://lore.kernel.org/all/20250327195311.2d89ec66@gandalf.local.home/

> [    0.000000][    T0] print_fmt: "comm=%s pid=%d tgid=%d ngid=%d mem_nodes_allowed=%*pbl", REC->comm, REC->pid, REC->tgid, REC->ngid, __nodemask_pr_numnodes(REC->mem_allowed_ptr), __nodemask_pr_bits(REC->mem_allowed_ptr)
> 
> Introduced by commit
> 
>   516be5b3418e ("sched/numa: add tracepoint that tracks the skipping of numa balancing due to cpuset memory pinning")
> 


