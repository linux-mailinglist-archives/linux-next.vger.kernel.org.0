Return-Path: <linux-next+bounces-6717-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4EEAB48D5
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 03:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 083FC1B40FFE
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 01:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39FE128819;
	Tue, 13 May 2025 01:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EF/eRAM/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MicKeI6u"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498762BAF7;
	Tue, 13 May 2025 01:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747099986; cv=fail; b=vB2617GobHaCTjRzwIMtsJ8PY/jGvJ1BVIwV9jaX0B7GCJmUX6T2EsnF8gd0PgMjjl5UNuGxdoa6poqbBxxYOmrOv1ugUjDVvIYzCLwVkE01IXymyPgoRStLdYCgOtsV7Z2CDt2c6ME6SgrTglu52ZmEbPbE69rq3ewBS85yXGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747099986; c=relaxed/simple;
	bh=WLl1OrY6YDAmeAMOKN0bjM0h9k6IFQt9IPA2u3HVKrA=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=f1YK+49X3qhdPOqZXPyWsGXmElDLpW8xIhDuluSFAIsgp1ese+Bg4cT6PBZfvIv8ZL9qeP3uGR2533dx2ybLY0BQTOyUoOZ6bMYPVEpIfu/3/Yc9fFU/r40h3gA8D7p1aelOFn/WBFPj2+97KTQCsOwVDEdXbu8l3p/ALfJ4CMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EF/eRAM/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MicKeI6u; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D1Bu63000704;
	Tue, 13 May 2025 01:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=VeZcRYRYm4v+7vVNpC
	um7RzsQ4DAy+106yLUpylruO0=; b=EF/eRAM/z+aHgJ/ZHwS1XJjVb3lEGQVShe
	6zwU/loVUy7jlOy1ka+UTZgZRQMkJnp/5lZsJ907gNrApuNAIKEHSzGqVMnG4Scs
	M6QYyLtI1ybsmZKWYehN926lp+ELD7kzUDhkhBqJf8rypn62usYTVI3mt/2tRrQg
	p8d73skYn9hqkDHkmJ/qlLI6WQAoEeAV5ZXSVIT5eUHsG01OI9Hh8aQzrt+m3hqX
	Cpj8KBnCgr4B9b5ri5VvEi06jx3uLxsN2QxY7A9h73pk8YKVU6V7wD+s2WFbii7U
	ZYY2hOLdS+wvVmYrLXJY9y1JVXQBS1bVRzoHVlCnnS0PgFE8krkQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j0epkq1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 01:32:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54CNVaK9022325;
	Tue, 13 May 2025 01:32:47 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013079.outbound.protection.outlook.com [40.93.1.79])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46hw8934mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 01:32:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GM2YkiYGdpfJ8uTUgptOGj4pum0IXJc6dN43gKgcp7X1lfqpTjLTLClpUn36hpD/c3wZRIhdBnO9fRiz4v5JeFVmuerUAQqrTT/ObqUBSZuxQ811Gui9YXmOFPr/7vDL7OJqmwcwfm15NrIbU0teHMVvNOzANaMiJCZCjEOqYz+5UQntrWSob0Z30tEozXdfYP5eAXahWwC9hytuqd16nGMEzpcq1cWwYbY50pUdl1+NQmnbe54Fzqw3BCivMkBDJV1rEIM6BYoJhnWDc8wpv0NJLnTZaqqrd/459Zrd1YOeRNk4vAYYtf3TeAR/RGgwSOZO9xU3QPyWLIZZ39cK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeZcRYRYm4v+7vVNpCum7RzsQ4DAy+106yLUpylruO0=;
 b=IybKTaItsmJdwl31StJqgnzSU5Qy3xvgao5/UrYUcURqZWenN517zd3rHBIQEu9IKBcCZCH9uRC8SLbtQlHntsn1M7PzEaPH0oUkzFaOhjuNErvi7nMmHL2Mh6+cAW2K1G6soi1FxIAggw1op7LZMmOSYUGIJwR4nmJN2joCDQIxYq/XAR3Aa+3i3Ent+BZ0t1rFHDzLlaRgeAYBJgQE2mBkGyK0fPClJrSaY/c1EU52eJ3ch2lrpdTNJPGm2Pab8NgwFbfKrZXGKkxMwT3FZflrzDD1ByDtHbtq5g+3UbqfJnGD5nrHack4dUWWY7MwEd7icb6X+1K0nOZdn/hTpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeZcRYRYm4v+7vVNpCum7RzsQ4DAy+106yLUpylruO0=;
 b=MicKeI6ut/kpqxfwCiufc7NmBpOPYT7nskPw53jUpQsqwQBSVDBD2c2DU/A+eMyFfk7ZxVxeAd3aoPQW9THHq4XHOJfpvQFTl1S30eRE8D1hjTIM/QmB0muN0uBVqlcUUh8tm2ipRRFRO3AFahQrdu5+zlNFSxfWiPeHFx0wwMc=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by DS7PR10MB5998.namprd10.prod.outlook.com (2603:10b6:8:9e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 01:32:44 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 01:32:44 +0000
To: Kees Cook <kees@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the kspp tree
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <202505090931.3467A425@keescook> (Kees Cook's message of "Fri, 9
	May 2025 09:32:54 -0700")
Organization: Oracle Corporation
Message-ID: <yq1frh9s3e8.fsf@ca-mkp.ca.oracle.com>
References: <20250509184846.3c7e359a@canb.auug.org.au>
	<202505090931.3467A425@keescook>
Date: Mon, 12 May 2025 21:32:42 -0400
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0022.namprd15.prod.outlook.com
 (2603:10b6:207:17::35) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|DS7PR10MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ed20e4-d5b8-4353-d6c6-08dd91be0efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B+TBWiM9s8RSc/oFgcLjRfFo455C2HwJsCw0/kerpRUrw1x/xW2u6D9yAW4W?=
 =?us-ascii?Q?VJOHqrLVWzAY+C+GB+GZGUFegWqYsDxSpiRseJp5GBdRL/WLl79JOHtV+tz+?=
 =?us-ascii?Q?XNIEOsO+WfpJ4plJDj6aM5z3ME5e0gB4vBj4HrHwITbzJHTzP/RuxELUKpgB?=
 =?us-ascii?Q?YbQ8IoSpbnrjikAiOqW+eiYtY+LZdHhAq/0t4ByR5xrkYzallVv0dp9Hpdxn?=
 =?us-ascii?Q?a3EUTvDWMy2VrOxD9hxNTASWJKz63TW95hzUGVFs+SQLbqOjzWVN4FsOu9jQ?=
 =?us-ascii?Q?achX6AC9ofKLrRq2xFf45Z6Q3LqopGnaRRc6NiEyBPMQ0MxxULAjFH9zgUby?=
 =?us-ascii?Q?mUfTjf2LxCL3Q8ReGaPS95y1OOabThkEm6vilgWbLlE7OKW/rcNiY+67zuOG?=
 =?us-ascii?Q?799BGEJcRbaHe+H4sO0E4nLyfBH6qoCe6JwJcm3tNY0EZmimCCJQVufgzGJM?=
 =?us-ascii?Q?TJvQx2c0ieTdtbbLS6lD354PwsUjRhPjlwvUoLczgoGpwE7mQIo/ICiGtDsY?=
 =?us-ascii?Q?Pg8Pm3BBGYk7zy2pnNZJLxqZow81tTlPD2xd7xfAMr+PaIxM8KvXsb9/BLyY?=
 =?us-ascii?Q?ifn0Aifr6z3zKtqmS536NBmH410RMUshniK1vUjQuXhJkDLTuFhXhr7lXAhR?=
 =?us-ascii?Q?cr8Qp+q/fZAha5+JWlpaqbnkbs9qxNCQ8OYzDK/EaqCNWWprBpx+cpfLuP2U?=
 =?us-ascii?Q?PrS6BFJGO3jR/WL8gFzBatvRA69YiUN/WmEoG2Uncol4YgzvV95Gyf4YGHog?=
 =?us-ascii?Q?mcwIlaBKBG5qP0C464cerau/YKrhYuMiKzvWKdDicKsHhn7MgW1WLu8hAtPL?=
 =?us-ascii?Q?GqHgJqyWn+ZmqkQSp46cPyjwK9Of1drPeujIbiW+iiI5HOVR82pxuVBwBhfn?=
 =?us-ascii?Q?Fr+ekdzy65Tg6uBEvIHSNGK91LiB/L8TDYDVSLa94/uSrSWdUuq+n6Ef2s70?=
 =?us-ascii?Q?SmFKBbBodFRL+8KW5MsVRftbLZTVuc5MRIQfjvuZAA0G3ns2mpOoms6Qa0Of?=
 =?us-ascii?Q?jl9rSr8/e1UpO1qMgGOEN2pQBnEtDt1TDjRBbguaMJDyQ8tlnsLlNnZJkJWY?=
 =?us-ascii?Q?S0JVlSyK6k2S+51DTGeYmzNSaKjyuewQo7B54Oq8bsEtuDgZhVfMOzxgbARE?=
 =?us-ascii?Q?Uwmhi2IPxs3t7M0qvKbP99eBopl8TH6F2Cnr4Tp9Nd++p8MFxpobr8jfUSXo?=
 =?us-ascii?Q?vhVqbGEmaqRBQZ2GVDKDSwtbkGhljCvHHufgJfDGqiQhNH5ednWIsjf4BheE?=
 =?us-ascii?Q?pye1oHoPE4naROoLXb23G7CNXY/H6vdfVAqhscHHVXMNdQqcPNgGvRqrX34p?=
 =?us-ascii?Q?ubsrcWCyrO8H4X+j3PPs81C1Jk2UXCpO33R903DJcPfOJgj8B/Ku+3l2XC1+?=
 =?us-ascii?Q?QmdQpBKYw50c2anFdAjlW7dg7nCBWuoCtJmXNJ3YGhQSMbNqeoApE605Eusn?=
 =?us-ascii?Q?I3srIuscWtA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3MX3XTdP+z1lRFIAxcVtUda7hJKjWnljfRSX4EZZ7YMRq+zkT8WrDVYzmKf2?=
 =?us-ascii?Q?3V8kfBXq+ktZyhnGwsqYIN0SLcDyTFnCgd6ek+95hPl52fNlgELcCgL4OwXh?=
 =?us-ascii?Q?EXAfgyD0NXQK3u9zf7lICCgLI6MUBiUBgYXPTjKo7mok7bo8/8OHfHYt256O?=
 =?us-ascii?Q?UxYyeuzC9BD168BLnU6Wg7b3Dnep4iG9M2CmtXozjoiHlKFIXvH/otem0ba8?=
 =?us-ascii?Q?bZqUx+g78HVdRxAOBDLA8Ax48EocoErZuD0cqmEkJ8SrZcMrOpxtCBcql+Es?=
 =?us-ascii?Q?LHKHDwPIfUUtmhEAgpicXu/89A438MR46SYDaWzu7WzU565VTIVAntjEYpw8?=
 =?us-ascii?Q?EWs8GO3VNeKXYk/xhlk7a9/VzcNWN2LA+IlbVi6ttaveJoMYLOn9nprePtBf?=
 =?us-ascii?Q?DJHzJDAIEpUMFzddPhkzmd6A1N4AknA1udLXf8xlHG6EBXBQA2x/tkJUbuna?=
 =?us-ascii?Q?18+5SeIO1DErzvjJxLhFQJet8FI+XCFfsfPvCysKUdYm+KS4n9SLJpS10IKE?=
 =?us-ascii?Q?c2WSG3Qj8dzM8P6lPYKwHQ6IJPBxNuiGd2kWzBsHPUXYpW/VZ3QwnN5BpZzo?=
 =?us-ascii?Q?V6QP4j0FyKTsKePM9q8IMJMf5bPVprRzpFrIScpS5ONYSkqV9ceKj+Gdzb2i?=
 =?us-ascii?Q?o/HctdEsLTOtiBlpZqwAs10nSFbXr8Id4JEmZJOI7VVvvZVpCuYaVcBz9FSS?=
 =?us-ascii?Q?7zBDB0SkK8dL7lG+tYehmDt93Zo1DdP9m8fwYSkhTchsUPIPuYkP2aDhVK8o?=
 =?us-ascii?Q?nCPV2q32UBsFT9IY//+7rexUbkmzuzbp4A6okujIe9qkJN9nOZjoQKEH8FF1?=
 =?us-ascii?Q?EGyKIdPbuLHwthR9ez3g/B39OXCnEINcaHgzp6qp7N0YF48Fvh8zrHEmRJbP?=
 =?us-ascii?Q?+pRCY3t1Ej2yJnnHyLUqdbnsdJezRM53eMGJ2MTxOKuB4Ib/yNYjjMOFXy4o?=
 =?us-ascii?Q?UD09/Sic0fICkydpXRfwZpKeDEtqQZkkMaeGRTRdHbCbqgSClC2hzw0ZNhyF?=
 =?us-ascii?Q?tGT1gaaPldCX2OrcvO3zcks9/6/H0C8LJh5FLs/Lz58bndvFpY+IDBrL52yp?=
 =?us-ascii?Q?j7ovanav/pazlEIEf8ri0p9e1N4j8KDFH8xr2NtYVeQu7B5sZ6f/WZoiR7R2?=
 =?us-ascii?Q?tmW1T8E+jXskceu9sin8J+W8MpLYXGTRVmIa+3pl1vPfI2BEHaFrwefOJS8y?=
 =?us-ascii?Q?EYs5BrXtuzMKzXjMX1nKzY8aXK0XGXx3M7+sAjzcExeNAiJB/8xHm980mu8u?=
 =?us-ascii?Q?eKiCVR5fk49v8U43BEFz8vGUvDaoci6RJzX5lOUyMAiSacedqAnruIAWHmou?=
 =?us-ascii?Q?0JqeedZVzOFlZaU0798iOnwgCVNMu244yU/0YxYd7ds6imGCWEpLcGXqCs48?=
 =?us-ascii?Q?y3UcFOlheRwMYi+1s+WTTIr+dK1z6jY/LjKzwr28X8RtsrBQijLESvytj+Yq?=
 =?us-ascii?Q?8GRjEVhc78pSOuFGiTwUgV5ZbSKjOmj617P0wy9A4CkMFoJYTmLl9G/NC+7h?=
 =?us-ascii?Q?C8Rckevma3v5G3VVhl8Wue6wZUhTZGmbIPGJaCSoSOZeiRtvq9NJjGRY2zps?=
 =?us-ascii?Q?67EWJvbuQ1g6yimg8Q8OKqKxXkY22c2YJ5ehPGBWxDxkmukp4qsZhHePIwyM?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j1aUnm0xzR8uhow88cjTeHnEcmeoQxYzmLBIZINmWCWgtcRkg4AivrfYYKCGPgnwn++gQcncUfeV+4V/W6EAN9lcJwuQtEFrmhVoY/B4SqDpMuPL5gbXaT6bO6OA0z2qDSMBrh5MV95UvZWjIgKMyGmhjE5htYMuTJrZeii7MtOTLUqHm4C6UrlA4UCMmBqOYDaWF8A/hh2jc52QCdnoNS5HxfMVZNPw40hWjrkn32SO3KM8QK9iru4R51izpejCiqxHvIKcEiwCsL4kuED3sGpsVttffdkL8pNtuDd/4FM+JEUQe5bdL91o27MgKu16NkhaU2cXJz0AxkUSrBQw8v8VzyS9hOFVeaY4uGrpu2PjyvWJk3/71qE/9PY0NFR5kLA7IliWAet74mYKn63tp+GgglsOO6kqrS2gD62IslhChIu8bg7tCipwXx8gu+jhnWvHG6mDJrXodntQ1s+rt45U4gWf2WwEQliengZSC5yaDOW/MWYddxv40RM5kTqltxP8s5/dpx5MJ+Le0x8x9NFeAlHrt16cJuDZ1OWURWyocJtOvolhiBQeRkESMfpBS156xWBx3cXsYGH0gKmRoJtMlYhLzbKy/CikquuQ0w0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ed20e4-d5b8-4353-d6c6-08dd91be0efd
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 01:32:44.0090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqEfHbdsdDvSs7smZpRV1sIUWZ+hO5nB56ZMFH3fuYYO8yXegf+BSi2iGQ4iP5V6jv/HcD1UqzCrmULT+EDyDPzhYtOoZ1iyC5XK2793y7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5998
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505130012
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAxMiBTYWx0ZWRfX/8esFVdgQGjh G172vHd1iYJDe+q8SUiZOgx8Uk0iOAuC5kM+Mo9IZL3vE8sYfHeEi8Ghwktj+j08Yh4vENMxghz OWrQsNj8T+0zmA1PooRUo8jOKH4U0sYdl8giqTJTmaMr6yZ5GD0HbF3h6/7nVLZkE3SX/hqkt0J
 xGhM1LCSyhVm0IT+rN1xG15EznKEZrIZKynvAnZu+gjavqEL0CZv9Fn2nl01I86R+YvAyOIC544 wPNtXMelOU3sN3XNUWJCbfzVGLlkR3rdO69sfsBGq1jPV9N/6pZbE2JfwEhT1IKSFZ8YHD1JBxM wnItFm7FmgZM3jnr++DjXgNpUL5+xzMd1e5ecjaujRFRJDtPYsdhdGi7nCQr8FMrkOBjpr6eFPy
 inWedjdY6qv1O0c5neXvSvJbFhAVJsjojdk86bGAh+nUW482Wu9miDCxUeiWvfSU3heV4edP
X-Authority-Analysis: v=2.4 cv=DO6P4zNb c=1 sm=1 tr=0 ts=6822a13f cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=w0Zju7iNEvkb610OYF0A:9
X-Proofpoint-ORIG-GUID: BGZRftGSG1i8C0rhj6l3pGjHbW-rvPxu
X-Proofpoint-GUID: BGZRftGSG1i8C0rhj6l3pGjHbW-rvPxu


Hi Kees,

>>   d897dae472f2 ("scsi: qedf: Use designated initializer for struct qed_fcoe_cb_ops")
>> 
>> in the scsi-mkp tree.
>
> Yeah, I am carrying this and the qede patch since I need them for a
> clean build in my tree. I might need to split my merge window into two
> halves if I need to drop the duplicates.

I can just drop it. Your change won't conflict with anything currently
in the SCSI pipeline for 6.16.

-- 
Martin K. Petersen

