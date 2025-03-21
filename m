Return-Path: <linux-next+bounces-5930-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C628A6BBC0
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 14:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C2B7175702
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 13:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C718227E9B;
	Fri, 21 Mar 2025 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kwrBX1/q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yW8qHqG2"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0A3226CE4;
	Fri, 21 Mar 2025 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742563966; cv=fail; b=qPENAparxtRqVEYrB1MdLZPKDJkoTzfWDbjFYlQLd5t1xyzz/E0nfX+7i5AIfoBRsV6JPXdK9NJo5OPSWgO4O22ApYn5XNRcEeHcPSlR0JMEk1I9+cbWfo/QSdm0QVQhtBk6flQNWkMDktSAZMXdDIsGd+CMs7jza8Oy6Kde6/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742563966; c=relaxed/simple;
	bh=/fSAhNtQpdCS07pvu1moiCqZYgstRSCsulLRrD/T5SU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uwF+CtiAktwoNC4L9jun8MfElpsiUx0SI03PIT3/6sGGs+27uz8TIScEo32C2A1ouUv4myrdkKYnPTa1GgdtraQhZ9CN1mMT4rH9MnxkdyMv/BOM5f4moMri9M/bajPZj8+lQxmuHeFa2E1XR03Cip7u/vJeWxlJOcggAR8207w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kwrBX1/q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yW8qHqG2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L4tlIP030167;
	Fri, 21 Mar 2025 13:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=2nts0gCRNnrvwQAqMaHGGKxTmz/0gircXBci4On6q10=; b=
	kwrBX1/q/GEsnD7UiwIMOSKyY1/Yohm9wkuLMVYpLjQyc/mn4MUjbFRjNp48Iwag
	gmVesua2TPicxhPhbQ9vpk3uSacqLxkvwNiPtm2nBy0ehRjqqB2yHBpJNrv+xMha
	4fF4x7I1OOPZd2npVig/B7rKRvGsW+i/a4qyFN1IO1ZwfAl8eYrdhVt5Si1pH4pD
	RXdSnSwwPZQFuPA5ktAMITr0N1Z8ZoBbaPDmyCGTRDyCecuWVXTl349595QwRkZ6
	rGJ859WIk33Ivw6NqCXPreysIxkNfFQ5Drn5Ax4o2Sf0OKTQXfb58l+UcU9ZIL3c
	wM7awmXe9bF6fcOj7397MA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1kbgkkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 13:32:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52LCauu2009488;
	Fri, 21 Mar 2025 13:32:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxm43mep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 13:32:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uA6VJY7Lwsv3dp+jdEPxubATqQobCL4OB36Za6ahyi3uLeM9zUIEirscO9gucNbeiBZWGuUuSZe4i4BvGBxoNykVq299evXtqe/tKHTfbVjiq13ETXX0M9Pn9z2Z41VImknjaulw0kdVzEIGF9uPxpCe/8CHTKqH97TGHaREqi2L+K48ltEmQus7/EtsvWzzqY+wDUeLew+mM7bzW7m5gsFocPnTryEQFRJehg5LY5r9KMhkNG8bhtTLD8hSpF2XVbiEk7V5+nzKizUNKZsjQadzeV6G+NON1tmvFuGHyNoLHcKyf6YnuZ3kvnwo270rHFMqpkUlbiYLKrhAJSjkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nts0gCRNnrvwQAqMaHGGKxTmz/0gircXBci4On6q10=;
 b=aAhGIGWYZU7yiVUlU7az2R8/FaS71QFMWi+VIMgsu+5FrRFVsOYGcztoQkWk/XPFSnwemVA26z29hYUynKqStUA+ZgxW+bdraASQFEwmGG1Yq4eaLpRjKAnbibTFCF/8Z+IO1spgtJ796iGwwfTzxRhIzxT555y/6OQbvKe7L2I3CaWmwHtXm3SzjOEXo1RsCB7GtOPvUA7xHmvAcWOmDRWTqRRTHjsSQVYMfc0ohs0pimI+dZwTz/RFn0iY0DEToLfxJh0gKxrKMhlaQlWxI5lhTaNwakl9GVTeEGPoATCWUonHfhnvMp9nc2MdYTD/peRVdu9VF99N7odpcQ0KjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nts0gCRNnrvwQAqMaHGGKxTmz/0gircXBci4On6q10=;
 b=yW8qHqG2RiSfpWuazwU3OM1sLH/mqjEBGqcyfhkCOC9LkttOolZhUVccX13/z083s0XJlyaYe/rCrmGtTyntPA+jU+L4clEAMBpVVgxiH1jJENhBl0+8lD9MKFYcSLcU0SfyTuaiGQ68S6S3/gsHPOTYrOYbCBOxFb3vWTFH320=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA1PR10MB7216.namprd10.prod.outlook.com (2603:10b6:208:3f0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 13:32:16 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 13:32:16 +0000
Message-ID: <0c875429-1245-41b7-8573-6b011eb4d923@oracle.com>
Date: Fri, 21 Mar 2025 09:32:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the nfsd tree with the nfs tree
To: Trond Myklebust <trondmy@gmail.com>, Jeff Layton <jlayton@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Trond Myklebust <trond.myklebust@hammerspace.com>
References: <20250321091151.2fd07db3@canb.auug.org.au>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <20250321091151.2fd07db3@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:610:b3::6) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|IA1PR10MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 4554d1de-a529-4924-8a79-08dd687ccbb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUlBL0VzN2QyblhpVjVWTG1FSjdzckZEWXprUmdPUHR6QmZIS2pTOXJxd1hj?=
 =?utf-8?B?S2kyUHlxV3pJV0cvWHIwUUpybTFKK2g1YXR6NzlLOG03NTRINzhjRnM3YlZH?=
 =?utf-8?B?cDBkZ280dFVkdFo4NVNoSTlhWjQ2UGN4eFlJeVZZdEZZRVFhemdqblpNaEJC?=
 =?utf-8?B?QTB2QlBiQmUxZWJDRXE5MWtsVkhjR0Y5bDlVL0hrWGhRZWhKbnl3bFIzbXN5?=
 =?utf-8?B?M2RMQ3RIdlVpUVJXalhqSzlIZU5rVWZhZ3NNaytoOUtlT1RmNmxTeXZtNHR3?=
 =?utf-8?B?OG1aZ2haaFBwUFVrbXhLZVM5Y1ZHTkpPaUJhMnhrU00zRTRSVUg4YnlabjRw?=
 =?utf-8?B?RTlhcFBKMGdSeFFzN1BlS3Ftd1ltY1ZaUk5jMHlBdWJPTkFIdmxOdXBWa2o5?=
 =?utf-8?B?U21uSW9WU214RGxhM1o4OWcxcVJJNEFyMCtBWVBMbEpCK0J1dzBiZDNtU1Y2?=
 =?utf-8?B?aEVjMWdPNFpCRXg5L080eUdWMU54aWNnOWVvNCtGZ3c5OXphWERWeDd0cHhW?=
 =?utf-8?B?NWQwSnlsL0w4b1NIcHpFZXg5aEJIVTQxcXN6em9vQWdFL21Ed08zaUZ3dWdp?=
 =?utf-8?B?OWhXNDlodkprQVNtK1plMUVpUGhJUGtYQ3hhOC9VOVNrKzdyV3llNmdQNmV2?=
 =?utf-8?B?N0t1dFMvVzh1Uld4a01hbWFkWGxTbnpUQ0JDZXF1b2pSREZyOG9tNTBDYVRV?=
 =?utf-8?B?RkNDVEZzNUhJRTFRa2gwaVJWNDNzVjVEUVVtN045MVZUYlB5OTUwbk5KTEZY?=
 =?utf-8?B?cEFDUlY1MS94cERLMUx3MTVwd0tRdkJYb2JickRBd1lsZTd3aStPbmNGVzRm?=
 =?utf-8?B?dXRxVG9GbnZXNG5jWFUwcmFzR2g3clk4eHRtVU01cE9zWE1qdUpDdFdETWFn?=
 =?utf-8?B?K3ByZllaYVkwN3hWanpqSWFMSzl6SnV2MTFZMjhTQVFUejhIY3luY1NKZFda?=
 =?utf-8?B?QTNkZnVOaGhtWm14YmU0QmR3MTgzczc1VjNvdUJhbENBSjR6bDg5cjcrcWVM?=
 =?utf-8?B?bWNZVGhSaDBwVE1XNlpiUEFubzgvaitkNFZ2RWUzNThvTmcxNWhtTDZwWjBP?=
 =?utf-8?B?Wkk2ZE5pWjl1RlQ5VXVIWWlPMERnaUU5VTJ3OEd1eFkyZXZyWHo5ajExMFY3?=
 =?utf-8?B?YzYrOXFUL21GRm9xMFp6MlAycGJGRXRuKzJBUXVnTTJLYWFwRUlKMkF3RnA0?=
 =?utf-8?B?N1NEaG9XSG05eVlDWW5iVTBVU2NDTDl2aU9YOGMybk5GNVRkLzhweC9YWVdO?=
 =?utf-8?B?aHYxNVp6cTJsU3cyZkoxb0l5SFhKS0FRS3lka3AzM0ZJSUNIWnF0TkxyeDhj?=
 =?utf-8?B?eFZuZkRhTS9FVCt0RzA5TWFIQzMwN1UxNHNkZy9DOEg3d1UycmhYaHM2VVpY?=
 =?utf-8?B?blhUWFhhVDRSL0U2bDhqUmxRUDl6bXVwR01yNmpITFl1Yi9tK042c0h4RnZN?=
 =?utf-8?B?NEJGM2M0VkVuTE4zOFZtSlc2aUZhRkQ1M3JtMzlUQVpkSkdhZXB0N1NXZkhG?=
 =?utf-8?B?MkJOalhVczJWb2tDS2RIcHhWeGk0SDQ2dFZidXlSbUwzL3RLWFllNXB6ZW5t?=
 =?utf-8?B?TnUzUXErZGxaV3psb3dNTE1pbnlZNGd4K3V0MkhZbXNGRWxRcTdQNWRiT3pv?=
 =?utf-8?B?R0gxbGlrU3NFOTJFMnM1a3NCOGJsWUNhdDh5QUxxd05nTkdZZUJURzNva3JC?=
 =?utf-8?B?RGJ3NlFtU2xuczkyRlBTbWZ1VUdpVGJzbTlOMGJ2cmhhU0gzcjhKZy9kYlpn?=
 =?utf-8?B?aUM1dFZMNFVWZSt5UFBIWmNwUFkxeWF5cXYvUFZoQUVtak1Mbmh4eS9FeWM0?=
 =?utf-8?B?N1VnelJYK0Q4YU1GalBUWElRVWY4MGR2aDEwVitUK3JkeFI0SDF4RVg5My9M?=
 =?utf-8?Q?yNXVwa21mgVdq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHVFTzQ1dVdicDJndEF6U2tvc2hRS0N1MkZzY3hmWUR2Si8xanlsZTc0R2hP?=
 =?utf-8?B?M2VQQVZZdTQyKy9IUkV3eUhqcGZPczhOaDJERUN5TENwRXFuMi92SXQ3b3Rn?=
 =?utf-8?B?S2ZnVWh2YVhBYUU1amdmQkVmRVZlQklTR1A1UVlYRVdDL20vL3hST2FpT3lH?=
 =?utf-8?B?blBZSkMxS1RKRnM5aStpR2dkcjdXYnlSVW5ZYnB6SGZXV0RlVzRYTmk3d084?=
 =?utf-8?B?bmpQTHpZcExaWnFvbTRod2ZiSUNpRkVmb0dQZ01rTU5MaDVCKzhpS1E4dmFo?=
 =?utf-8?B?M1N6ckM4bnRKOHQ2UmlUNHQ3eXNicVpxTUl5ZHpXVmpKSTB6L3JrenZidzZZ?=
 =?utf-8?B?NlZXSUdiNmtQODJLd0R4cm4wTHN4enBBOC9HdFRnWk9udXNBM203bTArY2ov?=
 =?utf-8?B?MWdTd24vSVAzOEVSdkpxYTk5Ui9uL3Jrd0dpVjRvR01SR21kMjY3VjZ1WFd5?=
 =?utf-8?B?dkpOYTNhZjI0dWlka2EzTU5PaDNkSEEwQXNzMmFuYVZpU2lXeFN4T1MyUXZY?=
 =?utf-8?B?OUZDb1ZKZ1BVdlBzVkl2SVZTV0lxNmFWUWJrNmlqZXArSDJGdEhlRjdqNm82?=
 =?utf-8?B?aG4xbG53UG40ZExuVmJwUFVHdlB1STNLaVpoT0U5cFFoa1FtK0hWU0tPQ2xG?=
 =?utf-8?B?Nmppd0I0YWtMbEp2VzhkdVFPTzhYTjBEVzIzckN3ODlwQ3NnSnB6SXV4V2Nx?=
 =?utf-8?B?SHBCYW9ZR0pNUFlCZTJ3cXp2dmFYRHN6T3ZlSXROcnlsZFpwSTB0UmtxQXJx?=
 =?utf-8?B?RjZDdnpRd2UzcHVwZXExVVhIaFd4TkdWMmNIbjhjTUdjQ3NzZjhrMFhGM1Bl?=
 =?utf-8?B?YWdwenZBVk5NYkM3emZLSnNnNGQyMmIvK3pnbkRSY0JxRVhVb2xuVTE4U2d2?=
 =?utf-8?B?S2p2R09Ma243WUZTR0pNaFFyWXpZbnFhcDI1Mllld3QreDBvUW4xdlZ4Vncr?=
 =?utf-8?B?WmJvV1VKcWlvRU5GczF2eUZiMytwR2U2K2xXSWZaUzlqamQwQ0RzYnkrdGE1?=
 =?utf-8?B?cS9LU3ZSVnV1ZVdWM1JQYk5QblkwVm0xa1hiSHlmRm44am4xMk5JakdmdHRF?=
 =?utf-8?B?Mys1YmJQdEltTzhJMWhaZXJIamJidklMaTFrMlFueUhxU3lGRlRxbXhzWmdo?=
 =?utf-8?B?eXVLK3pFRUxrZFEzZmR0QmVOWjYrRmhTdmFUWlNoaTZ5bThBZjlmRldka0gw?=
 =?utf-8?B?QU9ac2VzUkd0d2RFaUo3cmo3Zm02ME8rKzR5U0hVYkdxdytsL3NlZytXWjMy?=
 =?utf-8?B?dHdKM0JDUnQ5ZklVVm5KVHdZYU1mWTZiUnc0MC90SzVwZmJBMUdPaXVVdVlJ?=
 =?utf-8?B?MHdoKzU0YnRVbC9NazU0amI4RW1nQ3JualVURTdYYkVFNVBLb1VPZElFc0Vx?=
 =?utf-8?B?bXVzZ2JyVGNqTVVKYS8rUmE2dzFZZVhjTS9XWVhsMFh3Mk9ZdDAwK0IycmVm?=
 =?utf-8?B?L2dUTFphTTZET1R1V1lVUGwrWWh5dHUvYWMzdjAxQTJOUG1sMjlTdHpYOFhT?=
 =?utf-8?B?Y05nYnMvbFk0b0k1UndSSjJhSFlFUGlNdWt5NmhJblA4S1NwV2x6bVB4RmNP?=
 =?utf-8?B?ZVpIOCtjSU5kMUIrc2FZUnZ1NXFOS1Rvd2UyNkpTV3V5cHpaZU9zaVVhQmR2?=
 =?utf-8?B?M2UxZ3pMb2VWaWt0ckEzVUtIakYwb0RMWlMwQkMvZnlSTlZOcWZoT1RBR2tZ?=
 =?utf-8?B?YkFFWER2SFowa2R0RWVYMEFmYTgrQkdobUl5bkVRNlZFRGl4VVgzb0tIQUtI?=
 =?utf-8?B?eHJQMDBnd0pxZG1TWE0rbkZ6ck5sZUdwcVpHd3RJeFdZdDIxVWpPQ09yRTha?=
 =?utf-8?B?ZlJ2QTdJQWxnOUdDYnJaRFVzV2JaalI4cU9JZS8yTGcvblZoSldTOVdhcElR?=
 =?utf-8?B?LzdHSTVCM2dFMGxveVJ1eFpPY29mV2hLUGRjejNGVUhxMVpDRmRsYUl2a2g1?=
 =?utf-8?B?R2dvUXdON2VUeENSYmVKYi9wK2E0dHg0Mk9JM2VyZmFLOSs5QVExZWJ3SUVy?=
 =?utf-8?B?NHBWbTlpU3JLTGJQWitaM05FQndMcXQ3dVVYcy9xdWQxenJMYzdtL0I0Lzll?=
 =?utf-8?B?RVNucjVacVczVFdNaElhZ0djdytCRVlpVFF1WmtYajhRNTRXUDlkWEo2TjRu?=
 =?utf-8?Q?otHTRyZNebyqiiW2IIfsgCCPg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lsIbyu63adTr+89ltqrvuzOzYTvicXI1MvPcypDPpzbb+D0aZ76k6GnWboXBuoHTIiNH74nmmqsXihan8pfznOwtNg0r2h58Bkryh7hGkfE8tytcJu3RsstKWuMwbdt5tXLS3jrS/WVYN81dG0PxvX2/aGqVeNikH6MiT4ublGRHLf/An5viej64O8NbxVZrTvk53SBnmEv0KSLeKwxTzw2SlkOm2/tJiqKzIs3k7qzMsIGKffxhGU06eBwo25FgNOq7qYbPiXB9a+hk1SsX3xtcKY/+QZ8lCG/tlz/b35FLFLiSiphUBevgFT+wzjCFPqJLZlsmLBw2kdUi36PQo7TqoRnQybwCxGiLytDAT2LLNSD1MfyTEFnNkQTn0UPevsT+de3flzQJhDtX0rxRXvCIbo71wE5UohdE3lcajHnE0wTT+66NCSxSgJpoveKN5K11CSPjtx57f7/WHWIhbUCnHquAr/btdhx+R/AqXWKDo5Y8G7kOIB/VMYJW0PLYy+jNL0qb3Ibc/ZxjjsYZd0AgQaK934zupx2e+HcXD9PZai1YD5qS2O4aikn/RiW7EMeJvLRIIGJtIfN2AvsgV7eA/7iwtoMTg38Pv7G7ucM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4554d1de-a529-4924-8a79-08dd687ccbb3
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 13:32:16.1003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sh9Di2g1jLOS5xqhJ1YPkezbLWHiniH7k4NpuG49PDGdrrLVeFYAl0qeJ4Ky/72d9GhRo/qkVUuRrSrIujyWLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7216
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503210100
X-Proofpoint-GUID: 5olzTzuA7Ac0DvGyWhoHI73YPF4LOsLu
X-Proofpoint-ORIG-GUID: 5olzTzuA7Ac0DvGyWhoHI73YPF4LOsLu

On 3/20/25 6:11 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the nfsd tree got a conflict in:
> 
>   fs/nfsd/nfs4callback.c
> 
> between commit:
> 
>   11a149e09d58 ("sunrpc: make rpc_restart_call() and rpc_restart_call_prepare() void return")
> 
> from the nfs tree and commits:
> 
>   6c1cefb84b3d ("nfsd: lift NFSv4.0 handling out of nfsd4_cb_sequence_done()")
>   f049911b5b98 ("nfsd: only check RPC_SIGNALLED() when restarting rpc_task")
> 
> from the nfsd tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Since 11a149e09d58 is only clean up, I prefer that it be dropped from
the nfs tree until v6.16. Trond, if you don't want to do that, then I
can include a merge conflict notice in my pull request for v6.15.


-- 
Chuck Lever

