Return-Path: <linux-next+bounces-5026-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC46A01C26
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 23:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F15331883859
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 22:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2947913F42A;
	Sun,  5 Jan 2025 22:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S98GGKkA"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1458E1F19A;
	Sun,  5 Jan 2025 22:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736116500; cv=fail; b=uWyd1+VqvCUk/ifMxhZq/2FTxxIgosnEUJf2amieQNPPXDoUOhRy8oD0RBgTqc5yh2dfzbeUlFtZvc+xoJFIpfw9l/p71kKAXtJpNzYMwsxoofhRa3V9zJEoKOaewkdTsPrZNUuO3olIoZqEHQ2m+0VlbXI9QEVt+hDnjG9wgy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736116500; c=relaxed/simple;
	bh=kARSzs26vKJKZ/1izntByKHf2NmyqRUVmL9yQ2n+KFU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JWd3Dft0YcIfSkh0GYvfwcDSrs5Jub1jgm0+3/qOtVPyNSvkyBWOlaTpee2r2ZT2p0vxbDrXiA8tHM8ISRwunocNNjrQHxwAHfAX6kkMrmrkiAdfTIUCN60BbLP55UXD1CVozBsdpo/gUFkbBk+kdZX48z6OmrYxCQm0tUOn5bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S98GGKkA; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736116498; x=1767652498;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kARSzs26vKJKZ/1izntByKHf2NmyqRUVmL9yQ2n+KFU=;
  b=S98GGKkAgNE7pwx94c4a3+o38JWNO65p5eT+XKiNJvyuvWhSzjkilV8d
   xFT0ey9uF/AnKNVZ5kJjbawtQZF+waMu22a/2vFPLR2sZJUrEJb3cComB
   D1CresHXuTAYaz5QhzGmeElZrng1fW2/tG3a9EwNKndNCf1uwAkfhcE1H
   2S866lnhPupetLbePQsqntAAWNT9bep7W0YhVyihfyIBXtlecxKNTJllX
   VWmQt85V/1vDGbGEpD6fcLQBw8a+HnZLekIPN33E81DmhmbFj9qxmYd6f
   L0Uo/Vp8WuAjJvCE0I6vlt6bgywklvO+7JklD9DDRUCc2aTKPoxoXy6XV
   g==;
