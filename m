Return-Path: <linux-next+bounces-4106-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 617349900B6
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 12:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23BCC285B75
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 10:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD49137903;
	Fri,  4 Oct 2024 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwTumWF/"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD4D146A83
	for <linux-next@vger.kernel.org>; Fri,  4 Oct 2024 10:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728037047; cv=fail; b=VxqPrRnn6uoIQada/EQyDhBAP/+9F4rBG6iAASkaoi/NERAZ2M99EvAoEGLRDTXiRkquPLVI0D9iJoQoO8KkDaovALbmLDMiLg1tjFZIbUvKIxlVcXklZ0ZR0zDBrQSgAIkvXY9v4vKGuhjYKeZjVXejy4mfYVPKba/5v/YNKa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728037047; c=relaxed/simple;
	bh=K4JplpCjE22TyFdY6mQpcUYsZvmFahfb7b3snYVUqa0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nMHP7VwjKVUyq5LY2JAuk3HKwpRyhO8gGVlxIDqZI9HfjKRIV1vTDhthZQq8pUzUv5wWJXFWClOO5kwM3OOgPWe+0kpuPq0mfTLaKoWAywxFdJWgT+sXR40NJrVmdxTqX7AF4Lg0jZz8UeN0gpjpD/ohuBQfDw60WsO4DXdcuQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwTumWF/; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728037045; x=1759573045;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=K4JplpCjE22TyFdY6mQpcUYsZvmFahfb7b3snYVUqa0=;
  b=bwTumWF/PBEAuoX3F1mI/Uz0evEVurgvYx1HROa/qAsQgwF1fzolOl9j
   1AVKQq0WkuTZjTlQbVc2N8eq9FDtvpHwiqbxIKN99uU4sing1ntrY8Zy5
   Z6sDkHmG0xIwVHKECSfV3yLODOOxN76A8vv2KliqOhouQ5qKgWwiYJA2S
   760GZF/V3/+dNiWRlgwzHhzjvYQq8pzprdY7anKkkWnXqaME75LdkKpA6
   VdfCc3Q/LU6rNbHXbcOm4bg4Z3NMiViv6Pe1hnkZuutsBk7CCz8Hl+TH4
   m/Uaj3KGiN0VG4zRaZvhRF9pVLf+BrECsKQI5EGYlPrHw/y0Laui2GZnG
   w==;
X-CSE-ConnectionGUID: KXnVOSXvRJ6ZKzTJhwJcgg==
X-CSE-MsgGUID: efEQvdbPRD6KNUKftu7/Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38614023"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="38614023"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 03:17:25 -0700
X-CSE-ConnectionGUID: 6bXdWst0T7qA4z9KGC21eA==
X-CSE-MsgGUID: KjJFZ/FrTvyVxVb2uzkxIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105500602"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Oct 2024 03:17:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 03:17:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 03:17:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 03:17:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 03:17:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrfMmapfR/fDmOjqPandiYwCqEbQnTXg6pa2D90XYOCZ/Ypw8G236sefs/7vgDyJ8TSTb1K9DnSTvq/jnWIzjoJFrwX5JAGapGWdjJjj0QODOxPbJgb+f3wI6EVeB3g6deHLu1EWXHsW5HGuW426kadvSWWA/rWAXupPeXzhtqmEm8AT6DBfOYTldRCyb4nAcSqpeZfzT4IxbNPgWRfcRgIDZy38EA5RZBfEVvVwauExI2SLld6HcUBYRZMMCRNp4fakC9R5qx4+wmy9oyT8iLu1VmKhsr97dDV9kuztNF68/XJlmChvhQK64FA6P1Dym2FwnPhXSdfnJ0JCYTKNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bo12rR3tnF2RTwR9wJp+fWTnAX87TlWrm1IaexCVXBo=;
 b=RUbuRPlBTbPSrcCZGlQif1Xl3+p0226s0hFXsPXFpy1nZToLL/nqK2fPuURs+mn1+ECZKGdKcyfQSKCTyamcWZLQV1a/4dMNRSPrWWH9yPMdRT9Q67eaKp2AZ8QXL0xm7b/FoBmQvuzzUN7+u3H/ExmBTWCWGXzCg6ckb6hMVqP1iIUSJOsDh4X2gL4VoFssLaCrNBiRbmHTzITMU7cPo7aVPiXbl+bEqm199gY1lv1yK0o+Gthxowm+H5M6SiY0Hx541JJjM2c+nCpYobK3EndL9kSO9Jtx/blIvUaKCcunP6JRuL96/z/N7ppuvgXlGP3CUSp2WPtrqhpWB5AFXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 by SA1PR11MB6664.namprd11.prod.outlook.com (2603:10b6:806:258::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 10:17:12 +0000
Received: from MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::7f88:f3b1:22ec:f508]) by MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::7f88:f3b1:22ec:f508%4]) with mapi id 15.20.8026.016; Fri, 4 Oct 2024
 10:17:12 +0000
