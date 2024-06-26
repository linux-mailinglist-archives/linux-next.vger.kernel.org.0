Return-Path: <linux-next+bounces-2681-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8216C918A49
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 19:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A0601F21687
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 17:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2771E155A26;
	Wed, 26 Jun 2024 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TRo2BHh8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xoT+pbPQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B755161FD6;
	Wed, 26 Jun 2024 17:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719423970; cv=fail; b=ETCMWvIuMHP9rDw6J4GvGshZmJS5X1EOw5nHf85ZWfrhWU+1UKQjM6PARU9K4NNZ5j5fFnuCGP0A/rTw9+0ZuSMBcvkcfsgam3MlIkNpmsCHqcTB01GbRo7MEVRrzMlU2GhjfIpUuPcB3fJm1zwWx3NxT86RsBo/em5y64MPq3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719423970; c=relaxed/simple;
	bh=b8QxiU2SQngp2p1bGvh5tOAJvSqvgkyKUWcrzm7K8dI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Kr8bWPSeilQ+/2oZuuPjXIaVC4qkF4WU1EP9F2A8mfvAiKFe0nEgBI4NdAW5JSV4KQSFYK9BgNaZpAsysXSUMsYvnr1aVheaKuq/iPa4/Wq46Cp38m+m4mWuBy8M/Guy1RX6w0od3vmCmprRalymsRdFBNC5frlIDIQnhFSD7ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TRo2BHh8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xoT+pbPQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QEtVN3010974;
	Wed, 26 Jun 2024 17:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=LCAg6p4s2b2KTzB7JgrJD4eDJ6LCx5WTdpjsbFpONJw=; b=
	TRo2BHh8qu3siei7OO+Tw/6szyGWDxRJEliXUnH+GQvuHfXQkLDJZZ4GaVOer8ZE
	FzAXnJg97dOUl7Mus+oY3lhuiFZfoR3ai1r+JEOPc47MwwXdKfrW1tCQIfUw7a68
	oINp2osx4YUjEIz+BBEs/p+PTl3dgDLkio2XykVF3w8njuwQM8AeyNESMr1eF+FP
	CscN5NzOeZliVgunmPYjlVxgj9gjP5vPvKHsp5467yy953VLUPqRP7hAMUqs5lJB
	FzWPIP/+EJn9tEU/9cRvyCTituazsEp/nzTlRkG9ZU1WXnThqGqaTyGEn2wYEca3
	1pGFoqooYLXymnTgCi4iaA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywpncc8r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2024 17:45:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45QHPKxx037043;
	Wed, 26 Jun 2024 17:45:43 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn29v837-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2024 17:45:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9aLGKof3RFSJ+uub69/Wk9ZcNTXH9fP33yuEN8L+7MCP6Sn+VN+ConwvXo+pEddryxmvalED6+w29AUtnZXlKw6dnLHH58rrwwgFShuPt+VENC3Lybz4P1oYJ2tK2wNGVcBumyn5Himi6fJw71AWSRk55XnY0QoeEugh9Xauy3OgFyxcDKBHYAQqPyNZqyXxq+yux7dOu3CoxsU9SHJxIB8kuazXqiuYRv3jh7gugIrVV69lLhzdpjQC9ydWJxWAmg9Fltk20AgCgPU/KmnQKRm6I+8wkC2ZT2Uaxz4ma+8EZMXHQw9wGhqiQqLb4wBCX8tNTANOLJgXcx5Lmslvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCAg6p4s2b2KTzB7JgrJD4eDJ6LCx5WTdpjsbFpONJw=;
 b=IEk8XA+AF8pv6uTwgm5PtRDsaQgWQhh+wY0wCrycyGObZGWQBVhGQ9ymE4+EsPy/7usGUwpqFzCK0b56f5otpu5IDWn6qXx2qKxrpGmKGBb71NiRlIyy997IJSSdHHUzGCsrEwUAiOX/6xTuUmqTfcFzE44zhtm+FSafNFe8ALLCE2NiPKVAqFRb/odYWmpVFO9raB6p7PS8d6cJ/tz/MV5+wThLaVAwGLVyuL4M4CajgWp5QSGYKUG4AlZg3fdEsWiDY3Gj3FV/Hv1OuKD97YzLyFqh5al/wB6oeDRGJI3th+NGcjjW28dQXh/vmrudqhzm7qMegNB0CE+ZnurghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCAg6p4s2b2KTzB7JgrJD4eDJ6LCx5WTdpjsbFpONJw=;
 b=xoT+pbPQA/+4TIl2PY9dqg95Czil0Q55dFRc2VFPjh61rAQnFStQhB0SR00et1NwaiEwML4pJxA1xghvaEmkHOsDJH+rCBONCAwFQJ6c0D0CGpNwlRZntlewGSbHvjfKlE79AB02EpgsQPzay4kM516iXM0ryAgeGgcN/sL1b44=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by SA1PR10MB6662.namprd10.prod.outlook.com (2603:10b6:806:2b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 17:45:40 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2%3]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 17:45:40 +0000
