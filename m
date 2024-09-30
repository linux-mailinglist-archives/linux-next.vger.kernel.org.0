Return-Path: <linux-next+bounces-4017-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E76C898A67F
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 16:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A144A28411F
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 14:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87AC119049B;
	Mon, 30 Sep 2024 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cS43GYXs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZySHArvo"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A90019048F;
	Mon, 30 Sep 2024 13:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704706; cv=fail; b=NibJaRhcjzfUUwttayGajxM30cvvohS6i05gIpvFW5MJv/eUNX8a1TC8WxfkhDSolcaQRDiwUBO8cMv1E4pluiXmBwYNYMQOwCVksR0DizOqRME3w3YthM+2d7WtJV4LCEmA5fYZJzLCVlng6JUefbCn66CAgfQq9N5XoKVZ6QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704706; c=relaxed/simple;
	bh=DX6VI+J5zTutftBNoIpEZ790wHm9LK5avGUxjkPJXqk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z9j5ruBYNRhqghoU2AdEZEq9Qmy3FWP0oAR/gkrzbVnUWUGWelDTihU7Or1yycsxkILUb4XJRY8v8WZVZJwGF9ztophZ+g1a3K8cHO+xBkED3OmQOZ5NlhJmtcPj12ah1371wyDuVyVghKIMCUL16LdVaPvCcbfAEBXNKqCqR/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cS43GYXs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZySHArvo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UCi8XC023883;
	Mon, 30 Sep 2024 13:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=corp-2023-11-20; bh=DX6VI+J5zTutftBNoIpEZ790wHm9LK5avGUxjkPJX
	qk=; b=cS43GYXsX3mF/wFF7Kn2lsewCO628O7W8hxNpmz3hz0BrxXImpk1rwBfC
	4BUoR183FCFjRwS2DEJL/+nqqAxXEOcTVCPQIe2/HgsExYE4BggSFDXCvZXBbSsO
	uH240Ef0aF6XXBsk0ycU1jGBKxcInW/d9ncM6xhhi0FRif6v0cRz9pipX4ak8rCY
	h9/IQzlgLI+QkjH5JRjCnJz++UEI5Y1QHcOU2bu+c7sqaZUGWkqhp0KBhjy1Z7/9
	RQE7k/6VIaYbOQC0Sxs67tL9uxUpkhKra9Zx1Xs4UcnqFqZYBTUdNvSWbBY1NeSs
	0qYe/gVPjaSaLd/4QPIk7/8a7NuZg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x87d3cea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Sep 2024 13:58:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48UCR1Zi038718;
	Mon, 30 Sep 2024 13:58:15 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41x88631ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Sep 2024 13:58:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0YpbR4R3+Ha8n5xvwG7REBv1GhQpw343ibpjZhfKvlm+x8ECdATsVjBumnmpln+E0e3taWmAxkTiktpwFfIDfbKqFSthx/ptxqV/RPPD1DeEyIF7S5meflwzmf6apOqvHeKq4umpRdG4GMRsTElS9BR1KNdSAVrdkMBenQ/rgMzNmJh//F2I2+TK1mmu8kt8LI3YtWAB7DlIjn7d1ARzVsGhxxCOb9Q+neuPu55pStgxMcBq1bDKj+s8nx6bTF3UbtCuTxnFHQ8H93Evwd/1cH9dnxyWNRPuhLOvPneiRFkIOnkeaRguDHy5oSI4y3E1h1dXRiWNDx6Eeps6g1Mkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DX6VI+J5zTutftBNoIpEZ790wHm9LK5avGUxjkPJXqk=;
 b=NGF0pMVuVOZ11dnNBvq10zzQUjAYOCy0Q/TUSSFlD56CwZnskyTSr9rCW0Q5MOlKKHB7USBJsw5KWyjnzDwVHpwpFa8A9Yz4M5OyhwQsysP19rGGV8vly3WNA+9n8ENrLfiR6RFvSewS28V0DPF2HOwDAwSpmHhWQps9l8hR9kMGdLakjZRPLPFo9GyqqxyIQTqnWmE0retTFSZcRXyj2wFd3pbpTvwhtk8R5DCXpMcEd4nnoX9hobHMAfGhqoYK+70Ul4CglVx0cmY9pIglaAIy98mKyg81Bpmwa40ckSAry0KD9vlD9I17XmxTei5B3kYNnQUmefMBy6MdYBdDrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DX6VI+J5zTutftBNoIpEZ790wHm9LK5avGUxjkPJXqk=;
 b=ZySHArvocw1ZQuynCVBF3RAktSRjrTdLrjXbRE/pTtWyF3ArzVfwboC1S3YFhLVrlc4ObaovHAK16EBHttStDQOJUMOg2fa7dLvJqDLipd4UEe0RB6YvfUyYR3vPT61C/HSduF65mHCtgMfjxQP/CypZLLK92OS6HxpIfi1tS38=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH0PR10MB4843.namprd10.prod.outlook.com (2603:10b6:610:cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.14; Mon, 30 Sep
 2024 13:57:49 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%6]) with mapi id 15.20.8026.014; Mon, 30 Sep 2024
 13:57:49 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: error while fetching the exportfs tree
