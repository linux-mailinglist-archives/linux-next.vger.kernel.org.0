Return-Path: <linux-next+bounces-6362-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1BEA98CAC
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 16:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEEA41B641FE
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 14:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4F72797A1;
	Wed, 23 Apr 2025 14:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HbUKLoLy"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FDC1991B8
	for <linux-next@vger.kernel.org>; Wed, 23 Apr 2025 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745417994; cv=fail; b=GIEpD+7MzzQHlVLWJ7HHfbXystj8uSD2uT6LxXLCGbu03A6z7U3l1KdYWA8Y7rNLHNGRlNbRWNXI7DWJsOXcA25u0nzsvI2YUJgNHcxAUlQTRIroiS+stI0PFMCvnPUsIqXJWw+nHlaNN1oJ9q+6zJeAC3FNpWhMlIw5b3dIt14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745417994; c=relaxed/simple;
	bh=xXemaCnHwNZDj8+dGBi11YPL6yvb49WOwsIl4of4jT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CmA3pE8W4QFN+10+hksf9y9AFMPBLBIZOeqjkXFZGIOyh1gcWTs5xmNkfcODm5dxCQKDcY7ptlxc4iRyRju9KkmS16fF/4SS4ZJ73fdUlRVG8wd1jgZ1D22uiIwJU2dMK+bmg56zJWXcalZ6Yombmd78TeL/v0rK5EJD4YloX9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HbUKLoLy; arc=fail smtp.client-ip=40.107.94.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=friW8Syl1YFPMNOdcWiC9T2eIZZL5nP5Px2QedEnXMBkYO3ZBW8LgpqHTnj+wK2DhkF8j7SVd0SzfACFWb+H7yXeqIAkPyPN8bW+DYZp4H3MNng28yy+QSme2tx63VKW1olZzPXpwPFovSp+yZqAzf0egkiJzoIcZmNy6i+btR5ig1BO22w4feCHPk+Hy7y6g94CAHjz9pALkIr72bH2TBaedkteGZ5YmwIyveDk8f9GeCAx3JNFrFeGfJHRLi+Shlp7xE8D6+VYZHIYgbp5pxLzAH/Gbn+p+awpecMPLXGFVfc5EFN7svWuF/G++3lvVxwAC8jc0ouv1+pmqRmYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8tmq3FFq7E5nGJFfhEFWhZ6ss/4mRDjNdeJ4ACArP0=;
 b=hunE9LI1mCy3tRu+j0zoBYwAgQ8eBnjYJdeuwYsoQ6NdnRw5v7d6XJSv2PXd2pFIJV15vOVEcOGe+2+18SEQwtdIEsEhB3vrE6T6lwX5wOf1T05b3jwvqVmeeRqafRfA2st0JLeYSkKHwf8SUrZGU5E0CwUpd8EwjcVHocA0PHV5XQisP1wmHv5N1rYvbUxdu1uJXu2OxkFAcbdpsDUMBJBdWRxUeYfip7KVIcA2UowmI2ljlbJ1D1Uip6J9ppnKLUwJ9o89lbiwo5hFCda3E/lJQDccG6hJj9PAamxG4g9K9P6G5ZbpmRZChzrP4X2uKAd36/RgIvD3uHsBl2yjsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8tmq3FFq7E5nGJFfhEFWhZ6ss/4mRDjNdeJ4ACArP0=;
 b=HbUKLoLyvlvYatS0qzKSOVjT/X9ajPMbvXDfsSQ++881i1LIPfxjCqqjn6zghgBaustcjc/X2wQHY89z8RLVpWuWJFQmilewDdQFQhp69q/1KR0JRu7M4PcnYAZzqF0sV4A8y2tGgvkxB/xWyScZ4TL73LTvpkQqpv3VBRYqyjft7busQMBismeIj1KtR2QtPwRaWBKMortGgklv2fSo2q5N6MFS0Bhci0Zt9ygiaa5+ODqu5OtFGBBoOlM9q98WBn9yUNoM+Xz3+jU5VUOTAkJt9KkfKksaYkngGZzX/MditYr7+I7W/urMQaZNo/8z5hlXs/Mwh3+TxPlmrF3KEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 14:19:48 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8632.030; Wed, 23 Apr 2025
 14:19:48 +0000
Date: Wed, 23 Apr 2025 11:19:46 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: Please add fwctl to linux-next
Message-ID: <20250423141946.GK1648741@nvidia.com>
References: <20250422165219.GA1645809@nvidia.com>
 <20250423090845.4d5929f3@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423090845.4d5929f3@canb.auug.org.au>