Date: Fri, 4 Oct 2024 18:17:03 +0800
From: Feng Tang <feng.tang@intel.com>
To: "V, Narasimhan" <Narasimhan.V@amd.com>
CC: Linux Next Mailing List <linux-next@vger.kernel.org>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, Borislav Petkov <bp@alien8.de>
Subject: Re: WARNING: CPU: 43 PID: 2254 at mm/slub.c:4655
 krealloc_noprof+0x2c7/0x300 with next-20241003
Message-ID: <Zv/An5StQOBS7Ais@feng-clx.sh.intel.com>
References: <DM4PR12MB50866964E5363920F072737589722@DM4PR12MB5086.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR12MB50866964E5363920F072737589722@DM4PR12MB5086.namprd12.prod.outlook.com>
X-ClientProxiedBy: SGBP274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::35)
 To MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6304:EE_|SA1PR11MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a9c0eff-742e-4c73-48b8-08dce45db65e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ESeR3be8U/38ta/Rl3r6G6wRU9+Wru4ZAji0Q1RxxiIXGFGZvzhZJxt7AHJA?=
 =?us-ascii?Q?MOzGut6uxLZhWpwwoOTET6d4wH5fSX4Nk1TgsMOtFFUZlLIO8Pz88RjZjqb8?=
 =?us-ascii?Q?JK/KD5CisClTnoLR4bL2Izeu+Y4Y/N38J9FLO3kNS+qZP/sKhO+LTnfgtFbZ?=
 =?us-ascii?Q?aa1bhBJydE1aY0ejO7V4TNB4+JlD99Ti6xs8yytkowVyJldHvk/iQp5hq+Kx?=
 =?us-ascii?Q?J7X5m/QD6wtX0rS92OP/5lOzAFN/xM3q5ERH+IxqdSmgdv8teYHPjYd1yCZ0?=
 =?us-ascii?Q?Rw34ulAauNW75+JC4y4HGQ1ijrdu+IIQc+1cDVpUjvTb4yppB1CFPufZS3lj?=
 =?us-ascii?Q?o6Zdeo0Vl27ZHz4RCnK0L4ITA1Pd5orJM2lT7vKjXKczhKh0vwJXvXrGTmIj?=
 =?us-ascii?Q?mj74qKJJvuG+lIKfxhtzonI8AUyfsdeAa/9onMTFG+UBX1ArGmtHdM23d+vb?=
 =?us-ascii?Q?0Du5oOAgOEupJlf/LpnjNoNA5Hzd5HTTClLtZA9S73G/NKnsw1Mvq9SURWOC?=
 =?us-ascii?Q?NKxoH9eaL23Wg6JZ+jWSqyKr+T7OcEAyT9SYOWKA0h3J2xBDgkYUDClVKGoR?=
 =?us-ascii?Q?VuYPxsGmrmO4uTnfOALbP5UeuvOsAAbaeMewh3flIMDjobuZdz/86dXOawAv?=
 =?us-ascii?Q?kSZs6qcQSpZc5N2YiZawsdwFiFcob2XTMXKoGHkmN3w51FJIT8xcX5rQsjNe?=
 =?us-ascii?Q?A4YEk0v+ziBMnkfGkA/TDY7SDZCfEuLCVdD9umngXKsZoGhYqPQHLgS3xlvj?=
 =?us-ascii?Q?uDEb9s8iGmU1vlgeHGFjBz5IELIHpYogwnFdmN9lsnm9H9lluOWe9GFJNtNd?=
 =?us-ascii?Q?vQu1x4O4f1FcBqSWtI1CBrwiP+6C29SpaIRUuccekF9cmiiksXtyza5A+ZCq?=
 =?us-ascii?Q?fCmlaN4GOpYyb/ETdQl23adDy3HYDZnZheBP7ljezt8Lh3uP3XGzkqvKRifC?=
 =?us-ascii?Q?ZpkXUdhgGd++2fzEeI49rtkZTXv2dbXuND0wWawUN7yXyrsvwNI9ieSg+5Ij?=
 =?us-ascii?Q?SUHvVpf4mCJgzfb2dhoB0O2B9rvH6fne9gXBqPNkfGRKFAJc2U9fMod3+3hr?=
 =?us-ascii?Q?0fDHULi8BKX9tmxKBdIl5S8DHdOnvEXuNQmUrwsYcZomsosCFCnVRhJqNNWg?=
 =?us-ascii?Q?oS0y/i2uV8cb3c8Sc7u7oiTIh7HHtxlA9qc1MsKrfSSYV/5y4tYXlCCbRunh?=
 =?us-ascii?Q?WpoAZmKDGAf+1nrVKp84naqsc8ST6qGPPrd2ET6KNbfdRXz8ja65/nY/WDAH?=
 =?us-ascii?Q?IRsurbpAfDt3NmEmZtK6nbS4PtFFF2gfJEG3uPAvtA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6304.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T6xBJGPJLRvKeLMKx98QGVhgNkwaYxFJw63kvMtpQRW8Fg2Dl6G8ZFGM7Dmh?=
 =?us-ascii?Q?jYMh4Jt+lllqob7Gv4Iz7dkXIB5eedCd/aTgjaEHLP+EtCxpLYv4OI82onF5?=
 =?us-ascii?Q?AV0XpAI3q+vzs5xUAooYWqQmV8VYpOOOwZdSsOuDb/KM2WbUbiQz61jfR3tc?=
 =?us-ascii?Q?9J/zUexlP2xRBd7cOdbHS4jNEPbI+7xhmq4L2+bBL6tCFMHWTr5N9KAWrRGy?=
 =?us-ascii?Q?EnpWRlKc6uglErn1BKLlqu5hDE6hkqIiMB1jxntjVdDMQCrGXN0VLFEodJOz?=
 =?us-ascii?Q?Tej3jnjdVcGZhNY0qDVogF6iskAaivS/tkxM2biMNfUggyVquAs6Wh+yGykK?=
 =?us-ascii?Q?rkXKRUbBqX2bojGjgZbr4bXmATBZXerT1VcnbOJeOCjK0sSwY3EEaA11Kt0+?=
 =?us-ascii?Q?WoOV5EG6ibf5BNOoVOG0apOAWzL335OfCRd3rPSSi3dNLPfIwFjHfa6E0AfX?=
 =?us-ascii?Q?l0MNgtd3fVHCEzI9tGhEt8iW3XHhfSPVkzRIUG/aFLuEuUl11zXkX/E7Fsk7?=
 =?us-ascii?Q?WXI2NQfyW50cKM+weKmutT0xmzRCCgHUcYmouyP6yLB8yOZIAyfjXckxVXdM?=
 =?us-ascii?Q?/AFpjEJgFjBKRzlymh8nO/dVqmcTY6XVgQ/bYILB7gzg5LZoO67bpwYs8o3+?=
 =?us-ascii?Q?A89mk61KLN3Nd1a7AqPL2E5r0JRuv4YEZ9cssJ4A5cE2OvKuRI3jg1S4uF6U?=
 =?us-ascii?Q?ca93EPrVolyEzQslTQrIc2EFZoRicOIgnUNHWklXe0Lsir70pxKv5cQMIqWS?=
 =?us-ascii?Q?pJFKzROcAtbd9sYrz6GUs443oWz9z3GeXFppe+usvcZ3+maaFmT9Qczozt2H?=
 =?us-ascii?Q?kph0XJNNoCth6YwoUZn6x7PPJnLPx5iOqLUBfvnBNNCSpqXumoU6Vsvx7a3V?=
 =?us-ascii?Q?wCZlRrv/U2jk4N2VhK+Pl0bsescNDyE9l8xpTfO/bgsjuyp8NiLxjFLjYsGR?=
 =?us-ascii?Q?gkNHVtVoLXFXma7DD/hsgRrUCs3U7XW79KXvpBbxV7JeaRhmZW0rbImvyC4p?=
 =?us-ascii?Q?XZ9NMOSzDg0FF4gRJffUQFJ9xmh/UZP+83DalS4QKr/9705/Stf7/XQBcqbe?=
 =?us-ascii?Q?o+RUtWAGajUJof8SO+FKXreffGXIfm4iRw6jEF9KbQH1JMOURcum/RSgkeir?=
 =?us-ascii?Q?7+VcdbbgelbJcvw7kMwLXFkvhtPl/eqLYsDegrJ3LAn4rL3OymONYPLumVLp?=
 =?us-ascii?Q?5ICmiMFQyttFXa8wuVNQRkiUUdoyRULqB3u/3w8Lv9hg3QL3FQUkIhdBM0Rc?=
 =?us-ascii?Q?I8gEUrqDuNn/v+FX/3b8yNqi3jMYBsiq9I8jTHgZn0If0v9hASkjccl/FDGe?=
 =?us-ascii?Q?n72Q/7GlSCi3yJN5iirq64iykFnFWHU24TMxvsez0DOU85/Ch10TmIBaLWku?=
 =?us-ascii?Q?7vT7Bpg5c4zx9kndRuF8LLlShMagQpn4pnQXOwK/yp0lrKqGfNpWeHF+6Z7w?=
 =?us-ascii?Q?ZeSijmX6HAVwgOdsIKjR5sh/t0GfufrHDYnant4nYAgBvUyRhFlr43mtzJnM?=
 =?us-ascii?Q?MO3d8ImD4XU3nbJUk2aUvYXMbWHOvCrKEAs+x99yjKftTwYejO71adlFqvox?=
 =?us-ascii?Q?QsiW26CjmXkVjVKoc2R8TJV0+rBjLn1Mhw1R1cs8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9c0eff-742e-4c73-48b8-08dce45db65e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 10:17:12.4058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lV+ZiuSrnDUqLnu9rRCJa7SRT00p5b6HfMqcyzaHPr+5jbOpDeYsxHkgMBMPqP/bHTkLu01mDnm4gOWVS8k8XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6664
