Return-Path: <linux-next+bounces-9376-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50779CACE18
	for <lists+linux-next@lfdr.de>; Mon, 08 Dec 2025 11:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A38B530194DE
	for <lists+linux-next@lfdr.de>; Mon,  8 Dec 2025 10:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4991A3101D0;
	Mon,  8 Dec 2025 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjMP+Uvo"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C9A30F94C;
	Mon,  8 Dec 2025 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765189868; cv=fail; b=jftZ1p/vmHA8SQs4IeyhA6Rq7J0fKjMIRrms99q78y+bSXRtS4wZRMHgBrjtBTrFWbyr8TMXI0Va3wbRHAA5IBy7XNXRTNc36BZ4Gok+KiZuupEWYvkkcCvwBz4W6MAtOE62X6AYr9Gx0ZYav/knqkZXzP93V4dcj5BjWF2HUSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765189868; c=relaxed/simple;
	bh=gheGEukSFdqoQeA7Wd0nzVJ41AZGVwy/RQ8WPqLFAV0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Wc5sswrSD02OBh1OvvqYDnc9h8E1Po8xhKvsPP9syGNVt8CoFisv8SfPr8MDVhxX0Wx90FhQFcxutpvgi3WmDVrgGaNvP+JYOOdk/yAqkXckJmMVA/UHMGdapmTEOBGKsqPG2q/AuzjMIPF9EzOqDYGl4UkmAAI/F/VyHOddu1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjMP+Uvo; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765189867; x=1796725867;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gheGEukSFdqoQeA7Wd0nzVJ41AZGVwy/RQ8WPqLFAV0=;
  b=LjMP+UvowFYAVQj/Gx5rdFDaK6fsB7hbiU+V7PHp9PM/QQ3R4lVrIlz1
   iyA5ALoryAYyw+CfvUcYuTckUyL3pqoOubqJyXxr/iuta3x/Yx8Y1NU4d
   ea7QTQlI2BDDXNkhQSCM2I7EF+IHh9vJk4PFXiy6CPvUPqHZjBs/54P0U
   L21BRsjz7hq2W4s2Pa2txIacFQcGcvTeWMBa8E1tYu3lP6xRKzmDniwFT
   JUky9/Zj690xmMEj2CpHp+IhbbyE2FVmftHbTqHvkHm4b4+EYODEqGkQO
   +jYT6cs2h9TtfhVoTPIBSzY2Orb37vhJLFXvyHDvsd1p7bD/D1t3G/Q6F
   g==;
