Return-Path: <linux-next+bounces-6255-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AD9A89F2A
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 15:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21FA4190289B
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 13:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E80288CBE;
	Tue, 15 Apr 2025 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPqlYbmS"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225BA5336D
	for <linux-next@vger.kernel.org>; Tue, 15 Apr 2025 13:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722947; cv=fail; b=dIj4WhSzXBh1GG1RtzhiAB4PQQ44iiZJLZFIM1D/p2suxu5R/vfHKxw7luZV5HFxEjlG0HD6XPJkQEWOmxl47RXXHVO114bfcR+scdbxCSFDbvnXpKN/h5I91lDI4oUW1eq8UyXCvrevtlma6UNvyfWV1dTD+FwmV+SwuhE0VNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722947; c=relaxed/simple;
	bh=pk5Dc0HrpqMiLB5oY3Gv0SdGkGPsOxbif3vrYLfXKHY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RbQZMgfK6Rt/1iSQs148D3H6TO9a7tbSy5GTW3LNVGWeIzdtTiMpgDhskc3vgJPy/xIbAc/2mjQMdAvuKkXqEJVtHCpcHTBwkk1ekdd+YzYo24qN3tMv+bSzsSglwH81axK7AllxRKUViIPiV8rSInsxAzqNV5pjbVd2adswBUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPqlYbmS; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744722945; x=1776258945;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pk5Dc0HrpqMiLB5oY3Gv0SdGkGPsOxbif3vrYLfXKHY=;
  b=kPqlYbmSVsJ6PWXFMPp4hv5yxC7qVHzsd4CYb/mPYwZTlu/KYIP0PGbZ
   nLya9lG+FLrJi5Gu7kAQWFMKHcmQVmF494NLXK17iPtVL5CI82CROL9Uj
   XgNx0UrGdnLuzT4SpJT578J3nE7DwnbDMfnmAnCt0YL5l2d8aNEkNFuUX
   PyFF4Ablq0bGnOOPkfpnpXJ0VKMsLXqjEHCA3Y5j3LrRD6+ndfzzdnoNl
   E1DLf2ky4AtZ/byfoRrNB2m1n6wA8aiibQPH06e0sMRwL062gg/vkLgaA
   qfRROqTfX3AVyF5kN3JeGbe0XJrXraaO4IgybYQKpd/kjLNp8AgtJ3aOJ
   w==;
X-CSE-ConnectionGUID: 1W+ivXWlREW7f2XSAzfrWg==
X-CSE-MsgGUID: Bo0U8kghS5CE1t3dM2ecGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46147758"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46147758"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 06:15:45 -0700
X-CSE-ConnectionGUID: 2ku9cG3jQYOR/Fj2Tn/Log==
X-CSE-MsgGUID: 6rhjDVEPS0S5cdyZdWB/3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130651834"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 06:15:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 06:15:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 06:15:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 06:15:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWUv5rASswQfl/B9UieZJItHrYGpG6d4JavY1sbIPMktHASiEc4QyJmg55NCOcsIiKVhQEScy/C6m+50Yvga8jog2OewsacML1DDtZOnchq8ardIwdM0NxjiHB43TQHXXll92EhVWC64zxeDPJs1Nso7YnaqVUUlnvIa7lZg3TxmFCemc4mANI9C83vDDT9Y/pgViK2kOzbb9iWZcfAoEHp5ETP2e0ErrkAD8TAur0a9EpMmSABZAjgsKHYmEWOo1FLIXZpzFawqUDg8XYmiV0q0uXJAck+O10m9HMfqn8TjaXtVgIGQYBfaEGJ1G5/tPgwcc0XR++3XG5OW+/HxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znoYH7L9rYyODqK0RVeWfe6IJ8vxoyXb0cXPxv33sPs=;
 b=E1vaebHX2CaPk+tamSPigYuGTojmydYLwc9CiUmqyuCbs51NUbwsQ2L4DLXh6J2WnFP7r3GYjsJyRgq+J74bZapoIWET6ECs9/Ho+HhqGTEYjPltRYMGRbPDWkQgdLx7Fqe77ki3GMk2pKa+2cRgPQF0rtFweJdo3QgUe9U/HD8qWw7D2GQsrWTpXtFpXp9I8a1ujVs9h5Qs1CLUljXyboibbN+nByV3cYpb2C5BzQXZp7Qu3S2v8R2PRqnaHQwXD9oHLc0pktjaEu94r2Bd8BnG13Km8X1VQx5hyZwaMCACwvo3M/Y9mo8pk3jtXrkf+dFyXgYtt7qUs3SzqE57Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5680.namprd11.prod.outlook.com (2603:10b6:a03:305::9)
 by DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 13:15:41 +0000
