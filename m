Return-Path: <linux-next+bounces-3570-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B245996ABDC
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 00:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F36AAB23D7E
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 22:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A80D1D58B0;
	Tue,  3 Sep 2024 22:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixcf00Dk"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4261DA2EE;
	Tue,  3 Sep 2024 22:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725401361; cv=fail; b=CrE0siqJUwaClnBOsUTctBIj7CDinRleZbwMVnKGRE/9XjiBJ7d4hGMo3pfGrCxtHTz2mYiDcA9hfQoWejCVMAD3keYtuihuuZJt115OaOCsnUQyPZ+6upo3vLoP8/20Ce8d8mmWHiBEiCWzTB4Z/BT9wXganB50fsiK/fTO0S0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725401361; c=relaxed/simple;
	bh=mBMh3Rgp4fx7V7biLGf+72oSM6HMTD3LqYU01szGe+8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=phfLZlI4wW+mxEUT9L5irf2o1Z7nVNdneU58ep72vEgenaWAtqOaJM7wJk3O/WZ/ZxI3Fpg0QREYR1Xh9krK+nBIHOSkitG+e18qDEfDOfUEUoVFUv0oMC425v8zeBN6cI/xHWHhQHDiDdZ1Jo8jdvthF686SRxaNfmxQW7z9g8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixcf00Dk; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725401360; x=1756937360;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mBMh3Rgp4fx7V7biLGf+72oSM6HMTD3LqYU01szGe+8=;
  b=ixcf00DkXBU8cDyFfKULYModxbIa+rmKX3jYAgDrmtycLTrbxsVISY5w
   W+yQgKPh1k4rXMzl9+hxmiOdX1fcBPgarjtkyS5tuug5CAURJfzOm9fP4
   fKKevEjMcX7j4eGNaJvPlaUH/nSRsZuAlWnTgs5dFZUK2aD2k7027Zs2f
   2XIiGomyeIsyEcq1dpKjbavPQeg8BYse7hHIdyq0uKRKMr1CESfrChWd/
   pyeWcyE6dp9CDyidL3k2hf5J1Jw2mHkupoIVkUm6ZoVjFzTRAIaXVzRkE
   y17CxCGY8ynQQYiHPJkzzBcpRISHLYXXFHH9iLSZYYPUWzE/OTxjQx2am
   g==;