X-CSE-ConnectionGUID: x1dSLbO7REeibWQLO2U6xA==
X-CSE-MsgGUID: J0mOXpmBRHeflSp1zeShKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="40200632"
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="40200632"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 14:34:57 -0800
X-CSE-ConnectionGUID: S6tpsk4SQbKol99PcGAs5Q==
X-CSE-MsgGUID: 9RjHvXjBSdykbzAHLUS/Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106315701"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Jan 2025 14:34:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 5 Jan 2025 14:34:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 5 Jan 2025 14:34:56 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 5 Jan 2025 14:34:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwCamsielq595HBb8YYO5gAboY1x6CGHwPXyQUZ93sr/fEwxlvHp5S81o/6yI3JVHNNVi/o2pS/dVlR/I23axGQG9a2RegS0RKJWsAlRswX4OBYhVwmpId4wZ2k8WR+uHOCwPGzH7K163ituhPThpb3InMdCFBVXrF6yyBfUZs6SjtowcZhoAlgeGGJoh5xLzq8XBRxHek+QN4AzNLTc2rwZiJEae5x5pejIWJDZDIaLI+L5LdrPxgfkA+NpoQIGs8IBle4sizsgzKg224Uc7K0JrMYKTXphadRD39yPlgBbxmvkMGKGwxrwSGIae923TAnFD7SDdZvs0QhUqzwKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wd18/hI4GkgjxJXcTYhcVZn1ORrR8xgXX1/Ux/0T17M=;
 b=zQP3BnyfmOdeTQSt50wq+AFHDrI6bbeCbJ4QzV/Zf5pg+T6K5AE+Xqwpeqby6NOv+T82RN3XjgM/34KDUZwA1GbiWTrKKA/ZHAbOKDuC5z9CkvsDofHO0iz1z1Ys2biWslvgiEmhi4XDRtIDbaUd4Spx4tx475zIqbmExzcrxV21LbfJv8uAslEucge1LotCy246SmEjM09Mz9JuERexYKElcQpHBuFN2c8RFep95mhRdWjnjN3/+wajN2r+Ne/x758EitOSWhJ50TVxJYgucSWmpHhdHUcyG2ErYEtxN4XwH8PKSMDc4Dqo03f7+T9sJzrdBhHjVgn0u5rdAR8GWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5678.namprd11.prod.outlook.com (2603:10b6:a03:3b8::22)
 by DM4PR11MB7253.namprd11.prod.outlook.com (2603:10b6:8:10f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Sun, 5 Jan
 2025 22:34:51 +0000
Received: from SJ0PR11MB5678.namprd11.prod.outlook.com
 ([fe80::812:6f53:13d:609c]) by SJ0PR11MB5678.namprd11.prod.outlook.com
 ([fe80::812:6f53:13d:609c%6]) with mapi id 15.20.8314.015; Sun, 5 Jan 2025
 22:34:50 +0000
From: "Sridhar, Kanchana P" <kanchana.p.sridhar@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Herbert Xu
	<herbert@gondor.apana.org.au>, Linux Crypto List
	<linux-crypto@vger.kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>, "Sridhar, Kanchana P"
	<kanchana.p.sridhar@intel.com>
Subject: RE: linux-next: Fixes tag needs some work in the crypto tree
Thread-Topic: linux-next: Fixes tag needs some work in the crypto tree
Thread-Index: AQHbX6sqDZgCoaacd06DRl3GueMfWrMIw2/Q
Date: Sun, 5 Jan 2025 22:34:50 +0000
Message-ID: <SJ0PR11MB5678F4F5B2888E5F09C24245C9172@SJ0PR11MB5678.namprd11.prod.outlook.com>
References: <20250106065048.3ce6090d@canb.auug.org.au>
In-Reply-To: <20250106065048.3ce6090d@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5678:EE_|DM4PR11MB7253:EE_
x-ms-office365-filtering-correlation-id: 81bd2084-e50d-408b-9723-08dd2dd92b05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7055299003|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?MFdIN52M6i+FZpWwDBdjnIFmAzQ4nuYfHgElKvMiR1ppLJLQhy/cPlMRenw6?=
 =?us-ascii?Q?QrADTp64MHtfnAWJB/NdAWsy0PpjQos8hUVtB5tXp/96SY1bA40rAy2UwbDn?=
 =?us-ascii?Q?W6RqogJq1wbiN4PTGk8/vROJqUCizwKBcTe2MLFgxvDi7wBAQVHwPbwJkkpD?=
 =?us-ascii?Q?MKW9zwss24T2+JSYENIxoKgtcIA92MKEdP3i77Xo7rCJmLNH8BEU/sTCzlLy?=
 =?us-ascii?Q?wv2zfa+HuVYzUFfP8EJTI89VhVLJcsEcgSv0D5XGEc3T193XSErJtXDi/U8y?=
 =?us-ascii?Q?EUR72TB5/WW9bhTj+eT9QVanSjzwZMV2olssgcPPXh/KWMNpzRkoQplMpYQ6?=
 =?us-ascii?Q?UItzI4BaC8DPCTcu3gr+2nitkNr2AYJIrYQy7btcSeszPeYpKi2vp/nZxBZW?=
 =?us-ascii?Q?HkETzHbwAa+UqCVu97ehUdIn7iPBuZWk2xnsfcYjrI1SK2dwaSwjLyubPsAU?=
 =?us-ascii?Q?GSiDY9NTk8nsGi6Twr9y1ztjMVPw6vDqZBd/9V7RGelBZp5zXO0xM+6xg6Ie?=
 =?us-ascii?Q?eMUDKgD5KAOAw2M9jAbn9C2p7UiDJO4G9fjqSyPGQ34S6uI79ws8AXY3tH0d?=
 =?us-ascii?Q?Rk0JcL/lxirVxnauRrOt77f8fQMwjDq+NbkIA0dHDsY9QMucsp4hXqPw+AbT?=
 =?us-ascii?Q?V6zppaGr7rVjvF0sAuAolxiavp++D+SEd0X6hm74SSHICgbM6CoZEaJXM7P9?=
 =?us-ascii?Q?7VdTig1WJHybu9ws7wqEx64REXEIgkSt5hDTnnBDZsoJivemiXuMGS8J6iGj?=
 =?us-ascii?Q?aXrEDOfdiEAHHNc1oLp3ZorK0B+vTAuzyeO3U6P6236zMnouIIXixCWt1M3U?=
 =?us-ascii?Q?lBbupjc7o5VDAomRM8uWOh7ylKVdREPi/SuEAdOxRmR0oHJk1eZWh4mKB6ym?=
 =?us-ascii?Q?uiXMmNlkOGcely/F+Hbi8PocKdW2LGuSXydqw4zG/XgFWarIkvSm6XVK4anN?=
 =?us-ascii?Q?/TIXD6hUrXZsKz4PjGN2VaVL8KDWPs1CkAdLID5HqH+DDyl2/s4s8Q4dzRvg?=
 =?us-ascii?Q?BedyeXm7hJk8tOWq0TR8EtFdwo1aznbYpCASUpjsczxzkQ4reTEyKOrpZUoQ?=
 =?us-ascii?Q?BIC/9kKhCM7xtSsGqQT3aIbjF/rOoF/RL0aJZCRzIClsbib+/hx0WpL545aE?=
 =?us-ascii?Q?BYG1tnp1rK66GoYnqg1JxPOXodz8b+HcECQghsBDjooVQ5RrG1KS6vAe0bzm?=
 =?us-ascii?Q?C15D6LL+u36YTaN6tm0Q6qpF8gGBmS2+I2XGdGo+IVsyn2k3CKE8i1X0V+ns?=
 =?us-ascii?Q?o7jEFrOH+2458gS9FyqPaMdXwAKpaRC85pSIvCvPoIoRIZTcwuYw5igmvbry?=
 =?us-ascii?Q?uddtNQUzznuaCOeL7ZM29YcAkEBjf7ARTj4Tih1TDwK2g4Qi+sVVtztcvzpN?=
 =?us-ascii?Q?t/BO4fQ4TtsltHLp7dUKlXeyrto0gDpRsTXjNJcTN9EPekWQn6OCZEYj2R59?=
 =?us-ascii?Q?iTlUjtioIEoYCfLUODcFgLL0akZYeZepDONiWqkD/vEiXriNQfURKg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5678.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7055299003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c0Lwez8tzVhb/MXk9P2TWm4PMmD0TMxVX4X0J4a/52DBhQL/YDi9PF5BALU4?=
 =?us-ascii?Q?6A70tYEbJu5v+/u+Alxylz1qlpb6gfse+eUoNaCZCNvGjaTWvYXd6+wy8bS9?=
 =?us-ascii?Q?kdPz2cNNZ/QwM6eaY3mZWhEU6bbJTyOZIagb3TrFf1y0alHCULLJ8tsF6xXy?=
 =?us-ascii?Q?349XtrIoki2P3B9KCV0dtGYoBTC2Yu1l3ohfDGJmKHrgi4RBTrR3AmiyiqI/?=
 =?us-ascii?Q?apT6qRqgfOowGuTgaK/d7FFJ5wm/yGgdplpiBvgpLEIuZo9w/In41lz0iHTW?=
 =?us-ascii?Q?fP/JMaf/EMvc2W5ubJ26W/vLCgkTozShFTZF2bn78dKPcY67AhLrRzqwSEcg?=
 =?us-ascii?Q?C5kohW25VnnA/cAAAX/m8aUdt8KxbxyVKKWXM5MMyJOaYesqw4a1yks4QCZz?=
 =?us-ascii?Q?Oo3k6Cy/PUFshXrW17Ms0w7SniSBel5wpdgj9JdqJkvutlfa0CcgFkABEJMq?=
 =?us-ascii?Q?/L0xjO8OfvgdNymiSo72t5NiNMNFYq6CbCexnr0ezSWZHXi+o3C7TGhneSOd?=
 =?us-ascii?Q?/heyIgf1X2w7AwLWnAngBgBwHiUpvbqNNOmu37dwCekVV06/BKhPUDHkA8x7?=
 =?us-ascii?Q?DXI1vP6L22dJDLBkp85vi1LcG8WreIQY9ANz0BZKexh2YArO4do+HOFz5VJS?=
 =?us-ascii?Q?YirYNypJhs7CNaHJmeHiDd+ZiaGZFb/HnanjvYBV4BAqVaM2+x8xDMdE9DJU?=
 =?us-ascii?Q?HqfUee//50PdMQsCQCn/Z0Nmk6MfuIhcltUM36ODPeJZPKjO1hWHtteyHg7j?=
 =?us-ascii?Q?Tug7DZLpEI0mi3ljBSIDPSx6pp4EpvA3He/Gxr6XOk/WU1vdRNLsX0FaCa4P?=
 =?us-ascii?Q?KHRpMXEQyjMuCwfrBSRLjz/hNc4CH2fdvA+ukOCBYUqAdhOAyV9GI0ZhP/T/?=
 =?us-ascii?Q?G+y1mghrC2s26kdKj48JgsS/K47fGIimWb++hfGxPNhlWQuPCnATJGCOIW9F?=
 =?us-ascii?Q?7p2FqkfZLPnB8jjy4DJwcOhZMw7lpk6x6P2LrOv6J9q52b0pd+PcqTHZjmxE?=
 =?us-ascii?Q?SWR5+tjVEyGlyuYU17Hgr+thcqzqYeocH3h226x++zCKq8gAHbCTJCnAisyn?=
 =?us-ascii?Q?SwCGdi7X1S/pKU+PpAoxykyAU5FZCIoUwWd71gFnueerPLy7+7/XyXgjpSVm?=
 =?us-ascii?Q?PBsR91xWnrmc2pb5NAoR1JFN7oFhs3EF5t6MKzmpVsNUl3b0bDoe4Fctzpca?=
 =?us-ascii?Q?MnfwXd57oSeXZYjtRb+28qNp82cv94PbbmFmJ74yLSQLwCq8uIsbr2aO3OS8?=
 =?us-ascii?Q?wfw2QMAd+mjIS34/Id0xBaEc8jEKnFrPwx2NuRHjE61kMMAzQar9X2Cc4iIy?=
 =?us-ascii?Q?RRP7wfRyXhyd70DqZ1xOrFecVahf2Z+viFKKwV1TAEcVcEfCRNF46bhGsFOB?=
 =?us-ascii?Q?K/HbKTT8vnaWipNU2sTir5K3Sla2m0QIaLHZae0E02p+81ajZQ70FKIOAARo?=
 =?us-ascii?Q?DvHXsw7fFshvT9HNEZX+HKubw1pwCgVr7uksSOMU2xOyBzD3sEyqP0QyeWlU?=
 =?us-ascii?Q?VrpHLJka4imEn1MoRCGFprG+ias7p/BvA7LOntDipnw31m2T05QEFYpQdHvY?=
 =?us-ascii?Q?B8bHRQENHGUAf4VoKYtVi/SVX3x9RaQUjNRwdJmGCiBQltaNaIbDMDTGP8gX?=
 =?us-ascii?Q?Bw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5678.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bd2084-e50d-408b-9723-08dd2dd92b05
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2025 22:34:50.9012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j7tf8v8JGjwn8HiYCIodQcm2lAbcFJvNqYaSHxX0n5mas3aL0VkQJyOczqR9rThzoMCVOn1nwGvjM4uaEtKqff+gPyzdistczqpu+M11p9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7253
X-OriginatorOrg: intel.com

Hi Stephen, Herbert,

My apologies. The Fixes tag for commit 4ebd9a5ca478 with the correct 12-dig=
it SHA1 is:

Fixes: 09646c98d0bf ("crypto: iaa - Add irq support for the crypto async in=
terface")

Please let me know if I should re-submit the patch.

Once again, I am really sorry for the inconvenience.

Thanks,
Kanchana

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Sunday, January 5, 2025 11:51 AM
> To: Herbert Xu <herbert@gondor.apana.org.au>; Linux Crypto List <linux-
> crypto@vger.kernel.org>
> Cc: Sridhar, Kanchana P <kanchana.p.sridhar@intel.com>; Linux Kernel
> Mailing List <linux-kernel@vger.kernel.org>; Linux Next Mailing List <lin=
ux-
> next@vger.kernel.org>
> Subject: linux-next: Fixes tag needs some work in the crypto tree
>=20
> Hi all,
>=20
> In commit
>=20
>   4ebd9a5ca478 ("crypto: iaa - Fix IAA disabling that occurs when sync_mo=
de
> is set to 'async'")
>=20
> Fixes tag
>=20
>   Fixes: 09646c98d ("crypto: iaa - Add irq support for the crypto async
> interface")
>=20
> has these problem(s):
>=20
>   - SHA1 should be at least 12 digits long
>     This can be fixed for the future by setting core.abbrev to 12 (or
>     more) or (for git v2.11 or later) just making sure it is not set
>     (or set to "auto").
>=20
> --
> Cheers,
> Stephen Rothwell

