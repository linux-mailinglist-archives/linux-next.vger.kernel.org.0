Return-Path: <linux-next+bounces-1716-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A1E88AD8A
	for <lists+linux-next@lfdr.de>; Mon, 25 Mar 2024 19:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAB3B1C3EDC4
	for <lists+linux-next@lfdr.de>; Mon, 25 Mar 2024 18:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0992B1D53F;
	Mon, 25 Mar 2024 17:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NDmSWw/h"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2088.outbound.protection.outlook.com [40.107.102.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2C41CAA1
	for <linux-next@vger.kernel.org>; Mon, 25 Mar 2024 17:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388936; cv=fail; b=sjFBJ3AOiRTXEaKpRzefl0dAcPs9BHzqj/rVTKzsbicrhmJR4WesKFJRh3pwKI4rNAQ4Z5TqjyXTEs3FDAKcMuo6gRjy3EaxMjLZnA3fxPBGuCftP1yEr5HYfru6DWzFTlz0Xj7uysPqDifGWbWaXyg2iLZzGm+V1tHKYFiWLJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388936; c=relaxed/simple;
	bh=ZwxZ8iJehwbTV8KLVYmHTyJ2yjFOx6687N5OD2RJnL4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HtDi/XTUq5kTJU0xcqZ2ERO0nUYNMfB3LGp4+jE6MADmpwRGsPFx2tD2Ek8ssRYsC6WOMbfCDPqm5xLcNMIjr9fUWdBYaFFdti1VxY7q92s+WXKGf9HrMM96wyznXC5gZ8q+RCjT2QiDyDzWsGlkLrn6ccq7lHPw1wC+hClW+OI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NDmSWw/h; arc=fail smtp.client-ip=40.107.102.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOER3cQv7MDl7KcvXo9VTXlPolpcGQAdqZdcCRkHFzW9D7shuGyH9I3JRod/fFcr9AGkfnwq6AwUFLD07ly7QjNtpwjMEwQtAyBStpGebSOFyjj5z9Vo+7664q1+vV4QOCLmRmJ8EZzr3+SoqkDaEhy+UwWzlZ99C7mU24rhihyX1S7zp2reQCW0XNOxUafyYxMP8Hqwho9XpQ/Oa+eeZI9gVpOTy2NGYn9v1ycnl1BAiErl+sHnUXfDiy0GLpktINrrNDCIri4hrY67fRpdEisTj3WurdpWlPsuym83/m3mPWsw/ZNKVfCkeHO7ZXSG+6yG7ftyeq0XjFzGowvimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qT/3WDPYt0yi5+l6B8gpED7kRVWvEehDJ5jXVas2zp8=;
 b=BjCG+qxFEr14nbTn5X6PXSZSjJ7Z1CHU9ENNTaeGdgNmut1SnCzTP60tA92C/JthJzb9EmqamB7O+HCcYcc2JmLUbWdjOqhG0xR1JpDCVV6nSpvJ56/TBKL1K2miiIB8Nel9tbhrz7nz87i8+j2iJhAb69nK+lJwm0yHR6YE++yx3xDolXkfHk3SNr0Tu37jj5Hrc9bvAa7iB584Z/FasNfKpnmOLLfxLShf/BJcI+UpKX3UGlFJJAxKOeTRPhYawtqW176x1wvehpUEXciuGpq/0+toDZyoCO0NvtV+5PiQMZsOAVj2MnCpaFvuGvyPwl4yrr8oIPKrbknAwSZVfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qT/3WDPYt0yi5+l6B8gpED7kRVWvEehDJ5jXVas2zp8=;
 b=NDmSWw/hSV9XHEq5l0Wj9XavZnKH9xGEgqGgRwnu8ZYLjt9Pg2oI8AMZKNtPdZfuCSxELIqaJiXcV2ZcBWhdyEs+py3mH/Slqf0K1klG8n9zxIwQBQ5Shym+ZTR1cMbsingmjVarywTj1Y+rIc8SjJM47Re61s577kIu9JJcMu8=
