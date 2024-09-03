Return-Path: <linux-next+bounces-3563-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5A09694EC
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 09:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28DEB28349A
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 07:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F991D6DA7;
	Tue,  3 Sep 2024 07:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=viveris.fr header.i=@viveris.fr header.b="OIoUPTXO"
X-Original-To: linux-next@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2127.outbound.protection.outlook.com [40.107.247.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E51CF2A5;
	Tue,  3 Sep 2024 07:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725347526; cv=fail; b=QhhcSaBYchrbRYAIprNhQvDnv4P0oQA0zVZsvV9ITFUl/u1hNL7O72xsvA+sW6kkN/G7qk1jxP61kHMupTvsN/YEP9ioewX4t2YjKRVW3flAP45oc1AK+ylhIdwN9B13mN2ZqVUz702wfkcCyHI4B+ywS42lZVhTonk3ZF+YAX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725347526; c=relaxed/simple;
	bh=4uat8qDnHPDU2VswC5/mO8myuSXCR2GNgnbWgACYuQs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UH/tQm7bkkvboOZtBhqNk7hYlqBJVraD4A5epNWaP/b3Ax995RA+HybUO1XFBoXqCVk9ijWsDI7mH4mtnqufLWllsUSieWP2PTBMYcuVBfSPza2OQ9DI8whfJmGNcnXCe0SRYDZgmJhQkBC38o2u5iiyiLsXe5vdaL/tdP/KcA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=viveris.fr; spf=pass smtp.mailfrom=viveris.fr; dkim=pass (1024-bit key) header.d=viveris.fr header.i=@viveris.fr header.b=OIoUPTXO; arc=fail smtp.client-ip=40.107.247.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=viveris.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=viveris.fr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4S86GsHCM9Q/R7WXLoXVY21TS7ICOmZLoFMyqSHLvHGzxvsjwRUjBL3jT+ENLZoFiI/Euyx5fF9SldTddnptdz/4Oz4iohp1Ghq8LIGhfJvkC/eHdaYHyetkUK/Z77Y7HnSdNh03sh7/03xXbfM+ytBZGiVMIBpU45pe+7tdxgsB7z2eZyjrySQgPW9fhtkt71J00zglzdBFs1XNlRJha8E4iRRuzMmmo/ilFkCDVs4CODWSRjxqrj1VRo5K/HC/PtjYU2OwZhgDGP0SjMkL9OVZfeAsILQNESBpV15oH0ArSqn4tLS65frtET09R6TIYnCF74LIPQiH1S4YV+hfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYAYkrfFXDfOUZj9L92sqbDEy8bckH2WZ6CqyozLZWk=;
 b=LQnEPDwC27YqdEhRoY69/mMsrd73PFt5k+WgidoDP6it8lvobdIBSgbQHXWSfJv07tECz/UP+A7KWSu0G3qe1baBCaoep27W+VZbGUXKykZMx+rDiZPboCGDXD2ZNXF59O9PxZ2lN+cjHoMhIN+mEmPz1cst3ZXBvdm0wgB+DnJpY3Pg/AyVpQqUi/8+QgKkwsaDk3Ou5GrzBF6FiOYuTk+YQQ+/BsSv9Bh8ry0qsQf4VDT5bWFTWguKOUlDsJ20Ro11vdkurlFeq37wQYguaDfJFGZpxaueXY0OcUQZIdzqhXGIoLSm/2iRtw0P1x4iUPpBJ9JKPFH+JTU2zSbHrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=viveris.fr; dmarc=pass action=none header.from=viveris.fr;
 dkim=pass header.d=viveris.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=viveris.fr;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYAYkrfFXDfOUZj9L92sqbDEy8bckH2WZ6CqyozLZWk=;
 b=OIoUPTXOdgyLBTEB6mSR1unWlMAHSqqJATqIWMEQHiVMffZIISxxoR+Oz8eAz7CDS+fg3fMlTeDJ41m+97fwxHE3OP7dtb6t0XxuEVGaKotCqG6FqT5ebxnROia8p3SXIjno9DsxpH2cQgb6SuEWCI/BSBiE5bZZsyMP/zyCZw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=viveris.fr;
Received: from DB8PR09MB4250.eurprd09.prod.outlook.com (2603:10a6:10:11a::24)
 by PR3PR09MB5219.eurprd09.prod.outlook.com (2603:10a6:102:14e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Tue, 3 Sep
 2024 07:12:00 +0000
Received: from DB8PR09MB4250.eurprd09.prod.outlook.com
 ([fe80::b85b:5c52:2f66:8ae4]) by DB8PR09MB4250.eurprd09.prod.outlook.com
 ([fe80::b85b:5c52:2f66:8ae4%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:11:59 +0000
Message-ID: <c6044c32-aa79-446e-964e-c1539e69a125@viveris.fr>
Date: Tue, 3 Sep 2024 09:11:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the pm tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Adam Lackorzynski <adam@l4re.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240903082123.55b34831@canb.auug.org.au>
From: Adrien Destugues <adrien.destugues@viveris.fr>
In-Reply-To: <20240903082123.55b34831@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0018.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2df::9) To DB8PR09MB4250.eurprd09.prod.outlook.com
 (2603:10a6:10:11a::24)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR09MB4250:EE_|PR3PR09MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: b356d34e-39d1-471d-0acc-08dccbe7b407
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWpLTXRCS1lTQ2gyRFo0UW10anUxWjJIbzFaQVFOeUNQUUppUnBYeG1kcUVP?=
 =?utf-8?B?NFFvU0xWWE1XcDNZYmRoSytzOUtNc2c4ckVhUCt0RCtBNTdMVDNyZ0Fyb2hz?=
 =?utf-8?B?b1dxaE9haG1lU0lYcFV5MGRFSFBPM3YwbXdlSTZTTVhrR0JQajVMOXM0eFRE?=
 =?utf-8?B?c05KbGVyUFJBY2tEQzhkQ3ZxQWZsWFNrekgxSzI0QjBlenhBRHM4ZFFUWVJt?=
 =?utf-8?B?L3JFMi9ESER4blBjZUxUMjB4WUZUU3M2RGFVNVFJQUJLdXo1YlIrYUV3bEY5?=
 =?utf-8?B?aVhuaEdIMTlwOXdNL0VScjJhbVRZZTN3cTVnNHI1ZGlUdTJ2VFU5TEd3bktK?=
 =?utf-8?B?K0tCKy9mZWcrbjFIT2pQTlRsS2pnMDdnVUxkbGJ2emx2bXRnc3IyWEROTnV3?=
 =?utf-8?B?ZjY3SDhGV0NxNkpMa1BWODFlV3JtakxYaHZxVkdtckNqS1VYRjRLdUhpWmdJ?=
 =?utf-8?B?S09ObEZsL0xMclVDanlrNlErbXlNTk9FL3lJMTBoT1BpVUJoZWpURmhuZUFQ?=
 =?utf-8?B?VHRSUjJWZFBsTFhTeUxGYjlNNXJ5VUF5eEV4VWgwM0tuRGtjVFpRSEpjTjRB?=
 =?utf-8?B?Q0JpQ0JCMnlYYVVUV0FzQXdYQkFhcHRMajdMSUdIVFY5K0ZYakJramZWUkdx?=
 =?utf-8?B?YzJ6cVFMYW9qU1kvOE5oWFFEcFR0SE9KdksxbDZDcVR1dE5IM3hjOEFqSjJD?=
 =?utf-8?B?YkJiMVRidUJIN2xtQzJLRG5TTVAwWHNPNFArR0hFTG1WSHlISDBpc01Kckdn?=
 =?utf-8?B?OHgrdW9tUzlzQTBXTlVzTFhuWnpxZDMwRDYxU0FkSlhDT1E1SFJXYmtnemYv?=
 =?utf-8?B?M2hOUnI1S3lVYmorVmp3Yk91WWVndHNJeEE1eTZrSnR2YnpwZVpjVjJjWDFl?=
 =?utf-8?B?WHdQSmpsV1dHZlpyb2tZSlFqa2Vld0ZUODJiT0FwSktVZEhSSlJndVpndndY?=
 =?utf-8?B?cncwcHd6bEpyUzJZWlJISnNySnl3bEdOUmNPYjZ5WHBHUjRwUWhLWXAwZzBY?=
 =?utf-8?B?aEI0cUF4L1RMaFFFUm1PbEl4VHkrV0VRdFVxR1lTU2duTWF1SmhJaGgzM29X?=
 =?utf-8?B?bXN4NWI1Q1VEZVR5Tk5WV2ZQdE9WbWw4dlN4MWhEYUVBU3lyUUxmY1FXcW93?=
 =?utf-8?B?MVU3eURzTWNIZE5vVHNaWVpmbDRuVGhja2hqaFNPa3VEWEFTSFBnZDVFd1Zj?=
 =?utf-8?B?bEVldTg2ajRsZDZkTE1UZDNkdVZsaUFrVXhhZGt3M3RUNFI0TXViYmdWd0tR?=
 =?utf-8?B?MGtxWm9jdWtuMnlYM0pvQ1RqQkE4MzVob3NuMXN6VS9mOTc1SVh2ZXF4UDQ3?=
 =?utf-8?B?T0N2clEwOE56MFl6RGlQM0dFdGpSSWtsRXBpTU1rYVhrT2JlOWNPRjFuTHBQ?=
 =?utf-8?B?ckp4KzFmckFyaWV5VGtWR1JPR1d2Yk44RllMbEo4TG1vSzRiVmtjVVQ4NlpU?=
 =?utf-8?B?RS9LdWo3K0NULzBFd0lVSlhpcmZPZ1ZlR1d0NHVEQUkyTFZzMGMxeWZGVU92?=
 =?utf-8?B?ZS9BQUEwakUzRVM3emFjNWNtS0x0N2w5SXNvYU9scExwa2hqTSswelNHYThz?=
 =?utf-8?B?dkQyQUV6U0NxMzVubzBaVGZFVnhwWFJ5aWhjT3F1cTI2dktKNDJuOGYxZVZZ?=
 =?utf-8?B?Ymc0eFZ1VlFCYzdXNGgxQnFWR1AvQWVmMnV5Yjh5QzhnYWoxN2lSZWdBUmRs?=
 =?utf-8?B?MzVtbi9nUGlFRXJ3ZEtKWDBqc3ZSd3IzcXFMWDBuWGtoekRlUU1lZTJMck5O?=
 =?utf-8?B?TmcvQWZ0b3JpTmpBK0s4VEw0Mk4rdjhYTGdOYUZEZEsvQWEyVHM5a04rZWYx?=
 =?utf-8?Q?awGPQe+hpuIEq0Db93hQVM1a6FKoZUyM7IZGk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR09MB4250.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTFCWHFTejRsbkVoaW42S2pEZHZJQmNnM05HT1NkYzVJSlpuTkxiYTdJY21L?=
 =?utf-8?B?THgwSVc4eWEwdEcrek1aVmQvbEFHRHFaVWtaNElNY2hmTUVrL3FTaytIMUtX?=
 =?utf-8?B?UDhCdmQxQjlyY0FVU0hIdGkwSjJ1RFpidzd3VGZidkt3eFpLenJXdUdReGs5?=
 =?utf-8?B?VG1OeksxQkJlU0Y2MnV1NU52cXNNLzlFZ0hpeW1CQ2ZsT1FCZCtLQ3RlVytH?=
 =?utf-8?B?VHlqSUx5V203ZElvOE1obmF6MWpmZzhudVl0cXovRkVLUGl4MUhjTjQxWkxo?=
 =?utf-8?B?dlJ2aUhFVmQ5WUsvZXl2OElTYjdTWSsvcEVxeVhnM0RBdWIyalRjV2xUTjNp?=
 =?utf-8?B?NXJkZzRzOTdPWjJLeDFCc3oxc0sxNldZYmFLb0pmY2lBUWY3MTN3eStNZ2dI?=
 =?utf-8?B?MjFWd05mMU0zWmtmd3Z1VERQdHZaTjE4VEJzTktyUmZENUk1cmlIQmQyemVO?=
 =?utf-8?B?cTVYbXRhZE1ybHF0OGUrVXlkZCtpVHh0V2JqMERCczR6Q096VmpSRWs0bUxq?=
 =?utf-8?B?YXZCN2tTekxsTEdhS2JuZGVYcWc2ZzYyMDVJbkRwSWRwMnMvK25HOWwrRlZW?=
 =?utf-8?B?ZThVcFZWcUdyN0tNek5oYzdTRE9KdTk4SVFtNG9YQUl0SDNvaDBhQUYvYXFj?=
 =?utf-8?B?UVVkSnNvUGVRWTBHRkxMdElqZmcremozWTY2dEUrdFUxS1dDQm1HRGowNzRh?=
 =?utf-8?B?NkNYQmd5ZHlQdUgwU0xnSkJJZHQ2OUdDdHNPYmN1TVgyRVJmTWpDWnZYRDYr?=
 =?utf-8?B?VUQ0KzY3WjFOTmYzZklhOGdxSlRmdXpuOXE3OWRkNC9xRnVjTVI5dURpakFi?=
 =?utf-8?B?N2o1aG8yL2c4cDZJVWthS0Z0MGsyRWFtWXh3YnQ4SkVOb1k1NEZCMmpzbFN2?=
 =?utf-8?B?Vm44QnpJb24xd1k4OGhncW1qQVhJajhWV3ZhWG5YL1ZCVEl2TVgza2ROZmxq?=
 =?utf-8?B?Zy9EWk5WOVBZTDJoRk1oblJtMEVDRHVRKzFlODd2SWVrczVMT3h6QTR2M3Nk?=
 =?utf-8?B?RXFYN3Y3THVvN0JBUks0QzNTck53Q2hSMFVxRGFsUE04VnJvaUwrRUJkMm14?=
 =?utf-8?B?T0dyZWdPM2p0ZERJQUZQVVJwNDNIVzB2cWxZSUV3T2RJS01vZTdpSVFSVUM4?=
 =?utf-8?B?S2NaZGtYK0F1WkRtNE9wUXdzNGhyK0xZM3FIL3luQnNCQTkrcWpVeEQrMWNV?=
 =?utf-8?B?WTR1R2pKYXhpUE5UcFIrd3dZalpiZG5jU2dneWpPbmRRMThpdEN2RE0xS0ZG?=
 =?utf-8?B?by9HcnY1TGJoOUNsc0pzYmFNU1FpUEdPbGJ6NkdqY1ZzTkFuQTRjWHB6ZzVr?=
 =?utf-8?B?bjBVUEZYb0FKYUMrR3JUQVhFU1BSWnp2RTZUUm80S25NMnVFMlNCNnc0WTEr?=
 =?utf-8?B?enZsczR3RkJCTC8rdUxMRUNaV3FxbFBqWk94RHFpNkFXQlJiOVdSS1FWQjRu?=
 =?utf-8?B?UEMyUjFPWWoxK0VFcjdRaUVTTlFodEhqTHF3VVl4RlNCdEwyQUU1aUNEWURq?=
 =?utf-8?B?a2lJYkUvbEdZM2hXZ0VTaThtT3VndDV6YThsWWV5RUluWXBtL3BGTXdmcGN1?=
 =?utf-8?B?d1g4Sm9rWFdnalFIM1JUZlAyM2pMa09nTlEyV3p4RzlpVWQrWnVZL2V2Ky9W?=
 =?utf-8?B?NFdjb2F3NHBvUnJPV1gxbCt2YXE4c2wxWk5vTUxLZitiR2xuV3VDak5mcUFp?=
 =?utf-8?B?citPVEN5dTZ1dUNkUjlHa0NJWXNJRU82R1RHTFFpd2tpdWdjTEsxSnZBMnd1?=
 =?utf-8?B?dFVEOTBoQXZwQ0hjMFVsVTBxWkwrT2U0YXBMRmI0d2hUTjRaRTlyMEd1WnhE?=
 =?utf-8?B?b0dHamNDZUhUMkI3VnVaNllsOEliQllnVlBNRTVScjFOODlaS3RTVVBKa2I1?=
 =?utf-8?B?WlVVWnI2T0hJVjBWSm43M2tKTXhhSnRHOFF0RFpRTkZIbzkyekJnbGo1QzNV?=
 =?utf-8?B?RkI1M24zRXlTc0dQWFNHVzlqZjczQUdsTTdqdU5sbFgzMnVBLy9rWldoSU51?=
 =?utf-8?B?d0tXSFIyY1EralFodldpdzZweXFJWC9RK1AwMHR6MGdscjh2TTU4cTM3Z2M3?=
 =?utf-8?B?bFBXWXRwMS91VnhiMEFQRG9WNlRGczlJZDgwbFlleUpZdnJZaW5iakpyd2ZI?=
 =?utf-8?B?V1lrRDNpT3YzaEhxWUw1OTQ2SHY0YmxWZVo1ZVVMMVd3WW81UzRpN0JGU25Y?=
 =?utf-8?B?NUE9PQ==?=
X-OriginatorOrg: viveris.fr
X-MS-Exchange-CrossTenant-Network-Message-Id: b356d34e-39d1-471d-0acc-08dccbe7b407
X-MS-Exchange-CrossTenant-AuthSource: DB8PR09MB4250.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:11:59.9151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 34bab81c-945c-43f1-ad13-592b97e11b40
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lhZINhKEJHW/d+CFIYQI7AHyUlCFUQG9spiKuJQd96saPaBA1s7RjmS9WLiPwJa09+rULYKspxjjhpHmPSNywYRI0nDw0Gb8XlvtKZS84w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR09MB5219

On 03/09/2024 00:21, Stephen Rothwell wrote:
> Hi all,
>
> Commits
>
>    5506544dc2e4 ("ACPICA: Avoid warning for Dump Functions")
>    7afea7bc49c5 ("ACPICA: haiku: Fix invalid value used for semaphores")
>
> are missing a Signed-off-by from their authors.
>
Hello,

I am the author of one of these commits, I submitted this change to the 
ACPICA repository, where it was reviewed and merged by ACPICA 
maintainers (https://github.com/acpica/acpica/pull/918). As far as I 
know, there is no requirement for a Signed-off-by in that repository, or 
at least I didn't see instructions to that effect.

I don't think I can change the commit now that it has been merged for a 
year in the ACPICA repository. So I'm not sure what I can do to help 
resolve this.

-- 

Adrien Destugues



