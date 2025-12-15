Return-Path: <linux-next+bounces-9401-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CDFCBE96D
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 16:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 539BC302C21A
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 15:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8D430AAC1;
	Mon, 15 Dec 2025 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sC2fNj38";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="osLFPG2E"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BB43090CA;
	Mon, 15 Dec 2025 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765810581; cv=fail; b=aI4kTvCozSZu82fKVBOKgabgsmFVL6OxrQEZH84Y2Gj69glpZTQaYrydfVUMmh4CboE7tuqzMC8+mbwNLIAnwIbggUjnW+AYgqwtL3bYjGJa5ZBkVRjord5WuAg0dQxMf0RxXAJmMBjoaTNyowrk5S3KmZlVVBm2dUnLl1PzRbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765810581; c=relaxed/simple;
	bh=qm+MSBVCPj5UWQgLR7ilOt2sLSbBtKjIOjt+xtecE5A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nAS9VAURcxCwdNGl7LBjq+8ykpJTSU0SphdVyuaQ97sSZGZ0MzCcugWrOmLLZ84S/hVZHGcJpbb5UmMnrc/Qbx31QnpFIzYajwpFf/dEjMfTP2RvAFJEWkYpO84XqLrH2YKKQp3x/34UMTQ5y6HYslSuh7vJp1sjh6lE2yIJxmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sC2fNj38; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=osLFPG2E; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFDx5XS2185324;
	Mon, 15 Dec 2025 14:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=HJjTxVU9k2LsGMTSzcugUpn3y4qdPImX2IjpT0Gf7hw=; b=
	sC2fNj38ARspKIXfiwuv+pmI9fMeQYcbuk/Iv4zr0234rRbeu4XhsOoCe2w0eUyM
	0X6He/lIJTCynhdFur8S77rSfP9mx73e4mZVd1/iXwzduEwd3AXdvzTPos/snV87
	WPJYEQulsTaOmInfK3rSG70ywsSXyl/dHMCCGzIGBMpHlPnRAff4ZUwUMFShHGIG
	1cCjMq4Jnf04umxIbEHOMyW4JeVyu2uLw5OzYIZM6d1ASi3DRORJk3/vozqTbmSq
	x8vojvuH99Q/kIZfhjyI2Vh02msiflkpjXpEAwxaEREcr4OavhXdLdMpcUupPF5t
	h5HcUNQKYI9IIgvznLWDzA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b0xqxt7jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Dec 2025 14:55:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BFDU9al024790;
	Mon, 15 Dec 2025 14:55:23 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013067.outbound.protection.outlook.com [40.93.201.67])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xk99akt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Dec 2025 14:55:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhtORqsSdopI2NfmKjQOPdJGZOFm1A9ElPk7FONqX5G3Lm4TB6sP4MJP/ReehLHaBJc1e7It7XVlem2W6DKx0TrX/8fEk1NBGIYa3M2a4YSJinRkGxnd1oxDeCZ7c9dlWbL/B3Vx0RAZdjllCJx/V7jaX8pfRBmDS4Lqyf4vmuVK4funSKOfFIH/Rsj2wESAw/bxzIyYk0bFClV65Ztx68hlMH1izh72X01q9wcvlSUlW/MsOjphWY0Hh6tgRXsNvU3goOEuA6Im77qRz9blcZp1bWbbjKJtpMvMBY57IYBDTr2jTAaFRyuEMxyWZyZYiEY98uYsRK9hJKQz64tmbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJjTxVU9k2LsGMTSzcugUpn3y4qdPImX2IjpT0Gf7hw=;
 b=qUsWPyWKpwmteoST2JlIgvGZtJikmIK5BF8q8vG3K/hM/kzIy7PvwHVr+XkNdiE2XpD9qu18gIn8HMQLpFyFzU1KFDOGTi8YLTaHJtLVxQkCxkQRkDgH2mai4YZfe6t/9dq18hsr9bPIsmiMusI48HauKo0z3u35DwWEBCnwoHIhPudAQOhtYy/QW+toQccyrfPChNhayIRdqw1n0rWqbz7K5DgFhjUIcmm4JSPhf4KVxiCCYiwYUXH2PzkEkmXfo64LBfa7XKyQkQNrCFfLJN+dEaYA+43O8ybftpdu76dQ9d0IVKaxh/eeBlW8p4mBNjhXJlYD8QwfHfbQt4c02Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJjTxVU9k2LsGMTSzcugUpn3y4qdPImX2IjpT0Gf7hw=;
 b=osLFPG2EIAB+e3Db/6GdFEiugs6IlJTPWgeVj2o55gSgaMTEBQrxG1BgPNpIYQw8/6uqXIVEKvaK08qoSa62FgCObmUS01UOMXM4bJNJqLD15ioE1CWHHz/pMEUVqLDxzX39UXKWh3/DFe98IXWdhIVY7pHttBJfUiWczGyqDwk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH3PR10MB7762.namprd10.prod.outlook.com (2603:10b6:610:1ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 14:55:19 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 14:55:19 +0000
Message-ID: <45a76e4e-12f2-413d-b9ab-3c453df23ff9@oracle.com>
Date: Mon, 15 Dec 2025 09:55:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: trees being removed
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Larsson <andreas@gaisler.com>,
        Christoph Lameter <cl@linux-foundation.org>,
        Dennis Zhou
 <dennis@kernel.org>, Dipen Patel <dipenp@nvidia.com>,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        Ingo Molnar <mingo@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
        Matthew Wilcox <willy@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
        Oded Gabbay <ogabbay@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        Tejun Heo <tj@kernel.org>, Tyler Hicks <code@tyhicks.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
References: <20251215184126.39dae2c7@canb.auug.org.au>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <20251215184126.39dae2c7@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0067.namprd04.prod.outlook.com
 (2603:10b6:610:74::12) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|CH3PR10MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4857bb-ef85-4c22-5b4a-08de3be9f6da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STNXWjRSdElzRW9ZOGtlY0tBa280R2VGY0dIUXJOdGRSWm5Rd1MrNjRqYzZo?=
 =?utf-8?B?V1FEVkJGbDRTQTcxQ2pibWp4cUQzM2taZHIxMzZicHFtWUU5dnNuWTNCT0N5?=
 =?utf-8?B?QWpPRWkyYlZyd2RHSGxyTjlPOXorZG5vcjY0K3RQV24rZHJML210M005T0Iz?=
 =?utf-8?B?NFN0dVNxcDk1TnBZdzRSV05iNXVNMG5JSmJDVzFaQVZVMFU2OXFiOHg2akxq?=
 =?utf-8?B?RXEzVjhZcjlOV0xycUFiTnFVemFrQTR1Umw1eGhYZU5ZbE1tb09ydnBvcEdM?=
 =?utf-8?B?Y0V5ZUR4MDltM2Q4NzdETDViSGFTNFhkOFVGSkpIRFFTaFlnVndVUXIyZ2h5?=
 =?utf-8?B?Ym1YU1cyRk1tQTlHYU9KMk00YjlNUGtKWjg3Nzc4MG5OUjV5cHQ3M2V3bDJu?=
 =?utf-8?B?eEhIMzlWbU9GL0N2YWVPZC96RXdzN3lSanM0RXJVbEhKRU03cFVDbGRLbi93?=
 =?utf-8?B?QnV6UExId0EweFdaNUpxSGo3Z2NxcTI2cHEwK0hwaXRYd2UzOStNaTZvZWRL?=
 =?utf-8?B?WDZXUGpmNzdrNXFUYnlRZnk2dGJKUlhuNGVqb01WUVBQek5lL1JkaldxTTNB?=
 =?utf-8?B?OHpscDlSck5HcytmV0FvNjNMSDVUQzVxbzVKOG5rVVlXQjZDYVNNanFXQkQy?=
 =?utf-8?B?OUtQTGMrU3loc3p4RkZJaU5CUytBVm5TSy96R1Q1NGdKZG56QjhhTmdBejM5?=
 =?utf-8?B?dWdsSkhEU0RQdGlwRHI3b0VMRUM3N1RmZTF1aUFNZ2RMb1pYeGwrclJiZUJR?=
 =?utf-8?B?a2ZDV1RHTHNaVFJYNEVHajJEM0oyS3NGVk9ORVZQd1FYWHlUdnBkSlRjM0pR?=
 =?utf-8?B?MEg5amhzYWpFN1MyU0R4a04wMjU5WnV5Q3ZXWEY3a2tpTk1qV0tMREViTFJj?=
 =?utf-8?B?Z01TOHBhN0x6STZacXJxc0pkZkxYQWdZZGtDUGt1UmtCSmpZbkN0NkgzYWo3?=
 =?utf-8?B?ZlhOVU1OQlZLQUdPVEtmVTl4ZjROZ3Y3eVJTdVNxZmJJOXErTTRHTkx0N2Nq?=
 =?utf-8?B?dXIxcGYrVmd0RU8zYW04RkpSdE5yNmMraWhoSXdGQmEzeGRoN3RJRVZmNTBq?=
 =?utf-8?B?b0k4T2dFM3ZTdjNTVVdFR0RwVWZRdDJPdUdkSFMrMGJueTN5Z242ZGM2OEoz?=
 =?utf-8?B?dEFGVXhtSCtGVTZFRVRoTXZhaGVJeTI3RHI5aTBoLzRpNzZDMm0zYWJoRkNz?=
 =?utf-8?B?TXE5RFRvTWZIaXZBQmptTnFPY2cyVUwyMkJTbUVmTGd1b0JvWDdTYTFrZkVh?=
 =?utf-8?B?bi9uT3NmWUZIVTFLcm9WT2NzWHJxWitLL3Z2aWNWU3c5TVdDS2h4c3pkQ0lC?=
 =?utf-8?B?SzdsblBUaWVqMG9LTHNNbUM4bkF6RFU1VjlqYlZhRjdqRlJhZy9zbUZjSWJU?=
 =?utf-8?B?WC8wYVh3SzA0WExtSlo2ZnE5MXNxWHVwTnZRaXc2by9YdVFOU3ZPdmdiNWNP?=
 =?utf-8?B?MERaSnNZZFJ3aHhCNEdzRERJRFM2RU1IYVhLUUI2Y1NLWCtmbzhWN2ZPSGgx?=
 =?utf-8?B?WW9DOFI4TVJsMUNJemJCaTFDaWZSZklTVEdTTjBvOGFkWVM3dXMyWkQvOVV4?=
 =?utf-8?B?YS9PQTAyMXNVRkdhdEJGZUprNmdwaUpOQS9OdXJPdjJNenljNExSZjNtWDkr?=
 =?utf-8?B?amhYU24zTTZpc29QV3ZmODVCVVhkMDZvNlEyblB1N1JZMXpEb0NxVzRYOXc0?=
 =?utf-8?B?TnNjM2c5czVPcjJ5SGxsUStFZWxrSGpkSGxZUVNxRkwzQ0crQWlpSXlBbG5W?=
 =?utf-8?B?bnJ0bzBFelMxek5GV1pSMVp0Nkdod0JzdTU3UGdBRUVENE9YMTV4SjFtUlRp?=
 =?utf-8?B?dm1PVTJ3SlhnaDBwUVh2N1phNnREcVVGcUVHQ1NCZFlPbDEzTVhxSHBYbE44?=
 =?utf-8?B?UTIvVnNZQjNwUGxZNDhYWTRLUHJqckdUVnpubGppZ1JTZlNxVTJ0L1c0cFQx?=
 =?utf-8?B?R0hpOEl0NWdQTXRuaFVCZElFeENkRTliUStSalR1Y3pxU2xLa000WXZPT2xF?=
 =?utf-8?B?R1VYeDVDb0VnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkVWaEFqc1ZrV1VwMkRQTUROTjVHbm5sbjRzUlZuRnRuWm53V2ErbXVHTHgz?=
 =?utf-8?B?T0wvM3pzUVlOdlFBdXJzemVROHVXeG5RVnQ2K2tKSkxjTXdKaUx3ejh1SCtz?=
 =?utf-8?B?ODRBMjlFdVllQ1hZR2U0TmE4eEh0c3dFN1VDcjZiYU9vKy9TMjMzUkVTdXhp?=
 =?utf-8?B?UXpYQUYrRDEzYzQ0UmZUemNDdWNkTmdBT21qNi9UY1hvbFdoOXEzNmd6Sldy?=
 =?utf-8?B?UjRTSUE5cUJnWUZmUUtPMEM5bnZzc3NuYXJ3bTBINStnT3g3S296S3RuOXBX?=
 =?utf-8?B?cjczWU0rbzhCL3RYZWlnK2h1SHB5Mm1DT014VXJia1RvZG5RRDFlNGZjdTdl?=
 =?utf-8?B?V2VvZ0ZPTFNPNkRLcWtici9kQi9CY25jUU1BM0RncTNBMjVIc2xaZHJ6YW1t?=
 =?utf-8?B?bWVjRzdGMVNZQzFUcHp3VEJzTGY0RmVFVmdIaFE5djF4WkwvNEF0b3B6WkRW?=
 =?utf-8?B?QUl5QVF6US9WWC9zUTlITm9mRExRSFNWMi9hMEYyT0hRajMxQkl2dEFIYXla?=
 =?utf-8?B?TkdlOVdObUVGQ3hFSFdURlQrSHZiaUthVFB6SUwwS0FOWnc1Z3Rvd3V6MVdF?=
 =?utf-8?B?UUg4bHlFV01SS2FsdXNXQWxsN2hucGNtVkxURmpCUlIzcmplUjJqbTU4c0VU?=
 =?utf-8?B?SWZyZjdscytpaVpxME50UndVbHZPNjE4SEdWTnRXSDl1YVl6Ujkra09xbm9n?=
 =?utf-8?B?U1BkVG52enF5WTlwZllwUENWZnhTRFIzUkp3dlVCeHhKTUpvdk13dHZmbmpV?=
 =?utf-8?B?ZmVzUDdOcCtrcUhYMzhMZnFoRWVDS1FPak56ZU5OMTAyTnMrVlE3NEJLb1NL?=
 =?utf-8?B?R0xIYWNpNWszNnRybW8zZHc1bWlvTWdXeFhlNDZTRVg1cldCWDRUdXY0VW5C?=
 =?utf-8?B?bzVSMWVPTFpWRU1mRU1wTlBOTWlIYzZRNGtGRW1aaGxXVEdNVUhrT1hOejlt?=
 =?utf-8?B?QXovejk2M0FWZ3NVQXBhNVR1ZjlUVlJuNXFrbHpnbWhCUEhNb1lKeHdxUmFk?=
 =?utf-8?B?TURlSW9qU1NuVTk5bitENWp1ZHN2TUwwN1pUT2cxZjB0MVEvNHFHQjZOaUUv?=
 =?utf-8?B?Y2ZuSW5DdWJEdDZwc3JzQ1BJb001a0k4L056L09zNWoyb1B1cjZlbktwMkt6?=
 =?utf-8?B?Q2hOWUc2emx5NjY4cUgxL05MTnNGbStiNDhsS3JwOUFvSTNFU2tOcmxaT2gr?=
 =?utf-8?B?NmV6Q2N4Sms4aFNLS2tSTS85ejR2Nkwyb1E5U2hZNm54UER6dWFJNFlmNW1P?=
 =?utf-8?B?dHFRZDJrbExVK0FDMGhhZEhDa0dwRVhRaFplcDFJMkFPZS9UUHhvdlZablFK?=
 =?utf-8?B?emszTEFlRW1TYkxVNnMzRnYyU2JPZ0ZwQ21BZGhIbTRBWlU1QUFoUk9NUE5z?=
 =?utf-8?B?RVlkRUFlaUY3bk5xRTlkdHZZQS84VUl4Z0pYVEJxRndVSE0wRzMyRTJkc2pI?=
 =?utf-8?B?SUk1SnFpV0t6ZGg4L1ZEWnpUZFpCR2xrSVVzNGVLN0doMEtUZzVYSDcxeUth?=
 =?utf-8?B?c1ptY3VrSThMRi83SHFmdWM5Szc1eE1iWUdhOWFsbWRxSDRTSVYrUXROdDdi?=
 =?utf-8?B?dUYyMTNOWUcrVmZMZnVwcGdNY1lNUnVkQWpyeHZQL1VENGlMd0Y0NFFLaTFK?=
 =?utf-8?B?Vkd1ODRmcXcwNVRkZW83dlJHTEF4MzlEMjduZFJ4b2dORkwyN1F5cTIzbCsy?=
 =?utf-8?B?SDJGSXRIaHRMbUh4c1hTYUh3dk81NmtmckNPbmN3TVhjUEM3ZlpCM1N2Yjgy?=
 =?utf-8?B?Z1A0S0JsUzhET3Zud0w0cjVJVG05Rkd5OE9BemVOU2dRd0dCZXNIMC9GVkls?=
 =?utf-8?B?QTJsN3N1UjVhR1FDT1dvVjdkeENQTGZ4cVZQTWhWcHBTZDFaU21VT3JTK01F?=
 =?utf-8?B?UnE2aWQ5b25UMWdFZGZ5K1VRMEtaUGVYcW5YMk52dUdDakRIQ2hPay9na2hY?=
 =?utf-8?B?b3B2RFlSbzQvQVJtNWsvSWRlNHdaN0tyVEhFU3FkR2FxN0E2RDB3cnR1ajgr?=
 =?utf-8?B?Zy9ueGwwZ0JlNjFOb05JM2tyRWpxY2FDQy9XdjlxUGpldmdTb3Fsbjlrd1Rr?=
 =?utf-8?B?b2xaYjBHekdqNHdpeExLT1lObzFYUzZtSHZkaTIvWVRJT1VaOGVCUEdMR0VS?=
 =?utf-8?Q?w2XVB50rLw6UNv3konlNm5krn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6mBLH2XERHUcc/4UU1Ul6GHexs32eQ4iyQ9U7x60LBd5+nTQJl/R0tJVjdTaczYGMHQATwg2scvR2k9WNfedn87yVaso7xuGW5t/q/qMm4G9xORlOKnnEB2+g8Z5kvNoY4SarWt9uTndTWCO8Hz2og0dmjTkT1k8bRZ5WKOJt2YEdPPTbZX3gHzDjEVHClnF7sZfEalDsUD3QsTzHIu56zc3DttiMZ9VRomzb+zp8nkv4GMcdRWhK0piQNiAM1qBigZ+PBAMV8RL8MAxQyvmFh60BCX3RUlJsVWcP/y96MC0h40Nmy8vfuoZw1LjRhyi9g6H5h4cxv/4A4jdDY3I9iSD4ekokY6qnNrLjvzFd52vcXRr4OAOw1sQivRTg1jgEDCk6By+tkzkjY1vo/d75slDOTTl4AAfcwqGs/CUluk1Rl1qXi2u3bnWkgO6me1eVnTvTW6e8d5NNHysspIYKSHKcGMgv5gaC0Ao7anni8BMUB9qxHPmHakgkobZDSpV9T1ZjHUjgu2GXtxJJbi+Zm0nzexRbsZF2Va5C5ciHJJm2wHjAcbeC5BGB6NX/wgd9/Q/u+Lvp+fF6uLb9I3bGf4H0wTpooygBzx0JfiTCz8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4857bb-ef85-4c22-5b4a-08de3be9f6da
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 14:55:18.9279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YITt9Gp2klqpsttkrPSacjb+P+y3NnYU5WbmXn29KI+fo5A3Cj0/yqOew/QAPJd5yYd0LptURI/ci1/hGrFbvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7762
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_03,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512150129
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEzMCBTYWx0ZWRfXytta/wQY1KjH
 l1XkDiHkOF+3vSDQXx9KU5Zp+zQvuN62ohsIIOfMXL4+JMm8nGBnYccy0trWuWMyGzvgJUYYjMJ
 Ug4ujITVEPpxIfF1pAJfz8AJn6VBsNDfRaP09XKDycIFFv0Pj3eyhJUQAATc0WzcecqbWgeVxSD
 9+jqgWAtOwZKTXroX7E2nn3NexHOSEdIh/gzV2BHXcQ4LvuBDQkoCtn+zaHR8AzrfCmyvHtJURp
 xYd314SCbpR50yztsXwuxntrt8bn6lJugdg0Gcv6RDhh/NEQKcHOw+jYHFgpbgxz5L5e3o1GaK9
 TlVVgQWlsCgr9Hw8Se4fRlN/F2T0Y6YjnsT7P7qTq0RRcqIFhwMdxG53B8rYuSWf8e0jrAedfpS
 5px4ZGjIx/+jG2workD0jfTf+F4ozw==
X-Proofpoint-GUID: Al6yqMsK8AKXNYl5JhvqQe8QxksuKWBJ
X-Proofpoint-ORIG-GUID: Al6yqMsK8AKXNYl5JhvqQe8QxksuKWBJ
X-Authority-Analysis: v=2.4 cv=BYDVE7t2 c=1 sm=1 tr=0 ts=6940215c cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=JfrnYn6hAAAA:8 a=TFJ0qDWqZCTbbyTYJP8A:9
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22

On 12/15/25 2:41 AM, Stephen Rothwell wrote:
> Hi all,
> 
> The following trees are going to be removed from linux-next because they
> have not been updated in more than a year.  If you want a tree kept,
> please just reply and let me know (and update its branch).  If you want
> a tree restored after it has been removed, just let me know (and update
> its branch).
> 
> Tree			Last commit date
>   URL
>   comits (if any)
> ----			----------------
> accel			2024-05-03 11:00:53 +1000
>   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git#habanalabs-next
> clang-format		2024-08-02 13:20:31 +0200
>   https://github.com/ojeda/linux.git#clang-format
> compiler-attributes	2024-09-15 16:57:56 +0200
>   https://github.com/ojeda/linux.git#compiler-attributes
> dmi			2024-05-14 11:23:02 +0200
>   https://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git#dmi-for-next
> ecryptfs		2024-10-21 01:47:22 -0500
>   https://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git#next
>   b06c72107980 ("ecryptfs: keystore: Fix typo 'the the' in comment")
>   da22e0dc323c ("fs: ecryptfs: comment typo fix")
>   68c119aecdcd ("ecryptfs: Fix packet format comment in parse_tag_67_packet()")
>   fba133a34118 ("ecryptfs: Remove unused declartion ecryptfs_fill_zeros()")
> exportfs		2024-11-17 14:15:08 -0800
>   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git#exportfs-next

re: the exportfs tree: yes, that's fine with me. I asked for that to be
added to linux-next before we knew that exportfs patches would be going
through the VFS trees instead.


> hte			2024-06-19 12:24:03 -0700
>   https://git.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git#for-next
> percpu			2024-10-07 11:33:26 -0700
>   https://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git#for-next
> siox			2024-03-08 22:01:10 +0100
>   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git#siox/for-next
> unicode			2024-10-11 15:02:41 -0400
>   https://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git#for-next
> xarray			2024-09-23 15:16:41 -0400
>   git://git.infradead.org/users/willy/xarray.git#main
>   c88414f56c37 ("XArray: Prevent node leaks in xas_alloc()")
>   6684aba0780d ("XArray: Add extra debugging check to xas_lock and friends")
> 
> 
> These trees of fixes will be kept in any case (please let me know if
> they should go):
> 
> backlight-fixes		2024-05-26 15:20:12 -0700
>   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git#for-backlight-fixes
> sparc-fixes		2024-01-21 14:11:32 -0800
>   https://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git#for-linus
> tracefs-fixes		2024-11-01 08:57:55 -0400
>   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git#tracefs/fixes
> 


-- 
Chuck Lever

