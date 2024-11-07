Return-Path: <linux-next+bounces-4693-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF0C9C10FC
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 22:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18E182853A1
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 21:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF01194C92;
	Thu,  7 Nov 2024 21:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J0lN9vKv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qtmOdJyH"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9655CFC08;
	Thu,  7 Nov 2024 21:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731015113; cv=fail; b=lKNlcjIe/MkTJA3X2tibNu7DUljDjScB8odvLv1iR4CVAmcL+B/IR1alakbZtZm6XDF6l/V9i4cyYW9TZZHEoMqi0xk8MxGGpzkQTpzsMMi60IV9CC/hcpS54VUkIuCtjhuwQUwp1DWKru38kvGJcofQ+Xnf+PhG/vbhfgjPN4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731015113; c=relaxed/simple;
	bh=Un7T/DE03t/7pIChjDMjrfgWq/mfLXMkEzN3ZDKTXNw=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=IURE2F8aRwVrTYWngbggoYCYTqLkMuUr7vplKRYeaooesqXSfneRWL9ryFIeE7vXlcWMIlYzbarHubPew+iPOnlTThYGKXXkh3/8E30GVN7vrTUofcmnS0obyaQ33B0TIPKo2So81FTH0pz9VCP/dqInGzsq+eusTaHc/MMICTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J0lN9vKv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qtmOdJyH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7KgXtK024780;
	Thu, 7 Nov 2024 21:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=3Xu+tNKRj9Cvaa4q5Y
	gaZ118502CiA00lcH477xbEPs=; b=J0lN9vKvx4P6DuHlzkuU9Ic3jr8NIeHKol
	z9OtLaaRm6m3eFwbXm6oJCvhUsGJJ+kDT2xxdzagx6bI7Hf7FsBB3Z8ofgEFYmQW
	ximNSDlmcJrZw8+OsmrmkcDBdOtylENy8UVSA+D+P94B3ISmK/n30NglcYb5QlwR
	0rJWea7xpsSPc2gp9/8RrhraGhwEV9w+CR95AUxSdArsG2A/DgeibT1jmrJZTgaY
	6yoI5ee3ty25qNLWhOH9jsrghd+C1UtRrQsYsPlY1txJbB8hJfe5AoZzvLMwVevA
	c7NZtGaLYCofy/nPVi2GGpdmwhTUeegZTYEc08u15gbXLvymLl8g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42qh03erkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Nov 2024 21:31:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7KKAtW036662;
	Thu, 7 Nov 2024 21:31:40 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahas9ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Nov 2024 21:31:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsYo20acC819QscCShrburIDiCW6+kbe1FATnAylSFTvmUeW8RLh65fbQ+D22jhSWiNsaEqsvNWH4sCEDgcZKWaOxZblWzi/vkhU+szaE2TlK4aN4abmEj24My38yXnpN2i0KX2VeulTooSG3a9WaQLdSkg4F8NOphDGR0tgNLpsKcfWXAGge4bdKi0jgZwCQnOLq86T2pgl8e+8XC9ATcg5hgK8q2nVAHNyZT2P1SI/T7+4SA/9i1JU98nBH1l2yhZPS5AzzD8LKLn6vk+ZBr6imTWwFOCF+9oCuX0Xi2DlRr9I6XlkpxMBu5M0j/XvDBBJebqHMboL83lhZyuXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Xu+tNKRj9Cvaa4q5YgaZ118502CiA00lcH477xbEPs=;
 b=uUFGhp59JcTLAIActpDXwB1iGx2dAF0vbeYBl9/cQU9xsnkjul0aCRSZGdVaicsVzA3QGd+moHgU+z+xhcLqHbVvWjxAQA2fniJSStysarkJT7EvXMkPq2Ad53h/eiC1PB3b7GFaiqcQwAo6x5fyNMWBslFSEK+nncCaAZxldxPP2dmG8xlAoHDvUAhRVQALydBcVoUyMUr7RoGt6ih8X+AZStopOe1NJzz1jAoxKTOf/3DzeHBWd4QycU5u/sKIu2Oav4/dv8qgQKimNfmrsl9hfLzN2/a+yVGT5q2dhlupkFVIi5zECJk6kpQ0aUcYpHyL+Vm7g01HpBrzSCFT7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Xu+tNKRj9Cvaa4q5YgaZ118502CiA00lcH477xbEPs=;
 b=qtmOdJyHpz+efELSc3vtr28ilZOeOUEwXziPNU+xWIOZYApiW16Cl7E37kWyaggUuD0r/BzrBmUXPR2FVJKfjRt8qpBaa7PrSxgzVVj3VvbJpPWf0Stif8jaomlRdJ4M5s0fEZhh6cIlwLsO3s++KcpnF6ZnZweXnMu4J5eckMQ=