X-ClientProxiedBy: BL1PR13CA0324.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::29) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d0d99a-6ae9-436c-0f5c-08dd8271e72c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zqr32LIMlPckuf2/kyiGvC7YmzQweUIo1fn1dH0lQ4W7cLXPufPiBlmSIIBg?=
 =?us-ascii?Q?9qzz9DWy0rB3GxiGNjYvvtDuI0VcpXxouyPkbtIWeWdXmeQ469e4gHZbkDig?=
 =?us-ascii?Q?dOdJ2o3bBEzYbV+VTioQvhS82H1rCeKi8fDWTebpYPNv+prT3y5/KMPPAZSt?=
 =?us-ascii?Q?w9BYz9Z6uCSPrfqeixTyPINLQg4xG8Ke5GzvUcU2tqgdOAx47BwIyQPDxOb/?=
 =?us-ascii?Q?UQYwCzw2GzN7OaIlgq9XFE9B4NlsgFAY8hvmPfVyu7jpROjnO0O4ba849RPr?=
 =?us-ascii?Q?sAZtT3/8M6JY1rRUWdMXbhgEYIVUYAyG9s8sLtq6rl9cX6HM/Sl51ZazxU5J?=
 =?us-ascii?Q?SC1wKqyE6zB5y8uYoS1LKei8JJmCUYJajwFwZSm8etjZXlKMgbCZQSGHJDQD?=
 =?us-ascii?Q?pmrGG2V2dORtlQiYvZava+HrwL6grEYjWfNOKeRMJPQFES4q3dd8Pp+cgYkJ?=
 =?us-ascii?Q?Hn11U3bt58bnnGBD7p8DDE6u9cZnp0uRIm0vKWENHgJrls7tnoEsJ605NuJd?=
 =?us-ascii?Q?mAWkSMhKvlfVYQm4YvMkCbmXXTtYmk0PvkKC5ufKC5F7UddBiut5R7cTXYii?=
 =?us-ascii?Q?GP4PRjknXgqxoua3QPrvVPlSPGGyeg6XJ6cTGublFf/y2wIb02Sp1Cvrk7az?=
 =?us-ascii?Q?TSsMotNq1BT6SsEEHuMU1U6dZYd8ruEeiMhQDqJoF7E3DKeaBUchcpxTp2kb?=
 =?us-ascii?Q?Iqftj2rLLmKx5okZeN6vQOMctHOHllQEoxp11XNGvZ8zGRHlGgBhD6dxO1BN?=
 =?us-ascii?Q?ZOvsZHcSkcL42i9Th8b4coQatoEtzttCdyCRYPML/Lu2Q/2dL1g1cgnlvoqa?=
 =?us-ascii?Q?wW4iAyI5VHWHLBDfbFSnhvH4gfa3kzCZ+LNc3d0nYYnLRkcxYSYKY2+Rv/XT?=
 =?us-ascii?Q?tWo9MYxymQ598Hwdu/piHaFMMSJ1/gtJwyjGnDGkOxIFYFTN5/syXT0w91Is?=
 =?us-ascii?Q?Ek8tOskxvDvorIKqkR+QXljdGjfTTQ1bfwiv7PiBSRkPxE/grr6pgZBXV61k?=
 =?us-ascii?Q?0yxDTxk4vtMKtktXQvoz8IH+bdIXfJcJTvShQPxVmEyfb9iS/en4YKOQpUN9?=
 =?us-ascii?Q?VmMi+vlFkhsvNzQiNRUmdE/N+uI+05t6ocZrN1tkxLrcjhU0zLuTE74879k5?=
 =?us-ascii?Q?FGeQDSqVptw2VVMKvn4vvkwJVtmgNpDbgtG2VQz/jK3ezL4QmoTOf+x7QN8f?=
 =?us-ascii?Q?droiAPPwY6JcsNwoHMIT4Tw8iLleUZVGKp4IraJfckGxApdNvffwqm2835il?=
 =?us-ascii?Q?rXnphmmu3OCE+KszOInqr47JBpcug5pIHKP5jB7LqT3PPncWEpXX6186KhpU?=
 =?us-ascii?Q?O6tuxYF99jxlmeyuOe49peAnvsMcYacW2wO07DUwPI6WiZxTjF8pi72SNHMr?=
 =?us-ascii?Q?IozU51hHlGUpkLKQGEmmRaPWqRfQXBiAOoebCgORINZZcvEvzygUKWoAwvNj?=
 =?us-ascii?Q?OAkYHnCZnho=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Roe8wGE5MyPlJewlBFr5Y1/0bXg3JpZTx7Ly7J1eWCcncumR93fVEVOLI08k?=
 =?us-ascii?Q?8ifz644h7E3wNdjQXpUYRTHbMWuEI0E7IsHGvEua3cmrf8nuIITVa6iJmQxs?=
 =?us-ascii?Q?z3IWl7B6klhLa+IdJSFVj5G4ihmKaavhkrv4qYKeIWSwNqzTWXm+akC4/YN5?=
 =?us-ascii?Q?5xL5PXK89SBgeyMfOjfXhLM/IWVyhwdYqCy4TbQqmjqY5erBfMSohmAPUuoT?=
 =?us-ascii?Q?8cNrCnjoivSeKmwByTo8qBgQR6AP+btkV+QerN9LOMk5IY+hv/6Zyc7bK6yn?=
 =?us-ascii?Q?8OPdanHyTleosPbU9EdYO9MAMUqiaPY6fnInmTAI+RaUXk/+0hWGsWFzHnnV?=
 =?us-ascii?Q?1wZhxlDz/HTICXqKyOoibRPeKwgBSLbJv+VMQSB2Id3rnhFunfVsohGJEgE+?=
 =?us-ascii?Q?W/wpkzBD++4Q8AET5tyj9KVS50+9fIiMcl2rHhWvWbgy7Hbp3yE7PQ8WiH0X?=
 =?us-ascii?Q?VxweYQ/5zlmX2DgZrEb+OFgGdNIiBDZoblm9QNjO7dR1acOX6UqRXkpsw1Kr?=
 =?us-ascii?Q?Gs0iyzY60+dDD+J51+6ZlyRe8Kl5zDSK0QObL+SPYIg5rk5PQ6TeSwbOxwNT?=
 =?us-ascii?Q?JunQz1E3DMnP2VrTKIed/OqFamoNXUY63phn+cMDVh9uGE8m93sEfdKsmpjD?=
 =?us-ascii?Q?abB6oezC4la9TFpkBnJK3dG13wjVEw70wB/yJwcqXrU9SPJwSf7qZQG6R7xH?=
 =?us-ascii?Q?3nKTvpcjPvfmgJKwgWLOyZARFO+d+ibXWwYdEY4qYZBxl2IvyXUjshECEv7E?=
 =?us-ascii?Q?8OWzOjEejDVEsHjYx1jlytmBSNQSilPar5rZSuPDKF3x+IrkjziWvnrHOdI4?=
 =?us-ascii?Q?Ti7b5BGYFSs5C7FUlh9E8klSCJPd2I2uOtZNF+b6ff+/jwNsjm0MmtTwxBuF?=
 =?us-ascii?Q?ju93khho/Z8feAj3FFw18gR9NfVqgUEO611clSfD/T5AVivdnccCxqYnKc7d?=
 =?us-ascii?Q?ZlAvWGqYd6XphzQqSlHteqIYH2PnqFYLijw9+pqdF4iXdkZw7/5SIQqFrn45?=
 =?us-ascii?Q?Qb7KSw9JpanQmbDW4Tp81YMzgsLh76sP9AA5BfIJqdcHjAA8yY3+NIVKEp7H?=
 =?us-ascii?Q?O3RwwUclYboMXduwvHuYCE1+Ow/U3WU5GosUOIjlqr6eOWqCkcbEBx7nXd2N?=
 =?us-ascii?Q?+hEpvKKjdDDljhCbFOAhw+gp0BK0dQowG77DJBMmVC1Vrc5OXVwligKVHIBJ?=
 =?us-ascii?Q?o1UoWQm42Mh/0hWb0mlaeG1B0ZyxiIWpSZyl7proI4c7Gb5pHyG8k4V9GUL+?=
 =?us-ascii?Q?hxbi449xfD12HXaQHr1e5q4tmQ1aonq1jh+iQktx+cit3BbFhDINswef7nPq?=
 =?us-ascii?Q?ruAyDzgNEo9FF4XKRVtcs/GWA4kKqgP0JiYzdLqiBw5AiyGw4kiYwhOg95Ud?=
 =?us-ascii?Q?EEMtOqi6cBxp4YIdXfH+5d2zrJTMHv7FnHAzznFTGKOdGSZ3MQSj+TIoaBWx?=
 =?us-ascii?Q?xKEMdz1LwBPbC6FsciUJRIHc8IRr988RTIT2mcFlz8TwjNHF+xFKE4fMx9du?=
 =?us-ascii?Q?AzoXjGbemXkazPO1f0oCtdygfBXfXibYcuIJDD5+CqFNhQJBMa38QYD+c5b2?=
 =?us-ascii?Q?INYOwNCbnuIAkooh1bERuEFyI0xiUrnrMt2l6uqD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d0d99a-6ae9-436c-0f5c-08dd8271e72c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 14:19:47.9935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8Ir+rYJ7Cf1Y+aDebM8zPgy4f6+JUVGN41Jml4CvfP+zq6eoUKVzcTryvDVfoK5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017

On Wed, Apr 23, 2025 at 09:08:45AM +1000, Stephen Rothwell wrote:
> Hi Jason,
> 
> On Tue, 22 Apr 2025 13:52:19 -0300 Jason Gunthorpe <jgg@nvidia.com> wrote:
> >
> > We now have an official tree for fwctl, can you add it to linux-next
> > please?
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/fwctl/fwctl.git/
> > 
> > Branches for-rc and for-next
> 
> Added from today with all three of you as contacts.

Thanks Stephen!

Jason

