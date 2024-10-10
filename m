Return-Path: <linux-next+bounces-4203-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFE3997C57
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 07:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E8561C21952
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 05:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A0C196C86;
	Thu, 10 Oct 2024 05:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rvddH5F9"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F5B2AEEC;
	Thu, 10 Oct 2024 05:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728537718; cv=fail; b=nwlDI0IFvaC8irdjLxYMx67Kv/1fsSDqYfsQ+FfTluH5qPqvrWBoHHowuGF51OzG4VuDjbFeXMGNhyJ4T/SzsCUjZ5obVPbeBiqU2V2rrGyMRqAHa+S9QJlw0729tw6XJ19gI93JBJa+9+Ok+nl2qwN4LmMLI2ChGecaL0hpaHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728537718; c=relaxed/simple;
	bh=MU0sl5pK6vbhkhonClz0iWTSY9PVv8Z9JVF7ZiG3HBQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mMQ4fC6ecMl9GKkSM/hg4e7yFTkvMb+XYjEIYvX7X9VE0Omn/uR/OT1oJVj2/EHb3z5TWJ9THUtf+hm71Je2IYR3Vp2kvzMq/5L6boWwhgOjMTWmw6K/DoCJuSsvcpo3puVM411IaTriYdmCnmfWau2zGjwYk884GiRx/zxxews=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rvddH5F9; arc=fail smtp.client-ip=40.107.94.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUKRuP9dcFOWtr94ERGLem+/qgFMcw3ll0/X0b/ETKgA5cK6QW0n9cUchg+MvAKw97jl0vx5SDyaBUmYRfvOyXwORFlYxfSIOGXxg6AKhxqBcAq6a9ypqCQpz0hXnNVwzyrxrAOnCkOwSHxUpUYNPHF/mgQCK1fwC+67KbAzgisZ15LmwC+LX4bVvdUANHqJHQWtEvCJaJkzAa/iQ+UF5RVUyeddDCRPys5G0gEt9u2kQ/AD2lMAbnAUy4JKy9OwzK9x6nDSdyRLzvG752V7nV2/E5M+mVSZBI8LcckrQHAtDfjF7mrv9yDs7dlAC1F/pVHzLdIeDEzDDJzs/Dnhsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6B/dZzwOlN3g/Q44RFdn9yDMcSLbTbEnL6kKTSLpa+U=;
 b=vuIpDrU2/gj1Rlp4JALS0W85nD02swS83IL9R6FLRdUy3g5bU/Z6DuvnRMWgwFu+/fw9tLiX9apAS5PQWmvgVsRe3Y6vFR6PP2rxlBTaRcD1wAl5GpbdTVkD3Ji0S4n1ELBVX+ViEWKtO1pIUuJ63WATm4MX+4g/NlcjMiRI/4yDOYanEbMjHfDr9nRrEz6hs0Rn1AduipKyOWJu7jio0qCm4uNSVjeeU01x+jmhfUhDaQl3G0SMRh87AKQ9fuv00W17KlygLqZ0wraiv767JlI722xQrCUJ0FRu579KYRx7/z5fSQN396pl3hkfILNmJtbSU8NEEbVpWMwU8OK03g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6B/dZzwOlN3g/Q44RFdn9yDMcSLbTbEnL6kKTSLpa+U=;
 b=rvddH5F9x6exV9qR7YaUg/HXq31JLvCexOmG2aHsD/e2dH3t/IYO0fvkhj4cNt+i/1gE1mpqKJF36oPsmFZompLI4Z0cpbPMGzu0pU4F28U4pfoLqkq69U7rLiw1JHes7FFapNz42vxydCSjzMo6KHF0Rr21VQd5t3PzefYgoUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by PH7PR12MB5997.namprd12.prod.outlook.com (2603:10b6:510:1d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 05:21:52 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf%4]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 05:21:51 +0000
Message-ID: <92e55ead-aa15-4284-a478-5849556c9a0f@amd.com>
Date: Thu, 10 Oct 2024 10:51:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: simple boot test failure (Was: linux-next: Tree for
 Oct 9)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Brauner <brauner@kernel.org>
References: <20241009182016.61736424@canb.auug.org.au>
 <20241009232216.6f0a28e5@canb.auug.org.au>
