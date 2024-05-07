Return-Path: <linux-next+bounces-2199-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C068BDB7B
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 08:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7481728292D
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 06:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D32F25601;
	Tue,  7 May 2024 06:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D9moWoeE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DD18830;
	Tue,  7 May 2024 06:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715063496; cv=none; b=l2xgMicPw6IySgMSnio0tVbDYwJRIMpPdtKaSSKNQDxZdyGfiKjcfb4oMrNkDQkmztlOF+pc7Hf/jow5yeEd1isqSZnaWu5x93uU1llgEliu0rSlRn5aJheK61hNCw4sHuy6q+vgCs6meL5DxonafKGZ5g8qzx0HCnCpELfJdc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715063496; c=relaxed/simple;
	bh=bmwC2rIPxyzJ9MwHxqRz/XdAzXzgK2okn/sXzCn8ZOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VitQI/z5DMGWG0HsWY7+Hai+R50H2uYOMJpFSJwN75WnCDBI/J5Xs7Q94D4W2dh+6GEIikRd0LuW64HuqJIH51FAQI1QTL47OFFKmgGqdrwFBnRtHDHK+4YyBcrdBzlgNziUhWUdrhrUXWh1N5lcVeeNCEdYZ5+7GWpVsc1PiqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D9moWoeE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715063492;
	bh=w10zUAepbGoj3NyTeCclthcO8OhUmVcXit+Pa/mKUvk=;
	h=Date:From:To:Cc:Subject:From;
	b=D9moWoeEeiLc5yPbbXLx+CpVL5z5HJc7dbRjZ7TNJ2+Baz7Y4UQrdoihKe+6B3YNT
	 YxDTjD1+kD0Sp7iLPTeR6G3pONwMK2LdYIdXyhuyac1KbXJ6iM9XNqGEZf+OwfHxbe
	 ct67nQHZlYr4Zrm9JDPrjrqGjOGZwWrvqC1ryP1/Ilg0P0EAruCnGn/UcLwe19PaWz
	 E50QSxynrqnjKe+RYRbgqYQv4WCp5RZRRiROYhWMYUux2ctyrSkGHZgFsKZVyLTVNv
	 xV0SuII7E1Xed/QQlpQ6Tj+UON39a8FG+USoyZ0CTp84DVuAQu44zf+C/7MJagKnbk
	 1/tCHjHyI415A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VYT2C53mWz4wnv;
	Tue,  7 May 2024 16:31:31 +1000 (AEST)
Date: Tue, 7 May 2024 16:31:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the spi tree
Message-ID: <20240507163131.183813ee@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PBIyqPYximrvcEmdiWk3kLS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PBIyqPYximrvcEmdiWk3kLS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the spi tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/spi/index.rst:7: WARNING: toctree contains reference to nonex=
isting document 'spi/pxa2xx'

Introduced by commit

  2d069c11e822 ("spi: pxa2xx: Remove outdated documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/PBIyqPYximrvcEmdiWk3kLS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY5ysMACgkQAVBC80lX
0GwaEwf+NWc+LPfVXA5osgyR3JqGdHoF9zmv/U3mQYb0H+HeEMKLJ2lm8pbdiTxk
ar3YhW60UgPBDRzAwD+Ah5i+2BnXYtld3GV8KslPbDnRgNqBw1xGRLv7RWkdWD/p
WWodP/vjNYyEsPTb2gcjy23NFIx/fppoEjYQ2ttGw4z6/WM2CMHvlQIt+sxajhga
BTrw4kt7XvUFz/sxkEY4PWztwJuKlYnGd04Xg6Sx6otQcSsDBp3VA7qqUllAaAsN
geAZYPyrRDvBtZ4H825ixXoFfd9KoEPj1j47LYTn3G3HFgj05EFxT3Q45ZvMo3zv
IRZOHzkfgSA8mC3bHVWsPRHEv85tyw==
=2jNp
-----END PGP SIGNATURE-----

--Sig_/PBIyqPYximrvcEmdiWk3kLS--