Received: from SJ0PR11MB5680.namprd11.prod.outlook.com
 ([fe80::7c8f:9ea5:5982:1a5b]) by SJ0PR11MB5680.namprd11.prod.outlook.com
 ([fe80::7c8f:9ea5:5982:1a5b%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 13:15:41 +0000
From: "Li, Philip" <philip.li@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "sfr@canb.auug.org.au"
	<sfr@canb.auug.org.au>, lkp <lkp@intel.com>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: RE: The driver-core.git tree has moved.
Thread-Topic: The driver-core.git tree has moved.
Thread-Index: AQHbrf4OBMQpqZQMwUeWbL6bgznjR7OktHVA
Date: Tue, 15 Apr 2025 13:15:41 +0000
Message-ID: <SJ0PR11MB568008B6732C110FF372E645E0B22@SJ0PR11MB5680.namprd11.prod.outlook.com>
References: <2025041512-darling-erupt-4545@gregkh>
In-Reply-To: <2025041512-darling-erupt-4545@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5680:EE_|DS7PR11MB6197:EE_
x-ms-office365-filtering-correlation-id: e412d099-2099-45a7-15ac-08dd7c1f9f62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?KWyqAnZYCahHD6sL47/yoCcH2Q1tYELBTq/9F0yXiml1fPQPs6m7o+urQN0+?=
 =?us-ascii?Q?MfIREYoy2GZ0IaeuoLujWZze/j9fJ7CjoScmMzoD1eYlKcNNSow8f42GVhVY?=
 =?us-ascii?Q?xDPmqUhwUIORIvbqRhR1c9JQUK/rahM1SY275Kin4DQPscyeyzTvjU2x0e1q?=
 =?us-ascii?Q?vm8BXd1z7sj+yAqXtjzpF0Oj5gjRslIcpVpQbynQLTST9SkaBaVCtXvye4QB?=
 =?us-ascii?Q?vkivP8cCJOH3JAEr3Fs+7W1CgEUrq3fuVTN3fwwVto9jsDr7FkeLJnu+Xs46?=
 =?us-ascii?Q?0qft6PGSbHC5snF+Qm7CV16/P7NqHxmoJeepX1yG7B8VwuhxcnP6iVLs/9Zs?=
 =?us-ascii?Q?+SmPHahw+AjwY0TWRQYE5LrydXrUcMDG5GA1sikZAOxsasb1H1YhGVDjhO0d?=
 =?us-ascii?Q?roJJ4q5SKS39vJmU56g9hgX3P3RLmZKFNnizv9xJ3CWVuQbcYjOptex4VxnH?=
 =?us-ascii?Q?AkfO671jNhC/aJJvyyvecy1KyXQuD8elJge8t73g4yYIV8vK5gbhsUeFVQ7O?=
 =?us-ascii?Q?MMJGrC5VuPv6DCvrKjOuJgTYyNbfNVLdIlqKrofa1dmgApdZpYwN9MM6FTQt?=
 =?us-ascii?Q?WM9S+wrogw5lchtrjZaiswnHFJI88vStRv/i5Fzd88eWYgvN94FWv4kohB2i?=
 =?us-ascii?Q?TsBVS5VfKXRSXRWmUlwC6dJg8aOBIQodSuREQoHW2rQWKlyeiWh0ZWWDf2P6?=
 =?us-ascii?Q?hu4kEF7hxRAv9OEaR+TZgK2fEAD2p/SkNyafbdTMeuTxYSXbCGOP6Dzuus5W?=
 =?us-ascii?Q?hyUPUB1eDJoIQYGAWw0cRCCKth5FXmex9C/ZwLLNbG7PiN7EE1i10E01I6tQ?=
 =?us-ascii?Q?zFpSXuetxYpUfE44gFcCQLMlBOsDek2pQu5mpZDt/jy6AEIrXOr2qE3svtYm?=
 =?us-ascii?Q?F66487rDrwSoiUAab6e/qmU76p1VnBqJEq/PMn/RNCqK3ZKXEtYMyAc7/9x0?=
 =?us-ascii?Q?JdIDIXtdvp2W+V5GAzVZWTUNzw1pjHvyfajVD+NCZZYBIuHEiV6I9t+8rLDd?=
 =?us-ascii?Q?hR4N/aY4W0bcOLHh15c8imCP6i7ZZw9+brwgAwEZ2lb5W//3++l1BauJjV1C?=
 =?us-ascii?Q?GYUsmipfedOqD+Ltz2R5YgNKavT5sFZghWCAcJBCsPrx3G6I/UJoT8YlSSLG?=
 =?us-ascii?Q?mnAXa9UogX8AXuXud/Td+VK64I0rhQYuwHG1oH5JNvRM/jmo0mkNC6xRiGXc?=
 =?us-ascii?Q?GR9m3NA+gMCAXyzIdIlLFGbXT68P7u1hW+3e4xiOxOS6BnHlQrGMkjqjyx/q?=
 =?us-ascii?Q?jj4aHqFacyZlyBdqh3W03cqHUHbfwNKju8gPeCZGfV79k/Qp2q0lHp9gRsMQ?=
 =?us-ascii?Q?i/R36GDMJIUSl7ih2Lvr0geLglfq4Mew5+zYWpPUJUcNwep6HvnFF7NpAS+7?=
 =?us-ascii?Q?ia1YoaWurPc9CYvhk64Gorhn8/aA7oCDrjyc84rrALZWMkeAMZPFBP8E/zHK?=
 =?us-ascii?Q?8092PakT3NgJbsSRFateHeFW8bA0We+CdGWqYqUxpAaG+aJ4pjTO9Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5680.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cFr0VRdBtVuir1/La1vHxH8+LqAQzSMTq4IlsnIuaq/aFnR7KKtN/Ltx5QI+?=
 =?us-ascii?Q?rHInBbIJ5LqRhJ1mCRwBhzDewLyKgDBZUwGejTscLvzgsr4qKTdk/ulZrrsT?=
 =?us-ascii?Q?RE1RlMtWYiCe9tHYaT8+nI4h4ekB+sICHRbQDx/92oj/Us8M5lxyuRW4txcE?=
 =?us-ascii?Q?SJsJiZ9hzUioQ9ltp/V5xLHmPeBG0+jSQO0OqJNfgf2Qi8/KNH1+YXFIf7b9?=
 =?us-ascii?Q?JJCCNZaua33Yi+quRigrskG52MGv88c1GY+NIOo4bQsCGOWQ0NnvUq+95nuW?=
 =?us-ascii?Q?p9Roy5R2rk6tQjjTyYS7KNDfgtATIS7o1wrP1PO3delB5oIDwILu3R3tfZVM?=
 =?us-ascii?Q?vvBCUtbsfkSV1Se1B7i4HxzJx6NkFSExgxzyy7p1OzJSk6DoQu78ND+maYID?=
 =?us-ascii?Q?joW/b4R/CQ+QscEizYkTfTICzvFuzWG5r/B7xm7SRGDXcWploIR1ZUNu83m/?=
 =?us-ascii?Q?iI43lUChb1DcwRIn5VwOomGXOeW1FaInC71Nqp3TfMi566mRUhhEfA8nIcTc?=
 =?us-ascii?Q?bDFOEVndQVM3r9WVnVd+l/+8s35PxPU+bvD/KEQsoLRxcG9yYHBiipys9vag?=
 =?us-ascii?Q?7yD/zMsSzvXWz7c6PzDMs0wh3g4hUKIahkRyPeG4qKoxc6wITBnitY/SfTow?=
 =?us-ascii?Q?74/ZTzqzyr+f4Ft5go4JOcO9sB5xjCmb8JjCaObxXHXpnEAuBwYgIbqDfIRo?=
 =?us-ascii?Q?+kcGPljiAyvWRnvMbG0ClnOpEl2C2hnbIBcxCUfcqpJuUpes7n+ChERib0zN?=
 =?us-ascii?Q?G8C3TO40PCWvyaPIkz7W22JPz0sjOn3UKuQC+269YhOTCubfO/IQwS9lawQl?=
 =?us-ascii?Q?tiudKVPufjTIpyLEq0l/yn3bqIyzEqRbDycm3F27cDyOEZbHOXj2xLz6zk+B?=
 =?us-ascii?Q?N3WHqkDgDoojRN7rqs771wk0kfWSsuCOBFwdC03YRiqU0ga9Qc06UVL8Z8XF?=
 =?us-ascii?Q?Nf4vhym3z359i+dEoSMoG5JIyiU0F2fURtbebRoWxSFfb5vpcwspBsglF57/?=
 =?us-ascii?Q?ry9O4ktLCqTXM3b4lD4DBYRk/poeZoMywCx9EY3OarLRj9iRArrRZ6wCVZvh?=
 =?us-ascii?Q?nI0Alh66y8L9hVm3EJ6AvDTdD/gjmv0vbeTjPxuAxId9e0nAy91AXp3wL5Xc?=
 =?us-ascii?Q?BiNMYiQVWOtSYiXKevT6XH3oPmmbEEHLDFmP7ghvcaHbIjAR2S3HTl7Xo9D/?=
 =?us-ascii?Q?wlaZOSfOgvXp1PWcLVKCnWUNRlHnvSwHdvPel6WtnRqC6yKqW5Zq4ev+c+C4?=
 =?us-ascii?Q?67IVjUBo7fxVGIZmGeZXQj+FmR+PO6ZCkCth4GHcze1a1nuIuAOMXif5atSp?=
 =?us-ascii?Q?MxuRJfKr5zb4rBX90oDbH3jXCEWLKYReagODpQqJY0mul+BtTHS2WGjF04JK?=
 =?us-ascii?Q?L3xehVBZKSHM+sKYJhyOhw2Kag4hjK33yKjq2TEQRrn+4JlNrE1sqHYCx80t?=
 =?us-ascii?Q?d6a1nTkq6DWf+QMEswlwBXBZj5JM7IYwihnVqDbKOP/GrDjahf6ZgHnDKg1D?=
 =?us-ascii?Q?efmQkjaMpJsgTD7yA5VMQTEdypI3IMNR6qbwyKxBfJRArulJBUTIX+OwZbqM?=
 =?us-ascii?Q?acG1rSzudbVT9l+jhxtq+UqT6y+bRvrQ+ftjrGlY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5680.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e412d099-2099-45a7-15ac-08dd7c1f9f62
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 13:15:41.3319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uij1lUf1isSnOEyv3PUYyx/5G6OfqqwrTlLcMG+DixT6HsQXbcLgY5GjM9kFs6zWQV6PPY5PEbd29Z5FtAt4Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6197
X-OriginatorOrg: intel.com

> Subject: The driver-core.git tree has moved.
>=20
> The driver-core.git tree has moved from:
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
> to
> 	git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.gi=
t
>=20
> So can you adjust this in the linux-next and 0-day bot scripts so that
> you can pull in the updated stuff?

This is done for the 0-day side, thanks

>=20
> thanks,
>=20
> greg k-h


