Return-Path: <linux-next+bounces-7465-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9306AB00EB0
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 00:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83F8E3AB785
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 22:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB8B29ACD4;
	Thu, 10 Jul 2025 22:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jy+1aufM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545D02980D6;
	Thu, 10 Jul 2025 22:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752186384; cv=none; b=fElwJohK0uQnBx552K1vuBBFofX1W8+q5lNmig99gUB+gvgWD6BwP9kzpVifK7Aoj4x623CQr/dX7yHaEYO5odO+m6SUueRnwkXZ69sFXQ0s7K/S/IhDJYDv6v36JG5eXxiz7RxX29bIVfN3MfdIy/rLW0E6PcEFkQ9zkOl6hOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752186384; c=relaxed/simple;
	bh=YNioh03RUlXUUUCdaFzZo42xZ9j8Xcg4qDsW5YEVAjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AEeRrqsnyo20UHmk3ZlNOhOWtWfSl7ROtV5Hz1xvKv8+hmk8jSuyV+i3ufXQEJ07xCMFBNEe6xZ37IGDG7Qd/jYWerVN9W6+1czOzYM/nk6tYMFBWTyNl+GFC/Jet+9j1tqCtXZSBbfLu2jzm3VoABNw3NgeSvRHPacD1An+tfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jy+1aufM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752186300;
	bh=XnONxawBvLPhlYEIBmIGZp5Z2P0vvmK1Z2Z9PwKY5tg=;
	h=Date:From:To:Cc:Subject:From;
	b=jy+1aufMpCPI4c4geY7uFr3k/9ExouKCyDYgd2yhHbPGa+DuKqXrfhmA/X1BmkWEW
	 uHWYlEZ9tTpYgwAwuuFbygTyWSxmtvlE165kioEnHlzws7o39p6QmuE+dny6gPFxE1
	 ryjcaU4Cd10sKfPpzVa15Pe2r7y/lnr66x9g+2kMXG4HkVxV0lbBOouT1lSHdzbpLv
	 DX9OxXKlEA0ju+cST9wQv9XbhpG1ggyrlh6nm1iaUyyYgWgFaH4pCry2qZ8SXa+MvB
	 rxAyuXWtkIuVhyEH5YFZSN9PvtB8bGhV2AbvH6SADmfoA4BdLWsBNV4i1SPn/DSFF6
	 NTWkY7YJewtOg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdTtM5TbMz4x47;
	Fri, 11 Jul 2025 08:24:59 +1000 (AEST)
Date: Fri, 11 Jul 2025 08:26:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the rockchip tree
Message-ID: <20250711082614.69765ef3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gN87SCOah3Q5.hSWZOwr2OE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gN87SCOah3Q5.hSWZOwr2OE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  fc276de7b63e ("arm64: dts: rockchip: adjust dcin regulator on ROCK 4D")

Fixes tag

  Fixes: tag because there is no functional change here. I don't think

has these problem(s):

  - No SHA1 recognised

It looks like that Fixes tag was incorrectly picked up by automation
from the mail thread and should be removed.

--=20
Cheers,
Stephen Rothwell

--Sig_/gN87SCOah3Q5.hSWZOwr2OE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhwPgYACgkQAVBC80lX
0GwCFwf/TgZWSaaTSGnnyro6WRhR6QpMSudxU8RZzPpgUmFegQsYd54eyv51D/1L
p2IcVR7Os3XZfEkWC8JfjrAqt+oyxBPcsllNN7c7Rj6X49k2GfC0U3WFXuDn+rL/
ydko9ixGxM2SFuvfEFPFWmv3QZY0bHRRIHygOnHgAhYLyoCYWMXHXL1CiqTV466K
UmXrXekBN2pfYVfipnoOqlitDFSiwVjzdj1XLR0HIANGYlHF9Umf/Mmsm0E+64AF
gTfCx/U3vgo6Njq6o3T3n41HIWf8621flw5sGBwTni4BRq5354BbQICD8IxBxtvA
rMV/y2fUlzfH1em24TLI4VYxu38BEw==
=68Q1
-----END PGP SIGNATURE-----

--Sig_/gN87SCOah3Q5.hSWZOwr2OE--