Thread-Topic: linux-next: error while fetching the exportfs tree
Thread-Index: AQHbErwMs5BflO6R8E++83mRPcLkIbJwW/OA
Date: Mon, 30 Sep 2024 13:57:49 +0000
Message-ID: <0D78A66A-FC99-490E-A897-DB9507B87B1B@oracle.com>
References: <20240930080739.53c91136@canb.auug.org.au>
In-Reply-To: <20240930080739.53c91136@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|CH0PR10MB4843:EE_
x-ms-office365-filtering-correlation-id: 94054e02-7f80-4925-4cea-08dce157dec1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UkFVZE5jY3B2VjVrWkordTVQaE80U3JSZjhpTW5MaTg3TDJKcCtLMjNqZE52?=
 =?utf-8?B?WjdzbjFrUU9Edm1iams3b0tpZW51Y2RBeURlRWRqVlovblpnUWFKRXAwMEtW?=
 =?utf-8?B?Sm9VdmM5cXVUb2ExVXVTSUxoNkQvRWlSOEVSdEJZUHVubVM1NGcwb0dsUHd0?=
 =?utf-8?B?Zk1PS0g2OGNObzVJUGZVVWtzejNOdDJTSEdCdGJCdDA0K1llY2tZS3BmWWlu?=
 =?utf-8?B?RGFvQmgvYWp0N0owbFhHZlZUNE9OdGQrMWR6bUZVaDQ4N2NwV1R6ZEVqWTBm?=
 =?utf-8?B?ZlZha1V6bG9QUnpaQTRYMmtBa2JTeWk2OFJwOHFjTldjbkF1UEc0a1RBcVNI?=
 =?utf-8?B?NVhGRzJ5WllCQ3ZiWUZkVHljcnVLR1lqeS9rcHJ2VUFwdXlZZTVjQkJxRU5z?=
 =?utf-8?B?K2NuU3h1OHJWZEM3WlErMzc0N2J3MTUzU3E3YnFxeXJFcjluYUU3NmN2dnBR?=
 =?utf-8?B?cnl3WTFHT1pTRjRzT3NqRm1VclhtVlR3SXNhUm81dnhsTmR6cUh3NUU3VEtI?=
 =?utf-8?B?UGtHNHJSZ2tHd1cxaXV3ZkhubkZLVm5JSmtqeUJ6c1Y4UmpVaVdYdmxJYmRS?=
 =?utf-8?B?eHpRTGVmazN1NlNvNXpraGxZNW8zTm1NSjQwdzMvM1BuSDNJd202RWhibkRo?=
 =?utf-8?B?cFpOSHZiMFV4Wk1EaW1NM3pkT09GV2xPZzZTZzBFbmxrOWIrWlRDeFhaeFp6?=
 =?utf-8?B?RU9VMmZ0TmF4dFNyWEc4cEhqbEljbFBsdTdNSUs1dkR3TjdDNk1kTUpTQmJ4?=
 =?utf-8?B?VE5LYkZOVnRsNVpQTE9pY09qeTdKNEdwOWFiYmxWdldZWFVWcWh1T1hzaHQ2?=
 =?utf-8?B?cTF6NUw0T1pHejVTNk5Rdnl3VE1XMjY5cVVlNGRwZUFSUGk2azBFc2MxQUhR?=
 =?utf-8?B?Nk1CVHhvOHJteXA5MDV5K25kbnBmUnp6SzVsY1pyWGVmQ1ZsR1JKL20xSGhD?=
 =?utf-8?B?UllPV1FtSWs1N0RZL0pUeWNwdWt2bDEyRjZoeGQ1WTRsN3VqeU5kbG9lOENy?=
 =?utf-8?B?d092QVF4SmR4TXlkYlZxNEVrOFBtb2FNTVltbVJnTlJpRjVWNG5GVmowKzV4?=
 =?utf-8?B?QnhramkvV1VhTkErQ1FWejhCckt0K29leExWRFY5YXFpMVJKUHYxc1pBOVEz?=
 =?utf-8?B?WEpRdlIvL1pKdS9zS2l2Z0pGRUxyK0s2eU9iLy8yQUhoMnRSUVFjVGFLUWcr?=
 =?utf-8?B?dVR2NC9jUncwRlJ3WlNaOG9ENTRNZ2xKZWhNdEJDU3BZbkg4VHdkMzU4Y1VY?=
 =?utf-8?B?SUw2eGZkUG5sNG4vaktHbzNlREtXQ2J1YnZGMnZJaFd5aUt6VEdaMFZaRXB3?=
 =?utf-8?B?dGo1OGdBV2YvVHQrclFMZEtxYW80N3NSR1BYbXJ5T0xyeGNLamtzYjJabEQv?=
 =?utf-8?B?WG9zWUVuQW9DR1FFYU9nRVdmVjFkdlJ1b2JaTHBNMnFxSWZxcTNGQklCbmVV?=
 =?utf-8?B?bkd0UjNSdWFNNmo0TU1OQUxVZkRjaGUrOXVRYmY5QXF4RGwrUk1RcG5RZkkz?=
 =?utf-8?B?SUNRUEJnQm5WY21xWmNtN1FpVDZXL1JqSFk0L1FPQjJtQU1QTEJ1TzFyTTVD?=
 =?utf-8?B?ZmtXUTBYb3pwZXBha25KQlBhUktDTlAvOGsyTjV6YUR4YklEODBENDBUczdF?=
 =?utf-8?B?VFBYTVBya2dKbk5wT2EyM0RMRGVHa250TFhCeHpQMGZEb2dmd2dLUVdJZlZ0?=
 =?utf-8?B?dTJHK0hRb090VnhMZjhxZ28vUmdXMHNtTnBnSjJHQlNadHJQQUNzeFVzVU9N?=
 =?utf-8?B?VUxLai9ITFR0Qmx6WmQ3L1NKUkJmZnh0d29CUFh4djBwMGpFTEJkMWIybzhC?=
 =?utf-8?B?cjIyR2pOTllHZnlsMFpGSWZFbDVTNDV2bXBiVVZEVmNoVE5pMjR3TlY1SnYr?=
 =?utf-8?B?Mk1JN2s5dGJPMXRWVDUxMGFJUVRiOUVYTngxTUJwRWliVnc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0tONlVJRW81UUVqc1ZsdFVxeXNmMkk2VklFT2ZacTJyam5vcmE2K0dsdFVG?=
 =?utf-8?B?cEpwbTlqZ2VJTGt3OGZNNkcyUzFDQ3RDK0dPa1c5aVc0dVJrUFdMOXM2aE95?=
 =?utf-8?B?SFBjdmNhcFZjbFBVeW45YXphK29qdmEyWDdKMGxDNGxLWE5KdkZpMm1qcjJ3?=
 =?utf-8?B?YnNQMWFham9uUkhqSU9oSE5SeEt4aEl0MjhYN1NqUVZvQnRkUWRJS0o3VlV0?=
 =?utf-8?B?Vjc3UGZEUXBqdTB0c2UrY25iSG5FQTI2MVh1UEtoVDFyR3BRaXJnbkF4akNp?=
 =?utf-8?B?RllFM09NYmlCT1BHdHMvS0E4OUhGcEhCL0xhTVcrOE4yQTZ6RzRqT2VMc2E2?=
 =?utf-8?B?WnJwd24yelQwMGExZ0c1Ykl0K280YW5qWGpsRU1DZmJDN1V2dTc2U2RyT1VO?=
 =?utf-8?B?UWZjTVlHOGpnUStMYkJQTXJzMGNpc1Ntd3FjUVhOZ2dqd2lSU0xLa3NoRmlp?=
 =?utf-8?B?ejhwaStKdUpxMHppUEpuQ1FqV3RpOUFIWTVrM3g5TEEydDdHQmRySzRKNzF1?=
 =?utf-8?B?ZG9QODVDWEN5SGkyOXJFSjJ5NkloZExteHJlTlJuYkNaS0dQejJheFFCZnlP?=
 =?utf-8?B?SzNiS0lKOU9kbkNkVSszclR0dkR2QkxyVEdOUHBSenNmZ1VxdkI1b0FvNHI3?=
 =?utf-8?B?WVVkMUpGbW1GU2MyY0VoY0NNaStEOU5uZ2o5RXNZWjFTOFVQMGlmTGhYSlQ0?=
 =?utf-8?B?RzZHVExRc1VMUkNKS0NDajJzWjZwd3g4Yk1yaU5rUHdUZmFOeHdzL3AzWnRB?=
 =?utf-8?B?QTUrSlBGdGxweXpzRGlqdFFWNjhxU0c0WWZRZWtZdW1JK2Y1Q1k3QmxNK0ZQ?=
 =?utf-8?B?SHhkUnpZRGJUZjV5L0tJSXdjdlJPbmxJL00xTVp4QnlVbFUwU1FTU0l1UG9l?=
 =?utf-8?B?bkRHSjhjd3pmOUtwUVZvMWozMUlMS1JDYkRyMmpjY1NCVWdYbUxUOW5kK2Iz?=
 =?utf-8?B?WHliaVJWd3NDcVAya1lyeEZnU1A2SGJyY3pERTh0ZFM4UHdidDhvKzlKSWxo?=
 =?utf-8?B?VllHMzhBYkJOaHNoNDRtZFVqdks4WnZIaWt5aE5aakdldG1oYjhEZFhYeVdK?=
 =?utf-8?B?WUZIVGtOREJiSUtRa0src0xDalhtOEtITmM0cG91SW51bDBUM04zNmJ5ZmMz?=
 =?utf-8?B?aE1oN0lpZ2lnSkhYdlgwZ0ZZeGk0bVVrc0xHUkV4QStYUlJOdW94V04ySVZK?=
 =?utf-8?B?NjhBUEFyQjZwTEkzZE8yU1ZsYzVDT1IxTXFMRytNWlZWUFdHaHBORnhHUTVU?=
 =?utf-8?B?R0k3ckdxMm9zWDdPSENXTHNSV0NLRW4vYnVBdDV4TXptYkFRZGhXSmpnczI1?=
 =?utf-8?B?RmM1cnM1YjNiYXFlL1JRRDQ0S3M1YlEvUVl1RlhGZnE2TFJ1VVlIZ3NIWUpU?=
 =?utf-8?B?K2V0YjM2TlRzSWx2aFBXMkNyWHBSUkFZSjBVM0dNTFZvWTdPSFZMQTZ3VVo2?=
 =?utf-8?B?RnVOMjFlWUp1SlNvSmVsOHN1YlZGVngwRFB6aXhaekg0RHl1Vjc0aGdoS1NO?=
 =?utf-8?B?eUF2MHVYeHM3bENudFMvZXpxVEd6clViQ3N6WXZxTkhXdFE4bGFFeERuT012?=
 =?utf-8?B?Y1FXemkwZTUrZkZxY0Y5U3RuRVJQSThvTVdIVVFmRWVrMkZWZ1FMc3NXdE9P?=
 =?utf-8?B?LzlCN2x4RlVIVitwN2c4cjA3VGZoaDRsdjVERWczdXJITEJkMXNmNGdUN0Uz?=
 =?utf-8?B?c0FtZTI4dXlNZnp1a1FZQUVyZGpnVzBWaFl6YXRkRGFEa3BOL0VjRGdIbndt?=
 =?utf-8?B?MG8vTU5jRk5yUmNUVk1JaXlOUDhkbytuVDhxbTZVK3ZBU0NrNGxLMDVXa2xj?=
 =?utf-8?B?Sjhkbmd6ajVKTTg1OGtpeHl6dTEvbEphbjRLK1BTaWZJUWdIZ1JLejZPQllG?=
 =?utf-8?B?MXJpa01PR05WVEFhY25lUENFZGcxU1VpREZUYUUwc1gra2RTdUpDaml1S1Uy?=
 =?utf-8?B?UTlDcFVPMmZIK09KMFlEOTdqdG1GMzRSbDB0T3dEMVUzNEUwZkF1ZGJGVWV4?=
 =?utf-8?B?Mk5FdkQwczc4TjJPTnErWTBnOURBMWxSQmJhNWI3ajJMbFR5eTQyaDZSS1ZE?=
 =?utf-8?B?UndBWDhhUENqdW12SG5NR2hQYUNzLzNwNzY3K25KYzk5SHpzZGxra0tiaDZy?=
 =?utf-8?B?Y1hOU01sS1ZtcVBUd2hjZUwzQkhTY3gxSXpBRmZkTXdvWjZ4UGFpS0JKRVFK?=
 =?utf-8?B?U0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF2F9E57C3933844A72E9C2617CDDDC6@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eTvuGvhXX4jSJGI7iW6cYCP+staFv1ZrN+JzIYsw+RcBIV0k4MQnFtdDDKpHIjG7OAFX0yrHz8kHq/qWOSej4v4iFKN/zDdtymZYlOmthbzXLnzMdsiTtB/c2p4Z6GV+nb2G1HxPqmqw5oIKfm+u4IQYX7UkY+X86TmKRg3Pj24LlmFLt+0dRb3+EU/zIWewqaosk2f1uqBlTuhzwyOn2Tbuk8gsKXkxDXGQsq7PtIPpmaJQqE9LeprxtQ+scT+Ga2SR8H+Qrm9y8sK0tEMNlr0tfMOKwWlnDNKkYdkYEJwkubJpmUF2D7rqOSMxsmVh9zi3NUZ4ahQp5BS9HAalKRz88jIUHBOjTZKDElFuEkOiOTnmeeQpdLhFsKeXKXkG1LX6GQ2vqiVwVjEHhQmghvxQi0oHuGFLZ8Keq9SFjLvFVGpbdK+F+sXI6ZUInWQ/EcoVTyrBsV/kEwso6h7459qwMIWpo/P4cV+Lqt3/7PAw8/t8k4p89gxDX/YVry5T+GEoqTDJLsuhBJWyfHuwn+f/18Q7FYCH9UDKFQKkSR3r3N9i303EruRoFNuFEV21lxO0OL4vY83Ng9J0IeXKouzmDNB/X6j8aPis6vukogQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94054e02-7f80-4925-4cea-08dce157dec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 13:57:49.5350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DiBsiiMzqDudFuS/MRIWAmnbC4w4CF0bP1unQY5PZCj6qEf55j8gCMFukhgz+IaUpanwZmPsJHFgeeYAHJ8QaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4843
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-09-30_12,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409300102
X-Proofpoint-GUID: wOq_Mww4VRj1ILHMJh1GFMDXDpVLykpO
X-Proofpoint-ORIG-GUID: wOq_Mww4VRj1ILHMJh1GFMDXDpVLykpO

