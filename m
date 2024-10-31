Return-Path: <linux-next+bounces-4566-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2298E9B872E
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 00:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A72991F2246A
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 23:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEAD1E8850;
	Thu, 31 Oct 2024 23:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Vumhdn+b"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCB51946BC;
	Thu, 31 Oct 2024 23:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730417637; cv=none; b=Z2hrAa3Wqzn41xRsu6NLnF8lUoH2f8UR/dghmfK/kSActTcH5dBDw1TGNwxX81+8L9svxW3Gsqapj2d6CwtMtyTDfKFf24cZ9mr+VgtDEzq3XZ33c8nhM6Q3wkphT2yCwlbrISmpm20vpgVYwgfY0++KjSQQNCv6K4TmgXN/6ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730417637; c=relaxed/simple;
	bh=PFPAj17fr5E50I7mYzwOfqdjnVAc6utbbyZmfdspRcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ez0dywkqSX9C5kCDps6bIMYl9GT1bAgTLMJY+WdKxTSoFCYkLRo5k+qt2Fbr/27xJvDma8qUV8fOwZ0gzfY0ctMaLuVXI7L46uG3UnnXUS7fz4zcIp3+URYSxhUaHSoL5svaTRzgMAVb5j5SsRzrhCy31M+goKc12vWosZ80Ya8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Vumhdn+b; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730417625;
	bh=ULfr219fFT6RTMgRn1socBeuvq4xWTD7TkOF5M5RpYU=;
	h=Date:From:To:Cc:Subject:From;
	b=Vumhdn+b5ZF7SxvPOJQS93vp1zsX4SMr502krlE5XyEI5g8i4fEe5AUBP5eTNldjF
	 lwq2ye+4hd8iwNGnr9SeHdVvNJb/w4R+hVyoESRxZ5ITPKnTeJwVKUixRnTXi8G9Aj
	 WGA4QWfBC9eKJV0Vo3sQoSFNQ3/81d3/lUUnV1/mS2t0Fh9hwpXz1ic3PIFkfpN2qx
	 6Hdx0fVn89JvmTKD19l8C5gURyVH7ZLWnVPAI5A5ewT0sN0pyjf/iRBTgNBJ4e0rzD
	 FqZavNf/+GjK3sjXhSLdB+LioyNFm8Pl1vg1fTVZ2aqY57dmxfREBN2RP2J/roH0Pu
	 BLvUJxfYM73lg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XfgL03bScz4wcl;
	Fri,  1 Nov 2024 10:33:44 +1100 (AEDT)
Date: Fri, 1 Nov 2024 10:33:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: <jslaby@suse.cz>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Jiri Slaby
 <jirislaby@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the perf tree with Linus' tree
Message-ID: <20241101103345.45340b53@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=SYq.N+NRnJC_YTdDWGjvtC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=SYq.N+NRnJC_YTdDWGjvtC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the perf tree got a conflict in:

  tools/perf/util/syscalltbl.c

between commit:

  5d35634ecc2d ("perf trace: Fix non-listed archs in the syscalltbl routine=
s")

from Linus' tree and commit:

  8c0d1202bad3 ("perf, riscv: Wire up perf trace support for RISC-V")

from the perf tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/perf/util/syscalltbl.c
index 6c45ded922b6,349986f6e5f5..000000000000
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@@ -46,11 -46,10 +46,15 @@@ static const char *const *syscalltbl_na
  #include <asm/syscalls.c>
  const int syscalltbl_native_max_id =3D SYSCALLTBL_LOONGARCH_MAX_ID;
  static const char *const *syscalltbl_native =3D syscalltbl_loongarch;
+ #elif defined(__riscv)
+ #include <asm/syscalls.c>
+ const int syscalltbl_native_max_id =3D SYSCALLTBL_RISCV_MAX_ID;
+ static const char *const *syscalltbl_native =3D syscalltbl_riscv;
 +#else
 +const int syscalltbl_native_max_id =3D 0;
 +static const char *const syscalltbl_native[] =3D {
 +	[0] =3D "unknown",
 +};
  #endif
 =20
  struct syscall {

--Sig_/=SYq.N+NRnJC_YTdDWGjvtC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmckE9kACgkQAVBC80lX
0GwTmwf/RXHn4cqb6ReFFY9M1HNn50C+7wi6yZxlQEyZNB3TxEwjabw/FVtwd2g0
hWiJmw6HXbZZhuHpf3mneKbA4rxQQI756jCW1SG7JW6wiJBfq0I/pQUk0JJ3XPnJ
P7dkAyOvmL8bDNrS3jz9VE6sTtpgzhWrLXRTmOOZm73rujVk1rDhDX3OQA/rkEoH
11tAUHSGq9oClFaXUBQ88rYNUWR5CHosIqGSkqL/2WKk6wvcPryftB+KbpryFgAY
1mJx7I8zRQpjFZyl5quTPNEuwde4y/3YV6AnGm2xeknnuIpWZYRPc8i5Ab2nyD9h
TiNEFQ8R0gwspAy9G4+CIROnG03tWw==
=2fZY
-----END PGP SIGNATURE-----

--Sig_/=SYq.N+NRnJC_YTdDWGjvtC--

