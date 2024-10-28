Return-Path: <linux-next+bounces-4479-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC269B2B04
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 10:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E54651F22992
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 09:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4DE1BDA8C;
	Mon, 28 Oct 2024 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1j2/umq"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786AF192D70;
	Mon, 28 Oct 2024 09:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730106546; cv=fail; b=b3mwNYobURtxKm/N8dkYDBr3pWAOUdwSu3COd2vJE2SvMZuSURCRdBs8CcVVw6LqL55naDmS+DtcK23KtwvDtTYPu91MQbDnHjSCOHjHhdYJ+HotRsSbtQxVa1/ZtrIIm4erKpI6GQkX5MmxNzg70kg7WRvV3DF23rSLRbbjTM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730106546; c=relaxed/simple;
	bh=UJzDoSZ8jKOe9wWrf3xuVh7VuawpZBnFXahQ45qih1U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lMr+hZfxBMoWAeoGcDDuIgcj5tsLFcyDJUqQRKZLG1b/0XR+WGtG0SpQltSIgECvEgVup1qUsOTM1syrFpwqpoYIDRn1M1niprCDc4Bn8FSSHvr//6ZKNfSGG948lZzheOYcoWku5OkYZEyIfTsAskRvL97eYsEdg4C2JwVH5do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1j2/umq; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730106545; x=1761642545;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UJzDoSZ8jKOe9wWrf3xuVh7VuawpZBnFXahQ45qih1U=;
  b=D1j2/umqvbQVscufejlI4wjNxNXKXGD5k3Cp4vmnImSuf8SxGFPfyUG6
   /npeAtMGF2YLaXldBGaV8ps6npgRdI6C/AVr3RQq4dQ//+7jraOkNMOWL
   piHEl5DyKFykWAvuI7i0BvvX2JGdcIPLgFMCAact71EYUlDYAs2qx7J1Q
   O/h20MfzJtX1IdI0QhM8NjOGS3faeFExsusIDxYmtxbuAlNxFwWzOuSXP
   Oh4f3GWjzGNPWOGSOUb7hhMZHgKiBn59LH0XdIODdzxnmDRTEFVXpQcAu
   +1URn2h7E6fMsGg8AWBcx/SHmq2FsbY+Y6Ln/+TdJIa0+ILRIauPRlqU7
   Q==;
X-CSE-ConnectionGUID: 8hyL5jb6TIiAd815qNB4gw==
X-CSE-MsgGUID: d17LtHhkQDSxqAJTAVzA9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="33606183"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="33606183"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 02:08:44 -0700
X-CSE-ConnectionGUID: dJfLAyqeSKSUwfF0djWDUw==
X-CSE-MsgGUID: Pc+ra7O8QWyc+5iCAzBb/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="86297971"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Oct 2024 02:08:44 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 02:08:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 02:08:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 02:08:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wo/VJE1w++EQBmuRoHWEYd8ImVuLPMCwBlSHSTgQqJvS2EE4WRisvkLZdzKMK9JYRyMFmR9BkZtQZ74Va8BsudFeBb3eDUW0Hi/SbcsRTTaYjDK819qIz6ty1bHX4kGWKv1R1h+i+UdhbD3AgwQFgYeNUZu5q0WIwZR8GTlS4g5LSVc4Dtl7kLTEEK6EMoBMsHfcCziI/CMV5yz96GyB2LsnPQX90ghuxGsnBmhuXH4RtUJch7Fm8X8CJWLg6/yTU53g3WGX42VNIURDjJMLk1u+Sj3e1iqryzU721xIP9JJ5HVis7IbEBa6cjSBCMm7iV5YI+5qdvGWw+zbqjIuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvPdYiURziL7Jl7jelHyX9xe+If5+cfJkw1AnltmOFo=;
 b=Hxj8ekI8EdUb7s/DBPc9e1kr8SV+dllA5RBo/hcg4EeKL7ZrWJRBwCbHam493DQvXk9QAEsbD6SNX4zzeTbA4KeWXwP7IbgaYGZwjS+/TlKPybUi6aTjEsyhm2dk/0gTag4zKrQg6AtH/aSWzRiF/Pqsv89visHE2tmJi1c+PY113+UOZgQTkV+KACcXUyXpJ83XlkQQh3alp2WCMENwAPEyXeZdkqpC8qXc6jiq1DVDJNgI2IliOHAzgejEmenTc3qSv1tdFj9+JB5FeCesy1NNT08e55xCcXOKQ6LkyAN6PDPI3YTRWDfoEj0+XJfjIASZk96nRTx0DneGpK2KSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 by PH0PR11MB7472.namprd11.prod.outlook.com (2603:10b6:510:28c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 09:08:40 +0000
Received: from MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6]) by MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 09:08:40 +0000
Message-ID: <f3eb4431-5dab-4ebd-9a05-7854002bd126@intel.com>
Date: Mon, 28 Oct 2024 10:08:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the tip tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar
	<mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
	<peterz@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