From: "Aithal, Srikanth" <sraithal@amd.com>
In-Reply-To: <20241009232216.6f0a28e5@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::13) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|PH7PR12MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dda4b3e-97ba-4ae8-2b1d-08dce8eb724a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFcvdVNTV01qZU5WWmxoN0dVdnVNL0QrMVhjbkpUYm51bU5rcjA5U0VLSmpy?=
 =?utf-8?B?RDdmTXdaQTJTUC8rUkRBUUNOdmJVbkxRdnIvb1RzTlYwTWNJRXV6RFRRRXc2?=
 =?utf-8?B?WU1MT2FQMjZEODZkRjFZYnljaDVOSGh1UmFqbjZ2ampYMzV4dm1EcU9YcWdT?=
 =?utf-8?B?VTd6QjRvRDB4NUtJS01VeFczMmN4RE5scXBWbG01MDMxcEVaa1d3cnNHTmli?=
 =?utf-8?B?eE1YMHl5eHF3bm1hT3Zmd3l5SS9ZaFFQMXFkSHQrZEZRVmhhcVkrOVRMbC9u?=
 =?utf-8?B?QUJpcUJSSlhzUnZzTWNPenV4d3lsMTNlK3lYSWNRb1hrQ1pENWpkejVQVkdV?=
 =?utf-8?B?Y3RrZkRDT296ckZPUU5pNmxmWUhaeEJSRFNNbExuZHI3SlNwUS8rdndsN28x?=
 =?utf-8?B?WkFsK0ZicWtVY2hEa0Jkdmd3MHRpVmtUNUVSbGFSdnd5dlpaL0FONWtzNW9T?=
 =?utf-8?B?VWRObmxxM3RLaE9sdHhkSTY2bnBQSVR1cHpqRW4vOURXaVNYL24xR1Nhb0Z4?=
 =?utf-8?B?Y3I5aGdHWHhNV1VHSjRmemp1dW03b3hpWTd6aGtPL3QxeTV6RG1VSGNzU1Vy?=
 =?utf-8?B?azh3dDN6bC9yVjVpL3k4ZEIwWGJPZkJxK3BFYXBaSGtpWUd5VzJhNk4vUDRq?=
 =?utf-8?B?VTBJclF0VGhSYXZrWmlGVUNvZFRIUWg3UDEzaTR6K2FRd05WdXdZZDl6dUhp?=
 =?utf-8?B?U3NDYTkzaTZHT0tlVmx2UmhWSUc5Smw5K0NyZTBxYmZMajZQT0JTa1V2ZmdR?=
 =?utf-8?B?c3FoVCtVL0JTTTFNNk1qa1l5djVEbktEbm1SMDE1Kzg0ZE1yb1ZMMnJSeDd5?=
 =?utf-8?B?Qk1LMjFOQUZQaU1LSHFOSkF4dUc3NDN5M2VsRzRITkxTMmxhbUVhRkdNZWdj?=
 =?utf-8?B?czdTYXZSSThKazNsbjliTVY0aWU2TmZmVjJEVWVDaW9NWHcra1IybUcrUEI1?=
 =?utf-8?B?eTE3d1JEUUdZdHdVR3NDdXNNUGd4Q0tGayswSDhqTTEwekJXczAvcWtyV1V0?=
 =?utf-8?B?SUJ6aTIrYnRscGc3WWxzWVNoTmtDejFRL2UyY0s3R3NDUTJRZUE3ZXc3dWpR?=
 =?utf-8?B?VFlHZWRpWDQ1bWNUbGgrZzNzUnoyeVcrS3pLRzNhS0VhWUQzK09VYVBZbWZj?=
 =?utf-8?B?Rk1XUFpwd1h1VXAxenhYbUJZeHNmRDE1Y0xSZXNjT3lOYnZvaGluM1F4ZHpr?=
 =?utf-8?B?RWJ5ZmFxekFRelpObEZ1ZXFXZWVQVVJwYXJtU0l4cUFsMllQT3QybmNueUM0?=
 =?utf-8?B?Q09Id1F6bWEwQzZLbDRKM0x1c2hsTGpMbXdZVTR4QXNXaVBKU0NRSDJibmNT?=
 =?utf-8?B?a2RBSGRjSUdMWWtMSFJzSlJGUFhhSzJxNkZJZEZmeUVqNnEzRjhLa2RXRUpj?=
 =?utf-8?B?YkdPSlcrUW1xTW9Ma0p3VkU4Y2JZa2lvdEF0bU1OVWpNeC9jOS9HZGxzSzNZ?=
 =?utf-8?B?VE1RRHZ3RVRuVnhyNmMydzhhSmh0cjNrdkk1aVBTUFU5WHhDbW04YUVUcGRI?=
 =?utf-8?B?SG4vNnNCYkRZYm5uczVMRFJIUWVxdHk5UkR5ekNVck1vZWFqeUFsTlh6VkE4?=
 =?utf-8?B?UjVTcFhId1VEYUx6c0F2bnFLdmtPRllzTU9tKzBjT001UmZCVjZySG12UGly?=
 =?utf-8?B?SHd1b0VBa2FLMnFjNEdRbVVpODRNM0o3R1hQWS83VGNvemJuN2lHK3M2NGht?=
 =?utf-8?B?TU1zTC8xQnp2RWttTTFURFFVVDNTa28xUks3UXR4M3RGbmdHSzhYTFZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUxVYlBjYVlKT3h0L1VrMzVUNGVRMklSZWIxcE5CNEJFTFhDMjdadzNLYk1T?=
 =?utf-8?B?RHF0dUEwM0ppM0FWYVc5YWR3RFQ2MkttajA4cXpveHN1Wk5XTGV2RGRnZzVo?=
 =?utf-8?B?SVA0N3JoMHVuZ084SnRhWm9hZmJMVFdCb1ZkMGFteEJNUVZST1pWbmZLY2pS?=
 =?utf-8?B?TnlzUU9zdWFoTEk5ajhRdVVZV0RoR0NsZG03RDNoWDhpRHlkNzFWQWMrU21z?=
 =?utf-8?B?dnQwUURicG81VXFRMjI0SmtNbkhMb3BnUXFUTnkxVXVOWjgyUnU4UGIrVGRP?=
 =?utf-8?B?MWl1NElkbjZwY3hjYmlGM2p0Q1U4RnR6QmhTek9MZVM5akROOTBHekI1QXps?=
 =?utf-8?B?b3lhWjRZVjRCUnlZZ2FKSlJoMWI1bEhMMXBTUGNpWDU2SHVLWGhqUEwrbHJu?=
 =?utf-8?B?NTVZN3hDQ1Jjc0pGN2Y4cktvNG5mSnpCa1N2aEw2SklNR2NkVGNJTERrTlNo?=
 =?utf-8?B?clBBR20wY2ozMzFNN2tkQjJNaE85MUFIOTBHSjdaMFdjUkVoUk4wUU9uWEN6?=
 =?utf-8?B?VGJOVEczQlgzV1Y3RExocVN6cGlMUW11NkY5dE50TGk0ZVo1cklaT2JwWlVY?=
 =?utf-8?B?My9HNk1aV3R5Nmg1RWRzQVFTZ2kxeEZrcUxENTdsRDFraFJjMm85QkRnbDUz?=
 =?utf-8?B?cmhMSllOcytWa0tra2NHRkRtVUNYWmZua2VBQnNIdDl2Wk9QVDJPNVJRK2x1?=
 =?utf-8?B?VjBtQWp0TGtJMmZsTmsrdmloblIvSWQ3OWttSHFlSWp3OFpEdm1FKy9zdzlL?=
 =?utf-8?B?YUVvSFV4eHIyTW4rdkRhTkFTdy9YUE1hTm4wcklpN0VwYmFFK2pRUFZoclFU?=
 =?utf-8?B?ckFQalF3T2llSG1EK3VML3ltenR3U296bzBkT0tLaTJIRWRnaU85RGYxcDBZ?=
 =?utf-8?B?cWN1OUxKZURDSXdQdXRYK3p4MHk5UTRpc2lBVWtSVUZMaVNkOHE4eldVZzhy?=
 =?utf-8?B?cnoyYTA5NWZIdlA0dEZXb1Y5WFdOSUVpTFBzQzZ0UWJjZ2Z6aGJGRG03dUlQ?=
 =?utf-8?B?L0tpT2hnd21aYUlrTFBmU2xoUktkTzlnLzNhSmE0aS9DcFJDU1JlOHlCSjdu?=
 =?utf-8?B?TVd6OTZYQkkxYUtsWG9nNVdhSC9sM2RhOW45MVpNMWxlVU5zVWt3VTFscEow?=
 =?utf-8?B?elNQTTBVWHhiYTJ1a25lYllXeVY4ay9TT0JmTW1Xa3g4STFzQVFkblErZ1Q2?=
 =?utf-8?B?OStRcXhzeVVFQkRtODRhZGFKUDRvdTFtZ1daQVpzd0poVHhabllyZWx2d0xs?=
 =?utf-8?B?d21MS0MxeVJHdVh0NmRXcTNlRytFVGhaY1NiUTAwR3oxdXB1ODhpZjBrMmNu?=
 =?utf-8?B?TGtPMVJLSmJVZmlLU3I1NGZBTVdNemNWT2dndjJETldEdWttRDZQSFNsamdh?=
 =?utf-8?B?WGtYK3hEaW9wZnc1Nnk2QkhUc0cyME1ZN3ZOcEc1QzRjYTlHMVp2aG13WlNI?=
 =?utf-8?B?S3RPa295YzZNQ3hKTkl1T3p1SkpEK0JpZURJVDJ4QWtlc0t6R0dEalI5Vkxn?=
 =?utf-8?B?MnlxNkxIYkFDaXV5Um84cHFyZWs1Y1QwRVpTUzJSb3MrbDdLZXcwM0U5SDdm?=
 =?utf-8?B?UWRlQVQ1WmZPdmx1NVUxM2xObnhRYW9QL3NPTkFQZ2M0MXp0RnBDTVhRSUZ1?=
 =?utf-8?B?bnNrWkM5ZUI4UzlHKzlhSUYxR1E0UFBCWDkwMTB4SHp0dEE0MVdsSlY2M2Fo?=
 =?utf-8?B?dGxFNExVVEFCaXZ4NTU5WjQrbW93YjdPVDNWcjhEaUNkOXdQb0Z4MkI2YXVK?=
 =?utf-8?B?YmFGdW55SEZkekVQMkRZV1B4VVpiODlFU3VNQzBNVkRiVWNxL1dDejhXc2ZJ?=
 =?utf-8?B?UkxEWUo5UUpzUXJqSzJyR2pCYUs5VHFXVHJGV3FleURnSndTZ1dGd2FQK1ZP?=
 =?utf-8?B?cHcySTNSMXl3UWR0aWZIVXUxMWlqL0dKR2ZzYWJEUUdENjFocXZUakVjZGRt?=
 =?utf-8?B?RkYyQXBQaEYzNEcvK1hBYnE5TGNCQkU2aFZWbWpMQzN2MUwrUDZxUTFTeW1L?=
 =?utf-8?B?MnlRUnRTL2kvSmNLanhXNjhJZDRlRUNFTWVkbVJ6N3o0NnpFNlhEMVBaWDJ2?=
 =?utf-8?B?SG5hMGNqS05jbURSVmk5Y0UwemdoMmJXbjRDbXlUUVJST0ZPZmhqeFNWdFVm?=
 =?utf-8?Q?PATmfqjYxyIfF4ZdVgVeFtITu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dda4b3e-97ba-4ae8-2b1d-08dce8eb724a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 05:21:51.5228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDMwzru9Fakfocxn+iRJgqPccfDOG87ObAKezsGcVcUbz6UeT7ZC7bIDFUoVjCiUn3XO1HdndInKlS4kcy/Ktg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5997

