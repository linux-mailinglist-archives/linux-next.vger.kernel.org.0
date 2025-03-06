Return-Path: <linux-next+bounces-5670-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B3EA546F2
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 10:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E8177A04AD
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 09:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A66E209F38;
	Thu,  6 Mar 2025 09:56:38 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A2E2080D4;
	Thu,  6 Mar 2025 09:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254998; cv=none; b=TZvFCtZRV0W5a81X3A8V3FuMFcrY/CMC3sAQy/F8tDbpVWjTSqtribcmmEsw3Xx+4GjN39jil3iE3KJWQ3PQ0naZvfcn60g9ijqrTGHceMR5bSAivVFufRvC7jHGmOqNR79FXqXMPMqajbeTjCsZeRv2Pgt5+VRqlNK3Og/DaM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254998; c=relaxed/simple;
	bh=immmqccZpgWh0VqDZp5BiUC+ppJSTASF8em54h17xLQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LPMUnrB/NzB06zLqwMkYRyGzkPcFcvfvYr9fje6W36E1pJ2qd30FowZD8oyMNVugNPpJn76pWzBY4scE5+EObwaa7JLwqnLnicZE4OzeHWgR8cMjCxRmPoAaN5E0iD4U8z9EMselSfXkPxFSoQ15nQ3MFOUapMCsJehCvJSqPYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z7lBH3LRGz6K9Q3;
	Thu,  6 Mar 2025 17:54:15 +0800 (CST)
Received: from frapeml100008.china.huawei.com (unknown [7.182.85.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 54B2C140159;
	Thu,  6 Mar 2025 17:56:33 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100008.china.huawei.com (7.182.85.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Mar 2025 10:56:33 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 6 Mar 2025 10:56:33 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christoffer Dall
	<cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>
CC: Oliver Upton <oliver.upton@linux.dev>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the kvm-arm tree
Thread-Topic: linux-next: build failure after merge of the kvm-arm tree
Thread-Index: AQHbjlsd0TXa7xMo1EGEgdIX5w5serNl3gnw
Date: Thu, 6 Mar 2025 09:56:32 +0000
Message-ID: <6027e05e03474a87826217ee56f12761@huawei.com>
References: <20250306164614.4ccb2e9d@canb.auug.org.au>
In-Reply-To: <20250306164614.4ccb2e9d@canb.auug.org.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Thursday, March 6, 2025 5:46 AM
> To: Christoffer Dall <cdall@cs.columbia.edu>; Marc Zyngier
> <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>; Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; Linux Kernel Mailing List
> <linux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-
> next@vger.kernel.org>
> Subject: linux-next: build failure after merge of the kvm-arm tree
>=20
> Hi all,
>=20
> After merging the kvm-arm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/firmware/smccc/kvm_guest.c:58:14: warning: no previous prototype
> for 'kvm_arm_target_impl_cpu_init' [-Wmissing-prototypes]
>    58 | void  __init kvm_arm_target_impl_cpu_init(void)
>       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/firmware/smccc/kvm_guest.c: In function
> 'kvm_arm_target_impl_cpu_init':
> drivers/firmware/smccc/kvm_guest.c:89:39: error: invalid application of
> 'sizeof' to incomplete type 'struct target_impl_cpu'
>    89 |         target =3D memblock_alloc(sizeof(*target) * max_cpus,
> __alignof__(*target));
>       |                                       ^
> drivers/firmware/smccc/kvm_guest.c:89:62: error: invalid application of
> '__alignof__' to incomplete type 'struct target_impl_cpu'
>    89 |         target =3D memblock_alloc(sizeof(*target) * max_cpus,
> __alignof__(*target));
>       |                                                              ^~~~=
~~~~~~~
> drivers/firmware/smccc/kvm_guest.c:102:23: error: invalid use of undefine=
d
> type 'struct target_impl_cpu'
>   102 |                 target[i].midr =3D res.a1;
>       |                       ^
> drivers/firmware/smccc/kvm_guest.c:102:26: error: invalid use of undefine=
d
> type 'struct target_impl_cpu'
>   102 |                 target[i].midr =3D res.a1;
>       |                          ^
> drivers/firmware/smccc/kvm_guest.c:103:23: error: invalid use of undefine=
d
> type 'struct target_impl_cpu'
>   103 |                 target[i].revidr =3D res.a2;
>       |                       ^
> drivers/firmware/smccc/kvm_guest.c:103:26: error: invalid use of undefine=
d
> type 'struct target_impl_cpu'
>   103 |                 target[i].revidr =3D res.a2;
>       |                          ^
> drivers/firmware/smccc/kvm_guest.c:104:23: error: invalid use of undefine=
d
> type 'struct target_impl_cpu'
>   104 |                 target[i].aidr =3D res.a3;
>       |                       ^
> drivers/firmware/smccc/kvm_guest.c:104:26: error: invalid use of undefine=
d
> type 'struct target_impl_cpu'
>   104 |                 target[i].aidr =3D res.a3;
>       |                          ^
> drivers/firmware/smccc/kvm_guest.c:107:14: error: implicit declaration of
> function 'cpu_errata_set_target_impl' [-Wimplicit-function-declaration]
>   107 |         if (!cpu_errata_set_target_impl(max_cpus, target)) {
>       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/firmware/smccc/kvm_guest.c:116:37: error: invalid application of
> 'sizeof' to incomplete type 'struct target_impl_cpu'
>   116 |         memblock_free(target, sizeof(*target) * max_cpus);
>       |                                     ^
>=20
> Caused by commit
>=20
>   86edf6bdcf05 ("smccc/kvm_guest: Enable errata based on implementation
> CPUs")
>=20
> I have used the kvm-arm tree from next-20250305 for today.

Thanks for reporting this.

Hmm..kvm_guest.c gets build through HAVE_ARM_SMCCC_DISCOVERY=20
which is selected by ARM_GIC_V3.

We could limit the kvm_arm_target_impl_cpu_init() to ARM64 to fix this
like below as these hypercall is only supported for KVM/ARM64.

Or is there a better way to handle this?

Thanks,
Shameer

---8---
diff --git a/drivers/firmware/smccc/kvm_guest.c
b/drivers/firmware/smccc/kvm_guest.c
index 2f03b582c298..5767aed25cdc 100644
--- a/drivers/firmware/smccc/kvm_guest.c
+++ b/drivers/firmware/smccc/kvm_guest.c
@@ -55,6 +55,7 @@ bool kvm_arm_hyp_service_available(u32 func_id)
 }
 EXPORT_SYMBOL_GPL(kvm_arm_hyp_service_available);

+#ifdef CONFIG_ARM64
 void  __init kvm_arm_target_impl_cpu_init(void)
 {
        int i;
@@ -115,3 +116,4 @@ void  __init kvm_arm_target_impl_cpu_init(void)
 mem_free:
        memblock_free(target, sizeof(*target) * max_cpus);
 }
+#endif



