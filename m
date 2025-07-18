Return-Path: <linux-next+bounces-7622-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FBAB09DE2
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 10:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 960357BE404
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 08:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9A02222B6;
	Fri, 18 Jul 2025 08:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NoW9KpIo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VbU4NvDi"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C856B221FD2;
	Fri, 18 Jul 2025 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752827249; cv=fail; b=jFSiMmqKOkVH9b/jTitEPXy6tMtDOAbl9hvKasF68zPc0gbDycxriLtV5UpxtX74ha+OhDoN8MUKzz7FhLBnNjJIT+TSFiqBEsZpmAJOiL5MjXfJflICT4sX5kytbAm4e6WEIanXNF+WwMgYjMQpgDasmviHGOY1PR73vlPu66k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752827249; c=relaxed/simple;
	bh=s/R+LgxztNo0G/gwLVc+Si/QFAfGwaQX9p25u3xvH2c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m2w399nR4xQAusx7HdfilXxcsZL4hJvZtC+kOzCJqWzZQ7X4gBEHNvA/26+hwo5XD84gjHLLPwlsiodVR0qhuLF22LpwiXM5IktqQElzFAIKeC+1uxxdKrWkUY0mg+Vn9EafJZVUOXQ9Uj7hGTIoHwFIpsvy2qnGnYk13zMOsYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NoW9KpIo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VbU4NvDi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7MnS1010568;
	Fri, 18 Jul 2025 08:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=0mIXJu8XzQDEdXvEN4CfS7wW3M83niY/0ZPnrenfrbQ=; b=
	NoW9KpIoRqPznYQrSSaHXrKTqUUySZTLmvavwszDzb9cLqe8tPWZxJQCyLgqxp1d
	yVXSsstKP/E+4ps5HLf5KaQ/Cf3hlKLwu1D1okL+agTgFJXAibmO55hlGsIB7Y0p
	ADCZa6Vo7NGKGT/9tGs+qenbST5+linl4sU2n103cKzvqbKQgBls4a9CEAsNsLBm
	7ZdCVDYNQcgyHBZiOuzoN8YXPjAVcS0iPm/eiu1khTksc8yZXWCK+F7tzfaEUGZ0
	f4KXF6lt2dJEpdbsgh14AhwS1IRVs3p3rfCJ8YnvCEYvFGiVePosvrDUHu6sY0+v
	VmWp4Lg+8qTw9F5f89kj8A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ujy4vhsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Jul 2025 08:27:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56I6cW9h040544;
	Fri, 18 Jul 2025 08:27:02 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5due06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Jul 2025 08:27:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhWJtKpRAjGQbjyFY8A0SHzOV2Sbh57fsYeIr4kLbEqYN3geTk6la7nYtQNqQtd/Zpzwec0Bb6YZB6TA1HiNpC08nN7spRIZKNr5KQoGmdi57e7mGzDfcIZHbDI9JVqH1kgmom929awtckhnXbqs+kVTNmpzsWPNVcWEaHnbuW7DqFc7/VKLzY0o/xeJqOcWDtdPb/6fqCKkZCG0F843jCV+yywQjfue3N8vWtPIQ9PkveliQ/youovtnYdgZ/Ru6iT7AUOGvejulsZiN4xKAs6V8QjvDTi/URT7xdRR9cT9tURqjcgrviCMZae9DCiD4E0tN+rNVG8N11l1ng5ZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mIXJu8XzQDEdXvEN4CfS7wW3M83niY/0ZPnrenfrbQ=;
 b=nyqcVbxmd+U076DJFEVvFpy62YZyiGSyrpDtrCfwqSmnZiYBfLPjRcS3lrcJ+2tvFlSlAr7SWJOJ9ujmBqm45ge/H5kSuNTYESb7NTl+tsFenlk/JXm8jG1vGQuWIgFsoXs8rIl8a19fHtBfI9broz0MtlIoaUJI8IV3qx+7frZm8UG3yAxNFfkamGh9pVFTO+67y6VVqPg5tKlhFSfEjMZn1T9OxIx3/CQQtaXnA4OCe3XVCjwVc8QkyyzWOLZz7cLPY4PzIbptOuaNiP1x1lKGGXy40F5Vw/4ShrVuvborwJBo4xasH6gNpqvBSXFW8v7jYjfpUkdxFpDGb39BIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mIXJu8XzQDEdXvEN4CfS7wW3M83niY/0ZPnrenfrbQ=;
 b=VbU4NvDikAX6S9FGmNoCFfgm+tQpbfDLJz2z7SXTRPKanntzS4DEFOSaVx08aW44bLJr0gF4xFHa6FG931gFJzD/xjmSdBkjrwihQxeZ1BteGz/IRn6dRptPGxEkH2rupieDXbTP49164+BxGhRDS1NiQwHofwfW0WNbHY7vFpo=
