Return-Path: <linux-next+bounces-4988-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 849E19F5DC1
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2024 05:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FEF41893C09
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2024 04:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9DF14A084;
	Wed, 18 Dec 2024 04:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LMYs44pk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8197213775E;
	Wed, 18 Dec 2024 04:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734495192; cv=none; b=rQBspLFMVupWvjCE4AEm2Ls3rQYzLpFU5NAEBy/Oer8fK6rYSw7lZzeHbyasl1SE+3Fh9Vyf9E3lohh/ctd2vK+DNVMrlf7R+NInsJDkS0kWCV3wvobmZ3yY2b19nZbNNhZJhrqTsws3zJ1+vSY6Gn2gJj8s1ajQZ0aiKbYeLG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734495192; c=relaxed/simple;
	bh=VeW7hKbYoVyfTgTpBPObuArnIiSyw3ht0VZqTEpYrVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uVkBW4TJ7FTOE7R03XiMoNX+26cFZmhn+pw/NnGxNTgU6mQcOayOBqLU7HTbIJ0vJw9f44G5+iWkbw3NeeZaLJMVmrbDYxRb3nFwRLrW6xTEM0y/mzxNY9Qu2JUxLZpxhI8MfcAHECWGNCFUeSL3XXh55sQzzgDcl2IOwUHoWXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LMYs44pk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734495178;
	bh=pBtl5rt7W/MWcsLPXHZXe9eilzA4+9cjINp2E4iLv3c=;
	h=Date:From:To:Cc:Subject:From;
	b=LMYs44pkZZTWd0jOhnwWFwB9Nkh0OI3c4ckw9a2n6J+UUa4J7QWz+nIrtT4QwTfXn
	 S+FGFKUnonjoOnBP3zCG9/tUEgxNEkik6lBjJBMeXfcILImWlqKE1qT7yAXdSV9xmP
	 6x0Vlip0t4SD/VNPMJA+tsBVTEF2Ithb8zbQHkPO3TRLgzTf6uJG2ThFu8tTLWrpyz
	 3bJPN4GShHDPB0GtG4Vi771zXEDAxmiC2MsrAfOV+8Q7EzITH/ZkYz9srJInej5dFI
	 pN/1taI5cJU5Mq/m7Fj2GW3bZEgwUvnaNfrRk0SkzuN/e5IcsJUn3DfBF8A5tq0Rhk
	 xD8sA+U+2jpaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCgJV39Zwz4wcn;
	Wed, 18 Dec 2024 15:12:58 +1100 (AEDT)
Date: Wed, 18 Dec 2024 15:13:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Juergen Gross <jgross@suse.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the origin tree
Message-ID: <20241218151302.788bd289@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T=YpjAn9YHCy5z7U0FKCzG/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/T=YpjAn9YHCy5z7U0FKCzG/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the origin tree, today's linux-next build (i386 defconfig)
failed like this:

x86_64-linux-gnu-ld: arch/x86/kernel/static_call.o: in function `__static_c=
all_update_early':
static_call.c:(.noinstr.text+0x15): undefined reference to `static_call_ini=
tialized'

In case it matters, this is a PowerPC hosted cross build.

Presumably caused by commit

  0ef8047b737d ("x86/static-call: provide a way to do very early static-cal=
l updates")

static_call_initialized is defined in kernel/static_call_inline.c which is
only built if HAVE_STATIC_CALL_INLINE is defined and that is only selected
if HAVE_OBJTOOL is defined and that is only selected if X86_64 is defined.

I have applied the following hack for today - probably something better
can be done.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 18 Dec 2024 15:05:03 +1100
Subject: [PATCH] fix up for "x86/static-call: provide a way to do very early
 static-call updates"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/kernel/static_call.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/static_call.c b/arch/x86/kernel/static_call.c
index 9eed0c144dad..dca440b18b9f 100644
--- a/arch/x86/kernel/static_call.c
+++ b/arch/x86/kernel/static_call.c
@@ -176,7 +176,9 @@ noinstr void __static_call_update_early(void *tramp, vo=
id *func)
 {
 	BUG_ON(system_state !=3D SYSTEM_BOOTING);
 	BUG_ON(!early_boot_irqs_disabled);
+#ifdef CONFIG_HAVE_STATIC_CALL_INLINE
 	BUG_ON(static_call_initialized);
+#endif
 	__text_gen_insn(tramp, JMP32_INSN_OPCODE, tramp, func, JMP32_INSN_SIZE);
 	sync_core();
 }
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/T=YpjAn9YHCy5z7U0FKCzG/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdiS84ACgkQAVBC80lX
0GxD/Af/bZ7H+T0kA7sWMLUUY01jEHBmai/8sf9BDXACaxLBqcsLfgwWGEVAJAaS
L83XnW8KUJU14FvEUEUULGO3RYqgczf7ih3KbnTkivhKtdYFrOjlWy3Zlrlw2jAF
kqGNTWqudHzDiTZM0WfWPfOBH1YDhd/7omkOXZO/rL8ENy106oX3kRonZ6c4tYEN
9mHOxZm7UNex1Ihm2Cphw3tFF58MsOTmmc16oWJbVmpQU7kRLBTr5ksFG4wQzsQq
tCQYJvCP8hoPD4QDm1iME+ycdJ3nmoUo3mP/vGYt7BOQ6ZUIJCWUI3uXZx26q8cu
ln5pXiXsZEPPPzg77df9oVbYck9ohA==
=7HqD
-----END PGP SIGNATURE-----

--Sig_/T=YpjAn9YHCy5z7U0FKCzG/--

