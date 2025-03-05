Return-Path: <linux-next+bounces-5659-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 784B1A508A5
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 19:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88C5A1886156
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 18:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8E0251786;
	Wed,  5 Mar 2025 18:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TKV11OXR"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E978F1C6FF9;
	Wed,  5 Mar 2025 18:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741198134; cv=fail; b=rLHHQ+7cGTkUnitWzavCdprlWeHmogrmOEmrN0uV/Nl59+W5IM6aIlbw6pE8+Ep/M0eD6jwGKIGxlg+zWL9DFfX169n3V90aQT81CujEd5K3HTIlDH8qFusW88xxxG3LNVOeHrQCcBWZYd1qnY9i/mymFbEsVyEVo/B9q9dA4S8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741198134; c=relaxed/simple;
	bh=2UyDv2Z2UiVPCoTPnCyz1UVNrkTAZmKto2f4vPxPGV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o6SzR4ufM2jGqGdFu1s6EegQmlvf2qmqQYNm4Z0oShNs6f7qalIL8IztAi0mQnOvm4Ou5TTMJlq/bI2Sv9oPv3pUkUHnz/9KFU0qAM+7PNX7C7G13XH6RbS2PIdp4lAflw0d29EcZjNnvTgaWQoGDN7ciUds8zwbK9xGzyvAoUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TKV11OXR; arc=fail smtp.client-ip=40.107.94.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b93CI4VRIQyGy0gVEsDhrM1iwDo1x/tkzhEwUhuXL3E2t5TbH9mlbYMjbsYK8y9jaSE4cwNLG0RJztrau+qrsGNLBQwQmhA4NQSceDJQclsEZpeTxEKZBAToK8+sbGr+I+0j/pT61M5n8oQ8Hcrf3CchqQnTYEGa32QEEHS3FywmY7Mmu3pbvFH/F64koWoMbPNScYizev0XktvfIaOdTIFWKWHQqqAqAkIxYQh/o6rrg8e7YRgvdu3iDTv7m66lK8/T1sqQQpRYP7TfQivTGhXxVpjH1Qjs2U1R4+GlYAH7qtfh3lNS6XjfBhCYniNV35hWfLO8eLtd9wJgX22wmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPAP/HtFikRXry5PVvjO9L0UPd+MsUdW+ORPPb9r7Kw=;
 b=fIb5sChwzC7K5nrdVvliCTjDOMzwZ9hdljKyXZNZyjKH6uKu0qpnbJO2J5SLGkyVtpfXNXTBX29SEF9aGv75YtHFI/tQaXifF0NgmpdZSIBEQ1SMGXhCAWOrnnXFQ8mw4V+BX0SAMliXwebrsXlo1Kfwz0QO5SCGP3Jlq2eN7s5lgNpEY9UGo/7tHlUO9JMyMIEaYWK3SL7DlMxQZjL/5ZwMoChy735SMNGEMs8E+YVPZ1epqG7T57JdVZMLV8yXZDcWvCVF0Hk5Iry4ddcdhd5pCrG2YRV8T1b2UB4u5IJxaPTCfmSnd+hq6AIywUseq1O+oh+I8StaLeGluozrJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPAP/HtFikRXry5PVvjO9L0UPd+MsUdW+ORPPb9r7Kw=;
 b=TKV11OXRRaOvvHwJoiY1Z8+Jhzp5fopVNxcqUiRovlPsHLVAq/UmCAuGwzDip9rUL8HSNtbAA1V00pMZzZfzkYxjc/NZeJrBVqiouJZGtKnOtavXj/LcbzwVcaLRgMH1bnzLsQPB+ecSC8ti4MHRq9x/d6ltMHOB5gahow0rllk=
