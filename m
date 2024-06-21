Return-Path: <linux-next+bounces-2627-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F204A912C2A
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 19:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C3B284F7E
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 17:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C1313D521;
	Fri, 21 Jun 2024 17:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CzihfSta";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CqX40lrR"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C0750A80;
	Fri, 21 Jun 2024 17:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718989389; cv=fail; b=mFKWRdnBkY0SSwqjWUW7+kd+yfM2bjxsg6Bjxem6xSg639mhCrURLr5mlljY22rwow3oxIqQ5xLhqvxBLAoI4ZrKatNNXchh8U6C5EM91Q9PctiXgArlNy1eHQURSO/qcZCQTcLgx8PKYdRWNU6+lCdlDy5Gjeb5w776Gyckdmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718989389; c=relaxed/simple;
	bh=7AIjB6uHJ9zcQOlNzzsU3MUgTkTEoQgNdl2Wfdd5og0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FEjvMsh4lN40wPv5xgjXq2Qdnp6bCbKr5PUf8gHPyntmjeg9Ihx7UXn2gdG4dXjcn1gJNy1KcF2qXYwPdTCJDbsoS1a28K8NqH+LJLerNSAvIRsp9lqnizxW1d5LWqg9ZTX4voqDVsyIQf8OY0lOq8dSUhfRUmKOBK9/JqlRdwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CzihfSta; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CqX40lrR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LEXcw6026327;
	Fri, 21 Jun 2024 17:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=raMqml6rV4nNsjUiSBuicXR/s0dF/L72fxERWEtODLQ=; b=
	CzihfStaQ+RQlQQRtPS6Xuvee2jRB/MGihmDoTWNl8HmIOXIxb8QPx+LKni7NleO
	nI3+A4HlQnIxg2AjGN2vxbN7NF5AV4M7NF9RQp2bp6mWq7DpoZ4IDB3DiE6gr6pW
	Ewjn6wyz78GOU+h2QjkigD5Qv54tU04oyR6Ps9zS9nYNbq0q+C3U/daPCVFxgYLT
	0E8DoiAIYq1bORB9C8CWGX1oc3xJ1jyPjmgJg7yQI1qBu/M0tM3c9yzkufez/yXB
	NnQputx5K9F0+PKER0lW4ru2NFvrR53k3nr15/KBGih9NqzF/fFI7nNZyh2N0YQz
	6Swlivt1mNpMNjEs+Fy1/w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yvrkft646-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Jun 2024 17:02:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45LGrJvr039970;
	Fri, 21 Jun 2024 17:02:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3yvrn4k26j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Jun 2024 17:02:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ypnssmco3qKLW7kgtk4hh6heXeiu+k8VMzSbMZ3CyFcOh/tawSEvh5wkoX2bPSmpdG7slnBMoxkMmr084ZgaohdCD2qptZJ7h2vYHhNSIETJxUercv6Y8OdQTjp0v2QkCpup89nJBIrD7YwdyF+Y7lqsAs2SVi1ge3IR+CMe/zBRJbk5BQGJcNs9uN5kpLxGXiMJ7O7nLvWm0h2UY0AZMLUqcxqOZN54WQKyn7HSyW90EGBiHdJJO2F0IZ32FE9NDvuQZ3FFFekr3Ef0OKEwmBkHzGnACFdDuLXBWpSZ8jKM+W6nPJ/6GOjuMon3drkhGrp5RFuG1R4Gd8R3MPMQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raMqml6rV4nNsjUiSBuicXR/s0dF/L72fxERWEtODLQ=;
 b=OVjhgu60wjHMU0EzIwm2wpLxu91VzC4nMysasf4r1ibRKxNFLJXeSZBKGBP2zOdqEcWJ4WpeTjV8QlTtCgOARPXhDl75Hu2BXgyp6nnvQNMA4eZGqiZVlre+ITM8KXUEQCLiQl2byZzZWoR9CZ4hmoW/7dGvDl05tmdgq/d9nCcFki1gelKYoGPVSxTDOKMo8TEbgdVBYTGQ1htKjv3dukRyWD0B/tyz14OKQv1vc+Kp+Vd8vrkouRJB6rVSrzrogYaKbL4urHW28zokRt9ihSZo7M+jm+gexkPHzaDLnprXwN/OPDB8F7HHqespxw3QhapbN64do4Ucg/zO2YVdKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raMqml6rV4nNsjUiSBuicXR/s0dF/L72fxERWEtODLQ=;
 b=CqX40lrRGT0jcntDQyW4RtoFRoF9CVOgbfiVqPDTo0aeJJoSWsvSGPAbtFFpNQvVzHv0EFGWe49AOGYGVSx2QPfcgwXEYnmt0ij7ptZS1Gut00p+xjk1tHJ/U6OGm2udMiQH+QU79nIejAGaTOH/u6efSUSq31Y2V3ddZWYLqMc=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by SA2PR10MB4521.namprd10.prod.outlook.com (2603:10b6:806:117::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 17:02:52 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 17:02:52 +0000
Message-ID: <b098bd2d-f308-4383-b348-98f9904ca28a@oracle.com>
Date: Fri, 21 Jun 2024 18:02:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
        Himanshu Madhani <himanshu.madhani@oracle.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Keith Busch <kbusch@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <ZnWe6sXMxm4RXBcM@sirena.org.uk>
 <670625c0-a288-4166-9209-2eccc5ee97c3@kernel.dk>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <670625c0-a288-4166-9209-2eccc5ee97c3@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0014.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::14) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|SA2PR10MB4521:EE_
