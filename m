Return-Path: <linux-next+bounces-5117-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C5FA07414
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 12:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C304161C7D
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 11:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E8B215785;
	Thu,  9 Jan 2025 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dMqgOvxs"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2087.outbound.protection.outlook.com [40.107.101.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CCF215F55;
	Thu,  9 Jan 2025 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736420431; cv=fail; b=UL6YAygK3S5S0wMLCv/o9WbijoR4CpcdhiQHTmvbSO+7BPXlN7m/Yi9Y2hox2+jTWUpGbKm4nyb1qRTqORe7UeucL8c+a2NoSVXtndETQRZTxG6szNBOoo81wy6Tly5/PO/sN2G6q1/CHdsphlesOsuiLnCoM9idNqqV6axvIf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736420431; c=relaxed/simple;
	bh=7cfoB3N3AW48YR6mbVQGFSpyan6/kwphW6TogFnev3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cEczvsTKyVGFZnGoZQXciAxg8A58mvpB/JLoCylvr8s+GfOBse8+Qcno1BBEgE80bWhZJJhYDXVOpE4H7sWWphTUWHtNCe7BvGH4lyGNieqqR4+xPd6Oy1QJzMCj3bBACcrLwftBahyJNFgSMJJ2VgRC6SwY9ymvDUHv1FNR3aE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dMqgOvxs; arc=fail smtp.client-ip=40.107.101.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7OpcjKEGkI3w1HhXoXXjfZaNvJEA52AxHIWig+oKgsJKBBs7tUAafX+W0KNbV6GOI05iTRJZFWXnpqC9o5Dy+pakvjPSG6z3tRpmWGiebWA6YrmsVYwU6nUtBwCxxPcv5xVBDASVVy8zk3q2gj1Gbkou9qfo5ffTNRGXBoz4p44FmFvDRXJq1dYe2UDBMCRCgEKeE2REO6J9SL8n+9yteZtNEDG9pmjjwewMNKt9aJnJpXofhTKut0cIQW/9cMGNnS71RnHs0b9suMkLI0lBQC92fADVbgNBAmCgR6Y/5USPIxF6Qdso591iGBXxrjDDzF9n8GlXN0IhFRaWREsQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ieNju8+Y2Q7KcOElDVy+eM+c6WB7tebF6k7NzXfYow=;
 b=J6250zwGCSNlPe3aQz3hugSXWHDVT3Sq3018CREMgkPRYlr3WjjOz4+Q4WqMDjEYTETgj5Cre+IDUjmyTJGhRnuiiZ5AuCl3QyeItb/3STr290s7Q7Th3tmPlUj16pLFi80qKTz5ul/3s+tC1R9eg5idJBChEMu3C3NFT36crXZzjoAJCo9By4wG4O2v5ASlzO+TPrj8rwURBk64Eh3zEtmUi5dxiX1FzEJpHkpRzSl0riOvg81jD9rIyKFUFgj0y945x8mQtzIzS+zktKhMEEXMpWAw3lJLbOSBGcwhmoE/2zjFFzgZEgY6hUNDXVsyZ2ZGDw3/R5YJp82Apd+s2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ieNju8+Y2Q7KcOElDVy+eM+c6WB7tebF6k7NzXfYow=;
 b=dMqgOvxsuGkK5u/Mw5OuJW5L+cp7Tktib/cP/HVtCufvjOgTG1zNNsIbRaFzKDa0/4qdP7BukoLVhNaFs825o8PxRwTglZHl4d6IPLEZlydiwZPEQWrXNzNRoelJqx+UP3bbzhamLC41ZKZeHOoyVi++pYEc+BzG0bWwMHWfKsR8iqZQtNowlgfNndyLc5T3cWZUjtscXYRiWNc+3pGclnlTeJc8pDKqTfUnZVJgmumFZTNIldil5P8P1qSGYCgpMtbUCn/qoTOOULi6eyoAuPzycJyR3/KaSKren1nwJFSoZHwGiAxJ47qreToc3NkFCAT7gjNi7kB7qBC8obMG5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 11:00:26 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 11:00:26 +0000
Date: Thu, 9 Jan 2025 22:00:22 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <3y5ppixumlykwugifh7fw3it52lsgcaji6tvaywdss3c57qpvc@pula7reak5ku>
References: <20250109155954.6bf8eafe@canb.auug.org.au>
 <20250109160126.199c8325@canb.auug.org.au>
 <20250108213259.eb622d579c12f58a44126e65@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108213259.eb622d579c12f58a44126e65@linux-foundation.org>
