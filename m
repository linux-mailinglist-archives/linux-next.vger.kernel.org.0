Return-Path: <linux-next+bounces-3173-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1485E943892
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 00:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 447661C2167B
	for <lists+linux-next@lfdr.de>; Wed, 31 Jul 2024 22:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC0416C847;
	Wed, 31 Jul 2024 22:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cZlrEm9S"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5F0101EE;
	Wed, 31 Jul 2024 22:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722463409; cv=none; b=q36jls3VqA4lKWBXvJOcgFbSn7pPiUKdoB5SIz+P8AHff+Nd/Q6fww/OarDof1xBfyjOyJyWOPeXfvcY5aueQioDwWcE4UcpCuXBeT9QkuZVb9C/goUUasCDKDwVrbP8U+7FcW8kba8HUzyGDts2vp1c+QEUmfZWlU8g5QTQ/iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722463409; c=relaxed/simple;
	bh=AXyw3wEechIk/awgFIkUkp2A6IoJjljE+eqRwUa0dqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fM3fqyXml2mo5G5x+8CvjA/1uHjvHwPm/bwLQNfzYQP1XkSmk6L31VQ/pRCi9WrmobhQEpmesixq652eXwMfCotssQ72D2lmTcbLsDv+kS8d3S1joF4mztu28lnfb2FplJdC4i8t4wRHGUCE1EUrKEziwqUcqBnOL0S5xwW5in0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cZlrEm9S; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722463404;
	bh=pH+3SH3bi2dNIto5NlvO2xoHc0jsQ4Va7N/hDBmP43U=;
	h=Date:From:To:Cc:Subject:From;
	b=cZlrEm9SxxKrV6gKT3qgPGPxwDb8h4UWXwBq1pw8WeRkVnMyqT5SadtguB+5zQvnN
	 h/2oHbk9bTAvyY7PX8T/b7EqOGaL0evFZbKUP2EA8gVccA/Gu8I0sQHFpmJ4Egw5oI
	 Sy7qP2OTQZyfWUg4k1A3vMbWQhqVU5WqBXJhGIZwko9+XWgBzj/J8YdfZhW06OPSo8
	 uU2w/JWJeFj/m+dlf/4Jjn9JihxyqVj9QA6GkrbFOVGfk6SzFfHRr7XoUw55uGXQzz
	 GC8VrXKM5Vr2WiSayDwINvdWLChhF73XxwVBpeDvklkUlA2APOUVhmglfMqLeeSRsb
	 2aYZkiJPkKZjw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZ5hD2fZyz4x6r;
	Thu,  1 Aug 2024 08:03:24 +1000 (AEST)
Date: Thu, 1 Aug 2024 08:03:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20240801080323.7b91964f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fGEsOqSgl/xHrJGnJA1T_Wh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fGEsOqSgl/xHrJGnJA1T_Wh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  43b158d40393 ("ufs: Convert ufs_check_page() to ufs_check_folio()")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/fGEsOqSgl/xHrJGnJA1T_Wh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaqtKsACgkQAVBC80lX
0Gyq6gf/Sx03VhuOVm6kKlo02BLSsFEIXAQNio3TtlWNPbSO0BnxVqpQ3XElhM+H
7kfT8f4n9ggcnmXQye/avZaFLm8OvW2T6XC4vBPpBHsJG+A9XDWsVzoZjquue2MX
jOtdoLzaxVxqLfrsB5WKGClUufJpZ5ZZvfQdBJ/oaNh577d54frRvvaYvWUVwamV
qaWovp/sBVaA32kC86W2PD/zl8n7W3h58us13/PxQxO7IBRCCmGXnpkJ+83qSzVV
NDoEAaisP+E4mXKW9xX+kgA/a9Y4MywO9gALWsIpXEw47FsnlKGYUJb1aF1AiwQI
+8Y33Tr8NSnyMAObfS5XlaiIE+HZzA==
=s+SW
-----END PGP SIGNATURE-----

--Sig_/fGEsOqSgl/xHrJGnJA1T_Wh--

