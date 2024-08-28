Return-Path: <linux-next+bounces-3479-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3E9962915
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 15:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0015A1F22C42
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 13:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A45188CAD;
	Wed, 28 Aug 2024 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KUQ3ZJcq"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539261862B5;
	Wed, 28 Aug 2024 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724852685; cv=fail; b=Fwrj8W5bIQcHzNYmRcjFoWsIrvaAuCxNod+DIGxyofGzwyk+vBB1BelLT87XUj45qg9Ow6p0LuFtYgNGpy1FnhhRQbuWSAKgtVY14L3W0Mo57FYFHC3XNuSePSdrZltC+c+1c3LXM306tfNfLKn/2tbrHqVgp6t9gJtJwPtnEN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724852685; c=relaxed/simple;
	bh=2MGG+CSR38FS8Y7Y5qWwPWXVzvRpfjuKLpunc0o4VH8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OfiSflXVYMgHhnTMWBzqExvq+tVpkhdCedeS0KZXaK2FXuCCpqFlYdNju1W0zO+Wy7zAOfqySJdr2rqWjA2jKpPMZtdG6Bzl/9nV+XIcjXheA/dnKqM+xjFBEnI+OidOjdimuzoOWXrydKDXxwlxP3UliAoL2CsxIAKU6DeeQig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KUQ3ZJcq; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724852684; x=1756388684;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2MGG+CSR38FS8Y7Y5qWwPWXVzvRpfjuKLpunc0o4VH8=;
  b=KUQ3ZJcq+LAv8h0KiJFA/MZYfTd1O9VOhRFd1bzog50X0Q9uKiS0lhFn
   ms/trX3deUi3AjP6CKJv3U3Wklrm9Exi3Q6DuYmGZ8w9yam+R3jbzgW1v
   xV96rIe0v1kCrPLRC8HgOyKrWDbU0yE0+/IizGGrcg0p1xx06tvVqYIN9
   vtkqEGocgHs/EWZ68szPisGlLfdtFawIMNnxMxG6+syhkf/4mop+NrncS
   E3dkf7wHAnk7A3v6j1XC0idg8fWPoD8w3bDOAUgGi/PFmVXxWynxR4wCa
   o3U16TnbzSLIP/Z0pbRFrmttgGhCYJQ+4qPTMKj665D9fMRligs9iJ41c
   Q==;
X-CSE-ConnectionGUID: fmPTbAQbQFSulJVBvdsS4g==
X-CSE-MsgGUID: p84APQjwTWi3sC+E0DGiGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34790451"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="34790451"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 06:44:41 -0700
X-CSE-ConnectionGUID: 0JDDSBAVQIGlGfsWuKRv4Q==
X-CSE-MsgGUID: 2pTI+i/iTEejS2L+h40BLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="63929998"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Aug 2024 06:44:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 06:44:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 06:44:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 06:44:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 06:44:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrKvz6fUT9UuL2E37wkKN+QkzoY2D94ctJgJ8WH0gCIHLBGEhEuGJ/a4ddPg1vmc6xFIAz7iPbxQxr3P8TkRgkGWEzZ1QI0j5InH61B8yOIEE8OS/cvPPuHSdTTnUL2SLwlg28if6ObiwOPlLG07BTf9FLTA5FyrWA+TM+7z56hTdQOywkcfKmdwDkIt9ms26M9QPv/GKam99MDunD+8jGPA3bhZNe1aXhSZO+iERNmG7cvuDlOhBUEEX/sYuIm+iNlLciqBRUgM+TVW+sD7ur5DGDHHBQdSu410Nu7Af/wpEQZjJ2NsmQF2V/ZhNWvcpSbQP5DJVcgWv43xSiuqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jj+JoqIHX1/vYSQhyLM3BYKg00gZqQYS9Ci1+kbTjA=;
 b=ulFgF8hEnjDGuLWy630fLHfSJNEzuSOVq4RqeRKg4QY8z1aIolpKJ29CnGv8f9A2Zz9C94bY2Ux7Z+YkUiKtSOMt8bi2Ip+hTrpyXTIdWTJqEg5S0yr+aFgh9gQ+2H+irnRAgf0/jIeMFCUeFwxwH4aYfJFqEekV4hvenbkjdNEoof4NCQbJ+yxzCeKByHJLTg8u91ZiRzfW3cNfIUV7gSN4qmHYqn3Q1PxdqdrndphTV47I19jE4XfMmIJaMELLw5QrUIyvFXbxiyQYW8bgo152+oLNn9hq23lN+iL1LUZlpMSEYNV0Xq0MdznH+QRFCeZENFC348vBgM6tRBwnGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 LV3PR11MB8767.namprd11.prod.outlook.com (2603:10b6:408:215::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 13:44:19 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%4]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 13:44:19 +0000
