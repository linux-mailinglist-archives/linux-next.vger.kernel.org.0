Return-Path: <linux-next+bounces-9631-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6D4D16F37
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 08:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49C06300F9D5
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 07:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A582C30FF21;
	Tue, 13 Jan 2026 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMb7n/Yr"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFE224290D;
	Tue, 13 Jan 2026 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768288205; cv=fail; b=Qsd/m5HgFJrJ4dJBLe2qL2ox8ioC1fViovRIVnWP1B11TIVl0JnfHYtZKyoiA/LkqMzhOQuBfGoYiyiA5kMygK1FGzZ+qr6VvG/BXuzRe18/quhSE0sNw4qOkh1fotSprwgsmdjMdzAElduN09B+iNe/nMerAPd/FxDU6HAYc4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768288205; c=relaxed/simple;
	bh=RGRHx0+B2Tv6TA/uTLG6WhiHeN1vQ+lVfSSgc/W60No=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J+PKucgTBG8KaRVk1EwSAarlZPhCYadkyPxO8A+CMp+LdZE34t2T5+bT8dFpmF+mFV961G0XEDgC8gTfdH0/wSG+oCfOCejI7NlUokZW8SVio/7MM5fVN0qxoQTlK1BoAHz41EmFPywZAJbFMZA6Kxd2cNWMuJ3sbxU1xXIDN2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMb7n/Yr; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768288204; x=1799824204;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RGRHx0+B2Tv6TA/uTLG6WhiHeN1vQ+lVfSSgc/W60No=;
  b=fMb7n/YrwUAStRdT4X/w+3kQOxO+WdNVjgY3iffX2iSp8B4WsjJRK11k
   vFk5EwtDzaFe7KubojeztqUD4XLeY8VWKHFOmizPLd/AY8iwXkNiRR26w
   baDj0RImxCL99b/dxwIuqG4n2FYADguoA6DoPLXfWfJL04RL+uxtcu6p2
   VFXWgckP+yuuwG8N+u+7+2y5A8AZT6Wt/8z9pcCRj0iR2T1oJx4G6D9Rl
   eBng5Mmr5dxcRzhfRkk/CTuinLxKkTeIVlzP1rTr7mAYIBLZHHX9R6Tus
   loD2TuBv/ATTfXy5WAI0hGaE1FosiuFfz9rKB4+S9Cjj5wKdP2pgoFAHN
   w==;
X-CSE-ConnectionGUID: Tba59BSFTDqd2auL/KRqDg==
X-CSE-MsgGUID: HffwcoQMTq2++cFa6pP/BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69624019"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69624019"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:10:03 -0800
X-CSE-ConnectionGUID: k3T5cGUkS1KPkrfZAGc2jg==
X-CSE-MsgGUID: XBR7+68QQyej42dD60g4Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235016783"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:10:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 23:10:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 23:10:02 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 23:10:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBUhlSuSG/opoc5BSoUyYpohcMZ00gXZIYLFHfKvwcF+z92A5/VsX0IB+/BdyY5FYF4wJCuzyEu2YPocO5CIrEd2+AZ8nDUB23wqm01CvsD9AofS7yATGcOnjYHVr41BnLPrgQ1S+S8gI9ZePqaKWBb8hNwafj+PBvTvHBy2TRtool4iug2h62BK8U8HtaFAMvKsv+Lg6BKdtddIFCYriYE5KiHNA30CWR/uJvw8HHlHxYGyog72TGYGbh54bEhJw7oKW3/E/X45CONnfgTle36sDJs0YCtRlssiKSvKinqkwJDxcirJJJV/IJFyq1C88aOqJK1PaO9M/QF1Q/OqbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGRHx0+B2Tv6TA/uTLG6WhiHeN1vQ+lVfSSgc/W60No=;
 b=IJG76gj8x4ewJpvIbACpdYp14tr1G/kj1Xz2RPARXk11GxpZXVNK+pX8CCvV3kNfpnQ7cVKYUfG2po5mEisdxSm2qpahiO99irx4aeVx7Hhh0zd56uiKy2EZKag8fYsxvUGWTquF+2+hV+K8HeueKExdjqTtYEKNbepyOUlbt6xaJ9M092b6mxziofP0VLG0gv88F8zyl7xZ9qPbNkWEsNQyuOt01MErGVsRU9mT0mF2tOAuZLbEzAz9YzKl75DcvMSZr/UT6/Xs9J1Vgf9J1EyrfZZFv8yV0AHnoGyEByjFkPQtyewRZ/fL7udYkaWmP/Z+RUnY6FqSwXUoAdqrUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by IA0PR11MB7749.namprd11.prod.outlook.com (2603:10b6:208:442::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 07:09:55 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 07:09:55 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org"
	<linux-next@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 0/4] Intel MEI Kconfig cleanups
