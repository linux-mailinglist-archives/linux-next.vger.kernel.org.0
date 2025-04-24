Return-Path: <linux-next+bounces-6372-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E1BA99C77
	for <lists+linux-next@lfdr.de>; Thu, 24 Apr 2025 02:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9CAA5A5056
	for <lists+linux-next@lfdr.de>; Thu, 24 Apr 2025 00:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64E417D2;
	Thu, 24 Apr 2025 00:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FY9D+/al";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mKGOmLi7"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D440980B;
	Thu, 24 Apr 2025 00:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745453066; cv=fail; b=NZGhkVkPKYOhtN0bVNJNl610o7GRTKB/tWjrLtFUkcCBlNlKYaO7DyUypnNgFCPTvqvt3MGSUNoSXF4ML276ewIE2vkRtMYCoROlehhmS4ezF22CZGFHU0KgURpHRezi1zLQ7mIX4+osVJc0jP9FjVW8N5DIOpPqE0xiQ7eCdGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745453066; c=relaxed/simple;
	bh=dix4VCwt+xn4DatkESu/XZih0fXnElepZXvUoCJWfz4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qu4GWUlmUenkCkYAhXTmd7QUZ9UlLPv2hJdb8zfaVY+nLfFBn/p7Mz5DaW/NwwvuHu9d9YwB2IDkkEpnpBDMUT0k9I0biO5I4JOAfgnqQ0dJKZcnKUMXfDWlztkxfi4KHwmANwRpFG33KZi4D9NMVzIRP4yFA1hWsZU6kk6ouD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FY9D+/al; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mKGOmLi7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NLNB1S014981;
	Thu, 24 Apr 2025 00:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=BXLfmBDKiXtqESStLqxRLtHtxwDFnx4/kaR6x4iHTPU=; b=
	FY9D+/alwsJGIVgiF+bYdSG4Mt00wZ7uUwUOJ/83CELXf9ye/nsHy32MqK6FVSRb
	/KPuaVg69GcaC0pplTbBrjLnR6JmbVdFKb435iEODDH8KNj0+fHKbSlbJV1EThCi
	Zsg+5fCh4Bl+DTCCeXmooiZXMzrAgueiy5alRNocjiNpJDDAFIi/Bvzd/KcJtZdz
	2VSloIAIdNMHzqOfgEvXxlO9wjrdpwu9LaPZyVJ4/5cB+caa0eVixqPtVnGtwwr7
	LPbP7aWUxd/58e2PenEjZfYNz1bxC/ROLMEGVgZpxewVeIAq1j22yZnFVjRYK1PF
	kQAiriM/0c3oTxMs/q+cig==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 466jhdjj14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 00:04:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53NNmCId039970;
	Thu, 24 Apr 2025 00:04:14 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010006.outbound.protection.outlook.com [40.93.6.6])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 466jkgbrxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 00:04:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrdE8SG5ZyMVnS6bNTkpidTWWWFgjrff3lgrfRtVNWsChizUvgD3OX+CxYsZs3LUJSF8oEYhD75Ha6DCTjBtLTJuFkitqCQ3w01UndFdFFQ92cv5nMZJBHMgqmMBIZP3AJHAXuI1bWisgAjfJKBktKvvNLo6vNVXiH/aHrz2PikDPGj01UZ06m/3StCJGV8F0O+0XUoEZrJhpuV544WkOPoycSWXqVQlw4y7mgJfYySfpi4dn4NGRTH3ZaZ2I7VqU+7+UvSxU0ZnwuvaAg8xe8Smn0DrNb9VyLWJMKpPJBIWtBIFWWliAYgMIpis60Q/cicJqfSoECG8QZ//cYfNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXLfmBDKiXtqESStLqxRLtHtxwDFnx4/kaR6x4iHTPU=;
 b=c8R58nf9+f4g9N2mxUwD8xR5hNkeUlwrK/A++2zMwAtCIfYYwosGhHZLS31XrY3wZKXnnjqYp3dlzTwvu61h+mBmISgssNVrC9cWVHrGTQpEia544RuO6j04tcorvPhzZ3AqJbVqHv1nOKRK024th7pzsNtSLc2j5MtrHXc/0IV/xhYeUQ6qd2eCu9zE2nJsK2+jB4ftCB/SlW8a6TA0fhbmIZHqLwihX4ZcSp972Qtrh0DnH3pCPlYPBbk6sIzE6VSIPnFirKxMZKT3nHM+fWSOWyvFKM6uAfpcK1wUMOj5ZJMN4GIkyfjZzT/Ala+T1djKGMl8cYlLil332d6+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXLfmBDKiXtqESStLqxRLtHtxwDFnx4/kaR6x4iHTPU=;
 b=mKGOmLi7if5Bj+O17AtSOLeS/rDStmLJgnWrWcJtfdPyadSV4MUFihQBqlBf9MsyZnwiLhFlAroJS0Fe+/hTs31Xi9CphZNAmIgkb6st3rStveLqXwzkttT6GAhNVWwucVDG0/O+lZTn6DZ0I5r+VHFzgXdvb+9J+GK5tlZbKw8=
