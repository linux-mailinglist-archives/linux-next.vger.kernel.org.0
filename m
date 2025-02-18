Return-Path: <linux-next+bounces-5476-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5393DA39267
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 06:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FC1A3A6688
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 05:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD251B0403;
	Tue, 18 Feb 2025 05:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YgaXaIwI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AA21AC882;
	Tue, 18 Feb 2025 05:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739855278; cv=none; b=LBjZcyxFoR0+JPVnICsB4OoFAqqAgFo0lF5ClUygIhbNoaumhU+hcGEiySNVDPhira9lSr7WXXioW39JE258qj7kBXloK4t0UcGCk7NkpekbhroYHxz/wDVyASWTzFmTNLL1cFK/trfdBk3EuC6wVwaYvKCmieN0aMs0WneFQ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739855278; c=relaxed/simple;
	bh=z/6JA4eNoed8CZkrnBDxJDBqVf8SQDJUgT8/uSsYtK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jVatvONrBvshcWZ12hsVM60t5SNT0fRfucXtoe/NKqk66y6DTyUD+6UofXLVDSUtDuu9uNSD9S3xjF8hCQj2M0jICHStUk0O5kibgmCGgOYMbMv9e6o0S+ZRRb1hT9YYFAsUs1FKQnzhRX6buvHr5Xnv8gYDlX+cGi7mUsGZ9gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YgaXaIwI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739855264;
	bh=5LIOKZ2TM0YfxcjNlKCXnCn+7rZf/CA6PMGHhfYZysY=;
	h=Date:From:To:Cc:Subject:From;
	b=YgaXaIwIVm6vbNYGnvKc3hWD4TwsJ4hBRFWpfmUGuB/Ijh1hUDLFWVAFV8o7CQrq4
	 AptfgmYg6ZyJwfxZBsrjVNvwS0Z33dMyfs+2sXL2hXruCBa7sbGbPCskg+/fkPQY/+
	 OIu2Kec/2t+ZAYESrxVfp42tIsU69Z9k06IEkBQz3hWiM2FcYgq9xJRCu+seIEmOq7
	 Ag0ZTrB8GDqdiCVhN1Bdzvh6qlI2wmZUpcp1uiddjuTX5oPkG4+mZqSPug/j/XDH6J
	 NiRaVgT6LuKYfoZtsonQl3DFtmtFSKzLzTkwBII5VeSJGUx/xpebjhAcKjmby+Dfn3
	 EOk+vf4iGxV3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yxnb4086Gz4wcr;
	Tue, 18 Feb 2025 16:07:43 +1100 (AEDT)
Date: Tue, 18 Feb 2025 16:07:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Beata Michalska <beata.michalska@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bitmap tree
Message-ID: <20250218160742.49d6ab76@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gKNUyiP8KO/XVe8SLNQ1Q6d";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gKNUyiP8KO/XVe8SLNQ1Q6d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bitmap tree, today's linux-next build (arm64 defconfig)
failed like this:

arch/arm64/kernel/topology.c: In function 'arch_freq_get_on_cpu':
arch/arm64/kernel/topology.c:270:43: error: too many arguments to function =
'cpumask_next_wrap'
  270 |                                 ref_cpu =3D cpumask_next_wrap(ref_c=
pu, policy->cpus,
      |                                           ^~~~~~~~~~~~~~~~~
In file included from arch/arm64/include/asm/cpufeature.h:27,
                 from arch/arm64/include/asm/ptrace.h:11,
                 from arch/arm64/include/asm/irqflags.h:9,
                 from include/linux/irqflags.h:18,
                 from include/linux/spinlock.h:59,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:7,
                 from include/linux/slab.h:16,
                 from include/linux/resource_ext.h:11,
                 from include/linux/acpi.h:13,
                 from arch/arm64/kernel/topology.c:14:
include/linux/cpumask.h:317:14: note: declared here
  317 | unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
      |              ^~~~~~~~~~~~~~~~~

Caused by commits

  46ac1bec179d ("cpumask: deprecate cpumask_next_wrap()")
  43f7f920e14e ("cpumask: re-introduce cpumask_next{,_and}_wrap()")
  65b98ea8b278 ("cpumask: drop cpumask_next_wrap_old()")

interacting with commit

  dd871ac1237f ("arm64: Provide an AMU-based version of arch_freq_get_on_cp=
u")

from the arm64 tree.

I have applied the following patch for today (which may not be correct).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 18 Feb 2025 15:44:06 +1100
Subject: [PATCH] fixup for "cpumask: drop cpumask_next_wrap_old()"

interacting with commit

  dd871ac1237f ("arm64: Provide an AMU-based version of arch_freq_get_on_cp=
u")

from the arm64 tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm64/kernel/topology.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 6f0cab8e746b..70db234c41a2 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -231,7 +231,6 @@ void arch_cpu_idle_enter(void)
 int arch_freq_get_on_cpu(int cpu)
 {
 	struct amu_cntr_sample *amu_sample;
-	unsigned int start_cpu =3D cpu;
 	unsigned long last_update;
 	unsigned int freq =3D 0;
 	u64 scale;
@@ -267,8 +266,7 @@ int arch_freq_get_on_cpu(int cpu)
=20
=20
 			do {
-				ref_cpu =3D cpumask_next_wrap(ref_cpu, policy->cpus,
-							    start_cpu, false);
+				ref_cpu =3D cpumask_next_wrap(ref_cpu, policy->cpus);
=20
 			} while (ref_cpu < nr_cpu_ids && idle_cpu(ref_cpu));
=20
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/gKNUyiP8KO/XVe8SLNQ1Q6d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme0FZ4ACgkQAVBC80lX
0Gw+/Qf/cOZpqJjjGT6gzRR7os4wyXCTQzcnm1R6jYQCafvqwaGBch7H8AnTX7G2
N7oqfoIHdMJQtG+hpL4yBZhitsuX0CMrCGDsV6oIURF6qSjmwVVNCHCYf6r5kWu0
uEYU2yNPoxAoTdDEFf/WKztMrSQ+JTrGrEqF4cPQcyNO9N7ECeXxYNs46i/cacMX
muB/K03pA3ot3ELXzL1gTBYs3iK0u7F7GwGMtf6T3rxUap4uWYF/anlkWm2P5ysM
Nr6KMOXKn2caXNOZogjqVX6hzWfpZDjqLaCI8ZL8iUsoy0YZh2g2/Y0aY34M2MUM
tAAXUt/ar2bQGvNXOohpjXwEqe1ytQ==
=Q9MW
-----END PGP SIGNATURE-----

--Sig_/gKNUyiP8KO/XVe8SLNQ1Q6d--

