Return-Path: <linux-next+bounces-6623-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4DBAB073E
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 02:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 216901C01E38
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 00:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D221F2110;
	Fri,  9 May 2025 00:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uxe8P/fc"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371C03FC7;
	Fri,  9 May 2025 00:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751582; cv=fail; b=jdDIYKDheosv4mRFLfMwkt4IZ6EjM29Mq4e6VA32VWm9DhFctOITFrO/dPRc+mL4XetW135EyORQIsLIzaPSh/xR5NFJF8VpEiLGJtEqTbUm9npg6YABn6ju/HDqgnYSiqFSMy4VrGp+N6o/JUIkRj29b5jDJLohiC5QmTh7JoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751582; c=relaxed/simple;
	bh=DRvjoCnQ6qj7JQn6jJcvrqZJtkb9AEekILbm/VO2YRw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hZUN2XtHReFxdVN3Wp0Ikawan7FfcZp1Lnv8O1fx297JPOc7rxD9jkIyx090eYbX+WGUiN/UkHZzzYGRhMf39CKgEJyb/7Ut9GclfSvC7bjI70oItRiZKdSAjF90bw+cGYCpYmAVFLgDfB3AtkaIW7bW87YgokMeq615CzLcZzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uxe8P/fc; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746751581; x=1778287581;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=DRvjoCnQ6qj7JQn6jJcvrqZJtkb9AEekILbm/VO2YRw=;
  b=Uxe8P/fcHSSJVDskqxqBXGULlzBdL8aJGY2u9nm2eaBxRjvnk1oGoliG
   9FmSLbLJb6rK77awgAdM0hruD4AeQ7KIoLGcOyRjg/HkZjWB/NUsFEiC8
   9jiaCfZT1ZflkRYTQ8jS4Mjq6MDMaQ0z1MrMOebt2/GwhxSutvFswwYZQ
   Imp94O4DB1lHoo+91Ds+bY8NEgD/i6VwkdSb4HYWBwfLUnakCYSY2dOXb
   fUxwyMz8Odx9H+Lvji09prqyfoqojOr9PyjDukGOkOvnoxUd5yRssK89q
   /3ibtbvWAqONiN+g358g1tFJQpg3AI1uyZaNxJ1NwFirc5qzIMZZERdlJ
   A==;
