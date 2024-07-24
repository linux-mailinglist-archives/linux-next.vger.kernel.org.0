Return-Path: <linux-next+bounces-3116-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2B093AC3F
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 07:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29E2C1C20A6A
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 05:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C7C27442;
	Wed, 24 Jul 2024 05:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L8KWL+2L";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tqNHCdxF"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65606A2D;
	Wed, 24 Jul 2024 05:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721799138; cv=fail; b=FDA6Uw7lW+R6TCF/kAXFjHbHmKUgPrSh3aHymuW6kYGaSswK3YpGH4KwYzO36aRXTBEZThC7EmJAURsUasu2+OVlGJPD7PzBH4JeVvPJLb4uJEN0EnTvJedu8zQKiJM/Z8eEQ6FvJmLji8ZZN4kMWbzf3i9AN6jiP8qGPbBQDpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721799138; c=relaxed/simple;
	bh=WAZ57pmj9UqGwZm9c3sQ6t1p0o5g8GycIFbxthcNszU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GyWA0VbqcEqa5jJkBEmqqUrn2Mcf7yP3cM57ELn5E0udB2cC20Hw+2Mkl0aHwydzaE5CvY5VrWuxLzHnAurcrZUO+4AZPxbvU7W5mDL25qUw95DSCaUsuS6MmYp/jFhluKq/t4iz1eV1rUdzAW15MfcJb+FT/HTXB9Aq3YAcjVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L8KWL+2L; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tqNHCdxF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46NMBXwM027601;
	Wed, 24 Jul 2024 05:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=OnU/ape7zRhzhO5
	O8icYTdIHmvfSI0B4DM54HPg5Lv4=; b=L8KWL+2LqG67qTJA34bfC+1FIUZnJg4
	sPgqwB+W7Hgb6D2h1ChZkRVeGnpiyw4hfyBHJmh30w+fvSGWxrzr8hKN1m0eqmCm
	BzKv9h9beDVI0Jv7TmsVlcwkkvqMahNs7nuPWg4xurxMsWfd9Z3jVXuOqMTrD8N6
	eJTjaH4gQtt/Yj+xswcGAYhotv6yi6xeCG9953EKhixrVyjyxMsBzzvPNbaYIWAU
	5IwMub9CFdu5HidWTQo4qLZRzIvXmrzfnbhCTM611WwKzazQpwhe5m927dDo8VHB
	kePgLFvklV1RS4cG44ClHict4mAOJXw8RCiaaxsOhqK2Xk9HrQxreAQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hghcqxre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Jul 2024 05:32:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46O47j1e040078;
	Wed, 24 Jul 2024 05:32:02 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h26nc6t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Jul 2024 05:32:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ap0Tq1ekCHfWyzL/h9T38z9qjQ/YmoyeFzhq8M++3eCb8Hlf3yMhwi8qKjND4WSjYvRc9/AGTfPiWUqzN0AE5NodL0Sjc1awUVToi8wiPwiHjZosUsjZYrFfXpc99muTbez4OAcN8d1//gjLxbMkghKiIgG3IU39UCvhVXllpSCcNJTWXcoPXWgv048celdr1mSo5ahxUGLXAO76MKJnJoNUdF+ldZ3RS1UzQaO6Gw9P0xv41+Z6FrAnzFYXf2Lj6DqAL4QBySbPs/0k7knu3BE6+ouUv7MqjFNFMB33dqFHpigJeBcKnfQjJket/iffTsb0g+OMLS2niM/O4+jseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnU/ape7zRhzhO5O8icYTdIHmvfSI0B4DM54HPg5Lv4=;
 b=kRYcNL+9HaxN8+TBxdK42NUe+fSB4Go19D9uAqOy9evnliTg0pGdYITp2dc5OmHSelXDfBwvfnqtJIsIY37hGEQcSpi6KvxBsr/JeQec38ymLy2azz2L2Lefgrk0NLiJRPNsHnN3tap9J44lJjLpDj606yQ1xizB1Z1Swq+73J4aLTIVIBAsRTSBQoViqZw/i8MZhS6mw1HBeQ1kB8YNd4jNhZrXGGIrw6Xzbxub24ScZyYTIOL/emBjPMYHTLkCnNJtzdjPv69G5S7nQH6C2kZWsNgBVlAy+hvTwZX7jFz3tM4AYOMBNDGNbGW1o5pdfnqfHQqq/GCmnXYoZYjDag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnU/ape7zRhzhO5O8icYTdIHmvfSI0B4DM54HPg5Lv4=;
 b=tqNHCdxFvuXqaKAT4TaJg/+1g3F9CfosDSUFF/jfPviqpG2PlmmMUGSZT2Ua261TEuoTpYe/wU+v0kpch3I4a82PYIKVZpO6QYA7cey96Ur0Oj5F6+LAbHQ6oGXAdA78ygDELjJA20fgnHuKTmTjUIg1m7ftAWe/AF85f6xiQeM=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by DS0PR10MB8054.namprd10.prod.outlook.com (2603:10b6:8:1f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 24 Jul
 2024 05:31:59 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%6]) with mapi id 15.20.7784.016; Wed, 24 Jul 2024
 05:31:59 +0000
