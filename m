Return-Path: <linux-next+bounces-2936-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5920B92DE5B
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 04:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFC1EB20BE9
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 02:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082C7D512;
	Thu, 11 Jul 2024 02:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lozfYULV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LCo6KQ6U"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37293D28D;
	Thu, 11 Jul 2024 02:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720664822; cv=fail; b=qgtzzfeivqvXYmUIsjuESmRt66OotiBzUhdxHkkBdcOLUE5eSCJsxXuLmU24nD5lq7V2B4zBTOAXyNyM9WVbKv5GNKnC34p6i+COQfkyrUJs6KDVxxsAVXwPa0V1gCanCdwXJJjN3nzI7iUx6VeQTpoyuRdTLzEmiw3hVb6UAMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720664822; c=relaxed/simple;
	bh=CcKLdqhpnByHojSAok1jZsV9D++ARZE/pSwt9+pVE1w=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=HUC3gQWWtJ79fD+E63gKYb7EwtKLUEero1Eurj2VQoLIBcyCwjVgOBlzNX80/Y3OEfQPJ379hxExscW8ZJuki1XdBZEeOT6Fk2cv4/TPG4O2BanHz/M3/8LuvVHQn5GJOYAtPm7cl74VmEMyCJv1OO8w8qk2dohEvs13p/kB17M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lozfYULV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LCo6KQ6U; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B2PYtK017517;
	Thu, 11 Jul 2024 02:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=/dWzlXET3mmP8F
	tva2IEKe6Gmi6knjHdC/VMrNRe86U=; b=lozfYULVjvkdKGX8lhodwqfpXsm7Sf
	g2MHl2yzoYJq4eRz/Ol2iAe1Gb1WgI7x//CS/Zp4QehzeutxMjpfypKFpFiEkPMX
	a/ZW70VxzhIqpoO5Ry7Q2TuL6wAnCQUAm9YErf/NnDGIFY/6bNGC1sEVsbJCkaiJ
	oZDDvafMbS8XO5qhkyn4TU7CBZC03yOJcyqpDQYjfv5D4syirQBrj5poq31DaXSs
	IjBE6CIhpJkXrGefp37gk+nvvjBbHZZQdpsrP4X5DbYMW2WrglNicxCLkiu/9sVx
	u5DvrRLQXJFcOUl1BT5MKp/ZeVdT1ybssbtkIu9wD7E2Jkde3Olp0SYg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 406wybrp51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jul 2024 02:26:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46B20a1P030104;
	Thu, 11 Jul 2024 02:26:49 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 409vvan07p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jul 2024 02:26:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/AmFJ7TjivfqdUjXgaLxmiSi/J/sfQS6isMAZvCdrljBGCPoXXCz0IJy59IRcKmY1pmPApKaG/P13t3JojY+wtptTwYarL/mmblNxWWprGfjFYBoxUjBINBRm4z5j02Vi7EXwTUh3Q9lecjfHZlHeOinStdOQbaqLc0q8rLeDs5TLSyr8nLEw6NnZx2CxIqbxVrVslX9Zlc7UAqSEEmQmMibcOtGvsAIHP6U08aNGeF/ULOhU5WnnhQaTPct2928YtR2QI5dMK5zdm4eUSrPoT1SaeCOvqWRrs7JnAxQjsrjWd6ej2Epult1T4S/nLvDaYHmE/8k0Ioln0MpUfH3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dWzlXET3mmP8Ftva2IEKe6Gmi6knjHdC/VMrNRe86U=;
 b=cSAbsQnvhxH624NGAmNYDaWKHxOxfdxL9NeXqFFdTzFifOVEicetO9sunS7BlrmvmFVW95ai3sQ+i8IB3Y2bVD8zYMRDD5TjfCFdXEwKDTeQKmzJKmtiDRWIZiJ9Df+iL4GkfoBlp0i9rfVDnw2MBYlv1HC2IVlyX2Ec5TIJJbOFHPb+DH8QbfkDJazGnpnOEmVI4njyqCqiG8ZLcvXRcQQouVCMfqd8RT875naXFVJ9z0hM5TQWbNUU4a+Cy2sXKHwRCvhfT1JZm3CbhNczJAuvDGHzTu5wOI05uXLHLcgxbep8X1D5H+I+Ry8qFyb10S39H1Rn89bYyIDosOXaNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dWzlXET3mmP8Ftva2IEKe6Gmi6knjHdC/VMrNRe86U=;
 b=LCo6KQ6U63XyxizLxrHKB4A7z89qpYoZmhsw4asCUbCh9d8ltGmmhyDTKmollRsjv2/Ln/Ff3PopLVrjXBNuKS6r27SpOekX7hKxvHeLmo92tEN1GVyH5a+RiMaPq7gtA73ys48VdQWwsD7DJBxdvxYH4tEUdTTH6WLW2gVrrS8=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by IA1PR10MB7311.namprd10.prod.outlook.com (2603:10b6:208:3fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 02:26:46 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 02:26:46 +0000
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
 <linux-next@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>, Tomas Henzl <thenzl@redhat.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with Linus' tree
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240709165708.3f8e3498@canb.auug.org.au> (Stephen Rothwell's
	message of "Tue, 9 Jul 2024 16:57:08 +1000")
Organization: Oracle Corporation
Message-ID: <yq1sewgoeb8.fsf@ca-mkp.ca.oracle.com>
References: <20240709165708.3f8e3498@canb.auug.org.au>
Date: Wed, 10 Jul 2024 22:26:44 -0400
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:208:236::29) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|IA1PR10MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: b37d39ef-b6ac-46d5-1d68-08dca150e973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lePhLOjbOvoeSRmEvgBp0ndbV/k8EA1mWtELFiG5U2uef4enN+3YESKMQO1L?=
 =?us-ascii?Q?QvD9dPN+qGZupyLJnxCCAxlhmq0YEhivOEi0NTBtx/muuVwTfW89ZUdLInz2?=
 =?us-ascii?Q?HklT2px2nNKvk8yB32fsUHzePBgD2oFNZ6FNiTZYJI0z50KPSfjoicz9UBUj?=
 =?us-ascii?Q?eMyN0buhghsmGl8YN5VUfhCrz3ez1gDyebFf/tY+Cqkg14SfDdVokTJAMuo+?=
 =?us-ascii?Q?UKZGePYuNUh+JqWYpdcGXivYzBpF8bHGD1yz9m0EkAWMBiQaQSg1ZbG6N+7t?=
 =?us-ascii?Q?jgDdrrm9rx1wFYnuT7REG1Vqm6qGSzcdA1qF7UxiDRXkLy3yxy3ZSJxbS+bc?=
 =?us-ascii?Q?1cznDVjEDTk/t7baGG/shtIvzlQJ/QnxkRtezw6sRZa6DBt8HdgEMwwWPT+d?=
 =?us-ascii?Q?RaxpUrRLEm+B6q9DL8T1PGT+kTS+4dSB/7dyBqtzAKhsoHlp9U1S2HYzqFFj?=
 =?us-ascii?Q?u5nx91zRiFuiN8MdMHTqlF7QQ+vi17pLJFB2i49F9L1V+BBuuvHHPEd7tKHL?=
 =?us-ascii?Q?5+0YcRCfs7/ta5x3q99mwXSGJZTkAGlOVDrGoRY7lYBWgpyiviaKOBROYGca?=
 =?us-ascii?Q?pFrKO8eOLvdXDPzJO2OgEIPNiwFepWLHQVbw359LFyQWBfDxoTBBQRMbBiEN?=
 =?us-ascii?Q?S4Y8MZ92yLn4uoPzfA9y2wBh4Hy2aZJSoY6Cq/nHs0b0u2fKmofJvbQKKZrs?=
 =?us-ascii?Q?eI2BQruhCrASn2vaDiFD+AFomVUtXj0r4jwC8Zh7ZoCqgVWqKtVmnRRYXTKV?=
 =?us-ascii?Q?HgO2kJP3hCmcyDzDA2aW731p14HSJDXQ6qfZZUCGuDIqlTrYOglUFR79bt+h?=
 =?us-ascii?Q?kXLN4YS6tE67fkjEIiFQzX7urYeL+9/nxfj2iN8vHXtgl2WvQ55tbYcvKfCg?=
 =?us-ascii?Q?32X0L2C3Tl8DCqTIGteyFLj2Bo1Wq0QYFffdgI36Dy1c1CAAKO4ZzmoMhjxP?=
 =?us-ascii?Q?jEl0jAxvsFFdIkP+VK6ewvXKzfI8xcM6AtDVGUjK8BjieAgg9d2PLCYvItni?=
 =?us-ascii?Q?fJNhj5/pQf0F0LR24VEI3/q7CFiZJpHtDeZUmEeApPRDaNfEtzCJ0q7E7vDQ?=
 =?us-ascii?Q?CzLVg3cGusqQQDGRmhK1JhE+LJAYDxUw/Grt97nsuSEyeCncSElnD5iqpaSl?=
 =?us-ascii?Q?bAwlZGNbsb/xyqCpFmc8wMWNPXLzxDE83cCddzgfLUnoL9UfFZsZt/XbP1cC?=
 =?us-ascii?Q?NNJtVxh+N4XHjgISBEDWL3LUqart+XxakcWIob2dZb34i2TddgJHATofizwI?=
 =?us-ascii?Q?UKW21y5pQ3EYwFi/Xix17aZKy3t5S9/s3Q3GQT7yBBApNdJ6Qfgmqrn7zAXo?=
 =?us-ascii?Q?yNmcIFTyiw3xQMvpCK6Lj+ioNo9lQXjiGp4mGd0x1OPn/Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MybCuiwaeoyOxgOcr5b/W2dCw7kLyy5MV5SApGJxKAveqTvLarZvByAhHQTT?=
 =?us-ascii?Q?XjpuV6ezscmInzrQlCW5PXTKny70zYPPq1bZGYKInSWQHJ31v3DCIUNYB6GE?=
 =?us-ascii?Q?+oMaUWFVLBUqmsgAcCRtseBRbj8AdX/rPbKgk7jjMon12yWw+Y/NK4mEz21w?=
 =?us-ascii?Q?iKPKYsKwZ1XXqjRH4wIOlsY4ku/GrQtid9V6lLn2BigrYnXKGy/J1r3ZaGc9?=
 =?us-ascii?Q?H3WR7U7kSa0+/ArwfFOkeqWSmuxg8URlC+IYTIPGavLMmka29qRDYoJ2nXov?=
 =?us-ascii?Q?AwOoaQkHukGfwb7u7CvPM/37fUQI3t1M+vrcCrykgnHfH1bIJVMt93Ys4uXF?=
 =?us-ascii?Q?FJatmQayEJcovZZVy9Z9gs9KDyATF5U83K7CThdKt3BoZ7edObDZenxOFbqa?=
 =?us-ascii?Q?A61TQkxBVF8Qfb0OptjybT4zw/++HyjXolZhnyhteE7LBJKKG8LnVMl4n7PO?=
 =?us-ascii?Q?MM+iVOBVnzqCio9oepcRwslfGYTXI4VNsVHsjkCeIqVXPCkHA6jNLbTRSeFF?=
 =?us-ascii?Q?psstsuac1t+gFtbVf9IlmrlU2xW+iUOi6fyt85ubCSihz3zc41aG0iCYOfMl?=
 =?us-ascii?Q?CE2ojz293hIRojFWMcbRNVfAFa5uvU9pC245gdMQP2/po42pxOlbJKzhJsBq?=
 =?us-ascii?Q?1ugirg4Lh8rDH2LoCxNllSgFZyY9OOE9BjiAba21PljM4hoeTtV1EPtTwPm1?=
 =?us-ascii?Q?z0Zdk2KL6z1/5YhrxGNOVt42tqvlASUS4emV4Hat7Q+W38UMh7vwKWt+bAzt?=
 =?us-ascii?Q?GfRfLNPfZcI19i7jlGAAArdW1sZMdIeViI3POE/JMVyp6i0H46GmCrzazQmB?=
 =?us-ascii?Q?addqjeISQ+Quw9ZnpjKElmYoQIshBoJ8gabr0eB3G5paZz+WG6udsAeIia88?=
 =?us-ascii?Q?V1Y5MGE5n2lyy5T4QuatBX1LmiUkRVVTNM+5R/sIrpH9Gowwjk6cE2ZDy09y?=
 =?us-ascii?Q?MVXWjcEQvyOJMPbob+A8V8tXruE9HDg3jfeVC7J0y5R9f4PwhiKhs4XRJAoF?=
 =?us-ascii?Q?mtwhKX3QyWeJokPk3c4d6iIG/EJnss0B8ZDYu2S3vI9Y/eMp4wX2CZpLJXjV?=
 =?us-ascii?Q?152fMe9q8d+9mM7wJHtF3Dvy+C4odLdrEquqWSD8OCO6OBA3Tz7drgpZ/2xQ?=
 =?us-ascii?Q?RCdHMawH7AGQEocpv0aJaaneS15S8Lp/30cjCKo0dS+h9sZQYSXQlCqF6gNr?=
 =?us-ascii?Q?scZ14kshUP3cYxLl6+nWVRa/mSk9z2sE7eYQSVzu0RmedEz1uERNKf2sATpb?=
 =?us-ascii?Q?ZuJhKPzdowaRdYYmSGYdMVEjbadQpkQ56bnT4GPCCsw0Tqr/fPio63mIto/E?=
 =?us-ascii?Q?f2SPqG8x7o8TWcGrzNXb87GkdBtu1poB7KtV3elOejtTHdzWraKad/L0U5vM?=
 =?us-ascii?Q?La+ueRgZnBBn0lU4rPVhklx8VqFyMtlSpT2T87XUTN8TVpB1c96iYE1VRZPj?=
 =?us-ascii?Q?WinwheNRL6bLhM9V9mkONl+26ZFzMjyZucuIrLo7UGmd/Cz/r6DlSuxqmX6C?=
 =?us-ascii?Q?oHD1Zq6dyhnUYVN0u309+NXAf8Em4tl7vTwbYgLLVdC3pdkCgq4lZWE2V/VF?=
 =?us-ascii?Q?xA8uW8IulQrIUeL2UqAWL0olI8WCjuJv6+y8YELac7OoWJYhATjVOHoe2gT/?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	pjC+ZjW9Er67uKGJ4fO0flLq1WeWdeMPGirbgMPhpatasPUkPIN7Gbr2anpkxH9Un2bwIvHpFYx8NzPmBmbqGc5s68UPpq5FMWIz3GupZKDXfgSWVGMqiA1YnPnieui0Aw6TGdCyS7hP7bK5kcbYzkcoBXNlPla/rJCgmoVZ0PZXMIdXp/LEhzZPGbTh7kz9IJRKfQnLqTjCXr4eJvQop6V0eQoegsTLCJbzzzgsVi0U8aALYq+drsO2CZEx3YKnMaWFMkCcjrnfbhZAr9BbST8FtwCcpeu52Y3TBAqeWZ9UiyAQv8rhWirh6PYU7lRELB2rjbPrcgN5W1g5HJaTAqYHFOYiNRUNq2PdIvJfm57Ik2MjrQbbd2rnNtULuSzvTu8Hh+TrrPzjyj3cZWIPqc+a2ZWn7MWy1XCAtQzu9+dJMbYXjRGGass9vvBQDtCwJ7qbjGr0/nr44VyC92bUsjAtfQ8g8iXQ6ILc7yjJZfwKXzsQ/5kMdgIw9F6iENcUJUjlU1rFqCJhLcYVAX7ePo9jsZLaC5mlT2E7bSkDIpF7kBZZsfJrg3bneEiI/0nQaaQ8KrOVSPn8LwdVsZ749sddxJW1PZELdi1NXpa+orQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b37d39ef-b6ac-46d5-1d68-08dca150e973
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 02:26:46.7233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gP0vQCbRhjXjfvcfgFgXX5pOTWhkReMnJZmAu998JnmGVWeDFqPCK9ms8jJp+FAkqc2UiM8GdDYWj00eLqlv/HFNn1mN8G9tFs8tipPEQfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7311
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_20,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=963 mlxscore=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407110014
X-Proofpoint-GUID: OgzKzB3RvsbAhVgOeMMQEvtGZ-dWmZ2u
X-Proofpoint-ORIG-GUID: OgzKzB3RvsbAhVgOeMMQEvtGZ-dWmZ2u


Stephen,

> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>
>   drivers/scsi/mpi3mr/mpi3mr_transport.c

Now resolved. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