X-CSE-ConnectionGUID: MNsT6dEqTfqd3Rt3OGhkTw==
X-CSE-MsgGUID: gVol5lRsRmuE6m1UsoJq8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51223093"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="51223093"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 17:46:19 -0700
X-CSE-ConnectionGUID: +SICHTh6QjGmL5/Al0/YRQ==
X-CSE-MsgGUID: FqLXzT7pQvSCnMWoZdSFXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136849186"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 17:46:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 17:46:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 17:46:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 17:46:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMAr54cjV10v0ZjgSdi1oTF5Arnviejz6DBLBrK+ycyzsaeG1iFinB7lgIRzFBLd4+t7caORCGLNu4EJHFB+AdhqcMKFLt++eXJF3QtLIpL8piVtJpwv8eLOh3mv7fOOTIT05ozWSyVgPEYNknQ9vI9RSuzd6fjAf97M+/tHnKNu+2D02eC/i4AXU6bD8Ymzn1N6en04rmOa3wrNihpcbCg3sixIIcfmMHoAe7WMWjuk5ld5mBAUHTqiKUE1A5r1eCFQh5vzraiCCfEF42Ox4AMjMkB8a8SjOWzIv5KuqYVhJcCPb4XuTMmMkauTWliDgxlAV15WGHJqzCniIC4izg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5aMz5cd433sxVlkRIl+XsaqJlMiX+jrtQF4wnkJ6Qo=;
 b=nK9qs6Vm5LaCULUUS6aGra709KqDTvD6EWbWsCcXn4ScbgXGdM6siEUDy/rE3XYK4KdNzCeKzO3gapk1Glo6sVOQX5vgqCCcp07pkrID+N1aPjMkwMd8kSQgoTYpvwie7SA7S6HaktykBN2CvUeMHlnIJxhrtV6nzZBfe8GsczQGPXalF5F2djyHUu3VJZbsf08PfKBpf690KeCqN9MU9rnFzvbloXFYIeqNshVCAQRzMQuTr3114zW+5tIANkHPcHnj3dVl9axaEAh0YuV2kXyXQxvVOsgeW6nWEQfS/mIc34hPOML2RB6Bwb7IGFAeNFCW5MyO0tc0baM3bewSqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MN0PR11MB6036.namprd11.prod.outlook.com (2603:10b6:208:377::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 00:46:06 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 00:46:06 +0000
Date: Thu, 8 May 2025 17:46:03 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Akira Yokosawa <akiyks@gmail.com>
CC: <corbet@lwn.net>, <linux-kernel@vger.kernel.org>,
	<linux-next@vger.kernel.org>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge all the trees
Message-ID: <681d504bd126c_1229d62941f@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250508184839.656af8f6@canb.auug.org.au>
 <3b35840a-7b87-44fc-8580-219ac78ad112@gmail.com>
 <20250508222531.0e7fab9c@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250508222531.0e7fab9c@canb.auug.org.au>
X-ClientProxiedBy: MW4PR04CA0090.namprd04.prod.outlook.com
 (2603:10b6:303:6b::35) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MN0PR11MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e3b80d8-1044-4114-81b9-08dd8e92e1bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h3SS5FkGB8yPJrk8/880BMSa8Up8tmBj8bvUCgXQ7XSKbVWJ5/rb9ougQwtC?=
 =?us-ascii?Q?G9IF9xfcvMpMsbNbtgDF484pmq7c7sN+ovQHyyDuiO0NAr8FCZkljb04K7Fv?=
 =?us-ascii?Q?qQJSD5saTVaCjKG2AML8JrANOMu+WqMqiJvoQC0Jkg9cbGDwXuEdHesAt800?=
 =?us-ascii?Q?6aFZmI80oUrDBYVZ29nP3umjO4yZ2+p4eE3aBXwF1Q5TN5b8FMVGnzZv2LuY?=
 =?us-ascii?Q?VuXC87hixC0xlV+nzskmPGX8h0qo4v6n55MYbSVryJfJVL8ERjuJL3hhwfjP?=
 =?us-ascii?Q?dszCeX5a3La8JGNt+1qVx/XpU4wiJQfFruSTA0Z0b6MT/oUfHF7c2hHV6tqJ?=
 =?us-ascii?Q?lnX9M/1/7dk0BLHw+SrEzNzmFVUyV3+wN4hlzhqJGjM67xiImrzTIlp+6+52?=
 =?us-ascii?Q?ISCKu+sJVXFPhHNEgUyx9d33yVnqe+QDDHz740IJrvaLsncFfQ2+6EgttnzY?=
 =?us-ascii?Q?BpbT/NZvjrUrjSh4c08jZ2jsnOBUkxglMrnBFjD6jxCZEihiHlKTiPX0EzTB?=
 =?us-ascii?Q?Zsq94sRQe3vlM/Vy4EJHER4GOvBwWWVKMF+plGSx8TTGFwMErlXlQx5Z5foj?=
 =?us-ascii?Q?CNW+XlCMQhJzWpTtU4V8lByTTpB+WMrsLHqnoaUqjujTijg5LaXDKf1mgCnU?=
 =?us-ascii?Q?6QLwvBUWYebQ61JeDs2tXeV+bQP6Bt5Urxj8Z3uVtrLUdlm3xB0JRebVIJXG?=
 =?us-ascii?Q?+GcOWVticPZTs/lhZLMFgDnuOnTci4iY3xmOWvIbjMcPjEmb5wLor3vdHSmZ?=
 =?us-ascii?Q?h4IH6SgFlMYxKp+p2EpZEwnq/ZEfe+qeXWJ5I59YdKR7OwJ/lHdC+pR15cWd?=
 =?us-ascii?Q?9OGELqTejvK6ToMXMtO3MUpSyUzyNmHo8+BviL0eaqd4VAk932Op3Xfh0bST?=
 =?us-ascii?Q?auA5DdM0XMeiCTZIP+l5fHw29sFiQAqsaaaiWwzKd6cj0WL437xuYr5XBRom?=
 =?us-ascii?Q?yP87G5lYPKHXCXrnKPaTJ3xg++G+4CGm5oRFiQ/MM5KBSlVmeOd3Pv/HWqdU?=
 =?us-ascii?Q?n+C3FeCCbl1Rk3YomidMgALHDKQ2X1V4y02hKNMq2EVMQzHy9UIcBuEWGegn?=
 =?us-ascii?Q?5BCiJWTm2ybNq+yfFjKd0MlluuQfQ6XCsAdBg2SkVOPSW4GBmJK+22ziycp2?=
 =?us-ascii?Q?X/MwAYkFzjxDajevgjxyMf+EPF6nBpxgpjpl1dei6oT0uHa0Gu1VQfj7MeFa?=
 =?us-ascii?Q?h3PCgl/mBpm6g/cGxkuSmokL5GJWmRdcGW/2/shwFAuGxMsmIORdEYzsrvvG?=
 =?us-ascii?Q?BC2vO4cgfI5faEHwf/dzPhSQ5wXhHZ4lZ6omRhk2ylbAZbPHZoAK2YSMhtA/?=
 =?us-ascii?Q?tTwAGfCyeWXvwbeAhbuBcW4pt1+bqKRRb/nWE3TGh9ye3OHXVfmyrHbJqqG2?=
 =?us-ascii?Q?dNnPzkzsYSCGveBJ5DJjVR0IthVOq/yD3qXVbh1MaFbtR0B13kptIgFR6Mxu?=
 =?us-ascii?Q?5u33utDKPLg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9DhJCrrqA5WOnNupJPMUg8bh8deBFYQ2xq4NtiVjeS1+Vk4Ki7fOghuEcoRk?=
 =?us-ascii?Q?Z9yx11wm0iSHmBRrMekl+qVx1Dzyiga0+3jUdllEzOfqKjw1VFXqP7jbKVOU?=
 =?us-ascii?Q?5h2JSl5vsIrQ92aswo8Axfb9DAVIC5ASxkn1xaMLzeoN0+KAiireweadwxyO?=
 =?us-ascii?Q?K+NLVC0CSrPD9nSJPRDEog20E/PT36p62Yns+d9H9WFyEqUkk+hwCDblaPIO?=
 =?us-ascii?Q?VrPuxSc56nLtmsjP5ccGHYPKeJYu2oCKHyH94Wlo70+hgHfkcHdFnpMEnLl+?=
 =?us-ascii?Q?Di61wdAPQvKz0NBMWbxYUun7TXCWAm6bdO3AF+wYz897oGk5re0h0vxE5tE+?=
 =?us-ascii?Q?//UyBZs7bKa7BHlBWoQcuGO5q0J9VEPLBqpBKc0jzrQ/sWxQ4EdRUviw6oa7?=
 =?us-ascii?Q?8kv/zx3VxRb90aHcQDmLes/1c73ao8dnn2PjvpLbEtXwidLy6gULt1BV/J3z?=
 =?us-ascii?Q?QXma/CEwrsvFj9chHjsydXa6GHF5U84Gn3YGIcf3Td3BuTTO7AmNB0ZtUEIk?=
 =?us-ascii?Q?DtXHFI6f3JgoNkJE233uNfQ5w9/CS2f0ljBRaau+BhR6yeoj82CkUdzuEvvR?=
 =?us-ascii?Q?EyysrTvQn2xlK6kuVdrwVPVsMZAADwEKKgtVTFDVM2vNNXT3ZkyavwiyDI1z?=
 =?us-ascii?Q?dX5+EIbubUx6Q2rg1X7H2HC6+Qo6UtuyJuZgG8HZjDtuAuautWVCQ8E/2IXy?=
 =?us-ascii?Q?Ixnq+8zfZjaHTGTIHFhwqw/sKBQrZ9qS5eUK5AC7oyae7Gvx0gl0DPxzxhud?=
 =?us-ascii?Q?vOncWlI9FpkwD8KQF4m2v4gr1noGH5X66eLUZuPzw/4VVf/Huzg14SY6MrWO?=
 =?us-ascii?Q?rrJOwyloRKC9gn71CRFsWGFX5nIV6Mi9lHQbF8stveNplnHfZinkcmKdqRQN?=
 =?us-ascii?Q?xg2x2vlVh4N+oaFpyK7KlPFW2+2C9uNp8FSe9I4rmpBRX2OGW3iRoU9RKJPY?=
 =?us-ascii?Q?zmLklY5Y6wVVkRSuXVoJ8xTjr75HOppoMn7L8qx+yCILRi2wUDtZH5IAFiNs?=
 =?us-ascii?Q?227PSZdQLeIt/rNpl3SoXh5jcRE1MukDZHKneNmRY3m0KVC3GKCD5VBxp903?=
 =?us-ascii?Q?I8NKLSe88x56wPJnI7VlpG9hq1q/DyvXU7qy1UdU6PckFLBnFfaDF0so7dk3?=
 =?us-ascii?Q?DHX00je8LHbYXRFov2nE4X7wk/gnyv9EjWlFob2Re1ZS3QLwLKvrnKVnPsPs?=
 =?us-ascii?Q?UpPouJ0NyvjhqLZJS7HmHZUXxl81k7A2Dcb6t3rjlj20xE66Tnyb8fBs/aFc?=
 =?us-ascii?Q?sTqP+uaLtMv5cvoQbLbggDRTdq/oFs5QsE2t/lXLuccOUByO8MMOJpo46I15?=
 =?us-ascii?Q?AdK6lbgAA1kQk2UQbfajgeR3XZOpG3a/OXp5S0gXlK9rwdw3TjCjvJ11sUgK?=
 =?us-ascii?Q?Y+EyBKQ9zvSVO8qtta1WuHF6GYkeHPhETmbPhmgC9pphXL/7Tn+CBq6SJTiP?=
 =?us-ascii?Q?B8N139PbO25Q3IeZezYPxt2nAmMCgd4TredKHm9R7wEl+7UOnuWCSly9spSA?=
 =?us-ascii?Q?VJmzgOoszDkQlr6d5oUu1Cv9zSYTtc6nJ1eqnfSKYOnTFk5vrky1N+DrZZE6?=
 =?us-ascii?Q?guikhzN+u43WAKOfwDzOMg0oSOU/bhauS3aAbXktuCdWHeKRg0U29NSyyq4P?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3b80d8-1044-4114-81b9-08dd8e92e1bc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 00:46:06.1581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Cdxwqs5AoMgdKYNapJ62mLK0NsIk7XNhkPPCKIFEfRtd7sqx4Lt2EtkirDIZtrExlIcX1Tr3jHn28aswfvQZKKxgc6cxttWL1Y7UZzMEW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6036
X-OriginatorOrg: intel.com

Stephen Rothwell wrote:
> Hi Akira,
> 
> On Thu, 8 May 2025 19:54:08 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:
> >
> > Please try:
> > 
> >   make O="$HOME/next/htmldocs" KERNELDOC=scripts/kernel-doc.pl htmldocs
> > 
> > , assuming your $HOME/next/next is the top of kernel source.
> > 
> > I'm suspecting that the conflict resolution done in
> > c84724f2137f ("Merge branch 'for-6.16/tsm-mr' into tsm-next")
> > ended up in mismatching path names given to "kernel-doc::" somewhere.
> > 
> > Looks like recent conversion of the kernel-doc script into python
> > has changed the behavior in such error conditions.
> > With the perl version, you'll see a couple of:
> > 
> >     Error: Cannot open file <...>/linux/drivers/virt/coco/tsm-mr.c
> > 
> > , but the doc build should complete.
> 
> OK, so, yes, the build completes.  I get the following message
> (multiple similar ones):
> 
> WARNING: kernel-doc 'scripts/kernel-doc.pl -rst -enable-lineno -export -export-file drivers/misc/mei/bus.c drivers/misc/mei/bus.c' processing failed with: [Errno 2] No such file or directory: 'scripts/kernel-doc.pl'
> 
> So, I used "KERNELDOC=$(pwd)/scripts/kernel-doc.pl" and tried again.
> 
> I got these (new) messages:
> 
> Error: Cannot open file drivers/virt/coco/tsm-mr.c
> Error: Cannot open file drivers/virt/coco/tsm-mr.c
> WARNING: kernel-doc 'scripts/kernel-doc.pl -rst -enable-lineno -export drivers/virt/coco/tsm-mr.c' failed with return code 2
> 
> (and a few other innocuous ones)
> 
> So your guess is good.
> 
> It would be nice to have the Python kernel-doc fixed as well as the
> devsec-tsm tree.

Will fix.