Received: from MN2PR10MB4320.namprd10.prod.outlook.com (2603:10b6:208:1d5::16)
 by SA2PR10MB4652.namprd10.prod.outlook.com (2603:10b6:806:110::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 08:26:59 +0000
Received: from MN2PR10MB4320.namprd10.prod.outlook.com
 ([fe80::42ec:1d58:8ba8:800c]) by MN2PR10MB4320.namprd10.prod.outlook.com
 ([fe80::42ec:1d58:8ba8:800c%3]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 08:26:59 +0000
Message-ID: <e08722e5-d5b8-41d5-92a2-f985a875c24b@oracle.com>
Date: Fri, 18 Jul 2025 09:26:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the device-mapper tree with the block
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mikulas Patocka <mpatocka@redhat.com>
References: <20250718151045.2c5bfe6b@canb.auug.org.au>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20250718151045.2c5bfe6b@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::14) To MN2PR10MB4320.namprd10.prod.outlook.com
 (2603:10b6:208:1d5::16)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4320:EE_|SA2PR10MB4652:EE_
X-MS-Office365-Filtering-Correlation-Id: c2086764-8e2a-4bfb-a93b-08ddc5d4dd6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUs2SVRJT2Z1Q29JZHBjNWZudHd5bUNuVEhuZWtVckc2WEozQTVSZjBiYU9Z?=
 =?utf-8?B?dC8rWFJtbzR2QXlUYlhqUVRsUmJwNHQyQjVrK3BEWlUvdXZTRmV4WEdTMmNJ?=
 =?utf-8?B?dmo1aXo4dW9Qb2FJcml6OVlEODRYbTZSQVN1ODJacXhmZHJtc0xUelpvNnZZ?=
 =?utf-8?B?UlZCa3NmU2k4akw0Uzg5K0R5VFpadWs5SVcwZVpXOG1VaEJjM2gzUzJObENM?=
 =?utf-8?B?YWhHZUl6cWJEMnRERFhoUDY2azhablkzN1JGR21yRFY1bmJhUkVwWUVYYTNK?=
 =?utf-8?B?dGxWM3pJeE5iWFR3eUJ5eUgrbFFWS2ZRMjZoRG1lcW5iVCtYclRQZ2lFdVIz?=
 =?utf-8?B?MExxMjRXeFZyODZEOExHTEdpVTB6Sm9KV3NlOGJkbjFBR3pEeXhXbGs3VFN4?=
 =?utf-8?B?cDR0QlVMa2E4S1Q3cFdKWFd4bUxGTWtUY24wN2xwZSs4VmVHeEVBUWdSWUhQ?=
 =?utf-8?B?LzhzQU9ETUh4RFdXQVNzR3NKL0wwZG1IVVFEUEJMSkthcklTWWdqbjRMYUt4?=
 =?utf-8?B?T040SGU4d0NCQ2tWR0tNTUpudnJ2a2podUlSWVRvc2xweE15VTcvZU90WE95?=
 =?utf-8?B?VlZCSXQyZmRGZzdYbWE4Tk40cTExTmE5OXo1RTFjdmoxelpNTW9jZUNJRG1m?=
 =?utf-8?B?N2NkTVYzUUh6VEpzV2QvTkVkdkdqNHJFLzZ4d2hRMWNTYjFQS28zdS9qbWky?=
 =?utf-8?B?WlNZV2d5NEhXUTZkK2k4OXh4RDRqZkw0aUh6Zkp5MUI3SDVQVDZsRWZwZXJx?=
 =?utf-8?B?T3NFSnhrelVrMnVjMDFOaVlPRllvWjVOQS91bTFpM1BLbHNuMUJzcG1weXA1?=
 =?utf-8?B?cERXZmt6czAxbFowWElWNElKcXJ0Mk9kZzg3SW44bUh1NEhIRDVDWnU0U0Fw?=
 =?utf-8?B?UWJqdXdYbkxscUowWmp6SzNUbDlaSGlGZGJyc1VRS0xmK1ZKT2hUQkQ1ell5?=
 =?utf-8?B?VE9abEx6VDVnTnhQS1JocFYvNHlrNnVZc3FtblJKMUROZzZDNzVYb1lyVXVn?=
 =?utf-8?B?V2xSaW9jUCtwR05WbnRaNGREcXF4UFZmck52R2thNGNqekFtWU9LbmV6UXZw?=
 =?utf-8?B?WmJTcHJBM3hzL2NuK2hheFJtNXlza1BKTGhlbXFubzFHZEk3ajJWcWJ1aXVH?=
 =?utf-8?B?dzc3bURIT3A5aXVwSTNOVklXTHp0RTJOclhEeS9pN1IvME90SGxTNFRLSWUr?=
 =?utf-8?B?R2hiaDVIcXYzdjJUZEFSYjNNQmthUjlUa2tVZ1JNOVU5eXZCQXpGVGFWSkpw?=
 =?utf-8?B?RHlDS2s2dTJRNlJ4WGdEYzhlb3hMalIweEtqUU1WUUF6Y3JBQU9yU21CZmhk?=
 =?utf-8?B?UnVQRWVUdVg2RlF0TEMxU3RYRDlZL1l4aytpMTUyL1ZCbm5EcEZKVUJ1bUpJ?=
 =?utf-8?B?YkRianQxbmpkWTMzVDdkcU9nOWxYNC9EUjc5ZFlWTVRVR1N3b1pxTlp0eHBu?=
 =?utf-8?B?eHhGUmM2Y0xrZWx0VGRyb3V3aVNmL2FPU3I4RGY0allPWmEzcS92eE1sK3A2?=
 =?utf-8?B?SUdrZDBTTCt1T0ZyNDcvSHJGWCtlbjhDRDNxOTRDNTFGb1B1anhUYjJ1ekcw?=
 =?utf-8?B?V2NNa0xEdlZIMFdDYVg2TUd4MUJYa2pJckxTcWlQQU80OS9UU1lSOHFkQWVo?=
 =?utf-8?B?dXFxMUNpQytMT1I2Y1U0Rjhab2VpWGJPUmtEWDArYm11SVhITHdZaEJUNnB0?=
 =?utf-8?B?UDNqRVJnUzdoaWRNY3ZuVUtLdnFQZFJ4OWJLU3gzWGFpYjkrWTZpUVF6SGpV?=
 =?utf-8?B?SFpQdnV2S2diMTJtREN2NWF2UWZZMzZ5NnNnOXJ6cm1sZHZvWndoa0p4aTN4?=
 =?utf-8?B?bm13eTFteTlJMiszSE82UUprSEQxMTlCS3VmRkdOYWNJYzE2eHo1eFA4bHlw?=
 =?utf-8?B?NVlycjZzOWxQTDNjcndKZkZXTHFkWFVETE9wdnBlNGV4cE95dS9sYWxWME1V?=
 =?utf-8?Q?GjbWQ3oIW70=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWxENDYzekdIb3NhQ25vc0NvMnFwNGsveThld09YSm1Fb213KzVIYTcwU2xM?=
 =?utf-8?B?a0RjKzdTTHowbzNXdEJPUmhraDN3WDhVOWNWZXZEWHBWRW5LNi9tRHQ4eTNL?=
 =?utf-8?B?d25Ta3J2Mm41MW1JVDBkMXJXS0xJREc1UHpoTU5Oc3pqdHM2SGpzQzgvQ1pV?=
 =?utf-8?B?Q3NTY3VIYkljMGlyOGlwUDU4NUFWTjU5eUFTVlRqS1BNdngxZXdYeVVLaFI3?=
 =?utf-8?B?WE05bW4vS2cxZ3FDWmFUS0RiY0dFdGZFQXdWUDRxTDk1U2srM1NORDgrQUZL?=
 =?utf-8?B?Vk8wTVBmZERxRXozNGNOclZ3NStBcGQ4U1lRVWhjRkFYdVN0MlVIZ1pLY2dT?=
 =?utf-8?B?UDdtWlNhZ2xVak1wR2RXaU05K243aWc3ZU0rVGEybThyRlVsQ3huM2gyODJW?=
 =?utf-8?B?SDNCZll1bmRKVjJEUFJ5dEJkRUdweThhOHFyWGRiY0thWklHNVY4SFJkSDY3?=
 =?utf-8?B?dFVNWTZrR3BqQkFCdjAzSHU1Vk91ckduaVdqVXJDQlZUZXlRd1F6ZTZzMy9i?=
 =?utf-8?B?d21FYnNTZmd0QmlLc25EL3RuRzJ1Ynh2MmNRRDZiaVlLL0JCOUpCeDV6VENS?=
 =?utf-8?B?RzlENnVCWWIrUFRoVnNjdlBOMmluS0ZhOElsQzdSNG9oeldSa0VsWEJqMGxs?=
 =?utf-8?B?c05iZ3pWT0ttOWFpbVVJc010V0QvQ1pNamI2a0VmVXp4aFBrUTdlYy9KSThK?=
 =?utf-8?B?aTVLU0ZBeEdMZEM1TSt0WkRSK1dYaUVwcjdRWTdGSmJEaG9SZWFBTGo5YzZV?=
 =?utf-8?B?b0xIa1dwQUpiRGtJQ0NkN0hXaEdzSnc0TTdId2ROMmVFbHRQUFBtbTFBN0xX?=
 =?utf-8?B?aEZVenFDN05vWFRScEVGZGpaVGJFanF3Y2p5MFFmditHNXdhOVJlZjg0bHMy?=
 =?utf-8?B?MWpJN2gzYUhnVUw2TzlHdVY4aDNzS1ZicUxreXVYOXBiUDBEb2tRK2YxcHIz?=
 =?utf-8?B?dk5Lc1F2a0NWTE1MZ0pORW90azZnVDJ1aHYvckNvR3FpeTUxSnpkMWxvZ2xp?=
 =?utf-8?B?a29ldVN0VUpKb01Jd3kxRUl4d0NqbHB2allFV1ZpVkU1U25xc1RRUHNBRW5v?=
 =?utf-8?B?U0N5R3FrUGh2dzQ2bFhFNTBiazhBVUNLNXZHbUZGcDBmWDZ3RTIyQmVhaVow?=
 =?utf-8?B?U3Nwa2FSOUJiczdzVll1Y2g4VVhKNmJMT1lsNm5Kd04ySjkyZko5QU53TGg1?=
 =?utf-8?B?TVFsTkU4cG5mSHRFMmcrcTZ6K2N4QjdzeWllNndTMlZnWVRCY0xCaE8zbW4v?=
 =?utf-8?B?cTdDN3JRZVFmNzYya0lPNzlwK2JGK2g1WThVdWttekgxSGV3VkhLWDJ0RGdW?=
 =?utf-8?B?TlhmbWFKVllHSWRPSkx2VDJ4Q0EyWVc5WE9jSWl0R0MvclYzNDFZcWFkdmRD?=
 =?utf-8?B?amx0cE55cFNCeGltYWdHd3B1cVFNcGNKWm1FQVBwbDJpTTVJMTBQRUplbTFa?=
 =?utf-8?B?WFFkWW96MmlvZVZkYkhhM2hpanVQNlFGR0dXQkVaWjlwd3JOV1ROeXMydlZO?=
 =?utf-8?B?YnVVeDI0Tno1b3hvK2Zib0UzSDFLNDF1YmdVSW42Z2Fycld6N3Zib2VOdlYz?=
 =?utf-8?B?WTVMUldldE1QTTM5Y2JQTDJJaXNKQ2puMnhnV1daZktUZkMyN2x4R1RmOGlr?=
 =?utf-8?B?d2tDWFBqOEVYNnBDdkZOM01VRkJFSEFDeGU4Sk9lNExCQ2dLUERIai9wZkNh?=
 =?utf-8?B?QlFUVE1Qa3lZd2c4dk5rcTMxeDV1RW9RejNIMnFBYVFwb0srNG1QRFJFU3VR?=
 =?utf-8?B?YUNLTVJ5anJ2Y1pTQkQyQ0RnN083ZSsxRVVBNHJjdU9OQVowYmNCdERwSksy?=
 =?utf-8?B?VDV2US9USUFpZkJXd0Y1M3ZOR3phSXZJek9lQXJrVkg3eks1VmkxNGF0emlL?=
 =?utf-8?B?ZDFOb1pJbzQ2MUxxdVdXZUh2ZEZnMzZ3L0YycXJYM1FrUkJOTjNsakp6QXN5?=
 =?utf-8?B?QkJHZWhOU3pMUC9hbXY5RVM4bmdTbDB4NzlmSHEyWTZBYVlDZXhmbTBkMFFi?=
 =?utf-8?B?TTdrT3hXOUVnbXZ1QVhvaGZtdFZoWVpkZGZkNzdwd2s1UnpYNnBGNEJPNXpT?=
 =?utf-8?B?SUdSOTIvTjNJUkMyd0ZDMVRNblBkNFlvdk9rYnIrcitxSFJ0T2dheWNxaXNU?=
 =?utf-8?B?Qk9TRWpKUlJxSWs1NXBvT2IvUUFzNk83QkQ2bS9XWEs3WmtNWEI5UGlXMTJJ?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3Yx05C3C+PVtF6e9U08MIrRsDiM8pZCjATuhm2Mxduh6bfMJcl1zaoBP3Z1bhKE1BW5ui/l7YgoALY9C6DI0IkPr+wZwLH8e1EcSO0YP2zohdU0POKdDrLxw1pIocFRB7KgYqQ6EmIUgwiIP++N/rDtAp6igcgjowe2V5NY8Rif/6UBhmj1yI0agLWumOAs/urunGPqLJksF5L9UDoarNg44NM31Smjv6E+BxrFb/CmHr1ELP2NUmlmNTgkYsSlkE0RvVbnxPqiZtPkJ26+1En60G7DyVxlP8xKi56e1xF7NqY7r3uPvBy77mSBffEvB0VQj6NLvPBQYmVfH+scI/ZL4OPuVvEVF8rPu1kafkJhHhDlZEoPcdBrAa50LJeohAB2O2ydlu0nhry2l1PyAME/W3Oz8Jow2MH920vr5yx+0+H4CMVwKaukoxhBRlfgkzdEx3irZsARPgL2Exv8GTCEXxioP2DBlQqlwdEMBuZJdij6DIdA0eUewmOvqHTL7grS5iKPmM+9VH+dVu7oFRuOzCyFRZpKxIs4XZoDS9dB+iYLSlHF4RMHyDwJVg8HW8NXmU/wMUYm/djvCZI+QoWLdAelFKJtVYucSxX6IFqI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2086764-8e2a-4bfb-a93b-08ddc5d4dd6d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 08:26:59.7684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: weOARVMbRmGGapfjGH/VFF+rNBJ5w2WKnRE1D6hw5wzndsWGXh1KrwWWHso6L9j+32u/c8+DGLQebv/kiyFr2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4652
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507180065
X-Proofpoint-ORIG-GUID: k1tK1ViiRHQOUPA2dXE4rMA9SJ3QYL9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA2NSBTYWx0ZWRfX+T7PsCrgxPUH ZTN8vwTV21CuOqvNqfjWZyE8c3QQSIRbtPFZol3DwMs9KNEWKtjc40/dkmwHtD7+TzTkt47kR/1 Qrr68O4/QXMiCnNMS/VfEHVCeDPRMyWOkj4DCAFVDicRjCu+a3B3bRpoEc+LzNOI7QEYhecGZHO
 Tk0heXpr24fKHyNxBSYUyV536cm8iDq2L/T+bMO6gutUqXW3WYbGc2JBZYO44p7NTgGoB7R+Eja FT7hepqO6GzTjzVehrtRmZWS+Eh198+2xZaqcQIqiucE7hm8x1QCCbw+60xduX113yiyEXw77uw jwu0KqhGxndeBcgvHHgREEUDBXBJjcn5vwu10qEHl8oR4Xe5NlXxSAtM/EMIU7VpqBzPRDnWqGo
 6erN/fcUiyFzcFEmE7wzOe+ZMbNzuyI0MeQLIRdC3/lnwqjjjE9bIZRqRYs8GlE2oLB9CDug
X-Authority-Analysis: v=2.4 cv=Xtr6OUF9 c=1 sm=1 tr=0 ts=687a0557 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=k7kojvuAiP1NKykc:21 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=oswZbCnakYxAfeu1sgMA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13600
X-Proofpoint-GUID: k1tK1ViiRHQOUPA2dXE4rMA9SJ3QYL9W

On 18/07/2025 06:10, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the device-mapper tree got a conflict in:
> 
>    drivers/md/dm-stripe.c
> 
> between commit:
> 
>    5fb9d4341b78 ("dm-stripe: limit chunk_sectors to the stripe size")
> 
> from the block tree and commit:
> 
>    846e9e999dd3 ("dm-stripe: fix a possible integer overflow")
> 
> from the device-mapper tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

I think that this is the proper merge resolution:

static void stripe_io_hints(struct dm_target *ti,
     struct queue_limits *limits)
{
	struct stripe_c *sc = ti->private;
	unsigned int io_min, io_opt;

	if (!check_shl_overflow(sc->chunk_size, SECTOR_SHIFT, &io_min) && 
!check_mul_overflow(io_min, sc->stripes, &io_opt)) {
		limits->io_min = io_min;
		limits->io_opt = io_opt;
	}
	limits->chunk_sectors = sc->chunk_size;
}


For purpose of atomic writes, we should always set chunk_sectors.

BTW, I tried to apply the conflicting patches from the block tree on 
-next from 17 July, and I was getting strange behaviour:

# vgcreate vg00 /dev/sda /dev/sdb /dev/sdc /dev/sdd
  WARNING: Unknown logical_block_size for device /dev/sda.
  WARNING: Unknown logical_block_size for device /dev/sdb.
  WARNING: Unknown logical_block_size for device /dev/sdc.
  WARNING: Unknown logical_block_size for device /dev/sdd.
  Physical volume "/dev/sda" successfully created.
  Physical volume "/dev/sdb" successfully created.
  Physical volume "/dev/sdc" successfully created.
  Physical volume "/dev/sdd" successfully created.
  Volume group "vg00" successfully created
#

I had no such problem on Jens' block for-6.17 tree.

Thanks,
John


