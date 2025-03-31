Return-Path: <linux-next+bounces-6114-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA5DA76D98
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 21:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DE591888C77
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 19:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86141B87F3;
	Mon, 31 Mar 2025 19:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IiaFfdK+"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2136D173;
	Mon, 31 Mar 2025 19:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743450466; cv=fail; b=StaH5GgKKuMyjFpYEImrfmT1MTaZDVqae/rFdbuD4vh/ES7VwNUH/gSZycBJwW2wfkkoKD2+tk5Y9sNyC71HWSF+J4rQvsYtVpvXhEI5Gr/Arx2CTXcmAOkQklM/R/3I9Vxku/OP7ZoAxEZ6fyEuDWTkZKIyXCzmI4CYwEpnh3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743450466; c=relaxed/simple;
	bh=8dg4O6Lzgry3EcXNH52alqhxEpmHuHsvoErvl9zjLVM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uImxmBaaLF8QnGXQA9rzKTM09P5tbx/kfTsyadCg4lBofOXMOU7NEYsLdzUBKPaBs8IvP12rkeNFvVHixjQdeCi3U8kZFvVTOeWalvJvleGaAp9QMK01I3cCTB7o1JkTp9d7ZNKMrrHbt3cDJadyNS8ErgchNaCypVd2WCpLAyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IiaFfdK+; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743450466; x=1774986466;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8dg4O6Lzgry3EcXNH52alqhxEpmHuHsvoErvl9zjLVM=;
  b=IiaFfdK+v2XaEvcuZzKKMez5ZSWjdmHg4P1X+15OtjwTfCpEg92xYwlS
   ozekJ+tGsP/5e82iMH/KjL6Ou2iJsULSE4ZK4Nf8ENhxDqjDqlNWWkjv9
   lDolES31bEQ83tI+3vyjRszrGi77OHpXClSsrRFSUAjfrDlR2sJ7rTCXm
   6kKyA2JlDCtayo6Ac2cB5P4ixeh8Njqp93aMlcwuVf6K54DxYCNGcr2AP
   W1dSnI67WRNhMXwP7kltzCpxMXUlA3o/r50cdZzNPf+j7LN1mfzOp6rjU
   BYu2ia1sS4mfUoaW6MHL4D38wQ4Ne2JmqqOZoJHZq2//TnzAH/+UTlRPm
   g==;
