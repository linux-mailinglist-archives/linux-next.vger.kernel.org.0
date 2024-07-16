Return-Path: <linux-next+bounces-3029-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FC19320F9
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 09:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A5F9285505
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 07:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5724208BA;
	Tue, 16 Jul 2024 07:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EeI1Pe7W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9361CD31;
	Tue, 16 Jul 2024 07:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721113761; cv=none; b=feG2YpK5HrlXQGHlzuCDOxSKTfabDmwDXPGCBzt3F+ekVBGkyR8/kHl63AtiG84PfuIL237rlN1hmzAR27jgae2DoY1GqcFAX/BPpZSm7EQL1GegVVgC2JNPSJBcMcszssg1QwQFzBdsGbB3Nbhgko8gfziss0/6vQboI47Shzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721113761; c=relaxed/simple;
	bh=evr1uP+DFzk8tqwqDM9ln/TkuCnpBa8l0ytJaAUx4/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Lxil6JinE5TV2NUqVX+fP7ChqWrUVC/2eF9/Rep7tCl37kMMzITNdmY3P9xWD20SvvpXRJDkvktc7haRoU+uTMIReU9UynO7051RKV9PYTFNd24NuEEG0xwCSY5W41mZhv4HbAzGqqr3Dc6dEpJehr0rFPYa0ULuXdP9signvQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EeI1Pe7W; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721113757;
	bh=VYR6z6PTVIWyuvbkBjRmf7hT0VHoQTjIsiaai3t1/ME=;
	h=Date:From:To:Cc:Subject:From;
	b=EeI1Pe7WFwEGbZP5EYrG+mbwIQeREgmZ6TEFDceGPxrDVwLIb6uX8AuerVAtMEE/w
	 iDi692qIZ3L5cxLeDZ3jWS3dzbVfAVIadtOCEZDW71nHqE7choxot0469tX04iDcU+
	 e3w713B0CpDghyLmOGBn19jtkENnWKfO2VEyxRApw5GNq+iBcdgQ3IEX3wZfegX3UT
	 kIZIwytl/ZP84aCBFZqekbD2evF+gdGKUzRxFJG8/w3BSwcSUK8Np2kYCnsVX6O/lQ
	 bsK1fBSszxLXe0ClRSnIu5L/8tFa3PItCNAsPeLrwbjsB3O4I4Xj1i7MAhpboMjKJz
	 R9g5VBfzFCpbQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNVYT5fpNz4w2D;
	Tue, 16 Jul 2024 17:09:17 +1000 (AEST)
Date: Tue, 16 Jul 2024 17:09:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the regmap-fixes tree
Message-ID: <20240716170917.1c342974@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y2fEwVal6GEpK3g4c+TwzTg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/y2fEwVal6GEpK3g4c+TwzTg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  76f19626bd35 ("regmap: add missing MODULE_DESCRIPTION() macros")

--=20
Cheers,
Stephen Rothwell

--Sig_/y2fEwVal6GEpK3g4c+TwzTg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaWHJ0ACgkQAVBC80lX
0GzUswf/eXPlRIQRycSDk7H8oXfNBZVORuA04We0e5xjPv5gBEGDG/axG3WnwQTQ
c8zjkALlKMQb87p8phFe9c0nwK1RH3b/FmZNwkD39U1nQTD8Ywwj/j1BM2jN2wBj
cV+r0xMzJTJGr/Rcfr1p7gXa4PFq2qUBfJiqN7aNPXGrwih2qQqdxt/il0I8UNhP
5MKiOxfQn7+IVN5XMZCxWKEiFZmFGdjeksCmuz/8pEszg5CSCK+DnVIFpN/wF16y
gTKfCri+I2n7hDS7gnCMmDy1GVrT5Pe2VlPeo9ewARW052DuJrVwljrj2bjfCzHV
RPkUv+ygv/Bx7JbSjDhFvArJdFMZVA==
=xVPS
-----END PGP SIGNATURE-----

--Sig_/y2fEwVal6GEpK3g4c+TwzTg--

