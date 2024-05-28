Return-Path: <linux-next+bounces-2399-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 321278D1172
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 03:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA720283034
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 01:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639E8FBEF;
	Tue, 28 May 2024 01:36:43 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF32CA6F;
	Tue, 28 May 2024 01:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716860203; cv=fail; b=KcpZL3wvWgwI1Upi5zi22PLYoVl70076s3nXb7TwOID+oKW4pLOBykfofmz8297z0pLBhAtyubEExM2h/J/4omEiv1FR+l7WZvhloY2uIgjs4vxsto3e1L7NH11xwXa0Sg/uEzJ2xmPWcmCijJ8YC/1Bus/efnHSKfbZmrxJ8ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716860203; c=relaxed/simple;
	bh=Q6ujbyHnL5ob28WHY9n2c4PeYCtAWrYTjUX8Ubrg7XQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Tq8HLGugNPY0pvHfjc8gyKflzGUfcE2PVFm+w+Vbd5/IUusmX69RmSsHNRSFk2pkPdOut5TCfkcPwdqRo6x+qKNDxVUJdij93LML1xUg8HEQGyZJeuGZSY4ecwdzFp+z+c96hIi4nJno/ait2YsQxI/SdgcBZ7jxbfQBOWGcNa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44RGmf4a019529;
	Tue, 28 May 2024 01:36:35 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcc:content-transfer-encoding:content-type:date:from:in-reply?=
 =?UTF-8?Q?-to:message-id:mime-version:references:subject:to;_s=3Dcorp-202?=
 =?UTF-8?Q?3-11-20;_bh=3DRHvvSfxbnxNmw/MSBt3FygQfxBfR9WwroIGCsKu2XmE=3D;_b?=
 =?UTF-8?Q?=3DQ19gavDCQbqs1a0YN8QiB2d4L0hqA9ykVCCfUlNMKl4M1BoX1vSkxqvSPf9j?=
 =?UTF-8?Q?odDu4kQ+_oHNpTQEfGODYEb1LQ9TOmJiRbwPKFfgQz2FscrL/WUz0/P2I2+AvUf?=
 =?UTF-8?Q?EicfRZ1kJ3ETjz_2lnKa5V02Y4JyCGXsajcODR5UDaxujRAHmZBlyyn/G9MHWhn?=
 =?UTF-8?Q?iFK2wjkhmiGpZRQr2W4x_F+bSLnoitQ5oC3ATrcD8/Qn6O0tABdZwCivnI4mIVD?=
 =?UTF-8?Q?gDB8Musyp7qeixFN9wELEN6yEz_2PSXPf1BJ8aa9lP2K+lEdDIc16XhADYm6K5B?=
 =?UTF-8?Q?ArAkbYQPhrCGFRurCMl1G1ITHU0ZpjEq_OA=3D=3D_?=
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8j837p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 May 2024 01:36:35 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44RM3Q6J009309;
	Tue, 28 May 2024 01:36:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yc52ahb8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 May 2024 01:36:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZJvx7Yn9GZpIV00bYU43Sz5q6qAZ7mARYHZwQqZIrQsiIY1qwEGROHROAsRWldQPEHuE+UV0SDV2Ovy+bbGZm9WylU2mB/g3KuyyEk4MBkEaYVXVKTB5WhMX5gOtG62LzaJTZQryFLTOU/eN86FrkGTUKY7GdASBkokZRjtYbbtxnXo9EkOaltuD9XItUpWnYZG113h1/FvdszvpgQkzzemBnNLNSQmEbYG4eXe9cMRXbaJ22undOmJvaptrsza8k2OMXm68nrLfg+z2Lr0NKeAdtdoUkYy5eoyQWC6AkKHpb9hl7l3sMqIOi7a+5Ul1dM+4uINNEvHzNK70UvtOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHvvSfxbnxNmw/MSBt3FygQfxBfR9WwroIGCsKu2XmE=;
 b=dr6QoaqNEOYsJkweNZpY77eOkt/tOTRv3gXUAgFdmiJsWhljuuw71HDUxlOQbrVFLEPTo3y6Rt0mCPUcDzLlVMBGP+S+j9JNCYCFOAy3EPDKNlk8W0O8s9atBVQ3aWHceBM+UmJ4HZg0M18GGXPJpwkmMsun8mxOvE8qBvg078UW222dKGAbz9rxdolJCYvQ7WSUfSrA27M3P5U31z/ysDrMKHLIxzUioCSlFb1drD4LSe6pjmyFWE8QOU//K/MT5C7VypWz4rW85rFnImQxng+pCTwXrvc/Y5VH/s0R8ziihrGpNyH3+njgf7uGcHs8Fu6zxDzm3jcfYGRo67Q0+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHvvSfxbnxNmw/MSBt3FygQfxBfR9WwroIGCsKu2XmE=;
 b=xV9zVYcqqsQqMStlogE9wQ+RLJNfFeDTuf2bLZnywlGzG/1awjQu7MRZ+ZV/HHHTDF9EMlweu6ZDCsRQTpyq8LrOi/R3+6ISoYTUG8TAlff2m2zRavy33J1Dxo7MskkRkvWDXyUFwYHbo6bTlNUGC0uM8oB3qw1p/GugpNu5tJY=
