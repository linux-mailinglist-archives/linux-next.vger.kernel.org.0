Return-Path: <linux-next+bounces-5698-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C32A56B2A
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 16:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B90B3B4844
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 15:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0E021C182;
	Fri,  7 Mar 2025 15:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QFmhOV8E"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2068.outbound.protection.outlook.com [40.107.95.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B017D189B94;
	Fri,  7 Mar 2025 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741359882; cv=fail; b=HkznfzEMC5gQy04PfP/z7Xr4mWTQX4L0Eiq3pMKsXr898ICHT1sv3XCOQNfDnsF1JNyAraAplrOYKfiAiuDuuqbiHKcYrx7/OEEnMFHl0sU/YnzdMV+5ttu+g7RKVDwJ1TPlwAOKHJeFOnR/oe3ZwDQukT9GCZ+UobsgpXko7CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741359882; c=relaxed/simple;
	bh=vaxNXbzb2y4dLmY5zVduggw+mZlrlz3ISbvc/DUgwps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u7KSINMIIpoBZKVjiFsZsB8yX9LQn7q4im3uduLUXBlUXDvqDZOpfErVDQV+p/k29jxoDTb1u1qssKKevp8BTUO1M32Fpy61PRf0k/73MCAMPqh9KuY+POnHqHXzBVuL02puEhatDQsWRgYskXgx9iOuwk6PazWFCTjiiqZt+P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QFmhOV8E; arc=fail smtp.client-ip=40.107.95.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTVhOD1Hp/B7kNQKgJ4h6vtncwlpW97Iz3r8DyKAS9cTFrZ5+b0RkRfh2qUDZ2gUlSnLXDKTY5fQTrHuFFNm0EdUvR1jndRc/laIGv41AWeMD9AQigktSfGOqXZ1DCaZuU0kbSI3IDRuqr8MRUEVCAUsI2Jg0kRG0josku8SfK6JsOhCNK6u1pGWL/8RiuW9HR3igEKSVdJqDzH8eFh4I34QQQjvmVquWtdS21uL1tXOkd9yP13jDvY7NrHnAoHy7hPuTmpuzZBE6BYvlfxjBtZ5REyymTqrKvdywWP7d/UYMymvzB8CrbQmV4HXds2L/30mjd6EwUO2MmpTd/M5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzAdnqoNhPFrcTF4ap8kjipi0GN91MHLSeXaO530pjg=;
 b=UQEzYwJ8t3AFgKtEZAcTwQG2+tmDXMMMTfduKc88r+7iDKER5nTsSrkELCr14wmNurJzZ84GjF+St/VY4rzkHnSa5haNNOf2fI1R3cZQdEv8waLl0IkohYlt0dhSUl1EYCs7qWEv5wUpNFZq1TvH+pzte9P2e2UhBFY+iKZJPjD7mrIW40ONBUkqotES4IT7XnYI0Vy0pECswnwegdTAevQgFDhY0lOvgWjhMjO8t/HarJFusgnyRqhdKSBO+11VwzLa7c0PhcqP8ZN4+tItu6nteNe3EI826V7iU63X5iIhn4gZoVMtaIN5kctGf0+RTSxl8mV5jfMQ4A0XB6xyCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzAdnqoNhPFrcTF4ap8kjipi0GN91MHLSeXaO530pjg=;
 b=QFmhOV8EriamnW2g6xNB7Z1jsNqAi7TUVHcmPQCnsWRiv7dyzXJzpiPb6jF8FHHZZLe44QZJeanV7CVWbwINovbBEA0UhoByOvllGilL6wGy+Our3/kvK75jv0Ai9tSmSTAwsRQYqQD2OEYTmSVIwR6G4oe4vFvfCMikS6LJjFknWcIVQJSnbugLY0spsl1HQYNMn/wtExJRFf/3r3ZXTEQR3s4VO0r7pzyWmfX6BaV5sD69HkXWURjVXWkavReyXc1ctB4BOKT2rYRIwAJ1Fg7jvLkindK0NTw8cKcGAmLwa/HzNaA+K7ifLG0PnaS5bpf8Ynz81aimranuFYlDGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 15:04:36 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%2]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 15:04:36 +0000
