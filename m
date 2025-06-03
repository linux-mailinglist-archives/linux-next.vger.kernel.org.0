Return-Path: <linux-next+bounces-7027-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E110ACCA8E
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 17:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13BDE7A8079
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 15:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119B923BF91;
	Tue,  3 Jun 2025 15:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LLXWPex1"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B5723371F;
	Tue,  3 Jun 2025 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965831; cv=fail; b=QVdW+2721cgULlMHWEixX+hAhzXP1XxClH6o8vIr189iLeg/9AVSzYI6VO8/fo54vubxfQZ5EczaQPpPYdgnJWNnN+MdDGSvQpYUnHfa0IuTM1WDK4GGaVnKHsim4XfayoUbWR2uG8IfAL7XoEQXE319iGUxqAGh4syCYYqqHDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965831; c=relaxed/simple;
	bh=WFIY9NlFZ90z0eUV/I6899+s2zgLrwFHkYQ+2vhr1II=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QYMcQAjdqkDslQo/AlK5Rw/fDqMoQNN1m27Tp4hNfMZEwfrcfEZhicYoAr67fcKTqgyWHcgeYmboUdgMQe5aowQP0fdR9nd2mK6EDtezL9/56F3CSDKF8b1Ecjp9IRKgHCr7RIszTrIn9XMtFxsxw33LCh5++D0o214FLD3pVy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LLXWPex1; arc=fail smtp.client-ip=40.107.223.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5NsUe0ywDAuFOniWnCxFWHK1bITJMUBCh6HLyaSKuAQ9uxZWFLeElkXfThAPxu0K3W4oiCg2Ca5s6C6w5hq9b5iquTMBifnSLL2o8BCyWmKair1d06JUh2kTn0IVgS79Qx4jgmmwhuhELvBUhthEmvUtTi2pH6k+XzXge6xSsrlZNAb0vvki5ZG0BBmU7Dq3h8OWqvpAXjM19b9WBduVJ5X2jYpiDiUeH7JNzyHaLaAYNMOmXOI8gAUfCcuw5OTAyD7XHEziXBCNJ/oZpzmj3JiFVe8N7RqUR8f5Pq9QCbVk0HERUpD9PMZRnrxZv16xJ31gPM8YcuyqNTXwkaNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=618V3RmR0lHvOQjS5h8DTmkWqNgJ9iFmcT10eRwZxuc=;
 b=y1yWJITFAQPMYFFQDa+PDuu4ByH3TRHd1CNawngyuJDJ5mWudyh5OAJaEIzuqgIMqrZ4hdxK2znOl4vf+KEOn2Tr5/zTO2YaZXdDdWiRBAp0QSgX1lVwN0jt5ysk8Q0roplY1UZ/pyUwii1oxWpGsefnhZKlJc26R/CgplupOuoO+W1JULU1qSOC+ClJuw3ybR/bCJ/KS851vlcGRwN6Jc0xFyoYeIQRczyA/TPT9gGJ4A9gWFJ2cc+/GZFX9BI2M6Y2FPht6juTR9MwvlvP3IYXGDLeIAeda40v3Zy2y1T4Qor4h/mGF02BCaUfda9NhM3bVhZvMLl9ACfGMPiIJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=618V3RmR0lHvOQjS5h8DTmkWqNgJ9iFmcT10eRwZxuc=;
 b=LLXWPex1E4XBhowkXHWCDzR3FVyL7xe/NGq1+yVfGz7KsAQkDAYvBwfK6/8d2iI1KP2iU39vxNJvzR8qL8vN1CzGqlVRxYz7WITMky/a1ouCWSYnEjd5srkaJOQLkEHNWilVccYdM4RaQ8BAGQLNNhME7JjQdi8xmy7WyrZutqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 CY8PR12MB8066.namprd12.prod.outlook.com (2603:10b6:930:70::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.33; Tue, 3 Jun 2025 15:50:24 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 15:50:23 +0000
Message-ID: <69d28f56-5b89-4d95-9c9c-baf6e894d4b4@amd.com>
Date: Tue, 3 Jun 2025 11:50:18 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86: Use i2c adapter name to fix build
 errors
Content-Language: en-GB
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, rdunlap@infradead.org,
 Hans de Goede <hdegoede@redhat.com>, sfr@canb.auug.org.au,
 linux-next@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250530200234.1539571-1-pratap.nirujogi@amd.com>
 <20250530200234.1539571-4-pratap.nirujogi@amd.com>
 <ea615c2e-d306-06b2-10b0-2423ab59a8e9@linux.intel.com>
 <46a1ad3e-3419-4f03-b5ce-a36d2480037c@amd.com>
 <56698b89-756a-ec89-787c-d08351abf7f0@linux.intel.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <56698b89-756a-ec89-787c-d08351abf7f0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CP5P284CA0081.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:93::14) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|CY8PR12MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2fb289-5e7b-4a9c-6c64-08dda2b659e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckFmcjNydkcyOXA2MEhIQ2J3aVpuZFJKZFRyK0ZDLzZaVm1JVi91SWJNR1VB?=
 =?utf-8?B?SWFPMTd0TXhrbU80ZlF0NVNSZGp3VVl4LzlWdnRqdFZRSWdzS3pCemJxdnJu?=
 =?utf-8?B?bGNIR1V2ZzZWbDlEUHlOVVBxRWsrMW1hTGdpQWRVQTlVeDRGYStmTHpydXZU?=
 =?utf-8?B?dlY4cEZ2MVhXNzErN1FHNjdZNjJTN1VEODdxWXpZNTdlYXdGdTZUWjlYdEpt?=
 =?utf-8?B?b2ZtVnRnL1JORldMenluL0hNV0hVMytDR0pQM1UzelAzQXpwQk1HQkFJeldT?=
 =?utf-8?B?SjBVd3V0ZXVzTTlLaEp5M3RDRHFPRk1HUkl6SHJuRFFURXR1YW1QVm5MZUQ4?=
 =?utf-8?B?OFJjSEJSSW1LVU8xeUpEMHQ5ck9WRXpPUUVoS1hERHozL1BuMmpRcGdNSHFi?=
 =?utf-8?B?eW4zYnlqUnZQOU14S09KekVOKy80UnZCTno2aWc1OUw2bnc4a0c2bEdZV2N6?=
 =?utf-8?B?NnpzUEkzbHk0dmg5MWpPZ1M2bWhoM2RCUUVZYXJYZHp1OHFOOWxTZHg2V2NR?=
 =?utf-8?B?RVhoQzdJdityUjZUVVRNRGcrQ0oxTnM1aWwxb1FBMWk1V0lIcnZWWXVDUkZM?=
 =?utf-8?B?NnluUHgwSEZkdnUzWDdMbU56aWxsVk11bnF1dWVBaDFCU3NoZGNsdVk2NHJB?=
 =?utf-8?B?Tk91MFVZakZranpPQ2J6SUpZS3FoRjFyWFFKNnB6YmZxSGFjVXQ3cnppVGdh?=
 =?utf-8?B?bG9PWkNKMWhDclRhWUtBd3RSMFp2T2pyeWtJekUyYTl2QlJPLzhEdEc5a1FK?=
 =?utf-8?B?ODB6ZnFzWm9TNEJONktxcWVQVlpmZUhzbHJLOFRvUy9BS2V3alFsQk5STFhE?=
 =?utf-8?B?RCtzU0RJZk5FOHZDVzQwbVlGdGJlTS9GTllQZEllRDJBSy8yVTBFTEpPN0g5?=
 =?utf-8?B?dWJvdDdZRmcvWDZhTXZGaUFLaG1HY1JjOGNobnhueW5Zdkx5WTRkeFhwajRQ?=
 =?utf-8?B?NVA5a0VtUWpPRUtHdkVYYUdTcVpmNnNZZk11TDF5UUZTME9JVnpoeCtrZkR5?=
 =?utf-8?B?bXQxNFRwd1JEVXZ5U2c0UjdqL0luVXMrWmFUM3hKZjFrSmF4c1NtYjhjRUVw?=
 =?utf-8?B?V0xJOHFwbUxUMHpOY3AxTExLaUVoQitycUp6UmZPb081dmsyVnNHc3A3SkEx?=
 =?utf-8?B?Y0x3Q1VERnJZZUFYdkZpRitUY09DaHJOeGxxWTRKUFpQc3hWcjhiY2YwNk5m?=
 =?utf-8?B?WmxHcWI2WmgxVnhGQU5kNXBCSTN6YXBUQTVHQ3NQb2RZa3VUUzRiWVpUd3RZ?=
 =?utf-8?B?TDVheHNETGI2Vk5MVWFpVHFhTFcxMEF5anpnZmxKazhLN2tTK1dlOTNsNk5Q?=
 =?utf-8?B?VjFnL0x6blJUdCtPN3pLWFNTdGY5b3U3TjNaV1BSYzdUZnI1OVF1OWtlaGlS?=
 =?utf-8?B?bFZGNUE2U3Y1NHhWVStyUnJNanlTdi80Q2Jsd05qZGs2Qk1ib1lsT1NOZXQ1?=
 =?utf-8?B?SXZUZkhtTzBXR0hUUkRCeEdUQkt6TXY2VjRCbnVtOUd2b3dabE0wOHMzVlJO?=
 =?utf-8?B?am5WaEphSjNkcVh2amtjcGxsVW16Tmh2dEZtUS9mSmtxU3NYUTJrRzhoTk03?=
 =?utf-8?B?Q3g3eGQwWUFOLzBXbkZXaUFCay9aOENqYW9sbmV5WVdLRE9XaDd3TmFIMDB5?=
 =?utf-8?B?Z2VKUk9vL1cwbEw1YmdBS1BIVjJtSU9WdmVjM3Z2ZThsRWJETDFzTkhiR3RP?=
 =?utf-8?B?NlBkZlhwU3BVd01jT09Nek5zc2JiZUsyQXdjKzg4dmIwbi9JSXdiM2VpT3dh?=
 =?utf-8?B?QXd6aEVrRWlyMHhqY1ljKzl2QTlMMmtNQnIzK1BWdnJmaUNBeEhyVGVGbkJO?=
 =?utf-8?B?cDVaTUYzT211VlQ5VUZjdWRLb1h1K3pZQzdHd1IxZHBWV2lmejdUUnMvWFZU?=
 =?utf-8?B?NDhEYXRLeGNWSS9pRTJLY3E4TnBTR1NXdjQyamFma0xOVmpycEw1WVhHZ3Mw?=
 =?utf-8?Q?U8izEXn6was=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm1jRUpMRHQydFBWcnJUYXAxdTdQN1BvdzU1bkdKQ1hPRmhFUENOSTRpeG1t?=
 =?utf-8?B?MTNxM1lWWkRiKy9DRkpiVDYxdTZRK0E5bzFRZ1l2cUhKdVV0QUVYVndWSkFT?=
 =?utf-8?B?bXdrbytlRGhZTzhMT0dDTktuZUlNWFdJMW9hVVRFdDRJZjFZOGh2eDIvejZ1?=
 =?utf-8?B?OWZ1c3A3ai9FdFBEaTg1V1Z2R0M5b1RDeHEvMUQzVjJtMERSSVlQL2RIRWta?=
 =?utf-8?B?RWUvWlVsL3psOU93bXl6cS9LL2F0TUMxNUVvVkJ6b0IrVGRaWVJvYWtkSmx3?=
 =?utf-8?B?TFRJSStHYkxzYVFZUlp4MnhYU2M2RkhKWCtWWXpJRFZlbGZUTTZvRWhOREox?=
 =?utf-8?B?SWNCb05iVm5ZVXVKSWhoVXNLYTBVa2FBWWRjMTQybCtiaHNGSklGekpac245?=
 =?utf-8?B?Z2tOS0N5MmJPQVh5UGlCd2J5ZlczdDRHREsvVSt6YzNsWFRsMGdzNXBGckdp?=
 =?utf-8?B?N1AxU1g2WnFsdWRRYVJnYWU4S2Z1UFpkMVBZNjhpT1dsUWdpNVl4WUpGSlhU?=
 =?utf-8?B?aUcxMkJ6MEVyR2UyUGNndVFFY3dseU1xM0hPVHpSV1YrVFJWbkR1UkNXNWsy?=
 =?utf-8?B?bGFVVk5uZG81eWpIYS82MnNNdk9RMlhKSlp5eU5rRjRVaWZWT0FQN1VsVjIz?=
 =?utf-8?B?SE0rSUxEMmJjQmpQUVRwVi9nMXN0b2xVOWFNVWU3c2FSTnlpWWxBaFBuRWhp?=
 =?utf-8?B?OFhGa2UzRzU2M0NHN1hidDBGVUlPWFRvaXRFMm9sc0RhbUhwL2xlVUd4MGhB?=
 =?utf-8?B?R24vcW1sdWtLZHo4UFFSRzFaS2xXYXdlSFlkTEs2emRlSFhxRE1CdjZoRFdG?=
 =?utf-8?B?SGNaaHYza01iTUFOUTlSWVdRWHVNR3JIakhVcjZqNTZNL3E4RjlSdzlSNTZz?=
 =?utf-8?B?VGo5YkpVaVJjKzJmV1NkUFlLNHZYdTAxeElPZTFSYk94RzJ6UW52L0p1aHpo?=
 =?utf-8?B?QUJyYkZJRFE5M0U3ZytZR2kwbFBzS05DMmNSVzZtMnZIWjJxU1JLYXNDTnNo?=
 =?utf-8?B?TlA3a1lZcnNxUFdnaUtGdkJ2LzN1NG9kbVdFbzZxMjhDeDVsd2hhNWVQb2VD?=
 =?utf-8?B?QkVyOHVwa056QUxKb25abGN0OXZOcFdtL01PbWR1ajJyYS9vdUprVHZDTmhu?=
 =?utf-8?B?K3lPUERZWTNsTGJLSVUrWGpSZjFtTFBLaTUrV1I4R3FrV2lsREpCTjBTUHdo?=
 =?utf-8?B?MVpYRmx5YUczTFZxa2tIRmwwUlRUV2FTZmd5ekY2N0t0ZnE0ODBrNE94bS9C?=
 =?utf-8?B?UGdHZmxRbDNkaldIQ0J0MmFXK3RIWTNzSmRLWXI4OER5ekFBV1BvNnVkTWJV?=
 =?utf-8?B?d1p3YzBlQVVGMmUyNFYySzhmcElUWUdHY0dkb2I0WlF4azV6UXFXQ0dFbGpz?=
 =?utf-8?B?YXdvNlROdSt1VWlEMzREdVFaTmlJa0owMUJkeGtlbTFFbEt3Q2l6ZkxtZHgw?=
 =?utf-8?B?R0dDWmRoUFY0S2p6eDRGclBjSnE5eEdTZFRYOXpxREc1TERPYTAvRWpnRG5C?=
 =?utf-8?B?bXVSN05ZMlp2dE5GbHJtUGJrNWtnZ29hQzlnTlFGUzFRZHVOazN0UWZtbk40?=
 =?utf-8?B?aVAyalgrM3RJVXoySE53WDZJK1plZytCQS9OdXNhMU9XREJORENmeVpZZFRq?=
 =?utf-8?B?eXZjaHhKRS9jT1ZFNFBGdWMyaHkxbEpncDNXanlFTGlQSGs5eFBIYUgwYnVm?=
 =?utf-8?B?eGZGb2NNY1pLY1Frcy9tcmNpQWxVNnRSa1A0b2pDbjkwVlRuOWtmT1lQeEps?=
 =?utf-8?B?dEtreU9jZXl5MXcwei9zRU1kNzEyUE83SUcxbDNBWUZ5eFZmdGFMV3BwWTY5?=
 =?utf-8?B?MkxPMHFsYWtXd0lCTUpFWFJDNnlvcDhzcGxnL1duT3VCMmpoYzA5VnBHMCs2?=
 =?utf-8?B?SmZyYUhaSDIwOHZpVDF5cWdCNGJIV2M4bUwzZGpyeGZSVFdvWXNjSkU5ODlh?=
 =?utf-8?B?czFSb0lZSDZPNEMwaHdwdmV4WkhYWGdLQnJxaStNYUtFd1AvU1BvMVVoaGRB?=
 =?utf-8?B?RHR3K0hRSFlnWmtqbk45T3pkQ05DZFZQdzhmR1ZHUlhmcmtYVEp2anJwODUx?=
 =?utf-8?B?Zk11UjZBUUNLRjFrK3BORWk5bzZXMy80a1BleUxpcWJBQ3IyeU5FUVNSR3Ux?=
 =?utf-8?Q?zDK1vQ8X6m9tipo5sJ/C+yUSO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2fb289-5e7b-4a9c-6c64-08dda2b659e4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:50:23.7060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFwknAuJpaHsG1meFrVFQ4ecmnl2HPgcmyj4JqupM9Ml3yNu0kjA0wMrxl9tqUua96GzRRnqhQwmMXJgAQHdng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8066