References: <20241028165336.7b46ce25@canb.auug.org.au>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20241028165336.7b46ce25@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::27) To MN6PR11MB8102.namprd11.prod.outlook.com
 (2603:10b6:208:46d::9)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8102:EE_|PH0PR11MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: f409a5a6-971f-4b60-866d-08dcf7301d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cE00UnhiZTYzRFN0M1Q1R0ZmTG9CeUNLZDRxakNydEx5R1hGV3p5Y2JFdzNM?=
 =?utf-8?B?eEpDQVRsRjB4KzBMZ0pGSk9PendDRHI1eGp6ZVY0aFlzTlhZWTF1czRXU3Zs?=
 =?utf-8?B?cU5lQ1A2T2RIT1cyaDB4STNCT3lyV2t5MDRvNGRuTHpBUkNxQ1hwaE5yL0FF?=
 =?utf-8?B?Nms4SHUzRGc5cWZsNUJDQVhVNUdUNEliQktFRVE2cWZWQzZYaVpmeUx1L2l4?=
 =?utf-8?B?MDRNZEZkZkx2VEpaa1FOTEtUVzE2ek1valFoNDI0MGg3MGl3a0NueHJxdUF3?=
 =?utf-8?B?UWNNVXRKdHR3K1JOSkhaLzlqRkV5TXIwbmFCZlF6anZyNU5IZXhpbHNacTNq?=
 =?utf-8?B?V05YNkdjZEZVcklZY0Q1dWtwcmptaHFoZFo1VUFONHZsa0dydmJkTkwwQkJn?=
 =?utf-8?B?ekQzUGxoK2dKd20rVFVwV2Jab0tVUUdETTFXek5MVHZET240c0YxUTN4anFH?=
 =?utf-8?B?V3dBYzVuM3MwVnVHU1p6VmdrS1hHRE0zeDJaQjNzRThIazBZYk1PNjZUUzJj?=
 =?utf-8?B?eWw0bHhJM1JjeWtRNnF6OUJjRGN4a29UcW51SDlBbko3VERiNzNBMzIrcjA1?=
 =?utf-8?B?WjdROGZ0cU9XM0k4VmZjQisza0xTa2RCQVNuc09DZ2JobHVVSldOTDg4Vndn?=
 =?utf-8?B?RzNHVzR2Z3N1S3RqMzhROVZWSk5sdVNmRUpaS0ZwNUdFQWZQUFlqR0hXNC9D?=
 =?utf-8?B?bjZMT25OcHJXZm4vaGt3MWNZc2kxdytTd2lqSnNqaS9OOG40aThNblNRbWdr?=
 =?utf-8?B?WXJ0clQxTFpOaHBjRWxQdU9iaUZwTGdKWjk5ZUordDRxcVdHMk8xZFFpWWVM?=
 =?utf-8?B?WDJITXFONkNEWVkzcVlDRSs0RlB0d1dnZXZFd2ZTQXRwZ2xqeXBzdlhielRw?=
 =?utf-8?B?WDBVQ0piNHZKcXdyQ1ZMK0dpZHR3MmtENGU1dDJ3V09NV0VxVXJmMW1SV3Nk?=
 =?utf-8?B?dnBJbUVQTm1wbFZuQnBERzhFVHo1all6TTNNdUJKSTlvc1NtUEJNWklwb29Z?=
 =?utf-8?B?NUkzUXZURVhNL2Z0ZU9HWW0rWGg4VGg3T05PTVo2dm45T0lIR2VUZW5ySmJq?=
 =?utf-8?B?bis3NndQcVAyMFVyM1B1TmliQjgvV20xMXg0UTh3RmVySU9YdXg5dzRsOW9j?=
 =?utf-8?B?c3RHUDlHQk44TTd5cnNFR1dMUDlLYjJYVHI1cEpjTGJzajRPd3RyM0czUWxR?=
 =?utf-8?B?UXh6N05Yakd3YkVWODJqNzliUnR5dXY4SncxV2hJWlJoSm5oWnFFaFNVMUlI?=
 =?utf-8?B?bnFWU0JHM0pMTWNOdVZmdFR0aHBQbzBUckNDcE4rMER3YWhUZTc2dit2SDk4?=
 =?utf-8?B?blphS015c1F3a003RTZNQndCcmNMVDlGTzBIVThOWnR6K2hOWWJWWC8rSTlQ?=
 =?utf-8?B?NUdJVXN0Z1VYazFVUnFMMHFCZys3b0ZXWXIyNVJpTmhjNVpoTEo3bDZmaHhQ?=
 =?utf-8?B?NXlaQVRDNG52Mzd4WjA2TC9Gbm5DNU1DdHdGZ2ltaExZemFPNUxHK05nNzVP?=
 =?utf-8?B?Y2dhVTJBb05ESlRIODkwZ2pXWHBhWlMyOWFxYUFiQTh1RWRMUnFJUmFpbVJU?=
 =?utf-8?B?c0JZWG9Ca01JWXZVc1d3Uk42OVZHRVFycUdId0FNdU12eEQ4eFZTQ1dleW1H?=
 =?utf-8?B?cWVvQThWSEpZYi8zSTJTTkwwRDlRb2pYS09UVEdWS1lwN3gxdk1kVk9WTllJ?=
 =?utf-8?B?TzJhd0RsMFhyK2pXU2RDRjFqeVBqblBFamFKQWY2YzZxNUJyNmczSEJVWVpX?=
 =?utf-8?Q?Gw4fS8wflVdbTC3QKwvQkzgyq9qpy8lLLrOAr4L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR11MB8102.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzZuMWFZaU1GTy9YL1BHd3BTSVUzZVo2S3JPL1Q0MlkyKzcvZExxektZWXQ5?=
 =?utf-8?B?SHpnUmdLZE5yTVFaaC9WQytZZHlVUEFaOEJYbXdXOTlNdXUvNXJNV21jaExM?=
 =?utf-8?B?ejlYSXlOWFIwYkUva1dodmhCT29BTVNtTnp0UjNENTNzTGQ2Y09WN1lKMW5R?=
 =?utf-8?B?eGNIVWVuNW5GYUNqSkZUQ2dsVG9TQWpUeEE4Y25qTHU2YkQwSUJkbWNGSWxE?=
 =?utf-8?B?ejFIYndjS0U5NGszbmpTZnVpejI5bndzbURYWG9nbTA4R3RYUU9mMUphcmlJ?=
 =?utf-8?B?WFB1MmtHZldLcG1DM3JEN3RTWUE5elBzOFNLT1BJK0ZtRHVVTERxQzZ1SWg1?=
 =?utf-8?B?RVpqQU42aXpUUzU0ZG9YYk81bWNJa05aOWxuRUlnZDBPUEdEdlgwSlFQcXdK?=
 =?utf-8?B?aXdXYWpGdzNZRytOYWxWQmRDdVMzQlMwN2NRaUJuRFhiZnNUeFQyWmdpYkZr?=
 =?utf-8?B?M1BvYmZGbVA3cWZ3RjEzM1lkeUxkK1BlTGo1QVZOdUJsYXlOTm9NNVFhYkk5?=
 =?utf-8?B?NEJPK0p0eGJiZkZ6eDBTY1h3RFBPayszMjIrNjFsOE1nM1JpNk9mNUtOWm43?=
 =?utf-8?B?Y0ZHSFF0cFBBM05DOGtVeXFKK3NjcldOYWJtVVNsdTRHNzMvOUs0QVFVOThy?=
 =?utf-8?B?c2ErL0E2SmtUNW9Md3JhbWJBbDF1UHFUQ0ZPK2dtcnZWTXptYXgxemxNUzA0?=
 =?utf-8?B?MytMMnlnMitaQTZ5R2ZrMWsxeS9SUVRqQ2w1NmtOeHNPTEY1Vkc0MnZkUUVM?=
 =?utf-8?B?elR6a2NRYkgwYkVWeG81VWpJOWQvcFI3dXQ1ZytPYlVSRDVaLzhjejl0VVRK?=
 =?utf-8?B?eEpIOWdodW1zVEtGbzZYLytHS2oxbGZvTXNHTzBXOTF1ZThEalI5N05SSks1?=
 =?utf-8?B?N0EwbXhZNjVuVVUvN3VJWGpRNXJMaDRsRjVRQk9QVGhSQ01pN204djJHRm9W?=
 =?utf-8?B?eVJUWWJPMUV5Zk5qcWZyY3FKNHJuTHp4Y3l5VnF6OUQ3MnIrRCtvYVVYc2kz?=
 =?utf-8?B?dVF5Kys1TURyTlp1Vmh1S3M4RTlXcDA3RTRNQ2w0a0doOXRVZkhxT0J6cUxo?=
 =?utf-8?B?dFBzMTVjUU96YjBGcHplQ0Y2dnlVdWJyajRXeDkwdkpHeWQ0b09zdnVGSFJP?=
 =?utf-8?B?TDhBbnBFUm5KSXZIUDQ2QnY2NGFGTVJRbmc5a2ovdHBFdzduOEdZc1pic3NW?=
 =?utf-8?B?eHdWSm82SnRuMDJJbUI4UTJ4QTBMak5uY3pHcEpLWGw0S3o1QlFhckUrcDJG?=
 =?utf-8?B?dzd0UGF5NkF3RmFraG9XT1BVcExzeFdRMWJsRFVEd1dHMDk3L25VYlhvYTYy?=
 =?utf-8?B?ZmJ3VnhVVVErbk1Oek1TR0ExZmpWWWVwRkpLUTVDa0xYbjRSelJGY2NrTmZN?=
 =?utf-8?B?QjZjM0F0b2xwU0pkOW9vVmxRZjBSOGxrMHUxd2lHbDM1SDF5K0pGUHhBVWZl?=
 =?utf-8?B?bkhHNU1aZW5xM3Z2WkVOazlGOSt1aUdYai9sbzB0QUtuOUpWTUxrOHY3QzFT?=
 =?utf-8?B?R0Fzc3dlZ3l3WERnbTRYSHZZZkpSR2RVUllzRWZuNytxZnE1ZkswRnhVQ2px?=
 =?utf-8?B?ZjhmQXBGTDZvSXhac2kxY1lSbVg0ZXo3YVhvL0xLSlFwSDRGQk1XRElYL1lB?=
 =?utf-8?B?YmZpRUdjckR2MDlpTzdrZ0RlaVM0c1FrUE9obk5YL1NRUEx5eUdjbjdEN1Bm?=
 =?utf-8?B?TS9lL3NpNHp0MTBMekhSS2Mzam1iekxSTGEwRGZGWjNjUWFlUG9DZDNYWUdm?=
 =?utf-8?B?RWQ2YjlVbC9nUUR4VjVtUFB4QUh6c3pRUGZKMWFJVi9tY2drNTdvYmtSYlg1?=
 =?utf-8?B?clk2d2YrdHpwQTNtRSt2UHN3ZThrSmRyMzVmenRVLytDdXY5K3pkQ1BzNG1D?=
 =?utf-8?B?aFhTSlUvNkpBd0lxeU5CWUgyWHJpVVpYRjJNZHg5QnVxQ3hQb0Q2Yno1Ykwr?=
 =?utf-8?B?b2FlbmVucEdCSDl4YUkySnkzZnVtc1haaUdkbVhBL0QrOE1qZkNFN2ltd0V6?=
 =?utf-8?B?bmlEaithOHc2bjZoQkMyQlN5QlhIVkw3dEloc3g1ZWJiRXZlNVVyZDltV2Ev?=
 =?utf-8?B?RlllNk5mV2RrTnhLd1Rmd2c5TkZwSy9ZZXlJMUsrajVIZHhuOVQ5Tm9XYWg0?=
 =?utf-8?B?eW1LUVp1by9VNlRMKzNDUGIvMDFiaTY5cW9sN2djTXoxUjdESVcyYmhrVXNF?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f409a5a6-971f-4b60-866d-08dcf7301d87
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8102.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 09:08:40.6722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16RGyEjZ+CLyfn8VCXWrJhK+6dFfKmDB81Hu1PwA0vZ4EZIyNtvPqB35j30bCvnUHBwVIjLVB4nrrB1ZY2GnP3dgTytHl0LLWn/9i6NU2rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7472
X-OriginatorOrg: intel.com

