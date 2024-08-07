Return-Path: <linux-next+bounces-3248-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE05949E2F
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2024 05:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED6A41F236DE
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2024 03:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216B31A288;
	Wed,  7 Aug 2024 03:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nWrcy5c/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2565D1E495;
	Wed,  7 Aug 2024 03:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723000458; cv=none; b=SlLAF/7765LmK+/xcZP04CR8O3PfWHce6gRbRTWPbG7xergVKXgcqbImEDIZchfmTOvartAHaHqnNt9lf4pbnqZJ/PiPsnXvZp13W8yr9v/xLeBOFlnj12RBhHYLoqrx017RdHt/XveZosaL2tmZ14O9wYo+78b/fU0gqGnbptY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723000458; c=relaxed/simple;
	bh=cMx1IOY71AED7TDikDFHPkAfymF6/0uPgI4EdMhJWBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Vs20/ebqrd12JwquqljLPohx4CDIO3JC2tQ5W+jkFH9rLcjc6VLfLE91cQQtGEQnYbG1pwTXF7Bszs1XtnRxqyxFxNSptaSKAa0IibUdKGe+ggmWNkU+Vh6mbht53OSSIvewtEr9arQyBNavGzBAXaNxXOK2IeqeKZKQJHSzKoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nWrcy5c/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723000449;
	bh=JdpwTuR4ku4UOe2zZ0+rUH2K0oLdY3dPpv1PrgnHu5g=;
	h=Date:From:To:Cc:Subject:From;
	b=nWrcy5c/RqyDghJVD5T28iI6f8v7HicANCZjT2/jd9hOzGaoV7Ijkan6QRpOULFUN
	 t00O/JlSGLjIimtXMQ0eX2UrLCrSDQ3cCskXtjBPeOJZzh4StqtkAKt1+yhSGUAwIa
	 tG08okERTyafFYg7fgdgSdkq4tzilIuMAsO5mOK2P4bKwPTWhw1cvyGk0VIjVzFMps
	 o6Q9tE1SuXPlXBUg5Zh8Jm6EGfmN45UpQTplBPx1kl2jXA/iDVkDJhTAJY7WpNlbTX
	 gU8ZqZ4NH0FktvP7NJD+fN0VFUNhvGDIKzyDk0A0oRxv+mfpmC3oPVbPJDKgRmJkcQ
	 RnQ5/BaoqiSDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WdwHz54fcz4w2J;
	Wed,  7 Aug 2024 13:14:07 +1000 (AEST)
Date: Wed, 7 Aug 2024 13:14:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Jini Susan George
 <jinisusan.george@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Roman Kisel <romank@linux.microsoft.com>,
 Vignesh Balasubramanian <vigbalas@amd.com>
Subject: linux-next: manual merge of the execve tree with the tip tree
Message-ID: <20240807131405.10e3665d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k8V+4_H9rEjtB4OPIlXNg03";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/k8V+4_H9rEjtB4OPIlXNg03
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the execve tree got a conflict in:

  fs/binfmt_elf.c

between commit:

  ba386777a30b ("x86/elf: Add a new FPU buffer layout info to x86 core file=
s")

from the tip tree and commit:

  fb97d2eb542f ("binfmt_elf, coredump: Log the reason of the failed core du=
mps")

from the execve tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/binfmt_elf.c
index 01bcbe7fdebd,bf9bfd1a0007..000000000000
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@@ -2092,20 -2102,28 +2102,28 @@@ static int elf_core_dump(struct coredum
  			phdr.p_flags |=3D PF_X;
  		phdr.p_align =3D ELF_EXEC_PAGESIZE;
 =20
- 		if (!dump_emit(cprm, &phdr, sizeof(phdr)))
+ 		if (!dump_emit(cprm, &phdr, sizeof(phdr))) {
+ 			coredump_report_failure("Error emitting program headers");
  			goto end_coredump;
+ 		}
  	}
 =20
- 	if (!elf_core_write_extra_phdrs(cprm, offset))
+ 	if (!elf_core_write_extra_phdrs(cprm, offset)) {
+ 		coredump_report_failure("Error writing out extra program headers");
  		goto end_coredump;
+ 	}
 =20
  	/* write out the notes section */
- 	if (!write_note_info(&info, cprm))
+ 	if (!write_note_info(&info, cprm)) {
+ 		coredump_report_failure("Error writing out notes");
  		goto end_coredump;
+ 	}
 =20
 -	/* For cell spufs */
 +	/* For cell spufs and x86 xstate */
- 	if (elf_coredump_extra_notes_write(cprm))
+ 	if (elf_coredump_extra_notes_write(cprm)) {
+ 		coredump_report_failure("Error writing out extra notes");
  		goto end_coredump;
+ 	}
 =20
  	/* Align to page */
  	dump_skip_to(cprm, dataoff);

--Sig_/k8V+4_H9rEjtB4OPIlXNg03
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmay5n0ACgkQAVBC80lX
0GwVegf/fFeUd296KoCVxdwGEso6Jix/wz8vJOdBfqeF9khsodIWfYX68sh5jz/z
8QTVOqp0dAALEkUCymuTcu4H4Irjem7Ugq4heBQKqiU8xnpj0BydlGbqr5Ku+w6M
eO5G+MmCP7hgbO7eVb7Xe0KYZCr8liFd5LN6McSamzukJrZIWx1XyMCuKoFED6Ww
BqcgGnqBy77m4qRxWAZPHGYna+8MLC9fNzCewvubOsmtePhzJsKP6z2poQwm3gn1
H/WPWOxpTtOBsY8AZGkAdJlxJm0qCwhvgZqDj+tMk96aDcKLiYpHH9VVr2Ym+2Cg
KNRrDg8d31XtVxrsWRM3KQbU0Ohaqg==
=Lt+L
-----END PGP SIGNATURE-----

--Sig_/k8V+4_H9rEjtB4OPIlXNg03--

