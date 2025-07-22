Return-Path: <linux-next+bounces-7679-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7190AB0CF41
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 03:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A147A173551
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 01:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC9B282F5;
	Tue, 22 Jul 2025 01:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aF+mAlx0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B37A2AE8B;
	Tue, 22 Jul 2025 01:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753148730; cv=none; b=DEFS101UTcqvbo0/YdZGCyBbvVf6x9sK2HukWa40+UoeSQfoqarOzNqdh63xzZobbZlht1HC4tjM+vwEqnznmex6cWXn2WAToWG9iJyvDWQJDb+2DLeFI97llYgeQQR4ZRhmya+sxEJT1QDSUOU9CkHjFHmD+BPlvFJm2JsUSXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753148730; c=relaxed/simple;
	bh=6RNhgi/PXkNLVR8WSHnE0+PAMzxrnisixktxjpca+u0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JB+siij8i7LkySGNzYiRiqAt9o1+Pq0vwdxON5zjVEG0dhw2rA+VvpZyEszJtaZSwj1pjiw18SndMrBQ0x+9mpmXOHqvtUBUtMcRmz5LyK46kZxDUb/H8b6vG+KHdyg7MvKKanS6MFDkda24oyAUjxwwpEH8H/cFlQA2DGpUzvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aF+mAlx0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753148568;
	bh=7DKLwT9mb5UPlpRe0SGUa89oe5NkFCe16RM/PX/+BRI=;
	h=Date:From:To:Cc:Subject:From;
	b=aF+mAlx056+xrDqK9l8n4mADEokcBAIae0zWLrwIgOyY6Wkw2MizGkgjZHihj7mDf
	 iO8SXmkD5m90a7P8Cgw2NMkJUrFNu1YwWAWdqIBY6V0tnRXvnqBQr7VqgTZq6Bb/Jd
	 tbFrqBuieekKjYh5EfecQT57gBjK4+JOeky7WGaYEuhMfWVO+nMjxj7z8OxEbzgZNH
	 fhhMXXhmOJOWJyCth7M11dOO8Jv02taqeT0UKPSRsyAAIqUZVyTlF0zo50jBUc8JnG
	 j41Gn9XNBP915mJGPDnDTR3Vaez7sUWerlUxYkhQkAV0rNxq/QIaqXfSzyqCT7+0no
	 PUoPa6KqUPX5g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmKlX2XcRz4x11;
	Tue, 22 Jul 2025 11:42:48 +1000 (AEST)
Date: Tue, 22 Jul 2025 11:45:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the clockevents tree
Message-ID: <20250722114524.078e3036@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q6y4ME1usX3zAYNY/lAkbcL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Q6y4ME1usX3zAYNY/lAkbcL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  c4a134f5af13 ("dt-bindings: timer: add Andes machine timer")

This is commit

  65bbf10b934a ("dt-bindings: timer: add Andes machine timer")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Q6y4ME1usX3zAYNY/lAkbcL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh+7TQACgkQAVBC80lX
0Gxh7AgAmIH23+bnDA8H+xMzq6AFgh+VyWp/wGwuQ2a8CCYEV9AKHT11YeY1vW+M
ql4/eXU1QRaHGTi9HhTUiXto0/YftJuAawet3Bt4IKQkMsWpgqWqqpoKI77veA90
3pCA7w7siPb7wagajALITydRl8KeSkSQWJYRN+ZMpVDZRI6nwqjDNCQZIx/NiZ5+
SHmu6cNy2luq9vuJcieHmjZ4JjfNpJj560L+awG2C3+vCgP3b0kZVL9WroMWM6hx
6IewZ5tlvEIyBg/D6zV8kUSCgSJPELEwoRDNsWaBDnRbiHVHZ6yEzzIyjkl4QymZ
N6z1wclSsTMnerHg7vq6v5DR4XxLRw==
=TiJ7
-----END PGP SIGNATURE-----

--Sig_/Q6y4ME1usX3zAYNY/lAkbcL--