X-CSE-ConnectionGUID: rGnt7yQ0RvSFtHSMzRWHQw==
X-CSE-MsgGUID: 8vl85tEWQLCBfEZrthju/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62143448"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="62143448"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 12:47:44 -0700
X-CSE-ConnectionGUID: jgqAhJ4FTlyPj4flffMFng==
X-CSE-MsgGUID: P+cQyVufQ5yUnVSy85lAcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="131022398"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 12:47:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 12:47:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 12:47:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 12:47:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRJxb+aFDwyd3w8GnTbrhe4skOxNqZ5zr1h0sn/wcJVT1me+QBbd66sPNGgL0AhOQm9mcw0dHyEAby/5goSPfezTLRoPlWQP/VtDZk9JcJ8jrPfy20KH7vupLFKmCPDcGhOhiGQobxK+DP3/DwcQk/XTk9fFjwaMlLPIIh+KTS4pT16GHNfgZ9AR0IpWMuVYBLp1zsBmdclg9TPDe/nm5q8LZhUp7BgJM1tXuNcYLsnCjgV8wEhEXTYoceXip2ogmLaBbCRsMlK1q7k4/dcA5FCwUWHQAmF1Drg6c8ktaQ23Y4t9MC4Qambw4wVNsDfC+tM4tfKaP+XsjPMEjX1Ivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Duu/6ucvQAY++4cdwz7eMXlr0dPiXWb39SDuHoXMD90=;
 b=GQpRzp1QjujRwparBuOT8FJTUU/Exf0lqq4yy6ZZ/JHfUCWL21gNeMHZTa43V7QznElTEFbtdRln2Aj4+EOMk72WD4OaOSvEGyP3OylhVD+J+TIoZTxUU1qK/ZfnGIWOBPRamaG+WGwhCPVMa4kH0OxGPg81oy5cc1R+YWPA9VGCphGZ/HhfxaHU3sI/KlxksaxqyYVSLeoUlQsK5UJ9vixaiwGWMzmYKV3QIX+Xg0tM596YrNoMgbespLJD5cLdE4UulyyoJpgh5J0IexovlcykwpWLVphGK7iSPAI8tKWRMRNOMiHZmEnkxQxLYaaJxbu41HKe90NhwUi22Rvc/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH7PR11MB5885.namprd11.prod.outlook.com (2603:10b6:510:134::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 19:47:26 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 19:47:26 +0000
Date: Mon, 31 Mar 2025 12:47:23 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>
CC: Dave Jiang <dave.jiang@intel.com>, "Paul E. McKenney"
	<paulmck@kernel.org>, <linux-cxl@vger.kernel.org>, <dave@stgolabs.net>,
	<jonathan.cameron@huawei.com>, <alison.schofield@intel.com>,
	<vishal.l.verma@intel.com>, <ira.weiny@intel.com>, <gourry@gourry.net>,
	<linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>,
	<sfr@canb.auug.org.au>
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <67eaf14b7c611_201f0294ba@dwillia2-xfh.jf.intel.com.notmuch>
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
 <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
 <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
 <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
 <51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
 <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
 <1f48ba3b-9ba8-44e5-98c7-4c9abf95a935@intel.com>
 <20250331132439.GD10839@nvidia.com>
 <67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch>
 <20250331171755.GC289482@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250331171755.GC289482@nvidia.com>
X-ClientProxiedBy: MW4PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:303:b5::7) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH7PR11MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2f4ed5-81fd-45d8-a8b8-08dd708cdd17
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NhveNL3r9TD5FFw5KuTBVzgf7kx3dBq0+LIU7EV/AktSX/i6+zVCdwU1a+Q0?=
 =?us-ascii?Q?BpLFJtw6xs90to8l47bozsyjjSu2VMYLDbqp/5g66BWDXf1TaI88UX3XgH+U?=
 =?us-ascii?Q?wY2g6GEOtm9aoNMztl2BWj3z6JVYEddr7taBD78RxdTADX8OzNDKoQaGMtTU?=
 =?us-ascii?Q?JCVjMs2rQYEfOpXpCK12cmyrIdGUGjPZ3MUDxVUnFJUhawZskfA9A2ICNVHR?=
 =?us-ascii?Q?mh8lO3J7wWTg8tHi/0xHbf73gXwwqOsyzQz+GoXiMGfAPG+NbdAa3w41jnv3?=
 =?us-ascii?Q?LI6UogB2n3k3ILEMnqMBkXOssTILGSItREIEkLK8MJyPS5KuinXuVuZ3sFzP?=
 =?us-ascii?Q?A9r6FO1xh+wzRiEbToAzAym6Mwdslv/nEC0H0PmdApkRCbqpwes4wlDhDfER?=
 =?us-ascii?Q?H/TVJDKDb8Hk9Hga44mws3gh4FReVkcPjBapgqj5h6o3FqvGjZ2/QF3V1Mk3?=
 =?us-ascii?Q?hPPpvZSOrXwvK3ibs6IYrtiTLJIfNWz0TLiZ2pW89Gdi+3GUvduXat7oGlmR?=
 =?us-ascii?Q?c2SEyAwVKWTARDtvjEfMSg8Wo46I8ivtj3bpP0knPlRVDWEPWBuuxPj1DUE1?=
 =?us-ascii?Q?JmBTSJYsTbjudcv9Lm1i0+wbfasv22lP2TbCxdUWecLC/KS6UPTyy/Ff5CXt?=
 =?us-ascii?Q?HaC3WEwRj55i8p/R+X/VFpkUe23Mqneg83k7+eIJ64PQQMA/k2sNJSZZ8t6Q?=
 =?us-ascii?Q?Di8x0QuvnFpNBAPHNmnnJDm2f5Eeot8C8iTr9eaZhYprZ1yQkL5iQsqIBmrE?=
 =?us-ascii?Q?JepO5c+nwN5uWGcG8UswErdsehJpj9iBxiA0ExnMwGBXkbQH6Ne77qLjC8Wc?=
 =?us-ascii?Q?d7rES4Qa1Zyv34qfFa3noFFZNFNTugQ0KPZi0E8OMy0WpUPFyyR7oEicCpHi?=
 =?us-ascii?Q?f70Ivs7k3yN4whqkwkGQDwJ4RLl0FmdL2J88dtegO6KO4/KuPc4zoeJEL0Wj?=
 =?us-ascii?Q?MmmWdHk8TxC8VkP1oNe9iu3FjFBxuQ7wp3uJMgyt0mEssylw280AvaAfAfKX?=
 =?us-ascii?Q?ifBCv2PZZR6gPDI8MTxV++vJaXVw1zr/FR2x+JA1SbWShxKEaDWrefNpUZHf?=
 =?us-ascii?Q?5WfzwXD/01cHVuUQHRUVpbM9nfxiNU7wSqRUeRou3gyIGLu3ms8Uym6/F0LT?=
 =?us-ascii?Q?n3+tazVDJproClBWA1nKTRiX/v4rL8aJhaeUxQKCC99+fmQZeXhGhjOH70+K?=
 =?us-ascii?Q?bHYO6QgsW1+l+NOIzlrFUB0Zv8cqxNgiHTE2uB28UraOUpN0NDpZsqRYrzpK?=
 =?us-ascii?Q?wcL09lDQuJd8mFQdI2EBbwgPWaGOoODHg37Yz9ZWzzcfmAutJLLi43EjlNan?=
 =?us-ascii?Q?7+ec9ZAa7fKnphKWGMU+j85C8nyM7oMPbjSK+ZxJapMBG4sQ16QrcYMsbCHY?=
 =?us-ascii?Q?TICAQVwyp/NEVfl25bdSVb8gPcm8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8er2EsNi3OYU08ll95KWx19kG1qAOxrHxDDbmU7LuibPDunTMmAZLK6KU1fa?=
 =?us-ascii?Q?gZXe37u8yy3AOAZ5LnrDQXtXxhvzMoSq9XTjD9dvd5sdDtagkfySI5Q0GlFD?=
 =?us-ascii?Q?pKSSLjcEPnProzh7mEt0Iv4/e04irHI64fg5V17HJ6dlvTPwswz7EITuxKek?=
 =?us-ascii?Q?P3vXQ8xVNSOShJC39ko6E/uA0+lPd0oHhcr4sbIMGTJZUIt0yfH7IGszsfsT?=
 =?us-ascii?Q?wRIi/hPL+99nt62S6GHaj6CvYE1p95eRED5DjqReML0tdy9tk/CkvOBWszlH?=
 =?us-ascii?Q?UkiIBsHNLu6WFLbMdoW0imiISSuM9TTOIgGnQDq7jkchc6Oop+GG37bEReUU?=
 =?us-ascii?Q?onsn5TPYL6KPLXMwmQ1ISwzIjg3kzpViWrUBk6/UJxRtyB/J7lChp+Y+eBNb?=
 =?us-ascii?Q?2aoX9d/2qnz/hS41IuqRm4e08Iz66nvWAnZGEmmQeE7vVjCjewse7gZro4Fa?=
 =?us-ascii?Q?cJt6VVetjLhFfiptjYvorJv+OlTxySPegexAmQXphg5p+MdBZ4xamX4rgJ6+?=
 =?us-ascii?Q?6pj+yyImM60rHjRzyDwgWLsyPn+YqU3nX4gFckkIkugyS3O2OrnXgoHu+eUl?=
 =?us-ascii?Q?URYpvhDFYaZiyaWHaKq386lVVEFbYU0MuzhtIF+XdEtbcnmzNIpjEt0wToeA?=
 =?us-ascii?Q?5nD9Lw6bpp/z+SudxX0xa58650p5JMx1hlhwnmHMswHerIXCLbn+fgZZjK1Y?=
 =?us-ascii?Q?61mjLAC05B6KJOiUTvEv5MpfOhfp+2GKW6U5PBsZ/CuUfr3wg7S18l+Kw5t6?=
 =?us-ascii?Q?Nz5Ph0YLcwh2P6Ekb5B/ugXt9uZZv6/uwsDb+l9aZWgJEd7b/8PAhN11Uajr?=
 =?us-ascii?Q?IZlSQGlkWbxnMH20bTzR/7qs/JZ9x3kuwTpirMPLUOiEIIRo9x8qTQxr/FP8?=
 =?us-ascii?Q?TsWJtJSXltXlnqgVNP28KmqVGNAM+ppUYh36t2WWrQuyvmnwFCWYFHa1OIci?=
 =?us-ascii?Q?550TyRc/Z5jgSud2DkxV3Ke8/YMKmp2VWN9i4v1zxFl9YQXQFXWungq9Uib+?=
 =?us-ascii?Q?5XhgVccwdl8L/on+XzUXuf1FgVcv2dIlKU0E5hnk6YGsJriTuy1EZw0A2zSI?=
 =?us-ascii?Q?KQLuHZAaBhjBkP0Q/Fk8rLQBEPTy8bxQ5VzlveG2zoo7l5D3nl4DdLCUKJBx?=
 =?us-ascii?Q?Izkj2yx2KVQnsI++GLdNar3px0e1SgYx3hI7oCLdLpLLZXHcCy+2HfAG+D8R?=
 =?us-ascii?Q?rhsJllDuawHFLxujMnEQMmV6HTshTDLwi/brRMdy7V9bCcMynElPxoU7r1qN?=
 =?us-ascii?Q?EhGO/OSfoCtaNr1a3nlLj0/OPW8QhbEyXFHX1+u5WGmqvw5MpuRHZShgrNBd?=
 =?us-ascii?Q?tBEZItK7Q4M2WZGQvR1HknxqAskaHlvT+9WFAJYQLz3hVsLcIhiEICNIIqfu?=
 =?us-ascii?Q?5AFLoSK83jka7u2oQVpzJtJdbTQKtl62YUoTfq9ylZ/3nvkiWfUY54q+zuHi?=
 =?us-ascii?Q?bLKaJ+DsyTUyOKY1Z0i0huQgAZy/Nf56q+GIFfwws4fC4tdOKRjK3KPznwvw?=
 =?us-ascii?Q?JRmSLfnUZsAA1RaWz98i1lppbQaVj2S8VUG0D0XcwTOuI2fmFxwtZbGHTlXG?=
 =?us-ascii?Q?Jkp1ff0mo1vMKdaA4Nx5xGOm5WcpqDRRbIeKQ4R4MIqaB/6gxfg3YRT593MV?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2f4ed5-81fd-45d8-a8b8-08dd708cdd17
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:47:26.5075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UX5L4ZckFl3HPm5ODj4BSyHsONkDGAVf4aD6+Ldc6CBo3946lwcQxfZ1AkkNkRmArgkUcKZ7RhcZ1FwBvD7Ju2MwCAKo3tgV9OrmrAAjjbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5885
X-OriginatorOrg: intel.com

Jason Gunthorpe wrote:
> On Mon, Mar 31, 2025 at 09:54:55AM -0700, Dan Williams wrote:
> > Jason Gunthorpe wrote:
> > > On Fri, Mar 28, 2025 at 05:26:42PM -0700, Dave Jiang wrote:
> > > > > For now the following builds for me, but it is a quite a mess to undo
> > > > > the assumption that that the hardware object definitions can not use
> > > > > uuid_t:
> > > > 
> > > > +Jason.
> > > 
> > > Seems invasive?
> > 
> > Yeah, it left a bad taste for me as well.
> > 
> > > Maybe just like below?
> > 
> > I like that this avoids converting to the kernel's uuid API, however,
> > not quite happy that it forces userspace to contend with the
> > type-conflict with uuid/uuid.h.
> 
> Oh I see
>  
> > So how about one more riff on your idea?
> 
> Sure, works for me, please post it..

b4 am supports scissors lines, so:

b4 am -P _  67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch

...works for me. Do you still need a separate posting?

