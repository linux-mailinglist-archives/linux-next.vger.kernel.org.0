Return-Path: <linux-next+bounces-7174-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A23BADFCE5
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 07:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61DDF18923B5
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 05:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF5324167E;
	Thu, 19 Jun 2025 05:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rxrt5A8P";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jb6BvMj1"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368434A06;
	Thu, 19 Jun 2025 05:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750310620; cv=fail; b=TAaodujm0jrEVVp+moGhOy7YzCLFdgApJU6sg+ygkJx8JNCq/sBO3G7AaTaO4/VRG8jxAW9PWnPAPmdXes9uFWP9ivqN0dvP478/sEjqPrTJf1tDyTyPB/26OTBf2lMeY8tQ7nolL3Ohizgsdb9aD3ZZSGRZ7HB+WRmZMPDrtWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750310620; c=relaxed/simple;
	bh=1DcLoAVMGSCv9X1syoq543U/7WQfcLFP5iFgkMrkgTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fv362HvLTUxmDLCPqxY4y1GZzIjZsG9ei+5izzr58qIvwC++xTW1CieCJlIn2t++/O4od4r3tqbhj/ASa/GTI2zWr/jFcNs0ox8CY+KmvunlaCVq7NEtBWIioXwHsgtVE/a4BVJIjHGfqJABSFTQzlHHr1LgCkRdiXMvXX5ywkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rxrt5A8P; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jb6BvMj1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J0fe7u020055;
	Thu, 19 Jun 2025 05:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=2t0QbnxA7EwZe6gbDZ
	zbaQXzfjnB7ni2wc4OjKLG4e4=; b=rxrt5A8PTck8OtWnqt6AO+zvsJIPCnK0xb
	Mr2FNf+wOa3hG4M0bSDSQraaB33tZEwukqmrUKoea8XcsvANp6AO+TuQb0xxY+dM
	TInwqPR/oNoGR0V3RARLEvURmwDYUOe8yJrn7rgNevn8fsd6M35dy/AvH2tE4myA
	nVeZx5103TBvqhtM7h0k/dIXUdyRzqKF95nOaunPop2e/zHs75Ol2D/O5HGRe/Xa
	c1nanxSwqjnaBQntzLLL3Wlv4GxWHvhP1OjO3YPtGCZIXPCeknAdMwSPNrjMAiai
	6RffumYv2MmHBnYh1bTQDO2/zEkwrus8+xyVIBM8Mxed9JjrrKsA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv595fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 05:23:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55J34jsL036271;
	Thu, 19 Jun 2025 05:23:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj0bw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 05:23:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBYbVSxxVstlGbXJMB+taOFyu+xCIDovgx9PXtlBOo532w0pfft8N0QTTqEF4CjxUmdcvz7mpCfBThtDhuJHWXP3+rSOWdMw9bIBjyWKzzmvV7wcv5SESNLfQu3fd7DrLJTVkr7yDJG4rZJ2ktzuhYcSsLCcnl50d6+A+4nd2iKkDFddpoJYriKGETUaKCs24WV2utp1IEml3rtNo6eF1i8d/lpgxfYyQpQ5VBIoxqk5362RV/KWpBO1HNjUKJpZPe2wNEyb3S8xGbBKvZ6hkjW59ATonqzEwxmnrhH2Jfh35M/5lvNSEa/t4KlYt2NKj18gKGiUuz2MJxH85iS0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2t0QbnxA7EwZe6gbDZzbaQXzfjnB7ni2wc4OjKLG4e4=;
 b=jWk2FI2yA4WBfwdI0f/mt+h49P2qnO/MkucappVZWDrnYPjuaaCoHutlafx8kt7190nemT6iWL2TIiWP891DyERZ+PQLZjlxMyX8QX9FdtvCeAhrQDPjbckrbtm6OWd4Ra3eUTlNsGRDNQNbjbSBxQ7i+xFWEY62SWqKnJ7A0lSyx/LwfZL8uBqa4UCSzVPnsWMkILF7x5pi6OqZlUinrszU4diAIxHJuXJ2b/9S9W93D7ZeSLGtLozf4FnBj9YvDJKKGGBY/XSY4MvK/Xg+5dC3yQdYCmObcb97KZlFdp2LOTJgGjUMoxgHlPrZdQDNtqerLoigps0Y3tJM3+GF8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2t0QbnxA7EwZe6gbDZzbaQXzfjnB7ni2wc4OjKLG4e4=;
 b=jb6BvMj1EOgC4pEqyDDmuwLhwvI8u8BI82bA2awyhdIIq+ebqmvzMxGpwuGRcRBqPnc70O+18DZeub2vd5wGuvWgiI0CjCku+fy/UlBjCxfDv/6r7McumwR0UCdW23zv3KK8VkySr9KVTpuU0or+ofx2jlZ3HAnxRJXHkw5Uuho=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BL3PR10MB6236.namprd10.prod.outlook.com (2603:10b6:208:38f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 05:22:56 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 05:22:55 +0000
Date: Thu, 19 Jun 2025 06:22:51 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <0e6e82de-497f-47e0-a0f3-b8d52b3c3d28@lucifer.local>
References: <20250619094504.20612222@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619094504.20612222@canb.auug.org.au>
X-ClientProxiedBy: LO4P265CA0309.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BL3PR10MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 607dea08-33ed-4ad3-31c5-08ddaef158e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xwGVLve0Gw73Rqt4kpHgl3AF5s+Mh417by0IYgixhYGB6+VbLwy3NjPQOJKh?=
 =?us-ascii?Q?aWS9sKY28e2wBedVTZZQYr4Z/+WBupBJvnQuFBM7M/OiR/mHFQLGNF9CcJ/L?=
 =?us-ascii?Q?zU7dWCJHbtF7YRgTmjmIkLctfTdfwdWiEVfykieJIgKzEDUdIfw30yllpAw7?=
 =?us-ascii?Q?qmzSDaOwrSTpVY3QLUF6kVXjLyWYJsHJWi1ovBiUGopUo8EmKNB7HMmb+326?=
 =?us-ascii?Q?hH+D6/ViRSOgeFMxTfnKb7ZkeAbRIncjWv61boNrSYn1LBG0UZ+lr38N8x1M?=
 =?us-ascii?Q?rCROiSN3ctgOuLNbIHnBsHxNLE5IYI3BB0pczoawRz2A12i8lEzK6nmS25Dv?=
 =?us-ascii?Q?GHYBIxdtKqUNf9Gv4zhi4d7qirKi97svFzSmsR3P6TJwzVeenNZsx5V+Ixln?=
 =?us-ascii?Q?q5iDshff0EfVSSf+Nsvn1B9AH9uBVLPp4kVhX14TT1kd5/mshOGQyG8CGeoz?=
 =?us-ascii?Q?LLxlevAaE80ZA96st8RkMRYy+O0JzRdvf47EdwTLV46INZHPTWPdTSx0xli2?=
 =?us-ascii?Q?hWhub0NBlcWfxooYhGPRnKh5Jm1IEjVrm0jv+TjDveVLWYckYxLUjo9z5OQ/?=
 =?us-ascii?Q?bhi5RfDjlkfTSXJdvDQfawM9Zmqx/cT3o5+RZGklfE8/eZzjjfv3yboNjihu?=
 =?us-ascii?Q?v8zRtrGxulmDCFya8xjx7zhTUChdw5CbWQZRRSj1RKMtwQq+DarNQnLMUJkQ?=
 =?us-ascii?Q?rYdBnCkehGhHB1cXVbmiApQzOm1JHIdyyv72r1UOt4ZnNWcqrGZAznAVovxx?=
 =?us-ascii?Q?ZvYt1hH0TdpXl5d2cA5vzMFd+FXyFXe/tvkF6RvrUL3gk4lK8fVFOE2f4He+?=
 =?us-ascii?Q?Sb3vHO23ON1Y5/Vyu58vPJIoQm4DKrhB6fOT1Ao9q6ze98EtCiQynyEONp6J?=
 =?us-ascii?Q?SJfLgnxjNb128/E9ayDbjaEzU9F3yha2mGhFihZZYt0XWWVYouRsYLanEy/2?=
 =?us-ascii?Q?6eDY5r7Nt86XYs5x8tWqpg5Njkk1kaX7Y3A0d2uAqnb6vkjvpkCkbDaM7rzA?=
 =?us-ascii?Q?/oxXXO9PerSNGNSxK4M0zdCLw021eX6booSbOH5iS27rAgfwph968vkD3KvJ?=
 =?us-ascii?Q?XUh5Zs6Sg6AGr8LjIQ/N/RIwOVWO2B+cPmZ6Zm8sTaa8w2JrjzjLPBKW5pA9?=
 =?us-ascii?Q?UDfi+enjhtG3A2wtYeEoDQSzLfj8WSFHQ3tLhqyqrgli/1zmIeTqKZmV2Tqj?=
 =?us-ascii?Q?3OUu71I0mCmIITRyix6KIKhIlL9nVGT/CA+n2JMkZ/7hecNm1/5kCNW2HhB1?=
 =?us-ascii?Q?Snwmx2lo9r0I05+AGLbSUwBA32haC2ZtjTtFmofZ7WFcE7GvdZJgFqk2dsN7?=
 =?us-ascii?Q?/IPMgUS6fxzL0L+nqFbXCq4Mkpj7+9L+JCvBgknYsGSWKmFC2ON+M32misvb?=
 =?us-ascii?Q?WK6pxyDv+0cu52wf6Df3j2Wc7xUQ4b/n4xtjFNLRDqd8qoRC2g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uek7qom8nB0yyJ3PrQbXquB2a9Oa+zLlXnhviM0f3O4bnBI7wPfsyXlgasJ5?=
 =?us-ascii?Q?P/ymAG5ZafJyd+M/oSIs+WreyG89hgYyDBy+KvfDM4BbN2ac6uPLZ0DF3fWw?=
 =?us-ascii?Q?C53M37t/ZmD9j5r69eGGSNDc9xHWBWRWxp/KbTjzREIxKgvORrXRfNe/fmV4?=
 =?us-ascii?Q?xes/Qf3HEYVjfOO/aPYp81SCYCXnU5KLFRwqyEAHkgm0tqHXRmFagP2bYySj?=
 =?us-ascii?Q?GYWplpOKHIt2dxeWc7DWdltZrRSP6A8eWuJldUA+YqMD4ZfWo6fQ6OpLji5h?=
 =?us-ascii?Q?GWYQy82WQ0CfIDBFj12r9niNsfLiVOm1VVzIPDKijFgVQLgLCZhgj02ENV1p?=
 =?us-ascii?Q?WIR7vITSim6GOzgQbENK0OQXKG5/fX3hXhVfPJLt2+OPeti1dthuPbYhbDli?=
 =?us-ascii?Q?YZPAJFgf2Jplz8EkKFZaOTZN0psHdcwFDchPvD39wS2HXZ9l9JmhhwcnAzdB?=
 =?us-ascii?Q?SYXZA+pHKpbtCcM4CaZgvPVfA2PkwOUdxiHo2jy1fhvsYKnd9y0T2Hs+62s2?=
 =?us-ascii?Q?o9AUItQngHEc751smu5QIm1b0WsCYQXS8VGfu8DpQglnM7NRLA9X/LbIZB3c?=
 =?us-ascii?Q?isFjUUglOiDOJ722xdIEgPiG3qUfstjfYufRBXXf8Kb1/7cO8FO1PkbbeL4Q?=
 =?us-ascii?Q?D9QeXrkLKvWCZu9DPiBAitI14WugiNEmFLiAWp2/xXWTLAOkOJCApkBivzHw?=
 =?us-ascii?Q?WSnoQdkT/iVGjTSfqKy8u73xMwDztj1uhGak9SxpGRXjNvJvtEWe+usUbIFo?=
 =?us-ascii?Q?+5DXfca9p/mnYznZ8WDRbhqW2vVj9A/cFNMkefyyYRVbDEurz+/386ZAwDVD?=
 =?us-ascii?Q?ymLd77QaKMLLzHmWnoUiinWQ/ljyvdJoO36cdNFArhBObvdBv2hPjyfuyPwB?=
 =?us-ascii?Q?s1xhATqLWz+2xFbWFnA17/PS5rEpeXxS42hSvsl4/v28efbeddQLi0jBKUMm?=
 =?us-ascii?Q?4TQz5EZacL3kYgPRqOAlEWtI5QLd7wmIipPxeE+t9pcjAHevwzoi/1ka4iiX?=
 =?us-ascii?Q?QPAaw1wQgOd3zisq3FAYSo5uZZzlyAYVRm/g0oCbKysj6tNAc2sehRrW0vlg?=
 =?us-ascii?Q?GJtH5m3Wgqas8riPlsCsZVeeXytr4InPp5M/JDCbfgoFkmRmepLYd278069U?=
 =?us-ascii?Q?Ldy7NCKh/HLsPGqRX+9NE1KLDZ7Ec/H67nwk33vyQorJPFxr6Cz0olb3Swzp?=
 =?us-ascii?Q?DOgHb8AsV4XerHrLDfxx7S4jIq3QpQAVoaMXXJHOLb9bLs6L9xKwNJPx6ea9?=
 =?us-ascii?Q?UAy4McMnUO1b1ueDxi9fy44qfglozb6dZP110yXShoiEb6bGqh01DXx9SGud?=
 =?us-ascii?Q?6NfrzsSg4oltKZi5bWfvOgsJWkTxXjq0bsc21l+vgQQ43kODk2QvuZBy+qCR?=
 =?us-ascii?Q?BWOj1oWfutfaqePlj1xuJQ9goH/BKeiRTcZlAWQ/kIEavF8OLF6UMfUc1A4K?=
 =?us-ascii?Q?oeV1M7EHZU0kImKMfEa980qyyiNKcum9SAqEeeqGVYZBkPOqk7ezTHA6p+/B?=
 =?us-ascii?Q?JlAjbfbe+7WW6+j9PBwY1A/Dn03ax6dusRl6F6c5bbTH95819dG1hfFu1l7n?=
 =?us-ascii?Q?w+tZ7PWxtsiyy74KEuEB1MbkQaOcn2nAlrYPNiMpXt6hcKrHQ/tD0T6jdfgw?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	08NzERtEpthIEDEuTt+ejGA3TxuOdedTef99lqe9BQy9GYId3beHJ/dwZmEMFiscao+4y1M7utwcTQe+YBjRlzYPbcG8qMPAQqn1y7gYvxiBp/Xn7OeRNWdCp6OXLGAQbOamBkNcQ12ex27v+Ch/lnkPGzI4LbAWAXhBWacxnJ0miGIqAf9GjOY+xLyjMhAm/3VQG85W7U663TzbkCNrWKadDclUmwaZrytcquissdPyt0PZLS6srAGuB05rMBRO9sZd5cweIUU6B0Xb0Ne4H15I1i1JgGhDSAeey80OnvmqVgfJ8Xx/CfspGoyl1dmffKF3OCg9L0Ja3AYTpEOhc+5I80C+SwIWthUYh8AelG0aYpB/NR1nEPT441f+9cfafTP1DSNugPexG/g8wwz3adoxVML1DeOhBTHOvxXRDuNPJSmP7L9BV3aonF9a43w6bMzxHqtjI95kXnclul97/X0vYIgnFC3nnrhImahnM6ekoFe4ogwZ7dcdvYkt01SiCYj8cTvdz/nv8m4hz5u8oAjRpohvtabLr2wVkTVZBOjPfB2awW7Kp5n53ikuYhxdRyy/DvOopbe+7O8AiJgCF7eAVNUSudTfU2hKLvRNNVk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 607dea08-33ed-4ad3-31c5-08ddaef158e6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 05:22:55.9171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wfndn87oAZzLKsAAuBXJ4cj/DNWt9FYXOVSmHmTOaaIXPEG1KxdiPKIn0//UARUEQy7BAaW2PeGsWcGMZ3jyUTRoH5MhnlWdpYMESq1YbNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6236
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=909 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506190043
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA0MyBTYWx0ZWRfX8mPDtrW/0Iac Qr86dR/cf6hp3o8ErShGWV80sUwmBkqcnDNt+VWzfYw0Vw4LcbK8ITxTLeyACSL/7Av0QGkNKIH B7JSVrxdqNeH7SQkO8dtr7M4IXzrqjX3W4agyYHQPdT3pV9/GCpSK3MusI/H/LraxMGx8UnJR6I
 xnKqHVKfoknNkZqul4BgUPAi0mDiIMZvTDOHLblNRaOaQojPQGF2WFlOc2/xiK8eSLSWsLIVWnK 3OzXl8G5XaweVtJJjDBfpAVv7Kgs1WP89cI6O4X8OnTTlNc3U83pVMnS3m+YgIrEiiVNr/Z1eMc A77lTS+X9ci4/GTXSVkEanaEgu6bYsIXVCeeT5hZb+7jfFbFTFBSrkoJSyUOpXuclLOFtGznh2e
 t0ua+BdwByAlPRL+Qee50rLtJ7UN4af5f/T7NYFBeSc+Nru0S9c4kZna4dTbppF/cSi/VLUq
X-Proofpoint-GUID: 5pXK4sTIA0QkVEF1hFB5qZKPib_Ootmb
X-Proofpoint-ORIG-GUID: 5pXK4sTIA0QkVEF1hFB5qZKPib_Ootmb
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=68539ecb b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=A6-VMl2sNGtgBdqIc9wA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714

On Thu, Jun 19, 2025 at 09:45:04AM +1000, Stephen Rothwell wrote:
> Hi all,
>
> After merging the vfs-brauner tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> fs/ubifs/file.c: In function 'ubifs_file_mmap_prepare':
> fs/ubifs/file.c:1589:9: error: 'vma' undeclared (first use in this function); did you mean 'cma'?
>  1589 |         vma->vm_ops = &ubifs_file_vm_ops;
>       |         ^~~
>       |         cma
>
> Caused by commit
>
>   a5ee9a82981d ("fs: convert most other generic_file_*mmap() users to .mmap_prepare()")
>
> I have used the vfs-brauner tree form next-20250618 for today.
>
> --
> Cheers,
> Stephen Rothwell


Ah sorry, I should have underlined this (+ missed it in your tree
Christian), Andrew had a fixup patch for this that was not yet squashed so
you probably missed it on this basis.

The fixup is very simple, literally:

-	vma->vm_ops = &ubifs_file_vm_ops;
+	desc->vm_ops = &ubifs_file_vm_ops;

As I typo'd this.

Cheers, Lorenzo

