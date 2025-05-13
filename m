Return-Path: <linux-next+bounces-6752-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F933AB5C5B
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 20:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0D2786631F
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 18:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9402BF3FA;
	Tue, 13 May 2025 18:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXBe9JDd"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACD52BEC3E
	for <linux-next@vger.kernel.org>; Tue, 13 May 2025 18:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161480; cv=fail; b=SEf5lzrlI9OYC9/NRab1grSL7IB1f1+jL8ogQOowqVAaTd0RnOEe3UD5ft2g2sFqHb6QGkStsApFvrXr7SuPWcRuSve/zNW9GGwsbtyvs5K9QoywbkIIkkcNpHYhBoXE2ei9uz6GgsofXKqVqPQldc0Adysd5x5+Gms81zSU4Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161480; c=relaxed/simple;
	bh=rjCJz03xD4/oWE7sXbU2p+lUhbcQzO4SWC+ILVj/GgM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lT7oGIVSNg8bCARDLWg9eptLTeWVmRdeMNkMC8vYAEmplE5GWQDEx/tkun8xqoxm0DzEZ+wiqQsrGxue/xW9GF1hXGD+fOfI98DBdgju4DtZaFmgHwwK9O4h96NWC6WW9hogLuU6onmXAW/BNIErjkw8sX0SsvWFwtPWGbeFIE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXBe9JDd; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747161479; x=1778697479;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=rjCJz03xD4/oWE7sXbU2p+lUhbcQzO4SWC+ILVj/GgM=;
  b=gXBe9JDdTJagxmWVp7Q1M+ona7nVJq5UxJoYYDIqJZ8nhKzFYFGOLKm2
   gHMnGiiDfsxoFTSRRCv612Y0wDurt4hP6gd0zzCDKHJPh4Lv8vis610O2
   fwF1UJNjOCqgC4butiBvEuhiiOM1IIqDF+wsVelt5Hl6sesZU5QoJMSE5
   MDgVPvbblZkeekYzw3JgQCqBm0n0IxP9dMdjJLGXkuIA+llZ4w+xJ07z6
   noJA2sysUz9fDJrbvtZZAs7qy5VMoG1D7LE1utdsnr7aRg/P4TSWn6hgY
   g9MaMZv6u+kZ6xO+bogb9GqYtwATzKY1fx2is2ThSLUIZZFOkCwdxfdCX
   Q==;
