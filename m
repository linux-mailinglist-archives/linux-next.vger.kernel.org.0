Return-Path: <linux-next+bounces-8866-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E125CC39030
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 04:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 419E64FC4CF
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 03:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F38C245021;
	Thu,  6 Nov 2025 03:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mXIUTRwj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EDB23BF9F;
	Thu,  6 Nov 2025 03:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762400189; cv=none; b=TPpgv6dMfyt8okHUNKC42Um1n84ZKD+v762mm6X4LPXZNXwtV+PJylR9vVqypWOpC3YkaCkhBeXEsv23x1EmmWmyYD5QWCSayFfgccqlOhwYv7yZZ2kO2LOlg/RfliGSOWf3m3zHhce3p/XPK5ADUfE38ZNfEHtANgk71omMGqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762400189; c=relaxed/simple;
	bh=GNM7TCeMHbwIbYlXWuHY4qz5dEcc72V8VdoUKhsYSsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LoS5aUao/h+PGY1kxqdVZc9sZdkPW3V4e8+DrjIcpyKy5NlUegTAcIdAFYAmDanBPZ9KfoFogSdVLhYT1PdgF1lRxoZsCoAly6Vc8qDsgT4JAFZY8ziPJMmuqplB75ZbeDDNROtAfrHSWrug8fZ7ihEs8L1klsVur/aqo7KVuOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mXIUTRwj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762400184;
	bh=EjP3pLW0Hcin6KAIIE0/ZI3uWOTZ9EvwyI5DnmbVOgY=;
	h=Date:From:To:Cc:Subject:From;
	b=mXIUTRwjvyfoaT1qpKJjFktIOET6zUTl1eSSFcdChHaZmjqermjpYZ678K8sJXE3V
	 g66M+CHSEW+BDoClmA5cVzq1FzGMIrVPTzrvHXTxWOFA3RR6ODOFWEEYb0cTyjPxan
	 MkhhGjsCz8xrPjF3nRw512pJ5hV20HSn1gifny0mUxk/cyjHH7rO8qLV5x31SZ9pV5
	 FyTlfkX29XwY156ThJc1Fa5oG8BXZguGQAr4he9c8u8l8ImBTqLvuS4yTGyJmebOxr
	 skw2F4LzjdcSBy9ohUEENIxt9zitbo2PPhHvO4IoZ2CugcvKptu5CCmXSRlxiuHdzB
	 Ynna7IjOrxZ1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d27CC6BxMz4w0q;
	Thu, 06 Nov 2025 14:36:23 +1100 (AEDT)
Date: Thu, 6 Nov 2025 14:36:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Linux Crypto List
 <linux-crypto@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the libcrypto tree
Message-ID: <20251106143623.06b23d57@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7GoaeS7n7v_YCPwcESvc0YP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7GoaeS7n7v_YCPwcESvc0YP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the libcrypto tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: /home/sfr/kernels/next/next/include/crypto/sha3.h:74 This comment =
starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-=
guide/kernel-doc.rst
 * Zeroize a sha3_ctx.  This is already called by sha3_final().  Call this

Introduced by commit

  58873ecf091b ("lib/crypto: sha3: Add SHA-3 support")

--=20
Cheers,
Stephen Rothwell

--Sig_/7GoaeS7n7v_YCPwcESvc0YP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMF7cACgkQAVBC80lX
0GzJWgf8CdIwuqZ87ASMPLbr5h+WcmIeOTyyhoZa6BnJDWCCi5RcyMbAUqdL7JBv
sWPqB9CkiYU2kv7CzFo5jqEe4ql34dtg2k5EPWmieP7hLT3FGh+qpZj1xS8fpOek
koFW9Up5sNfxg8yow4zPQloJ3119JOqRJcWnGlNqs21CwarvD+Rcvr1tavSFUxJR
9rKmrzLnXJaM/ikcLGaG96ZogeYEpd+WaSOUqgrYhuucGRbrWR5mv9o6u0Ee/BJJ
PTjR3U8WSa401t4KEgbkHECsQoYCk3FXD+EodMMNfWExNj5pQFznljfhUPb3H5zN
oRvDRsW3YApNBT49uYDaq0/lRZpiAA==
=DUdT
-----END PGP SIGNATURE-----

--Sig_/7GoaeS7n7v_YCPwcESvc0YP--