Date: Wed, 24 Jul 2024 06:31:53 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <16389d71-4a1f-4049-8d81-5814d240c46d@lucifer.local>
References: <20240724084902.0843304d@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724084902.0843304d@canb.auug.org.au>
X-ClientProxiedBy: LO2P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::31) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|DS0PR10MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c537da5-c8c1-4d41-a810-08dcaba1f08c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?thLDXbM6ZtrVcj/6jtVfi6oL8+F5eZvfpdwixiQKKn5xIG+e7gtLiGVAhBj/?=
 =?us-ascii?Q?dGQPKaDJh2AZLFMhZtwdftwWYytyEs6GTLRkPZVlgOZaD4k99haVc030+5cB?=
 =?us-ascii?Q?YilCW6p8jA8qUvpnsxrX8LHUcNbTrPlExDOD9wns3dAuhLQdxZaHepwS7s/T?=
 =?us-ascii?Q?5B/lnTI8c8p+Cw/nRlJV9vPlBXvyGn0eut2YcBsQjlIJlpdRCiu1Hj9RR1+t?=
 =?us-ascii?Q?j2JmsTU+EApmtPn38oLphomWW7FSjZWbkp1G4U7yHtba7JrXaPv5cZbSClh4?=
 =?us-ascii?Q?wEMDvWXWaYgvxewf3MhkwkqNZN65/lxaLn7dh3DsWwjrNnf4hhZRQrRS1Dfc?=
 =?us-ascii?Q?w7epg49oPTCuXrmIrr8g45eH1sPsFACeggKg7k5CvkjGZKDB4fqIDGxa68kq?=
 =?us-ascii?Q?zC6jgoOQA8ko30IsDso1OButr1MlQ9R1YxSBtiAum7JDLJPUPfWeV6+htftr?=
 =?us-ascii?Q?rOEZJ7b9qbIBg8DPbuv87bYTdhqZ/6l/6akqJ9EeeXFEcHlUJRB74sb7++9X?=
 =?us-ascii?Q?bWi2rV8RhyMyOUXfysP+wITLL+NB9eBqR5zHo4ZxAM5nDlmxzBRjwUIMDHOG?=
 =?us-ascii?Q?M/yz55zIL38Mfk2syhZARkRr5SspboJV5Y5uhuuyjp1nT0ABF1GoShySFc2p?=
 =?us-ascii?Q?+drYjecY6kTJGvXGOslkwwB909Lkaxo1K1bAV9a02DxlZIvL9BTF7TXCf2Gp?=
 =?us-ascii?Q?o6yHcC1QNOCfBgLU/Bhv94MGOQntc5sEGQxd/NznqvwfBV+bKGC75gr9xrdG?=
 =?us-ascii?Q?tOaJo/38oTUs1xbzcrWlHxjMjSBKxKYBMkYY4E4ApyTFCMMA+px2BL2WSxyl?=
 =?us-ascii?Q?AoIMKB+lXRLknhgo6x3KUUWdKE1XIVbB1m8kylkw7FCX9SnI52bHZAdS70ny?=
 =?us-ascii?Q?hazEEvWtN92vxQ4qWLtio8z6P8vCE1CdsvIjsp6u/ZdGAncMTUDryw4Sq2GI?=
 =?us-ascii?Q?1VEWUNQ60iIs1/0/NIvgCsoSequqdwLdpKkXwRekDWqYIjaniYLMlIx8eMO/?=
 =?us-ascii?Q?eLyE7G5TWlAQv9aeqtk7TTy3HlgG9EYozYgg3Wg2aj0t+B869LAxaUD1sybW?=
 =?us-ascii?Q?Xkkbbtqi9OSpTWNLS4LzBhz/Ukdar97Z1aq75JDY+2UKVn5fNVJslr5Iw4FE?=
 =?us-ascii?Q?3HVUMLYQISWmYEDqHmssepo3p8sOxxivCPFEy9ezLITtH5dnHU7wlFMqm7QM?=
 =?us-ascii?Q?ahXLABZHuR51lSA7Bi+RUvGC2zD/YPiEcVzVO6kuKjLz0AmU0RaaH8N+KtRq?=
 =?us-ascii?Q?lBVGzs/ilyVY2ch00IZyypsabn4clmJI/bXyGgsJGz8kGA0J9LVoipb/nDtF?=
 =?us-ascii?Q?Oo+WFFJVfWj8KdN/W5vtQsVKXjeeji+qJIxqDWh/+EWWxg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fRcvgmKQsoSFcl1+M7QjD57p5nYM8EPviIV1AR0quaG4RxddlhbRkenr9O92?=
 =?us-ascii?Q?Bv7L9q/uPlgHreIcCjRAfi2jHEpr605iAV9D+o/z1L3tPYmdLjTWEb6t1K4g?=
 =?us-ascii?Q?7mpcT4RzmI4l1ELEtrFmYG1CEjjlQfxi32Y9wT0/SzvNTAG5cwWUHiYFpXaF?=
 =?us-ascii?Q?rNcTP41FSt4XniCNORU5cbobN9lE1uQ9cv7iDkIMHvGf7FVnhSSKDVed1LMG?=
 =?us-ascii?Q?NlPJzeHQrDa9uId9mOH5h3y1R9DAtri8hZzZmYHWm+F/NUrXy3SwQxVcrEvY?=
 =?us-ascii?Q?6OqMlxjpZ0yPgM8XaX+jZMrN2m/zE0y8M/GbcrklntOv/x2Wivf0Wkv/91uI?=
 =?us-ascii?Q?44sd517yKDQYuUGIxgvP8fg9jDDVIMAN7smjr2EEVQyrq/v0wBCzd/NWS6/z?=
 =?us-ascii?Q?DJ/KNyT8Kuoi28iE/m3Of5ZS1qzpV7+NINccT1TX9/G4Qo9ucBSqbw9qqLVL?=
 =?us-ascii?Q?f3QnK+lXAwDTKyNTeOuzBGgUPDB7nVuYHAeeNlHy8GzHnRqlcjUZ4b28tbZp?=
 =?us-ascii?Q?fko9du7qrZ4ffcYsDKlKNze/Pw8DE7sSYBZKKWt8dIrohHr352OWnjGKLyOK?=
 =?us-ascii?Q?ElPG3IABzPu3fLLF5Gu3G9q+cSF49zHgptMAkCosJjtPwtB7xFG3Le6YpPd+?=
 =?us-ascii?Q?Gcv9dhEbNVLKkf1pzVh89yx4kM41/6JN+7H28/OeOvDPyCulS8d1Dpv/spm1?=
 =?us-ascii?Q?1IWRTv0xz3w5Rko7ho436P3fP7Avwyl01AKKPDlg7Jeeb91zQGDSARQlumCU?=
 =?us-ascii?Q?MjJj8V4W4jFu+nUty62eqonn4Tn15zrSsTUd5Mmw4f4IfoZyciXlWQa33R4Q?=
 =?us-ascii?Q?jAfLHylgWqKQeZ5SD1mZImQYBV7E8X4BQqKBWcKNOSQhIMpapS23nu9SBrjS?=
 =?us-ascii?Q?qQvroVvBhHbZdmuDruqFi88km6zwgXgLcy/tFrslMSDq2iliMMSVotKd2wQK?=
 =?us-ascii?Q?nQboFC6fQQCT/V3eemI2dqdRih8HXptK22I3XDGcFGVLEfX6+SbS0CndvRVX?=
 =?us-ascii?Q?D6ZNpLZ2ztplXVkvnxxR3D5M/7ioRT+5qrCcL54kH+zKw2nU6nrYUxJooVj3?=
 =?us-ascii?Q?S22JnzvYg5OGYOuj8FqWCCNu8UWDsXTQUxcVW2naHPpIBQAueENQ9NaJAIdp?=
 =?us-ascii?Q?GuYusRy5kBSK7USZW+UCxMlUARR/3E/9cnvzr2AQaTxE84oS4OOOJEI6I/mh?=
 =?us-ascii?Q?Zwpkdv1zChcHcjTojtQT28nPcsx0FN6gd9ZPI2X7AohlLVY7JxoABs35b44D?=
 =?us-ascii?Q?8pHrM8BTdQgntDtOY7PjYYDUn101m/hIwa1ELwuqDXxD9683/nzwLmGj3+Mq?=
 =?us-ascii?Q?uZceBbv9zCtMgbd0QQBpX+eEBwShAfoO6NQ2WOelzxbeS15QSHQ3UikGq24f?=
 =?us-ascii?Q?h/r1xsRI1Eq0ggQCBdeyYwha9TGAE5ZOGjrweuchzKBUbjkYOackS3xtjLed?=
 =?us-ascii?Q?2W9alfoJwz79s1ywUS7tiboMU9kukT3XGPVg26go2PqG8Axhf94jTLvoQGC7?=
 =?us-ascii?Q?Zrnkt3wMvyzD7pyY+/OBazA5evYMeOm+y8ScJNoj+TBszC0vWaziB/Q481Oy?=
 =?us-ascii?Q?fkCo2zAVWOLxq58pPhEvwgmMxtLbI0hOG14Xu/JLRvAigPRd/zSRYwHDOdzk?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7ALkIPf1sM1ficyfj6SeT2JXDNKBmkzhV4fboyl4d5fn2Bn3CBaxEH5PzcCS5VQklH/dQ3l8J+acvekBUbB5joEuV7Y1W1W9FVS76SXuKLE91ZCo/tbYHclk3p+w5hKz/uxj9gPQ5pmyO+FgQX/803kpPStZZMAtB4SE4faSoa/lRjwyglY4oFeNkgLn1TRCvqjLCFuuTknO+5whjWvXtSqo7b+4ZdTG45/1rE3bKcmwMHZul6rQ+V0U/Ow+XBmKsGWNb1KTnLRhD8ba8U8Nv3fnB0lrCjtBnuWU0vhB07tBTym71y2k5TcYmWITR0CRroTCQYjilP0T/6QKF9KjhEXHFeR8LlCNuerN5ICFTAXD2KHDE2+lysh8D2aQhbS4KV8CEO6xQUBCkqoHNnAorhmw7iuf0dEGXCWgRrxQLdlC8km2Sn6UPTKL+EBrfed+GDZ4FhODOCRfZTbBD907IYtHAFPRJ+Nr9oGYneZclCvbqn4BQQcqI+VoexSrKuUQlimzIT1BYmwbQ/eh+hLkOZzEA8YXSsn5bAkaSVAJZqadmz1ixANq/AxE/DABTaM9RZSHuzcRz2JN0mVUil2dmhQionuSt9KBjEt+RHks9kM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c537da5-c8c1-4d41-a810-08dcaba1f08c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 05:31:59.4618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbBHEOI8PItJYlkykw0ISMEj18pLQSgamdOJEQ6ExIPNSGf/JsgsJ+f1F5Ng1wbL4mwMKCgiZDhPIv9rC8NcT66hzMqUNuXyOk2ClY5rg80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8054
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_03,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=875 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407240039
X-Proofpoint-GUID: nOEf55606u6AYIKcDY-Vodtg4dUOiBh3
X-Proofpoint-ORIG-GUID: nOEf55606u6AYIKcDY-Vodtg4dUOiBh3

On Wed, Jul 24, 2024 at 08:49:02AM GMT, Stephen Rothwell wrote:
> Hi all,
>
> After merging the mm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> In file included from mm/vma.c:7:
> mm/vma_internal.h:46:10: fatal error: asm/page_types.h: No such file or directory
>    46 | #include <asm/page_types.h>
>       |          ^~~~~~~~~~~~~~~~~~
>

This was already fixed with a simple fix-patch that already landed in
mm-unstable. It seems unfortunate timing means that you didn't pull it.

> Caused by commit
>
>   b102945dd5b2 ("mm: move internal core VMA manipulation functions to own file")
>
> from the mm-unstable branch of the mm tree.
>
> asm/page_types.h only exists for x86 ...
>
> I have dropped the mm tree until the end of the merge window.
>

This seems a bit drastic. It's literally caused by 2 unncessary header includes
which are already fixed.

We really want to get some time in -next for this ideally.

> --
> Cheers,
> Stephen Rothwell

