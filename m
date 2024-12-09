Return-Path: <linux-next+bounces-4921-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 706C99E91EA
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 12:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A097161810
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 11:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1BC2165F6;
	Mon,  9 Dec 2024 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lU7n8dbN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WsrJKKLo"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947A121505D;
	Mon,  9 Dec 2024 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742884; cv=fail; b=vFvrDIbQFZzDV/7wr+0bAEGdbemcg0sFFIluIuxv7j+FJAEOP7OD7KuCj1TIUHLrqmjZne2WAntQ4SClseCbWSHoZw664excE7Gb+dWk57/hQGVwYnaKbrh2NCjIYFKUvW9W3r0T6mRAhmMn+tdSC9cPXfFnAOgkGMsA85xd94c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742884; c=relaxed/simple;
	bh=3ftZqamTcAAbKkeWAV++CrP/0n++kK8pbzZSnJbrmO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PEODMMcPzkSwkiieMr/N+t42wyk6RJnJ2rH7haBRCljuR1u4PNpi22/TZOHnn2tx7aMPpoipPkaHx1uVa2KTrtxI1MH1Dt6hiDaf8I8v6QG6lISwXrRH0SIyL4JYTs7D7G1TzBl7G7A1T8ZhPTmgXCG53GCWmTTqNCtgqMmrjXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lU7n8dbN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WsrJKKLo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B98frSB014826;
	Mon, 9 Dec 2024 11:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=G0w0cOU/pXT1bSJVeo
	JN83OqIZlwLrHjMGjcqGh011o=; b=lU7n8dbNiqXz1e4B2l9JDMcRw6vNAs25yV
	5EMuCo+THopJz7RONDUFSW7e6cyb55O1Zt8MCVPM+zJfAyzYgrqxJGySc687HI2i
	8cS4VVVnb0Gefqz59RQztkxwT/AyadM9W1/QK5YyR3ohaEIXHNL6l+auqzvvNNEy
	fWJXrwRJ/UnFbSs2PieM0T7bErTzQysycGc/xF2MIJ/+QJQUZF/C0EaMY00D4RK2
	rjZGDPenFX9Jp8fnygNF8vC6i6egaIyPwgJpYDkJ4L+CYORyuM7662clc8F2og9J
	BHZXao/9RWiYeIGZ05zCRTI7nrtYJxwAy+gkYOLzdzPh2Xrecmow==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ddr613y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Dec 2024 11:14:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9B0vWc038161;
	Mon, 9 Dec 2024 11:14:32 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cctd9nbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Dec 2024 11:14:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzDwwTFls2NdFLK+PyiAZIw2h0TRieYbqzusYHqXwHL0lMt9mm0oSy/isTbDZtcMvTDoEfnKUGVNp3tXqv2J6XIs+DcGFNfilI6pB9S4QsqnMeVPLXBhrp9CUDA4Kljb46U7qa4gsHBHLucFsQsMViJH7XK6VtH7FtbPUm2BhF1KPYVEN7hbqobA9SFnGXJLJrYJD+A4FBVLr+QetAGrGT7rgKVwwdZ9/wCvnq5Ue1EJQd4D6e+aZgPIpmQpwHhHcNUX4ovjYekW+kg8KDBSmnDGXtnEPnMrejbWnnsZKrmX+fPWyomGODPbxboJXO2mgWUz2RtBrpYFBHWoON2jAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0w0cOU/pXT1bSJVeoJN83OqIZlwLrHjMGjcqGh011o=;
 b=na/egWEnd0TgibPURn8rTz1s0+QXk+UiiV/TGkffTzHIg10mfhj9RUk4puIOvkUVJFcdxvm6/o5Gd21ww1KXmfBn4ri2SZeOpmqwwokVDO2LaQO11KQ+vOgumCBSo1lFbG8pz/8u2u5cwdnJ6TKZcgDvQAJ3oR9a6cir+YxKs/T+tMePDyYDAE/GK4Z6yHOMJw87nFRemjXya7LcsssWN+N+oY9wTWiisb1jR+XxiQD+QDKE57cfwEOYKSxRzmgam7RZnyNifhAgAwQkuDY1bhUY5+fyACC79K+OC+n1Zp+CnLtp1O51jsDcIjbPIA7+9rf9ycJJyfzV++eoMt914w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0w0cOU/pXT1bSJVeoJN83OqIZlwLrHjMGjcqGh011o=;
 b=WsrJKKLoR90YqFiaMtipV/8CQFrQvPGifYMZXMN6joN418pe2OCnTjUYxrg1DRtDdDEU6VgfSvSW5TH9qaCyTlbutUhmC+wV8Y+Dmo2kkkyYzeoJX9WlzzfMUjH2Qi4rT9jZ4RRsjiMPsF53rcvz/XJmXdO33A8nPCiHaQEYkq4=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CY5PR10MB6095.namprd10.prod.outlook.com (2603:10b6:930:38::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Mon, 9 Dec
 2024 11:14:30 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%7]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 11:14:30 +0000