X-CSE-ConnectionGUID: 1/cUeKORT/GwX/pxenhceg==
X-CSE-MsgGUID: y0u+R9ZCSDK8bx5/YOQnxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66311555"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="66311555"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 02:31:05 -0800
X-CSE-ConnectionGUID: GSnjN/J1Qk+c+djqdvSjOQ==
X-CSE-MsgGUID: LX6HJwbdQtCzOWyKTPSC/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="195917326"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 02:30:56 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 02:30:53 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 02:30:53 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 02:30:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crXxq8O44T8WijFzPNzJ9P/qQEOuyX1ngsFuR/D/vJL7ahwaYN+XzmrprqH4DrehTL5zcGU1NmYVJ/a37+1EVtMtxBx/zJaRGlzRmPdbthrjrqDp9QSB72/lw+o+41IGyT4t6CMq+zMewcvTzz1CVslBvbuUaQYzAe5sUh9mLTroBvX5NkUTsWXffBW6dtARD9jKMI4gnCjqti+gNGBuIFUci47mEdstnv6x7LhcHr2zf7+A+4BqjnPaUhKQ9ZSQRWj0GmB2vblqeBrEfL3/gjo5nfeZno31Q3YAX3M5xGGbqVImAu02ZctZVBYSj2s4ar3Od0uTxNxp8OfV9lioOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vS7wjUHNan/8qH4EXng7wPcyUE5KnaxzkThirwTymgg=;
 b=GRy+QBkXebyvq30n4J0ijXK8WxdzLjGBv6qN/CCF9rDW4PgwLlpxmDO/JTxoz49IX3EKP2h46gsrdEuK01LqJLNtqGZJ7bLL0GGysZo91urbvW1nBPGDN/eLtuTLcmwF3OxdNiFaX/snyObBNvsiAcaBQimIoTkfzMJ0Q9I2eFUoCTpphB0IDeqLRzvc6IbpmF9cGupruQ3GvYt3b/NnVZdgBUluiLUDn4jAro/wPT74ISIW5rRZ6vMD8Mb0496vhxB5yUnPrDFUao4KHEtHHvgchp33JKEwpZJQE2qqJ9gjC4Uq9NOBZl3XKKLQh5hlubeLCjbZqYIpnMeb6Nx/Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by DS7PR11MB8808.namprd11.prod.outlook.com (2603:10b6:8:257::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Mon, 8 Dec
 2025 10:30:51 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 10:30:51 +0000
Date: Mon, 8 Dec 2025 11:30:16 +0100
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <ja5zht46osfzx7fowemw3v6ucnrugzpnhbf5l5ta7xxuywry6i@3trcfqmhk2ec>
References: <20251208083511.6dc45509@canb.auug.org.au>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251208083511.6dc45509@canb.auug.org.au>
X-ClientProxiedBy: DUZPR01CA0309.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::9) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|DS7PR11MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd80b57-7b14-4b65-8630-08de3644dbd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4Q1THwRUIj7HAN2dMWVRzaGx50BxxNEJHqH15mCEgRC8ifQOt1YnhvR0wM?=
 =?iso-8859-1?Q?1Nda0Fd/o6CdXX8LTC+QwDpj+bElccTUCQ4ptoz1FdlRilGOg549snWQbv?=
 =?iso-8859-1?Q?rHij17qhAXf7S7+9HcN1/usxza/utw2E8Siru8OW2ioqLOWwpFSwsEL4GN?=
 =?iso-8859-1?Q?AVLuVXBdvHwAx/AYhnEBEzPu2fwO6ja189y6IRAZjvr/goqBOmJEWdXcXX?=
 =?iso-8859-1?Q?+/+7a/pv7Paa+ycgYQQ6A5kGCE8lZdKByP+8BdsnF3lFiu+H7+3WeqLGAE?=
 =?iso-8859-1?Q?b52WgQGp4v4sOQnUfQ3KXwQ8T241zNoNavIULiyn7VdB1m9dC9kO6uyAjt?=
 =?iso-8859-1?Q?M4s/dTkTF/DE92ODzvoPZzyqb+soIUcbafPzY56jzZnns3bmeK8xCn7g+G?=
 =?iso-8859-1?Q?l2mKG10NT0iZCa5ABM7QbO6XGx5hoZQHh7jUdGq5qr/6gUeHVWo7Oobvaq?=
 =?iso-8859-1?Q?0FAFPeNTwoQog0tcWKpchu6KpK4ISzliY/asznPylLIYgk23B/LRfmoDvk?=
 =?iso-8859-1?Q?oOqLUZAO4GNVKAyLAlJAgPgjaZivQ5FL4vYi0bja1aw54yCXMlX5m7jrt2?=
 =?iso-8859-1?Q?qpqPwYWTe36nLOPuEAzxvjO0eFrHbEhDE5WIBtqf0uzATCqFr0Pez3yREF?=
 =?iso-8859-1?Q?GFoxLRzrjt6ykwgs0Z+8E0SNi9fbxToKZNPmkbi4cwLY3HDSQykAbQ9m0s?=
 =?iso-8859-1?Q?mycrXSrEVlVPmpw63qwNSz6wUB4/8GiWouGjfOCJBm34p1rz9P4InZPyH/?=
 =?iso-8859-1?Q?m5Q6rpBBHkU2icKWSEhHtnd7dk3mneTGzu7yrGoBBHSBMqqvzcXHFRHuHQ?=
 =?iso-8859-1?Q?Kliiyzp3RJu7ok5tUXi9lklSCIwuTzrMCCVDORnoj0AhGoXFuufDB0tI2F?=
 =?iso-8859-1?Q?74ZFYLwb61VK5d2H6TOx1lRBIn2aaJHtOjJ1cEwsc4/UE+KkOUQZ1VC1ZD?=
 =?iso-8859-1?Q?WlSMtMGoAdEjMW7kxKH3i1/cuAXuz2zJ7r97vQlc5SQ3rVbyEgZomdVwwB?=
 =?iso-8859-1?Q?gpmaXOd9zVA6Q8vkcSg+0q+CLJKE1ThLGGbkjoen0eQv08rH/D230G3aO9?=
 =?iso-8859-1?Q?qdp6FQaLXz4d1jyl86ZqfKtT2+euXQw6eMPmyoVerBWKC4D92xrzicNOGT?=
 =?iso-8859-1?Q?oqGyYM01imTdGk8ZeRlnZqKXqfS18/eXQXXP9Ecr2SahoEmoq9aLb5lf69?=
 =?iso-8859-1?Q?/GuoTJmqGwj3KrWyyGe9JN8U3KEU325pk5H3oHl1sN+pZBhhc3zvxLnd9Z?=
 =?iso-8859-1?Q?2+j+RW/p+wazcWQqMr2Rk86kIwVfUEsA+iofRNwp8fh3LPMpsyFssilJ51?=
 =?iso-8859-1?Q?q9ZfwyxGz7CZMYTfLtt15YVmPT0FnGUA1AL+3EtwLG8vYvhJTW4WWKFHfx?=
 =?iso-8859-1?Q?V/GcapWa+1RrOkfDlSI5RsdN2PlSt3a9woMqNmRi4Rbtp0zP0ME+aYnYa/?=
 =?iso-8859-1?Q?5lQk3gKTTr/qI2aEdnBxVSDn8h908U60xwKRC5d5SKthG1lNnh+8jmwdSQ?=
 =?iso-8859-1?Q?vi0Mkv1qAt5M+RS2pFhx9BgK53RGmJPv0bBy7kbBWpow=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9XfA/HHjMgM6gBp9hLMu/0tNoKPiA3tNYycTre/gXoNE72ZOAekm6UFe95?=
 =?iso-8859-1?Q?1mTKhIU8BidrEbQuP1/WKqCm+sx8gmjt8Dsdg9rMx3B7p7D4oke7YvJ8Uk?=
 =?iso-8859-1?Q?yDhvyhzEQlGte4FzzZ9WOTqeqAyo+GJku998UHkPz7BvkVzFntpove/jjM?=
 =?iso-8859-1?Q?IeLcC2A8ChpkdiEYh0QTNXdsvuN3Sp1/x8LZSZ87eEAcZnzh2L+GacsvdF?=
 =?iso-8859-1?Q?ftgdG8QnYni11XfRGEE2T3oT1s5qLK9xDLApAz8ydffhEhsma/ks6aoH54?=
 =?iso-8859-1?Q?ekGIZ1IKw7gjpH4q3k0qcUUvNYPAlsgmkb7C9y4TIKuyZTNKp2ANZjcmIe?=
 =?iso-8859-1?Q?DgqgBiXyNDYtwwuClim1cSnXTefAJOU1PzxiPZOBRabMWILD229ybplx5p?=
 =?iso-8859-1?Q?r0+h1NAk4pxI2n35b1i69Iltpz1w8b9OaV0oWEn11riWwAI/+8A2pbXzqk?=
 =?iso-8859-1?Q?DT9jfVZIFfDczZxvW3vl1JiQaVeHVuH1DBtFLpbxis65vPA3K8lIvY62b2?=
 =?iso-8859-1?Q?FviU6UigDcdpT5FN2jDnUYjK8p6MzonXTnj5P+HJRZjtNq7ujjHP9v5JM5?=
 =?iso-8859-1?Q?0qAccXfeJZO0rjeskbWntKZvvfnluFUfrzfCmyR+gUFlqxk33kdqwLRJmD?=
 =?iso-8859-1?Q?TyWXjBy5iB73cULy/qjtS+jbBteNlP2Un8mjjeHMrJIDM1Amx8gecJhzva?=
 =?iso-8859-1?Q?AFimBNDfrIzzoDJCEtiQHcNRV2NGFEEuxZRo4CJDzaQCWxQf5yOLC6um9j?=
 =?iso-8859-1?Q?R/Z5H8tVE7x9ZSbrBlCHTvwNDRN7NEHztAHEi8p6XinYlFatXcV2Fk+Vk0?=
 =?iso-8859-1?Q?b6ZXjHhHDXedqub6H+7NnWsmRMr+wsa/qax7hTnExKw+SLiu/F5gNrf3KM?=
 =?iso-8859-1?Q?EnNKxwj6ZEety0DDrrzX6S7A5+jUDem8IP0y1EFs/pJ/UjC0Sug7F99/Lh?=
 =?iso-8859-1?Q?olCIL0rrJ2Kds2UL6t9KuXqA2CXzd9/nPlVJ567qxy5W7eIaazZI3RHx3B?=
 =?iso-8859-1?Q?rJ1saIQuNlyp2ETDTBnw4Q0sskXcmigSe7eohj6dM7WvHqgrvhsyFWFxQe?=
 =?iso-8859-1?Q?Nr4pvh8utJIIE3aQrTizcomh7ZSfUwJ+S+TZxYPnmAniYYWB9VnArpgeG9?=
 =?iso-8859-1?Q?aTa/dVqD8VqH8PPCZZZmybbHggZN0PWYZcrBDXneqht6a0DuJFA8OFaOg0?=
 =?iso-8859-1?Q?fiwnZbNtYEOKecpurvmFEvxTxfIfwCg+nNIwhnbfJx6tKqzocIULyKylnH?=
 =?iso-8859-1?Q?pZIr6eNhs7MPw6REpXofIESS8lLFp1WfdGh6A2GZYROny2XsaOwkgYH0Ti?=
 =?iso-8859-1?Q?eYA5hkb+1HrZIdpqXWPVOgTgf2JpdwxRfxzXkF3NI8J5gBoaY5fyZ+3ifn?=
 =?iso-8859-1?Q?/Yb16FFvHQcDbIZ05Te2W7IQNqNrpAU2Il86u7J5YnAp8+4/adO23r0/im?=
 =?iso-8859-1?Q?AF50sC2zTgrut+sqgaVMIJTQrCwWUiNdy0SPNP7/hact+zufbQUmg3Zq4V?=
 =?iso-8859-1?Q?/mt/VgXYNfMnidpD14XYxXhpY2IbDjfrkrEVB9SoddGgAIyCsCxzqb3657?=
 =?iso-8859-1?Q?JVegmbI6IUkDn8DuOoonmmPT0yf0H3WxXsn8AUuduePFjnRtK9gvMJ5UPo?=
 =?iso-8859-1?Q?Tccsb8tAucVg2k1S5bbWbRKUqz0LrVEBRvj2qxIM4T66Qjs1JA95v6Zn5r?=
 =?iso-8859-1?Q?R4VGYF0FssqBod9DzUc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd80b57-7b14-4b65-8630-08de3644dbd5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 10:30:50.9179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOraTln5CXb1hV+I5rHBRuPHAFgg3jsl6ktQ8WKsZjx7Iki84IiyJ5LoE3+1rCz8x0g+3IuE8lnaf9R1wh+avxv04kJkm8jik2OLKjZttwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8808
