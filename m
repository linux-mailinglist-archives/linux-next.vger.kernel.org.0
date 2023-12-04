Return-Path: <linux-next+bounces-225-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6325880414B
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 23:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A2D280FF5
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 22:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C380C39FEF;
	Mon,  4 Dec 2023 22:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rYNVpU5g"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2933A130;
	Mon,  4 Dec 2023 14:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701727549;
	bh=u8QKEqgw1lWdKU3HMKBvExEXQRW3gD1GYo/TOI2dnVQ=;
	h=Date:From:To:Cc:Subject:From;
	b=rYNVpU5gDOwPj9MLTqFCXrSxqDVlrr9QhKy+BhH5e/DSmjhlxnItTHuaSoeyW+BHb
	 VidrYmogBlsIB6T+n7kunyclCOJEzHs49cWfQ1QDCQcbMJGg4X3Ijf1vZ6PDC/DTmq
	 KDyDQ2DQlu/ZlT9omhmV1r8XIyWIk8equsFbajr+/jkFDQeYWJrOPmAFXEoBJjj0Sn
	 gVXWo/th/EmdNJgN02axPWySgLa+eAVgdFNdFzp+qXNclR3BNhvX4U/g5VRqxp1c+7
	 1WF94bCMmwIjmvmHqZqLhkfC+vWkR4b4NxsvcCN/fB5Njkjg1fPTHCBAaYtcGILNDu
	 t0EVpllixZ08Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Skd5m74Vlz4x5M;
	Tue,  5 Dec 2023 09:05:48 +1100 (AEDT)
Date: Tue, 5 Dec 2023 09:05:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the asm-generic tree with the mm tree
Message-ID: <20231205090546.7dffe3aa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VBYqBJXGz5xwbMxQnhHuZk9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VBYqBJXGz5xwbMxQnhHuZk9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the asm-generic tree got a conflict in:

  arch/mips/include/asm/traps.h

between commit:

  6b281b05cbcc ("mips: add missing declarations for trap handlers")

from the mm tree and commit:

  23f8c1823bd4 ("arch: add do_page_fault prototypes")

from the asm-generic tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/mips/include/asm/traps.h
index 2c2b26f1e464,d4d9f8a8fdea..000000000000
--- a/arch/mips/include/asm/traps.h
+++ b/arch/mips/include/asm/traps.h
@@@ -39,28 -39,7 +39,30 @@@ extern char except_vec_nmi[]
  	register_nmi_notifier(&fn##_nb);				\
  })
 =20
 +asmlinkage void do_ade(struct pt_regs *regs);
 +asmlinkage void do_be(struct pt_regs *regs);
 +asmlinkage void do_ov(struct pt_regs *regs);
 +asmlinkage void do_fpe(struct pt_regs *regs, unsigned long fcr31);
 +asmlinkage void do_bp(struct pt_regs *regs);
 +asmlinkage void do_tr(struct pt_regs *regs);
 +asmlinkage void do_ri(struct pt_regs *regs);
 +asmlinkage void do_cpu(struct pt_regs *regs);
 +asmlinkage void do_msa_fpe(struct pt_regs *regs, unsigned int msacsr);
 +asmlinkage void do_msa(struct pt_regs *regs);
 +asmlinkage void do_mdmx(struct pt_regs *regs);
 +asmlinkage void do_watch(struct pt_regs *regs);
 +asmlinkage void do_mcheck(struct pt_regs *regs);
 +asmlinkage void do_mt(struct pt_regs *regs);
 +asmlinkage void do_dsp(struct pt_regs *regs);
 +asmlinkage void do_reserved(struct pt_regs *regs);
 +asmlinkage void do_ftlb(void);
 +asmlinkage void do_gsexc(struct pt_regs *regs, u32 diag1);
 +asmlinkage void do_daddi_ov(struct pt_regs *regs);
 +
 +asmlinkage void cache_parity_error(void);
 +asmlinkage void ejtag_exception_handler(struct pt_regs *regs);
 +asmlinkage void __noreturn nmi_exception_handler(struct pt_regs *regs);
+ asmlinkage void do_page_fault(struct pt_regs *regs,
+ 	unsigned long write, unsigned long address);
 =20
  #endif /* _ASM_TRAPS_H */

--Sig_/VBYqBJXGz5xwbMxQnhHuZk9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVuTToACgkQAVBC80lX
0GxyXAf/Z9tKTD17hXu4lNOF7mgeQmQ87sTn6cPQMIbZ0CfAGBbNVpWC3mirSzEB
gOOUxEvgiSLEv36vioe0StTQ73olGDc0by2m7GhXGb0g9pTG9xAxUUFW6AHnhMLU
MoDEORA+Ns1IkXmkB6ECsu4dm2dj1lAYU6eq7KxjFgUOdgWV8uGvMhqONxCOMHCr
phb19Tny/PZXnDiDM1ADXx2+Csz+P6K0posY7v96dM15VbL4UyloKWxwbCA4o+2i
+VR6lDQ+Mdf2qZPU3z0kg9cekp9Y26tns58mnLwE91gIzCoRwfJYdDyIr/+5iY5z
WRpT6zggimGtMevFmdQ5IOwrrZt0GQ==
=W7Pp
-----END PGP SIGNATURE-----

--Sig_/VBYqBJXGz5xwbMxQnhHuZk9--

