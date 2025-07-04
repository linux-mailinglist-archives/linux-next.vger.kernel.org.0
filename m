Return-Path: <linux-next+bounces-7361-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98137AF8D4F
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 11:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEC511C80FA4
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 09:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF702F3C1C;
	Fri,  4 Jul 2025 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dbIjUmga"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C13E2F3C16;
	Fri,  4 Jul 2025 08:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619406; cv=none; b=DctfNGVUQftYPZp+dRHxCYtqBT/zHb7k4uVNoYE5yZb3LqyhxB4yt8rpxZyNyZycqLro7gT+GEbghEi5Bs15BlKNYOlOTd67+Kh5YdEO7NTJPfcjX4R4Uo2Dek43wUjvRcwMdvz3R2Pbrk9fD1VAQk7mZq8pycYr5sTATdM96V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619406; c=relaxed/simple;
	bh=ZdG6BMssVm1Gl+X/MYpmSW4PyXrruIwcWTbwljClWks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rsodRS7mki2JabIr9px79yhMxxNX+oRj664dwUbCFE4QHrNSucl7I8JCrk+lk10Kr31wS7PnHlOI3zNvz/OjYPuF9SX5UzHFz+hDPsrvFvu0Spj7ilmtpxp/+YaoG1GDyBaiDE0Gy9e/bpzySAstg3Za6FlkKgmgQEH2zzxSy0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dbIjUmga; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751619372;
	bh=bDp9u1jQtp2Eg/tk05ShcrGxHK9wKH9UWebGG4Xew98=;
	h=Date:From:To:Cc:Subject:From;
	b=dbIjUmgaG0f/tHodIoYEOusRnkDTz1UFCZcU6GmEjzm6tok3LPJxsuEm9Mq5UtZxP
	 zVY1zlfAsEffZqQ2gn+BE+sAcsyVYytLBJ+jawyixTDE41JGi2hW5xMvS60Z5pZ25b
	 KTo4HTFESa5qL8ThGpFy6zZxX9DakwjWzM+bPOlTuSV3n1AyEQi7j5uw90fWzE3RUC
	 X7WDJGZ3FCHgh3dqK2vOnKEJ4RFroTo8nLPTl+0XyH8EZkhqbFTQ4rrSnfKr/xTyjn
	 wNibvSgT5GzZwSqdBFVGs76yvT8LXMA11ASO9edEGHUTtYdCY4jLqpCzQRAiVr0niW
	 WyI/U5xD6fsJA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bYSCw3yWJz4wcy;
	Fri,  4 Jul 2025 18:56:12 +1000 (AEST)
Date: Fri, 4 Jul 2025 18:56:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Lee Jones
 <lee@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>
Subject: linux-next: manual merge of the gpio-brgl tree with the input tree
Message-ID: <20250704185641.430ae617@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+16X6+AHOS79oIA34pEGn76";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+16X6+AHOS79oIA34pEGn76
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  drivers/input/keyboard/adp5589-keys.c

between commit:

  43a8440f3969 ("Input: adp5589 - use new GPIO line value setter callbacks")

from the input tree and commit:

  3bdbd0858df6 ("Input: adp5589: remove the driver")

from the gpio-brgl tree.

I fixed it up (I removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/+16X6+AHOS79oIA34pEGn76
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhnl0kACgkQAVBC80lX
0GzM9Qf/UZuzQs2bmWAGvFyv7pjm/zWdqcTckrrfXqyaoNwXM3DI1ZvlkEXUF7O9
wBuUjwOQwhZgnWp59H7Y7Y4IOdr2l0Z03CLZHKgZXX1xN4/3fQBPetZrJfpx265h
B+g+sgQfoxNocHsNevF4DB53K2T5/uk8WMb9J2Sf4JHXGeWBcu2uek0srxXfNLkq
sHJBXPhx1jeA6CpqRoId5VoTja6E0Z99SwNIYp7BFqe3Yo5XAT4+wkfIblSoEAz/
obo9SUG2hWNUnik50v06n9B3mEcC043hWE6tOs35GNdLMvnb3Lw2oTA5bTihoN5R
RhgUT/xBQjrUZ0lQ1KzvTawbVy6l7w==
=hYfc
-----END PGP SIGNATURE-----

--Sig_/+16X6+AHOS79oIA34pEGn76--

