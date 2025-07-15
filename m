Return-Path: <linux-next+bounces-7540-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC73B04E9F
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 05:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47D844A4398
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 03:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349CE2D0C79;
	Tue, 15 Jul 2025 03:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jtNyAYps"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBAE80B;
	Tue, 15 Jul 2025 03:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752549658; cv=none; b=L99j1chjnNOSBeuzab49vmRR3jA+yoQw6Ka7E4cQPYyuEWBEKGko95GGADlDiteC2r0SUVUKakOva50xnqMZL9j98fnzIYw4TGLM+88sw6z3kUrdaUHCFNQ74YLhW7ugy6ZPTkHWFhU7+r7em1FR+sltDdrC0iPvxPHOTQi16EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752549658; c=relaxed/simple;
	bh=M6zzaEdA7Yoaj1wVjRWHjo1L/FJpqf9aLpUQOpDIhvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nzhX4Uf1ew9Q6P5MGCTrz+6JzOeJsWlfLQ99jQ8N2fwZpZe04H9J7L7D141Id4zroPJnkaXzMHd08rhWCTe7dWwDaB0yG2R9B819K+nPLUctTLWlEiXxNuLhSCP+ir2+kULueAKeZZJhwhV+nZjLtjIaDeblxgQ3gINcNPSHg04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jtNyAYps; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752549545;
	bh=U/ahC+c5V1A9bMBBbUoGlEVMsa+F2/kjHGLLn9AOLWo=;
	h=Date:From:To:Cc:Subject:From;
	b=jtNyAYpsFHAV8aOaOVOhpmgitFunB8Mww541v87vvKhSrusWMt5a2m9RuOp10Tysz
	 4ArdeoSr139Wzqsix27jKIJgOcA7mXGpOHTswf9I4ozkd7YL900bJCCV1bEtIn3WmE
	 J6KYGxIKiogWQKQXnPlsY9bhymXq2o/2MiGiDgPoCq9NfM5hvKhWsnp7yPLW98ls6G
	 EuuEoqr9v4StNRRQepyCoFdAQsEI62WBR1jHJXg9GsY/ImHZNS/IGGzArrdCYA3Zbq
	 T+s1ZUSQCaYJPD6XA0p2h0xMLyVMBxtSO8eJk9VGhL2qlohT71N0MyBNF2dOY0elmA
	 xgoe3I79XS0QQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bh4Cr4Y2lz4wb0;
	Tue, 15 Jul 2025 13:19:04 +1000 (AEST)
Date: Tue, 15 Jul 2025 13:20:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Linux Crypto List
 <linux-crypto@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the libcrypto tree with Linus' tree
Message-ID: <20250715132051.4b4ce028@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yeHmtDZi3DL4jT0QFGbocQw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yeHmtDZi3DL4jT0QFGbocQw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the libcrypto tree got a conflict in:

  arch/s390/crypto/sha1_s390.c

between commit:

  68279380266a ("crypto: s390/sha - Fix uninitialized variable in SHA-1 and=
 SHA-2")

from Linus' tree and commit:

  377982d5618a ("lib/crypto: s390/sha1: Migrate optimized code into library=
")

from the libcrypto tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/yeHmtDZi3DL4jT0QFGbocQw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh1yRMACgkQAVBC80lX
0Gz8YQf+Lc0kbHvsXNgmk9e/BdVXxff4M5cY1sdAq5uUtjpibKXlMY/rTHA5vyoC
ewgs8jfiM6OqEQjUqVtyur7Dg2YyTIhvhObc1UQ/vYN9eQfA+IRuE6KCW1eP8lTj
ILoLy/1nG/r8TfE1Jqkt8EYuwBBC+7A8ExnZ3DfTRPZFeKPYjMtgmT9+4mX9OuQ1
gZQgfcYElPDQ0jt7so3fchm1eMqjqtlkdu/mNKN7vCc1g5ZPziA/XHRYCXyvvyPt
tDDd7fHd0FPeMsXs+H4NdsaNhlP7ujWOTI5TM6vTmWVP9WQl9ull6lPPyS7kqamn
OwF0h2mE39EtqfWbef43SHMP+veueA==
=jtEL
-----END PGP SIGNATURE-----

--Sig_/yeHmtDZi3DL4jT0QFGbocQw--