Message-ID: <ce163edf-6dc6-456b-b1b7-e2f15049a8dc@oracle.com>
Date: Wed, 26 Jun 2024 10:45:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/18] maple_tree: simplify mas_commit_b_node()
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, liam.howlett@oracle.com,
        zhangpeng.00@bytedance.com, willy@infradead.org,
        linux-next@vger.kernel.org
References: <20240604174145.563900-1-sidhartha.kumar@oracle.com>
 <20240604174145.563900-14-sidhartha.kumar@oracle.com>
 <nchlkncjvmkhyw3fcp73defvj2dfd4ylheajlvtcfcvvs7ipo7@3xdxzwaa7duf>
Content-Language: en-US
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <nchlkncjvmkhyw3fcp73defvj2dfd4ylheajlvtcfcvvs7ipo7@3xdxzwaa7duf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:a03:333::29) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|SA1PR10MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: 543400dd-6a59-43b2-79fe-08dc9607cb43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eFJBRnZpeVBrWXVWQ09YaW1Vd2xhTEFYSXR1ZzhZcVkyT2Y4ZHpOTzJNMEUx?=
 =?utf-8?B?MitSUWR6QkwwWWNQc1I4Q2hHdDVBMDFWMHpveTlRSUlWNnFxbmVta25RWnNw?=
 =?utf-8?B?aGRiM2VadzkyQWFJY0haMW5CeTh3cXltUWZGSldIRkpyZDVvNVB6SlVnZ0VF?=
 =?utf-8?B?QjZPQ2Q2eVVJRThCOW5MUHZkbDNVekZzQlNibFdFZzlRYmxGTDVLdWEzOTFo?=
 =?utf-8?B?RkdjTUVVWnJaTkNNNjB1cUs2SnNQTDRXd1plNmJMK1B3ZSs5YWMwcXRyK0Nw?=
 =?utf-8?B?b0JUZU1IL3ZNekxwTjBrNmoxMWt2ZGJiVVNzZ3VaS01IanFQS1g1NGRaU0Z3?=
 =?utf-8?B?UmUwTmJkVzgxSVhFZ0JueElqa3VmaVZIdS96OXVncFY3eEZJVHBwTnVkSk1l?=
 =?utf-8?B?WFpLcFR1WGg2aDR0WlZmQzlJbnE4V2kzVzh2cE5GeTBOMnF4NU5vQTE2VGI4?=
 =?utf-8?B?WWdqVFhxMmI2MWhOWURSR2JQY29GK2hQU3REeUR0YThEWkh0eWVBQ0x2K252?=
 =?utf-8?B?S2FUN3l1cWpNVmY2MkE0aGtEaHVtNnFsQk52d014MEFhcWZkbTZsOWxsT05a?=
 =?utf-8?B?Tks1M3RqT3QwUUFhL3l4dWwvY0lJVGhrNmFDUlZFQTI4OHZQRm9ObVB2R3BT?=
 =?utf-8?B?M0tjUXJmeHFNWlNpenRlUHpDM0FYRktucFJwTlZBWVQwVXM5MGNMK2NyVWlt?=
 =?utf-8?B?ZjN6Y2NrQ21FOG43RmxNRUp1alc2Z0w0b01ZcXdkdCtCRVJxMzV3d3FFYkti?=
 =?utf-8?B?NHVsWmoyalRvUGxXMkNWMjVVSUJyUGpoYzdJVDc3eGxCbEZsaWZ4c0hBaFd0?=
 =?utf-8?B?aWsrdVZUam5oOHR3UWJZSGU3clFhb01oc1pvVVI4anF0MElBclkzalF6anBy?=
 =?utf-8?B?cWtETndlbjF1bzFnNjdaNFNvN0hsVGNFNzhoRmhxbTlva1FLT09QemJFeS9q?=
 =?utf-8?B?aG9sbjNMSlZ4S1E5SUZZUzlkcFFnZGo1SEIvL2FnOTRtY3V2M2NpUDh1TllW?=
 =?utf-8?B?UWRLRjBHS2Y3Ulh4dTRBTDBqZGhSWVg0Mzd3KzA3eDg3ek5qbEhHMG5rNVh0?=
 =?utf-8?B?c1hxVk5hdTc1dlVlWWFrdHVqQ1ZZVGRlZEx5SlJQMnJtaFdtNHFrV2E4VWFr?=
 =?utf-8?B?Nkw0TWNlRXdxM2t3ZURGYVFCSFR4U1Q0ck9adW9Rd2FJMkxFZVdDd0Izb3RJ?=
 =?utf-8?B?czJTeFNIRDFrcVM0YzMzdGwvV2JBbi82Z21tdTVsN0VUcmlleUF4NkQ3TWQ3?=
 =?utf-8?B?VDltaUtZK2NZSEJzaFA3OHVldGYwWitWeVFxV0kwdHZQVmdPdk9nSEJqUFlu?=
 =?utf-8?B?THNoOEhSYUIvQllGS0s1UXRlSlFRTGFmUkI5UURLcFgyYmwrT1hJVGxsNVBr?=
 =?utf-8?B?aXB2b25wZG8vNU50R3Z5cTZTN3Brb0hoNUp1ckM2Z0I3NnZ5ZE5JUzdPUmdO?=
 =?utf-8?B?Q1JENzlpWHBlRytvK1M1YXlxSE01M1BJSmRUWm5hUU1zRklPRnNIMnlrSFFG?=
 =?utf-8?B?R2dBaGlBUEdjMU41Z21VVkNTRmJFVEQycTE2KzZWRjVoQjI5a2E1ckNoWWJ3?=
 =?utf-8?B?b3VsdVVPSnh0MGJFc0hMT3MwWFlKaXp2ZW1Ob0FORlozWXVYTlFnZ1dPSnRv?=
 =?utf-8?B?cXVNN1NRTW1MWFUram1DY0orRWMvYzA5L1BwQUJPZUhoUjJObTBDTkZQNWlN?=
 =?utf-8?B?RGpEMjhnS0VEV2c3OWZ0QXI3T1o0QktVV25ROVZ2bEtJaEorOENhbWpjQkEx?=
 =?utf-8?B?cXVlczhqRWV6NnZMbGRwNW5ZZDh3MHhQVW91N01ESCtwM3VLN08vK1V0Q2hT?=
 =?utf-8?B?U0FqT2svYSsxVndiQzB6Zz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5113.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(1800799022)(366014)(376012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2xtSVpubDZyRUgzblR1ajh0QnpFUms0d3NjZDBacmxJYnZuY3pmY0s3Wk9a?=
 =?utf-8?B?eFd3RVZueXhQQXpybzE3K0lVZjRTNG5iSGVTVlZPY1NpWlg5OE5CTlk0TzRI?=
 =?utf-8?B?Y0N4dGFSUnhheWJSWi9TbG4vbVFNV1dPdGVHc2FNMzVDYnAwVG00czFpVHFB?=
 =?utf-8?B?Ynk1MWowdDNrOThDVWl1WjFSZmxDMzgvRjhJeHJoTzNDaUdDQW5CU2ZyR2Fm?=
 =?utf-8?B?eTBmNWEydDJzYVdlRlB1akZqRXV3MGFOTWtwWmJrNkIvUUZQNTVxVGpSbTFH?=
 =?utf-8?B?UHpBRHdCWDRNWjdLenBtTHh0VFN2ZExaUXVOdFZMVWE0M1JVeEFmdzZmWS9h?=
 =?utf-8?B?OUN6L3BsRXlldGVHN0JZMEQrK1Q3QUNRd0orQWd4anczbnVzR3ozRjNZZkVt?=
 =?utf-8?B?K01DdHRhSHpyWktuc1FjNi9pYlg5Njc3SE84ZUl5c2dQV2dGSmdlYTBUT1ps?=
 =?utf-8?B?YzJ5dWpaNGNoUDFSVnR2ckl0WW9xbHN1S0RTSlJScGltK1ZWZVRtNEYrUHpP?=
 =?utf-8?B?enZwdElKSkQrRFdEWnVMU3VNRzUwcUZFVXU5TGZHZUJXR21pVGFNajNtNi92?=
 =?utf-8?B?cjA4bmlHOWFwWmxhZERTdlcyTE1BUjJqOVBUeTJXWTlHZWdWYzNqNXk2TlA0?=
 =?utf-8?B?L1c4c3Y3c2toSFQweE4xeTlRKzR5RWlaeFQybUxkVlZ4bEJhQ1RXelBCZlZG?=
 =?utf-8?B?L3JSRStzSlk4MU5FMXBZQzd3N2dzUkZQSS9mam1HV0pGMXozQU5UV2pXNWdn?=
 =?utf-8?B?UVNLeWhSRnZvQ2F5TFNqYWtjc1ZLSUhLZSt5MDdrZHYveXZ3YWFDWHk5YVV5?=
 =?utf-8?B?NFBURlpvRTREcmwxZVJmMSszdWlNNWw1ZmVNMkRvU2tnb0hLN2FkdFdiR2lY?=
 =?utf-8?B?SXF3QUdJTGYxY092aDhQM3hvQWtoY1BBaWRRZ2E1VXFFWXdCVXZ5RCtINHI2?=
 =?utf-8?B?UXBlbkgrNWdDRTRGOGduMDhqWkNubUJJVE5UYThyQmR2UExGQ004R1BqMjlQ?=
 =?utf-8?B?TWxCcjVSMm8rY2krQXJNRlhaOTFjckRhUlVadXZXK3JYamo5ZEVjbDFpRTEr?=
 =?utf-8?B?NFAycU11aFBoSVJaNWl0d2YxbktuZ0NXVVN1SkVOU1FLZXAyRDFiaWdLdUdl?=
 =?utf-8?B?aC9sK0c0eVdwV0Vmb2xKOUt4bG9qajUrVjB3cFlweWw0UXg2WmJJcytCNmR4?=
 =?utf-8?B?emQ3aXlqbksxUkNxaG5CRFJOSEh2cUVEUWdkdHNGZ2JJaEpkdTU0bzNtaGdB?=
 =?utf-8?B?UDRldUdnNmtuUmd2a2FBcDJaU1liZ04wUjFuWnRESUdidlFZOHRUS1JWOWJD?=
 =?utf-8?B?U2loQlRmUGY2Zkd1aDIyUS80RzFyNlZHUjRtNk9lUmRCN0syRkFnNFpOWkNo?=
 =?utf-8?B?L0QyWmJITDVhYUt5YmVscFQ2TmI0NVpFbUJxaVVIZFQydHBKY3B5TEpzcktV?=
 =?utf-8?B?bUtpeFRRalRSN0Z4SWlIdHYwVmpPNytFVCt4V2ZIRC9Rd0ZEUzlSSGF4Qll4?=
 =?utf-8?B?VE1CYVNSSHQ1ODkvR0FLVWZXS0grU0VuSFJOYytFbzI0R0VSR3BQdUJQSWNK?=
 =?utf-8?B?a2h1TEhxckxBaUlJT2p3WWNKaWtmV3FFaHlZcUp6WVRWMlAzWVhpRVc4cUFO?=
 =?utf-8?B?UzJUMzJFamtPREFkMjdYWlVoaXFvVDJ1eW9tNlNqMTVmNk42SDZVeGNycE9G?=
 =?utf-8?B?c0h6aGJ2T25Obmt6K1grd2t6S3hTaWJlVDg3ZFJPVnhhZ1puUjdEZlU4VlNM?=
 =?utf-8?B?aFRCNFBkbjI4ZStvSWs2RWlJWWV6ajVmcFhVYm1LMzVkMUtsemZNNGJhV0Fn?=
 =?utf-8?B?WkFLR0NNRStmQURYZENoM2RGb29IOW9MakJTWElmK3NJcEJjVGtTUC9yWFN2?=
 =?utf-8?B?SXZZRHhBMmNjNXlQdTVycFhGaGlTNDBTN0dlbWNRaWxiOENDU0NyTTZXRjht?=
 =?utf-8?B?eE9xNyt6US9xM3V5ekNncVExMXlqZmFjTUdON0NoT2haK0pmUHo5Umd1Q0Fj?=
 =?utf-8?B?cHY2OWdVOWJBaWtxbTgyUjlWZDkvcE1rMGxoZDBDcFJkNUk2dUV6WDJuL2Iz?=
 =?utf-8?B?d3RvTmU3Zk1qMVVVTWtUTmJaMVdHdVIxcUxiczB5bnhBUEF1VFduNjJnelpH?=
 =?utf-8?B?ZlFlY1FzbjhkaVVKV1pOeXV4eTE2WHM1MlFITjE1RzRWUGVOK3dpUzhCbTlF?=
 =?utf-8?Q?x0MocKSawEeDvsqKh0qSc9I=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	gkPWsjtLoT2RFcvSASblOfhmLUtsmXDeL+ptExb44tE8D2igfbLOkKbepiOMYLWJyV4JLbrE4QMduNCXPOeNF7VNaXQi+KdB26o260Hn6KmxV6+Jv5th7yNByD6/Z07MljDvKqBPkac5JyvY+H1YWGa/NzE1wCDqgG/eXS2KpzRBOM/DoGeBOrZ6OsQdNss6/K3QY4igxWB/VDqkVyZaFmEHnQ4CN+L+oGLlP5K48AgoLwsdqtahzDPed4c+dzifgRSDcneTEXTVdicWGl9kR7dXN6gv7jUKqpy7O/DbPbPFT6erZuiT2nKevd97fmmaHphtN1hoh33GoGVH2CAOX5OL9uEySuQhZ4x+RhckW0FJCEN+JmTHO27pZ+/eyeBZsuNJKQoMowom2AnUgBReaQ2PZ7i8ce9KXlvZ37bgH5znI/7QEP0qzFEtosXqPRI0BvHRU0YA09u4BpbsJlxALMpl0tdDZTZw26E409JmRKtWWqYRLndIOJvKUMytztsPEKlm/yJ0FioCACrmc/55OyFKtpEiLF3bZ6Bf7rQ5stbFrUkiHToyrr00xecpXW23/FE2SFZ6ljb818bYgg+N0FYQ3+FwCXDyftN0xdtr9fE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543400dd-6a59-43b2-79fe-08dc9607cb43
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 17:45:40.0725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cp7tvAtfz4952KVz5Ieirft1GQ9QgD1nCsVRJUZIlIVcRW1Wbsf3WNwroGop6ZTG0dIsBEL20tUwA+tyxbDZIe8vvewe4BlotCw9M7pPq+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6662
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_10,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406260130
X-Proofpoint-GUID: 2QZ1Fakm9u4057VtE8S5vgL9Q4i0MxqA
X-Proofpoint-ORIG-GUID: 2QZ1Fakm9u4057VtE8S5vgL9Q4i0MxqA

On 6/26/24 3:40 AM, Mateusz Guzik wrote:
> On Tue, Jun 04, 2024 at 10:41:40AM -0700, Sidhartha Kumar wrote:
>> Use mas->store_type to simplify the logic of identifying the type of
>> write.
>>
>> Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
>> ---
>>   lib/maple_tree.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
>> index 314691fd1c67..faadddbe2086 100644
>> --- a/lib/maple_tree.c
>> +++ b/lib/maple_tree.c
>> @@ -3437,12 +3437,10 @@ static noinline_for_kasan int mas_commit_b_node(struct ma_wr_state *wr_mas,
>>   	enum maple_type b_type = b_node->type;
>>   
>>   	old_enode = wr_mas->mas->node;
>> -	if ((b_end < mt_min_slots[b_type]) &&
>> -	    (!mte_is_root(old_enode)) &&
>> -	    (mas_mt_height(wr_mas->mas) > 1))
>> +	if (wr_mas->mas->store_type == wr_rebalance)
>>   		return mas_rebalance(wr_mas->mas, b_node);
>>   
>> -	if (b_end >= mt_slots[b_type])
>> +	if (wr_mas->mas->store_type == wr_split_store)
>>   		return mas_split(wr_mas->mas, b_node);
>>   
>>   	if (mas_reuse_node(wr_mas, b_node, end))
> 
> 
> This reliably results in "kernel BUG at mm/mmap.c:3412!".
> 
> bt below
> 
> reliably reproduces as follows: spawn "perf top", hit enter twice to
> disassemble a func. tui hangs indefinitely, console shows the splat
> below.
> 

Hello,

Thanks for your report. When I run perf top and disassemble a function tui 
doesn't hang. In dmesg I see:

[   17.836399] perf: interrupt took too long (2705 > 2500), lowering 
kernel.perf_event_max_sample_rate to 73000
[   17.837532] perf: interrupt took too long (3561 > 3381), lowering 
kernel.perf_event_max_sample_rate to 56000
[   17.838818] perf: interrupt took too long (4654 > 4451), lowering 
kernel.perf_event_max_sample_rate to 42000
[   17.840267] perf: interrupt took too long (5930 > 5817), lowering 
kernel.perf_event_max_sample_rate to 33000


but not the bug that your seeing. Could you send your config file so I could 
test with that?

Thanks,
Sid



> I verified going one commit down produces a working kernel.
> 
> kernel BUG at mm/mmap.c:3412!
> [   35.820042] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> [   35.821101] CPU: 4 PID: 1066 Comm: perf-top-UI Tainted: G        W          6.10.0-rc5-00304-g30e5748b1d44 #155
> [   35.822929] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
> [   35.824957] RIP: 0010:exit_mmap+0x392/0x3a0
> [   35.825794] Code: ef e8 02 9f fe ff eb d7 be 01 00 00 00 48 89 ef e8 73 a3 fe ff eb be 31 f6 48 89 ef
> e8 a7 a2 fe ff eb a8 0f 0b e9 75 fe ff ff <0f> 0b e8 a7 b2 c1 00 0f 1f 80 00 00 00 00 90 90 90 90 90 90 90 90
> [   35.829141] RSP: 0018:ff7fe6c8c2393c40 EFLAGS: 00010293
> [   35.830103] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> [   35.831398] RDX: ff39fe34499c3c00 RSI: 0000000000000001 RDI: ff39fe34499c3c08
> [   35.832705] RBP: ff39fe3441a28580 R08: 000000000000000c R09: 0000000000000060
> [   35.834010] R10: ff39fe3450ad5600 R11: 0000000000000000 R12: 00000000000000e8
> [   35.835295] R13: 0000000000003593 R14: ff39fe3441a28628 R15: ff39fe3441a285c0
> [   35.836569] FS:  0000000000000000(0000) GS:ff39fe39a7700000(0000) knlGS:0000000000000000
> [   35.838042] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   35.839093] CR2: 00007efd624f39ed CR3: 000000010130e001 CR4: 0000000000371ef0
> [   35.840389] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   35.841892] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
> [   35.843182] Call Trace:
> [   35.843646]  <TASK>
> [   35.844051]  ? die+0x36/0x90
> [   35.844602]  ? do_trap+0xdd/0x100
> [   35.845226]  ? exit_mmap+0x392/0x3a0
> [   35.845915]  ? do_error_trap+0x65/0x80
> [   35.846614]  ? exit_mmap+0x392/0x3a0
> [   35.847287]  ? exc_invalid_op+0x50/0x70
> [   35.847999]  ? exit_mmap+0x392/0x3a0
> [   35.848662]  ? asm_exc_invalid_op+0x1a/0x20
> [   35.849437]  ? exit_mmap+0x392/0x3a0
> [   35.850120]  __mmput+0x3d/0x130
> [   35.850713]  begin_new_exec+0x4ed/0xb00
> [   35.851428]  ? load_elf_phdrs+0x6c/0xc0
> [   35.852150]  load_elf_binary+0x2ca/0x15a0
> [   35.852890]  ? __kernel_read+0x1d8/0x2f0
> [   35.853621]  ? __kernel_read+0x1d8/0x2f0
> [   35.854348]  ? load_misc_binary+0x1f6/0x310
> [   35.855113]  bprm_execve+0x243/0x600
> [   35.855784]  do_execveat_common.isra.0+0x1bd/0x220
> [   35.856672]  __x64_sys_execve+0x36/0x40
> [   35.857384]  do_syscall_64+0x52/0x150
> [   35.858088]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   35.859014] RIP: 0033:0x7efd624f3a17
> [   35.859677] Code: Unable to access opcode bytes at 0x7efd624f39ed.
> [   35.860790] RSP: 002b:00007efd48bf8dc8 EFLAGS: 00000202 ORIG_RAX: 000000000000003b
> [   35.862170] RAX: ffffffffffffffda RBX: 000055e5736a44e3 RCX: 00007efd624f3a17
> [   35.863472] RDX: 000055e59c315000 RSI: 00007efd48bf9050 RDI: 000055e5736a44e3
> [   35.864768] RBP: 00007efd48bf8e40 R08: 0000000000000000 R09: 00007efd48c006c0
> [   35.866475] R10: 00007efd62430e50 R11: 0000000000000202 R12: 00007efd48bf9050
> [   35.868167] R13: 000055e59c315000 R14: 0000000000000001 R15: 0000000000000001
> [   35.869873]  </TASK>
> [   35.870676] Modules linked in:
> [   35.871944] ---[ end trace 0000000000000000 ]---
> 


