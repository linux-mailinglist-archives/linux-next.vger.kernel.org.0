Return-Path: <linux-next+bounces-5790-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11358A60833
	for <lists+linux-next@lfdr.de>; Fri, 14 Mar 2025 06:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4744917B77A
	for <lists+linux-next@lfdr.de>; Fri, 14 Mar 2025 05:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4EF2AF1D;
	Fri, 14 Mar 2025 05:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bB7hjzhC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07396291E;
	Fri, 14 Mar 2025 05:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741928811; cv=none; b=up9MScbqcnRMAqwt2BOLXS3unv0cmwleZeM7bClwIGtbWep5izfTKN9z4kXMCNJx7OxwkMPxAersUKcOZVlZm1w3+No05ruSZF1a7H7UHaJWnkL4k4q5Ajrv3S5qxN4mvtz0B8XD0HYciANIvnQbBw4QtpOWpFmXK9H6rzit9DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741928811; c=relaxed/simple;
	bh=VlXyYZuG0LOcv/5DxNqtCSdR4rg8+a/QFY9xlbeenAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Hjg+R3Ak/9RUoVCqwJ1bpussRDNGN9gSiYdqT81vzHfOSg0YYRJmvwzu1up+Vb9QlcCocvSi98nCcNGBDOupNhrfWuDHGlf1kv1Z8MP8djlOrcV8Ummgzfpvbw4JxO6aRtseSSCvEVyu0VANJzqucsPBRpMnsbp9CoySAvJHO3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bB7hjzhC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741928803;
	bh=mglcVmp8++3UgAePrCYq8kbNIONWiv0crZ17MOyH+94=;
	h=Date:From:To:Cc:Subject:From;
	b=bB7hjzhCNMfxy/nx8URX1fwIzkO57Dw/TqCav3jAdfoyd6U6mYIRZ+FIs2jlOUdwa
	 7hJXbfwny+vhyNAhux9M5lhQpBoDTapLIJRVCyQo/Hh5P0xShgS+FPgM1/hl5qxvTS
	 Mo/9c+qOCvby5wTn8fYo8Izxbe21PzK51KRWLoS47twhsqyXXqO5ead/PUJ7biQ36U
	 r2byKmbrOQTqHSO35Bez8hAAVDW2Tyq/NSZ7zgJe7jM/6b637dUyFKkqHCgtJAluQ3
	 UER86gSU8JecBTVnuxAycUqCrekjpfjssTGxNVvt0ypPSejUOPjYt8Q/zsIKJcPNsD
	 l/5lqR2IRXGyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZDXQq02Jrz4wyl;
	Fri, 14 Mar 2025 16:06:42 +1100 (AEDT)
Date: Fri, 14 Mar 2025 16:06:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gpio-brgl tree with the
 gpio-brgl-fixes tree
Message-ID: <20250314160641.75afdc79@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ElDMQMoeOGFCb1x_6lAg4oy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ElDMQMoeOGFCb1x_6lAg4oy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  drivers/gpio/gpiolib.c

between commit:

  0102fbf52b93 ("gpiolib: don't check the retval of get_direction() when re=
gistering a chip")

from the gpio-brgl-fixes tree and commit:

  9becde08f1bc ("gpiolib: don't use gpiochip_get_direction() when registeri=
ng a chip")

from the gpio-brgl tree.

I fixed it up (I used the latter as the conflict was just in a comment)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ElDMQMoeOGFCb1x_6lAg4oy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfTuWEACgkQAVBC80lX
0GwY8gf/Ry62qL0o+dkrbbSlTNy5rgwq2+kdBGMmFg9nHRPmOHmKqyGzQbkIQFan
bR5w0IP/SdXHn1J9+H6XWbnBKXttxhC0Bx9Cuhhb7nvV4zySlslY7B3o68uKzf/T
TWSfWtG3aAlpQ3ygv1kDl0tupnpIyDERsUzVijoI6n8INPFuQVcE6mm/l0dyD8oS
ojs/IFmjACd6YUyf8eLV/Gd6h1Spt3O+THkq/Qbm/eH3HfxTg9fAvNPNYc/oI2Aa
vLyFGSmniGEQXg3g9orWGkHli4bu220ifVWN+pCBqNK+Kk0x4pqsBBRrvz/LaW/a
3H/gXkTdwRN5v1Mfq59595nP/aDrnA==
=gyZb
-----END PGP SIGNATURE-----

--Sig_/ElDMQMoeOGFCb1x_6lAg4oy--