Received: from MW4PR10MB5749.namprd10.prod.outlook.com (2603:10b6:303:184::12)
 by IA3PR10MB8637.namprd10.prod.outlook.com (2603:10b6:208:577::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 00:04:11 +0000
Received: from MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454]) by MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454%3]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 00:04:11 +0000
Message-ID: <5c93dcbd-2394-41bc-923d-5902f4d5aa9a@oracle.com>
Date: Wed, 23 Apr 2025 17:04:08 -0700
User-Agent: Betterbird (macOS/Intel)
Subject: Re: linux-next: runtime warning after merge of the mm-unstable tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250422205740.02c4893a@canb.auug.org.au>
 <5628676b-e1ff-4570-a1ee-c87742e5363c@oracle.com>
 <20250423091656.6068c090@canb.auug.org.au>
 <20250422192816.03eaac09@batman.local.home>
 <20250423102903.37f9d07c@gandalf.local.home>
Content-Language: en-US
From: Libo Chen <libo.chen@oracle.com>
In-Reply-To: <20250423102903.37f9d07c@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P223CA0017.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::10) To MW4PR10MB5749.namprd10.prod.outlook.com
 (2603:10b6:303:184::12)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB5749:EE_|IA3PR10MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: 854ab61d-11f6-43f1-0300-08dd82c38a43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmlCVnRaVEtrZ2lVZ1NOR3pzSWtUdnVtNjFzelRmNTJ0NC9BWTQwRlJuenMr?=
 =?utf-8?B?K3lpL3pJbE9qL00rd3pvd09wWC93aEFIWmFCK1VFYW5yTGhYVHdTc1k0N2xn?=
 =?utf-8?B?N3ZaWFc0NlFKMVFsTnVPOHFmQlNMVk9uN0IrT2N1YzJGY1UrZ2N5ZFNzZERI?=
 =?utf-8?B?OW1qRTVVYjZUMHo4SUUxa0FKdWhpaytPblRDNEo1OXNuellwWDNSL2pyek10?=
 =?utf-8?B?YkJVRWZ3MVl5V1VNNituYmQxYVZibENTTXBIWmwwajBUK3JMQnJlR3hnaWZ5?=
 =?utf-8?B?QXJrYjcyclVmZXh4NmhxdDN0azdxOFRGUEc1ZkZINm00NjJuTFo1THhJWG0w?=
 =?utf-8?B?NFE3OHFkQ04zeVFFSmRZYXlLSDFickpHM2MvRW44WTNTV2JoeXVERnlldEs0?=
 =?utf-8?B?WGQ0N3ZUdWJ4MG1Jem5HdW96VXFVWDhCdWVyTGdnRWY2ajBGaUU1MmkweWdE?=
 =?utf-8?B?RGhtOHl4bGF6cnJxeDFIZTNZTC9JeEpNOXJad1dPZkhVdFFsWjZQTjVsZXZZ?=
 =?utf-8?B?Zm94Nk1kYVNSSElXMjlzOFNORlFXYU9raGJyNVVhTEFvY0RycWEwWEMyQndm?=
 =?utf-8?B?QUZhU0xiUThNeFFkRUQ2dEdhbXBaM1MvbVRsQXg1Mnp2N2RmNkYyM2NTMnZ4?=
 =?utf-8?B?S0RYYnlXd28zQ3FaWVY0Ri9vdHQ5YTFRSlJ5NlU0SUZYc05zNWxjRENPNGdG?=
 =?utf-8?B?dHhWb2Rrd0p3eHhqNHNETTJTVmh1bkh1Y2xWeW53TkE2U2kvOHgvd2Z1MkpD?=
 =?utf-8?B?NFVlS3hzODB1anliU0Y1dXNkVlNxYW5xcFBBYlNobWJSUWY4QjltV3JGdTVr?=
 =?utf-8?B?eU1FYkU3dnNGdmp5aFZWeEJPYnpMRThiL0xwbW9kZ2pvUkZGQkFOVWYyOGJM?=
 =?utf-8?B?c25zQVF6RnZCSWxRN0RSWHJtR2hGQVBWbWErdkM2Q3hkV2dtVVNEdVlEbENL?=
 =?utf-8?B?YkdBamJ1OExCNFVBR3Y2Vm5ScWh5K0lYQ0UybitvVm9HUkFFZXRuRWNjaElx?=
 =?utf-8?B?aUpuZVlpcWpjVXB1K2hIN2M2UHBYSE5qVEFNekNuVzVxSlUwS2tiZE5vTVpq?=
 =?utf-8?B?TkFhTTMzZ3UyR2x3aHpBV2VNbUtZYWpqM1hIcDVnV1dTQkVsOVV2NzNMT0Rz?=
 =?utf-8?B?WmNDdWZKZC8rVmwzc3dQQWR5K3pnT1c1VitZWDd4L2IzR0NBdXh6SWJNTjIr?=
 =?utf-8?B?Z1cwblhwTWJPSUZReGZnVGdBUEtQZjJjanlVQlVLeWkxaHgrMmtSbDA3RGt3?=
 =?utf-8?B?ZjgyVTc2TENDR2ZLeE5wN1U3WWFBQm51OGlTcy9MQ1NqYkJyUHBBaTBuenVr?=
 =?utf-8?B?bk1KN3oxQldPRmVxcUVmOEYvTXVTWXlNaXJPOTdtbDJVQ1dVaUE2czFjMXI3?=
 =?utf-8?B?WFpDZlp5UDFnN0xCTGEveFVpUmNmbjRTanFhbFlIMkszRTBBTkhVRzR0d3hp?=
 =?utf-8?B?NGtEanBDdHFXaktYalFvbzFvRktjbzhtOStIQ3lrVWxvUHh1RWNJRzNzWGE4?=
 =?utf-8?B?WjJwdWdiRVFaY05FWEtkc1kvVVMrQVJrWGMxOTRZU3d6VmN1Nnl4bnhRbTlN?=
 =?utf-8?B?UzFyOElYeHRoN0hFOUR6OEdDN3dlN29OWDJLcHRmaktCd1B6SFZSR2pmRzQw?=
 =?utf-8?B?TmIrbDJXbE1LOS9EQTdVemJKSVB1WUpqZXRrMGNHMXdMK2xrQkc2UXNlQ2V6?=
 =?utf-8?B?WTZQcERnVk8zQmFoZ0Zuc2xxL055SmdKMUk4dVh3WHZHMzZVRVExTzduRTh6?=
 =?utf-8?B?MStXNjl5UVZEMlVCR21SaCtVZUx4T25adG94UmlvMmtyUUN3NnVEKzhQZzBv?=
 =?utf-8?B?Y1owbGNRdElIVDVINWtiN3NFM24yNTh5cllTK1J3azAvTUowL000N0creVhK?=
 =?utf-8?B?dHFHTDR4bFNZVWdWWW1TTDIyblhBd2p0ZHNUL29xUzVncDg2ajZiOUY0Z283?=
 =?utf-8?Q?M62yiX7/GnM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB5749.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjdIRjdGaHZ1ZWFoTnJmamdXUCt4ZEhVWEliNWRLdmtZVjl3WTNoQ003VlFB?=
 =?utf-8?B?c2JDZjFNR0VVRWxWQm1xOHMzN3l5Mk5GRzNSbnJkNG5CQ2dqazhvVmNpMHJ4?=
 =?utf-8?B?UDBuY2szb0w3djVwNXNBb1RIR3l5YmUrQmVIVFFnWFdlZktWYWVPYjQ0VWZ2?=
 =?utf-8?B?YUNObUhVUkdoaGg3dGhwb0QwSDJOcG8zdHVzaW5LdnZrRTJHMHlVSkdtam1t?=
 =?utf-8?B?c2x1WHZVQWNuY1hmR1Q3K01rdFgxVEtwQ3M0Wm1pYjAzbGhNdGhFcHZQN3VT?=
 =?utf-8?B?U0NlQUlZelA5UzdmMmhaT0RMaWRBcWJIbVVBUW51MkN4UmNqbWwxQ25YNEt1?=
 =?utf-8?B?QU9MYjFHNzNNd1doTllITVliNldhUEVBeklqWFVQazlKd2ZBNEt4NCs4ZjdW?=
 =?utf-8?B?SGNrNXRSN3ovWm9PYjR2dk0vMWdaVlNIQkJCVm9KcG8rcEZiRHlBT2xrT2Fp?=
 =?utf-8?B?R1pYTERKQmI0REVxbWN3U0h1SU5UbmU1Mjh3QTAwVE5oaGRQUUtuUTBQbkFn?=
 =?utf-8?B?L0tTYVlqbkVBSjMxSENUQktYM2VkaWxQaW5HMExxdVpGdU1kVnQ3anhudEEy?=
 =?utf-8?B?U01HcXBBMTcwa0k3RGgvUFJpSm9YeGRLa1VBYkVQajNLajkrY0FLL1IwYnc3?=
 =?utf-8?B?Z2xsdloySzNKMHJieThuSXVoTDdpOFpwL0Rnamh4em12TVlyQ0gvOWVjSkhi?=
 =?utf-8?B?aUxjVmkreE1qRkQ2eFBqY1FXcDZJUjdzdnBFc3Rydm40MG00KzZva3NrdDlx?=
 =?utf-8?B?TXZ2RDcwL0hBb1dITDZ0d0VxUFF6YVFZS1NGelU0UHBGTFpHSS91cmMvcUNt?=
 =?utf-8?B?UXIvYUxKOHV4d3B0R3MzaVptZFo4TFVjc05ZTG9idmllU2RzYWZQTDBRbHVp?=
 =?utf-8?B?K0lWblNFMSsvNlZ5ZUt1aXY3aTBtTnE0N3lCTkxzb1dnZjRKNEtCVkkrZWI0?=
 =?utf-8?B?dFBGRnNkRHNka1F5b1hKUC9wN3Rxd3g4cjJDV3lZNmpmT0VmT0NTY3B2aHlZ?=
 =?utf-8?B?L2w3SFFHVWhHc2tTcVByeDFzdjNScmNCNkU0bnl0UHJRUFB1UFVUOStVZnZv?=
 =?utf-8?B?azlKY09LMXIydTVUd3RPT1E2NVlBeFlGTFhiSmh4b2VjVjA0aFlQM0xYY0M3?=
 =?utf-8?B?SWRZUFR2OGlBclNKY285VzBSaS90d0pjeGM3bW42VDl5L29nZE5zU0xhOVNX?=
 =?utf-8?B?UUJFT1JwVHovR3dnNG8wSllYQlIxVVgyQmphN2JLWTRvOENNN1A2TE5GZlQy?=
 =?utf-8?B?bGlrcnNRTng1dkl4eVlSN3JOQ29IUXY1ZTgwRVJEby9LZGJSekFFSWhSaWNu?=
 =?utf-8?B?Qjk5bllFd1NlaDBqWS9aYklGdFQ0bUxFb21IMHVzRXJjeXMvbkZKeG5ldHVZ?=
 =?utf-8?B?WnFpYUdObzNDbGl3WUFqZWdicHUxdlN4K250bkNKdXRRUElZODBVSlhzNnhz?=
 =?utf-8?B?Vk4wY2EzbXM3end6VzBkOEtMYUhRZ0MvTnl0MXdULzArOURhcFBGSzNQaWlQ?=
 =?utf-8?B?TUdxRy8xbUZ3OVJFUzBSVnFLK3BVYUllWEd1bnl2RXE2VVZYbkxrR0J6ZEdU?=
 =?utf-8?B?dkRza3M3eW45WFJzcGNycUZKd25tSDc4RzhpKzF2VmhUQUZkckM3UmJ0bXBR?=
 =?utf-8?B?OStCUzJ4UHVUZzlqeldZV1YzMzJXTDg1QzN4TlQ4Nm44V3FXNThXVWduRWNQ?=
 =?utf-8?B?VWsrYk00dWhVNnk4d2QrcmIxdHorTlNPMG83UUV6b25HNFJ0aVRaUUQ3bDJW?=
 =?utf-8?B?Z2krZnhiK0ZqWGRIWG50SkxTSThYZE9Ec1M3SjQwNVcrS1dPa3UvVGhBdmFF?=
 =?utf-8?B?cjdYdzFCMDJlQWkyV2grNHd1R1J3akNVc3E5QXVUeTR0cllSS0pEaHJhVzN2?=
 =?utf-8?B?QzAyREpndlNZN0UyVTJlTWFpdi9Wdk5BRjdoNjB5TFFpUzB5UEtsSXFVajVv?=
 =?utf-8?B?Z3h4a0NpOTJiYldZT05lVmxlU2xnekhRdU81aUFBNXdsUmQ2UFFJZVFOUVFk?=
 =?utf-8?B?YklOeEJrNzMzS2NyUDBQZkl5eUZ0OVBrSmxESW42bWRXZm9LOHB0bnZKZUVN?=
 =?utf-8?B?NXdLcGl4aXVVN2lDa1ByUHdrMERFZGM5NSs4eEt2cjFIeU9FczVyNG5oU1N6?=
 =?utf-8?Q?gzxR9OF2mscQIFj0nUrEzWUPL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ka7ynU36kZYXIcVRLGHEauYXjOLBp9a6ANUywRIvxpZ3AcEIw02bHe1+cVz2nMbM6QfIqr+w2VsAn78IOkpqsGROHe5lxkVEggAuHJAhHs+Y8YNcSst1YYYo7Y9eY4GR1aFDovydkh2+xEycqG9MXhil8jMPur4D9QXYntMAhyZD8Z+6OswYAth1ArWix5EykJaO26bIz8qIMTZqf69ePPRj8wKpGqvjOa+wYwv75p0857aDntuvXUbw7JgXOUTxAYcC5rwv14YijTMY/IByW8C+fqLVZ75bYnWHlK0DRGly1ouS/iy0kJFB34laStbvV35mrrUDOcDvUAYThakV0rNGcsxWDqkKc2Xnu2ZSvgviIcYz+dW0uG+XIGfOgyH4d6vnFb+tX0rSNe96W6W0JEMupTEJeIXe1U7wCS1mxKxZvccse6rPHhWPpyOaafQr5FwmcgLCk4N8y10HcVunk9Fv9FSvqUjUICVkvQZv0GEHogGsU9bsyeEfucysU0K+QBC5ToJvokC+32BkFQSa/NuNAOH8kFhoNZdpAOtBxQ0LoOVRU2rt4t2CpgV/J1fwbmw/cZHmC/WKzD1UMNqzlyodf3yUZ0E+Ib9Ie+DOUfs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854ab61d-11f6-43f1-0300-08dd82c38a43
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB5749.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 00:04:10.9329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsxZa77e8uEvJhZcf2dLZsiOX0aBbCst8h/7vnUwY8G/6QLqKsXPuPQAnONU3re6pIZgk9zPJo/y9SrGlPLMQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8637
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_12,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504230161
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE2MSBTYWx0ZWRfX9nS+ktZHgMP3 K3iQedpvSuOd7IvZD+q9DKteiNuxCVHjVWAu31/LNtjNGktG0RSQQzXvggiljiURRyPamUUr3v1 FaF6OoFyhfEUO6NnATBdNUJ/AkEDYUzK0ZxIYC8q+M274VLZkwUGY9R/Li543601NXIolGHOQfl
 uRf6tJHVz9ULDdj/hUqhZwgyj+fWEAJ3r8dqaTu0WR3hGU1cmhf6btV9kHAKDc3od4LyKmBixrc vwxfzG5SipDi825TEko2HcOWRbfLcUM2rFO13j3i4ec/t9AsvEcxXY9o47fM6xbLkxfN/RMqWCF 36wErvGAw9/9KO+Soblbni2IWGUo+n1Lst/TOD44dRmNilM/rqhwaE1aL+x1q+JXOT6TNQW9UJG unfSA7A6
X-Proofpoint-ORIG-GUID: ceKPoYTJVVciDUqTRHDaBwa__sn3OvWa
X-Proofpoint-GUID: ceKPoYTJVVciDUqTRHDaBwa__sn3OvWa



On 4/23/25 07:29, Steven Rostedt wrote:
> On Tue, 22 Apr 2025 19:28:16 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
>> On Wed, 23 Apr 2025 09:16:56 +1000
>> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>>> On Tue, 22 Apr 2025 11:05:10 -0700 Libo Chen <libo.chen@oracle.com> wrote:  
>>>>
>>>> Just to verify, does the build have commit 'tracing: Verify event
>>>> formats that have "%*p.."'[1] or not? I do see linux-next/master has
>>>> it but just want to first confirm that.     
>>>
>>> Yes, it does have that commit (since it has been in Linus' tree since
>>> April 4).  
>>
>> Looks like we need to teach the verifier about nodemask_pr_args() :-/
>>
> 
> No, actually, the verifier found a bug!
> 

v4 is sent, should fix this bug~


- Libo