Received: from DM4PR12MB5086.namprd12.prod.outlook.com (2603:10b6:5:389::9) by
 IA0PR12MB7673.namprd12.prod.outlook.com (2603:10b6:208:435::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 17:48:49 +0000
Received: from DM4PR12MB5086.namprd12.prod.outlook.com
 ([fe80::225b:b65:a5c8:b069]) by DM4PR12MB5086.namprd12.prod.outlook.com
 ([fe80::225b:b65:a5c8:b069%7]) with mapi id 15.20.7409.031; Mon, 25 Mar 2024
 17:48:49 +0000
From: "V, Narasimhan" <Narasimhan.V@amd.com>
To: Feng Tang <feng.tang@intel.com>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "Aithal, Srikanth"
	<Srikanth.Aithal@amd.com>, "Petkov, Borislav" <Borislav.Petkov@amd.com>
Subject: Re: Boot failure with kernel BUG at mm/usercopy.c on next-20240325
Thread-Topic: Boot failure with kernel BUG at mm/usercopy.c on next-20240325
Thread-Index: AQHafrFpTdzIz8FNRkK1oR1yu+crQLFIlMCAgAAmZbE=
Date: Mon, 25 Mar 2024 17:48:48 +0000
Message-ID:
 <DM4PR12MB5086B9BDBF32D53DF226CBF489362@DM4PR12MB5086.namprd12.prod.outlook.com>
References:
 <DM4PR12MB5086E76CF24A39017DA8567189362@DM4PR12MB5086.namprd12.prod.outlook.com>
 <ZgGYFRuzuaawyGPm@feng-clx.sh.intel.com>
In-Reply-To: <ZgGYFRuzuaawyGPm@feng-clx.sh.intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-25T17:48:48.558Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5086:EE_|IA0PR12MB7673:EE_
x-ms-office365-filtering-correlation-id: c9365e35-ac39-4fa8-c2fb-08dc4cf3d391
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VJfBzBysatTACKmEjsuy1US1EIlXhtzoym9j0dq1ONaLluTa//quig5CmlotzIhq4hGHslTM2sv3FqTCcLXJ4V0GHvUjX79mmBfAMcchwutGvXdlvoS+nB0hT52xdRzdvDpd04/PBp0zZukBG7wKvXlNJFW8gfZPbJcsARwrd5SXgx02LoKIl/WC4Fgxc94Y5t21fYcVQCUoxyPXoxWSbqQooAUlXpgSwxyf/vu4h3IW7nlPitANY+dUHQJA4HWjsvn0kFHR1B62IBu3v6+Yy0qBk058cxhLZ1iULcq7Z0n2hoQeLmAv/ixiHVn0dUaIsTsM8YHPLh6HTk/pKAJ3JLx+Q/eZdbPDAOOTPWq4yJz1P5Kp9C32vyHR51xo9WLA8mj+L8jiIjUOl0mR04dEg0yY2Q3i4KLXhSqLZUXK4ww31I6k4cLmLElVM0de0RjxHg27nbna0Bn8El2vITT9tMtXPvLD/OxTpID4FM0gV3Rp9aIXoETNSzPnZusc4RFsGJ87NMO/33BJkgpi2zulY8wnl2ZNTwtmT9V0XjFjHyxAVKRADYgUWVqdHMcfMk9mVVaGkTVOy9F/j0hDWGcQul4SSZ+HgVkF7gzvOUdxeRddLfumi0f8vTx57cXtJfR+lGuGwLDUDhRW0M69O9/FSl8YWCaflsvFp/UpDdeP7JgSyDQ1PppyVQZe5zFT6WzPHS3jDsqHW3EjiS1x5263cXWhvwOF+NF3dKcum62D3ps=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5086.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9mWIvpaDFM2/trLB/xi52Dp4VWqwjtB2V+D3X3zOGj8h1DZyTnRAIJtMEB?=
 =?iso-8859-1?Q?71eD+zWKBg3p/pJbF6qFVzXKj59pkK9cEVHHB+QPTrk8TQ9AzZp+b1mSQF?=
 =?iso-8859-1?Q?micV91m8eIx7wrAZcKlqzlUiMQS/8xOIJt5plTKvZbH0DnSrcMGNEjFL+s?=
 =?iso-8859-1?Q?My4wVMtqef+w7xjnFNHSSx04aWt1cA8vX0tAWtv072BsoGY5h4+1w/HHjM?=
 =?iso-8859-1?Q?NzVXUTeIHvCA5pUEkQUWoni4AgdEPu0oe6n1Z1pMsz9NYBPgU2wpyoW/ZI?=
 =?iso-8859-1?Q?4b84HU3+J0vlTmMHxWFh9Iil+0VKmBhGUMDz2H16xgo4BRBJIZfZOV4tNM?=
 =?iso-8859-1?Q?DtvwP4bBqVdYrnesGR5fISZPBAIBZE5tEKyJV788fiNbb6VJ9XoKdfl16t?=
 =?iso-8859-1?Q?KhGNN8c0Rlws2iSBWHW0+vWtJGXQW5GYDhv6TMeFdlansYB2FEkEYJ379e?=
 =?iso-8859-1?Q?yTeykHc5MlWaLX1r7KgmPaYBX05qVYcqydc5CPzOo6IAsZH/BQiUJw05eV?=
 =?iso-8859-1?Q?8K4Ny75b1o0ML29gGouDldqhRENYTiWdnXlhi+GR/fImuiBx+oikF8/4wt?=
 =?iso-8859-1?Q?C9B6QC9wrGxRKBwrPAQOD+74/kxe2ohJEgA4yTytlx3IK5HSaYzf3vKLnJ?=
 =?iso-8859-1?Q?uH6YtamseMgb7B/6s4VQWKtoWu1UTWRzXww5z34MUynU0mEmoDsw5qDvff?=
 =?iso-8859-1?Q?90PKcxwP/SZQ8n9q8ee6VArdvMltAiJ2fbSKWx2aKeztXy8otW/jilhoVI?=
 =?iso-8859-1?Q?jsI2ok4Mg8g43D+7WZoM2HXBj1MT12u4w5W7XFfFrAqAQG4lY9K2I6YuuW?=
 =?iso-8859-1?Q?EIHnUmv+uitsBsPna2M7pdqrY+V+orkCVTK5LJE94wsQ/Lix4UuKJ/EqJi?=
 =?iso-8859-1?Q?sh9oqbgBwSWszYCNgIfQOW34deBm41k5aqup4ZkbjxShPvmB/0VcCu2FfI?=
 =?iso-8859-1?Q?QEscezpJWvh6RTaQKqokdqhFLONxAaPeaaoczQ9G3EFwJgDtUxa4VD5gox?=
 =?iso-8859-1?Q?6VD5EPoBt56z2M+V1hO3/nUT+kYbKt1r4jCB4xFI/qG/huBLrBqHHS5QVR?=
 =?iso-8859-1?Q?RhpFyJCKWhFpZcXZoMoMYXSgEVLMT8DfZyJSBhOIiLCJ6Px6Cplw9yUC34?=
 =?iso-8859-1?Q?qKw1uT7aS5JnfkfZcyZ8bUNEsC2iaDKkuxqpee/4HWd2YZvcwSPUDXCMRU?=
 =?iso-8859-1?Q?M3FPSdocg92gRIIVdgMGJvPb9fuOhInSSfRzLN1sfsZIZvKEEJA1Sq8elY?=
 =?iso-8859-1?Q?W+QYmsV3g6r6a8UqnPeGsgNlO97680gknqVadXhFSQwKk0D4l3ftcvwi5U?=
 =?iso-8859-1?Q?EEZ2h6GAPIR3jDY4FAjFTAE7rzRfiYsYfmZ8gkXaPdEZzQQW8zkrqvPyCO?=
 =?iso-8859-1?Q?tFy2KuYglDgGvEqNuNWHzimyNZmVwjxqkVLuytZG++nm0N4Gp5Nv/G3ntr?=
 =?iso-8859-1?Q?C2LURf4GJFwqHn3hmhgikiVgFx7rsBIs7VbbHmeJmq7WlWrbdhc/0t3vF3?=
 =?iso-8859-1?Q?NNUrhE2W2mFaH1eToVc9AruwToH9if83A9UyJMG6rGojz5X5j7sA8r8LcU?=
 =?iso-8859-1?Q?ScZTFxOtxCJZdsbn7JTr7vUNx3Jh9TiEnORCUPje1MVvH0ThIX1yIOyWu/?=
 =?iso-8859-1?Q?Ds2ShAKmOatcY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5086.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9365e35-ac39-4fa8-c2fb-08dc4cf3d391
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 17:48:48.9605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QdEt51vePvb3cGlFW6CQBfsYc8MpWi80UZ5VV8dlcR1gIJA+umcxJFxByGTqzhz8pWVNcW5Nr7Cvh7YA8/SoPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7673

[AMD Official Use Only - General]

________________________________________
From: Feng Tang <feng.tang@intel.com>
Sent: Monday, March 25, 2024 08:58 PM
To: V, Narasimhan
Cc: linux-next@vger.kernel.org; linux-mm@kvack.org; Aithal, Srikanth; Petko=
v, Borislav
Subject: Re: Boot failure with kernel BUG at mm/usercopy.c on next-20240325

On Mon, Mar 25, 2024 at 08:40:20PM +0800, V, Narasimhan wrote:
> [AMD Official Use Only - General]
>
> Hi,
> There is a boot failure as below.
> On bisecting, the bad commit is found to be 328c801335d5f7edf2a3c9c331ddf=
8978f21e2a7.
> Boots fine if we revert the above bad commit.
>
>
> kernel BUG at mm/usercopy.c:102!
> invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 15 PID: 567 Comm: systemd-udevd Not tainted 6.9.0-rc1-next-20240325-=
1711333827684 #1
> Hardware name: AMD Corporation Shale96/Shale96, BIOS RSH100BD 12/11/2023
> RIP: 0010:usercopy_abort+0x72/0x90
>  __check_heap_object+0xd6/0x110
>  __check_object_size+0x28a/0x2f0
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  __x64_sys_sched_getaffinity+0xda/0x120
>  do_syscall_64+0x76/0x120

> I met similar issue with QEMU boot test, and seems the root cause is
> the 'cpumask' slub object could be copied to user space, and fail
> the usercopy check. With below patch, the panic is gone in my test.

> Could you give it a try?

Hi Feng, tested this patch and works fine for me as well.


> Thanks,
> Feng

---
diff --git a/lib/cpumask.c b/lib/cpumask.c
index f3f68c45caba..dcadcf7adc7c 100644
--- a/lib/cpumask.c
+++ b/lib/cpumask.c
@@ -62,8 +62,8 @@ static struct kmem_cache *cpumask_cache __ro_after_init;

 int __init cpumask_cache_init(void)
 {
-       cpumask_cache =3D kmem_cache_create("cpumask", cpumask_size(), size=
of(long),
-                                         SLAB_HWCACHE_ALIGN, NULL);
+       cpumask_cache =3D kmem_cache_create_usercopy("cpumask", cpumask_siz=
e(), sizeof(long),
+                                         SLAB_HWCACHE_ALIGN, 0, cpumask_si=
ze(), NULL);

        return cpumask_cache ? 0 : -ENOMEM;
 }