Thread-Topic: [PATCH v2 0/4] Intel MEI Kconfig cleanups
Thread-Index: AQHcgAMwMFdU64uQmUyGMJ8v9qW7VbVPsQLQ
Date: Tue, 13 Jan 2026 07:09:55 +0000
Message-ID: <CY5PR11MB636699EC18DA7E1EC00EB284ED8EA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20260107174646.GA1230850@psionic12.psi5.com>
 <20260107182615.488194-1-Simon.Richter@hogyros.de>
In-Reply-To: <20260107182615.488194-1-Simon.Richter@hogyros.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|IA0PR11MB7749:EE_
x-ms-office365-filtering-correlation-id: b7c00228-fa87-43b9-a6c8-08de5272c16e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?T1BVbzBaZTNnWXJwbWx2bzR3Z1pCMXNUajF5VE1CWnZLSGJ6Y0d4dmxZWkRX?=
 =?utf-8?B?Tmh4WktCWG1WVFZPUXg1WEVhVllWUGRzUVIzSndYQlVFNGkyay9OdnlhR2Jq?=
 =?utf-8?B?SlZSeC9CbXRVNHRvOGE1Nkw2SkQxUW4wdDRZZG44N3k3ZnlnTG52SS85TGpB?=
 =?utf-8?B?T2dhdzRmQ0JaK0g0dXpKaW9WUmF5WGF0Qks2b2ZQbVEwYmg3Sis1RVdYMDRt?=
 =?utf-8?B?TDI4Mysxck5CUzkxVmI5UU5vVndjWWJJS0pKdG10UHZWTFk5WlJPQW55WGRn?=
 =?utf-8?B?K1FVNkYrZC9GRDJycGJRVXN0bGJCL0U3S0tUZ0lmZnlUWmF5OGZHbC9aVkZP?=
 =?utf-8?B?NytvTVdDejVGYWRxMVNRbG1QQUpTMEVzRnFxQjVKMklpd3dxYVlqcmJxZ21j?=
 =?utf-8?B?eFdOV1pFUllVenRRMGtabXN4ODBZUWxYSmFSTEtsbEdxejUvRUE5TW9DQzVM?=
 =?utf-8?B?bzVtOUx5RlB2OFhjclhTREF4UDBpUExhVnRiTkJBbGVxUFAvNjBxYTNUZDR4?=
 =?utf-8?B?Vnd5bWd3NkE2aFVscjl3WUxMditNdzMxaGxPR3MreXQ3ODd5Z2xyL0VmZDNM?=
 =?utf-8?B?VG1KNGFpUWkrSnBSRnhiOXhON1NxOVUvL0NGMGloZDJBWmthOU0rem5IU0Mw?=
 =?utf-8?B?THBGeTh0NXhQSEo2VTh2WXVlVFU3QVppa290S3NseEVnZS9YSnZXVWlGODU1?=
 =?utf-8?B?elFvNDJ2VzdyVk5ZdWlCUjBhSnAxNGpHZzVLL2JUY0VSSEt5TEpEbnowRXJq?=
 =?utf-8?B?MGxJdmRBZktFdW81OEFDUGVhRVVlWGJSRmtUZmhCMEJ1NFpwRUZ2QjdCdk5p?=
 =?utf-8?B?Q0RGdEt5Z0JPTHNHTzJrMkJtaUx0T0xHVEV6RHYrTXl1djRJTXpKR0ZlUmc2?=
 =?utf-8?B?cGlVTUV4cGRsZUx2Z0t2cmx0UUFEdWo0LzdtZWRobENxMlViSkozdjhOU1hs?=
 =?utf-8?B?cmtLckhzSEtsclB0T0N3dTlUamY3OUVMTGdrd1BXc1BBK0RGWVluSmEvV3g2?=
 =?utf-8?B?UGhpQ1RGejNoQUEvODYzMTZ2R3dka2tqM3FrWm10dHJicEFoTzIrcUZ5UzNr?=
 =?utf-8?B?bnkvN0EvQ3NrcmhTL0lxR2lOYjAyWUQ0Nnd2MUZiOEdjbVduNlJvYVFvWm01?=
 =?utf-8?B?SFBwQSs0T2YySndnamozeUhzVjU5aVJMeGJKUXZiR05KM1UwcWdnc2g3RTZX?=
 =?utf-8?B?ZU1IdW50bHA4N1NVUk1TRnA4ZzIxZnpNWldpOTIvRGFHYzN6RjRnMS9kREtW?=
 =?utf-8?B?RFgyRVpmdmF6SitWMVFUakw0OUFpMmNDZUUzM0QxWk9EekRtUGJSU01aQTli?=
 =?utf-8?B?ektOQjhzUFdhd1dHNlF1clEvQUR0N3lERXdLd1cwVUxyQlN4K0NGMUZlRnEv?=
 =?utf-8?B?UVFwMkRtWG50bEJvQmJHOXBSRy9tYmRjQTdaR1VHc0RPTTU2VlRpNkora1ZP?=
 =?utf-8?B?YzZkVkN6dmhhNUlDMFgwdk10aU8zS3RRVTcxVk02UG80aitYcHVwL1pHSXhB?=
 =?utf-8?B?VWlpblVnZk14UzExOFVlQ0t3TUhnMHZlQUtrbnF3enBmVXFUSlBRRWtVVWpP?=
 =?utf-8?B?WWFERXhsYS96a0ZXSTlOZC9oclViZkR0Yk5LaFRodmZBQVNTRmY3dkNHaWxU?=
 =?utf-8?B?c1Ivc0NLcW5QaWYweVAvcUdKYkg4ejViOVRvaGlTQmV6SjhFM3hQUkM2S2pY?=
 =?utf-8?B?M1U3cmM4elBWakFjMjJjdW9IOWlHM1RFbStldk03c2VVWWRsa2RVOHRnUnRy?=
 =?utf-8?B?c3ZodWRoMlBpeUtZeGhsSG9nczVtZFIxczNubUx1bXBWLzd6TXBPTHpyVVJz?=
 =?utf-8?B?V0UwbS9ETy9BUzJUUFZtZlFLTzJydEZhb2hlcWJILzczWnJZVEJraFlzeWdn?=
 =?utf-8?B?Z3EvUGFIV2NSUnZJaWtWTUEzVitZN3BWZlRQOHp2alkzSnBkVnBTUXNpb0tt?=
 =?utf-8?B?YnhxbHYrTm9PaUFKMnNnSDI5a2JZdUlQL25PZVBubUFPRjF1b0FoNzQvZWxB?=
 =?utf-8?Q?+qDI+Gn/6hOk0trAXO7LG2GO0bfTpo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEMzbUo3SVAxYlpyWlRVYWdrNDZRVG5MTm1OK0g2c0ZJbkNYd2hFRWxHVGV5?=
 =?utf-8?B?VCtqamVGYlpQdVVndmwwTWpTdzRwUVNvUm1scGN5VGRPejNUZUlVU29MVENX?=
 =?utf-8?B?eXR4cVJVU0NsenpaSlhRN21FVTlsSWVRbnczRGNrNXVIcE5QUm9Ob2tZaWhE?=
 =?utf-8?B?NytETzJ1bTlRWHNobVJrU3BKQ3VEN2NNWTA4K0xzSm1OZHhUMHhaN1dtdjJ5?=
 =?utf-8?B?emhBUVZyNGtzUjVRRVZmRHJLUlJEd2p6R3ZyWXRnY1pnUW5aQXU3N3VjLzlj?=
 =?utf-8?B?RjZvTGdkUUtyeVhUTDBPeWJiU3FEOUFIZkpaVmRLaTFhUWc0U1VXb2k4WnA2?=
 =?utf-8?B?VmNtNkQ2bUs0Z1NlcmxYNm5KWFl5RjdOVFlBWVhiRVhvdUFvYnU0Y1greTNx?=
 =?utf-8?B?VGQwUlFJUTVFR0o0cjZnbmQyOFppNzBreVhEZmVQNnNOQXdVc2NPc3gxd05D?=
 =?utf-8?B?U0RzUTg3cVdpR0VTc2ljaDFHLzM0bndVbnliYllTZER4YVNvV1RXSU8zbzVI?=
 =?utf-8?B?OWx3dWpNNU9ESDVlUnV3Nm43VUZOQklVU1JMdENaVjJPQmpBU0FSWGh2Rkpp?=
 =?utf-8?B?ZWlZb29rREt1WEk2aTByWW5TaURyS05VRUl6U1kwamxoODdVaHBzZVgrbS83?=
 =?utf-8?B?UDBTWlh0MVBjb2JBeW8xS2t2MWYxS0NZQ1ZGY29adXpIc1hXbU1mcTgvNTdS?=
 =?utf-8?B?cm0zUkFaOTl6YUQrYWNxNGFHVHBIV2dwU0Z2OS9GT01Gdk1xT25Id252TEht?=
 =?utf-8?B?VmxrMGljaGN4OENoUHBKaUxtQm42MXNWcUcrOVppRDE3RHQ4M3paeXYrMDlG?=
 =?utf-8?B?bE1iUDJ4cW85NjYzYkh4TUxOOTJxQThKcGRJSER6OGY2M2xENmx4WjFYbFZw?=
 =?utf-8?B?aEc5R3RxcW11RTEzNWNpdlc0RlpGWHhmTUZDNVVGM0hWdEdGRmlsNjI3SzR5?=
 =?utf-8?B?cGhxaVVvVEIzWG1pNURKZGgxOEF0bEVYeDVta3d3blVsMjlWNHdObG9xQnhM?=
 =?utf-8?B?N1h2dGdiYzFYazhzSUp0RGhlWVpJUTRzZ1NPcnFYMEVwcWRXRzRsb1l0WmVs?=
 =?utf-8?B?c1dvVXZSZW5xMFl6b1hxbW4wa2Y3OWpod0oweGZ5Slh3ZHFYMUg4eW1rMGJK?=
 =?utf-8?B?b3VDT1dYcHVHbHRrbjVhTzNKM290VE9ZcSt3bFpsK2FYVWZ6T3RiMWVaK1pP?=
 =?utf-8?B?c2tFWlFSNzFuWWh2eDRrMGRYVkxUMU1HRk50cmREdGhxdlVjVFlJT2tHdVE3?=
 =?utf-8?B?YjdUbjJEdXl6Nzc5ZjZsWXdkT29jNHNseVpwcG9XTXpCOEhXZmFuRHFyVUp6?=
 =?utf-8?B?anNiUUw0OFpxOUxGT0U5a1pONTFqVFJTK1ZJQ3oxd2NIR0h3cGlhSVJWS0hz?=
 =?utf-8?B?cWpWTFdVK29pSVpBQXIyQUxCamJMTElnWEVBejRxcXhXeFlGclc1d2xGNTBx?=
 =?utf-8?B?b2h2MFBkVlJoT3pVWWxvZ3QrTVBpYmNGcWh4L1BrR1dPR0hGNWlPcU53WWEz?=
 =?utf-8?B?MzdaNUN2dFNGOEhvY2lISzN1Z1VKTzUrY3RrTjFGUW9QdnRQRVIzQXdtT0py?=
 =?utf-8?B?WEVYeGJuSVFLSjNWMzV3VVA5RUx2ZHRmZm5MRERBN01qRU5aK2Z3YW04VVFT?=
 =?utf-8?B?VUZOMUtwRVJmcTI4cGJ3VEVsbXBuR1VYckFXcDZpbWt2MHh2NkJkM0NSKzY1?=
 =?utf-8?B?cnljWnVlcEhMcHlsb256WERMNWQ2MWpnN0htbTNpMEdyNm0vQjVDK0RwZE9R?=
 =?utf-8?B?bW5BQUJDc0RwV0VXOEk1UzFtaEhmdnZuQnZUVERZbWdla0N0YWRVdUxpTTZE?=
 =?utf-8?B?allMditIWG5XelNxT0J1Q1JGNjJYSnN4RXEzV2lXbi9GbVMrRGRpYlBLK1Bh?=
 =?utf-8?B?SzQ3Nm9HOVROY0thV1BDMncwL0RQNm81RkZnbEJJWTllZ0xHZUx2OXVqWU5U?=
 =?utf-8?B?TWhtQkRJV3h6TEd3Z1lMVC9KaURiY3lyMzFiQ1FvdEd5Z09SbTNlVmZuT2Vt?=
 =?utf-8?B?dmo1UFVJRUlRRHBuc0pzQmY3NzN1MThEOWN5dVFMalo2a2hkRFZMbHNmTi9m?=
 =?utf-8?B?V2NxRUh3Y2xkMy96azgxakxNVzJqYTM2anA0MzFWNXBUY3U1K25vQ3hvcExo?=
 =?utf-8?B?RFZnbS9iSXE4dGwxV0tzczVCVHc2bHQ5MkpydUNKUVZBYVFnWDZndFFtR3N1?=
 =?utf-8?B?aUx5UCtDc08xbGltY0VlK29zQXdFWHVTd21tT0Z1T3lpRlF5cVp6b21MN3hZ?=
 =?utf-8?B?Z0x0em5URXd4SjRIcytHdzhWRlVPV2ZMeG5LRC82bkRTc0hmbUp6M1NmTmRs?=
 =?utf-8?B?NnlhcVFraTZhVlo3UmpTUE11TktaYjV2alVoUFNBNzkxOVk0SU5TVmkrNFlY?=
 =?utf-8?Q?VRmjSs7pDo+ljdKE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c00228-fa87-43b9-a6c8-08de5272c16e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 07:09:55.7647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGAlrGxIezOXuFjFT48MJSecqztd/oPrBejCfmDnB1YB1zoc9Y+vPEKxQnpQiuZ9OA1HKYr4lYus26q/0Hz19VS+3w4W1uHMrT0etwvXDHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7749
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMC80XSBJbnRlbCBNRUkgS2NvbmZpZyBjbGVhbnVwcw0KPiAN
Cj4gSGksDQo+IA0KPiB0aGlzIGVuYWJsZXMgR1BVIGZpcm13YXJlIHVwZGF0ZXMgb24gSW50ZWwg
ZEdQVXMgcGx1Z2dlZCBpbnRvIG5vbi14ODYNCj4gbWFjaGluZXMuIFRoZSBtb3N0IGltcG9ydGFu
dCBwYXRjaGVzIGFyZSB0aGUgZmlyc3QgYW5kIGxhc3QuDQo+IA0KPiBUaGUgc2Vjb25kIHBhdGNo
IHN3aXRjaGVzIHRoZSBNRSBpbnRlcmZhY2VzIGZvciBHUFVzIHRvIHVzZSAhPW4gdGVzdHMsIHNv
DQo+IGl0IGlzIHBvc3NpYmxlIGZvciB0aGVtIHRvIGJlIGJ1aWx0aW5zIHdoZW4gdGhlIEdQVSBk
cml2ZXJzIHRoZW1zZWx2ZXMgYXJlDQo+IG1vZHVsZXMgKGFzIGlzIGxpa2VseSkuIE1FSSBpcyBi
dWlsdC1pbiBieSBkZWZhdWx0IG9uIHg4Nl82NCAoYW5kIEF0b20pLg0KPiANCj4gVGhpcyBtaWdo
dCBuZWVkIHNvbWUgZGlzY3Vzc2lvbiB3aGF0IGlzIGRlc2lyYWJsZSBoZXJlOg0KPiANCj4gIC0g
dGhpcyBpcyBhIHN0cm9uZyBkZXBlbmRlbmN5IGZyb20gYW4gImVhcmx5IiBkaXJlY3RvcnkgKG1p
c2MvbWVpKSB0byBhDQo+ICAgIGxhdGVyIG9uZSAoZ3B1L2RybSksIGNhdXNpbmcgYmFja3RyYWNr
aW5nDQo+ICAtIGRvZXMgaXQgbWFrZSBzZW5zZSBmb3IgTUVJIHRvIGJlIGJ1aWx0LWluIGJ5IGRl
ZmF1bHQsIG9yIHNob3VsZCBpdA0KPiAgICBkZWZhdWx0IHRvIGJlaW5nIGEgbW9kdWxlPw0KDQpV
c3VhbGx5IG1vZHVsZSBpcyBlbm91Z2gsIGJ1dCB0aGVyZSBhcmUgc29tZSBlbWJlZGRlZCBzeXN0
ZW1zIHRoYXQNCnJlcXVpcmVzIGl0IGFzIGVhcmx5IGFzIHBvc3NpYmxlLg0KDQo+ICAtIGlzIHRo
ZSBzdHJvbmcgZGVwZW5kZW5jeSBkZXNpcmVkIGJlY2F1c2UgaWYgdGhlIGNvZGUgaXMgY29tcGls
ZWQgYXMNCj4gICAgYnVpbHQtaW4sIGl0IHdpbGwgbm90IGJlIHVzZWQgdW50aWwgdGhlIG1vZHVs
ZSBpcyBsb2FkZWQ/DQo+IA0KPiBUaGVyZSBpcyBubyBzdHJvbmcgZnVuY3Rpb25hbCBkZXBlbmRl
bmN5IGhlcmUsIG5vIHN5bWJvbCByZWZlcmVuY2VzLCBhcw0KPiB0aGVzZSBkZXZpY2VzIGFyZSBl
bnVtZXJhdGVkIG92ZXIgYW4gYXV4aWxpYXJ5IGJ1cy4NCj4gDQo+IEFsc28sIGVuYWJsZSBidWls
ZGluZyB3aXRob3V0IHRoZSBHUFUgZHJpdmVycyBmb3IgY29tcGlsZSB0ZXN0aW5nLg0KPiANCj4g
Tm8gc3RhYmxlIGJhY2twb3J0Lg0KPiANCj4gICAgU2ltb24NCg0KU2VyaWVzIGxvb2tzIHJlYXNv
bmFibGUgdG8gbWUgbm93Lg0KDQpBY2tlZC1ieTogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRl
ci51c3lza2luQGludGVsLmNvbT4NCg0KPiANCj4gU2ltb24gUmljaHRlciAoNCk6DQo+ICAgbWlz
Yy9tZWk6IEFsbG93IGJ1aWxkaW5nIEludGVsIE1FIGludGVyZmFjZSBvbiBub24teDg2DQo+ICAg
bWlzYy9tZWk6IERlY291cGxlIE1FIGludGVyZmFjZXMgZnJvbSBHUFUgZHJpdmVycw0KPiAgIG1p
c2MvbWVpOiBBbGxvdyBidWlsZGluZyBzdGFuZGFsb25lIGZvciBjb21waWxlIHRlc3RpbmcNCj4g
ICBtaXNjL21laTogZ3NjX3Byb3h5OiBhZGQgZGVwZW5kZW5jeSBvbiBYZSBkcml2ZXINCj4gDQo+
ICBkcml2ZXJzL21pc2MvbWVpL0tjb25maWcgICAgICAgICAgIHwgNiArKystLS0NCj4gIGRyaXZl
cnMvbWlzYy9tZWkvZ3NjX3Byb3h5L0tjb25maWcgfCAyICstDQo+ICBkcml2ZXJzL21pc2MvbWVp
L2hkY3AvS2NvbmZpZyAgICAgIHwgMiArLQ0KPiAgZHJpdmVycy9taXNjL21laS9weHAvS2NvbmZp
ZyAgICAgICB8IDIgKy0NCj4gIDQgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQ0KPiANCj4gDQo+IGJhc2UtY29tbWl0OiBmOGY5YzFmNGQwYzdhNjQ2MDBlMmNh
MzEyZGVjODI0YTBiYzJmMWRhDQo+IC0tDQo+IDIuNDcuMw0KDQo=

