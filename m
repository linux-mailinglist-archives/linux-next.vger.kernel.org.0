Return-Path: <linux-next+bounces-5674-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 510EAA551E3
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 17:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1261E3A3D7D
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 16:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EBD24166A;
	Thu,  6 Mar 2025 16:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ykTewuk+"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2DB13635B;
	Thu,  6 Mar 2025 16:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280074; cv=fail; b=TEJ/8G6Xi4dkl1xTv6XqOI1SxQ+Sc1soJxvQMzfC6ePuBfkyeiiCxv1xltlmM5QtziD2rSDpi0k/yOSaqtiisNMEd336/Brto+ioxgxdndwnr2tJsblvx2vYoy8v9ALpLu/IfPpc3QOf4wgD2xWepEFaFmunU1c0YA3PORtoH0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280074; c=relaxed/simple;
	bh=lmlbEVWOYn9QfOBJnpdBCTl1VKubQvz7audukvEutWw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OAjAz2Yws4sFP15tTCb49YTUHX7/MD4mjR52g9e3nHjef6xa5iMzRUWoAeBpi0245kGelBiVOIR4Vnfng4yFyn8J7JTPZedqr4s1IwcSP6wcP4VSmdH+HK1HxFDwHEFCHSXDlJS5wT16um+6pHZTObzRpYK2SFRSuL0i/Ll/Bm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ykTewuk+; arc=fail smtp.client-ip=40.107.220.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8ROtU232YWQsmHD5WlnA+/LojAs3GLpwcO1hURj6QX9jiRlyrDUDbYFpEoBIstpuucZMbxKwS0RvIm91cZbqWKRQlW6x56PXC4Ni5dZqDVG+CgcXcGdApqoHhAv0K1ZX65WbCbQt5BW1yKtF7LvkQ1Lfkq2hncvtzObhIx/kFLQpkee7PMiy4NxIH1gqyBNU4QYqA/+OvaNys3UHiQfFTqeAXVmL2nQNPGQsn8FNKE9M5K4c36m5YWWwbNBPtHaHWJosKlmgKOF3viOGcu8Dig+T5LEcMyTNSSL6AWGpA2e/lXdHRauA1Ts6aztFWZk6hZIxmkIwE+P2Z1wtdB6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h21yGgz9qoQGdRHPIRPx5Y82NsGljG+GZFA0k/PpRMY=;
 b=fBuw2F7ixtvYCddt5q0IHuBTYTpK46h5vHY5oDcAJrEyM62qcEVr3h6LB+2Di2sh+iab6EHu4uyx8cqJDqeynypVV5lE+zg5kUmcY1Hd0IleCrwPjH1YC4XUznfveW2azViHZbw+ilfS6cJBy9kBoSQKjlG8TwwPsbZgU5boeMxqJBy4g7UDB5HzLad1A/KOI0uHyc5+xFlB9NVePPQlRL0gO4k9M0kpdItcwTtsGeK1KNnuKhxeESiG9E58cJyoOWyu2psHMiDmziWbUN0Q8qh1rDQmM5nOiaxicLEVky/GFjLENhDRh9T7D63169NK++wPxkhZdLy4pxmF/ejl8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h21yGgz9qoQGdRHPIRPx5Y82NsGljG+GZFA0k/PpRMY=;
 b=ykTewuk+X8cGInRvX90zU+b9XN2dL6cZH9C9XrdI3FiA2bCh1APaudDdXHk5Gl2pMJTWTpvi2XtSmYvXI5kwc5NjvZFYYJ9XWKHpn2N3zGyji9COxYvmTNO87tG6mUbL8AD4jk/bkouLjSbFU2vn8rILM3wpYbPxknw2pIWlECM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB7498.namprd12.prod.outlook.com (2603:10b6:610:143::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 16:54:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:54:30 +0000
Message-ID: <2a21b54a-fe2a-48ab-8d22-0f8a7e6b02e5@amd.com>
Date: Thu, 6 Mar 2025 10:54:29 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the pm tree
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Dhananjay Ugwekar <Dhananjay.Ugwekar@amd.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>
References: <20250306082858.70e08bc7@canb.auug.org.au>
 <8664c2f4-122c-4798-8a12-3797d07a9522@amd.com>
 <5011851.31r3eYUQgx@rjwysocki.net>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <5011851.31r3eYUQgx@rjwysocki.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:805:de::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: cacfc0d0-dfc6-41aa-2cc5-08dd5ccf903e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkdwWVdEUGEyZGQzaFY4RlQ1TGhTdHozZG11YndLcjFYWTIrV3k5bnZXMG01?=
 =?utf-8?B?U3FiTmtzWVNvUXRhb2tsamtEMUZYNzUzYlJhS241MXlqV0pHc0lTNVZYMXg1?=
 =?utf-8?B?eGtxVkhWRlZ1bk1jbjJta2ZpNEI3TVVmSVowVmgwMVp2cThPRXZoelFVVlcy?=
 =?utf-8?B?NlZjbTdaQzFIUkZuM3d3WThTd0M5WDFia2FLQzFlQVlDN0VOczVPZ3EvY0VM?=
 =?utf-8?B?eGkwcDVNR1g4Ylg1SVRJandnQVR5VHo1elRqbEZmbGhjU21sci9DRjNKcGVR?=
 =?utf-8?B?cVNOQVJMeE5UMXU5S3Y5b3NqZzNTUXBVRFBjblpVczEwd0RFS1Y1T1pwYlhT?=
 =?utf-8?B?RW9OZmxDdUswMWhQb0VESGRWY1BRcU55VG1VMGRXZUtnS0Z0c1pYZSszNStW?=
 =?utf-8?B?WkVSYkY5VzhXRzRxa0tzSlZJS1VGMFVBd3JDcXp1bkVRbU0vbWEyVVhoYXJv?=
 =?utf-8?B?anFhNSsxM3lFSmVvUDBPd3dtK3Zha0g2ckl0QXI3R2lrVVhyUnlraWROWis2?=
 =?utf-8?B?UWM1bzRBUWNtNTk4aUFDVFJmRnVLZ2xSNTV0WUpwbGtHRk9Fbk5WQ29rK1c0?=
 =?utf-8?B?dzR4amdMQlMxcWljMzBtVk5QMlFmblhiRW1XcXdNZ2lPNnovbUlwdzB0YUM3?=
 =?utf-8?B?OVlFdktlMWFBWHZ6M05PZ0VCMUFTRU1xaml4RDJWQzdzU3pwdmFjTVRDdTBP?=
 =?utf-8?B?eHFoUm1DZEljaURaeC9MTC8yaUlvcE9ScmFjb25vRUlnSnBaWHNsK1hacWdY?=
 =?utf-8?B?OTZ4YkxEQ1lkRE5qcTRXQVdGOTcyQlFpWWg5cWdwV2lwR0xZekFlQzlPa1Bo?=
 =?utf-8?B?aFFCKzZGMmFFV0JkTU1Qbkk0dFZVTjJ0eDZoeDlqSmI2SzJ1dTN2a2xZSjNo?=
 =?utf-8?B?Wm5ZMDhvZnhwOXdJWGQ3YUg5VkRpa1JUOXVjU3ZwNVpjbEcvaHE1YVFxeFEv?=
 =?utf-8?B?cytQOEJtY3lJZVMwYlpVMjBLMEtmczh3NGU1a2hjaG9QMWwvay8yZnRWTkFC?=
 =?utf-8?B?NHpwVUtsT2RkK2F2WjI0eGlISnVaV1pSeDkyM1JwUXBGcGNyK3A1aUxUWHY2?=
 =?utf-8?B?R0YxZ01ZRHZPd1gxU3diZnBYTHpzcmtUc3N5MWJyTmExaGFkblllWVBWakkv?=
 =?utf-8?B?YXlaRk9kRWRKVGo0U2kvNnBPcE5nZlVsY1NlQkJWU0YzTnBIMEptOGVQT09p?=
 =?utf-8?B?S3VTNmoyem1kMjFBMHU0TzRkUmNsMUJXaHc0RXVieHVta2hqblJrV29GTDBK?=
 =?utf-8?B?MlRHVzZtcUpsWEVFYWxnRDBTS05BUUlzRGdpdSsyaE1rL2NWQ2w0NmpRaVF3?=
 =?utf-8?B?dURXRGUwMHd2L0NQODRVVGluVWxsQUxaak41Z2tadnVIWStkRi9iSVhJcWg1?=
 =?utf-8?B?YUhuWTh0NlpTU3AwVktyd1gzYWwxdEhRbFJNWkZwbW1wbkZXbmZtWE9hZUtX?=
 =?utf-8?B?SkJHODFrZnVQN2pBS3ZoSmp0N29ZRWJublA4V2t1VmtYT1VlaStnVS9pS2xh?=
 =?utf-8?B?OWhSTG8xYmhpWWhwdHpXZTRpUWx0KzZxTnRRUEFkT3lZK2tubytYQnZacXBo?=
 =?utf-8?B?MEJSZ2Q5QnJaZmxDelVWTXVSZG53aFZRK25YaUwrb3pBb1lEalRuRFk3UW42?=
 =?utf-8?B?ZGdja3k2ZnNuei8wZlJHaUR0SGsxeUJvb0JGSmUwZFoxaFg3SDNSVTNZam1T?=
 =?utf-8?B?WkVsa3grQ1hwekZOdzdkQXUwTG0zVWpQcWI0YzlCZ0FGakkvY2tHeDkvbkFJ?=
 =?utf-8?B?L21OenZ4eUZOV0hISkZ5ajVHb3YwRGRaZm9ZNTRKVnhhL01YYjY5RzN6Z1ly?=
 =?utf-8?B?RG1yYitKd2VsNXpJOUx6UEg1RGRJTmxJY1phQUs5OXNMVWphckliNXJ1VUJ5?=
 =?utf-8?Q?NFQybA906XTio?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUw4UXBPQUUrZHc5aHoxMUVIN01udUExaVhaVUZNYmJvcnZNNStqOU9yOUlx?=
 =?utf-8?B?WFF4bHo0STcrOHlKN0pNSW9mQUJkQ2Z4TXloYXpWUDRLendKbnJPZEhONTA1?=
 =?utf-8?B?VWhrWkNJdTdlS1FlRVRzV0VOS216VmVEc2VFelE5STBFY0ozcC82SXUxd3l6?=
 =?utf-8?B?V2k4ZTZzZm05QWNXZjRidStWblNramt3SVp3Wmo4OFRBMW5TL2FtV0lyVFpS?=
 =?utf-8?B?eE4rM2NGUDFNUHpvWDdIVHI5cDlCMzA1WkxaQWFNaVNvRTNsZE41YWJEWG5m?=
 =?utf-8?B?MVhQRzlkTFJzWUxpYTUzbTJVY0RCWkp3ODZnRGl1ZWFYb0ZDcER1TXZsMUd1?=
 =?utf-8?B?MEFPS1J1cnBCUWpjVmdhQTJoemt6MDYxdzB0NFJ1T0VXOFNBcjQvUWF3aGFH?=
 =?utf-8?B?TXg4SzVZdmhkYlJhd0ZKR0NDT3lQaHdUOStmMVV1bFg1N1pWeDkrSG9WTFB0?=
 =?utf-8?B?SkRCeXJIbGREVkgrYVpOb1hNbklSVkJPUjhLUWtGMTFXT2h3MTc2WDdEUm5h?=
 =?utf-8?B?S2VlYXllYmRMSkhTUGFiMzJ1VThldlNwZkY3K2dSVGREVnMvSW1OWGhtS0JX?=
 =?utf-8?B?aFZxUnViUGFMUTlDVGwrVHpUMFhFek0vTVRYYndDNTRkYlAxQ2JiNWV1enpX?=
 =?utf-8?B?M3FGbEkrYkZoRGRwaVFCQmJIRGRlRE1XTllRQVJndzhaaWZwWFpvUGVlVDhU?=
 =?utf-8?B?VUFmaGI2QnRXbkh5L291NGlORFVucUVUVnl5Yk5FMzlvbTFrNjZPS01YdEtR?=
 =?utf-8?B?UjZBUkVxTUdocFgxRzFQRzRkOWk1dnlKSnluZlpTaGp0QjFzUXJlY0Z4TnZ6?=
 =?utf-8?B?U2JKL1Q1bVpBcnVQS2h1am5LaElXd3JOdGV3SVdwR1VCcU56OTZPdEtjTWYy?=
 =?utf-8?B?SDBKMzdRZi9PMEx5bTB2VEp4K3diOUhXL3lCSTBiZmliS3N1TDJSMnYycFFB?=
 =?utf-8?B?cFhsRFVYZGQrVlA2OEVmMTFIeWdxclpQSHhONFlRVGxiYXcyYjBQc2hWUWhy?=
 =?utf-8?B?bVdsdCs1N0FHemdQVjlXdUkzWDgvdExLclF3dk5xdHlTMENYTzdhdXd5VkFs?=
 =?utf-8?B?ZzZXOGVLWmc1WitMbnEvYjJxS1NsSEVpSC9zNjhiMWFuQk8wa0ZUTXVRSHpK?=
 =?utf-8?B?YUVHblpvUXM4KzF1ODFPbU1Ga3R0YXBJdFVvcXdlYWJZSmtrc3hTbWREcmht?=
 =?utf-8?B?UzRhSTRkajdzbytPYXc1RVREZng3TGMxSDNZWUV6T2dTVEdDUFpTMEtYWHFn?=
 =?utf-8?B?djZHeDZON1lHZi9aS01vdHY2NjFxbG00aVF5dytkS0lHR0IwMWdWR3R3QUlR?=
 =?utf-8?B?d1MySGpzN3FBU1UyV0RLRm41TlNMM291R3l0c3E5cGkyZy9lR0pteGJOUjJK?=
 =?utf-8?B?eE8zbldnc01PUjVqMS9nbHA2WkJQQjZIUUJGTlpVQmEvaDJwRk5iM2pFOVVD?=
 =?utf-8?B?NzRjd1RtNTQwT21UQ2dYYkRTVXNzN3ZLc3VIVXVBMlp0dkk2bXBSSGhwWHF2?=
 =?utf-8?B?Ti9POXZpMlhZczl2aVNVMGJydkI0RkRNQlI1Z21Od251ck43SzFuYzY3d0ZX?=
 =?utf-8?B?aXZhdThsOTVtVVg4eGVPb2NtVUpYUDlEKzJlVjAzNit5TGVSbkNSQ0F2UXl0?=
 =?utf-8?B?Rk0vWjYwUkNhOHo0TEFENC93YVRmNWhyOUN3c0d4NjRHWW9hNzJ1WFV2dHdI?=
 =?utf-8?B?MXYvczN6VUs5Qm5udW84ckZVYTVManB6Vm5SVWZDRk9YWTNKZko2OWZFVU5E?=
 =?utf-8?B?TGMxNEIxallJd3UzTWxhOWJvU3dEVmVWZStTbEk3YjE5SnphckNqT3Zra2pZ?=
 =?utf-8?B?cWduNGNaY1dOK1B2YWVrZDVYRlZ1NjJteUMyNy9GazhKWkttVnJzYVhMZ1hr?=
 =?utf-8?B?SjFOT2lNUG5FTW4ydE1RdW8welJxWGZvREVxTGRtSEJxTG1MZWJXSlNRUVVS?=
 =?utf-8?B?ZGhIQUVyT21yZTdYUXkzei9Vd05yd1lHcDA2ejk2Ykp2ZDRWNkxoQUNHWDhz?=
 =?utf-8?B?aWxoM1U3cmNIa1dxMUdHSVBOUHdwMVZXdzVpQng3eXpkOFU3U01YQmhSZ1U2?=
 =?utf-8?B?RFQ3VWl0NEdtZEdKTkJUY25qcUg5anAwaHNRaFJ5Y2NhQVd6ZVFUZ1RtY1FH?=
 =?utf-8?Q?imHGBFmDSXaWwqTmfBnA7a4RA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cacfc0d0-dfc6-41aa-2cc5-08dd5ccf903e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:54:30.6030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KY4g6sMna9GvhH5nOALuhY7NTPUj0mV1iRfii+ZHHiAQsBTvBaayXQM26bcyn+yL3du+0AisU/F9dcePZEJutA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7498

On 3/6/2025 10:52, Rafael J. Wysocki wrote:
> On Thursday, March 6, 2025 7:15:57 AM CET Dhananjay Ugwekar wrote:
>> Hello Stephen,
>>
>> On 3/6/2025 2:58 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> In commit
>>>
>>>    f6c0b7602909 ("cpufreq/amd-pstate: Fix the clamping of perf values")
>>>
>>> Fixes tag
>>>
>>>    Fixes: 305621eb6a8b ("cpufreq/amd-pstate: Modularize perf<->freq conversion")
>>>
>>> has these problem(s):
>>>
>>>    - Target SHA1 does not exist
>>>
>>> Maybe you meant
>>>
>>> Fixes: 620136ced35a ("cpufreq/amd-pstate: Modularize perf<->freq conversion")
>>
>> Yes, you're right, I was referring to that commit,
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=bleeding-edge&id=620136ced35a9329f4d1ea90e51bee2dfd7ee5b0
>>
>> Rafael, will you be able to fix the tag it in your tree?, or should I send the amended patch separately?
> 
> No, I'm not, this was pulled from Mario.
> 
> Mario, can you please fix this and send a new pull request to me for the
> same material?
> 
> Thanks!
> 
> 
> 

The tag WAS right originally, but I the sha changed when I rebased on a 
later RC and I still had the old sha in my tree so I missed it.

I'll make a replacement tag for you and you can repull.

Thanks,

