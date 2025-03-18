Return-Path: <linux-next+bounces-5866-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11990A679DA
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 17:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6A223A53D5
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 16:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29EE20E6F6;
	Tue, 18 Mar 2025 16:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QTcUQkFG"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1C420C48C;
	Tue, 18 Mar 2025 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742315904; cv=fail; b=dnqZqbt58CCR6hprB/w2TT3u/kDxBoA3XIa07t6YadiAqqdryXs7MrrZ2aXTURlwpE2/0tvY4d9gJNDZVlmZV7B3Qqtq6i6qEKgIq4vF6Lg/x9UdJyMTugXykpKDdLpwDjSvAnE1W30KNXWLsNex4n0t6cRTJJ/hfD+8V3YQCvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742315904; c=relaxed/simple;
	bh=+kdYabpZCHshRauj1l4q5JZNruexSj7wPEvr24yPqrY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ac++hQH2ApNPE8ujzQLwlLb3XEHtR4wuM1mniUCuGahVAuWJqJOCnrMRfkh71UOMB/2VRsFZRLjWORzuKpxpryyVhAiuuom5D/s4C8sQuInveX/yywRz3SDow1x6QwyJ31dVJvQsw+++RYzpPtywZteb2LhNMNtNFn+KkZkjCag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QTcUQkFG; arc=fail smtp.client-ip=40.107.93.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYyL5wMTrl22nrhtkyUwKHbJTMD8Ya/Kjxb62n0KflYLSMJupUbMNDGlqt3UKMM15oYXckaRFmntYBANDnURg3GA/GZC+IeG6MdxSVX5dzzZ+7gkWGSSMgkCFHu6u1dLrQz0rzrnhbkWF/QUQOJ6JcR9mK2etEiutGGtHNSjj8vB+eXLjunQB8N0XsjNTgFN8nyDagEYRWnWD0up2KeQU7sRp+7kJ6WViBzQiftW5t/zg5g5dwNzp9InUHm2I3ZYe6sO79GVZhrCVjRgr48t8jQG5KkrgSstDG8WUiJ2pnIxWbNqzw5YGNDHCjAZ7Noh8nDVhQpqgSQRhVwddyeJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cs+14AFLC5qStyz/c2+cOwenxD4zszbF9l56EtmyDbE=;
 b=q2hOP183YagRl4pGvU2YO0ea0I4KH7Dfk5rluOfJVF8lO67SS9nSufyBClEDviLhY8FS2IK12Y2UQuN8xQ4D2lmiOs7YSpGojmkgJNxCsOjydAt7NVBPH2AoZLheFxouetN7ZbQ3RX8p6KcFI9cbvOw0LpbXIHy7uYFSjY6qG320EGP7KNQlzVLlyXjXrbeIBassQEd4PRURo2oSWfKHtr7m148bq3COzFqwKEqfLcykYB8ozlWlF8XP4WRkcqN+YozzcPDWaphHGcIDfl399IeaAhfs3TeB+M+S5kMK9iA/wUAdlhSMBDGya0cjEHdBnzLcN7Vq0abnfDvmYcKlhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cs+14AFLC5qStyz/c2+cOwenxD4zszbF9l56EtmyDbE=;
 b=QTcUQkFG88is5V8AapQUCnDc9VTci07X7B37HjeTD/Ods9XAtWRkpjJX6ytEyP/FyHi6ATo+ae7aEf/fHHwotzBGr9LmXIqcwisxDohuM15sdiE7VH+4vOFLOAnLqL0GnkBdeKiTVq2LfZ5sIYUD3zA4obFR0yV8ItzIBNtT5mo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) by
 BL4PR12MB9508.namprd12.prod.outlook.com (2603:10b6:208:58e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 16:38:18 +0000
Received: from DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::c8a9:4b0d:e1c7:aecb]) by DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::c8a9:4b0d:e1c7:aecb%5]) with mapi id 15.20.8534.034; Tue, 18 Mar 2025
 16:38:18 +0000
Message-ID: <12156012-e009-4dca-afe0-5b0f17afa10c@amd.com>
Date: Tue, 18 Mar 2025 09:38:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the hmm tree
To: Jason Gunthorpe <jgg@nvidia.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250318213906.6e81f517@canb.auug.org.au>
 <20250318110900.GB9311@nvidia.com>
Content-Language: en-US
From: "Nelson, Shannon" <shannon.nelson@amd.com>
In-Reply-To: <20250318110900.GB9311@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0037.namprd02.prod.outlook.com
 (2603:10b6:207:3d::14) To DS0PR12MB6583.namprd12.prod.outlook.com
 (2603:10b6:8:d1::12)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6583:EE_|BL4PR12MB9508:EE_