Received: from MW5PR10MB5738.namprd10.prod.outlook.com (2603:10b6:303:19b::14)
 by DS0PR10MB6947.namprd10.prod.outlook.com (2603:10b6:8:145::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 01:36:33 +0000
Received: from MW5PR10MB5738.namprd10.prod.outlook.com
 ([fe80::187b:b241:398b:50eb]) by MW5PR10MB5738.namprd10.prod.outlook.com
 ([fe80::187b:b241:398b:50eb%3]) with mapi id 15.20.7587.035; Tue, 28 May 2024
 01:36:32 +0000
Message-ID: <7a7f7340-4152-450a-837f-a51823075d4a@oracle.com>
Date: Mon, 27 May 2024 20:36:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the jfs tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240528081902.3677843a@canb.auug.org.au>
Content-Language: en-US
From: Dave Kleikamp <dave.kleikamp@oracle.com>
In-Reply-To: <20240528081902.3677843a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:610:b0::8) To MW5PR10MB5738.namprd10.prod.outlook.com
 (2603:10b6:303:19b::14)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR10MB5738:EE_|DS0PR10MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: 122b29a6-8d58-4060-46ce-08dc7eb69aa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d3ZQNzdXSnhJT3graGhNMTFpWXRlK1pscEZ6ME0zYnJYOVV0M2ZpVCtMQW9G?=
 =?utf-8?B?a3ozcVA5STdnaC9wK1ZjRnVwR1ZlRy9jRWpLR1JBWk92QktZNzhXNmlrV0sz?=
 =?utf-8?B?elBvRWZTZjVhelJRcXE4QjJuVFpJekxEQjgvaE9rR1BiTitMa3VubjNZd3Ft?=
 =?utf-8?B?VE4rZjg0Vk5iNTNyTGVIQ3pNWFNic2c3MGRmSzdBZCtMNU9Jdnh1Q2NiaHI0?=
 =?utf-8?B?NHA0dlJQQ0hZUmFkTlJDRS9wemFuMGlJZGROYytsNTQ4S1FxbmljYTdNYjJo?=
 =?utf-8?B?SlZyVXVTbm5TdVZCNzduM1dIUUpFQjVSODVlbFArVmZXSmRmMStwZVgybklu?=
 =?utf-8?B?V0JqdDdHRmFGZUxCTThsNlo3dnhXTHE4cDVrajBPMUhGUjZBb2FSSWNKMElC?=
 =?utf-8?B?UDBablhYUjQweGxCeVZqZ3E5cDhpOHRlanpJZmM1THFOWXNKbVVVV3pKNkpS?=
 =?utf-8?B?M0lXWnlnWkdOUnpnRnJaUDN0VEkrTk5RT2dHczE2MnA4czZMc2RQOVFoRnlp?=
 =?utf-8?B?cGo2anBES1l5TVBIMjI1L1RxbjBER0ZMcEtJdEpXNFJyRDg5TTVYZ1ZVSlJw?=
 =?utf-8?B?MUZLYVVlNVIxWnNzNjJqeTcwYUlLOVhTcU54aGlwTEp0Q0hRaXcvS0d6bHNG?=
 =?utf-8?B?YStPL0ZhTCsrR1AvamxzQjd0WisxZGNlVkFnS05xV3JVcXQxL1JWOS9PS1V3?=
 =?utf-8?B?NTA4a2IyV0ZDb2M0b0o0d25EWGkxSzRNMDl1cnR5THNxeGZDek5ZY2hHTVZQ?=
 =?utf-8?B?V0xMblZnNURpN1FLempWeHVCRW9wdTBoVFNsT0VVY21uT3RyTVpqTXVWUC9B?=
 =?utf-8?B?cWkwWW1TMmRmM1JIUUxuMXJmS0NqQVQ2RXAzRXlKNWsxT1MyWERLb1hQdStY?=
 =?utf-8?B?aE55TCtFMnZQWlZRU2dvNlNLK1lXQkNMYjJFRm9VazJ3QjZ2T09qU1BZRDFo?=
 =?utf-8?B?VEVWajZ6L2N5SW5PTk5wenVMbkpBdDJGQUtjeXlFSThFYTFKeEhlQlJWUWJi?=
 =?utf-8?B?NUNhRWRGbWozd1htQ3V0VS9QOWlSb3B5eVRjUnozQWRlbnN4dUJVUThodGhx?=
 =?utf-8?B?b0V5MTlXN3FNTlFmUW5nVU1oMmxLWTB0QThPc3IvUHdqczZNWjJFRUVTTm42?=
 =?utf-8?B?d2pEMnM2L2FNdHg0MC9ZTGxUbnIwWVFpeGE4bGRoM2tINUNzTDdmeWxUYVRO?=
 =?utf-8?B?WnM3MUdzUDI1YkhGWWorM3JCc2V0ZWJqanZueFZ4N2RWQit1SmZPbTJvUGk3?=
 =?utf-8?B?SkRFZU05WkZqa1lES1JJcFcrelRsME95c3BkcjBXUkpRdWkwZHEvRGExK3ln?=
 =?utf-8?B?ZmpkN0NHZHYxdzMyUS9xUHVuQlJGQjluQXBFNE9VOEtiY1VNekRtN2oycVNE?=
 =?utf-8?B?aHh4ZWhob1B0UzZGYzkvVWprRHdFMkJFS0RDZ3NyN0czaWFidXhYQ1ViTVNW?=
 =?utf-8?B?YjRZdkZueHFqUWFpV3Vra28yR21DODVuN2RidFgvL3dhcUtNRm82TXhqYytj?=
 =?utf-8?B?d3RyQytxbmxhdDRjTzFpaFF1TDVlakMzeUprczM5QS9TU0xVZkxvN1pPNWs4?=
 =?utf-8?B?T20wckh3M0wzMTdlTEswTG9ZWktsM01CSDNNeGRpbmNKSlcyYlNFYlcvMEk2?=
 =?utf-8?B?TldrYmVmUy9UM1kvMlBpQk9MZXl0SG9ZK1laUWcyMGl4VmhDNmpHeG94Z0lh?=
 =?utf-8?B?U3l0MUxrMk1TYzdqaHJUYTJabytIN3dQUVJUbGxEYm82cXNJRzFEaGhRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR10MB5738.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2FlMjBBekdTY0xXTUlORElibXFJSHJkcDEwMHlNY2NqR1JtSUhyM0IxMWQ3?=
 =?utf-8?B?am90R2lMNHMrWGhKaStja0EzeGFKM0hUMVJ5anhlbnVhM3oyS3JkK0llcVFQ?=
 =?utf-8?B?MW5RdGVwYWlDdlp2ZUhlQW02OXU4ZGtodWhUNkRHMWprS215aWp1YURPcTVu?=
 =?utf-8?B?WVVmYjRjZk4vSUdwMHhhem1qc3doZXd2YUh5aDJQN0lBNm9XcmdRZEY3WnNX?=
 =?utf-8?B?SE80MU9HK2J6bXh1Z3IrU2hqTjB5dEZKeVBLNSt3T1R0a0RIQy9udFozNlgv?=
 =?utf-8?B?YkJESFB0WTAzV1Vla3lESmE0b21WYXcyV3R3SmtaaUFCM2cvbkZaMFBTZGxC?=
 =?utf-8?B?Q1JPNGZWQ21Gc0Z2UzZmSHgrRS9zUU9XVUc5Rlg2SUs4NFhqdDJ5MzgvY0dM?=
 =?utf-8?B?ZHFmY2piSzVETjZ1TkNFNHM4OTJwNkh6Njd0K2tWbjV5QmJ6dVBMMDZsWXE2?=
 =?utf-8?B?aTM2V0l5ckY2R0FiaWN6MUt3Sjgxa3puZUw0MUJsdndkejRrZktjS25VbFFD?=
 =?utf-8?B?T0p5V081QjNUNGp3UUN1Z3pWQlJHK1ZvZDRyenFCZXhFRHkxQkZESzFxYTFM?=
 =?utf-8?B?THRPZFVvYVQyZjRjbWFoYUpzdDY1TTh4bXFxTlZGQ201QTMvNER2SmQ0REVG?=
 =?utf-8?B?MmFXc0JrWGo1WkIxZWxEejIyNHZ1YXpRTkErR3lRVHRCb2F4MXhvUnhtRmNB?=
 =?utf-8?B?WkM4b1RoYzZwNThWUEViN3NQQjhJQWptajNTbXM5V2E3a1hLRmdqUitNWlc4?=
 =?utf-8?B?SS9OT3dyL0w5RUlCREprWHRrTXpRWjdXeFFzUVliZ2tHZUFjQjVzb2xGOTZY?=
 =?utf-8?B?a2VPdmN4bHl0anBaVTdtQXZMV1poOHdaeDZtQk56SkljVTRIV3RUTVlPQ0tW?=
 =?utf-8?B?ZHljSnBzQ0w5T053Z3FmZTdVQnBaV2V2UEZWaU5XZUhxM3hTZmtrUUF1eUxG?=
 =?utf-8?B?cXExU0RTZFYyTnNWb3JKcFl1bTFNTkQ5b0E3eWdhQVJwaWIrL1FwN3NjWUd2?=
 =?utf-8?B?MkpXTjBTYU4vTnhvbFc5Vjgzc2t0WmZHMjQ0aFBOcStwNnlSL3NGNXMzamlP?=
 =?utf-8?B?Y29UU1pYeDVyRG5Lb3dSb0paWlplODRLdDVSb0xHbU8vOUxSRkY4c1BnRzcz?=
 =?utf-8?B?U0pTRndQREM5USs1bXVzb0lmZ3NjbGlhMUZRdTNLUkdoVkJ6S0dLTXhFTDJm?=
 =?utf-8?B?VUNWRUpTR2hZZjJrMHFZck1UajZ3ckJMbW1maWhXdU5pV2VlejdodG0yMDg1?=
 =?utf-8?B?TDRQK25LMGxpQ3ZjTkJZKy9LanBsbXRBNWN4WDlTNk5ZT29ZTVJvS2RMVkx5?=
 =?utf-8?B?MVlrMkVlWTlZMFYydmZXTkZPU2d6a2tXYk50K1RvZXhIajQ1dzRDTld3QWxt?=
 =?utf-8?B?QjBNK0J5RThXWGNCcFlkckJsdW55Wml6V1gvcVV4b3RCTXBYdWQ3b2QzblRJ?=
 =?utf-8?B?dkNYSG9wV2RKeGxxWVl2aFNxeU1Dc0hFYzFCSkUxMWF4YXk5VGlNUTNrb25S?=
 =?utf-8?B?T2RSUVBlT0QrSGtoMmkxd0toekFNUnd3Ymh2bzFjbm9NdGtKVXpBTHZENFZk?=
 =?utf-8?B?UFNlSlZCNjh1cVZMc2txNzVWeTZobVdOVVhtN29XdU8xTjk0eUR4NDZzbG12?=
 =?utf-8?B?eFJBWTFkY0M2T3hYbE9ERjBBKy9HUGppMEdTS05IZ0M5aThNS1BSYVFiWEZK?=
 =?utf-8?B?bytkdVI3bmtoempGcjU3NkZyY3M1RjZCblJUcXlPZ0VIaFlKcEtyZGNpVk9K?=
 =?utf-8?B?UGxpUElwTTJ5WEdLUHYyNXhvUlRUd0NEUW9YSzh3ejA3SVZRdHV0bzRLbng3?=
 =?utf-8?B?REVyZ1QrVFNhcVB5T3ROUjMyVVpyKzBHR0Y0YUhNYU40NnRobXRtNmVaZ01N?=
 =?utf-8?B?c0NXY2UxVEptaWl2UHh1WlJOd3ZWZEQrK2c3aDRqM2FkN0JzbCsxdkt4MXdD?=
 =?utf-8?B?bzhmMDY3V3ptc01QOThYSUE2dE1YNU1rNVBLNTVzWVBBTUdjR09ua0t2aUUr?=
 =?utf-8?B?N3RZUWtiT1FycUlTaDM5SnVxb1ZBU3BaQkdKdGM0UHFmM1AxeXdMWWdaNzF0?=
 =?utf-8?B?N2pqS1lNd3VLTjV4UlNSNUV2SjBUZVltRmc5ZThKL0ZwZE5HeG5QMGpvaGVO?=
 =?utf-8?B?OEk3RG9CNTBBcllVRXdSRjUzSDJNZEFvbFlpSU93UzZ1S1ExNWd0RVpweURh?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	cDAQxZwJ/8HlMrI+uBbLbqEQjZ7quWDdLmAlPu5FhCF+LK04StAQKQkylsml0h0Jse32W75HXTyb18z7kERJMRDLTKfiCkf9DLwH/fSwaawAkr+k2xaYIH6voh2CZx1hHUayxDZBW/eTqV2H8iE1gL16Mui4Ke0AiaEUTIkZVPw2NfUqGYauGspxI01RpwJClpeQyfCSRAqPfDlVrugUG4ejnWq4ai3HJDE3R5Xizi3827QURiSt5pEuGXgOcq+uHAwvrjtuzgfu4kMSOueilYC2r0bFknAQcHGzyJzgMaFJJRXPi4EohNq+GtA2+wda/9b5FPgWLIqAeCcqAW8ZFkqhSY00e9Pv/Mfq7aJVJJ7otN40gaIMEGAurFDZDuepyYLr4xohu/HX+OIaJYEApdSDBrREcu4XOHtEJOBWmC13J3uOwBW3jTnGqHwLGvJRWoG6UduUKyz++Z5n9c2y430OsH58a2e7EXd1gF5i+xnyF7VRjBvCnijY96SaTo/PmHV03X4uI2KIiUnHg/MNZACSDR3+FojpWDABMqGb+pSJBRttiVmrH4KFc/n9t5Dif0raw8aWFr/npo96jlU8NRHU2mBUM25+SfR43UnIovA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122b29a6-8d58-4060-46ce-08dc7eb69aa3
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5738.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 01:36:32.5309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWmal2cvftP+zwgDeaFBrlR05Hv1Vry+Yqq+ifFMeVAPz2VdlOnIKqBM+a5OfPh3MEwtAKz4Ijuzo0aGlh/FGJF4lR7g8yDzNtnwuqoqU7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6947
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-27_06,2024-05-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405280011
X-Proofpoint-ORIG-GUID: X-sCgHl1XyMsM1-TPlBx5Frj-4cOtu_4
X-Proofpoint-GUID: X-sCgHl1XyMsM1-TPlBx5Frj-4cOtu_4

On 5/27/24 5:19PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>    71653c99fce7 ("jfs: Convert dec_io to take a folio")
> 
> is missing a Signed-off-by from its committer.

Oops. Missed that one. I'll re-push.

Shaggy

