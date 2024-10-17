Return-Path: <linux-next+bounces-4325-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED5A9A3110
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2024 00:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8F721F23094
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 22:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6831D7986;
	Thu, 17 Oct 2024 22:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ue3vRRBH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C68E1D5142;
	Thu, 17 Oct 2024 22:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729205616; cv=none; b=Dg7oodX2q0mlsCSihFCDm9a3J+mwgoGcDbFchNBenqC4iUXSF/v9Qmf9J9T2TPQeLYh7kH2aRU+4FT6OgZwmb/rJpyjVINrRKEV+ifFFJUbOixvGDRzjBybpUeXFGm/1NEuuJmScwJJ1tGqpkZFgdD8WhmArZvtQlczsIqhUAxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729205616; c=relaxed/simple;
	bh=LgqItpjD0mf6kBhxr0Sasrv638OCo0uLz/5Jy1K670g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Uqzuz0/6Js8t4nnWsNz7RxmUKtm75+MuB8KxOu1t8xMuQrKlT8vYnAYrDg6XXxlt6oHpjHi4jt8UiPolDzGASOcbj15yR9hzUHMGi8nlBsxZ5zfJYwSONcLnCeImZzq16UeOhDyVJuC5VBg5bLivh/gvLVj4OqziiIt9JChMcB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ue3vRRBH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729205607;
	bh=U0sANCS4iKbMjvA/ppQyEtAYdO2UxG8K5o0zRIkshK8=;
	h=Date:From:To:Cc:Subject:From;
	b=Ue3vRRBHSbQt7sTsI5Uv6XHfurERBhClkFc5cKZRBOvFney6JEho6SwGb3RduHOJC
	 QUwLEZ3EJuHvrLfgNmOjJQqi6Vy/DIndPVkt7KdjXMoTJ1zsPbtrIBs/fbZUq+kZvo
	 oWQZ1iqSQuj65kDVD5YBEItxC4pQ1I5JYGa/W+YMUcsrNJgHTy/QxhCcZlIIib3Bs9
	 VAPRnZwf1p7QvkQcQE5T94sDqiwTqynFcMCxmCwtjJiBwD1Lqj0I4DmJTz3m6qcoLR
	 BRvBUB0zK8YbsNxm+JsDt25z9O0ZMRkM96Z76BVJgBqKi0zu5/28gfk39aoVeu6REU
	 EDsKk4xNaWezw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XV35z3x6Bz4wbx;
	Fri, 18 Oct 2024 09:53:27 +1100 (AEDT)
Date: Fri, 18 Oct 2024 09:53:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20241018095326.2a1ae168@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Nqz6V2voycNoom5Gi1rvU63";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Nqz6V2voycNoom5Gi1rvU63
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  c86fb0ef61d7 ("btrfs: clear force-compress on remount when compress mount=
 option is given")
  c87222d18145 ("btrfs: fix error propagation of split bios")
  d2b462521dcb ("btrfs: zoned: fix zone unusable accounting for freed reser=
ved extent")

These are commits

  da15f58ae3ba ("btrfs: clear force-compress on remount when compress mount=
 option is given")
  dc094af9105b ("btrfs: fix error propagation of split bios")
  bf9821ba4792 ("btrfs: zoned: fix zone unusable accounting for freed reser=
ved extent")

in the btrfsi-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Nqz6V2voycNoom5Gi1rvU63
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcRlWcACgkQAVBC80lX
0GyvTggAi3MNB2v3izLq2s1ixVrurhlpcfaNIot0J6PDxMZQrD/gbObDrW7kHMC9
3MpIsQUZD/OmK699LqsKi9WruV9C1BmqgzG6NI2jCbPV449kxtr7jp9Xi78rkcFY
EAU7iVqAjE4pEu8CkTY8Kt6AQzj/5rIbKA8sE0XnjZ2t4N5VZ1m9xzzDS0woNWXJ
qCJHuL9HmPS43jC7CS/0CTANkQXRp6XW40KLOK7yS8DAHVZzfHUVELFRq/z6sYAL
PGMCH80lACBdUQ9zQ5PGgwQiUjuAnyiHEdizcyOTN6ilGxHlKI+v92HtJ+eO/2Wm
sCJeIyxvEAAzsYG8FSCXt9VdeGQ+kg==
=FV7i
-----END PGP SIGNATURE-----

--Sig_/Nqz6V2voycNoom5Gi1rvU63--