X-CSE-ConnectionGUID: ysGR9ns0SaSCsE0y2ISmCg==
X-CSE-MsgGUID: /UJxpCSHQGeljQbSrN530w==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35186541"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="35186541"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 15:09:18 -0700
X-CSE-ConnectionGUID: NJ3KviFjR3ih/VZHbYC7ww==
X-CSE-MsgGUID: o8q5JL1zShCS3fu6ExREBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65561781"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Sep 2024 15:09:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 15:09:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 15:09:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 15:09:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhelXSuN16U/8gJuCBq7xtRsJFBcpY/6U4+1uwbnKB0y098tIu/hdbCh+4btSkisP9Pw0LU37mnk9ij/vf2GeA/ms8W7K8eQNlVMJq1sWZSnFHGjZhxyG+cxeeEhCcamdiUtctCZr83+Po0k87Vc6L3UysWHTkp0yLOgPAgF4buFCEK7lBQtLregNjCSwAqXPGrcjLOp2iX9mgYkuQ8tLbWULMH0fIBj8L/4tNBccXOrnzw9YI4hsPdIUR8hyxV9qd14Our84FcE7AwMxdRQcM0bONVrzISqx59xHtw6psJ3SduTcx6YI1MxxSwvlUtXEbhvZhlTlFrSu5hHm59Sqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNdy+ynbXbsNEiyXM33h4aGPSZLCDxmHucMdlYmxqsY=;
 b=Aag22CuYYwsf41bS5Rv2zckMJpWWDLLJXAXRwfXizAteUXf2MKhQyUT3ucraS2UwF9x18/XL3eFV39u+0atMr0vXhRlpgK6pIUCokzSukQvOP9pvJtU6Vh1fkbUCPsG7ciXxvj+1wWmX5NetiRzMhgiOdvrgKtaCACO4sjpcBZY3RNW+pAJMhbV6zFdKUP1+l/Eq2DfsYwebsG+iK27OQ3j3sD0Uc2ToxJ/oTNSC5wGK0OzHg1e2hA/ezexP1Xsi7i2Zr37c7xOU3ncYuKOPOiDyF/YSbTRpXrAercpNOoo/YaJJWg0mx9NYNgC+jrOWJHGPwXQgAnTegGHtvwGPSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MN0PR11MB5962.namprd11.prod.outlook.com (2603:10b6:208:371::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 22:09:15 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 22:09:14 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab
	<mchehab+samsung@kernel.org>, Borislav Petkov <bp@alien8.de>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: RE: linux-next: Signed-off-by missing for commit in the edac tree
Thread-Topic: linux-next: Signed-off-by missing for commit in the edac tree
Thread-Index: AQHa/kz76YZ4Hy0EK0GXXgRXdBr65rJGnu5g
Date: Tue, 3 Sep 2024 22:09:14 +0000
Message-ID: <SJ1PR11MB60833DD539A2191E72F1202BFC932@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20240904080201.407ada9b@canb.auug.org.au>
In-Reply-To: <20240904080201.407ada9b@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|MN0PR11MB5962:EE_
x-ms-office365-filtering-correlation-id: acaa8433-8c59-4d2d-2228-08dccc650c10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?NZuvMwyo81BtbYcQ/1HPi8TbapWAb5bNuT3Igecy58lp+xu4+dlu9QC8svv0?=
 =?us-ascii?Q?VYEBzqH4Zkf3xdPCagOkRUE0v+VT/YpExiMy6jkO1LR9I/kpEZW91HEDFB2I?=
 =?us-ascii?Q?jkLmLEnwGF1GCNzVJfch2Lq6OepP8na85Mhy2LWuBUcxuYQJQD3DN8o7o2qv?=
 =?us-ascii?Q?qBst/kP/h1MwWWgmHUVDXpObrwoG8D4h812qFBzIUkcaBe5ezjcQqiYFpz7R?=
 =?us-ascii?Q?0Qn2SWmIgB+KDyI70FHwPzO/daGakOv8Php1sDXyhMOTxkVqaMBO1tOz8LvK?=
 =?us-ascii?Q?G/qfDpGX4qoP78/feaCvHmOaS6Z86gsrtldocYn1PLVb9PgSA397N73ur/sy?=
 =?us-ascii?Q?QjCBrmnUMOq1oxBDGaykuPQxipXjeBNGIFNt9vYnjEpMihA6k+C69EKa7KBU?=
 =?us-ascii?Q?3cX6sD42AJUSkD73x32hljDihPmgBRnvmoGsKNKIlXp6Fo+Gp5hq7IWm7Dha?=
 =?us-ascii?Q?P80Muqk44lkrxZ5mxp2ZBadoKw6jAQq/aoJCfjXICARXkdkU41NS3diilBvJ?=
 =?us-ascii?Q?DOXDYBlLSL4lRaJkxvLdsyMyQ8kogB2OR0H7kAJuC3v2Whkxw+u54NPUpVve?=
 =?us-ascii?Q?yaOGzy90tg1aYKZ6g1BZZ5bVkpTCpuvy7bcGKyZ1Zto8KsGSO7+r/luu9xTP?=
 =?us-ascii?Q?l9tvTC39y9QpgmSRrw/jvXylAgGVI3r1Emg4D+iIO/8PIAEqGAoVkilv7vY9?=
 =?us-ascii?Q?YsNIu4qosScNopu/0E9kL/1Z+yZRW+6R6zirkH2W7cagKYmprAK0tVeZE7hN?=
 =?us-ascii?Q?Gf6UyNTBuwDdTEz6JwBsZ6PZqloyahx6JdJq1b7oebfAQEZP2Yk/i0ICw8y6?=
 =?us-ascii?Q?QYNZI1sXP/D+jC/BOg51lQViClTAhiJDWJb7ASwYtGilg+z1DTrl4tcw49CT?=
 =?us-ascii?Q?xaUdxyEBifCH1bJUTY9a+A7Ra+gFZdfQhpuX5D/kFXxH/VJgjaCK13E+qDtF?=
 =?us-ascii?Q?W68QgsTiyzU08VboUcMo0y4vxCm8wLTpHydfcafBQi/8AtQNMEjOuorkwdZv?=
 =?us-ascii?Q?2xJjR0pQ+iYnsN0NeSqP/HjmZEBU+TK6m1Z+ft0jnGndYcr0nOKMrLz5/ff3?=
 =?us-ascii?Q?fNY7y0hsEEmDsD+L0Ynv4Buw1pQ5AymoUSmZnuyxYDJai38R83sSN3K8KoXP?=
 =?us-ascii?Q?yFE2e0g7o5WXqJg7Lhztvv6gUJrY4bQQAv3eluL1+4ibwS2PIrWfpopVQoox?=
 =?us-ascii?Q?g5VIzMQlixyjW5DzTcz0rcaxs9q/SZkrKaTXVnxjc5kNuAsvQVUAL/nIHesC?=
 =?us-ascii?Q?yvMqtZT1cZLerzOD4Y+UZUY6+aTxRfwX1TE3lBN7/DypMQTSVDeWQQBFsx1n?=
 =?us-ascii?Q?QJ9UoPxJqyg4szhgb/6upgGMzKKdD5Jk5x1zt/TV+7S3KzxfrffCMBfSABxq?=
 =?us-ascii?Q?adjuOX7urA5H6z/Lt745WCultvfgZ9zmW3/wubzBdviwx7gVxg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RgOhlAObPmZpWCXfN4Y2/NkH3YxsVi3wUZyU2ABTMveHvzZ9v0VlHCq+ggRe?=
 =?us-ascii?Q?UPp7JH8wc6OXQRFdWUDchEeHICOdMZx37D9Nk2SHzt8No1gp4mX04fJ72RVP?=
 =?us-ascii?Q?I6OhFUKNSeM191Tw1VVExOCEtV7oGpGdzcBKcRVWMiDkYUsEyjSrlKphzMMN?=
 =?us-ascii?Q?YCuE15CuE2kYDZFhybLZ7mxwmWiSXheRczy9NeYr6ReT9UECyjqzB0N8kPbc?=
 =?us-ascii?Q?8G0/X3tc/o3B3aAYglWinJsmteuEBhEY6rs4IsIjouHZUorenT5JXhs1ST7+?=
 =?us-ascii?Q?NNNvmmQF2zz0RjDH0GeKMPzoztpIsdDGwLxSj5uYgENpbnDsyAOhvBKmr5oo?=
 =?us-ascii?Q?A3XPAAMkmu/tdFTxQkXqj65R2hUEdA2NtJh5TPqmdOdvLVp2DvFnPWkDqfov?=
 =?us-ascii?Q?9z4fh+gBu9sKixYmGo4nJQR7jNittr1gkcUKYkQGjfEpWdKD96Gxze+zLuh0?=
 =?us-ascii?Q?BA1ibHsXKXXdJUd+WJUapMsKm24mSbj+t7gQn0TMNvf/lvaj3Z0o+oy8wYkf?=
 =?us-ascii?Q?HI8ziZJ4VtG88f8SXm9bjYrpEls1BZqxC/HrhDCM+Zuyqbxk7tGTGbbdnjM/?=
 =?us-ascii?Q?O40r7K/55ZDsUpmAkcTjGYbrL7nV0oouyu7cf21pj+Yu2YCcOCK+NK8DOiVt?=
 =?us-ascii?Q?blAxypd4XRBRXSrM/BFOduGkxiBvxHYDd+GGtoJJemAyy6zTVzuivgSvxIEN?=
 =?us-ascii?Q?sKaIyo+vQqn3ddOZCGwy7yhmATJ4NPEQrxKQCkRT5ermRuRg/21nnNEqRP8E?=
 =?us-ascii?Q?/Loopgr1xhPyYg1RzfPb0vHntYxwQcUrMfHWwbNUVrUJ397Kqt+mqHh81yW5?=
 =?us-ascii?Q?YaamYMqiZheFlNei9tAwPlyeL1XdUrkI7ntBJOIv5yOJiEhxfESmWIZS6m5b?=
 =?us-ascii?Q?RRWfjcL7vX1uTyCh5GJDVeH271Evqr3SqrfaR8f67LGV9zYLuiJhqdHIpUqy?=
 =?us-ascii?Q?nDcrP8uX7O4zOQIJZTRr8kCFbYBRjn9mH1aVTeVTuEUeDXCPAD/Immm1TeQe?=
 =?us-ascii?Q?yZGe7HOsXtrnxCqM8YKBsnfHv7JqsP0vYjfsisgbMRfvzAgAjzH4Kj9RQnfj?=
 =?us-ascii?Q?qgzdNO5yn1EBuLZLMIu2rQND713wM6T6n+8MPwrHlvyRwskynn7r682VDahH?=
 =?us-ascii?Q?sNmhx9g2v9XTNm+M+dQxLi2ZSaExxWW0LAlsq3i9NdQY6G3OfxzCkb1GA2fz?=
 =?us-ascii?Q?WdZMp8EkLdNISS+PNUm1ztVXecaODXPK8rTdNz7dOZUnrk+k7ffll7+UqWwx?=
 =?us-ascii?Q?ggXVGjDmfEqbGvA/lH8QkD9Fwr+xjBMYrHe3xVpm3QcsLMd8vibPKG78LFDV?=
 =?us-ascii?Q?GyIhipm1o3QFkLeVExj4W+SuvDw7Yzk6pJ69p4E/lMiPgGvVjPk7ZPqasdZQ?=
 =?us-ascii?Q?4WHzC006QdJz3DzpmlVRby+Y3WJqaxv+Zsk5zdw6gOxh41YMcO7pE8AqBByp?=
 =?us-ascii?Q?RA49qmQI38IjXTb6zeVGJb+saecP7X97Xh7YEl5Kbua4cf17FPutKcpt4nx6?=
 =?us-ascii?Q?D/V/6y3Oxe4kZ2LYCf2N3oD6+/hOFmXnS5hXgVeGLZJgW4KyyTaaMfm9BNga?=
 =?us-ascii?Q?G6AW4xnotaR/L+/ANL1CLfZm2AmlAR2pT3x57SwA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acaa8433-8c59-4d2d-2228-08dccc650c10
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 22:09:14.5625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JyiOfekSv0Ds2wbxbePQr0IP8DC55wtROGhsqwr+v+xlHuEnjp68TY/p1OiYgOp/ZA2+8Z15VVbp8QoBPcPcSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5962
X-OriginatorOrg: intel.com

> Commit
>
>  b4765ca18f95 ("EDAC/sb_edac: Fix the compile warning of large frame size=
")
>
> is missing a Signed-off-by from its committer.

Thanks. I'll fix it and push -f an update.

-Tony