Date: Fri, 7 Mar 2025 11:04:34 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Dave Jiang <dave.jiang@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the hmm tree
Message-ID: <20250307150434.GP354511@nvidia.com>
References: <20250307195715.0b7abf0f@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307195715.0b7abf0f@canb.auug.org.au>
X-ClientProxiedBy: BN1PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:408:e0::33) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|MW4PR12MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: a17084d2-87e8-49da-00c8-08dd5d895fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ctKoawi4gMlQiE5Z+PJioEV5oVtqkr/4gTiF+lbafQbfLqS0NNhANtYP1MRV?=
 =?us-ascii?Q?WMIIo0U279FcegroGhPZRawwIQhCZWi+Y7GCzUe+dDLMuP5CT6L1UwBMTEEM?=
 =?us-ascii?Q?CwUZnhsKKZcTvdwytuYp1vV98lGKsciXmBjGjdut13g70rmekcCU/l04dd8E?=
 =?us-ascii?Q?H6n6KszIU2CF6DKeZib/J3C0lkkqmWNcahPIBcinyOX1NkJWX9vrgrUHNy9u?=
 =?us-ascii?Q?I9E9HrW4HJzTGZ+cI3Vnx0earxi8DbwDLohklp/qio6TSeYC+dwR2a09u4KJ?=
 =?us-ascii?Q?5gVpjCOZrKe2BgAA/+tds3BHo8CFhWX5GRNnoQqbQHL2YpIjt+GseRD2WlH8?=
 =?us-ascii?Q?M646cEELUMNN7GYxNuLNu6hx2gMHUx1r2ncPBhCMFg+SrVRqinaGyYcNlmTM?=
 =?us-ascii?Q?cy28IdhPyGUdhKxT3aRqQmD4aI2GQr0VsThJNAAReHaLhQWgz/kVSjyOAPjF?=
 =?us-ascii?Q?jwiwVwQmpFWzQ5410FP61hVyiUHjuO02X30mDaM8Y0G/Dr/oi/CRVxBiTf6q?=
 =?us-ascii?Q?ZQrFxRcmCfzu7JiwTlHeMBuhwARW8Nrgn/6PTUKhyT/FP4LgmAGpUdbFJB9W?=
 =?us-ascii?Q?HnQIJNZp5jWl465YON99Av3mgRwjnagYmWWPI0dQLCL3Dy3BkE7HPPHVhppi?=
 =?us-ascii?Q?EByes2xz/+U3/jgKtKe+WMq3OTWkMONP0adM0dGZ1/6f+DHQ+s+01wDzT4Lo?=
 =?us-ascii?Q?3pTsA+PhVOfL7PKIV9YV+bH1DHumZF5XQtkuQ1mA/N3tzKhWavcgTET3TaTH?=
 =?us-ascii?Q?P8Qj0fC+huQuLGiWSehqljQwXFTD6J/hoOHXqO8T+eu1jGWjVUakdI/cYlox?=
 =?us-ascii?Q?u2WAp1Pmx2NRW9dCHcuanJRbcrpdP09O3hxFhDF24KgFs0pcIIgDX8qOz26I?=
 =?us-ascii?Q?HU3ZhS+0N7hjKSh7dsxFxWPJz1GEt9LzHrk3V864QU6CITNQ+AfLE+TCw52l?=
 =?us-ascii?Q?aHndZfAuMkD+2lVBtyGOdT/G76hQaJr0XsJU+Jl/wqbcY7h8RMq45Bup/HM2?=
 =?us-ascii?Q?6kuH2c/FN4v3ARp1Cf/x3nkH8sJN1D8b67AA8GJc9bt22i7R4W6LUY0bUzV4?=
 =?us-ascii?Q?+hzes7xsJVxPj61eqxz5fbCGhZ6lZ83FgseNkaGeubyPKggYohYgW+rWR1aG?=
 =?us-ascii?Q?2Q6Vfh8p1pKQkUhTVafInGFhDr3/yIgz8peHNpPpDo89jiE0l7EEgGqSAciC?=
 =?us-ascii?Q?rHCJvC/eA6c8W3zSmW2tv9ptzGTiH1spmoGhqSMtO9wjciVIK+sUV2m9A60K?=
 =?us-ascii?Q?/hVplsg/NSp0MAEDf781AtvrijSKqMkYz6VBU8rrFmj7Zem444+DdR95E4kA?=
 =?us-ascii?Q?LzUASRPjNRE/S/f2zHeWbxFFvA1Zk9drdB/HFkK6CGuWOK88lGeC106iE2JN?=
 =?us-ascii?Q?WT+2oL+yQqS5T4zjfHCGFmcoOs9Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR12MB8663.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5C5WBK19P04rGO4nSsT9fcztv8GtFTbqj5ZLhgWLzUYcAdSOTTO4gykhQzCs?=
 =?us-ascii?Q?N2Mj1W0C3rtqm0qX31R5jCQzALivL+Gy7HW5myT9Bw4kiqk42pnYJUIgyZjj?=
 =?us-ascii?Q?WLy1eSr/svt5Hy/bhdlB7+pzzFaoiXlXxH2fq7Pt0x4QWWS6CHxjjoD9MHMr?=
 =?us-ascii?Q?RjrC9/nSyLfgt+mCLsRoPc32A3et0DMElNpaSZY6F0bmRrmbne68HSotHA0f?=
 =?us-ascii?Q?p9b+5EYwQiWuwapl1cMnQThYH8JauwUxIvaKC2V3MgFPQM3SiNqMRbKlJ0sq?=
 =?us-ascii?Q?WslwUHgawf2/nclf/BAbnbgAT2VzAMS7GdSdreAlpBuXTPo2jOHKEerOKy71?=
 =?us-ascii?Q?mesaXH6PUkOQihyTZXhLMhqUQMdt82HdiNC6+AlqQ7PpHqqaYrHndhzXkDtz?=
 =?us-ascii?Q?9jRx1SpTtRbgKEiynq8aId3bjNFvYXuGrTicysHP+o8yIzQTMCjKsOtWwSo7?=
 =?us-ascii?Q?pcBobwnMlzaWhKV9o1d2b+pVHl92/bx/LDb+tyiWdgDKuHwjmRBlImec/KZK?=
 =?us-ascii?Q?+1PoYA5Ns45esjlDDYBPfDiu7u2UgGRwtEtS7YAEoUiEq3Xb7n4AiLq/OF2f?=
 =?us-ascii?Q?Hrdhafh2t0xcVm/C7g0TRvUEkfOqcsr+9jgNXVQ3sSv2wGsajhPREIAx6Fj9?=
 =?us-ascii?Q?FmcbSXvqbRtHvspNsaz/rEoiyPumMF+WqjrUqCMAHI78MI7o8roMpq+RbkXs?=
 =?us-ascii?Q?ZA1L75ybxkXhF8u5IBJ65OfRVqJyZKK/k7PSCNm7+VzAHHRzHYc8gXpLnWTa?=
 =?us-ascii?Q?YdDoENQcgDk/AaROqZqgl6hOYM95UjzAb+iDmcGVV4IHdy+VQnU8HOQym4Wx?=
 =?us-ascii?Q?fMMNtU1sQ3sYemlFIRWUXPeeH61iL3uUH9qatZHSam6WNk+WAL/0JcNfeVqb?=
 =?us-ascii?Q?f7XEAm4eKhEEvN335iuntsUNWzTdyHUKuOL3CG4nA+J5NbNomISIOMyJykKS?=
 =?us-ascii?Q?aM5VKVHOfEAPqhruQZXIzC1NfICLKFguhpe02gpDP5buC8qbE0cBmrrIPtFu?=
 =?us-ascii?Q?acVcaxw4CB1+T6JDTpRia6gTXFOWsFC2fKMJN/hRJnO4RHP8inZmrPgJuDpr?=
 =?us-ascii?Q?wOwjge0eLvU6ZvDOs2mjDud5OfjXxPJpbT2LS+LZDEMsnhP0hOtXERjz0tNs?=
 =?us-ascii?Q?Qy9S7QYV8w9JD00r9GRzmDy53igyF/aaNqOjRCybpNnapk+fTJKjoguDAUlT?=
 =?us-ascii?Q?Tb9nRQn/v3qO0b9qyQb1VipAh6I2TCFb0uRaXwKiKJtREoco0sM3JXZh5lH+?=
 =?us-ascii?Q?7kNI/NBfdy19FGaDRoxNiDby0Ekk+yUSU+MQHWgHDtgMBIzqDuZs2pE/D3ze?=
 =?us-ascii?Q?90z+gxftovzfSn5HfAUriDYzf57WdfbCTq0DWT0TVs8sbbfc1jsdZ/1t6rMr?=
 =?us-ascii?Q?h5xKjPwzrriaw4dkXwazNACnRRC+8Vc8/lQ42bdrDY/TweFLPaJFgavzbWZ/?=
 =?us-ascii?Q?TC3N5t0icSTJMt3roFSSMDCL9mazGqFM4IfxyBvVDRyUoSF/3AV4QlAqFUIq?=
 =?us-ascii?Q?CGSvFMhJWgf7HWX3LvJmV9jDV5kT+85Cyl6kTgDKPtaMNpbz7+wMx+ZJRqob?=
 =?us-ascii?Q?/q3VeuFFka3Yp3Y9D7pdC/fFjHodGGsQYFG8j/a9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a17084d2-87e8-49da-00c8-08dd5d895fee
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 15:04:35.9466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCqEHibSQVSwsbpgx8xm8l5CWmE/mmZatdz0EgWVQK9ZKBCOdwDNg7C6yH9/L9u4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7334

On Fri, Mar 07, 2025 at 07:57:15PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the hmm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Error: Cannot open file /home/sfr/next/next/drivers/cxl/features.c
> 
> Introduced by commit
> 
>   da0dd17604d4 ("fwctl/cxl: Add documentation to FWCTL CXL")

Thanks Stephen,

Dave can you fix all of thes kdoc bugs and post a new version?

Jason