Received: from SN6PR10MB2957.namprd10.prod.outlook.com (2603:10b6:805:cb::19)
 by SJ0PR10MB5661.namprd10.prod.outlook.com (2603:10b6:a03:3da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 21:31:37 +0000
Received: from SN6PR10MB2957.namprd10.prod.outlook.com
 ([fe80::72ff:b8f4:e34b:18c]) by SN6PR10MB2957.namprd10.prod.outlook.com
 ([fe80::72ff:b8f4:e34b:18c%5]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 21:31:37 +0000
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
        Stephen Rothwell
 <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <75eb024e36162cc3a1007ff6b4ca4a3d8d0caa02.camel@HansenPartnership.com>
	(James Bottomley's message of "Thu, 07 Nov 2024 16:00:24 -0500")
Organization: Oracle Corporation
Message-ID: <yq1fro2ycyp.fsf@ca-mkp.ca.oracle.com>
References: <20241107212954.4da462cf@canb.auug.org.au>
	<yq1r07mye85.fsf@ca-mkp.ca.oracle.com>
	<75eb024e36162cc3a1007ff6b4ca4a3d8d0caa02.camel@HansenPartnership.com>
Date: Thu, 07 Nov 2024 16:31:35 -0500
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0127.namprd02.prod.outlook.com
 (2603:10b6:208:35::32) To SN6PR10MB2957.namprd10.prod.outlook.com
 (2603:10b6:805:cb::19)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2957:EE_|SJ0PR10MB5661:EE_
X-MS-Office365-Filtering-Correlation-Id: cf21f1a0-1637-453b-af2d-08dcff738f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dqIZTXQ7UNSmiewRQIWg9r14YDBYfe20KaGwonq0Z5uaiE0hobqpgtTncuf3?=
 =?us-ascii?Q?ZkmWi4K2A7liRtN2W8qTqDwn6K9EKSlEj/SeSnUQBb0MG9gkmAaL2CJJjDB5?=
 =?us-ascii?Q?ex2YzCBvy3pO9V3H5QG6EPFrg1fDwAOohVu7X8F+IDb2El2TBgvFWX6agzPA?=
 =?us-ascii?Q?2oFcMd8fxPPRAQtNfWIlUJ3mIKwkAWItJeuKctfaw0uUmOfb9LRvASJKkhYF?=
 =?us-ascii?Q?AdsoK3qWpxetrhRMJCjO0wUMLOTFIypclZz8AuWDxJhIioK9AkvxXzCHb7J1?=
 =?us-ascii?Q?hMTM9sNLp6Fos5pJIFPPKhanTS+e+D2TCNMUuLKH16ZrC8Uwr0hzGdgxYR/j?=
 =?us-ascii?Q?RTwIbuuf6oIzzq8/SrkPBSOrl28KJNFn0PBrmpPkMJi3LzStpSMiYsb9zFv5?=
 =?us-ascii?Q?6EWAIsFWaplh/DGSunFrTgSn7ER5dxujVvNGsIwaKQlp7wMpW4L+ZNrDHHy6?=
 =?us-ascii?Q?Gumv1NJshEjU+LuvUbrPAOnE1IpHeIdEf2pt5bu0j0BbrQn2NsSHHiS+BsRU?=
 =?us-ascii?Q?9SwHstk+ngkUzTM4hHahoTq+f9lL932YDktrbTeWx7pYZcpfbueJuuJjZyxw?=
 =?us-ascii?Q?hkv6HKhONq66MjjfbhJ5m+A2CL2pP0Fj3Sl7EVZbrKsQMdydN6IbDhXPHyu8?=
 =?us-ascii?Q?TZh7v8zRNsGeRqmE8pUYk8m2QmT0+SpMWFG6PwpYd7i89Agt5GHSJ7Dr+AAz?=
 =?us-ascii?Q?2m4juAFWC9xWlmJkR5mHQy5ZjXQzrHmbtpu8nbKTQJdseLj/SoGo9BZWWaIM?=
 =?us-ascii?Q?jydvERKW7vE2benAyWFm5OgPmGUfA1UWtT+YLwiOr2AYx+uo5jPqY86KrlFf?=
 =?us-ascii?Q?S4XVUrMQEAX1eguTE7DkuxP62u7Ogf9xmyRzVzqQmxPE6pXulnDN1/HC/NOC?=
 =?us-ascii?Q?6fI0fgYYsO/zha0ZPAW5Gp+TFGLd/RDncCFQ2lt+kBoU9XEqv0d0ktVXzL9y?=
 =?us-ascii?Q?+tofB+sMKI62Iop7JD4hc6t45q6CTrKfH4kOVHk7cZORQc6mq9qtCG0eo24V?=
 =?us-ascii?Q?C2pVx9QFYwPxunC4WaNyLYrHzCFXNF5khxzNSGsW/6UKGxu5Fqjt3ag32Mxd?=
 =?us-ascii?Q?A2Lm0NkoSKye7EPKBRdDv5w2KpY8WwMDm67l1vyn4evtv1EGUXtXii+w426t?=
 =?us-ascii?Q?IM6DWZ8P18UuV9xdkfWARKhpcQ+lhxlqyxtQSpW9aybFB7gVpmgPY8vazDsW?=
 =?us-ascii?Q?OjCXwC9ZKHGL9j5a2YYTEkpyeSnVrV9Cw/YXhc7kkqqydBzs5kpDTECVp/oT?=
 =?us-ascii?Q?pX820l+czYjToSarKOgfHEfpllvUGBSDUjZFdhgzhEzVIcgCybdp3flr8f+U?=
 =?us-ascii?Q?nOc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB2957.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n6RpDMLo4BfdQfFbGVvbHtfyI6oYZODev33YwgYG65k5MrqLdBXmjgF/yCXz?=
 =?us-ascii?Q?dSdyI1vXXcr4nlZohSAnHnUzirzUT3bYzYow8tIYWJPf0fbUbWz7BiZ1CcK/?=
 =?us-ascii?Q?1ElqbocnBPsc1rUxBm0csd4l+wY4upNKuHfJ5s5nWRJTJzDQJ3IoXFesdmGK?=
 =?us-ascii?Q?n0THtw8dLf7uV+L69Fc2hBjHQwdttp2Co9Q8XZSUt+b297UspV7/R+20q8t+?=
 =?us-ascii?Q?jl4klRdfTYHRkqU5+MLI7+OGnns9iv7/fRUH0eiCTuVohgTu3QNUwVDZ49p8?=
 =?us-ascii?Q?XgAOYbhu+unMD0vMEzGwF7fDjvRV3YJbYAzuSH98MAHdqzHS0dmOyMNRFaGD?=
 =?us-ascii?Q?UZYMnvZugDOTBVhgwB7fvf6fVxM2yjXFuMAkEbWCNw9cb38tSds8/RMDzVfz?=
 =?us-ascii?Q?qOHaJ/TVHWcsBh9Xj++B7IY+rpwM6pz2AboWUlMwpwha2K6P0LRS+LTjFJ5Q?=
 =?us-ascii?Q?c1l08zVS/KeGJXkQQID0hwmQmY8hHVpPWmaxuFpOnL0E+DhXJ0TGqsuClw5W?=
 =?us-ascii?Q?WJhVC8qKNBiogqV8jeGe8VuyhLK3oW0JuUhr0alzun1IusA5sxvXiosuDqaG?=
 =?us-ascii?Q?NoGyJQ8dx/1rkTYJv9l8RPk9zKoG30VjNlDDzQAFbXe5wCk08P4zMFU9wN+r?=
 =?us-ascii?Q?vNzdlCvDWTsXqdmmACm3Aw/7V7KvLu28u2eYb166g1Zpt9Va/2tj1ciYhRd8?=
 =?us-ascii?Q?gkveC39NOBoo25E0XjA2A8dOdRrTLI/JIQ612O6TA2Sr7gwl3m77yDGyIhip?=
 =?us-ascii?Q?XarzvpjTFoiNBLnOCemU8d8oTO7ngqXnk6mLvOEsQVA121lwF68QtVL/ry4o?=
 =?us-ascii?Q?7CRr6cjUzux9vSyGmgNLJN4kKZhUZ8IiaODaGDw1wjayZk2gYKOm6tsfOTZy?=
 =?us-ascii?Q?IWnLfpcc2EYUCrHhe+UPuKuTUUfPDTCaNiD4eINXx9Lqu9mKuEXn5aKjsgIt?=
 =?us-ascii?Q?dyD8To64JUEXjDXtYxTigh/0PDPt2Ghm2h7f5lcbUKMeN5cWcL5sLwOnc0hP?=
 =?us-ascii?Q?ZOWoyYBZvStJoxyrMojc8jU/J5HzvfQX3RcSgwMWjWYPRfliAZXJcLCRgWtP?=
 =?us-ascii?Q?gHKWvE67Fz10HMlWOCt19d2yHRgqAcx+iT/eZQGIJ31w+x6Al8FdRVS89D1V?=
 =?us-ascii?Q?4GpYLcWiV+KJJZvUdRe8D0nb5h2LcYgvRnAexSL2ldLp/OtwPvoEPBKEZ9pH?=
 =?us-ascii?Q?tBo8tgzNlG8eOCrq6Mp5jNdRiUgMjCTcsIT2r5Spgh96IfFV32c9c1H7hwQi?=
 =?us-ascii?Q?hhPgdBa8i7vHW1zvQwkKL4v1EmJUQGBVOC3Plej7UmZiA2sNAaUBHaUNx87U?=
 =?us-ascii?Q?uWB+kDVPWT6mNMfa4OzL8AQDxNoodtSEofE11VhvVb+/Pnad/S4YXrUb9B9t?=
 =?us-ascii?Q?Hv8vZoCtg02sbhNkkE9y4qO+RvTT8AeK81F4OELTgDz34Rk2AbL6ZvLwGSRA?=
 =?us-ascii?Q?3wrSk3Uy5WPqduDCejLlLWqFFqsCo8KhbrzOhzkplQgp4wSeqJ2aQNA5M1dJ?=
 =?us-ascii?Q?FmQwgyAQj+pcgze7zkDLEkXCOoKWwToVqQo+gXv6NzVdytYeAy1n5T4XRB7O?=
 =?us-ascii?Q?17CRuA+ryQNL6BzxDKH3AvYCob04oVfSdrtGUdAsN+Zxux5mzTPIKcTW563G?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Pz6LSoHh+GFdPn3AhdFp894iSNl0leiv/qcZdjsLSukoJow/wsrhfSSC7uRlxPD2VLk5Pd07JQIV+uqE5ZBh48jIXPDpHhx8vOb3N300IatN4TCBITAWvfbQqekvlVJ7QZo9iGoxTKySA18B5WSfGK776TI4S1SxR/G2FSEOg8gLoEbBPUVNFruVpMT48mwlU25X2NAtCwsl2XwUTa4dTpcB3kQRw/a8aUmViYYl5ISHAACfw9AppYps0Y6zAZpZsk/RisnXmbAk4JDvdg3eFolTPNLLIP5rbQXm7oPg13zzV29LokIDYycrc6F4jZlMmGhhFhP4DUkuwQEkTqbk8So5JU4a2XT4klGcHN4qxS8HkId30lXBhl17fMhGJiUEmxPxotUe6guZJktSBn3opmqWQEL53s/JETKBCMvTDpxkxfB5nY2E9wmI2Q+Tj5+bD1ZZI9kl7u04aePdO/e95VObOTTYIJmAYLEcz/G4DMbHZW/yRa8FZYI0WbHcueZiskrZbV7L9OSiPovMsUdeLNbLtNUB32sJbZchZm4RzPbx+TC5rusZnrHky5xzRb3cWs6fWf9wwYUkhTC7XVL4XGJBWEv89tOoniAQwfpr3No=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf21f1a0-1637-453b-af2d-08dcff738f51
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2957.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 21:31:37.1587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5F3B7jXYJSiyqQ6fnvpUuSzu6z4+WiYKCsA+0fWyMMiSgbA9AgD8RTBR4iOUcX3BVYd18BewXt9LGYgL1V1ukdmqjsfN6QBGv6jpJRmb4BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5661
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-07_10,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=651
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411070168
X-Proofpoint-GUID: 8FA1JcsJxnfXFpMB7Y5-CKabSkSi3nPa
X-Proofpoint-ORIG-GUID: 8FA1JcsJxnfXFpMB7Y5-CKabSkSi3nPa


James,

> No, my tree builds ... or at least the ufs-mcq.c part of it (I checked
> after I got the merge conflict ... although only with the default
> configuration).

I am not questioning that your tree builds. But your for-next branch
contains UFS code not present in the SCSI tree, effectively reverting my
conflict resolution.

-- 
Martin K. Petersen	Oracle Linux Engineering