Date: Mon, 9 Dec 2024 11:14:24 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <8268b1cf-bb7d-480a-8269-08616ad0aca8@lucifer.local>
References: <20241209152826.70a5b5de@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209152826.70a5b5de@canb.auug.org.au>
X-ClientProxiedBy: LO2P265CA0219.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::15) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CY5PR10MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b84dbde-7dd2-4ab0-ee9a-08dd1842a6b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?27fU1VW+q7EaXREOqBXaOoEHv6i2zX2Gy/Hzxp5HMcNfuZH5jAbTdn8rks8W?=
 =?us-ascii?Q?f5QjfjZSPNfqS0AMXLlEmKj8/AS24+S6h43/v1IXIzCTGJZZVxMg2YTzgcBy?=
 =?us-ascii?Q?PASs6UGwRcdfk9L00q7OkxE9RefOuuPDrZ6KIJeNRtAZB37f5PYXwyJkeDa0?=
 =?us-ascii?Q?Qzfw+yg/860J532Wt6V3mbx+w1XufyjP4EG+aVDfPvBnAIUGMPygugG1n+8s?=
 =?us-ascii?Q?mgSy02gG71yYrVcr7oJubN+7Zhi+TgG0qGband3oyRx1J/4c46HAD7rStlNB?=
 =?us-ascii?Q?xwlLJ6zNB4fECKhSqfo2z4oY4l7CgoMsDVvNyEjwRh3x4fizffXX8GoU8hq/?=
 =?us-ascii?Q?ZTjLvn1o/Tj2ikOwN4L5Nz1rdjZSzjcRVe3MYOMEJzuJefPK/AMMiG80rmRq?=
 =?us-ascii?Q?FgZq5gLyCAY4SxVjJcl5E3/TnHfi89taqzdOCSGet/+l4wReRl2C8yoBhoNn?=
 =?us-ascii?Q?q+COCuyl2Go5yWbZJfyQRjXL9pa0EpT61Hpk5mQ+KcSBI0BXUQ/qAxkz4NfB?=
 =?us-ascii?Q?bGfmkcXbHyoicwxkZWgfr/VvJ8waNV9pBjlM9SSC/R5TNxszbKFxCJUIiy8x?=
 =?us-ascii?Q?nyUEhV9QwYW2pcxmhAhzJrg2XfI2RsskzEMZm4X7z35iFMWsWPK5g+Am5qN8?=
 =?us-ascii?Q?DMCeuwqnt/uZHMcB4TplGVoxIjFWEy8q0ziRe9z4oore1l8eIMuSiIIq3/JY?=
 =?us-ascii?Q?JIDjXbTaCf5nHhf44Sp6mdc/ypTE01JhBtexA1QMgR4ukZrl3rlDklvofanW?=
 =?us-ascii?Q?vwwzNpT33lPEV7Qa3np5Pg5Gxa3yRQ8m/X59OG/pZdU7RG09FGydWSlzFviy?=
 =?us-ascii?Q?Cn2kkxMaJ0DdNUgTXI27AF1wpclf/JBHd6q/MXBz7qYsH2MpTbq8TvlXnA8K?=
 =?us-ascii?Q?HDUi8D7FeY1pqyFtzbD7kpCNTPRfBhbhEQlpdVSTrNZ9A92i3K5/MicI29g+?=
 =?us-ascii?Q?aIkZxbPpNVweJDEE7INY1xt8HvszvGETbLWmerRPrR4PR4YCEGLLL4sYzyMw?=
 =?us-ascii?Q?cfwempfg0bn8kJWTed+nLc2Uxij8MQgxbRB2mIbKM5gMjpY1v3H6+FMD5vh2?=
 =?us-ascii?Q?BIMqhp8KiIjyflYJnYyxckZPAWAxbhkoliq3FZPEpzYktGhrcv07/DlrWfIa?=
 =?us-ascii?Q?qnHxW+AfcxlcOU7O7z4n2en6YX5lnRAWi+zJgXIhHRWOPWiBi4adc0Q5wQB7?=
 =?us-ascii?Q?UgPGUfjQJF47qp8B+FaCe4bYHrFvAj4BFdR7isi/QSQH2ySTSzaz24glB3rw?=
 =?us-ascii?Q?3t1twp9U/rTH3G9PGh0vIUSOimRccRNsEE7EcpiYRfhaT9SlkAznkcoeH+ZK?=
 =?us-ascii?Q?yY5QVDn96DOEqNIKddHUC2NQw6UBeRMOwzqI7S8gR5q0Fg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JJtl9nh0twsWGVqhupOF7IxPXlE1Mn0s0TEOfJqVLUsTTtQ81Lx8hXvdCfYu?=
 =?us-ascii?Q?q2txsG5nLFjCQsSHYpY9tPTHxh+cgBiI+jXd1Vq+2SnGATaVpTASXYVJpAQ2?=
 =?us-ascii?Q?aG+AUd/P+X8ToNGpsUkw2PQ2CnNtp8Op3rZSMxbRDnX0teQkiGbN5W1zq49B?=
 =?us-ascii?Q?7CaeCO+MSYRt6LDkbi67agUxVcHORzxJs7zcGPBeTJkKdiC5NRAvIijp3sj0?=
 =?us-ascii?Q?TMsv25tOOANHQXwpGw2kD/d+OjbRH52h1eU7vY7fG9GOBMmYYsSkSoo2dS7Y?=
 =?us-ascii?Q?97RteoCxViQV2kX9q7QNtS2BrZ5HVNQMSvUuUXzYUOTb7RK1eZujPDkog/5p?=
 =?us-ascii?Q?8QBUyHQfAwEMEmJITFd9dmoGK7myaYkkelcV1jGmbNS1JTTxRbyjy7hZAO+7?=
 =?us-ascii?Q?3YppKqbduI63+Lksz2Ryf/kQliM4ddvHtX6OofXxDFloRDyLrWN4oZz5EXLH?=
 =?us-ascii?Q?OTIERtgnNm55w7z6jbN6mIbvTc/gAD0soDvGXCv3IeXTFCWTmRyGd/F2G5jy?=
 =?us-ascii?Q?nhVnCL0E5W1dbTgdKoFjAFmrEZ1MD4GP6SF07fHyADKVJDgitzqNGMmFDNf3?=
 =?us-ascii?Q?shPglt6RKPNG2A9elQrTdWf2DdqBaPqIlFvsdhi8RryFIpaLTbAZz48fIhQn?=
 =?us-ascii?Q?DHfOuKrK7Ajp9JInk3cwwytDyeSlUiqqBtyX+QMsCmE/rnXRFG+vHuS38c6C?=
 =?us-ascii?Q?MKdMYJ7Uyv8l5TMakO8PwKJJB6w2xBXY69snX8j/wYkGCN6ywDXC3CQL+BgR?=
 =?us-ascii?Q?JRxSe9mGJpjhWDPAPUMLDtZ3frh3FlAWsEcHiNlO9Eb6e581iMjDcwHxYK88?=
 =?us-ascii?Q?zPdbmC7fODnyToI1E8pFq2xBzL7fUvGbMMCmbXihnPbi/+/PDxBJJvYBcpkX?=
 =?us-ascii?Q?jrVMI48Xz9b6o53QiaFbBfjO4c4kZ2xyFI8o0O4/xA3I5drrfkrcFVxaYekV?=
 =?us-ascii?Q?EJvaImk8upD0JfO6tI8l5hl+eq3Nri4XNnYr6ol6uXShqRW6/r18o7CVwnjo?=
 =?us-ascii?Q?Vcumt8FofCU43NeNOBXpq6fRK1uBi8iirfXKCErahp9fj2OlmaIhjbh55RjG?=
 =?us-ascii?Q?QCHzGoyl2mJnMfdYKdU8Pq45rZ8RTJn0NwOV96bHr28S2+20AMzsbeBxic1z?=
 =?us-ascii?Q?NRHmVV6Q6MKtunBNqRckbRRkcdcE1L8F1ejWtZeNll+Dq9vKlQMM2to+QcGx?=
 =?us-ascii?Q?zcIavGr1u0MhtY1YOgH9lsFFy3za5TtXBd1mYSwPbM+/69CFGDQAkW65FTfK?=
 =?us-ascii?Q?yOCfiBYh3c5uF5nTZTrlg7a2njjIc+JXisXsk/kgpj/MYmsJI3IUkXSVxSwm?=
 =?us-ascii?Q?hKMi18D20Fg1OJE6bs/ouicf9FxqGociMw8Njlu+fGjITRP2WAIlCF8ue4gs?=
 =?us-ascii?Q?CKn1/5e5ttVNYyaxHwWr9I/uIJXQDqkYYtxGhTHClOUQcPlTyWlxj+i1Ayz6?=
 =?us-ascii?Q?p6XGzOw8BZdlM63zFnoFpqPM27YDoNzL+j7sFyhfbY3LMyDCLXGWOPS0c7t/?=
 =?us-ascii?Q?XehDpgYhp3T3JIFfJVU0ZS0c38i914o4d4scDkyldsLFFtgfWXtnKapi0XZc?=
 =?us-ascii?Q?0EyF/XdXz5O9Sp0qgUHK3U9MIQrMC+ao1jctSVb9C6Zh36OE7X0LYRRo1qRT?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bdeHmsi94hDgg1ywpHT+ZFrg8Fagbrdyv/CxMMmIws7QIfZskrvSlaVVkIL4YjcaNwq9FvTEVKItXynzVuSCAwsQtEN3N437mGmAsULynrao020JvuLhK5v6jZOHvTsHCDdDBdvYpzghbsx2Nb52rTNKN+VDuLRMtUe9sQnZYb3E79fOpAmiHRvPj4BT8bR5XXPh7BtyoFIt2S6RBulgRcJ9/TCXR1AzOSAOpReaPRs9+wc03Q9if6Ytbw1GJwSTXHvdKPXzjrbZEWVT3edN9mQrWrJOVadvMTnpdpWkJXUBAZiGBVlD1lF2A4qBWWq+Ca0tS+5XhkqkGT3mtLJopc9Gtvb2oomJtqbHspQ3XTwt7n1EkJtW5+Baz8cx4xiv27zXpn4xOaBtCuYJow6qJBLOeyTKuCZ4A5uD/z3M6pwkIHukSXMZ/gW0D8+MmQchl+19JLfOutjsyyVqi05yW+aVV6h54dd3Q13uHYbIdaB6yuIK4MKs/oiou8+vt1dN/fu6WCLezY7xrcFaX2I2ovRaeEqfIcF530EMMV/VlPwm8QA3y2fQRS3X6MqFw+fy5PtKl6ujZV3a0n0J84JnXDzDam2J0P5GwMcFCum1zM0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b84dbde-7dd2-4ab0-ee9a-08dd1842a6b5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 11:14:30.1670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VhpOZ2DymXQnOj7agMAtK7Hei9G2K0mmgtYXSYsHmm3ii22QjdF++GAtfL7VSFPg+pRvUdj9u+ZiqCGiUywMTMkIsqhFdCEdvaGRbm44c6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6095
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-09_08,2024-12-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412090088
X-Proofpoint-GUID: 6MgL1LqwlFmnjFB8d3zcU6LAea7BJdLP
X-Proofpoint-ORIG-GUID: 6MgL1LqwlFmnjFB8d3zcU6LAea7BJdLP