Date: Wed, 28 Aug 2024 21:44:08 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
CC: <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	<linux-kernel@vger.kernel.org>, <sfr@canb.auug.org.au>,
	<linux-next@vger.kernel.org>, <kernel-team@meta.com>
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <Zs8pqJjIYOFuPDiH@chenyu5-mobl2>
References: <20240823074705.GB12053@noisy.programming.kicks-ass.net>
 <xhsmho75fo6e4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <b1824f4a-f5cc-4011-876f-8a73cf752067@paulmck-laptop>
 <xhsmhle0inuze.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhikvmnfb3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <c83028db-55ad-45b3-a27a-842ed665a882@paulmck-laptop>
 <103b1710-39ca-40d0-947d-fdac32d6e6a0@paulmck-laptop>
 <xhsmhcyltogin.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <a19308ed-7252-4119-b891-2a61791bb6e5@paulmck-laptop>
 <xhsmha5gwome6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xhsmha5gwome6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|LV3PR11MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: b01383bf-2962-43c2-fff1-08dcc76783fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?2k9m/sju7ORJcYNBL1KYXtabD/XT5XZ7Q+Y+n+VJEf4Nb0E5HEe4TB+kKX?=
 =?iso-8859-1?Q?8EJpHwKY5iCpc/NGpf6Y1FdcolaViHrb0TCRuKhBSVVJFlDVNPQ/SZzR9n?=
 =?iso-8859-1?Q?q3WDrQv4Rr28Ql5VyWYonEdETK3VY1N6hcP5hoP86dtkY0TAuUf/rAQZh2?=
 =?iso-8859-1?Q?fYP6byv13Whqz9czntzfIBE1mYayAo4mDqZLvZVYDhelRkP4HW4UNNXS9b?=
 =?iso-8859-1?Q?aBavB2ZKY4q3pLzmhJjRT3oFpy2TzjOhSjubcQNXVUKoVBQd8y2aiXv4XV?=
 =?iso-8859-1?Q?vji1vYu9J2iGI8lGGbdreNWwXXtqi2N95SnkWXKYD80PrJ6DzUhP6GyeW1?=
 =?iso-8859-1?Q?EMYqqFapirrGXDRqsMLkIB5T8R1O16AOteQXcFdG4z/lreoEB+T/AO8fQ8?=
 =?iso-8859-1?Q?plOmNMcpvgEjKjl8gUGh/4Xh55io5DAUUfOIM6woyIAFmxvX66TVUGH8BM?=
 =?iso-8859-1?Q?b0YHDbTLf86X8FpZ5dTDNJFmmUHTSecGEfL+siyLOZ0D+Mw4kN0LiFcidg?=
 =?iso-8859-1?Q?FRCCVIcOZe81I43aM8HnSzazDePAci8+1S7JYTe/0yFWIMm0049fVgS24v?=
 =?iso-8859-1?Q?1SGLKm/k3FkfciWDscC64WdmscY9t8/k4+dzbn6w02RLt6KKxSsODs//YY?=
 =?iso-8859-1?Q?NN0vxTS4n1HKzdvOclZnxfw6AwOAjdaddSbLMK6bj99Vgx6mg32p84/gYC?=
 =?iso-8859-1?Q?XtaW78m8Liastqsb7EeWLJ+lVoHfl8bz0aR65EQlo1N4ukzyK8ZAAJ9IKJ?=
 =?iso-8859-1?Q?2NYFoNWY8npIGlfHgzeEchnLNGuHh8f69xfKt92vJbGrLL69mVWdGqp9IY?=
 =?iso-8859-1?Q?WQCrU0gvAjKReJLvFcIt4+NVLTcRh6f1ooFgGom0Rw2CtI/YjIh9IzTSe1?=
 =?iso-8859-1?Q?2Kms9I2UA6nixXsxS6pJvke6uj9W25HWX7nofUU98nYRXa7mrCG7yb52NN?=
 =?iso-8859-1?Q?NyN4rZ4llFvnm9ifKwKIhA3wfcEBQAZa7ASnLK1DfpLeBVGMQWyfQmvtpx?=
 =?iso-8859-1?Q?FkzzAvv27BfypNNvFRDo6OgSGwQQ6ZNgD0o4C9Y5QPqbFcMZVaXOa5DVgm?=
 =?iso-8859-1?Q?QcyAccwTgYWmKLrxx6fZAuxOw9GdwJ+5DZL9KHwHnl/NKQJC2xCOtPjNuK?=
 =?iso-8859-1?Q?NZx5layOi0CF85ZuhHxby6YjD1c4Tm1Xi5kxAOj/ND4u7HxH28xO7jMRNL?=
 =?iso-8859-1?Q?jXTPg1/v8ROFiGiFtpjVDKAr8maeSHVs1HdfbaexYDnc+qZPZKVyCoU9D9?=
 =?iso-8859-1?Q?b7wa7r/0raeWfuqSkAnuTRWopQ562CjqEcvTOYuSq0wAKxY20n24XW5r3c?=
 =?iso-8859-1?Q?VVZLW6c1vzZvL4eHLXtihrpo40jNIUbcfI6rr75BgkbGwPC+pDfw+QWr21?=
 =?iso-8859-1?Q?Gq4HFpntk8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?o5kvpjIoLLnJlcQREXYU8jK26Ubby0xT6rIeBjILcaUJS0kPmxOQKyIbCt?=
 =?iso-8859-1?Q?lB/C01F1Uml65XbqQ+D1X68UVgd+W8Eiyv3ryMScxmiG9HEBdThsHRvcMk?=
 =?iso-8859-1?Q?7enooxxJLMw8njBH6Up0FZyxcMedkbNWPAEkzp+H3K4+2lksV4tQHUn7/g?=
 =?iso-8859-1?Q?Ixgpww38LOv7Xx5IP/eZ+JStmMxOeqF4fSxd5qGGQL0JUiCtmy3VfCk/Bz?=
 =?iso-8859-1?Q?UKP9CaOZKKb3PHFEHI1a3+us44WvTTgOqySSpDPQchEW4OI/fC1UZmRXQ6?=
 =?iso-8859-1?Q?0S3J2mbubnu3T2DrYxj3diK25njrwISemPvbYViukWB0fAgPxRtXnJzHW6?=
 =?iso-8859-1?Q?WjKkAkMB0qqHlSyTXrYlqReKePyXMmu8noQGtjD6pZUlc4o+OzZxOjQ1Wp?=
 =?iso-8859-1?Q?zd3OsmJ+l1gHVz+PZWDpnO4h7kLZbyGAOH2Ru0cguqLBryaHVu50CajFvV?=
 =?iso-8859-1?Q?RJfyJU98n5qIwaq9NOUAX2lO/OM5N8xTsLp6+LSHfovF7Cs47MZ9s4cnge?=
 =?iso-8859-1?Q?Y42XMzCFErE9pjucWeBB2DTmBBcUB/GalyfRRDL10bw+bZy16zzlpMFreg?=
 =?iso-8859-1?Q?1TAPU6/3KqBu7mUtM6foRKi52ca/wuhbTjDGXLfV9oER3lHmpp4W8RJPan?=
 =?iso-8859-1?Q?U6tO9eDcH7Dkrqf7ppyAEM+qP/6Ck1RyGc+3/0JomL64JFa8zqaeDhkFE2?=
 =?iso-8859-1?Q?bkv2T8e/pPnulI1Up3cHeuDR5BIzCscSJQ22g0Y/aISII2eMzWdvwdNOMR?=
 =?iso-8859-1?Q?V9HhDflvRUkmdtEb52aY6Mcjcwtx6+wDDKiCO90T3a3Zep6OjBV/1mxXPN?=
 =?iso-8859-1?Q?8kf5OpDcJYjiBljPveItf/B8bB9/tTmDPNBOkh4Fthm+TuYn4skT6rsmLR?=
 =?iso-8859-1?Q?Midxo5PMfwE3v7bD4RfLJWCfefkAm0pfTHvMZAPzpPuQOQI4ReX7BCAV01?=
 =?iso-8859-1?Q?RHXM2hlGj2w7xj94gOdl2ieoAU3tQep1KfteFjIFHHEwOEpceouht3XYkX?=
 =?iso-8859-1?Q?7dD3yVNFZcQOwfuJEO1SHUJM/eO2vgIUNb2xU+B/O37DYTqGDVAn7HzbD8?=
 =?iso-8859-1?Q?oJSOy6bqH/AVh9aDaz1onxg47mjRtE7yPBun79tI/yUxa9WR2sa0xhHPPg?=
 =?iso-8859-1?Q?gki9dDH5e3sJtL4B5WCpC8hZq/+qp80MDPR3ejEpd4+OUsL1q/apA/yDjI?=
 =?iso-8859-1?Q?FhfVj7AvFfb/5Ly+kB8/nMaNuLdgwjob0/4GshGMSXk1a1xQ9BFSuJy+qh?=
 =?iso-8859-1?Q?HN8uYbYPzP6DK8jMEPDtMNq+dN95qtAuuH50mWxuAjtfV5GHYapI7xMrOO?=
 =?iso-8859-1?Q?3OC0/u1fOoOHQ8gW68lRR6zFthkCcZcetmtuXnoHnR9nsF9aqx6Ig31mIn?=
 =?iso-8859-1?Q?EtYnQ1gFMC2yKNXTPVchOpbRIqgkSOpAKg0CRWUzOhYqA7Du5zdvxmv0Fp?=
 =?iso-8859-1?Q?Xx3gksdpVD/f6YmK5M6V7yuo7S2bk8hyIMYIKwpB1ABpHbwwnxX4RbA8Yp?=
 =?iso-8859-1?Q?pzfu47lrMVs1hobeAfelvtKnZPoMF4n6s78sa4XpM0jhSS8GQBxQbG+4jD?=
 =?iso-8859-1?Q?mgSwl+n56RXOs9TvFgKl7sthK9veZ7uu3hLogZYeb2Ahz7ZRGcvNQIeQaa?=
 =?iso-8859-1?Q?8u/o9Axx6cU/dsrYQKlCoyM0lv0diZFzVA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b01383bf-2962-43c2-fff1-08dcc76783fd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 13:44:19.1093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TibukCsZ8BVClGnIMJ3gktJee5yVJrdz1WVyhb4lDmBpyh5a45/q/sE7stxXgkHdpZP4FhOWHadgBRN8WI1Agg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8767
