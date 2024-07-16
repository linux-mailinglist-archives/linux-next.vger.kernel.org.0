Return-Path: <linux-next+bounces-3030-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D72932117
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 09:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0097A1C218B9
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 07:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35EF42070;
	Tue, 16 Jul 2024 07:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="H17J1Kir"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6534206E;
	Tue, 16 Jul 2024 07:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721114372; cv=none; b=hU5WJGVdwaXcVed6Fp6M4YlMQSuURJH3+T7HGqWgRcBlPHPktvpnBFiH5az2U067H/0EoHqFbFkD89lX4BiobzWN1RqwW6379bRfPcDKaN/vJnx8w6la47LTEVbakEE3D6XXerI5ISlOOZnyaMrQhazXzYIUAzvUMl6IqfvZgUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721114372; c=relaxed/simple;
	bh=qOCYhPf1BlbbY/0Oa1Xw8ZefKlBagnS0w5FDZGJlY4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AAjDSTtHE0inEXKuLXxoPnbKwpnq3bfVvu6OVncfJnPB5h5LbtsleUvE48FPRYY2lnji8kcE+AMFCzlupY3ZzEf/W+QR6W2hYxXZWlt1PoX6iWBwMu2c8Noi6mdDy0C4NA5a5MHrad6MdJmN68Pbz5Hi53Z6Uh4kmV4GA+9kc7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=H17J1Kir; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721114368;
	bh=DQKcJlkyRwC0s/zttvXhJ/t0tAWfJpvToZmj+GRDL9I=;
	h=Date:From:To:Cc:Subject:From;
	b=H17J1Kir+CPiOZI+wfE9J7aX+g2rIHzQ8yMl9yVk46tSZjQikiPhMISK8ny2/ggLI
	 7G2Dib9pkLlXH7UNUH3ASSkftww6c1jtsWkfGjIcfFhKdNeHhr5Ug2Xqo7kUU/jWET
	 TSgRFQxnZsCd4B08YQGLQz554jgPEvaATov779o1Gk8m8zfoy/n1aWuQjDYm3TGiFi
	 0vfjKM+QY8C96lbB0BAE9cG5s93R/JBEMmqXyUkD3wFiTdQDa59Xeib19Svj/ZCeJ+
	 Wl6maG40AovV5nefukjEHV/GxprbCKzTUg88tt0PwhXv4qRG6YAHwAUTjnpXCurwUU
	 36NB9iQPMW0JA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNVnD0yhQz4w2S;
	Tue, 16 Jul 2024 17:19:28 +1000 (AEST)
Date: Tue, 16 Jul 2024 17:19:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the tpmdd tree
Message-ID: <20240716171927.46b75f4e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DLZPhcWam3Rits_Ap2I5YHC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DLZPhcWam3Rits_Ap2I5YHC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  46ebbf4061e2 ("KEYS: trusted: add missing MODULE_DESCRIPTION()")
  6e9a602077a4 ("tpm_tis_spi: add missing attpm20p SPI device ID entry")
  732cbb267287 ("char: tpm: Fix possible memory leak in tpm_bios_measuremen=
ts_open()")
  b270b463aaad ("KEYS: encrypted: add missing MODULE_DESCRIPTION()")

--=20
Cheers,
Stephen Rothwell

--Sig_/DLZPhcWam3Rits_Ap2I5YHC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaWHv8ACgkQAVBC80lX
0GzvBAgAjJd6qUHmG1XE3pD8bjhaU3TIvvrFnpbw9nzbx2n4bw/G17Of9fSpcpmz
8tNXXGWQ0FH3ZAsQB0l90/csu17MGeolxt5PlKQawHysCi0+/d+GvvSj7Y9TcYC/
AoR7xcnSHk3ahInM1hERRE/fUlrtObC9TDdEz4dFVvO5sDFwLhCgis3AVaeg1bAG
HvKwzgK4qMwO4LtfcaUfWDVboEeJusxA4HzWVS9fyC/N66cOPdKl44VViAJJf+rB
osQpMVy6w8Dn296G5LbWAZbznuhbnQgMaDNSX4qjP2T/42x2fOkzxS4aH58T9QCa
xO/jyc8EL3fmzhyA/QomeYHX5QpvLA==
=pDG5
-----END PGP SIGNATURE-----

--Sig_/DLZPhcWam3Rits_Ap2I5YHC--