On Mon, Dec 09, 2024 at 03:28:26PM +1100, Stephen Rothwell wrote:
> Hi all,
>
> After merging the mm tree, today's linux-next build (x86_64 allnoconfig)
> failed like this:
>
> In file included from mm/mmap.c:50:
> include/linux/memfd.h:27:5: warning: no previous prototype for 'memfd_check_seals_mmap' [-Wmissing-prototypes]
>    27 | int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags)
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> In file included from fs/fcntl.c:26:
> include/linux/memfd.h:27:5: warning: no previous prototype for 'memfd_check_seals_mmap' [-Wmissing-prototypes]
>    27 | int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags)
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> In file included from mm/gup.c:8:
> include/linux/memfd.h:27:5: warning: no previous prototype for 'memfd_check_seals_mmap' [-Wmissing-prototypes]
>    27 | int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags)
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> In file included from mm/secretmem.c:12:
> include/linux/memfd.h:27:5: warning: no previous prototype for 'memfd_check_seals_mmap' [-Wmissing-prototypes]
>    27 | int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags)
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> x86_64-linux-gnu-ld: mm/mmap.o: in function `memfd_check_seals_mmap':
> mmap.c:(.text+0x200): multiple definition of `memfd_check_seals_mmap'; mm/gup.o:gup.c:(.text+0xf60): first defined here
> x86_64-linux-gnu-ld: mm/secretmem.o: in function `memfd_check_seals_mmap':
> secretmem.c:(.text+0x3c0): multiple definition of `memfd_check_seals_mmap'; mm/gup.o:gup.c:(.text+0xf60): first defined here
> x86_64-linux-gnu-ld: fs/fcntl.o: in function `memfd_check_seals_mmap':
> fcntl.c:(.text+0x270): multiple definition of `memfd_check_seals_mmap'; mm/gup.o:gup.c:(.text+0xf60): first defined here
>
> Caused by commit
>
>   6b72648c4e2b ("mm: perform all memfd seal checks in a single place")
>
> from the mm-unstable branch of the mm tree.
>
> I have applied the following patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 9 Dec 2024 15:23:48 +1100
> Subject: [PATCH] fix up for "mm: perform all memfd seal checks in a single place"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/memfd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/memfd.h b/include/linux/memfd.h
> index d53408b0bd31..4397e3b4f0f9 100644
> --- a/include/linux/memfd.h
> +++ b/include/linux/memfd.h
> @@ -24,7 +24,7 @@ static inline struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
>  {
>  	return ERR_PTR(-EINVAL);
>  }
> -int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags)
> +static inline int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags)
>  {
>  	return 0;
>  }
> --

Thanks, apologies for this, a rather silly typo. I have now sent a
fix-patch to Andrew so hopefully this should come out in the wash also from
mm side.

> 2.45.2
>
> --
> Cheers,
> Stephen Rothwell