X-OriginatorOrg: intel.com

Hi,

On 2024-08-28 at 14:35:45 +0200, Valentin Schneider wrote:
> On 27/08/24 13:36, Paul E. McKenney wrote:
> > On Tue, Aug 27, 2024 at 10:30:24PM +0200, Valentin Schneider wrote:
> >> On 27/08/24 11:35, Paul E. McKenney wrote:
> >> > On Tue, Aug 27, 2024 at 10:33:13AM -0700, Paul E. McKenney wrote:
> >> >> On Tue, Aug 27, 2024 at 05:41:52PM +0200, Valentin Schneider wrote:
> >> >> > I've taken tip/sched/core and shuffled hunks around; I didn't re-order any
> >> >> > commit. I've also taken out the dequeue from switched_from_fair() and put
> >> >> > it at the very top of the branch which should hopefully help bisection.
> >> >> >
> >> >> > The final delta between that branch and tip/sched/core is empty, so it
> >> >> > really is just shuffling inbetween commits.
> >> >> >
> >> >> > Please find the branch at:
> >> >> >
> >> >> > https://gitlab.com/vschneid/linux.git -b mainline/sched/eevdf-complete-builderr
> >> >> >
> >> >> > I'll go stare at the BUG itself now.
> >> >>
> >> >> Thank you!
> >> >>
> >> >> I have fired up tests on the "BROKEN?" commit.  If that fails, I will
> >> >> try its predecessor, and if that fails, I wlll bisect from e28b5f8bda01
> >> >> ("sched/fair: Assert {set_next,put_prev}_entity() are properly balanced"),
> >> >> which has stood up to heavy hammering in earlier testing.
> >> >
> >> > And of 50 runs of TREE03 on the "BROKEN?" commit resulted in 32 failures.
> >> > Of these, 29 were the dequeue_rt_stack() failure.  Two more were RCU
> >> > CPU stall warnings, and the last one was an oddball "kernel BUG at
> >> > kernel/sched/rt.c:1714" followed by an equally oddball "Oops: invalid
> >> > opcode: 0000 [#1] PREEMPT SMP PTI".
> >> >
> >> > Just to be specific, this is commit:
> >> >
> >> > df8fe34bfa36 ("BROKEN? sched/fair: Dequeue sched_delayed tasks when switching from fair")
> >> >
> >> > This commit's predecessor is this commit:
> >> >
> >> > 2f888533d073 ("sched/eevdf: Propagate min_slice up the cgroup hierarchy")
> >> >
> >> > This predecessor commit passes 50 runs of TREE03 with no failures.
> >> >
> >> > So that addition of that dequeue_task() call to the switched_from_fair()
> >> > function is looking quite suspicious to me.  ;-)
> >> >
> >> >                                                       Thanx, Paul
> >>
> >> Thanks for the testing!
> >>
> >> The WARN_ON_ONCE(!rt_se->on_list); hit in __dequeue_rt_entity() feels like
> >> a put_prev/set_next kind of issue...
> >>
> >> So far I'd assumed a ->sched_delayed task can't be current during
> >> switched_from_fair(), I got confused because it's Mond^CCC Tuesday, but I
> >> think that still holds: we can't get a balance_dl() or balance_rt() to drop
> >> the RQ lock because prev would be fair, and we can't get a
> >> newidle_balance() with a ->sched_delayed task because we'd have
> >> sched_fair_runnable() := true.
> >>
> >> I'll pick this back up tomorrow, this is a task that requires either
> >> caffeine or booze and it's too late for either.
> >
> > Thank you for chasing this, and get some sleep!  This one is of course
> > annoying, but it is not (yet) an emergency.  I look forward to seeing
> > what you come up with.
> >
> > Also, I would of course be happy to apply debug patches.
> >
> >                                                       Thanx, Paul
> 
> Chen Yu made me realize [1] that dequeue_task() really isn't enough; the
> dequeue_task() in e.g. __sched_setscheduler() won't have DEQUEUE_DELAYED,
> so stuff will just be left on the CFS tree.
> 

One question, although there is no DEQUEUE_DELAYED flag, it is possible
the delayed task could be dequeued from CFS tree. Because the dequeue in
set_schedule() does not have DEQUEUE_SLEEP. And in dequeue_entity():

	bool sleep = flags & DEQUEUE_SLEEP;

	if (flags & DEQUEUE_DELAYED) {

	} else {
		bool delay = sleep;
		if (sched_feat(DELAY_DEQUEUE) && delay &&  //false
		   !entity_eligible(cfs_rq, se) {
		//do not dequeue
		}
	}

	//dequeue the task    <---- we should reach here?

thanks,
Chenyu
> Worse, what we need here is the __block_task() like we have at the end of
> dequeue_entities(), otherwise p stays ->on_rq and that's borked - AFAICT
> that explains the splat you're getting, because affine_move_task() ends up
> doing a move_queued_task() for what really is a dequeued task.
> 
> I unfortunately couldn't reproduce the issue locally using your TREE03
> invocation. I've pushed a new patch on top of my branch, would you mind
> giving it a spin? It's a bit sketchy but should at least be going in the
> right direction...
> 
> [1]: http://lore.kernel.org/r/Zs2d2aaC/zSyR94v@chenyu5-mobl2
> 