X-MS-Office365-Filtering-Correlation-Id: 803ef683-483f-411c-87a6-08dc9213fcb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?LzM3Zm9rVDd4alFuYXNmaEJPekQzZDhlM2lSVW9HZFlKVTE1VGJiSkRrazBi?=
 =?utf-8?B?TE9tUWhibkZLa2pWSXppUUhkQUZLSzN0N1puUWdxYWNHN0t5R3hHQ0VVa0Nk?=
 =?utf-8?B?QVJlNWVVKzJ5MlhJVmpmZUJ6dFM5UTlHdHphbkgrak85U0gwZ29wWit0SzhB?=
 =?utf-8?B?Y09PRnhXMnM0OGQ3RDVSMkxBWjNIMjhnL0VGR1FOUWFCcy9lcW9IT3JsZDFJ?=
 =?utf-8?B?QkFKOVhZYWJmTFZpRHpBQlBwWUsxS09NUFNUSThJdytXYnR3b1A3ekU2VFd2?=
 =?utf-8?B?RkFVODFQMU9pL1lMV05jK1Ezb1FvcVE0VDA3N3VaTE1mT1dKejQ5RnFlUi96?=
 =?utf-8?B?UUwvNnpQTVUxSnRBditBbklrekxLays5NURvcXBmSmF4d2VpYzIvcWVjZkVE?=
 =?utf-8?B?OGxCZ0xMTC83emRKeEo3T1lScXlGS2tvc3hsc01MRFRiYTkwbjRibU1IMUtj?=
 =?utf-8?B?eWRiOFpodjd4VGxqblI1MCtsK1BYcG8rdTRMZW9JUnlwU2EweGxqRENVL0NN?=
 =?utf-8?B?d0ZGUnNncGdDQmlPVDF2OVd5ZVVQMkdGVWMzSlVqdmFLTEFSeXBYN2I1bEJC?=
 =?utf-8?B?TnV3Rmh5UEt1RkNjS1RHcmJHcHlvV2dLOFI1Tm1mV2ZEOVdZUEZjenhXUmg1?=
 =?utf-8?B?RXJQZTNITUQxbHkvZFFaU2pYS1RldW9ENE8xaUhwZFQ1TjdXUEZ6MHRjWlNX?=
 =?utf-8?B?WUJLTHNzTkZHTlA0QTBJclBhaTFSdnBOdHhPakVWdzRhT3ZFMGg3bmhJR0xi?=
 =?utf-8?B?ZlViVHhLWnNoYVYrc2pWS0Z3Mmw0N2dJdHRLOTlpODdDbEh5SjltTmNac25E?=
 =?utf-8?B?SGo5TU5rUTRPMVZ4S0ZnK1EyNzBTVmRyYU5XR0E0dmlZUnJZNUFKUTlkeFJR?=
 =?utf-8?B?MEpPS1NXNzZmYkVVUTY1eGhwOVNTODU4dDZuRzFGM0w3c2prMXIzM1pXeHVF?=
 =?utf-8?B?U0VrcEsxRzlSYWpBOTh3c0x3NUI0Q2NNWGZzL3B3cjlKUG81V2hOQ0VmRGs0?=
 =?utf-8?B?MDdLRU9rdGxEWDBDT0JHTXZDRjh0T1FjM3NLR1pVMnFDb0tvT1o1Y0hXc3pa?=
 =?utf-8?B?OUdQSXZ1NDBYS1RHd0ZhOEtTT2tnb2ZCUXNrejJ5dStiUFJyRVp5Y1ZoRFAv?=
 =?utf-8?B?RmdudTlHTGY1b1BxVXVlY05wNStWYVppdkppTlloT3lMbW02TzdZVTFoN3VN?=
 =?utf-8?B?cTF6bnp0QzhqcDBFRW1DVUpJU0E3ZVoyYyt0MmhUdjFFRGJTalJ2R0wwekhx?=
 =?utf-8?B?MWVNOW93Z1RPdktkS2Y4T0ZwaGYwaVY4U3VodVZtdkc4V2RrSFJGQUE5R00x?=
 =?utf-8?B?TThsZUhoTkczTlhNQ0xaL04rZFJRNUcraW84RjV3WmVadmxCdlBMekRWWmdD?=
 =?utf-8?B?YXpQaDdEcFAyQUttRXRKK0U4UkZKNVB0cklRVmhHNnFMYzVFTCtaSDluSUZJ?=
 =?utf-8?B?TU4rVXk2K0dmNUJtcEs4blp4cFZMbVdXdlNXNTE4SWFWaXlNVEVOODNjY3pM?=
 =?utf-8?B?WmlmUzZjSkxsV1Zva0lSN3NkVVZnejMzelNzeTc4dnJHaFlGbzBDdDNJeE1W?=
 =?utf-8?B?UDVudEFneGp1eW9yUjl5aTZrTG5oQ3AwZDR3Y25rTWdUNCtRRE5BcFZzQUha?=
 =?utf-8?B?d2RhUUFxM3FZbnZVWmVVRTB0MDRzMndKc0h5VjdZdm1XT0hZSmtDSElRRXZZ?=
 =?utf-8?B?cDRZaEgxY3pETkxDYjdpbjk0TTF4cU80dWdSaTNFZVMrSE5WN3lhakpxT2Vr?=
 =?utf-8?Q?ugsfPXPXAfiTmdRDu5TAp/O9DXd0YRcomSmKhXn?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enhwTHZPdFVaekpZOC82Q2JBbWRib00vV1Y4L2xrZjNsU3k5V0MxUG5FNXI4?=
 =?utf-8?B?R2JOaVNhWHQxejhHVzJXQjZQYTZuNHdBb3EwdXJBNG1nR2RCTDBIYXRDY2gv?=
 =?utf-8?B?SExpZkpnRDR5U3ZvaDhlU1BHYU1tc252K1RkOHFycFlrTEtaOXlSNFJlYVg4?=
 =?utf-8?B?NDU0U3RVVXJlWHlsSi9tTWZvbEMvVk1FTk1McWRLaFgwclJVNythVDE0Z3Ja?=
 =?utf-8?B?RXBtWUYzU0ZuR1hnZmh6WUtGcEFzdWlDWWR2NzZBWmY5UTN1T2JpY2pwUyt3?=
 =?utf-8?B?MjVIaFJqREwzRXlLN3A3UUNjZDlnKytrTkVLMlp3SXlmdmpXK0Y2VGw1cjFG?=
 =?utf-8?B?SUFwVGJIL203aXVWSS9YQXh3azhMOU16dWIyUkdmS1Y0aWJsS0Y4QXRjUys2?=
 =?utf-8?B?Sk1xc2Z6SFljc0JkS1BhYTFkaEIyRXRYNFBRdGV0SGMrL1J5ZUtlNDNZRW01?=
 =?utf-8?B?T3R2M2NjZmhiVWhtYWhzd2dvSGVBVWJkZG45bmxOSHB0elJwc2tzUEdodDZT?=
 =?utf-8?B?SFRkRmpINE1YcVBNdXR3eEFMbmZvSTR1NDVlYnlrUjdEYXNDWjVxVVVvVC9m?=
 =?utf-8?B?dmRkNzhwVVQ2Myt2NVNTUHdMUnR1TjdKdEFnWTY5S1B2L3RaWWpSK0VMVHJB?=
 =?utf-8?B?dC9SWWE4cHo2RHB0L3p5OWxBVzV6Qyt1WFBoWVk1Y2JJSVYybTdMUjJsUXNM?=
 =?utf-8?B?dmxIZjM0QmpqczExYmFENnpmREtuSVBDMjBFRHZUakkvV1EyZGQ4a0IwYnlY?=
 =?utf-8?B?L0ZDSTg3K3pJOVMzOWt6aEZsQ0lPNXVrSlFoTlZQYzEyU0FSbmJVMGRia2Uz?=
 =?utf-8?B?VjM2UXpjb1pHZFlkc3pzcVFVSDh5MGZqMEFLNmFwU2ZWMDZjUWlVb0dHR0dp?=
 =?utf-8?B?bGJiZ2VxbjVWV3JQajFOTjlhMGo1emYxeUtNS3dtMjVialF3T0ZISG95ZUlI?=
 =?utf-8?B?RkMxY0hrb1BqTjYrQlJGaVNra3pTUlZRK1NaRVlVUkZUQVJ1dFhWQlQraUd3?=
 =?utf-8?B?eG1YVFpWTncxMjNCeXE5RWliUFVUWVBuNjdNaHM4cUpBaUoyR1A2cXdkS0Jh?=
 =?utf-8?B?RG5RWHhqNklkU2VudC9iTUNqOS9XU3orMVVBV09lUTNYYlQ0V1V0akNkb05M?=
 =?utf-8?B?cDdmU3RLdldEdW9sSlBsMjlMdWQzMUlsSTh5WnZ4VG1yV2lLSGg1amVpRkxM?=
 =?utf-8?B?eWdlaFpxU2pENGJVdEc1SVQrVUZ1NjBwcXVmQnlRS0ZQb21BR2hpZmNteGVm?=
 =?utf-8?B?YUhIblJBaTlxY2Y2UzlndERWcjh0eFZUbFFNQUZPRkt6aGtsdW82OFErN2p3?=
 =?utf-8?B?SEluVzAvNU16RUQ0ZkZTYll1MVVYY1hXSWUrRGhCUmJTQkp2aW9pS1E0cDll?=
 =?utf-8?B?TU1BUExjamk1cTdlM0Q2R0NUcVhDcFc2bytpUHlkSk9wWFVMUWY3ZHRUSExL?=
 =?utf-8?B?QmFGdWN4MFpVR3BmQlVoWkc1QzQ5TERUblZsSFczMzAvK29ISE96S29HelBP?=
 =?utf-8?B?NU9lcGZ4UzNFQnNQZEp2STZwU1dwQkNjc0k2NlhQUHc2NXdvbVRQYXd5VjJt?=
 =?utf-8?B?OXVFMThVUm9VKzJqRWsvZU53RkM0bkQ4Ull1WkFXeVdac2ljN29rbnR0MmhN?=
 =?utf-8?B?YktXZUN0NGpYa2N4NWE4cWpwUWY4dTVoVGFOWWZDRytnTHpISGxwVWg3MUEr?=
 =?utf-8?B?WFVZcXNtV3QyUGZZczZlYk1nTDROam5iZDNYNjRkN2lRWmJlU1c5MWxIamtR?=
 =?utf-8?B?ckhUMXdWbXdnL3dWcitGcFhwdG5wbm0xSis5YlRjYUxabFdzcmNQVFBFbmoy?=
 =?utf-8?B?OXdLMi8xWnl1blo2aTl3UlN2aHZzT01IR0gxWlFpelpzSiswazdtR3JWcG5u?=
 =?utf-8?B?c1FoOGhqYlJ4YVFLSExRcVdodXE0NGhSU3RFNWx6TWZVSkgvY3BycXpQWURN?=
 =?utf-8?B?T0NBb3B1ZXIvN0t6R1Evb1BLT21rZFZDZ0RjNTIzN1VuUk1tejRNOGhTU3dk?=
 =?utf-8?B?bmhpYVRwRlBZaWJ6MUFmUnhLS2dRS2tiWTFZTnQ1SEhQTWN6dHhyMzZzK0lH?=
 =?utf-8?B?Rzk5MGZrUnBrd0dEVjExcjNIVTRXcnYxWndxUHB2bGN2MTh5K3lXVURDT04w?=
 =?utf-8?B?bHRxc01yRktMVE5sTVBJR1FsbHAzRXczUm1nKzg1Yi9yaDB5ME5zKzNIV2hX?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ywg1j0m7RCQ+LrW+cz6p4e4i8V6G9yezr173ABbas66pExDmyM2TOHiXEGdbvCjXIVcRn/RF5eQJUTUNj6IH0bSI+zKZs/rDHdQotUYvIq0zbxSsZSJJ0/mXuTX+WrdCgjA1Mh+G/cz65PxZrsSK+q6ULo3hdLpHvbqPWZRldExpgCiwSmM/1FI9wB8OvWXCRcSLieYo69wPInxxeg4ALxHQoFqnxaFzuBsgupcJWKgtkyVOQNX+8ltDYNd2dBAoIrY+VtWsuuJ2F22vn0qmqmUf0R6O7/ki4CrEcziXNmrwC0notrclIDnGItYvGV4evtNku2Jw0RVfssvzteYz1tL+6RymQvVcg/c7ODsMUlF92v3wSi4/Ww4KgPeZmIAWHDWjYuBPSNoC7bNoCxS59zkbufUJ28DaotOesKc/aMLKUIQOig46fh4caGUsI8+Kr844lmVAvFmTo0356q39OSAwvBP5AtUjoHnyMAO8GfuwnWoNEdok9FdPmQr0v7LTYr0ZqBKg9NUT2tDTbs0GwJoRzigsCzVs4kE/1fZJliY24Wuol1RCKJbOSYAZ7275E6fAqCPQRMfH6CMYjaOiZo1A5EQES9ssG2iBGRBbCOc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 803ef683-483f-411c-87a6-08dc9213fcb2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 17:02:52.3731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7b8erFc5sM/RECj9vFRBaaAAoyOrfpSnNbXmP3XzRGgGag7nTi9dqdILl130dXnY/WSfkBBJCk9SrnsOli2LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4521
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_08,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406210123
X-Proofpoint-GUID: K2h_DQsF_D4UcRz4RhWmebT_XLHMKjl9
X-Proofpoint-ORIG-GUID: K2h_DQsF_D4UcRz4RhWmebT_XLHMKjl9

