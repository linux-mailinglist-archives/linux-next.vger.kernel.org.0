Return-Path: <linux-next+bounces-6621-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB03AB0716
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 02:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD04F9C2187
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 00:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D760215D1;
	Fri,  9 May 2025 00:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZqHiTS+"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088F3184E;
	Fri,  9 May 2025 00:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746750760; cv=fail; b=rKXyBBlKZF+f1wuE8/aTKopeb4bFfJ0+almYeXkM86rm8Jb5Acj8OejXGC04RAprTSLJhE/UEQ80m8mYmqIqCStja9x+AvhWMOIWqXpGCZrq4AGISu/53D6+SYtrk0He9N4WYjZtw5qMlqYcQwFLEbgLaX4fDoN666gpQt+BXXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746750760; c=relaxed/simple;
	bh=ejKUlktNi1XNxpgcXXeWTXvW9Lw8oWE3K05/L7wHicc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c438iwJJ37PiLZ/fi2JkVAcBNd+SD7uoEb+ubyXpdAcFRb0qrsemUaYtw3PRMMMd3ox9gt6KFtxvBROR2Z7Q/tyfP8xti5rRAOUObjui4ye68bmfLNgZmf1og15ezTYrcrmMMCrKHyYPzX+9qHyPSPpsnLG5JlMLZ3iOKiWI3B4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZqHiTS+; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746750759; x=1778286759;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ejKUlktNi1XNxpgcXXeWTXvW9Lw8oWE3K05/L7wHicc=;
  b=KZqHiTS+AtJaGRyftM272JstZpYZlh/MQBVst53nsBz4r3T5pByvjzYC
   QL51YOB0VQmJtIiWZxCKZduKcByCc886dsKmGDjVtx7Ygi9RK84Jwk+6D
   yNnMNMZK6Tnp0vp94JL/uSbzGQmWkh+9fLC2W7Eb1lJgcU1EeqJ5IqjiX
   Y3Y3EffazHXA/Q4jCear+iU18KQ6fuNLrzgytSar43AtmBIVytvvwWPsL
   pmNEo58AwkgSTs20klqX1DjDIzyoD1EY4exDEP4F3yjy+Be200H5NDRLY
   LC5rehwnoa0bXlE5DJI50guSTygHw5ngDkAytwU0nDc+E06DFQSn7C+jI
   w==;
