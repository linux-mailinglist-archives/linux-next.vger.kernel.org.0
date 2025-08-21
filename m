Return-Path: <linux-next+bounces-8062-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C203CB2F489
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 11:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 219433A5DBE
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 09:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC372D24A9;
	Thu, 21 Aug 2025 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MYlntEzy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HysPIznx"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164A5278146;
	Thu, 21 Aug 2025 09:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769786; cv=fail; b=XOuhimA+qivv2zZNHjkCZP1x0BtfHwLKe8yUOOQ0rcriPuQUtuvt571wZn/gt6GTGi5GhTRniCee6JUk/nCdJsDSrVdnXuODxoRwtz8HU6CGkHJ+4g19EGFQ1QPphQdq5rPaMO5Hea2wFJGw/6j7NbnMSKkgan+lxgAI1btLmTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769786; c=relaxed/simple;
	bh=XlSv9/LZE5toSIVzS3GxD8Z32DnNjwrCWxkigjEQe9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vEVhRoGAGN/fD/68ZczD/H4Ym934kwtheYB8yfXz/KNMOfnwYaP+/lp29/CKfklq4cOQcaOcGBgQqobqy7Mvguviju/rN5guUIoiawp2dsy31U63YTU+cUE72qVt+GKrYDOnJukyKCgulnoRZXkWZzvC1HiRkGEpS+kx/socWUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MYlntEzy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HysPIznx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L8VvTd031730;
	Thu, 21 Aug 2025 09:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=5oDlGFGLo85en4ERV6
	WnHfnDUreuB4sf0QYXqwrjmVs=; b=MYlntEzyX8Sf39rpgYDa+MeNhiKmgZDWT5
	Q+jyM/npVj1lQ1cpPcZTqyrjc9A1wioVIDmfLmeyo47tffkXzzII2tBhmvBHXg0z
	8vxwbiIZMfEcutBPHzmKu5deYqpEtLwuceAyEUcAkn9wmY5Jzulpi4PuXhNqLaFh
	33TabntWCREruOOwHuLe15yc6nrxirCA+WWLbuEjN+4418/mF99HxK1+pqyE+cAA
	OUtZv88cnkdrdmfct3PGFrb9W6zuO8gEAmHAsWhroTcu0ixFWwdUO5QFQaJg37At
	jTvByuDkob0vMJ4t6gEUrITyQTgHX9McVYYW5BjNACoKgKP5HESw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48n0tru570-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Aug 2025 09:49:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57L7u16n030219;
	Thu, 21 Aug 2025 09:49:31 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48my3v5raa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Aug 2025 09:49:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVhjEPvJMVPSjQHIiCTl4rQrLbrwXNzKqGrED27a+/OROwhN4k0/F/pWvxeHJxrX+eLhbi5y2yV8z4rpEUb+FT5iPZcDcKFF64EGftAmHIh193KOgm5UnIEH6Fli+d+ljdal1bMsHPYcg5fUHP/2NkQpZkXgb5l0kQLmmzAtLm2Ge8ZJLsjczAJnS/zvz4N4Qx4WeNJ9y6MBTo0vTfLh71mEceSp8GGMBFLa4CcYAmrexixATKQrWsVJ2zZsyG3iG5+pz/1jdIBFyrfRkeqPGq//9MxJw72hPM/l6jzqqvgpKX7CnB7pjzDEwUD/k/cwz4C33Q0smxGPNOmonXAyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oDlGFGLo85en4ERV6WnHfnDUreuB4sf0QYXqwrjmVs=;
 b=FC7wGTTS2oy0yaCIKm4d+4rXOHudprW69kvtoY+pZa/bIbiZgwZgdY8om4M2YoujugOMm7DFf+I+cp014bAU0Pi7OxRjTIYtM/LCT6wxCD8nkrLzOm54CXZfG2yZ34KhgBpmr/MXq6tYkV5ajzRf2ssp3ahSE8K//jAe3+ZckZtJFPFqSL5R4DVvQNcobz1vdP6OIcQniiyEzyC+ICsjGXYGtS0qt+sbvlExUDwcAGCzzkIZQleSrhQN8YkD/k2zc3N6f4gk48ned3KybYb/wapXBui/zeavMKaB3kgfp7Xp2htdWLyjPz29j9Kt8543yzKOFFXTQF2XXn/sKoRQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oDlGFGLo85en4ERV6WnHfnDUreuB4sf0QYXqwrjmVs=;
 b=HysPIznxgwn6ksurDSVIOLVIPOO7Ac0ne5dC9WOGpjTRzB20PXY+B0P6KeY/5UENfrmpy+amJqqODmavJ4QvQMagcNG6PmrL0bEAM4ET8a2MeUfpLqTnkWrKnsklw6BrhlAMbS4Tl9FgQNYRwCnXjAOWW9RYb6Col+QTUOTwlek=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by CY5PR10MB6213.namprd10.prod.outlook.com (2603:10b6:930:32::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Thu, 21 Aug
 2025 09:49:29 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.9031.024; Thu, 21 Aug 2025
 09:49:28 +0000
Date: Thu, 21 Aug 2025 18:49:22 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <aKbroo3zVidG0YdK@hyeyoo>
References: <20250821160515.611d191e@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821160515.611d191e@canb.auug.org.au>
X-ClientProxiedBy: SE2P216CA0038.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::13) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|CY5PR10MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b4fb35-8e2a-41bc-d6bb-08dde09804d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KfaxlcPuwbjWnb/IUrhIMFIoTHxsfJEpWlrsvxUWM2VRvaEfA1d9nTGZ+UUm?=
 =?us-ascii?Q?+Kzx8Is0kNO7J187SCXwTWxGjezJb4hgBISLmRSLOQ41gPUvtt5MJLyFvIEd?=
 =?us-ascii?Q?GSCK+6fZIE1wtCR/GJ/XXhxBQ97755xS9Dqnkz3A8+DLQr2jKUFc4pHR/3kt?=
 =?us-ascii?Q?ao1Fsx8gsuBRAp2gHBXkZxSRAiK8+g2/CEQoFdS7WsdHzJ5boaIM2b+0N2Ls?=
 =?us-ascii?Q?W7z8E2c7e/SLw1NqGYUjVEg49/6WOgcy37zt//mpk3I+qXF6MY67UKiBB35y?=
 =?us-ascii?Q?tqxAj9eiblGSo0iHFUa7ZmJmPENBel5QAXW8JJPhirLMyvfXCOUNdoExZUhg?=
 =?us-ascii?Q?AOFcO0xo0ATGwp/H2qc/G1SKYUGIg3KchdIr8/cQx0N/yrKqGr0bolRxPNiU?=
 =?us-ascii?Q?VhCL8b2Zys/2hWyzVvTRs5eVvdOUci45xAfLXh0wiZWlkAVsb0nqXKqTdU9Q?=
 =?us-ascii?Q?p/JVIsaNR+QSvjbG/Twzs8D7peMOcy2zHza5FYInUNhmUKGvi1PMTOia7YPm?=
 =?us-ascii?Q?CC8xgxv6zuPb6pprjhAewvrBl+gHE8uy9ETbUEIS/z5CsihrvTkmijz7ybA2?=
 =?us-ascii?Q?7AxLi1rLVrLF3Aos/lFarohQwYSJsNQRn7C9vcUKc2IsveQqShBbeztuuS5N?=
 =?us-ascii?Q?OcuOPGUen8syUCtQ3/PzGZIhV9WrgBZ6VuAVJIvtuzIRGvI5p/iso3fD0Yax?=
 =?us-ascii?Q?kCHVeVVhpydAMEPAS3OmSNPfb9SmS/ggi+H7VcVHgCFNsCh/I09VKVrv2qYO?=
 =?us-ascii?Q?9ihfVVYwPd+oPPGxzCKbryT+fegEx1dlziIPcVs7P3O9Rpit/VQUIDTQ8x9Q?=
 =?us-ascii?Q?Jn2XFMEUn0wamkZgwu/zYA0/9GuodL0qv1ZQll6FD1VKcpPLFm9FJtT0quWL?=
 =?us-ascii?Q?laWUchVKmiSD1dUc+Sy4ilq8jaUVXj29zlZSmIulsGIyNVXVXFnygOsKyD7a?=
 =?us-ascii?Q?50iCeXh/Y21JSDIZ4syMyrjtcXFxr+BhpzbNWypUOMbFp4JXFmXMC8z34amJ?=
 =?us-ascii?Q?FqXehNmfbNOJC33yXl4JRX4hKXfdyNmHrBcWUPxlb7sJHoCtv0Pg9GK94K64?=
 =?us-ascii?Q?UcWK9zPc2ZyZiZofgRGJVB9X+OovtGhWibtq3id8/qn09IONWlwXox5XcU4x?=
 =?us-ascii?Q?y29sNfAu5rulwBEHNOX01TsMpFG94Mok3Q490Bl1hL32mprytNhlwnR2kKyj?=
 =?us-ascii?Q?3GItTlQl6/CIRiB+GRlb3pS1+HsEYeWajI3c2VZ0hlxmkSjqWxoPF281Kwxx?=
 =?us-ascii?Q?r/o1bjRgPI4VbyR/UjZViNQBhQQ42F6asgAHM0/t3OY4nHMbSTX59sGpxM+a?=
 =?us-ascii?Q?R7sAH1uH0nmcJJCLIo7FLBz50k3vDlg+N2S32ntgAKHYhfWMMilKXAKwitdg?=
 =?us-ascii?Q?zR0N08LtU7/oc/gzH4kv8RVbzTWV64DJ1rQvtGEts38aYm8KbO8nPKwbzIVG?=
 =?us-ascii?Q?hKX3jLb8gH0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o3nj+U7H1oXaaAlQjhKe63nIGRJ0zyaCikBjTU3eVqcW7y6mj7x889bHrYng?=
 =?us-ascii?Q?2y9VnHNELQjAz1Jp7YwmisXGSFhYPLrNgUQQrZVJAKZlIVT9YBFOnhxpaxjC?=
 =?us-ascii?Q?apwHl/Coqz53dOqLajASvdrzSfoV1n3B9WJunEUhPAuNtgYQHOVZF56Q6SnQ?=
 =?us-ascii?Q?fQ5Y1DgX9d/I+Y3DAFyNMDO/FNPlL63YxeA3j6DWMFxF76lbwhhGGW8/JyBd?=
 =?us-ascii?Q?w2iL9w8sHH+xEPXfaMtRBxwvtuywJh4E509nTOUd2IvhwPVkoKVbDYyUi0gF?=
 =?us-ascii?Q?RdVRuk5CcO0f8CVp9Nqt0qTmCCJsV5aQ2XOCwfgXfLJrCFHks/Q/QZ0XlI27?=
 =?us-ascii?Q?uoen0c5AgfO3NhUmkF1raUk1U5yVGnWFqM0K7zThMqVIYWzlKlzCdH4YpGmc?=
 =?us-ascii?Q?gr6wEbMAMvoCRRZcgUoqonOe4APEzDd7I5BNZEoegJF5GSg/VuCUGRj3xv1y?=
 =?us-ascii?Q?Qsd5vm6xP76IIAk8OEn8t5a2xuhVp9DTDNXtlD9tAkv5ruZKYl1SUVScFY3g?=
 =?us-ascii?Q?DSjiSG4c/OoS18KgNJ/adaXfFq0NEB7o38gvPLgQ3+SUNXZdbwxnBmR9ejU/?=
 =?us-ascii?Q?xV1GyoQIIzM74vOAty16W0q61PYLt80osfYo8ltfoZrVTwXNk3Pxhu2DkkWS?=
 =?us-ascii?Q?cvBB+p17A5SsLmdstlPqwojz++NkIWYMQk5cPZA8eCYGclcJ94p2MRBJ68Ba?=
 =?us-ascii?Q?55cUFN46hh43qv9dyYM9ECQShs16qGZA6VlG4G1Jn7C+SRqgoSt/ugdKEhEg?=
 =?us-ascii?Q?NKiVYB2JJEoLHjrewyweab8YNPFpJ8p+JPBwtBQSjTQwtaV9i1Ire4MU8qQd?=
 =?us-ascii?Q?4/PEAJql1+L6C5ehK8qhNWh4RGFMP4TFGtt0nCgEZlLAcQXkJa06TTFyk1IH?=
 =?us-ascii?Q?3Ds/gL09rKUwCavn+ksmGDEpXNsiQyuwoxXxTnmrSIUflfWKfJDauzt1I/FZ?=
 =?us-ascii?Q?/hx02+BLrwBxa3jF0uUZ7WYZiQgHcCOd1CCfsHFbE8TILddfaIPDAvOSQkRK?=
 =?us-ascii?Q?WrquoqhIpP3AaO4OIujsyc4Z0bjQcCGmHeToflC99hXHk3fvBI8wVP043dJ1?=
 =?us-ascii?Q?8VaZaCGK7fsBffGelxWUztymFsK1/vUlBhuWSt8JTabMQ4QMZydSdgWY4AhY?=
 =?us-ascii?Q?B5W8ZjggEu8lojefdA9QTyCp7z+ncBdPDRu2sVjOx79ZJZwElKILkv22Arm2?=
 =?us-ascii?Q?0verO/CiF8uuRIZFBPE4jLgQiEhgaiF7Gy4/E14ZMREVaz9WTWQvQDnoGc2l?=
 =?us-ascii?Q?jSCaPOZZCg3cOmgzLUlVpdfowaNZJ/bxUjcw+vCU9EMVrAm6tq46CFsUFRPk?=
 =?us-ascii?Q?8udknuUc3LHIleqPr40C6r5HcCBqTpTD3TgCriCmA10Hwdy7RJSShElqMb3E?=
 =?us-ascii?Q?q4+IWut9Hc5ht5fCZw2sDa1UtAJBKAmQ/A+y0e60N9tMMxYJQlSLHhl6XKAy?=
 =?us-ascii?Q?do80h3hK0DOGg6DV7HPQmbrX6cNhsr2Wwzya0pXhoL7Bo6u4tborr3Dd8SGC?=
 =?us-ascii?Q?IPfzKJg9VNy6lGDzWYk33VdJKdSVmW1fzRSTiazoi1bDHk+dqSoI1V8aC2AU?=
 =?us-ascii?Q?v9TIcs/5MClSHbo8V1+gbgcmBd+jxXK3bRLimqZd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Tw4x3KhhYQkiUfZ0Y1SZDNCOdB4DiYwxf84RhZC2i1qIWIngwUBZvKadAsrOZZvCntuOsbl3ntA7JFU1Ry0D6Mo5rEw/GgXRfCDxSvaw1mrXMG8sUTbOjs2b4vVw+GcixqNLpFRUiPQgUOuErGUZh4H3StiupoQhyU70xm/QMBrwqKU6c5L/DG4vN3Fu45sbx5Z9U12gDJ7+bhZ7ocLy6cIhOVPJf82S4pGeozKCLexwkBURDoPmZWdQbhttNVi4gt5pFUyrVjTyKUvteNpTjE1PX8LLx221NALu9UTqa4DBtH89QevZmAIty4eRyJWZuNmK9JHkRYC/BLZ3NetjzFmljPnmuA22CjXQd7GJ4cCZbNGPYsxOBn7SrErjYeS95wOc4VEeeaZ2ExBjL182d+hNrjsYw6VlDYMhcN5x7rp6RljFkciMxc2Fj4oRUt1EIhn7oMRGKgOvoxrWB5Lh6Qbq44BrVIDXO+Xpxcneog803Qi/KQOcx8DSP5JDaOUf/QPd6TYudOw0TvrmGgEmmBRnYUrWFKZpNQzkGl5s40NHGBpzO/cCIFjtFmytfZZE8AjwMF4x8BUE4BXRObis+QvNF3PglM6DG1+NAOtBPwI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b4fb35-8e2a-41bc-d6bb-08dde09804d4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 09:49:28.0386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9GgSY8UmBg2H55lvSbpHN0ditaBwlgVft5ITMnaQJ3sUxWasoihKa/FHgiUPTPl2gsDwwc2+RBdStJXPenfmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6213
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 phishscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508210077
X-Proofpoint-ORIG-GUID: JAAumjl8OrYSAxgmGsEyRl3dVk80fhpm
X-Proofpoint-GUID: JAAumjl8OrYSAxgmGsEyRl3dVk80fhpm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NyBTYWx0ZWRfXxrtK8yWYWyln
 IR4MzifmXEXEw+XBIsGX0Si/yZB0LtuKhMdNZ4hRnw+zpSsnAZe6GH46TLLUlS6qG4yj2iARnpD
 i14ZIdOd5yWZgDKYBEsOOpLMJ3Vv4ldJW8eT9ZQSNk+4+u9dmjcJ4zSthZ3dhb5r9pbFRve5YYX
 BSA+rN1OKusQ+a+z1PSEguz0B8XpzUCVBULMfD4/wCvaM6pEoAKDz6/fvvAWuUHYPaPFhaKYaJ6
 ogvlb9jrnH17qnrcfvorLA4y0U8WdbVwL4vRpJRNf+boYim6Ez4QH19QhH+bN1QvF13uabZpaVS
 dhjo12Re58c9NefE/D4lqUJb8BtNftFx5feUXNhrhfQAPONsvriFBPKQtR4RnT8J+YDKN5WAexE
 YzNG3p8ymly9UtafynC4v5CCcvLIoAj1qL5HiHMSUSIDsW3EgVk=
X-Authority-Analysis: v=2.4 cv=Qp4HHVyd c=1 sm=1 tr=0 ts=68a6ebac b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=D6vbDAq7L_AbUf422mQA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13600

On Thu, Aug 21, 2025 at 04:05:15PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm-hotfixes tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> ld: mm/kasan/init.o:(.toc+0x0): undefined reference to `kasan_early_shadow_p4d'
> 
> Caused by commit
> 
>   4b99d7a3e69a ("mm: introduce and use {pgd,p4d}_populate_kernel()")
> 
> I have reverted that commit (and the following 07cf1bc1f659) for today.

Hi Stephen, thanks for reporting the build error.
I've sent a fix for it [1], and hopefully we can add it to mm-hotfixes soon.

[1] https://lore.kernel.org/linux-mm/20250821093542.37844-1-harry.yoo@oracle.com

-- 
Cheers,
Harry / Hyeonggon

