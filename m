Return-Path: <linux-next+bounces-4690-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC629C1009
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 21:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B2DF1C20C83
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 20:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D53217324;
	Thu,  7 Nov 2024 20:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Zc2Kd8HQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qH3B5AoW"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C8A322E;
	Thu,  7 Nov 2024 20:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731012479; cv=fail; b=Q5L2qj9oqQ4t94Wg8uXiiY5gc6zPDx07wkNEluer6pivxVq3f272Ee6VUSdCdFPMNt+FOWVFyPsm5iaSgjG8ygSbWDdRhcSVD990zWkEmKHk1wvnnd0OBWsvjrK2yWKBM+8JLX2HAwBAj8oS1n6GZFg/NNT1fQLemHfgh39O8QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731012479; c=relaxed/simple;
	bh=809kUNFeYfaABUgK5sXBgvJF697DepAyLosDfSj7go8=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=l2wRYoId/4JMVMlgq+FQxWW534LGDxnrsLHy/HntJXrQPtdG5YFMZprotPoBQJ4938EJIWTQGNlDaPVALepCb6PB/AhOLWkelzbNuliinKcLJWqpZSCXlLx8e15zrPbgyThTzg4WW7MGeLi0maOO0e79u9u6zV7OlkmkEA405g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Zc2Kd8HQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qH3B5AoW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7Kfa81021458;
	Thu, 7 Nov 2024 20:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=E/Gfs4Z7VMBOWqdxOY
	qQHSOKDCDEGBeySX6IhSu42vk=; b=Zc2Kd8HQ6pxfebMZ+NpBgkSVRAhwOhmpCA
	gWieye8FpZA+2BHaUT3c2amTFL+Uof7B6GwKmHnU2wFub8A7sfAwQc2RsJRUBMM3
	aStDLnzNrwnOgH843ZOk+F3e0/35yKVUZBJzTN51Nq9sa6Cbf3VH8y76GU4oZf/w
	zYT4+iYyY7mX+76RqZ/X5IsaGB+m2LTC1cCg7xQb9zLx0khoxrjRmEFtYo84Hlai
	yFNwYPAUiZsgKfOY1TWrzdb3XMxzp8jviZskni5riBKdKgkEemxliLLk2RTqV0IG
	967RiUjD9yZddpGo95cFU1FsyER7cfCeHxSRT8DSrcqHap+JHd9A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nc4c3pns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Nov 2024 20:47:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7KF4QE035232;
	Thu, 7 Nov 2024 20:47:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahgwtq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Nov 2024 20:47:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YeHJllu95mOYydZMXVd5adb/yEDxMOm2Ga8pAuGJr5xRsroZ6TMGQjnUNjRSgwomIa+JnmxuQmm6ceHd2zbKaCbJuqmLLCaRMAIctCWIA+Li6a4JpyL0reB5Rvj9bE5Ku6lfpsO0Xu9BP83SyJUl4S/pVn4FYuJ66VSgiRxzo89S2u2gk6dFpekpKDNeb5GCQUWDxA9yZzlT/TPIuHtEo/n9UMjvcPGbXNOcbApxYUwxDlBQeOvqxlbsZawmv/oIES+22UjUiTLtazzwFbIz5w5ED+5e76D99uYX7opHPfUQhSxu+80AsfugCDYXnVMGm/YlgSVG/q3huolHq6yrZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/Gfs4Z7VMBOWqdxOYqQHSOKDCDEGBeySX6IhSu42vk=;
 b=mYJ8AJSZpzTTNsxJbaGDebXzX9Cb3o6/4dePccJUvuLbvig5PxOhBC1X5kCZWCot7OtRNn7PiOED18YwOjUoq48Go/kB4O+9OaZK5SV0AOdihOcVVaCPXs7jInKNKFBiaC44LRuWasrh/31moq199AQSziDaSrkpt6+mnazQOsn2AoXbA27u62832JmdQ9z3jH3xIWfLY6IkabVUbrPjd8119vjkVGVe4eMfJsx66Ft0Ny+IOReyy/xZAwuZp/39FpSeRy/gR8kkK7VJiHw74iZWf8wVlJ96eJ1QIfjUX55Wzr2ozKcT1KLts3tvGU7Koi0m0cWr61V2HZHMkVSTpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/Gfs4Z7VMBOWqdxOYqQHSOKDCDEGBeySX6IhSu42vk=;
 b=qH3B5AoW2PMIhkYqzBv7r5DUMUbYFOXNVqZfW1qoI1YEkD2sSS9SNdnnKQmaLuFzkQY202Xos5sk/bjoZ7sx5vAL87J9RhdxJAN02R0UUOgmMBhCpawtGihAIFqsJTRoURp035pdn426kAo/2pVMFIXdlwlxkTxrQDN2VQJBOw0=