X-CSE-ConnectionGUID: +g2Nj0BLTBeh34UqrCYGqg==
X-CSE-MsgGUID: WEq4OSLGQaSPZP6EGUJHbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52369452"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="52369452"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 17:32:38 -0700
X-CSE-ConnectionGUID: PgVeu5P2TWaZQftXV4Q06Q==
X-CSE-MsgGUID: hXH2I55RQxeqcFafWlChkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136339458"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 17:32:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 17:32:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 17:32:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 17:32:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l83Ijx8V/SJEL6dxtHaCQw2go+O6HfRJtR/ReQTcpoHGYJY+P93sSlnvQZpRAx4lYXa3ua4uA1uh/e0UiG0I1SVGbQp85ZE4v2576V9DxZ7/iH2Bskb8GHrWe/e8Sehiiaj5WTfSIxyp8R/Ldgkz06CuqN8ei3YsviBdKFVt/VvhZzJFenejk8jqa+objjxRbDyVHbPqm5+SE/u2PkkfXV49PQvm8xb2nqXvmDQkbfDyLr2Ys0DLqyy0N8jCH+ZbHKVzQZegMbeB4GkViPIhcmaqNwijN8A0jEH0U4N7rUou8VJN/8mJW6YLbn1rMMgRXmQaU4Ma3+nZNZSGd0xcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gGngVVehodCssJHIMCt1wGWj+TtCE+AZbZgy4KsRCk=;
 b=IvVBI9VlYX+oUGxvh639BURUefKuh6NprvruycmLwnwEzYJiroAdd165jobL37B/ehs8A7U+pwwm8dfjB3h2Y9ji0hURavU5pyio7ZunTQZernUzHlDNB2IEv6yF13S4WWGie7fia5OjvdqSdmQdkANAFRiYU2TajtOQJuXJpAvPgllg/ZeFyGVZSIipDBoCNGuqKNwqDui5Fbx8psp+eBo1r6UqF6ihEIOxRfLb3CqgjcvKNQL8oaO9AqamWsWZeVORp7a4/T5DH2A/SPB+MqeIR1TslhFj8KT8OB9nn5F2a7ih0tMeEvOk/HBK6RO+lYTbTp39+RsOmdBv6gydxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA4PR11MB9130.namprd11.prod.outlook.com (2603:10b6:208:56c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 9 May
 2025 00:32:30 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 00:32:30 +0000
Date: Thu, 8 May 2025 17:32:26 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dan Williams
	<dan.j.williams@intel.com>, <sathyanarayanan.kuppuswamy@linux.intel.com>,
	<yilun.xu@intel.com>, <sameo@rivosinc.com>, <aik@amd.com>,
	<suzuki.poulose@arm.com>, <steven.price@arm.com>, <lukas@wunner.de>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the devsec-tsm tree with the
 devsec-tsm-fixes tree
Message-ID: <681d4d1ab7cb5_1229d6294d6@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250508172506.226894cd@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250508172506.226894cd@canb.auug.org.au>
X-ClientProxiedBy: MW4PR04CA0067.namprd04.prod.outlook.com
 (2603:10b6:303:6b::12) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA4PR11MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ed0e1c-e494-4451-6636-08dd8e90fb77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0OBuUJIaVbvvsEsxVitjBz9W4ruIlerbGaAyUZLz4qYhPsbcZs/1iQQUAAgJ?=
 =?us-ascii?Q?AhkGBUPWQzueGp5/IZEDBelZ7bsr9KjxBcQQF1TfkYCsNk1SikctdRMT08ZO?=
 =?us-ascii?Q?IeKax77oWb9dUjfuWH+ofjqFGC6gjYcUNaxra8QDQLOPD2r87dWpOZuFCRWh?=
 =?us-ascii?Q?2fn40hEd/mkKSJzq1vj6OWiPZr+sJ9nE0oxRc/AkXaEAeRZLCeUi/i/gBkFu?=
 =?us-ascii?Q?hKKPbKY/ATRHWnl0ZoHjyKiYa6OTT6kxlcqwt9FHvFlDRFZt4bzOexeeutwp?=
 =?us-ascii?Q?/0g58EAL+QymM3tnVOE3BgP0+sQb2QBh4eUF+D6dUoyYbDZW0TEXSvz9k6zd?=
 =?us-ascii?Q?0+d6DrrmpxwemOczrFi5CWG9UighEjXkHYJGyQUnUz9Sd+kNs6GbmdyWXXgB?=
 =?us-ascii?Q?GDxkiA9CxwvtVoqQzCaNEKDkAw4xPFiCDsjbHut+ivq4b5hJYeTTbe2kMIeq?=
 =?us-ascii?Q?i8T34yHh27mD0nbbeLuVijI1rIHhJlINiN9lq1aH5YVtZM/rlXA5Mz0neZO/?=
 =?us-ascii?Q?vdQmBthGbWjbmnnQxOrA/mqyT9o0NRMt6TeWd2aF5c9oYipc/8Anm8ZFi+cd?=
 =?us-ascii?Q?KulU9w8wMLfqshRkVyBIdn1se76z64aNLGlu2jVbqAMppUUn5m9at/F2xA+N?=
 =?us-ascii?Q?Oo9wEnodMj7LU6NZUuSmAtNZaQR3NjL7X9y+bj34tdYu9n4FNwoN5yPwaehY?=
 =?us-ascii?Q?UuuHV+TK5+9DxG8LDWMXNF6/mN4pf8C0kZOXJIq/o6WL40D8VYQBE/qEUfk5?=
 =?us-ascii?Q?JyoR4yWOZxTl2B9ukkE7ZoiBm0DFZY3BaBvJu4U9MThuU8Lf6AHT0VWFDaom?=
 =?us-ascii?Q?gKedkUza4PtgFzIbKliJnGISKokJQdpBXMR9pFQUdd4Xw7U29aC672ReVYjE?=
 =?us-ascii?Q?AIlqdnUSwkJHd/mnFWkbPHXOBpatfUJpNJGUCHUAzJk9X704LZN4LxYijkNi?=
 =?us-ascii?Q?QijioHLuKZecnIGzBg+Y0iCFgGRgOsuE+HKrpFEGQyMMXHGFVBQPF03q+cX4?=
 =?us-ascii?Q?Br3sW9Umixv127v2ArbJnZFEjfAaybtbKv3/WTB+qUbSspCozRh3ktbEfLzQ?=
 =?us-ascii?Q?O0J/sgGgXiDzdzaguxD+gmuMo9YKrg1GJ4i0H+w0+BmBH00lY0fnKl9fGkZD?=
 =?us-ascii?Q?kAa6UbKJtBiyCWc7bFuFmp+gr/2EWTYqGooKv8XLzMCg7q4VTOpJw5xEMXN2?=
 =?us-ascii?Q?RZyzfnODyIl1TMzn5+HENSTxS9i9r16x9nJ0+eT7xsflsyva7gPRtP9cHuBh?=
 =?us-ascii?Q?agH2+axidmD6H+uaLZK9rBuavGa8YSlLDtZEry+WHD6kAP1CZhKBkw+07tvs?=
 =?us-ascii?Q?NzfDYMQKvRWmnjgxOwD7mp3gJdyYEOfPKxwVwHjWKHIFDctIFOxLbIb5GrPo?=
 =?us-ascii?Q?4l86n9kH7XFGcWEIYeViEocboOssy5L3+8xkMaEeIx0GVLj+h47nJ3pUC4Bz?=
 =?us-ascii?Q?JMhsNlBrxw0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BTBJzpxs9LdAcd3ymmb0tpUbURoCM/DWxC8OEvWUVUKs1ZbUVh/Bn1HTOXa6?=
 =?us-ascii?Q?AKktDGsgSWKs1e2UFkcsTz5N2F0zuuisAVA6VZVQi6mOFxY95s6wYCOCk4MR?=
 =?us-ascii?Q?3M+BVJLLEcIzxCRgRD6bFpcZf5KIyK1GTCYDnBzhXWXyuG1wEOJckiXAClQw?=
 =?us-ascii?Q?qlHUfUv3aTKedehcAC+6pdsgpuMIIudELSwm88+5OMPP/iRTwhD8M3Fjs19f?=
 =?us-ascii?Q?HEPVxW3UJai7++52ASOOwiP6nYis0rjQC6HdJeXQj3fOzfKU1YIOhFWtCMo/?=
 =?us-ascii?Q?GGHfb+LPYu/QihCt7uxz70nNTm58rWR5ozfmfkDs/qEdnHc2hMAMUVIu6unk?=
 =?us-ascii?Q?OoBYS60WzuRwP/7xe8y2A3oVHvtKhVjUyFqsmioPkBXb9YoXd3kX6Uhns40g?=
 =?us-ascii?Q?aVXmzhIY23vMgTdm7EJxEB/Mt1kEnQ1mGmv0KgAevW/u0XejapJzzeRCt5Cp?=
 =?us-ascii?Q?cRcPeoTOL+4n7Y8g/td0JPBm80wsAjk139dNgxl+2gztxnOwEZ+6P9Gj9BTK?=
 =?us-ascii?Q?1q4qNlMQC0owmK1hipPi7mOGjKshIavfABdvJdVi84E7Se9xPOwRGd93P2Vt?=
 =?us-ascii?Q?EqjWgb4v0MQOwSDfIzCAtT8LkjpsvHALo3iTyijMImJBQKtB02iPOZhep61m?=
 =?us-ascii?Q?xNxFEybCglnTyqrh1dU6ZrzZDLSp+GQz60Ihlxmnf9yPaH9WTQWgSE3vNpfv?=
 =?us-ascii?Q?FpL1Sy5Sk7bk69nmA01vqHIUzF5+HZCEH6ieZvZB6XpAMnbl8m11Q/32DI7X?=
 =?us-ascii?Q?SF+DSt6ozgN43ugy3SmUGgLd/soUXA76rWeIDQTZJQlIOaCiJnNEwCuZBFYl?=
 =?us-ascii?Q?kudFGf2bUl3UN3w8oamxWYJ8hYeYkjDuReZebDMNFNVErqA3qRyUJ6xGUgJZ?=
 =?us-ascii?Q?MYVYVpuNdwDxntE8GQ+WYnhXB4Y4AVV2PM1diyCq9CLrf3PuQBWdexztkviL?=
 =?us-ascii?Q?f4dwry8qWTRf1XSwTgzoc6AgcC/193EcO1eEyLka7tyQMv2N1N0mN7CyGCED?=
 =?us-ascii?Q?JAy1VRcV66eAF/0yiAV1pZkK9Xlw0OTLdfgdPokPO/prL0w/OBk1aQdq62bU?=
 =?us-ascii?Q?u1Mmle7zn7gpAXLhq1r25ud5+jO77FFMhyPQ8Ec2SGPOKKGXZs06tG7qeu9K?=
 =?us-ascii?Q?tsGVhnf9vPGSusatzur4vMl7tlUBbbSxBLM6yRzUeDc/ELciFt0rxvH1Kz2k?=
 =?us-ascii?Q?1Oims07bfoQNcEcftv3eQzeSE/5ugdwBk075ftgVLW2KSXzki9GxbRMvf8hm?=
 =?us-ascii?Q?HmgNfc2FneJwGeAJLXH/fqwF22q3gKrvx6gePM4oss32zk9mOZok+JnVilHA?=
 =?us-ascii?Q?MiJaqSrhq54zkYVZbBY7nELjJ55m25mstj2Tx+5dgbTmL4t2kk+f5LC8lscl?=
 =?us-ascii?Q?xNFfl6uAbrPGCpVqvfrp8z3H8GF1tDKcPPRAijadsc+E0/waAk62ag5ftc5L?=
 =?us-ascii?Q?WjSmGvpDVjhXzirAwB48IiWyAvVEC8C3TEZ5W3gUUsy6cginzDgHGsvyjrPv?=
 =?us-ascii?Q?JychIfB9CHXwzkcs97DuXhYeJjcbgAJUK/GgJodMm3z/HVCcB+NJqxm/aq62?=
 =?us-ascii?Q?JUvL0TKWJnA89N7IjDk5ZUCKCmx6FbWe47+msG865fxWzh267AJg7MP7JZ1e?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ed0e1c-e494-4451-6636-08dd8e90fb77
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 00:32:30.4657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YlSfRlQcmgrSMnZFz7x7cqJ5BmFwe23w6eO4z7Kbo2F4Vg/NWGqWmrn/J7eEU2SjMI0OPalWPS+7Lf22pSxIPWcIqtivjbB4jzpczyz5nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9130
X-OriginatorOrg: intel.com

Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the devsec-tsm tree got a conflict in:
> 
>   drivers/virt/coco/guest/report.c
> 
> between commit:
> 
>   99b9d909187a ("configfs-tsm-report: Fix NULL dereference of tsm_ops")
> (the file is drivers/virt/coco/tsm.c there)
> 
> from the devsec-tsm-fixes tree and commit:
> 
>   e5ab985f1416 ("Merge branch 'for-6.16/tsm' into tsm-next")
> 
> from the devsec-tsm tree.
> 
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Looks like I flubbed this, will fix.

Thanks Stephen!

