Return-Path: <linux-next+bounces-4632-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD34C9BDD65
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 04:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 699FC2845A3
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 03:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AF118D63A;
	Wed,  6 Nov 2024 03:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ASsBZCc8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A604523A;
	Wed,  6 Nov 2024 03:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730862261; cv=none; b=Xo/Wx4PhSv9PkP0it5ECPXG5m70rmNNroiJJGwyazu2gOU185T9HSBtP8NR+ZlGx/GVG7ll6Qnv+sOqeJYJZ1VhOP+CpbryBh+FfYZ0fdTaS24z42hooZ/swGxz6qmkUE0z2UjcWupHmMgslPMKRzM1TYGl6tEpbGsW5aCjBiPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730862261; c=relaxed/simple;
	bh=BgZepueDaRZ0YNTrEPqaFTJQmJhrFz7AjejiDrgQ3bc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VBXLOnxemIFcJQ63l6+BbkHgkNxJMUv1smm5KR8X3XR0Mm2VhBJsmve8bj4J6Z0otg5r9eNP0ozsnfLh5Vo8TaXu4/x8yxe9Gv4qyt40hcqixx7KyHi3R3V22lI9r+CG46XdbDW4xS7Bfv7pnxPF8Mgg7B8RTeUdIBwufu88D1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ASsBZCc8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730862253;
	bh=s9b01BRLDdx+kydfCLwn4XCUIydahSsmU7oeUYqYYTY=;
	h=Date:From:To:Cc:Subject:From;
	b=ASsBZCc8TzsAp7qXjbYNsz7PBkvTpDSMiN2C7d9onxvhX5UDPq6PPHCMrFHtM5HsI
	 L3EOVz2OMqt9X+RTnHQypBagY0xKe0ilgsF8gOGr51aTfp/p9fteWIjYUsXKvnIWtr
	 VELWK/5iY7YkD0J2Tn9e0bHkZ1/wj8bi6xtp/EZ3iTeM3SJ+ac3cAlpJ/IhL3Nce5V
	 RGSV5ObhVWA7GR4UpZecMsb5MdMImtLK2gqjuL4/sfgsV6WuyTztQnmQ6aVUt1FXPi
	 BsTD+4DYNHlbO9xupcd9OglgedffGBbgjSDlO+4E5r4ElTmi/N/iNR/ChvFIJXbEQ0
	 J2UjtRmWab9lg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XjqmY0lBsz4x7D;
	Wed,  6 Nov 2024 14:04:12 +1100 (AEDT)
Date: Wed, 6 Nov 2024 14:04:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Naveen N Rao <naveen@kernel.org>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ftrace tree
Message-ID: <20241106140414.760b502c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DAq6YdHv5B=ZCDY1RGE2RU.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DAq6YdHv5B=ZCDY1RGE2RU.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/ftrace.h:23,
                 from include/linux/kvm_host.h:32,
                 from arch/powerpc/include/asm/kvm_ppc.h:19,
                 from arch/powerpc/include/asm/dbell.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:36:
arch/powerpc/include/asm/ftrace.h: In function 'arch_ftrace_set_direct_call=
er':
arch/powerpc/include/asm/ftrace.h:141:38: error: invalid use of undefined t=
ype 'struct ftrace_regs'
  141 |         struct pt_regs *regs =3D &fregs->regs;
      |                                      ^~

Caused by commit

  7888af4166d4 ("ftrace: Make ftrace_regs abstract from direct use")

interacting with commit

  a52f6043a223 ("powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT=
_CALLS")

from the powerpc tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 6 Nov 2024 13:33:53 +1100
Subject: [PATCH] fix up for "ftrace: Make ftrace_regs abstract from direct =
use"

from the ftrace tree interacting with "powerpc/ftrace: Add support for
DYNAMIC_FTRACE_WITH_DIRECT_CALLS" from the powerpc tree

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/ftrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/f=
trace.h
index bb2c90997618..db481b336bca 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -138,7 +138,7 @@ unsigned long ftrace_call_adjust(unsigned long addr);
  */
 static inline void arch_ftrace_set_direct_caller(struct ftrace_regs *fregs=
, unsigned long addr)
 {
-	struct pt_regs *regs =3D &fregs->regs;
+	struct pt_regs *regs =3D &arch_ftrace_regs(fregs)->regs;
=20
 	regs->orig_gpr3 =3D addr;
 }
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/DAq6YdHv5B=ZCDY1RGE2RU.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcq3K4ACgkQAVBC80lX
0Gw0JAf7Bq9qv+tbPiKn8tlsulBba4WywVS6jwuTJH64TQY2YwCql1EcSviO8v/E
+6rw8LM0Xx0lljiKx38noD4SJghE34EGMO0w5/X6SFUengJ10pMu/3mihJM681r9
BVlfSqqxR3PMNBQ45oYxTb5zz8yM9rKf/uWzTcumEx824K3Apx3Kd3vG5go6P4sd
gj9b9YOV6tM46s70zfIJJiarINvA5pbteoMPa20C//GSk5nyj993AVBlQxYarYTn
dRSekAWryp9OhN+R5FzgTWyy6cpD6fGssnNRmGnB76DuHdYdvxy2NYLmFlGv0ZGS
9Rj+q+p9bVVvNjqzPjlVbgfzp8zJ7w==
=J8sY
-----END PGP SIGNATURE-----

--Sig_/DAq6YdHv5B=ZCDY1RGE2RU.--

