Return-Path: <linux-next+bounces-5558-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6982A431E8
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 01:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A40D917AB2F
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 00:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B7A10A1E;
	Tue, 25 Feb 2025 00:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PAZrcjFN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uy3pzHZy"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133A5FC1D;
	Tue, 25 Feb 2025 00:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740443695; cv=fail; b=sJ9CkV3Vxnv4lgWbbVdfC9zdONoHAuXrDzK69pASN1SVlDg29W8B7LTAxM57UKUQGKeYrT3FcBVwqhu+hjMT1rnmI3n6/LdQwzvBz3M4ZzNf5SnedzXIIUlEjuERsZZpROQ+UWrH55QQHziOul7LH0NgrK4A5xV+EWti3LuwfMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740443695; c=relaxed/simple;
	bh=sjsMl+JZSD6/sHLpv2X0j2OYHZv/u2SHVpGSnHYakUw=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=mCkHCAASS17lgoOb8cjGZmOOlEOjfI3DPVogx8xKKi3MmNy2PrZoqjd4ZQdrsnuGjvn1WcKjAtpSg009tcy/SCks9q7KI3Zf/QBHsMl5P0TWEwZJ5h1lyGFnGEUfR2y4tfQFWM1LTLAcNwK+w9RsfVv67MXgAO3VYSWh51eIVcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PAZrcjFN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uy3pzHZy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OMKgu6012163;
	Tue, 25 Feb 2025 00:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=mxAlYMuKES16eS+3vs
	BfccL1t7wjqzq3SQCTMvVvee8=; b=PAZrcjFNRbRbfhPHAZx+N4r2qthQ1A4dLQ
	uTPzqU3jVBCJ2JIvYwPU5tA4RAMbofSZdFuYrgSN3t6j4t1xBCuFP5JgWgpJ0Ikh
	LPxkV9f4jL5nEm+pccfTsXUwGNNwZLYksm3Dd4P1Es3jrADAHsrS6sKIW5UE9HXR
	r/bbmjOsvMJ1eskqf6r8eRLdWYBlQRcArf3zN3CfRsQSFr8ixUjMXFS6PQwaCB8C
	IvkUg7DWSn55lALlqJI1epQyEqTjL9Tfcn0dtctkheU+w8Z8X42H13oyePs8v6EL
	m6808Fsb3Gnq6NdSJx36Z//F/MqUgV7VGqnhZHbS4/MvkB99fc8w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y5gakx1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 00:34:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51P03Bvi008305;
	Tue, 25 Feb 2025 00:34:34 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51egb03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 00:34:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXNj7YJS1Apuoi9nK9JfrOwRi3wm1y5H6cPbccxBXxrPZPlBG9sDJkBKwv39xQ/D0nJ/f0tXeIqCtbk6xli7J9uUN7Sy1VeGmi7pSiv23GnTu2ptRhAcMrUiIk8IiwQQ17aW/BVG930HYLgylTjez44oU+tAY/xA+MXKRWNWB11YEkl/lU2NAdHeA8X2sRN3BH9sNvV+wKXJka2qMQ2yqZwMDKaiaEcvJRjBMFOu5Wb0l58h3iv9UHuQG/4+kk/VS/EQogNpGl5J1EkMM7E6St+SxAUzEu8qq7YTnVNHlnE5lrv51OYOtatNMpVycRacPPRDtFdsfknycKNeqIIf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxAlYMuKES16eS+3vsBfccL1t7wjqzq3SQCTMvVvee8=;
 b=h0k92VTfLRXVU+/9tjtgZKsXjdYuoefaeBXqUg32GnYzMiyYgX2DrU2h+I0GqcKrgxiiEc3Z+Olj2LjhU80P5BgcKjDO0Bav9w4kqRYX6r7l0WMK+bnwRVveItg/VhPer0ZexvOQXQ6D5sYYy8RdD3pnVIL9MQ/uEn869y084yq7przPkoSr5AjEACpZ6QBnSMMCdJRtgIv2Xlu0Fnu0tVYuqo2ziNyyrKPnl45Qou+GBXbuR5jh84KWeRI1kVRg//5pdnRLs0cU1L1vw39HQOGfO3F6UqTgo2BrjWQANFbVtb/2fAkQw1xIXoCtis9t+YvpUKSiBLbP/0sH77xKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxAlYMuKES16eS+3vsBfccL1t7wjqzq3SQCTMvVvee8=;
 b=uy3pzHZyGZoZJg4rJXzQQ36HAPh0QRRKfo6dE1c3V7mF706d9exTi9Wx4lwj763pUVvQPhg9nVgxqkZJFWOW3GJgZsutuoLJqWzYOdskMqtVBRoe0rptajfjxlslJfROzBdktHFckj+Qbslb3ohk3x8LhVOwKhM6EClH+DMhl4I=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CO1PR10MB4561.namprd10.prod.outlook.com (2603:10b6:303:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 00:34:29 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 00:34:29 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next
 Mailing List <linux-next@vger.kernel.org>,
        Heiko Stuebner
 <heiko@sntech.de>
Subject: Re: linux-next: build failure after merge of the pmdomain tree
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <CAPDyKFqBwari-MoRefG82kbxovVaLt3ewRVFihHoLbrOSWSnMQ@mail.gmail.com>
	(Ulf Hansson's message of "Mon, 24 Feb 2025 13:16:46 +0100")
Organization: Oracle Corporation
Message-ID: <yq1wmdedfsa.fsf@ca-mkp.ca.oracle.com>
References: <20250220113338.60ba2290@canb.auug.org.au>
	<20250224122318.228f695c@canb.auug.org.au>
	<20250224162048.7806bb1d@canb.auug.org.au>
	<CAPDyKFqBwari-MoRefG82kbxovVaLt3ewRVFihHoLbrOSWSnMQ@mail.gmail.com>
Date: Mon, 24 Feb 2025 19:34:26 -0500
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CO1PR10MB4561:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b23ad6b-24a7-4005-c3f7-08dd553429e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AJPQ3JExr1x4W526Fi6u3vJ+a+PpJEgOwIanY8vCCh0elEXLlhJp8n+6LgYf?=
 =?us-ascii?Q?2CsFmHiEKEJwHX6kHRYjZ362tOliEdBJtMc4ECYapeTDDyUXCx7XeYfRIgpT?=
 =?us-ascii?Q?qkFx+XhR2hAPaFa89xfdgNBG4mbyN6KRqDNNAn85QoXa4LRg15HpZAejlhIt?=
 =?us-ascii?Q?d/Mka9BMHQVanU9CL30JXrunkvrLaNMqt46ZjTT+FUaq/O6/WVEhIocF2K1v?=
 =?us-ascii?Q?fdrfq/qYxz5fJ9+xHTB3ktOpTG6P+yDUNhFM8DbM42K4v1sjgrPy2J4jzXrd?=
 =?us-ascii?Q?0sdpn9LGMw9iIYbi0niJ8nrXWb8L/Bz4sdHev7Fx7iaKo2cPpZz74i37vrZs?=
 =?us-ascii?Q?eR8gG/FBt6j1H0kShAka/O5kpm334180rB78/F/Iko5h1CCJ/SWEBIFnWAXu?=
 =?us-ascii?Q?1UqNEJiO0uvyWkYDgYxZ2BaqKYAVpatg5CV1Xfrb5NmHtO0fsSm6ny6s1BnQ?=
 =?us-ascii?Q?2EhT5v11sgyBqa/1bFKqRjPxk06aoznHHbSmEA0CftdSq+eiiDtTvnGLzXrc?=
 =?us-ascii?Q?o7qF6r32xob46kIQS/7XARcyJoFsEX70B64H1mgwnYN7NCb8o/JoIBtLruDq?=
 =?us-ascii?Q?pj3RzqQtu1B2qs2M54hxaTfFA4Vc8aJHka9s2n3Z8DKy1z/jLnrUaZGeBA9P?=
 =?us-ascii?Q?brAsnVfX81xaw60u3vkj4tW94HuzjJ94dYpgHC2oFoApG9c+x8muETRcXUS2?=
 =?us-ascii?Q?I482x3O2iExUrFQ58/VWVYqx9cbxM+CLJpTE/eS92EFgs0cic93TW6AIPuOF?=
 =?us-ascii?Q?NxMjbLAEc8/zzlCYcCJ3ztcM+BpiJZk29IJSyOhmSsu4KYdI6drw6H7NBaGE?=
 =?us-ascii?Q?2KAgasRQyTKpZ8Yw6eT7QMHg1tfsXH21sLELx8vmvQtvj8AWRg3ojT3AvTAq?=
 =?us-ascii?Q?Ii7ZWXzQKnEXOPVPm3kbunjldNcvKpSoHJMa+V1yQ2O90LOvxnmJGZ8ogqgl?=
 =?us-ascii?Q?lPXeIYbFgqpXIgPxvbrFbsjzJRMaky/UEKWwlyd0+p6cuNNHIr1OpkKtlmr6?=
 =?us-ascii?Q?63J8LW4FZMQOgkzCj6t50oTNLpKYUjvQKQIPSVgZnfgNW/x3TSs0UcjGvCJQ?=
 =?us-ascii?Q?UR0cdsN3OlInukZOq7i7yUO2964gVx1l13JVdEUQ+M4wNUeohzSBvrPcPfhi?=
 =?us-ascii?Q?99BfrLUt5Iv/Uvy83f6qkGTXCQZyG8sU+o9dlS5nehH9TtIut5gYH1nAUElm?=
 =?us-ascii?Q?Xt/cOFIaRDYRgcZcrNwmnavyrv1369ASwwS2kYcSkb9IwEMkPNqN9wGpV334?=
 =?us-ascii?Q?x+0tW8kOT3YW7ddzbMNYSJ0zw9c+4IMvg+450xZ7znzrvcasak+tZaIsDWVP?=
 =?us-ascii?Q?X+sXU0kW/dCrcuLTnc1NdUqFUHY9e/H6PuDP64DkMHj4NxwZDxHnIJcRH2rd?=
 =?us-ascii?Q?p4RPlzPa4Fv/eCPY7ZOU6YeoLV4W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SgqcfHRSU+3mz1yU9Jg1sPxjXxtv4ipEM1ALQy6FpaFqcW6uQ29HqBP+0e2A?=
 =?us-ascii?Q?5g9DRj/MlRzyai/QqkyA4hv72+5opRMtUNShtqGBikj3KX7SzVl0tiIPWnuj?=
 =?us-ascii?Q?7PqF+EVn0euI/UAo98vUcvg+IX5OVIWfllUsFh8X5xgZBrwolT/13Y7dA/so?=
 =?us-ascii?Q?haHpjcmIhCDc+KfGmmNKDJUrWgK8now0Thw2bx4kmtufakTj+GZtc3qY30nh?=
 =?us-ascii?Q?t1HmSP8kB66ZGRnDLumlUYP6ZlOe6pMc4yVAoBiNSESoBq8OgxqMrxNZvhou?=
 =?us-ascii?Q?MlTbdcLN39VeuEVFGm50OBFSLrTfY1e7k9WpHu5jwCdvgaTL5lDSkENcogTf?=
 =?us-ascii?Q?3tLejfqskXG68jFchSpT1SuIMzEA5N6Btd97hoj3+ATTDVxu/jq/Qge8gMMi?=
 =?us-ascii?Q?INOLhCJq5p42OF7tEJuBvas6MyF3icBg//x7cykXVVq/Y9/Sw+jT40d1RMLX?=
 =?us-ascii?Q?Qy8DWBmfWs9BFwGVoxdEEG+N8vsnJYDyrzxFjI2uNIhp4B2Q96g8lnskj7of?=
 =?us-ascii?Q?qqrno+xqs79wj2EVQOK3X0QtQeOhBNlp6bZh0D666+JhRrOE5M/Cqizq4GyE?=
 =?us-ascii?Q?6KzSS80C4nigPawOzujXVgYIcEcBsu94PqTVarRcWEWd+pB2yBP2eSc01z9K?=
 =?us-ascii?Q?7PxkTCZh+AOuCXNGVhDycTCHxGbENgy0mMYArJXozfjmCVJmZxL6zb6nfqPA?=
 =?us-ascii?Q?jD+uvV2xcJHB+SBmCs7VoNzf0K51JsEsISjTc3recG1jQ0nbiqb+yz1z+Fbq?=
 =?us-ascii?Q?BrQ6l3Hjg4PnuCovL06oXPmlrUZyUJ3BENI12g17psudcgxM7F778lp+A+JN?=
 =?us-ascii?Q?mHcwXCSofbICPiGEaFhfLZ8dTzPVCzBKUfLOD7R2sbGu4zE/PoNYicuhI8z9?=
 =?us-ascii?Q?8WNkcpmJz9G5doazv0JIKEt9gJD1jYJAAEn9avW/tI3TJO/9OemVe5xNUK/N?=
 =?us-ascii?Q?mX+WiQEE5q3D6m7y0zDTEoT741CoQlCiJdE/tqkUobrLkPyYmZM/9uk7r6vp?=
 =?us-ascii?Q?y6/cIeThfVWIKT38mYCABKbSQAwkD1cwhonTI5rAEP82dgujy3v7yJJ1Am6X?=
 =?us-ascii?Q?t2xdFFOfX/ApwO2cs7xYp5byqbYk4G8GGqJfkT+9KIAo84/9PwPEMUQrY4x+?=
 =?us-ascii?Q?/eJxrH+bBXYA/VBLSR4sfT9LgrUNVYt5dqk7JR+Tg8wfuH1KC6zOnigJB5bk?=
 =?us-ascii?Q?y+kCHwMFjnFVvHAXMekF1Q0MFeVTdF/RKPg3ob4nC8zJR05JucefZ6oc1pm8?=
 =?us-ascii?Q?mBghSitfcSYpgxG7kJ9eOchVPpaATRdreBQIiVjznWvRHf19rvHP6z4qRjq+?=
 =?us-ascii?Q?K8QnrFG/rKFZ6JYkbDDfePSVxnQiPpwVOJ+GBcEwrUp4Qma/UPIOtwym6UXT?=
 =?us-ascii?Q?cKBqs/7X+7dwu5lO0XS09sdlk9XC/C0teuSbM+0EHWf6BCeTbqDdhXCRUR04?=
 =?us-ascii?Q?EcXhE+lCkRTYK4lV+rDOIwuyuWd4QwpunBL9oubQSb12iMhQ3Vd1on9skKr2?=
 =?us-ascii?Q?YVxYQWMqUhFmqiLaqY/4TDo6nmKvtJfYATd/GuUxPZOQ8ACNn+XTijnhsxC8?=
 =?us-ascii?Q?a7XbDJ0ZTjWUWmlAYd9f+TkACpq7+1zWOcjyed/ogPnMjSjE+P4LqlS46ZTV?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0QnP+vQkr+EvyyVZ2yoa+xbeOZfdrO9U6J9EF3s4CEzJmM845pauL88dj8qk41mN0D3vfqpYfXqAvEeNYxqHV4YOHHi06Rput+AgLO4rhs/Hm8xyKrgSmrF0bVwlSPBjARHvUFvY4yCttFQCRjPBz7FXbkZt8JPwit7/z58pkDM6ATKR5aiqOl3sIX8nNRQRf3j4W5Cl0ZDx5IYPt8OGfuRHRvuBRydpbo1k0hctJGK1y7uLUuI4TusNDwF+dNjbSZpVO6BvybKyIK6Kp52KZHO0qYQ96PQmwMRUlSvqZNmIpI/GbHhAW79pMw3V3EW9kHdv7+uI9+/G/yduxQ+4hq3w8lbnUP2FPt6T/oVUdyCKoyTpKa+LjodoOF5wxDLyxtYmshUwk9LAwNjTCQyHaLSUeNgPGWGpKiv7TLyu82lfvkPgyGYpSsqGh5mNbKfyy93YWJQMI6Zt9csAq8KkfkJ5CnhEhlXdsugaxxaCZd/qYrtTtTRCEWK6ACRxQn5PmWSV7te2g+pYCv9dRgdFO/5Qj+5wREia7niNodesBGL/5qiyjVToCFoNAEQBuGFW3wWHx9/dF6E+ZvZblRHjWzrwLrqxRC/GaabXcVuBhFM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b23ad6b-24a7-4005-c3f7-08dd553429e7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 00:34:28.8306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oi+WpWAkxOb0Pf83s8J3gFByjIxsG+/757ffFP/jRgPQ9tu+t+jXADO0dQB1MAKRFtiE1I7tcRJBe0UruO8QZPKV5tktXmre74Dyv7A2BXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4561
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_11,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=318
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502250001
X-Proofpoint-ORIG-GUID: RVqTZCV5K1rU1veO3uKABBdTyXwn9dMG
X-Proofpoint-GUID: RVqTZCV5K1rU1veO3uKABBdTyXwn9dMG


> I have now fixed the problem on the next branch as well on the
> immutable rockchip branch. Martin, please pull again.

OK. I have updated my scsi-staging.

-- 
Martin K. Petersen	Oracle Linux Engineering