Received: from SN6PR10MB2957.namprd10.prod.outlook.com (2603:10b6:805:cb::19)
 by DS0PR10MB6993.namprd10.prod.outlook.com (2603:10b6:8:153::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 20:47:44 +0000
Received: from SN6PR10MB2957.namprd10.prod.outlook.com
 ([fe80::72ff:b8f4:e34b:18c]) by SN6PR10MB2957.namprd10.prod.outlook.com
 ([fe80::72ff:b8f4:e34b:18c%5]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 20:47:44 +0000
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
        James Bottomley
 <James.Bottomley@HansenPartnership.com>,
        Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20241107212954.4da462cf@canb.auug.org.au> (Stephen Rothwell's
	message of "Thu, 7 Nov 2024 21:29:54 +1100")
Organization: Oracle Corporation
Message-ID: <yq1r07mye85.fsf@ca-mkp.ca.oracle.com>
References: <20241107212954.4da462cf@canb.auug.org.au>
Date: Thu, 07 Nov 2024 15:47:40 -0500
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::7) To SN6PR10MB2957.namprd10.prod.outlook.com
 (2603:10b6:805:cb::19)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2957:EE_|DS0PR10MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b10bb4-50de-4206-d42f-08dcff6d6d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SAsG5rJ5S/0yzcIUgforrGLUvvIMe1zqrYtqXcFlqjrx2RTcI7cIE6n8fziT?=
 =?us-ascii?Q?m72R48XdEmSf8ObG5aMevsngKMvxGR+x8klKm2cVhSUzF5KN2EDvvibQ+ESZ?=
 =?us-ascii?Q?laN8HNHXkL4ex3/KfzGOh7fhqfZnaQODq44jBpkj6x8jI9+z8kPrynNy7k3A?=
 =?us-ascii?Q?23quG/EjMKetq80t8d+r3R7wuzjPjKmly/VEvjxios2/0dGevDpOVjoichlV?=
 =?us-ascii?Q?Z0mg5TPfC4WYPKmZJ7L110TCwh9dt+D5K2t5rZQMUX1cie23WrVTECy/pvzS?=
 =?us-ascii?Q?S6eSTWqlenVZbAd0OyefwfAwNHe440faVXFSYa4Q7SWN8TbNlFy5eVs4I1Wb?=
 =?us-ascii?Q?fSSWgE86+lNPRZw3yRn45gV9M10pdH4EO7x2fleD0TTFbSQml+PSOem8hH76?=
 =?us-ascii?Q?dTdh1scUo/1L/QwmwD7fy6H1qJmnYf1xnyXZH7SnnoMlhM3dLQ8+r1RWrB47?=
 =?us-ascii?Q?xnx/7sIKDvKFzF4pmcSQetMbLuWiZV5JtS/Ig3GSkoAq12EpTbrnYyq9OwWI?=
 =?us-ascii?Q?X/2Z2T7HuG6LuBGi494bejg35pF7P+NKhSyWWcdhUwMOryxd5DW7Tf8bkfWz?=
 =?us-ascii?Q?ICvVMfz4xe6iqbY0wfGXBPU6djzE0m43VXPtZ3Jcm+rPPc0GjIRWbTqSxT5e?=
 =?us-ascii?Q?DpkRYR8nT3eSth3HS2xryl9e2oLjiRmQdV7dBGWrxLg/6dVyUhJyincNwo5z?=
 =?us-ascii?Q?g6z2fvIKGZOCHcW16Ci3fiyKvE27yKsaoO0W+ulT+MwAa8oZNbCinC2PSG+b?=
 =?us-ascii?Q?dnc3p15+rxihCUDG90PsHITtaWL+V4NJy8wf1f6bR/o21Wn+ryvV5KdiatKt?=
 =?us-ascii?Q?Iw+42/NMixPFzglMahXT6fVzcQOWL4E29RJOEQ6ht5o9JbnqI1nZrrsIKMzw?=
 =?us-ascii?Q?fXgzUc+sAO3px5+pP35e70Q0hoPZdHyifnVUohtxQ5ARXeNyIXu6g4GRzGCe?=
 =?us-ascii?Q?RkRbKZTKJ7qxhtPl4FMDqBi6rsIhf++drvn6X+jAbq2HYvFnNv+7PgVdcdLp?=
 =?us-ascii?Q?ipmFhfvy4iDkGvcfvtZRbEmqT8+qj7BNSjrOgGq97FCdpD7GpAnlMljrIP+M?=
 =?us-ascii?Q?JgfgFvqCjeAIfk5nmQ8TuEFCLhWYIUMmmAusQiKxI5D6TeawrJ3Ejt1syKoE?=
 =?us-ascii?Q?YtbZ0L0o+L4PXcgypIOjnDcrum6B0ny96bSqy6AEeRPy1gqR8oOqEfjhTClX?=
 =?us-ascii?Q?sc0iFYrUYSJkdZ4Oxm2wNepjMMwfEBMI6CX93RMusgTWIlAuC7sMMCLGi9jn?=
 =?us-ascii?Q?Fky6iHGCyNmT5ZZiCxK5TxSmvuxPITlf0ea52N+dxiJz2p/m6sYRmE8JY/Rz?=
 =?us-ascii?Q?8Es=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB2957.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AOQ84/r+bHLzEyn2mluu5JJ4Cy0MWB3qUzNre4Jz8Vs0XA8I4tU6JoJ3IdhH?=
 =?us-ascii?Q?s8KnoAay/xL+Kr8LG4mF3bKGWhW4wNkMhgN62vgvG4b7+b0AA61dG4w8XXTR?=
 =?us-ascii?Q?pCOEMavYSL7mXg9lXdlc04ckdWB0K9QQvv9va1JL6WE4w/+lbz95XjdhfVQE?=
 =?us-ascii?Q?szA0cfYALduF4MPdZNc0tKiZQJ6bxUmZ5oQTrk59fs5Le8TITz1s5FdCpuI2?=
 =?us-ascii?Q?gZNWQNrX/MHsu0mYU8rAGeoQr9+qrnpuw1yHulWwrMAoUVdKCPi3/Bt5lpIt?=
 =?us-ascii?Q?pAVqJxXVTBb/KcfblKzF2Z6XTND/Rbr08i3Rlrlpbi4sTXTAXGAc/L7uVXJn?=
 =?us-ascii?Q?wa9cjv7dwGdukl+SPDvhW7AhE8wK0t7FrQ0hW8+Jd+laMR97F5w7emTDu9fi?=
 =?us-ascii?Q?vTqUztBgdOGt1RyA955DodpIsP1c9LRr3bzqKD3cShCtOTAm4DbVDjD82Gbs?=
 =?us-ascii?Q?3HuhkFsbTRUvJip5d5j9OEnoRLX2aODhRPhJigZKC0uhFPVV6gbyKzr3I70n?=
 =?us-ascii?Q?zyVA+6Jke92cm0/W6YXfEK/U7DCtKBPj2KKYldWBtO8vnwZsLQMWpigCapa9?=
 =?us-ascii?Q?qw9pYO9SWiyXvxeObGz4h3YQ0AIJheFFntBn8cjSBrUDmCqJGVzgDHJOoe+e?=
 =?us-ascii?Q?p216P3L2I+bxRwB635ApNURdRhYU4pena4PvZVRPO5+F6L3AgQickNOB2a2X?=
 =?us-ascii?Q?cBDGv0DnANor1zgXRlTq28jQnVfdlGKcBzLOuva0QrFMmVULFvI/1W3/iXhq?=
 =?us-ascii?Q?ge+QBZ3CbHiqW8dVOaAsx/v6XbOL0cC/SoTZoTm+XjC8JXjO/dYjQhPtPhCC?=
 =?us-ascii?Q?NMJ+pZqDv7+VbOrwAZfOVXzCHbOwrMYkQVvxOsk/qd/N7S1bpAsqEHwsQ7Kt?=
 =?us-ascii?Q?EHj5DDbcmnPaf9GZtf867bGIQq7J3AeA2XQSBqy5poEvCs5CBVWEpR2BSqfT?=
 =?us-ascii?Q?vFLlE7mHYvW5UPL7aOPKAReyfy/YjlM7o+zzXm4RSTVMU1wWbZ+ZJsXbpHZa?=
 =?us-ascii?Q?pCYaFN3FOgzDtXJ3H0WMgzqzNm78nhHER0o8tR0Qx5/iwA77oDbS+ebquOy5?=
 =?us-ascii?Q?NAThHEDgI44SpbK9/sVA8ROC0J95gIJbThgsgyNehcoUJHuh0CSaienf/4a5?=
 =?us-ascii?Q?SZKdNCNI2iiX7iLXWtlbn4W0LIfAgEHv5ZT8z2lwYLbVk1TxFqm6/+LNVd+Z?=
 =?us-ascii?Q?81aeLYT/1eiIkSIsfHjiPM+AkFyR1VUQu/NoWj9Az9/MKvJvjejJu7j5NV9m?=
 =?us-ascii?Q?itdxHjRV6BuEkUYF05CA1O75sXAfBZiaQGN67JXVm7AWUgPbqPQlcYOZLMss?=
 =?us-ascii?Q?4adTWYk6AdcXTfKZh0M22Q6BqluzQFpGazcSOnTbyHY699KUKAmgcS/jBiOD?=
 =?us-ascii?Q?UYtiGYBeRhMfIQpLvKOQfLDomKO19hJoo9hzKax7K0yKS/uEQjEajCBsG0J2?=
 =?us-ascii?Q?DOItNQz9iqR7SMn/lS2dpq1GENmHSK6ltIBLxCPGCWBgIni7X8RCegBycAWV?=
 =?us-ascii?Q?Nxsg1oXlCzpvCs9UlTJJZ8Gh2+o6lR6jUB87nnhT2uFOtquk586CM5vBivdF?=
 =?us-ascii?Q?NUGJw3h2QOQYWXjJM1ZfOudtQpRvrOfn75thJfZJ2Z9bE0yQfUlAUqoiKRaM?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O9xkHXVrhS59MEVGn+AWXNwX9vNs8uwJv3D7Tcus+BfRQkpQm3Q5ngNIT3LRRAa+UUQoR625r5eCGegpBtHZp2p7k3ud0afza277WOF4GJqN46VNPzOmyDoLDsU+18lIlRnJnwnUNX/4BwIwBMc6MohYuugYmvgT5rNgm2y+XiioUUEppfFYaDybsUe4u9TlU9S6qBWEQlV6We6HBw+iqOPoCeHKv+ugaHfnVhZtjH69P/CKwSkQxcu4D3Wi1M4u5/5FGj43xKMHI8xnbtz18VH/RCtJ2eCdp+9+L/DuYsUgZ+u3dcPV606N3uO7CEqLtfbubkGpXt+FFmwEnjNXcxqOnPsxZTEWcKGBUn4o0iWk5iQnY23VU0nZqs5YTS6QMwrGfR6hQQFRqpaxD0ZeKBS7mBZaIMWF0C5o/365U6z1K0RuQGfw1HPX6IoDUTTa2JPoT0fMRdJU6YklInCTimDnnvYRqEhGOU2U7voUCd12HOj9MV0ilN/3BS+AiXWxBwnP96yTf7vXvGtNsbkN8Dmx38ErLvaOq24JGpJ8zxovx3O85VLqxsaIz6hr8HEnqo+rneGJlpkx686hZU1hp1nnastUDDDbkuiUWZVyB38=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b10bb4-50de-4206-d42f-08dcff6d6d3b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2957.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 20:47:43.9956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xk6tSOgjdBzevhbzIOg/IGKA6JyQgKehGgF5f9rKs3W/ZBRNhV+ic0pSVPX+PkM+S8goMauSxYuN/WlvnLjxpRp20tP1q3uEYadMFzYNxSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6993
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-07_09,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxlogscore=902 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411070162
X-Proofpoint-ORIG-GUID: CIVJrxaLQ1CsA7e61iruv-D7Ixn2Ae3V
X-Proofpoint-GUID: CIVJrxaLQ1CsA7e61iruv-D7Ixn2Ae3V


Hi Stephen!

> After merging the scsi-mkp tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/ufs/core/ufs-mcq.c: In function 'ufshcd_mcq_sq_cleanup':
> drivers/ufs/core/ufs-mcq.c:580:9: error: 'rtc' undeclared (first use in this function)
>   580 |         rtc = FIELD_GET(SQ_ICU_ERR_CODE_MASK, readl(reg));
>       |         ^~~
> drivers/ufs/core/ufs-mcq.c:580:9: note: each undeclared identifier is reported only once for each function it appears in

Hrm, I believe I already addressed this conflict in the SCSI tree.

Maybe James' repo has stale bits?

-- 
Martin K. Petersen	Oracle Linux Engineering

