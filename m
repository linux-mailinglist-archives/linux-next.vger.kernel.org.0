Return-Path: <linux-next+bounces-7642-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76654B0B906
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 01:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 952D5173F6E
	for <lists+linux-next@lfdr.de>; Sun, 20 Jul 2025 23:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82F41E1A33;
	Sun, 20 Jul 2025 23:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WupPGB1Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9281DDA31;
	Sun, 20 Jul 2025 23:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753052630; cv=none; b=Jm/YkaBspO+c4vXoEgIipB1zlgg+woCY0vXOShTvPh4tsM5qNTpkLakENydNfJhHxJssc0Xv8rFHztNn7nhurzRqLtCtQvUw9LO8kaHq/HsJDxUG/yweSqDqn2YCz8xXdbkYuyg0jxKOLbTTCE2RcYfRLj7zkM3ITJhqSyyWsS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753052630; c=relaxed/simple;
	bh=2azgmJQyi/V/5oJVXLyqKt6Ve/u0q6DRMwL7n3b7PU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=vBijKhWNcgNWdJBuLfQgHNUZ7opojYImQA93XSzMduchjTE/Lr6cKDMevDOH4M7mwmsPaZxuUkWo+HCRFtB0NcN5mtZN4g02VNkvsXyC8nTsvg5g87q7cNq861nWoTZE8yKAuVa6GZ2hzRP49oO7GiM6XBwm5qJ2QRm7eHuH59I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WupPGB1Y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753052476;
	bh=EftNmhGRydtw2SiPltoJ9YuRJYgyVXJjGOFZFaBayi0=;
	h=Date:From:To:Cc:Subject:From;
	b=WupPGB1Y04Ed5vL2RyGtYJUWUTX6W2ktT3OsX2k8l9Tfr6yXmnBLkD4Mqm3K/vHFV
	 w9r0vkVlNGNvZFcbFe1SRtCo/9G7KELyC+tt0odnk3FAowCAbMu16KfGlG6tdW4QGU
	 dD694DbJ9QYh+3+wZmLCkQgTlKIPd/DT/R1L86yeEfLLyLs3TViRWiV1D/b5NF4LPE
	 t9xY6bk7nSFBxEmisjyYSyJiiesbKEAueGg88xgMZ92y69tn2aAcAJeLklbD01Hf+J
	 YvgiaeN9DEp5iYoyLgdICrPb3JH8Ujw9VJa5GnpR70bMq2WkcsO5nP5XJSjtdYbQmS
	 O1/140mgW5Vwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4blfCb6k7mz4wbn;
	Mon, 21 Jul 2025 09:01:15 +1000 (AEST)
Date: Mon, 21 Jul 2025 09:03:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the i2c-host-fixes tree
Message-ID: <20250721090343.5cd192eb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9RYw+hyJ+._.P7t6.YcoToF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9RYw+hyJ+._.P7t6.YcoToF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  975b02f641ed ("i2c: stm32f7: unmap DMA mapped buffer")
  36ae42978569 ("i2c: stm32: fix the device used for the DMA map")
  cfba2fe76b2b ("i2c: omap: Fix an error handling path in omap_i2c_probe()")
  7c18e08f4c3a ("i2c: omap: Handle omap_i2c_init() errors in omap_i2c_probe=
()")

These are commits

  6aae87fe7f18 ("i2c: stm32f7: unmap DMA mapped buffer")
  c870cbbd71fc ("i2c: stm32: fix the device used for the DMA map")
  60c016afccac ("i2c: omap: Fix an error handling path in omap_i2c_probe()")
  a9503a2ecd95 ("i2c: omap: Handle omap_i2c_init() errors in omap_i2c_probe=
()")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/9RYw+hyJ+._.P7t6.YcoToF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh9dc8ACgkQAVBC80lX
0GwCIwf8DPG1kL5kkasd8/BQVvMAkRsQgAhdE01Xw6/gbYbuX2Qj89SpIcoVNHrX
HUji4xJ3/Ygr8lZsQ4E4qjnTH80BPIewAb5M6WkjW6ROrtgUzP0SQGtyKzKyQBl1
kl4knpLo7iIKHWWuz1sALufTh2Ss/voHsxsolhbwEFz+pAb339MouWXSngLDlEgq
KnTxhA4zs97XlCyhGz6Nydo1gC6mddbKOSgTnWHi5B+C2COBrlmlIOgh50wmjm5C
txDkfPRTqgOyT+VacRxVVcLPz53eiuHai6Axil1jh9jThNFArjqg/RrGn2M2srbE
mVh6qGTsKjjwaqtuyVyL/+QPhI/Pyg==
=yIgX
-----END PGP SIGNATURE-----

--Sig_/9RYw+hyJ+._.P7t6.YcoToF--