On 10/9/2024 5:52 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 9 Oct 2024 18:20:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> News: this release fails my very simple qemu boot test.  It looks normal
>> up to user mode and I even get a login prompt, but when I log in I get
>> dumped back to the login prompt - presumably the shell is failing to run.
> 
> Bisected to
> 
> 218a562f273bec7731af4e713df72d2c8c8816e8 is the first bad commit
> commit 218a562f273bec7731af4e713df72d2c8c8816e8
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Mon Oct 7 18:43:57 2024 +0100
> 
>      make __set_open_fd() set cloexec state as well
>      
>      ->close_on_exec[] state is maintained only for opened descriptors;
>      as the result, anything that marks a descriptor opened has to
>      set its cloexec state explicitly.
>      
>      As the result, all calls of __set_open_fd() are followed by
>      __set_close_on_exec(); might as well fold it into __set_open_fd()
>      so that cloexec state is defined as soon as the descriptor is
>      marked opened.
>      
>      Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
>      Link: https://lore.kernel.org/r/20241007174358.396114-10-viro@zeniv.linux.org.uk
>      Signed-off-by: Christian Brauner <brauner@kernel.org>
> 
> And reverting that commit from today's linux-next fixes my problem.
Thanks, reverting that patch fixes the issue on my setup as well.
Srikanth Aithal <sraithal@amd.com>