X-ClientProxiedBy: SY5P300CA0085.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:248::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 85fa96f2-6375-4371-7ed9-08dd309cd2a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7P8rtx9aHNg8sDucVmstn4ByAD72PTTPhU/K4tlJOEzR5Bn2w2n6ek08mvZp?=
 =?us-ascii?Q?9vJybQsA/AN/mdcFvur9jSUdgJ/rDlY1UNtkATMcL3HfqI1HcYrNcYBBt82Y?=
 =?us-ascii?Q?1kS1Dy4o2mw5CngW+2zDIJWV0m168DjK9U3O+A88y43L8MqfFM0h81ODgIuG?=
 =?us-ascii?Q?SPC6qqOqoTgjGn4miEniTnt7n2FS1fftBtZ6ZhGgMh/MChTiVF3B2FFn0Dn0?=
 =?us-ascii?Q?ojxHl/G+IAhllIW3MeheOYyYkhTFJqhejSxkSHSbm3drus5L47aD7Bh0elIM?=
 =?us-ascii?Q?YJeXhhURsJFWcqzUyOsimbx/czF2LI0JRbw4AIlN4TslqWZ5Q0JRq2TZf2KQ?=
 =?us-ascii?Q?sd4UqCIoNwuyJ03Z/RsV4WoiFbs4jtmR7MuH3SnFOTbZyJllybH6jD000Mjm?=
 =?us-ascii?Q?EPBqkrI4TJrDZzBd8sZhZevqc903Iy3n0y/tItzYayrq39ddCD43efKVrP0A?=
 =?us-ascii?Q?XMBVu5moS7ZkOe+G2YuXP/+DfX9NeUhi+njHkUlz6zdgM1M+FYXWcJNkBocM?=
 =?us-ascii?Q?Vbm90PolbmBUiT2n2JuDKTiEGziE+FKc6vn/INHpDz0aD+PTyo0pRonRJu2j?=
 =?us-ascii?Q?M2FnV/4jmKxXX+LvTrq9iJKgOcrem4ju1jQymI+5wBI+MDivAdNB/B3kySEg?=
 =?us-ascii?Q?XWkeHjpZOg0M1EnMvuWxFAM3PvQ3yiOvsO/5O9TY49OTbbReTwrUiUkxJ5kP?=
 =?us-ascii?Q?RbsUVkUgxNz3DXg9PwtzUmyypVnYY2/UylHiu6LNwVok8GmZGrslg2ougcbj?=
 =?us-ascii?Q?yWSL39d4KfJk3w0+tU26SJ22IpO8zkWtD7CkVZWTN+0Y0BSAwH5TOQ4KJqIa?=
 =?us-ascii?Q?m3+qGMu3+lLEI/6syUxawS57I+GsTiQ7gTM7zruwW2oAv36vcwfK/v4oUvQF?=
 =?us-ascii?Q?LQcjIx41eRrIN2yrhNGl8SQsQBBWDHYBzsL4NT6q60G04KmECidCjtCXUqSL?=
 =?us-ascii?Q?Ixp0bbcEiL7j4d8JEs0i0Hr9mX/8Y2QYEF6JR0av/2DX9d3VjCwcSv7UbOys?=
 =?us-ascii?Q?+4DGTo7YFBajmxlb6bNlveSP7EgpmTsqmUbEsEXhpri6yHWwE8XIOFYriciC?=
 =?us-ascii?Q?sBzO/xDMd3PzX0A64/GtCSA8IHQLVyrF/v91jrOgZhp8QZvLcORHNcpf5trq?=
 =?us-ascii?Q?mNgUHOG1uuLwLCNNBtvzkehbLRAMxnrNJzJz7FjFKZ+7eWiGsXHEjk3xUEsZ?=
 =?us-ascii?Q?I0tks1PDV+3UVE324eRmQBTURhXeXIzHEogPIthU+xqRrbo1O7gTQ3qtx2NG?=
 =?us-ascii?Q?/NbEyZjtrgkIXbYBdoCjUGcFPzDxG9GQVwM2BDPRUzrTdQb3/13LUdvloDzU?=
 =?us-ascii?Q?wmLe/vE979HA/efSJ4tfKRY5EHtpHDe60s7siGWGUASoMwMg8zX8HDL88ZrV?=
 =?us-ascii?Q?2FeFyAb9sGgHg7XhTgU3Ouz7RfLB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hpWB316rPRDsLS/3xKRKM8khpllRwN6HBlFAEtGH0fTdNgqOQVew1f+5nq5u?=
 =?us-ascii?Q?KgS4G1Hryy7K9M8IEh33Y5zYgwqNGMwCkg3pB4bDnbC5CQLi/b530hfIvmXx?=
 =?us-ascii?Q?JGxZ2bNx81tJsdJO4ZfsYWA7v8CcgFDIbF14wgJu0R6yH3f7i73JhYXGMT4v?=
 =?us-ascii?Q?cu51ezsOFBh0oSnfRDUtBsKVi8G2xcFnBpgFDDh20dGzFmyRKCMTcQ7q80BW?=
 =?us-ascii?Q?AlMtj4tMblBmIvF4HyWuNNIWIEERu4ErayH8UWsonaaZaiZ1hyxkXFM9bUPY?=
 =?us-ascii?Q?XFGYvFR18vS9/7kBt9KnIHsrAb5eD9zmCThj3CveGHET4mezfWbwDlmlR+gq?=
 =?us-ascii?Q?36976Dw0CaNhFZZSONKLva3x6EQpBIAiRfHtMx6jNOinJ+usrcDNfMgPeAD7?=
 =?us-ascii?Q?7RLaTQy4+M+vxZTba2PXZyTgbCEGLm4pnxVOgt6BxRTaOyTQkzauH2+IkWiv?=
 =?us-ascii?Q?Cafd1etMK0s2E7h4xeZ9L8n+GBrRsyhPg/S/U2CaAT7NHiFHqV93xfeKJ49s?=
 =?us-ascii?Q?N4lpPGQc26h08G1z3FDeaAcMbER5OMvOp8tXW2g4uYjM6RvZVxOgXsTWID3Q?=
 =?us-ascii?Q?/27Zn7WvAfnP0aeljB8VqmbmeIJl6pD8u5ALJDCgdEBzegmgU1kCJsmL0rNw?=
 =?us-ascii?Q?B9EDKQUnnQrGxHlzkEct1e3beLD4U8df2BFq3J74IHhx7QCi4PP97I2iLyr+?=
 =?us-ascii?Q?VPS+NEb5DWPSCc+mk2bgFaWXYys9PaxlpYrLVfTTW58yjquKwGv8DVFJXmFD?=
 =?us-ascii?Q?N8QTs5yvyK8I+u6ygD0j/Niv07n3Nb9WFla76M+CuWUhDaX0jNBfIh9pDB0q?=
 =?us-ascii?Q?SZ1BjKzOwaG1BwUvVaY5IeMRx7xxc8dHqzTqanOyaLYaAgmzfoR9ete7SQam?=
 =?us-ascii?Q?hEOreeW/WZvTkwHeWnLla7Gai4UOcNGx4B5LjaVjVS9y0sr2l7xPqpT/XePf?=
 =?us-ascii?Q?+1LGInE80uvJEIu2bw7pT5eNN81G0sE2GPMMzsWl3wtXD65kL9SfknXG1SQ8?=
 =?us-ascii?Q?NtU0VDX9pb7vFrgk2Rq7bYiUkxKaoC9TcImlM5BlFb1z3GlIiVbOQIEeRC7J?=
 =?us-ascii?Q?VS/Imt/dZ9lWFCNHPxLNPGgtDzSVLD8FAmb3zkXJd7ydv8XU25Ljg6Xo+uRh?=
 =?us-ascii?Q?UvnurWCHp+5aNbofOTF2DVir9hUGYKsD+QOG3Tsy56z36fJc3z+/EQ2+E1gg?=
 =?us-ascii?Q?B2j5YFoyqLedi3qhzy7R3hRE5fLxwE1Ybx0ThyPeXFOwxEUuJNJsqi/KOrXh?=
 =?us-ascii?Q?RAyRgRU3M1gPqJ+YRG2Agt64glSfXxmEAHeB63+dSQ19f1yEJrkfDCsWdU9d?=
 =?us-ascii?Q?zPTs0mw5kAAEDQi4xEWAjaqtB6JED4Wxc+12rrHiKhMJ/inUSxrLQSsdyDew?=
 =?us-ascii?Q?NkCx6NhDpPQS7QfpUKN2AK/IgDEcqj2pPn3ZfwC8ZI9dQ3yyEzFYEGXhNY7i?=
 =?us-ascii?Q?1pghZ0RUda37cCzI59Yh+0ndA5lSYnWTsDyXv+vxG5QQS1avAe1dB8WdeNGT?=
 =?us-ascii?Q?EvMd5sNjJ+deS0jtKmny1vqw9LHKTHyfqVu73voaZlwEFM0HFHP37b6QvVL1?=
 =?us-ascii?Q?mQwsLkbNppqzp2GjznX0ypplgzz1NpQX18NFAoue?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fa96f2-6375-4371-7ed9-08dd309cd2a9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 11:00:26.5142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8iS1m+fw1nfHCaZkupymFxLCR0eA8WCJlkcsg2hX+WRJXEA3duUGDQgm8zqJxhAQlP/dJaJ8JD4nk46qb266xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

On Wed, Jan 08, 2025 at 09:32:59PM -0800, Andrew Morton wrote:
> On Thu, 9 Jan 2025 16:01:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > On Thu, 9 Jan 2025 15:59:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the mm tree, today's linux-next build (x86_64 allnoconfig)
> > > failed like this:
> > 
> > In file included from <command-line>:
> > mm/rmap.c: In function 'folio_add_file_rmap_pud':
> > include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_328' declared with attribute error: BUILD_BUG failed
> 
> Thanks ;(
> 
> I'll drop the series "fs/dax: Fix ZONE_DEVICE page reference counts",
> v5 from mm.git.

Sorry about that. I'm doing a local test build across more architectures and
configs now. There are a few other minor fixups that are needed too so will
respin with those in the morning.

 - Alistair