X-CSE-ConnectionGUID: iuK/d83VTQ6D2f3NG0RU1A==
X-CSE-MsgGUID: 5xfsBbLVTJm/BFxvX2AW8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="36654845"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="36654845"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 11:37:58 -0700
X-CSE-ConnectionGUID: DXqxDj08QBeuu/BvUeE4Sg==
X-CSE-MsgGUID: l77vA06QT8qcyYIsG5upMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="137833099"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 11:37:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 11:37:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 11:37:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 11:37:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koXlmqYX9h+YkwCCRUSGDYBes1svXrYkHrU600I9wa0KD2krLwTJGQ3xrpJzLODWHrKNieDnm9JzGJ6y1kFZnNU26vXvc9hHp/TywzYsPEm6Isx+Fs0R1v50ozpuTiI3cPx4ZKDDdNR1Xp5FLaYQzxDc08+AtQR1qymf4HgEyRLZfCFH1y/nWZlIZ+1Otm2/k7gFEZkjhrtEfFr8ubrpletoKaqxKA71ya/3I6PI/0paNwWb/HgCLhAgtPo3gLaOc28W04Zc7b1WHEwBtkXB1N67bMduqR9qNP1rDY0M5dEBjkzB6lO7MOTqh5Yyysx/NbARflklOjFhD1OP8NiZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nISqHwPt7BwCQizuKK3qi6nccFUl73yg7k3v60VOMNs=;
 b=Sg2C8wIy2Zk1SfZRRAO3pWFOIOEIirTtAp7+I8hBW/PWGT6tbnictGZlPjBL23yPqm2DF08qNlwuj8HyOys6OTNl+4EjZrGKfr02WKnPtqyjxeWDrXX7yhlsjGXdDYg1DWJpfJx6pOWHTW1Ts4ImepoOXrh46pkghwg6pkhOgE32IaaXMXH6Ha9RR+gWOXiob7DGOuP1RBYRjkEBa3MDQnRqvu0lpMHkGX+skuJP3ixy5FJitwp85EyzLhky6SRisGeH2WJepVVeDaDuTJVDpTqxAM5O9o9KvxEsPG3bd2oIFnaci+ZhKO7A+mh4BmxfYTNWRxFeWeuRmzqEsumwbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CO1PR11MB5202.namprd11.prod.outlook.com (2603:10b6:303:97::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Tue, 13 May
 2025 18:37:54 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 18:37:54 +0000
Date: Tue, 13 May 2025 11:37:51 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Cedric Xing <cedric.xing@intel.com>, <linux@weissschuh.net>,
	<dan.j.williams@intel.com>
CC: <sfr@canb.auug.org.au>, <sathyanarayanan.kuppuswamy@linux.intel.com>,
	<yilun.xu@intel.com>, <sameo@rivosinc.com>, <aik@amd.com>,
	<suzuki.poulose@arm.com>, <steven.price@arm.com>, <lukas@wunner.de>,
	<greg@kroah.com>, <linux-next@vger.kernel.org>, Cedric Xing
	<cedric.xing@intel.com>
Subject: Re: [PATCH v2] tsm-mr: Fix init breakage after bin_attrs
 constification by scoping non-const pointers to init phase
Message-ID: <6823917fc70a7_29032946b@dwillia2-xfh.jf.intel.com.notmuch>
References: <46e745b2-65b4-46b4-affc-d0fafd8ebdf0@t-8ch.de>
 <20250513164154.10109-1-cedric.xing@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250513164154.10109-1-cedric.xing@intel.com>
X-ClientProxiedBy: SJ0PR13CA0073.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::18) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CO1PR11MB5202:EE_
X-MS-Office365-Filtering-Correlation-Id: 228ce714-f2a9-435d-fab3-08dd924d45f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OhXctTIvJuZnXrQOQFrD3BqitvAXaWgz2xDUhAFiCbqaVckaCjhF1Gz/zEyU?=
 =?us-ascii?Q?MIKpWK5H+Fc4mpKzqKqmfWvauKw+j8MlTLSxlMIDhh77EarfCb0zdov4muM/?=
 =?us-ascii?Q?LoBdX9RAQZtyKa6uXL7H7cdr818ghePONTUkuxF2O2wBYn6AxDgo6eUg+Zpo?=
 =?us-ascii?Q?l/lnRD5UoILNOf/i60WRa+gtewP+FlBXkRUdKI7fvUtGadO/UXNSqNqK6oxk?=
 =?us-ascii?Q?GHPIgkiY7HFzLpNzqN24us2ncuHpPIQ/91HmTjf4TrlGPd2LwehvFPQerQaf?=
 =?us-ascii?Q?x2/CkbFmk+ypE1IsApKr5lvievEEL4BOa/QmDEONejFMgZzV2bGNHXxwA3Xq?=
 =?us-ascii?Q?2i7ckO+2e68pI1H6we4T+mIcK6w83C9X8mp6EoNrmr/xlusdx2zf9zbPwCX/?=
 =?us-ascii?Q?iYlU7uTQb/mT1vcGx3WYlIfbIrE9PLql+me+UqGtjiObB2f4y+xMJFo0k9nh?=
 =?us-ascii?Q?zigYvqTKh2y5HWYVXzwpaaN0zLWYE6piL4/NqQAIjE5+WtKbweKkyoach4Fl?=
 =?us-ascii?Q?63dGFYrm3Lbp+KApSH6VSnj+eRSVwOk0hfeeVg2EQtuJUPUXJEOWi8Ejy5Pa?=
 =?us-ascii?Q?InSmWBy2dGhbNzf92/hqhrRxLz7+HJoxl5XsefZ3kahHJUIncvMIMZFcJdU8?=
 =?us-ascii?Q?LgIckgJlZcbpgvVcFQFejwn7GhArpCoIpQ5Q4eQ7YQFP0fTDaPQOkGEMl9og?=
 =?us-ascii?Q?7uN5ReWldDTAgUVf+MISxN7qSl+IhWta55DYd01BlY8WhQZQygHS6rC+O1m1?=
 =?us-ascii?Q?YM6s2i0y/w/5mJUibbJ0fb18tobJoj7OK24Io8wGB5KETfL2BoUG6fEN7ZuK?=
 =?us-ascii?Q?8NChmZDPvxvyJxERsMjVqQTsVw7U1Y73FdFodc/18KoEd0ksw6yNuDNfZV+D?=
 =?us-ascii?Q?R4c2RJT9NJ4ImTXAeGzS86tSuslGjSmdER9Dt2sa2uRdW2E8bEubfjrjH96k?=
 =?us-ascii?Q?4d7aM8HorvKkw7xgZBv9kRodiHEe1sa8Nky+MHSlMAiumxxgyFKNH6TXIWS1?=
 =?us-ascii?Q?ElKzQkcYIivX72XGqz51F72md4i5cgG132SDNAC/EQHuwB9UM0Q5VzMESgyS?=
 =?us-ascii?Q?AtZoD4mtr0g74HiR6CWSyQjTSKauaDZJxS6ADQeEFmD2Ep57ej7c2aWAPwiy?=
 =?us-ascii?Q?Ijv/Ts3nXlGgpnhIBFsZ65mjVdJTrkAXt+kfv4zg6PRamuc0uGbjBQnm6EUl?=
 =?us-ascii?Q?Y6M3HTBGN7K2Q52EKVfnG+4wkFhigQq4kUiXOVUG3b6PDZ7xDWo/B0T414e7?=
 =?us-ascii?Q?DhPCMf1qlLDS9F+NrhEWsX+RCtkMOmlvdAP/XeiRvA+ryKg2GRzoK4Pk+uQw?=
 =?us-ascii?Q?Fxl8gGsAnrRBg46j28fR+EcC2d2gKK8M+P/1dPfBm0vHGftibqoy7wHrccKr?=
 =?us-ascii?Q?H8HoIEiIgRrRhouYfKAk0innfcbSmOvVfF0vD3hb7R3D9izsyQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1PuC/3qoY1uf0s4EXxmBjYL9W14QOxEsJ0XpoSkvKT1y3KQaLgCIGVorPQwO?=
 =?us-ascii?Q?B6f1U0+knyarkHFURY8IPL08NPmWB4/aLNO5mgrOqyBzW6tDugDfQgzMf01H?=
 =?us-ascii?Q?K2sUoohauVhyH1o7GRZ+4IcPpYY9DJ2DxZAEFgv7oUxit9sWvsndm2LZRfho?=
 =?us-ascii?Q?TEJDrahndozH8RVSZ0rLuQUCLWg00moKKlYb2qU3ns86f9bDsL+9MrdtLWvj?=
 =?us-ascii?Q?HYYMSOwf3RILLoB21JK1jQ2TfIoMZebzlTX0mbXUVt6/gErF92A1JADxFv5N?=
 =?us-ascii?Q?uH4hOq2AwIgVTmGnIGC1SIDJjfflFsW6DgFzBKGOWxhPotDPB0tVj6kjcv/D?=
 =?us-ascii?Q?Zkh2tzXOpr249rF/x2denqXZrph0OH7tRWh2gH2Zw0lz6WrYGxuIxuFtQcEy?=
 =?us-ascii?Q?XX96EFTxVnJi2hmrTrEdfLUwT4UGH7dcNXCUyhyyKJXYDUB8uMh1erC23y3j?=
 =?us-ascii?Q?UrtHaC3XkhIchQjKzhjYVMZ7yAQzRk/3OSTsuVFugfXyxXkP9JoN9MihZqNT?=
 =?us-ascii?Q?OQxIPyqrvzdHGq6rxMWb8SPNMiWIqyoaDYED8L1bR4UwoChkW/E9Yi13q65d?=
 =?us-ascii?Q?jgUZ6PwfdS3A/gKCLM7HcnFFJBn1/npUNn5TVEJpjx32sH9soQestwlWpfEB?=
 =?us-ascii?Q?bfJ1wAo+IErzI9+9aoXPG4ktWLenpHhpAfZwYH1T1R0AlKjWdnA9ziB4B7Zz?=
 =?us-ascii?Q?JlYuFQkM28EotNCqPkHFHiLj7Vrxc07jKcm9+ce4V8Le3mXYp+FpYf7jteFQ?=
 =?us-ascii?Q?a0CpfO0aXClDRrcXE0rkzlxJh4Ssw65gKAuFQ9D9jnquabX72QvDbldQNR32?=
 =?us-ascii?Q?AYzyaEEvB1RBkc1RoreXCJ4zBDaFXm5ybWiNZ6JzHli06R62g/itUkUw/0Li?=
 =?us-ascii?Q?PzYC7iz7lYAT8t+p2aCxmtLGjRIZOpk643i4Y+klRWj5uBNEwgByqfeSYKbb?=
 =?us-ascii?Q?+iLKkB7rdFoAg4cTYQLrshhVEcAYj6R9R4yEzw/peFK0uspprcsqv7Te7kX2?=
 =?us-ascii?Q?4xODdiaXl0HHNy7dtxe+zIlXKbKjHvWPcYbOmhu7WSm5T8gw/tPIOezZYwzt?=
 =?us-ascii?Q?CgByO9IUn3rOdk8DBkvdyVMKWbjZgNPfCyOMXvXrXVzTXpctBVdtQouyebUs?=
 =?us-ascii?Q?GWRCARBH57KSV4aDpUINdtmG5IJr88mtB4jw6URpAp5BP5HXLYVU0dgS7UP/?=
 =?us-ascii?Q?/qPBgayl4jGPIbHX77p1+UVxnbFV36L/Qu9s4Yt6s46r9pZI+L5ByeHFpx24?=
 =?us-ascii?Q?mIYTs3vWUyC2OqMQJoQ+j/Tm+D63crD4YkuLYcPOiJvbdpwjLJQdWSZNZJJs?=
 =?us-ascii?Q?FjnZu/iQ959ZkmgOIWsgXkpIE3mRA0Tgz+dk2xlhQ9CmXH9Syt+tGoSYEyG4?=
 =?us-ascii?Q?Bs3mTpUvdHB3KHyjiderBr1EjfQGsPDgw1w+QbmK8nQCoEoQ0m4iLjs1eXC6?=
 =?us-ascii?Q?8mZPSy1EIpmEW4y74NZ5MqUKk05OeVvscT3DGF0QUmYLZmZXgdC/plhOVwqV?=
 =?us-ascii?Q?qRX/S09ml5Bde+FmJTSgVcnalGjnUWQEl0qN2zJkBm9WftT4DmKvOJW3uzgY?=
 =?us-ascii?Q?v1+vfZEXMtKm6M09U3njPuIk5Px5wwNd31M3G2VQgeyeGkK3C9TwFZeHUMhb?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 228ce714-f2a9-435d-fab3-08dd924d45f4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 18:37:54.1448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiXI0y6ePpDiRurGQWdJyEW3umnFqsyjoaB6/DJ+ATz8aHHsvIwkRbj1IVR3SjcDQEmhrHKa0Gi4iQdQnpatZ5q3G/HEmgSNQCbUNasCcmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5202
X-OriginatorOrg: intel.com

Cedric Xing wrote:
> Commit 9bec944506fa ("sysfs: constify attribute_group::bin_attrs") enforced
> the ro-after-init principle by making elements of bin_attrs_new pointing to
> const.
> 
> To align with this change, introduce a temporary variable `bap` within the
> initialization loop. This improves code clarity by explicitly marking the
> initialization scope and eliminates the need for type casts when assigning
> to bin_attrs_new.
> 
> Signed-off-by: Cedric Xing <cedric.xing@intel.com>

Looks good to me, added to linux-next for more exposure.

