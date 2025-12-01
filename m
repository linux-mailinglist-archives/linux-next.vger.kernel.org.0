Return-Path: <linux-next+bounces-9288-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF1EC98FD6
	for <lists+linux-next@lfdr.de>; Mon, 01 Dec 2025 21:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DAFE1344E8E
	for <lists+linux-next@lfdr.de>; Mon,  1 Dec 2025 20:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793DE218827;
	Mon,  1 Dec 2025 20:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+A9+wNH"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA82DA937;
	Mon,  1 Dec 2025 20:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764620343; cv=fail; b=EZWwN7fO+24/bQ68DT5MXIiCOLBWwi+SEg66kFkPwpGpPP0sywuHbq4Vu+Cxs5eNr0kLwyIbBGreg6pz8uPn0s/7ongAVnsFUT6rQfDOJ5Xoxa1etR7syetsXzQly9lplRWz4PLBoOmYE6p6oihBOzGhZJl1KQTsOB1sf3SF+vM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764620343; c=relaxed/simple;
	bh=bgcNfMHqOLM0P68BD3A7eemNSSVPgNlPm7VhmctpZWI=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=ShloyjPIt40nURMwWKYdmoJfPRHzl0n1b8glxgt7D76BdClk7YpusWsCvYUYQ81MOQl4VuoktT2PK6gJP9ayEVSzodUVOn8Ox2zPq9eMkKmJoSvgg0Y9jk01qtrXNcZF8TFXTanwqFu7UxqOVgRJJjPyXvY8i27EOseyUCLjx7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+A9+wNH; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764620341; x=1796156341;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=bgcNfMHqOLM0P68BD3A7eemNSSVPgNlPm7VhmctpZWI=;
  b=X+A9+wNHFcONRKPQSwglD0oWu5UBJEvc+Bo07Elh18Yn1sRd0um9Q+5e
   e4Uav9ukgcluUDM7A8ytcX6k526ceLPRdzanScODypAPGo8ZGbH6X1K4d
   f4vv2UsY2QOgeCbPxHJR9EgBHIXGF1P4fIh2e3XLZKBo73rhD6p05jhnS
   SctEOcPgErua4N3lu/w64sAi7wpKRfLd81DKZ/OVJBOI5pGsc58/jxfAH
   gBoZ4w/cA9v68OGRusLuFDFqEznLn9VAote3acO9FpoKNbUmnQFm9enEc
   z5qt/j2uSuh4ze0G3FYmBw7jmYYUNr4JgNIa+Jy8lg0OkSyUvi3k2jIEY
   w==;
