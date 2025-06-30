Return-Path: <linux-next+bounces-7277-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45596AEDE81
	for <lists+linux-next@lfdr.de>; Mon, 30 Jun 2025 15:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 748023AFF4D
	for <lists+linux-next@lfdr.de>; Mon, 30 Jun 2025 13:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0753528A1D4;
	Mon, 30 Jun 2025 13:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kcJ1RNUT"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825F628A1D0;
	Mon, 30 Jun 2025 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288560; cv=fail; b=u5tmI15BmIRg096vHRApEcY2RICXCwjjxf0fSyjOxbU5b8EnEEb9IUuxydy4UvmYbjwvcPv8YTUXHwOxnqWVyBkOzXyJv+QyF83y7nqCqn/aQqpO3j4tXJDZcpLw6Uk86eeD+b+ocoGVbYC2i612W93dU9rJDhysjcN8DUaSxlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288560; c=relaxed/simple;
	bh=Oq9ilult3Qbs0leF0oATT/hnCGPFPuulR8qI4tHD4ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B/HWVuitpdMg411+hGwSBNX9FODp6svsZttvRA+VktXwjnLn2U2OeTdwB0JNg9v7TO8it63hMU59SJq8qpeSIYvQBmoahSlLQvKknxjJqT+1SuSdInyBtSQB4DlUKkYbY7gGUoby8/Se4+Z1861Jor/lRts/0/Xwa7IRH3l1H1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kcJ1RNUT; arc=fail smtp.client-ip=40.107.93.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTHkDgZmp4g0sVVSXHn0qdER59thZ5qL6vbuZbmgUZpqLxyXwbo3bduSr6P6Qc7fbB3RUT3v3dVrHdIcCvoNdwcO7hNLU79ZCrshINep3FWsLfsk7kgCwcSsvlEb+Z0C7vx/5JL7DDDvaysI1LziCPJ6qB6xaO5HCZPLiPDPgZmbX10nrS2Rh26KQhz3fnZPzyuvVkKskpKtZDdQ8IW6AVRZtt+HtM4oZ8OJTSrCAH0EvWufeEaYADGxfV+X1Hmegl4pWgHQBGaNCkcW6FhqgmouTlnPCC5vP2TChUnyHg9hO9w6HFkAKfs2Gh37m7LHd3wSL/a6OGuUB/jPIcW5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXOP8zNp67YIvPOK0OF9eRwVyEW+L52swm50jUYdlSI=;
 b=spc10I5y0Hv4mlMlDpJttdyXeDaoJwyDAK69Kr9i3YpVcCfsmQR/Rrs8m6m0VQhX589anqW3w2JwMZH9B0/yB5DLtZJNgtdpWhmTLI4Qnhee10A2WNN/jk8aax6qW5X4uAtfuCUxRP89mtq2MqS5fmHq5Wo+ZuFCqb121SbvvAXj+xKLi2Nhi07PlkoT+/cnc/D+ruygIXI6pMrTEG//NjPStgKLluGyGuTuGkQf3oaQcQKJKwiLbY0Kk2bh4reuQ3LvtrMigvjEfJ89+2T8cQ7/tR0l70CggcYTG6MIGtI3SqsuAjG1XYl/FOzVdfClxcgM2qDjvDg+EpxbN3ukyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXOP8zNp67YIvPOK0OF9eRwVyEW+L52swm50jUYdlSI=;
 b=kcJ1RNUTnYXwpBisNpSY2/f1mmJe3WwHiA+3E7Ctkq5hLUP4Wbs8U+u2WDAmhKbhaA+aexBsOMK80k4MRL6JIfwSIXFnObMBn49di2LBX9LaNE3xC/VheGqxIFuxsal7cfHzcL9DypCmwoEN+MPrkmaKemKfQJYZNjq/Z6iDxO+x2WQ0a7t4ipxAr0m9knS8rxI1YyhpPzJA7qNA0gvQ2R6ZMY1q8dH2ZhOFtr+EWOVRoMLEfFQJkbHpcdqUVCAyOfX/5S9UCmcEJRtzkbEDe3Jl5q5mDqlsjWNqwr4BjQB0657vRNfp0SakinBJ9DhrnN5W2XsaPegsVLaoT/W3WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB8902.namprd12.prod.outlook.com (2603:10b6:610:17d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Mon, 30 Jun
 2025 13:02:36 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8880.030; Mon, 30 Jun 2025
 13:02:36 +0000
Date: Mon, 30 Jun 2025 10:02:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joerg Roedel <joro@8bytes.org>, Joerg Roedel <joerg.roedel@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: linux-next: manual merge of the iommufd tree with the iommu tree
Message-ID: <20250630130234.GT167785@nvidia.com>
References: <20250630160059.49544dde@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630160059.49544dde@canb.auug.org.au>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a326553-f396-45e3-e3ae-08ddb7d662a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QM39QPMfkt59xse1iHLIMiAjWlhLEAtdvb8Be2RCPiEZTm6y+NJXDsZI+rZp?=
 =?us-ascii?Q?tsAZiw4pPWd7GZoAYGlYcImnu79Wqpx9axctyCrwLM8oDWqCzrvoIcW+JqyU?=
 =?us-ascii?Q?EV3L9A3iw4Q/yRqeqleIqBdX6bFADlvti5TQmO8fYN/sGaWdQkbqvnMaeACL?=
 =?us-ascii?Q?MeDrqBBNFULX/7PYXldQqPls6sUXrXor3ZTBUy7lcoWRulc04VDFZKMw7FVM?=
 =?us-ascii?Q?9rXiafjt6gB4VM/U2m7E0kEBWV6yPdKdaxQDocMxT29OI7FXY1kyGr4BR/7/?=
 =?us-ascii?Q?QRk5vA0vLlPNwwuUY2TIOcwmcMeJ9LJNjX5s1FW+ACPJsyf3JZ5omWDTc8qw?=
 =?us-ascii?Q?sv5xbWJmjgYnqI/ZN4tD0geDDjdIE1wqpqm4wlcxXoiWoTjAadSxOHh0qoHc?=
 =?us-ascii?Q?0cqxdqySaRYRTi8yXv7cX+ognTsHo5Geq7hYYhTR+3lFV7zl9cUUqAhYogBj?=
 =?us-ascii?Q?lE04vCq2ZqO5RE8WFUjHHHO/mn6ui//dtHtVbk9TiiO9WqXbtpfcsz0dCFQ0?=
 =?us-ascii?Q?NZQlF4uukH/mUYzm0YrNPky4luRsC3eB1wslWuVT/G7tuXgDiKIlHVvGpmJ5?=
 =?us-ascii?Q?/RPWHOVqYEGwGW/zv7khy0imaV6DZMmtvZGBzizQ/4ufk6EyGQKM7awRjLZE?=
 =?us-ascii?Q?MjamZddpDOYLqtDKvlacfG8tkHBIrUs8s7M4Snp2t7Bou5VHcDB79xTP58gy?=
 =?us-ascii?Q?GnyE49p2xoqAFhQVXKTmbO9IGeWW/uwrGXz4BoAtBkl2rQ8S+wU0NbFwEOv5?=
 =?us-ascii?Q?49wwbgt/vr99jw259f1XX1uOFLtUYMTatF6p0FEjvoiHIm77hBJLMBs25M46?=
 =?us-ascii?Q?4wH5ZAo/WBw8hkBhNXyyRkcXro90qDHpnUG2rmfTtXnpgYI1WVwpLUl+PF2d?=
 =?us-ascii?Q?Jc8/9L+NdN5x1L61uoTZy/dymUIDryMou0cBhca46SZdIfq3BZCGYj4k0UmM?=
 =?us-ascii?Q?s7/RQLM5d0w9+1/+AlS9HCNCj3g1QVZUdF0Nx41vvqSDHPHdmo52dQu4SzEn?=
 =?us-ascii?Q?ktL0dCLnPMsX8bYFNlwR/JkTshPRt/asoS0pUAHkITdtdcdUNhcsudlCeMqs?=
 =?us-ascii?Q?5lQlq9BlyF2w5wF5sTzumZpPYMobPhKzvymqMo3dvhIzU+7yPLo/RANgRXzs?=
 =?us-ascii?Q?rz2nIXmCcLgRiErl7EoxcdvugMk8wIpU6QELW5hsFraBZSWUbFfxAujA3CWA?=
 =?us-ascii?Q?w/UlhDKlx5BSCEmhDXQZydU+P+dv4Sq1M56sUs2By/FT2k0asr67+wNFaAiS?=
 =?us-ascii?Q?x82NPkiBBFn5uK514QGUHk04aLuw6/T5tqQwqzqfu0Y2EBGTVwysrSjbPaVb?=
 =?us-ascii?Q?3ehVWVw0g0D8Gjiw+whV0wpxqcA3r9kdNpCLuMyJ/DRHN7GMQjURM9Y66FT5?=
 =?us-ascii?Q?al2H+1quBHNokrCNE+m030Dnh7DZGtYwWu+joRciAd1KwxQ1oHfXuHE+4gsW?=
 =?us-ascii?Q?/cTA7uIHgz8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5zdgz7oFwMAaS4JxhLyUL4pzuzCnFRvxYNmuTNeTWmq/GIP+KOLVS0SQf64I?=
 =?us-ascii?Q?cOlxspBaFTt3XvlC0yfJ+Ztkh6kbt7HqY+NIiyHhmzkeftIXyS/e84PFLEW4?=
 =?us-ascii?Q?Ka2ULMXfC+w0ZjFcfpcE0jh51339Iq0BYEAXiEA/lrfSb5cmd1bhLHHXpdP5?=
 =?us-ascii?Q?C06HVN2VpqsjlCR/yWXnIdQ2TuILKJwPKDPUzmakO7vAnRGMGmhM9/3br2xD?=
 =?us-ascii?Q?aPgsseMhoYIDAuuH7gaFJASjZz3KgMpAHnRRKf68rP4FcazUrkIw1Ww5WQRS?=
 =?us-ascii?Q?lOWKk7ZedFvdC64u0/zBo3BejNitC1/rFv5wQVhwyzVOzFmrkvULPNn0UvdB?=
 =?us-ascii?Q?XVpzJ22u5elX2svt0wU3fl2tNd53gEgZaWcqm+RAbX2sOFySONIdETwJURE6?=
 =?us-ascii?Q?LJXHyfWxQ/ggDPdGOEUsY+YPvT+Ct3v3gDCsdnherPKJqLEu9XV3FwaGap/b?=
 =?us-ascii?Q?JKt8Nkc9L4mYD2Ay40rqveGk02AUly4/umwJ8mxKl7gKjgjLEpSa2D3RDben?=
 =?us-ascii?Q?gRYq+N+FX6U/XNlTJLvYCCk+IdipMmx68oPLljoNMxn/n2BPh8WhjWROsCc/?=
 =?us-ascii?Q?X15Mo2XbQy/aoihQPzXaWQ3y8X5PiMkSuHXmaUFYZIg5/OHcb0e9akyNlWmH?=
 =?us-ascii?Q?sKXXKfBTimd1EmFlthW//ZNU4biZxZ9jUDKdc+h+I8z1RtsXCmeyCUi7TQnE?=
 =?us-ascii?Q?loyk12llYWH7iHHClp61hDG6TGv5HwmWoMFcxgyQ19ynjW0YPUpb5cynfxfF?=
 =?us-ascii?Q?2nw57BX16k5sZJSe8JVbVD8AgoY1m/y60lENH6nozqdYyUOp8tcB7xuo4gMo?=
 =?us-ascii?Q?qR1unYYJ4kK6Yi6yiFlPpGuLE+iWEwhwnkOPwLEfiIls4wR3rNaIcgSOHxbb?=
 =?us-ascii?Q?IUW5BuoPRxTTK/aEomWtxzAzijgeor9m3X4yOYmAzOznZmxf+buOEmmHOM+G?=
 =?us-ascii?Q?nbx1KGz3fZihoE1VMgn9hH4YBY6BivYZxp8lt55QF+7ilaw8+Tc/OFXMAzdq?=
 =?us-ascii?Q?QtNpRi8JkVuxngBgcnHSwqC6SgjeHTptjp0K2ljM5DtuOcHiI1EXJeu3POwU?=
 =?us-ascii?Q?IrztgeLu632WJtpSCZGFPMmb+1arugjtNxUIcOeQaXUa2yn5OoDURVTNIDqL?=
 =?us-ascii?Q?Ph8HCMbGndpQPGBiP5JIuzd5IVrxISafcmYBKteEo05np6f8ZHFyh4K7XoL5?=
 =?us-ascii?Q?oR3aHGMCpbwmDNEiuSkY1PeVMecnPeCKAi8qsz6jIK/wt3wQsKNbN3AXE4wP?=
 =?us-ascii?Q?nmSJkru4xkPRn2BpXgdTzvd6UQWeEiOPv/5mhrBKlJjwrUjeqMDKWuad4D0N?=
 =?us-ascii?Q?S305K1zJLCUqVIyryPQqMCuI9l/qApfLMX4P1ds3dB/r10xpYAW3l4daxw0x?=
 =?us-ascii?Q?kDVVe3kon0uX8XA0sDzkDLXp2GJ9fcrZJDRi3X/0b6JJn7bt4VxYNY6kPGkR?=
 =?us-ascii?Q?kNPR3m3LX3om85To6ZUbJY0EU/XHhB3cRcmH4bORpcHDWXaRkORtijy6YVzt?=
 =?us-ascii?Q?v3Qkm6KHPLd9+qFs7MR2XLiIsSZ470uw2l1IEtSe/anZLFfiKjirj4kGm8Q6?=
 =?us-ascii?Q?oFqpS/ti+nAMnfIXku0QSU4PwgUrep9SNg1zMkBp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a326553-f396-45e3-e3ae-08ddb7d662a5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 13:02:36.6668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+8737tJSybiUZ3oipkLQFgrG1MJlzpMxUKdZ02jI/IYokdAKOcdGpl7iOL1kai0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8902

On Mon, Jun 30, 2025 at 04:00:59PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the iommufd tree got a conflict in:
> 
>   include/linux/iommu.h
> 
> between commit:
> 
>   792ea7b6cafa ("iommu: Remove ops->pgsize_bitmap")
> 
> from the iommu tree and commits:
> 
>   187f146d5de6 ("iommu: Introduce get_viommu_size and viommu_init ops")
>   f842ea208e43 ("iommu: Deprecate viommu_alloc op")
> 
> from the iommufd tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks right, thanks

Jason

