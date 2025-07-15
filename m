Return-Path: <linux-next+bounces-7550-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D630AB054D7
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 10:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30E8F17592C
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 08:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA728275104;
	Tue, 15 Jul 2025 08:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Z6qDaQaC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31CC275873;
	Tue, 15 Jul 2025 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752568021; cv=none; b=RSMv1aaiQSZU2u1sRkuOgZb9C9AQGOkWJ+JlhMHIKqe7U4qOliOJos9g52HjEEZHjixszXXjhFNPnd8W0vfASqhNOcbxvj9rU2xYqNLnvGHk6wxpMC9NB/M22nOj4qK/OXlpbz3F0G2xin4ymefVydbVjBx6ZVOoafxt4d/L+aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752568021; c=relaxed/simple;
	bh=hWbXuNPL5klyZjrH9ulvEo2hCljUmAJVVcAFMNhH3hs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rXDNBSyUpPFomDyDC28d1lpvklKQDkHk5G6U1WNZl7dciblAVBfhdEAtuPGhpN8B+loINM01qS0aPNWIiopbmFBaIriDQVSBEPy/hcdLr+TcOb18lEHgBp38x1577nh+1UkpzgbY88xfRASA9r8s54Nv+3ayxSNjZNHWV5iypjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Z6qDaQaC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752567908;
	bh=tW5CP8FcTYEeshQ7YqE9lmDWW3wExC1rmFLG2H8oTsg=;
	h=Date:From:To:Cc:Subject:From;
	b=Z6qDaQaCCgq+6/h1gA5jnmL8qO6RNyFX4GA5cc012oEocS4UeQvDUsns0gIkRkm9l
	 0SvIGtxk9Eik819rY16WDYyshW6EqTFVeOMXBaBOsOMlrjQtY0Vz0mvx7HKjUASgQn
	 G6W5iYpC7UJ/ff/xy2kTQKp1GRYA6ehcjUr6sgX5gGczMijR3fPjCg3y+sROfTw1SH
	 NXkiZEIqzHfO+0gMfgW4l+IQzjXtQDU8aVccgDg5UN7XX1D9bC3hTg1EeJvk/GBHNq
	 yxPv3awZe3eFuiMSNMTl9ECCosB0QnmUCAJ18Kg1AyPoazn5U57OT0DXntF84T/uDA
	 fhPU733bjzF6A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhC100Bxxz4wbr;
	Tue, 15 Jul 2025 18:25:07 +1000 (AEST)
Date: Tue, 15 Jul 2025 18:26:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo
 Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20250715182655.59556ba7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BQ_najGKC3VhzTcs4.6lcEE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BQ_najGKC3VhzTcs4.6lcEE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/platform.rs

between commit:

  f0a68a912c67 ("rust: platform: use generic device drvdata accessors")

from the driver-core tree and commits:

  fcad9bbf9e1a ("rust: enable `clippy::ptr_as_ptr` lint")
  12717ebeffcf ("rust: types: add FOREIGN_ALIGN to ForeignOwnable")

from the rust tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/BQ_najGKC3VhzTcs4.6lcEE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh2ENAACgkQAVBC80lX
0GxIZwf9EhL0eKRzODRlqUuxADrsOSM4VnPsMp3qJT43cBglczgxVEvBM7Qwabss
hkENiFp6F5fUyflz9iYRPkHG60sG5X69IdHnfrDmrwzbVonKM5KI7gspYIDXFKPf
E9N9ke6PBpLFPTvtibhEnEkODCpaxXCCFqXkQvK5qc7xZpomcWgcl8Bf9fuDnzl3
ejtVGp2WyUEOI2FvxshrdeO+Z3QpjjrWYtNpj8eP38nZ4ROuQJmFLtxPfl7FqHre
F2BSaW5cdkYI+Gppj66i2iOQZgQHa73dCazBb7CVojeSQvg4KqofjC7PUgQ/syZv
ay/oPo4Eqz2Z4SVVvog5iAvVzsihHg==
=3pDN
-----END PGP SIGNATURE-----

--Sig_/BQ_najGKC3VhzTcs4.6lcEE--