On 21/06/2024 16:58, Jens Axboe wrote:
> On 6/21/24 9:40 AM, Mark Brown wrote:
>> Hi all,
>>
>> After merging the block tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> In file included from /tmp/next/build/include/linux/printk.h:10,
>>                   from /tmp/next/build/include/linux/kernel.h:31,
>>                   from /tmp/next/build/block/blk-settings.c:5:
>> /tmp/next/build/block/blk-settings.c: In function 'blk_validate_atomic_write_limits':
>> /tmp/next/build/include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
>>    222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
>>        |                                   ^~
>> /tmp/next/build/include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
>>     28 |                 bool __ret_do_once = !!(condition);                     \
>>        |                                         ^~~~~~~~~
>> /tmp/next/build/block/blk-settings.c:200:21: note: in expansion of macro 'WARN_ON_ONCE'
>>    200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
>>        |                     ^~~~~~~~~~~~
>> /tmp/next/build/block/blk-settings.c:200:34: note: in expansion of macro 'do_div'
>>    200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
>>        |                                  ^~~~~~
>> /tmp/next/build/include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
>>    234 |         } else if (likely(((n) >> 32) == 0)) {          \
>>        |                                ^~
>> /tmp/next/build/include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
>>     28 |                 bool __ret_do_once = !!(condition);                     \
>>        |                                         ^~~~~~~~~
>> /tmp/next/build/block/blk-settings.c:200:21: note: in expansion of macro 'WARN_ON_ONCE'
>>    200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
>>        |                     ^~~~~~~~~~~~
>> /tmp/next/build/include/asm-generic/div64.h:234:20: note: in expansion of macro 'likely'
>>    234 |         } else if (likely(((n) >> 32) == 0)) {          \
>>        |                    ^~~~~~
>> /tmp/next/build/block/blk-settings.c:200:34: note: in expansion of macro 'do_div'
>>    200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
>>        |                                  ^~~~~~
>> /tmp/next/build/include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
>>    238 |                 __rem = __div64_32(&(n), __base);       \
>>        |                                    ^~~~
>>        |                                    |
>>        |                                    unsigned int *
>> /tmp/next/build/include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
>>     28 |                 bool __ret_do_once = !!(condition);                     \
>>        |                                         ^~~~~~~~~
>> /tmp/next/build/block/blk-settings.c:200:21: note: in expansion of macro 'WARN_ON_ONCE'
>>    200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
>>        |                     ^~~~~~~~~~~~
>> /tmp/next/build/block/blk-settings.c:200:34: note: in expansion of macro 'do_div'
>>    200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
>>        |                                  ^~~~~~
>> In file included from /tmp/next/build/include/linux/math.h:6,
>>                   from /tmp/next/build/include/linux/kernel.h:27,
>>                   from /tmp/next/build/block/blk-settings.c:5:
>> /tmp/next/build/arch/arm/include/asm/div64.h:24:45: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
>>     24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
>>        |                                   ~~~~~~~~~~^
>> cc1: some warnings being treated as errors

I did a i386 build, and no complaints.

Now I see that the asm-generic version for 32b architectures check for a 
64b dividend, but x86_32 does not. As for arm32, its version of do_div 
expects a uint64_t *.

Maybe this would not be a bad change to have:

--- a/arch/x86/include/asm/div64.h
+++ b/arch/x86/include/asm/div64.h
@@ -22,6 +22,7 @@
  #define do_div(n, base)                                                \
  ({                                                             \
         unsigned long __upper, __low, __high, __mod, __base;    \
+       (void)(((typeof((n)) *)0) == ((uint64_t *)0));          \
         __base = (base);                                        \
         if (__builtin_constant_p(__base) && is_power_of_2(__base)) { \
                 __mod = n & (__base - 1);                       \

to catch this same error on i386.


> 
> We need something ala:
> 
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 37fe4c8f6b6b..cd33eaba4610 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -175,7 +175,7 @@ static void blk_atomic_writes_update_limits(struct queue_limits *lim)
>   
>   static void blk_validate_atomic_write_limits(struct queue_limits *lim)
>   {
> -	unsigned int chunk_sectors = lim->chunk_sectors;
> +	u64 chunk_sectors = lim->chunk_sectors;
>   	unsigned int boundary_sectors;
>   
>   	if (!lim->atomic_write_hw_max)
> 

Sure, but I think that we can also use the following, since both are 
unsigned int:
	if (WARN_ON_ONCE(chunk_sectors % boundary_sectors))

I'll send a fix.

John


