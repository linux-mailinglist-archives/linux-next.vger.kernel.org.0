Return-Path: <linux-next+bounces-2607-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5FA9102DC
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 13:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 330A11F2287B
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 11:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABBF1ABCAC;
	Thu, 20 Jun 2024 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A88OkR5a"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59B11ABCA9;
	Thu, 20 Jun 2024 11:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883258; cv=none; b=a1j+Iny2jf91badNSTqBLzAzwQekX4i/OUgv1VFML4Q9HzorU8Nuh4v5xg83v+S7SLGGh61Afh6Zu6bVyw57WZ7rvIz62Fv7a/erD0fFix3ZX+SbXbA6+Jd69drTa8Qpjl/XDsq9nps0zkBseBA9CMoC3bRy3o9giCWPy7KLA1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883258; c=relaxed/simple;
	bh=kKj8eQbWfPqEkaQQsJ0oL3QoWdTSM9KR4ekzvJ7DAT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IP7V+wCW2IzB2nMsx5eOpAbktcjFrMPacoJbI9BpTTY2hb00670PyipBMYJC6yVii/oobJaj5ayD/xha4bpUiVU1fGLtCWJdc0qrkNn+Y4MiHxcQ1Vul0OjetaJk7JHPXfzOw2Aoc4s2XxYXnQZ90hwcL0f27AO3yu0O0B47qL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A88OkR5a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26CF3C4AF0E;
	Thu, 20 Jun 2024 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718883257;
	bh=kKj8eQbWfPqEkaQQsJ0oL3QoWdTSM9KR4ekzvJ7DAT8=;
	h=Date:From:To:Cc:Subject:From;
	b=A88OkR5apcY9laEwkvGvIyShIg3D8PWwdXUj8P5K7EnPlbffV3hBYkvpaGFfKhK4T
	 NfEsTU8zJHod6huJv0p1/IRAjPyj3m4/FIEoheecEVFSXWnKb59dXzgCA2y5TEhqpk
	 uh3gJzKHxsARRxyMj/M0Qkp+M7jtxhYLjjQwaQepZzsaW5HEN2xAPLDZ74UH3Xf4I+
	 t+/oL415ghCn7PGNxXlmbfgeOEOyUhU7x7++Oe7tMEJbWvsoTq6PLe1GIC4iecFtR8
	 l9qnxzbVE/WDsPocSyY9NMxP92ERVk5vw2XUsBg7PPE1AtLm9xipwNJ9CYSYQNKWrh
	 Q95YBnr8jXl1w==
Date: Thu, 20 Jun 2024 12:34:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	NeilBrown <neilb@suse.de>
Subject: linux-next: manual merge of the vfs-brauner tree with the
 vfs-brauner-fixes tree
Message-ID: <ZnQTtD_d-egGzooR@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VucZ3NeCBl+VuSap"
Content-Disposition: inline


--VucZ3NeCBl+VuSap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/open.c

between commit:

  7536b2f06724e ("VFS: generate FS_CREATE before FS_OPEN when ->atomic_open=
 used.")

=66rom the vfs-brauner-fixes tree and commit:

  7d1cf5e624ef5 ("vfs: generate FS_CREATE before FS_OPEN when ->atomic_open=
 used.")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/open.c
index 58110f0bf5ac8,28f2fcbebb1ba..0000000000000
--- a/fs/open.c
+++ b/fs/open.c

--VucZ3NeCBl+VuSap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ0E7QACgkQJNaLcl1U
h9AzOAf+Ij87qYM7bx/UJmeCa+8KgA4uPf2bD9LpsaHB7Te7DliVVzuE+5vGQX/n
CQvUno5yn3QJCx+UCkseLEwkqFVtREry+GoaN85zUsDh9Rc+IlKrC4ZF+qaLNnz2
v9akc3IeXOqfC3i9kCdjfp7Ugj7VweGVOq8CLgaOZV6462LyHRJRLONdZB9fU5mX
0BWUUvnxD1oNQZXHr2ALUEcCbn2scSEHvqblNC9rukHlEz7PRu/69xXjcPHV6rgu
V+wQtBots0cvst99oa4E0M8JR0nYpkrFrAbBRVl+P0PKEVcFta1KO2Ljpwlna0R6
8EPF+/W5wDWiGDGgRLhDt+c5dSnjxg==
=Oknc
-----END PGP SIGNATURE-----

--VucZ3NeCBl+VuSap--