X-MS-Office365-Filtering-Correlation-Id: 8306b955-e10c-426c-feb8-08dd663b49ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTRuQmQxQVdscmxBU3VaY04wQktsNlNablNoYVdMMys5YnhQVU9MbjNWWEJy?=
 =?utf-8?B?SGh1b2lvOERJbkhtekNQV2Q5QlVyb0F3UXl3bHVtVUZLWTZKS2ZmRGxqNjBT?=
 =?utf-8?B?bDJUajUyVDd6VjJYNlRpRmIydmFNQTdnTVROQVBuUXhqTFlCSWV2SWpjcEJy?=
 =?utf-8?B?R3gvR2N6MzJsRE1xTTRVWGNqYzZWREFCYkV4WU5uV214YTE5SG1PWTI4dzNN?=
 =?utf-8?B?K2ZNeGc2dnZrWWJsZGJCQitJR3oraEtmcCtUNEJwZEx2SlBENCtWMTJsc2FQ?=
 =?utf-8?B?eFZoekNtU2luQmtWNVRVNHg0cW82Rjg0dTVrL1k3WWlrdk1rVnRoZGwxT0Iy?=
 =?utf-8?B?d0hqTnZSVTNFbjhtQ05heHJGMlJieW94OXA2R1hhZUdhTGZJbXR1WGZSSVJN?=
 =?utf-8?B?aU9oRzNrZ3YydzhWWC9aWEhpV1QyQU12SEF1S1RQeFVFcnZlS0J3eE0zWkVk?=
 =?utf-8?B?K0xYbzZMbHBhMlY1S2N4UTVueGozaDc2VXFIdDB0cHBBUE1WSUxzU21lL2FU?=
 =?utf-8?B?OUNQMSs3NTcvSG1sa0RkTzFaQzNhSHdwM3ZTVkN2RU9KRzg3cy96WEFTY2Uy?=
 =?utf-8?B?MFdzYm5DOENFdS9DWFlJVldVV3NhZU50STJ3cjNVMTZOUVBLa1hlQlNuV2NM?=
 =?utf-8?B?a2xJVWFYYkk3YnpDK3V1eFQ3eFAxUHRtMHNzS3ZKaTd2THRkVFpIaGtoNzBt?=
 =?utf-8?B?Mjhkc3V2dFpZL095czZnNHR2R3JkZ2RwUXA2cGxkQjAvTWVmK2p0MFdaOG9G?=
 =?utf-8?B?MWdkNXlWN1ZvbVVTVzZ1aWV5WENvWnVCbUhwSVFNOERWWWVLNS80TG43UXRM?=
 =?utf-8?B?ZnBIdHgxUWFhRkw3NThMakNmYkxHWFYvaEpvenRGN3U5b0tTaFRuelRjdXI5?=
 =?utf-8?B?TzJ3T3JPZlJiUkVMVTQwVTgzeExmWWhEazVlNmkrN3JlR0NpVFd2TWZsbkJC?=
 =?utf-8?B?RkdvZWd5UnliZWh1SkhEL3JkNktPdVdPc0YyLzQ1dFp5MkNieGpFK1kycWtt?=
 =?utf-8?B?UDhNVk9nZU9JaGhzb2UwbGFTN080SFltQUFzVUYvNC9sQWhpdnRnajE0aDRr?=
 =?utf-8?B?NDA0R2ZXUVRUREdnS3hEeVd5bFF0U3pVYThleG85aVE4cllBY2EvbnBQNTMz?=
 =?utf-8?B?SHE3bEQ4Umo1L3o5dllOcWwzek9QOG9jZzRMNDdiZFo1L0lkZmlEQ1pyN2Ir?=
 =?utf-8?B?RmQ4dFgxZS9scDdOSStwenBOd3J0MURyZElWblViL29JV3F3NEJFV1FmNzRM?=
 =?utf-8?B?bStmZk5tWVFKK3J0cDFRT2VKUlMxZTFkYXRrV1B1TFg0VnkwaE9HUXljbmJ4?=
 =?utf-8?B?M0o5bzg0eWpkc1RMSjNYdVRNc3JhREZsSkJjbzJrUGZiV2t5V1ZzUWREaSsr?=
 =?utf-8?B?bjlSY1czL2ZxYUxkVElXZEIxRHg1TDFXZ3QwRXpnQlNoV2RYbTV1VUtQNlhK?=
 =?utf-8?B?UFdVNEpMdWFwRW42Z1JzQXBPSEZidnhsZkYwQzZsWWF2d3Q0S2N3WFl2N1E1?=
 =?utf-8?B?UUw5ZXZRRnc3VUFDRVJEeGwrVVhkZmQ2OGlqdHBjektwQUxhbGxlbDFtSElI?=
 =?utf-8?B?ZnhFN1BsOFgwa2dQakhDOHdZNEdrMzdxeDgwSHdkUWVDUzhmaVV4aVNERENV?=
 =?utf-8?B?TCt1ZlludENwcnVJUTNtTVc4bG5kRjNBS2hvV1ZQdm9BMm94RHlseHRWTjRS?=
 =?utf-8?B?YUtlaVEzUUhKZUI1MXAzOWtwWmx0WHlnWGo0TzNIWVFZS012bzd6Z3Z1b3Vl?=
 =?utf-8?B?SnpqOTdsdG5JUzRGWjRiV0VIT3pJemJkMlRLNlBwWTlZNU1GQmQ3UUN4aml1?=
 =?utf-8?B?YVdPVWNXT0l2U0ZKZWdROWJ3aVhHbll2cGVQRDlvd3Q1MXNTaWMyU08wOG83?=
 =?utf-8?Q?yHg2NzbPqbz7C?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6583.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXJzQnJvVFZqSGRHOUgycVFkbXpTYUpDdE42aUVrMXdqWkw1L2w4ZHVFK1l3?=
 =?utf-8?B?dnRPcXNveWZDcDVsaDVNMktvYWpveU01K2xtdUhVZ2R0Q3ZNMzQwenFkSGlm?=
 =?utf-8?B?Ty9ZQUJqNHBVa2dsa1VQQU9pZUF2UURGVVBLcG1ja1NoVllNZ2NQN3h6RURS?=
 =?utf-8?B?dGVPWnFtU1JHVmJ3WkpZdk5XVDlDNnp0QnU0TVJmd1k1djFSaXNwRWZpODZw?=
 =?utf-8?B?VFZ0VC9OWFM1WXJTeGRxcUovejV2aVRnb3Vla0U3cm9tMGJKNXJWTmZ0amFT?=
 =?utf-8?B?bHpKTU9WUG5IMlZTZzdmUEZmdkloWHNIZzVzN3JKaEFKdklVbGYvZ3MzdG9B?=
 =?utf-8?B?QTFDck90MHhDR1VJbjVrdnNuUm9wQnQrbFBUTjZuME1FRVA2WFJQK0FrbVEz?=
 =?utf-8?B?QzluSzZxaFJtaldnSzBkc28rUUlTUWRvYU13bm5aaGttZVFyN2ZLUXRTVEVB?=
 =?utf-8?B?UURnYitBd3Q0OHprYkh4SlBKMXRud0pLVDJtc1ppTnIvUEZ4SllKeDBlSUtv?=
 =?utf-8?B?MGNYV0V1cldCbmhwY3UrdG55cGlHUmlkNk96NjBHS05yR3g5SzhwS1JMc0lW?=
 =?utf-8?B?WWkwQnVyb0FjcDVPOFYzTWF4c3ZLZUFvTXYyU1doZmV6bVAydEllZ0FzQm55?=
 =?utf-8?B?SDdiczcxOEtocnJnK2xFbGFzL0d5VW43U3d6RFdGd2RlOEZ0aHRRMFEvelJl?=
 =?utf-8?B?WmlEQU44NEM3U0xhNjBzb3BZeTdrZURuMXdoZG1zTTc1aG1hME8rK0dIY3Rv?=
 =?utf-8?B?c3dRZlREYk1LL3BTTW5uNXUrSHNsbmg5N1RxOU5BRVhPcWJCUnAvV0FMSzZq?=
 =?utf-8?B?MUVVcTB6UnphYmoxc05aTGtrZzk2TEt3VFZmckllTURvSGZRUmhienhPL0pp?=
 =?utf-8?B?Z2hGSXVxcTQ1dXJoTUE2ZDRpMWc5d2p3SUhueDhjRmdtVzJSZkxNK0lkR2Qr?=
 =?utf-8?B?dC9ySzA0RDVOeFdlRndwV1I5SWFRNjFXeXF0ZGJSc2RnWThqeDBnZVd6MVpa?=
 =?utf-8?B?cTIrdXA4dzdqdyswdDBuelY5UnB0SXk2azlVMG9vMDdxVm4ybnpaT0RxY2g3?=
 =?utf-8?B?WGRydWJQOVpzTFpMS2ZvQWtZN0VOSnBORXlGL0xJY1ZCZHR5SThwS3lVek8r?=
 =?utf-8?B?aVNIT3JWaHFtTlZGZDd6UnBEMFZyL0hWancyM2UwL21IWjhxSVFQWVJkcG1l?=
 =?utf-8?B?TEtUUkl0RjZDR2VTaEprS1VTQmtOSEdrY0J4M0dMZzc3UXBjREJZVWtKYXFk?=
 =?utf-8?B?R3MreG5pSXJNREVEMGV2Q2l5TXRSc3Jpb0xnZWVJYUJuSTVTRGtpYm11Q0FC?=
 =?utf-8?B?cDE3dzEraWNXYjhJc3dscUlCd3RuZDQ1dVhFSU9ja3ZhWHdkY2FoRzZHbFc3?=
 =?utf-8?B?Q3BTajlkeExVclJyTnU5R1FiYjZBd0l5bHVLeVYvY3ZXZElRcDdZZWkxVkIy?=
 =?utf-8?B?TGhUbmxDV1NDdHllM0lZNS9qUmVHdUNJUmhhMVg0QjFFZEVzbmp2TS9UQW50?=
 =?utf-8?B?eWFOdDZxSC90a2M3ckYvek1KeHYwUGU1WFRVeFlIVVJEU1FXRFNERDZObncw?=
 =?utf-8?B?ME1mVE9YbVVSU1ZPTzZNV1dGZmg2Wmd4b0RJLzNqUjl2V0JKRHFwRFB6d1J6?=
 =?utf-8?B?NkNmdkhVV2VZd1M2dCtOSExsM2dadHlSWGt0N2dIMk52eXA3Wko0L2NjMHRK?=
 =?utf-8?B?eVFTSjVrWllpTHRGUnNyR2lXbXZTVXViSXNaUkM3TDNhanpPa3lKSlBkbFA3?=
 =?utf-8?B?MGREaHB6MUVZN3FJNkl4ZitNZE1PWXZKTmVacWl5M1ErcEMyTmlidmRGaldG?=
 =?utf-8?B?MFNTMGdEcXplYmU3YWYwbWFlZmlBcE93U3oyRDBWbURoQW9QQUMzNWJydXdq?=
 =?utf-8?B?eXJCMnp3Q2dXMzQvMDJVaWFRNDFSbi9Da1BUWFFWazV2UE9KMWtFeUpjTFd6?=
 =?utf-8?B?RVJFNjVscEFtWjNvbVRHZ0ZHa21CMXZyU21HSWlnQzNhWFNtWk52eThqMjVB?=
 =?utf-8?B?NVkzMVdRVzU1V28rMXR2Z3RhTDUyNWt4b3c5eERIR3cyWGovQ1ZZNXBDV2pS?=
 =?utf-8?B?SlFqM3NxUFlHZzJVRjFydklhVUJXKzg5ZzJSLzkzM1pmV1l1RUhnK3p6SVVZ?=
 =?utf-8?Q?XOSh7rz6oq4B3FVJSWYiKp+CV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8306b955-e10c-426c-feb8-08dd663b49ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 16:38:18.7200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDCrDmsUddHn3OO+RybBylbLjxKLOIrHwJJT1hA5h3L2iaeZMwFPATPjFjguMeBc52pW2LX0ETeaKD9/tqbyxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9508

On 3/18/2025 4:09 AM, Jason Gunthorpe wrote:
> 
> On Tue, Mar 18, 2025 at 09:39:06PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the hmm tree, today's linux-next build (htmldocs) produced
>> this warning:
>>
>> include/uapi/fwctl/pds.h:1: warning: no structured comments found
>>
>> Introduced by commit
>>
>>    16384467ec8f ("pds_fwctl: add Documentation entries")
> 
> Thanks Stephen,
> 
> Shannon, this is the same issue CXL had, do not include C header files
> from the RST side if they do not have any kdoc comments.
> 
> Documentation/userspace-api/fwctl/fwctl.rst:.. kernel-doc:: include/uapi/fwctl/pds.h
> Documentation/userspace-api/fwctl/pds_fwctl.rst:.. kernel-doc:: include/uapi/fwctl/pds.h
> 
> It looks like in this case you should probably add kdoc comments to
> pds.h
> 
> Jason

Funny, I was just doing that last evening.
Thanks, I'll be updating my patchset soon.

sln