Received: from DM6PR03CA0021.namprd03.prod.outlook.com (2603:10b6:5:40::34) by
 MW6PR12MB8736.namprd12.prod.outlook.com (2603:10b6:303:244::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.17; Wed, 5 Mar 2025 18:08:49 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:40:cafe::c) by DM6PR03CA0021.outlook.office365.com
 (2603:10b6:5:40::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Wed,
 5 Mar 2025 18:08:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 18:08:48 +0000
Received: from [10.252.205.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 12:08:46 -0600
Message-ID: <e6cb4e60-9525-4d42-8912-7ce3f7fa4abb@amd.com>
Date: Wed, 5 Mar 2025 23:38:42 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include/linux/pipe_fs_i: Add htmldoc annotation for
 "head_tail" member
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: Oleg Nesterov <oleg@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
References: <20250305204609.5e64768e@canb.auug.org.au>
 <20250305112301.2897-1-kprateek.nayak@amd.com>
 <CAHk-=whuh+f8C4u+gCkxRZyrt7Gw_FFw_pKn-2SnTovZOvEKmg@mail.gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <CAHk-=whuh+f8C4u+gCkxRZyrt7Gw_FFw_pKn-2SnTovZOvEKmg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|MW6PR12MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e20466-6b2a-445a-5e20-08dd5c10c73e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWxBTTVVa0pJd0FHNmIvK2RIRlFPb0x0SmFDTjUwSk1jRlV3b2IrckViTWNF?=
 =?utf-8?B?R3lBUXZFcXhIU0I5emxPdFA2TG14cTRqbDNyaytoSDF2Ti9xUnFrMzB6TkQz?=
 =?utf-8?B?N0s5QnErWHlwcjBGN2VGZXZBVDMwekVtTDFjUkp1RzV3KzJnbUROamFBb1BC?=
 =?utf-8?B?aGU0aTdiSUFsRXFOYXNKOHFidmZnTG5QM3R6aWtCYmw1ME9yck9pQlVIdG1U?=
 =?utf-8?B?WkxodWgvVTFnSGw1c01XOVo3YnlLTmdXbTJpK0RLS1NYb2QxNkZZRGRVWFlZ?=
 =?utf-8?B?VDJuWFpBL3FYNkc5RVdBTGJ3RkVRRi9BM1Z2dmRPR2pFWHM5VURsQ2VmVmRu?=
 =?utf-8?B?OHFJRG1GOUZDc2NkcnJTVDdVOHV5ZVVEbVZYa2NoNFNSS3REWG9uT0g3NHRB?=
 =?utf-8?B?WUJicENFN1N1YzlLc3ozMVFTMng1eGZWL0diS3lkdi9QUHMzQmRrNWV1OHJV?=
 =?utf-8?B?cFRoYlpCRzd4SjE3M01vbmIrYTc5RHRkbmRpOUN1cDZVUDdDUVZuSTJCZ2N3?=
 =?utf-8?B?d2U3amtVcVl5emI5S0U1S2ZwOExySmI2MWFpZkVQdnJQQlB0aXluQ0YwUGFS?=
 =?utf-8?B?c1RmVjlSeXIxSm5Eb1BxOC9lU0FDclZBcE5vMlI0cTgxeHhwZklZZU11OXIx?=
 =?utf-8?B?ekVNcEhTYXdvT2xOelRheERkNTFWREUwYlh3YnFjQ1l0WjhMVDFkYVNzZklm?=
 =?utf-8?B?VFgwWkNNbTBQNE13MnJFM1FvRDJJMCtoZjNtZVZjZ255U2J1L1BGMU5sNmk5?=
 =?utf-8?B?VFJYUlM2bkRhZnN3QUd1RDBNWFZ6N1FGdDQyblFYSXZSWmdIN1ROZkt6NEpO?=
 =?utf-8?B?WVlac1hNUzhuejU2dElhS1huZW5zR2FyOXRIYzY3aEM1T0Q2UXNQR28rOUt5?=
 =?utf-8?B?NmVkMm1lTEdsSnFQTkNyblNKYUhNTmNRZ2FLLzNCaHZnVXBtZktLeUl3SXl4?=
 =?utf-8?B?aU1GeWYrTERvWEJTWEIvNFhuT2d4SHZPbXhTTGlwcWtHUkNMQWVsanI5S2Nm?=
 =?utf-8?B?N3N1b2xvajJlTEZMWGdqMmRtT3NTMk5OaFVQVG9RRWljb2JmdFZIR0p6eFFL?=
 =?utf-8?B?SXZRcW0xeE52WTZCTkdTMEJYM1JxRVlMaVpxOUVLWTZXMTF3SFhLNjJWS0VK?=
 =?utf-8?B?azc3RFlEb1FjL0F2YWZ1dTE1N3VuS1RZOWE1UDZrWHkwUmJSVkhrWW1XTlQw?=
 =?utf-8?B?Q0Zwam5YTEx4OERZZzZQVGZTT29WZGN0b052VUlJaHIyOFFpWUNaN1laenJ3?=
 =?utf-8?B?ck54Z25KMklSWVhSU0ozZzZpcTcwNVBnczZmRVg5TjBnZGtmM1dSallnRHdQ?=
 =?utf-8?B?Q1NVR2Npem4xbzZGS3FYQ2VBSTFKVDdCMWx0Sm9sVjJQRnJ3N294QTcxTXR4?=
 =?utf-8?B?RTFyaExFakt5SUNyTnZ0b3JkakQ4NDR6Uzk3aVZYV2tQalpONHhnbVVzTk93?=
 =?utf-8?B?empKQWJSdkplR05OUlRtMjN5TnZKVlAvZEZvSk9XVzVIQTh5ajc1TU9UUjdn?=
 =?utf-8?B?a0FEWWpvL1FBTyt4dTJqd1hYaTBWZk40QmZnbkE0eW5CNjk0ZW1heHBEcEtt?=
 =?utf-8?B?RVI1ZGZVd1J0bU9KOWRrOGEyekRCczVRK2lsek9Oa2w4WWE4Y3FhcU9sS0Qx?=
 =?utf-8?B?aFdrWmFhS0lnSTc3R3JYbDFZckFKdG5HdlFBRSs4d0swM0paMG5kMjJVNVRE?=
 =?utf-8?B?SzVReGcyVzhDK3lITG54dlVoMGlveWhvcTkrSFd0KzQ4MHVOSVFtNitNVUNB?=
 =?utf-8?B?dTRYd1BRTTZuaEU2RURwOEhPQnU2RHNCcEZxT3B3YW43M1NqQjJPNGVWeGp5?=
 =?utf-8?B?MnVUZ1oxS0lIOWFwUTF3TTJzcFRKQXBPbzkwaW9xeSt6RG5OQTUzalY5NTEz?=
 =?utf-8?B?OUU0MGhOa3hmRTYvc0dsRjdxZmx4Rk5UemQ0ZGduaHphRGg5VFFLWkdLbDJI?=
 =?utf-8?B?T0xLcEFjRXczeWU3dCtUSnJiOTNMa2dMeHVZODk4YkUvbnhGbDN0VlhVVlg3?=
 =?utf-8?Q?81ri9/EuENK7kgIaRfwPN9cdtSYu1M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 18:08:48.7526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e20466-6b2a-445a-5e20-08dd5c10c73e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8736

Hello Linus,

On 3/5/2025 11:05 PM, Linus Torvalds wrote:
> On Wed, 5 Mar 2025 at 01:24, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>>
>> Add htmldoc annotation for the newly introduced "head_tail" member
>> describing it to be a union of the pipe_inode_info's @head and @tail
>> members.
> 
> Applied.

Thank you.

> 
> I also committed the pipe_occupancy() fix for 32-bit, but did so
> without testing - it was ObviouslyCorrect(tm), but considering that
> everybody missed it in the original patch, "obvious" is all relative.
> 
> And it turns out my worry about pipe_discard_from() was unnecessary.
> Yes, the code is buggy. But no, it doesn't matter. Why? There are no
> callers of that function ;)

On the topic of pipe_discard_from(), Al had added that helper in commit
c3497fd009ef ("fix short copy handling in copy_mc_pipe_to_iter()") to
discard unused buffer for copy_mc_to_iter()

Its usage in copy_mc_pipe_to_iter() was later removed in commit
8fad7767edcf ("ITER_PIPE: allocate buffers as we go in copy-to-pipe
primitives) in favor of iov_iter_revert()

pipe_advance() started using it in from commit 2c855de93314 ("ITER_PIPE:
clean pipe_advance() up") however all of that was nuked in commit
3fc40265ae2b ("iov_iter: Kill ITER_PIPE")

generic_file_splice_read() started using it from commit 0d9649341363
("splice: stop abusing iov_iter_advance() to flush a pipe") but
generic_file_splice_read() was later removed in commit c6585011bc1d
("splice: Remove generic_file_splice_read()")

I don't see any in kernel user of this helper currently so can the
wrap-around issue be addressed and the helper be removed later?

> 
> That said, I still hope people will take a look at the code and see if
> there's anything else I missed.
> 
> Oh, and testing. Testing would be good.
> 
>          Linus

-- 
Thanks and Regards,
Prateek