X-CSE-ConnectionGUID: Kz4al2ZvTPiXkCcrDELUsw==
X-CSE-MsgGUID: TC35HKY/R9m8om6L0v/Tng==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70421244"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="70421244"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 12:19:00 -0800
X-CSE-ConnectionGUID: bG8+2/vZT7K6ICBhvOlc0g==
X-CSE-MsgGUID: mj/4eca0QzO5kbWdSKTqpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194968614"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 12:18:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 12:18:59 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 12:18:59 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 12:18:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpurCS+0aQSZRIyKprAOAydHqcOQHIzxBsr9mZqgcMOjlOMajsh81VZq1jYcslMvXCIHGP1AKbmcZcIYCB+AH2iIzGuyk77aAFYRZeyvWc3asv+PIJbYu9Bh2UcO/aO3CdqiJxQOVatMeAXw5PJuxvNGeIL87oX/ZPVMLpbS9ydsDuIib0/8gxph+iEm+9jPeATrcooocJIj6v5tF1SE6vXRayiG02I0SbhreN4vIa9Sp32U/emD3+mbI+/4nNf/B6/rk8JnOnSBmrb0wMBrckDCuZRt/HIk2I/24R2bprgm1bj/KQpHHWdz9ydr7TWjAx0D9RKCuKOmhXddmi1sqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKNrNXsyHxmR0q2mJxRprLMR1zDjx0k0UJwPaBphA0A=;
 b=YUiIlOtoRNLwpQSR36LznxQMvELxFXajXotmgVMt64jv55iUy023izo1oj2kxGN6PDxXCzw1pzALTGHaVunAdldx32TccYhrY4u6qGToi1JpGFs9o6j85xMHF5TR295C9Q1RFh3lkzADBUQKh2OB5OCU1jjAycXvgP/1P17/rRRHfX/Lu0H96lWkcdjeq6rUZxzq0tahiG+hZUGVUiS61t4K9YrbjwYBmIVfkz7U9oJLLmQ8Zm5kZLWM77IsXtMStUmuuoGkugNW5NzWyJ0vByIYug5/1/5AScrAeAeuoReTJIm6uGv+WZUQ5ZVH4JcNLPEzS+mB88HjpEaja9B0gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA1PR11MB7919.namprd11.prod.outlook.com (2603:10b6:208:3fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 20:18:57 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 20:18:57 +0000
From: <dan.j.williams@intel.com>
Date: Mon, 1 Dec 2025 12:18:55 -0800
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dan Williams
	<dan.j.williams@intel.com>, <dave.jiang@intel.com>
CC: Rakuram Eswaran <rakuram.e96@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Message-ID: <692df82fbccc7_19811004a@dwillia2-mobl4.notmuch>
In-Reply-To: <20250911093554.0ce45f3b@canb.auug.org.au>
References: <20250822091206.7d0d57be@canb.auug.org.au>
 <20250911093554.0ce45f3b@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the cxl tree
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA1PR11MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: a598fa98-ac34-478d-6d1b-08de3116db37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXUrcGVpei9yUGhRMEg2U25hT01MTStYVTJ5TVZGMlBxVWVkZ1UwV2hoWlFu?=
 =?utf-8?B?eDVHUVBpaktsdDJPRVozTTVLTFB2Zm9aR2NwZ1RJWGJsQVFqK2E3Rk1STHVq?=
 =?utf-8?B?VGN5MGtJZ1M2MkU1M2VxWm9IajNJU3RsZmg5UHFjRmxUODZDRHFHalIrL3hV?=
 =?utf-8?B?S0ZSaHdmRFlaMC9neDNGRzNmU3VQNHV1L2pwWGhQanhLOUFSVjFOVjBKSWhY?=
 =?utf-8?B?dERTZSt5NUg0MTFLTWw2aVl5TTFyZjFPY1k1YW11aGhZVlFCbEhTa3ZtWTRs?=
 =?utf-8?B?ZGpDQWdncW9QdS9sd1VFRU01S2tMWU9JSDJqN0RyWTFjRVI3OXlvRVUyYUtI?=
 =?utf-8?B?Z0lTbTNsbWphRDdWbWtXMEUzTzNTd0NSalBmNEZwM1FwMGZ1eHhucEhQdHVC?=
 =?utf-8?B?RS9QTnNZbElHTXNoQXNpNFZKaDY2M2dlaTMzbjdMOXJnUnFmYkhETnhLdDZQ?=
 =?utf-8?B?clFoclRVMDVyMEFiWklVWmZvbnBLUVRkM1kxQXNEdzNyYUozUXFDSGdPSGZO?=
 =?utf-8?B?djUyK0FFaE9GZVlQUGFMY3ExMUlmVUpBOTErWm9iVE9WM1BtRFRhV0pENXJE?=
 =?utf-8?B?S0Y2N0JFbTY1SGVnT0d5WmxJNFBRWmZoZmVIa3EwR2ZOTFhoTW5wN0hnOWQ3?=
 =?utf-8?B?R243OWo2d0pZNDJqaXBtVEhhWkJ5TUFKanR4WFdDVlJwRGR5RkRsOXpzU2Fw?=
 =?utf-8?B?OVRHcXgxQUJrVURrdS80QXUrZURXYzhVTjJ3VW04dVRXRVdUOUovOC9vcmM1?=
 =?utf-8?B?czdnRnVXSTdpendpSllpWmcrNjRUenVQNVVrRmZKbXpjQ0pIVVRCOW92ZHJ6?=
 =?utf-8?B?cGhvTFBWN3dQa0NjejFhSjZjcFFxbnFIb1VwcVd6cHl6V1h1VEJ2YkRUaWph?=
 =?utf-8?B?TWsvZnVNTjJackt2SjFmNUk5dEp4WDVvVFl2aFh4L1RlaDZ4eHAwRmtTTTR1?=
 =?utf-8?B?cDdQQWVlUW16TGtVSHNBK0ZadGV1R2FOYlk2SzJFWllyRCs3d2U5cDZaNkhX?=
 =?utf-8?B?QW93VVdrTC9DUEN2Z0hoMkNtZ0d5VmZ3L0orZ29pT0VGa21jUGlrUTFGY0dV?=
 =?utf-8?B?aGVSdVZndTh4bGRtdlhBcG9yTWJYQWZUUzRIcXVnazNzRjlnZnhmc29qbTY2?=
 =?utf-8?B?VVpWZXNPc1dqY2E0NDduMmFTTHhMSmU2ai9hQk5TeUJBYW9JUVBEa1J4UUhX?=
 =?utf-8?B?WGJzOVNHMUZDY2w0a3lPZjdsL0RpQmxFYUVNdHpPSXh1dENPWnptUVM3NE1j?=
 =?utf-8?B?VkExWWRRaEVCdUY0WWRJekNnZkxoMlIxb0pUc1J6ZVRyNGM5ZU5SMHdKVnY1?=
 =?utf-8?B?WUpoU0tKTHR0T0c3ZmVxTVFpMktBbXlTNjdRR1dxUTFsU1B6bjc2MGgxM1p1?=
 =?utf-8?B?MWJSRFFhWGFtZHhlUGtMejR2NEFUR285SVVQbHJEWXFobWlzdGFVR1YxVHBi?=
 =?utf-8?B?SWc0V2FNYUcvNktHbElkVlZBaDNSbzlWMktwTEZ3eVZoT2NNZnhON3g2S1pk?=
 =?utf-8?B?cy91V2xuRk43WVVUeWVGRkRJM3ZjclFRekdvUjE2MEF3am05NDBLYkxnZTZZ?=
 =?utf-8?B?ZENhNXhIRVlFMGJBNytKUFozK0k3MzF4ZEU2NlVWTHcvQTYxSTlkSzlZUDNO?=
 =?utf-8?B?M2tyYUJjZHN3cUs0T3ZRMlBFbG9tYTlLcUlFbllrNjdyd0IvYmMzMkZpNWdJ?=
 =?utf-8?B?Y3pJajdZRTZFTWpTUXRZbE52RmFxWVV6SlpIbFYrNWJGdktZM3h5RENmTHJO?=
 =?utf-8?B?QnZqQnQ4VWI1dE5hRXlleFJ3cHBpaU5RRWdYS1E0ZkF6WlEyaS8xM0xLZUQ3?=
 =?utf-8?B?WXZFUFFlSU42bjFwdU1lUTcwbGhVV0VLZjhDYkN5L200TVgzU0hiSTN1d05x?=
 =?utf-8?B?RWYvLzNCMzBYMEZBdERhVmJ3MzM1UWd4RjgzalREMVVNeVJtQk10c25kMnhk?=
 =?utf-8?Q?rIlsbEHn5tq0/o6U7xWLNMgBLHVS1MCD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEVaYjBnd2pGK3BhRGc3MEpCQjBOR3hwQTQ5T08xSEN0M3RXK0hMbEw4Zmdy?=
 =?utf-8?B?ZFgxaUUxWHc3M2tCaWNvSnZLeUZqbktWNWtzVnF0TkRzNi9za2ZMWlpyMWNB?=
 =?utf-8?B?L0dCN1RxQnh5U1ZzaTJZd3dObmZ4TmNXdmhOMzVrU1RVekdMNElkR3oydkor?=
 =?utf-8?B?dXpvVTJCUFhzZm0wVENJMXNJR3VTZ2plS1NLaDROTzFNZjNocXgvRE42QTc1?=
 =?utf-8?B?ekh5L2JLRVhKTjMrZU0veGxhRkc4VGVIdWVJODlrdFpiQjFVOUFyZjBUTGZ5?=
 =?utf-8?B?ZFJTQlNwSi90NFhUN3RHZDhQVGVXdG5KKzByTldOZC9jSmN0MEJkVFVBUzlC?=
 =?utf-8?B?R1MrWXd6Q1gzdmdmWFZPMVB3ME41Tjhtb256b3dVZWtaK2JrS3EzQTJVVTl1?=
 =?utf-8?B?Titzb1g1NHFWeHJBMGN1UVhJYklOa0x4SlVJTHgxTHRJckhGZ1BhcmFrai9J?=
 =?utf-8?B?UEJoMnB0b1VQZ2hub0tsNlJFYVg3c2NrdWNZR2RXZGVmMHpBM1Y2T3k0MURr?=
 =?utf-8?B?ejZSZ2FWMFhQY3NGdFdaOU9hdE81SXYxTjIrWHVmK0pRdkgxT1c0VHM4dHVV?=
 =?utf-8?B?SEY5WjhEVkZRU1E3Y1hxQVlRM2RKV0lKM3I1elcvN0xWd3J5TkxrVmxEeGlE?=
 =?utf-8?B?NVJFWm9GU3hZZTRqM1hTSDg3Um5zb3lidnVlV01tcVNoREpqbHhEZlBRblJE?=
 =?utf-8?B?aUtEaXF5cjVtQ1FSZURZaWFxVTlsUDkxc2FtUXJJZ0t6dS9oSWZ2OWhpTlpI?=
 =?utf-8?B?ZXJiVndTdUJGa0ZJdDdxbmcxYkkrQkorbUJPQWl5c0pPV01vMXRWVEhPZ29W?=
 =?utf-8?B?cEpGWHp3NlAyZUplbkRLNHpySXhPaTl1YjhVSEdFTmNtWktXTWxFOVQwbHRM?=
 =?utf-8?B?eFE0c0pMRFV5TEtZa0QwQXlPc29GVUhUaWVUNDduVHVvQk9LNngvellyMlNI?=
 =?utf-8?B?bldlbFZ5Q1BXMVl1SDVsc0ZZZjZzSTV6eDQ0QUUrQnIxZEo2SERTcjVSc2ZH?=
 =?utf-8?B?S2h0b3UrT0IvRmV6ZDVPNUQzMWc4NytYMWhLNTI3NUdCc3pDN3RZeVJ5WHZV?=
 =?utf-8?B?M01wNDBPMFFJL1B1YlhUS0sxZFIyM3BhdmxiR01WQkVzNDg3RkNTdUUwRExo?=
 =?utf-8?B?OE1ieVpOa2NET3ZQYms5RUFlbGxIdHV4d2xwYWxpMEx3MFlJbUZlQ291ai94?=
 =?utf-8?B?dW9Qa1loRjVJclBvRHBSY1kzSWxFZ2dsc2Qvb0pYODlZVnFaYzQrdVcwbVJa?=
 =?utf-8?B?aUVTTEUyV05JbDhvWDh1ell0UVp4OUtjek9CS1N0RWo5L1BQZ1FQdGJiLzd4?=
 =?utf-8?B?WXBqRGdPOVNIeUpoK0hFejc0SHFzbm1zRmFiYk9zNitBMHdhNURGaFdUTDJ6?=
 =?utf-8?B?ekRzeEE0ek1uK0NMR3RKS1dZeVB0R1cvMXN0a2oxZm1JalNYbVNmbXRxZGdK?=
 =?utf-8?B?WFJ2Q2x3TGhnZVByZ2pOc3lWN1lIbXdLWEVveUJ2MDBNYnlvdVQ5ZXhQcTR5?=
 =?utf-8?B?cld6ZU9ENzgzTlRVelNTZ3lPeEJ5Sm8xMklkRlZoS0svTEorQ0xDK2pXdHZV?=
 =?utf-8?B?eFg4WjdCQ3dmUndkRFFZb296Q0x3MVh2YkNlSTFoS1lmdHo5SVR4WGNaaTNp?=
 =?utf-8?B?bE85eERFZVV0SkhyVGZyWnk0S2VtYUcvSkhVY0gramMxYUtuWlFUQlRsSGww?=
 =?utf-8?B?SGpEY00zZDZ1THNJWkttc2tyWjJOMHFhc1NBLzcyNUlLb3RjL21oWUlWYnVX?=
 =?utf-8?B?SnF1cjBRTUJ1Q3k1ZFJVbE1KV21rTVc2SW9NQ3lacFFDTTI5Mm9VVDBoOGdr?=
 =?utf-8?B?YS8rT0k5aDNzd3h4OTFTVTVPcWRVc3BJRmltd3hNWFlic3dTcUJQaTJJNGpX?=
 =?utf-8?B?dVN4eG1YSHZDQXl2UmN1MUY0NkUrcUhMK0ZXcHczUVFDaHVVRmcvZ3BUSXov?=
 =?utf-8?B?V3hwblFoQ2xmNjVncCsvR1FUY2lqcjg4cVY5YXRWdnA5L2pzZlM2M1kzWlV4?=
 =?utf-8?B?RmFQNk01OWRlWDYrUDI0eDhjcHptSjFPUEMxOUpqck5XdERJVkRWVGlSUlRU?=
 =?utf-8?B?TUI1YkN2SDJSWTF5TmU1OEZKNnhGc25MQTF4NEREeCtQdmgxSWVPdFdjNGdh?=
 =?utf-8?B?b2ZWanZEQ3gwUDkzYlJKRUhic3pJbUlpeTQvY20xVWV0eW9vL3JNRVRCcHR4?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a598fa98-ac34-478d-6d1b-08de3116db37
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 20:18:57.2520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfds4X5aPymzWyC7RhufahtUnQXVKQxpcefGjD4yZnPA/xvAbgjjb3JmBpmaA95RtgbzbXrv1+HeatUm8rp8UQcwMJV3d65FVid8s4ev6Gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7919
X-OriginatorOrg: intel.com

[ add Dave ]

Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 22 Aug 2025 09:12:06 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Commit
> > 
> >   561c4e30bff9 ("Documentation/driver-api: Fix typo error in cxl")
> 
> This is now commit a414408126d1

Ugh, sorry for missing this earlier.

Stephen, may I request that you add Dave (dave.jiang@intel.com) to the
notification list for linux-next reports for cxl.git?

Dave is running that tree thesde days and I had not realized until now
that he is not copied on these reports.