On 6/3/2025 3:15 AM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, 2 Jun 2025, Nirujogi, Pratap wrote:
> 
>> Hi Ilpo,
>>
>> On 5/31/2025 1:11 AM, Ilpo Järvinen wrote:
>>> Caution: This message originated from an External Source. Use proper caution
>>> when opening attachments, clicking links, or responding.
>>>
>>>
>>> On Fri, 30 May 2025, Pratap Nirujogi wrote:
>>>
>>>> Use 'adapater->name' inplace of 'adapter->owner->name' to fix build issues
>>>> when CONFIG_MODULES is not defined.
>>>>
>>>> Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for
>>>> OV05C10")
>>>
>>> This is the which should have this Fixes tag, the other commits should not
>>> have it as they're not really the fix (but this change just depends on
>>> them, but since stable is not in picture yet for this driver we don't
>>> need to indicate even those deps).
>>>
>> Thank you, I will take care of keeping the Fixes tag only in the x86/platform
>> driver patch and will remove in the other two i2c driver patches.
>>
>> Sorry I think I'm not completely clear on this statement "we don't need to
>> indicate even those deps" - Am I good if I submit the same patch series
>> removing the Fixes tag from the two i2c driver patches? Or Is it about
>> submitting the i2c patches independently from x86/platform, instead of keeping
>> all the 3 patches in a single series. Can you please help to clarify?
> 
> Just remove the other fixes tags. Those changes don't really "fix" the
> problem but lay groundwork for the last patch.
> 
> (If this would be going to stable, which it isn't because the driver is
> not yet in any stable kernels, you'd have to add Cc: <stable@vger.kernel.org>
> to all dependencies within the series and the fix and the Fixes tag
> would still be in the last change only.)
> 
> 
> The series should be applied as whole, either by me or the i2c
> maintainers once it's ready.
> 
Thanks Ilpo for clarifying, and good to know about how the dependencies 
should be handled once the driver is in any of the stable branches and 
the significance of mailing list 'stable@vger.kernel.org'.

Will submit the new v2 patch series addressing the comments shortly.

Thanks,
Pratap

> --
>   i.
> 
>>>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>>>> Link:
>>>> https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infradead.org
>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>> ---
>>>>    drivers/platform/x86/amd/amd_isp4.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/amd_isp4.c
>>>> b/drivers/platform/x86/amd/amd_isp4.c
>>>> index 0cc01441bcbb..80b57b58621a 100644
>>>> --- a/drivers/platform/x86/amd/amd_isp4.c
>>>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>>>> @@ -151,7 +151,7 @@ MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>>>>
>>>>    static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>>>>    {
>>>> -     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>>>> +     return !strcmp(adap->name, "AMDISP DesignWare I2C adapter");
>>>
>>> Since both are in-kernel code, share that name through a define in some
>>> header.
>>>
>> sure, I will find the header file that can be used to add the adap->name
>> definition.
>>
>> Thanks,
>> Pratap
>>
>>> --
>>>    i.
>>>
>>