X-OriginatorOrg: intel.com

On Fri, Oct 04, 2024 at 02:22:38PM +0800, V, Narasimhan wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi,
> 
> Seeing the following bug on boot with next-20241003

I think it is caused by my commit d0a38fad51cc "mm/slub: Improve redzone check and zeroing for krealloc()"
that the virt_to_cache() it calls returns NULL

Could you share your kernel config? Is KFENCE enabled?

Thanks,
Feng

> 
> 
> [   22.919976] BUG: kernel NULL pointer dereference, address: 000000000000001c
> [   22.919976] WARNING: CPU: 43 PID: 2254 at mm/slub.c:4655 krealloc_noprof+0x2c7/0x300
> [   22.921382] ipmi_si IPI0001:00: IPMI kcs interface initialized
> [   22.928902] #PF: supervisor read access in kernel mode
> [   22.928905] #PF: error_code(0x0000) - not-present page
> [   22.928906] PGD 12e148067 P4D 0
> [   22.928910] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> [   22.928913] CPU: 60 UID: 0 PID: 2258 Comm: apparmor_parser Not tainted 6.12.0-rc1-next-20241003-1727931325865 #1
> [   22.937555] Modules linked in:
> [   22.944047] Hardware name: AMD Corporation Shale96/Shale96, BIOS RSH100BD 12/11/2023
> [   22.944050] RIP: 0010:krealloc_noprof+0x8f/0x300
> [   22.949780]  nls_iso8859_1
> [   22.955504] Code: 8b 50 08 f6 c2 01 0f 85 14 02 00 00 0f 1f 44 00 00 80 78 33 f5 0f 85 0e 02 00 00 48 85 c0 0f 84 05 02 00 00 48 8b 48 08 66 90 <48> 63 59 1c 41 89 df 4d 39 fd 0f 87 8c 00 00 00 0f 1f 44 00 00 48
> [   22.955507] RSP: 0018:ff6bbed6c1c0b8e8 EFLAGS: 00010202
> [   22.955510] RAX: ffe388b6044da000 RBX: 0000000000000001 RCX: 0000000000000000
> [   22.959108]  amd_atl
> [   22.964542] RDX: 0000000000000000 RSI: 000000000000183a RDI: ff4164e813680000
> [   22.964545] RBP: ff6bbed6c1c0b918 R08: 0000000000001833 R09: 0000000000000000
> [   22.964546] R10: 00000000000050c1 R11: ff4164e81368183a R12: ff4164e813680000
> [   22.964547] R13: 000000000000183a R14: 0000000000000cc0 R15: ff4164e826800000
> [   22.964548] FS:  00007f678de21740(0000) GS:ff4164f70d800000(0000) knlGS:0000000000000000
> [   22.975899]  intel_rapl_msr
> [   22.979296] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   22.979299] CR2: 000000000000001c CR3: 00000001131e4004 CR4: 0000000000771ef0
> [   22.979300] PKRU: 55555554
> [   22.979302] Call Trace:
> [   22.979303]  <TASK>
> [   22.979306]  ? show_regs+0x6d/0x80
> [   22.987946]  intel_rapl_common
> [   22.993089]  ? __die+0x29/0x70
> [   22.993092]  ? page_fault_oops+0x15c/0x550
> [   22.996110]  amd64_edac
> [   23.017059]  ? do_user_addr_fault+0x47a/0x7e0
> [   23.017062]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.022892]  edac_mce_amd
> [   23.030838]  ? ZSTD_compressEnd_public+0x2c/0x170
> [   23.030846]  ? exc_page_fault+0x7c/0x1b0
> [   23.033278]  kvm_amd
> [   23.041237]  ? asm_exc_page_fault+0x2b/0x30
> [   23.041244]  ? krealloc_noprof+0x8f/0x300
> [   23.049201]  kvm
> [   23.057154]  ? zstd_compress_cctx+0x87/0xa0
> [   23.057160]  aa_unpack+0x688/0x700
> [   23.065120]  rapl
> [   23.074145]  aa_replace_profiles+0x9e/0x1130
> [   23.077257]  wmi_bmof
> [   23.083666]  policy_update+0xd9/0x170
> [   23.091629]  acpi_ipmi
> [   23.094639]  profile_replace+0xb0/0x130
> [   23.094642]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.097365]  ccp
> [   23.099701]  vfs_write+0xf5/0x410
> [   23.099706]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.099708]  ? putname+0x5b/0x70
> [   23.103499]  k10temp
> [   23.106897]  ksys_write+0x6b/0xf0
> [   23.106901]  __x64_sys_write+0x1d/0x30
> [   23.110305]  ipmi_si
> [   23.114858]  x64_sys_call+0x1685/0x20d0
> [   23.114865]  do_syscall_64+0x6f/0x110
> [   23.117579]  ipmi_devintf
> [   23.122427]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.122432]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.127775]  ipmi_msghandler
> [   23.130688]  ? aa_file_perm+0x12f/0x500
> [   23.130694]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.135945]  mac_hid
> [   23.140312]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.140315]  ? do_syscall_64+0x7b/0x110
> [   23.142752]  sch_fq_codel
> [   23.147409]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.147412]  ? generic_file_read_iter+0xbf/0x110
> [   23.151884]  dm_multipath
> [   23.153915]  ? apparmor_file_permission+0x79/0x190
> [   23.153919]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.158586]  scsi_dh_rdac
> [   23.162360]  ? ext4_file_read_iter+0x5f/0x1e0
> [   23.162366]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.164505]  scsi_dh_emc
> [   23.169262]  ? vfs_read+0x259/0x340
> [   23.169268]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.171799]  scsi_dh_alua
> [   23.175866]  ? ksys_read+0x6b/0xf0
> [   23.175870]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.175872]  ? syscall_exit_to_user_mode+0x57/0x1b0
> [   23.178501]  msr
> [   23.182762]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.182765]  ? do_syscall_64+0x7b/0x110
> [   23.182767]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.182769]  ? do_user_addr_fault+0x55e/0x7e0
> [   23.182772]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.188116]  efi_pstore
> [   23.190155]  ? irqentry_exit_to_user_mode+0x33/0x170
> [   23.190159]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.190160]  ? irqentry_exit+0x3f/0x50
> [   23.193860]  ip_tables
> [   23.199186]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   23.199193]  ? exc_page_fault+0x8d/0x1b0
> [   23.202794]  x_tables
> [   23.205223]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   23.208919]  autofs4
> [   23.213083] RIP: 0033:0x7f678db14887
> [   23.213088] Code: 10 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
> [   23.215526]  btrfs
> [   23.219797] RSP: 002b:00007ffda7e7dc68 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> [   23.219802] RAX: ffffffffffffffda RBX: 000056055a182dc0 RCX: 00007f678db14887
> [   23.219803] RDX: 00000000000050c1 RSI: 000056055a19e0b0 RDI: 0000000000000007
> [   23.219804] RBP: 00000000000050c1 R08: 0000000000000000 R09: 000056055a19e0b0
> [   23.219806] R10: 0000000000000000 R11: 0000000000000246 R12: 000056055a19e0b0
> [   23.223890]  blake2b_generic
> [   23.226802] R13: 00000000000050c1 R14: 000056051da91c5b R15: 0000000000000007
> [   23.226809]  </TASK>
> [   23.232152]  raid10
> [   23.237488] Modules linked in: nls_iso8859_1 amd_atl intel_rapl_msr intel_rapl_common amd64_edac edac_mce_amd
> [   23.240703]  raid456
> [   23.244971]  kvm_amd kvm rapl wmi_bmof acpi_ipmi ccp k10temp ipmi_si
> [   23.250320]  async_raid6_recov
> [   23.252748]  ipmi_devintf ipmi_msghandler
> [   23.258095]  async_memcpy
> [   23.262363]  mac_hid sch_fq_codel dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua msr efi_pstore ip_tables
> [   23.265285]  async_pq
> [   23.270625]  x_tables autofs4 btrfs blake2b_generic raid10 raid456 async_raid6_recov async_memcpy
> [   23.275780]  async_xor
> [   23.278691]  async_pq async_xor async_tx xor raid6_pq raid1 raid0 ast drm_shmem_helper i2c_algo_bit drm_kms_helper crct10dif_pclmul
> [   23.284046]  async_tx
> [   23.289383]  crc32_pclmul ghash_clmulni_intel nvme sha256_ssse3 drm tg3 sha1_ssse3
> [   23.292308]  xor
> [   23.297157]  ahci i2c_piix4 nvme_core libahci i2c_smbus wmi aesni_intel crypto_simd cryptd
> [   23.302509]  raid6_pq
> [   23.305326] CR2: 000000000000001c
> [   23.309217]  raid1
> [   23.314552] ---[ end trace 0000000000000000 ]---
> 
> --
> Regards
> Narasimhan V
> 