On 10/28/24 06:53, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/iio/magnetometer/af8133j.c: In function 'af8133j_set_scale':
> drivers/iio/magnetometer/af8133j.c:315:12: error: suggest explicit braces to avoid ambiguous 'else' [-Werror=dangling-else]
>    315 |         if (!pm_runtime_status_suspended(dev))
>        |            ^
> cc1: all warnings being treated as errors
> 
> Probably caused by commit
> 
>    fcc22ac5baf0 ("cleanup: Adjust scoped_guard() macros to avoid potential warning")
> 
> I have applied the following for today but I wonder if there may be
> others.
> 
>  From 93183168618777d573cd809a971c4db59a8dc800 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 28 Oct 2024 16:01:15 +1100
> Subject: [PATCH] fix up for "cleanup: Adjust scoped_guard() macros to avoid
>   potential warning"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

thanks a lot!, and sorry for inconvenience
(I had same patch ready to send, but after some refactors I was fooled
to think that is not needed, sorry again)

> ---
>   drivers/iio/magnetometer/af8133j.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/magnetometer/af8133j.c b/drivers/iio/magnetometer/af8133j.c
> index d81d89af6283..acd291f3e792 100644
> --- a/drivers/iio/magnetometer/af8133j.c
> +++ b/drivers/iio/magnetometer/af8133j.c
> @@ -312,10 +312,11 @@ static int af8133j_set_scale(struct af8133j_data *data,
>   	 * When suspended, just store the new range to data->range to be
>   	 * applied later during power up.
>   	 */
> -	if (!pm_runtime_status_suspended(dev))
> +	if (!pm_runtime_status_suspended(dev)) {
>   		scoped_guard(mutex, &data->mutex)
>   			ret = regmap_write(data->regmap,
>   					   AF8133J_REG_RANGE, range);
> +	}
>   
>   	pm_runtime_enable(dev);
>   