DQoNCj4gT24gU2VwIDI5LCAyMDI0LCBhdCA2OjA34oCvUE0sIFN0ZXBoZW4gUm90aHdlbGwgPHNm
ckBjYW5iLmF1dWcub3JnLmF1PiB3cm90ZToNCj4gDQo+IEhpIGFsbCwNCj4gDQo+IEZldGNoaW5n
IHRoZSBleHBvcnRmcyB0cmVlDQo+IChnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvY2VsL2xpbnV4IGV4cG9ydGZzLW5leHQpDQo+IHByb2R1Y2VzIHRoaXMgZXJy
b3I6DQo+IA0KPiBmYXRhbDogY291bGRuJ3QgZmluZCByZW1vdGUgcmVmIHJlZnMvaGVhZHMvZXhw
b3J0ZnMtbmV4dA0KDQpGaXhlZCwgc29ycnkgZm9yIHRoZSBub2lzZS4NCg0KQnR3LCB5b3UgY2Fu
IG1lYXN1cmUgdGhlIGV4dGVudCBvZiBteSBsb25nLXRlcm0gbWVtb3J5IGJ5DQpjaGVja2luZyB0
aGUgdGltZSBiZXR3ZWVuIG5vdyBhbmQgdGhlIGxhc3QgdGltZSBJIHJlbW92ZWQNCmV4cG9ydGZz
LW5leHQgYmVjYXVzZSBJIGZvcmdvdCB3aHkgaXQgd2FzIHRoZXJlLg0KDQotLQ0KQ2h1Y2sgTGV2
ZXINCg0KDQo=

