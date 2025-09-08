Return-Path: <linux-next+bounces-8222-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AB6B48615
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 09:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AC2E174993
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 07:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7282E8B77;
	Mon,  8 Sep 2025 07:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IRH1Ak91"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880D52E62A4;
	Mon,  8 Sep 2025 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757317903; cv=none; b=ChShkNzmTQB9rkUQLoDJ9i8FdB4KTlzbS1XpsP8305GiaJyM4hABVmgIIc9QRbsVMVM1WalJMq0fgejE69d6TZNhX/HShPeO111c11gTl0vMGUtyQK9VPAw0vIBW+bgqtPaML4eomzMnzaOvFZHWvSBBr01tviM7whlq8GN7kL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757317903; c=relaxed/simple;
	bh=muFUVbl0EZ/9s0SjWmwJf+NwfFQ3ImLQutgReDuqxL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QKuxEad6bNdkctdFIqVF3bttVjUV9shwLvvHFS1sl1N2Z8mWT3gSTO+3cHCJjo8NHG3iMv/2fkTuHJHv/CjZjtEAwtJTBz4FIwOxdkB0BdL6PTo0X0BV9moDK1Gk8lKAdG7ceUzVC7wh2kKJYE5WJeLXLZ3XwoFlKmYJNYlvamg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IRH1Ak91; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757317896;
	bh=BIn9O0PMNBkJfGcEY+etJSXuR7hwrEU2qvg/yniiLvs=;
	h=Date:From:To:Cc:Subject:From;
	b=IRH1Ak91HH82yVielpeuEPm6xTnc2umCFldbPEVX0qQxCNPVWW6MqtpzJ9O8qBY0g
	 jtL9QwNpHcGByWlSgmM8A5t9rCmup22gn1edp2K9Qw5Awz2gE0AyGXi/7H4soTTeuQ
	 QZq4Jv2czMD3hDiGc/HRY2Hmldqmbjiw3G2R0PHDQ0lqvE7T0VwLrDJfTI/cibSpeN
	 15bkBwKiyzuaMjSeKF2bc9G7SXVWDBbx+oo1fWBLCXxfP5FDNB4vIUl2tnfxN4ufPy
	 zy/9GGSLZTgE/70xbpatYOmHYLFykhd9+hYjSLSwt8oAs7zrIqcXVB/J9O6rmPYq1C
	 /togSPQij8K4Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cKzfw1L2Fz4wBC;
	Mon,  8 Sep 2025 17:51:36 +1000 (AEST)
Date: Mon, 8 Sep 2025 17:51:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>
Subject: linux-next: manual merge of the bitmap tree with the devfreq tree
Message-ID: <20250908175135.4215c780@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f3/lT4wIuSw9bLjDmkUnKtc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/f3/lT4wIuSw9bLjDmkUnKtc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bitmap tree got a conflict in:

  drivers/devfreq/event/rockchip-dfi.c

between commit:

  7d9e29ed3f8e ("PM / devfreq: rockchip-dfi: add support for LPDDR5")

from the devfreq tree and commit:

  414054a0bc1f ("PM / devfreq: rockchip-dfi: switch to FIELD_PREP_WM16 macr=
o")

from the bitmap tree.

I have no idea how to fix this up, so I dropped the changes from the
bitmap tree for today.  Someone should supply me with the appropriate
resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/f3/lT4wIuSw9bLjDmkUnKtc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+iwcACgkQAVBC80lX
0Gxx5wgAlTHx46OUJqzkt+O/k3Jwi63CwH8YBGbW2wEFMyHU3/nkt6NsB0+aUKud
giYYjdOLoU25EiercIyZAuD+t5pWHAnZOOoQIOTm6UYX1wdF9PMXHtlwdEp5mBr1
sWtKlKij1gW2ohggPTcF2lPiZxMQz1Xp1l+K5rfMZBvsknLU4r3P5XzEd/mS6/yL
Z0A2csyBQVkFpmLpQB4vbmADqn5AqvlevaO3jxkEJ9Wg9ULtgQzdOyYcNUh+hX/W
yp+sonpO+dARguVeo9+5d8o+FFo0qlg2peglwh9RyoMFVSWELPXVZZIlTaKC8qH8
UQMImjdgAGKooVmCzZaB4Z7O1hzXrA==
=tymg
-----END PGP SIGNATURE-----

--Sig_/f3/lT4wIuSw9bLjDmkUnKtc--