X-OriginatorOrg: intel.com

Hi!

This flag, KASAN_VMALLOC_KEEP_TAG was defined in the first patch by Jiayuan in
my three piece series [1]. I looked over git logs in mm-unstable and
mm-hotfixes-unstable and I guess it wasn't pulled there but my two following
patches were.

Could you pull the [1] missing patch Andrew? I think that should fix this issue.
Thanks :)

[1] https://lore.kernel.org/all/247fd641cbf4a8e6c8135051772867f6bd2610ad.1764945396.git.m.wieczorretman@pm.me/

kind regards
Maciej Wieczór-Retman

On 2025-12-08 at 08:35:11 +1100, Stephen Rothwell wrote:
>Hi all,
>
>After merging the mm-hotfixes tree, today's linux-next build (x86_64
>allmodconfig) failed like this:
>
>In file included from arch/x86/include/asm/bug.h:193,
>                 from include/linux/bug.h:5,
>                 from include/linux/kasan.h:5,
>                 from mm/kasan/common.c:14:
>mm/kasan/common.c: In function '__kasan_unpoison_vmap_areas':
>mm/kasan/common.c:594:34: error: 'KASAN_VMALLOC_KEEP_TAG' undeclared (first use in this function); did you mean 'KASAN_VMALLOC_PAGE_RANGE'?
>  594 |         if (WARN_ON_ONCE(flags & KASAN_VMALLOC_KEEP_TAG))
>      |                                  ^~~~~~~~~~~~~~~~~~~~~~
>include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
>  120 |         int __ret_warn_on = !!(condition);                              \
>      |                                ^~~~~~~~~
>mm/kasan/common.c:594:34: note: each undeclared identifier is reported only once for each function it appears in
>  594 |         if (WARN_ON_ONCE(flags & KASAN_VMALLOC_KEEP_TAG))
>      |                                  ^~~~~~~~~~~~~~~~~~~~~~
>include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
>  120 |         int __ret_warn_on = !!(condition);                              \
>      |                                ^~~~~~~~~
>
>Caused by commit
>
>  6b83afdcfa93 ("kasan: unpoison vms[area] addresses with a common tag")
>
>I have reverted that commit (and the following 2 fixes) for today.
>
>-- 
>Cheers,
>Stephen Rothwell

