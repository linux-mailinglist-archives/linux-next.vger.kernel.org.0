Return-Path: <linux-next+bounces-4842-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0C99D8D83
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2024 21:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5D47286587
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2024 20:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBD218130D;
	Mon, 25 Nov 2024 20:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XSom5f/u"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAC310E9;
	Mon, 25 Nov 2024 20:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732567534; cv=none; b=b6poNqhccTIMHDrtdgOZrv4uxMZShdREDZPQ3wENdDq/3lDn/etkUCX0s/BrbKQJDv/h9VE3JwI38G3cKPX3KsXoHeHHfhxTXAteECtmdZlyqpgXuah22bguq6zEZKTUCX5CnEnT8PKwIC9PImq1/BUjWAqxglj0U7OLCWFhFpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732567534; c=relaxed/simple;
	bh=IRQ3p7xvMF2xP94VeKQK96iNDsUgfbDNl7/OcO4QKhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iyv+ohNJeKGMVr865UUq/THntHceuvUVA9NjHOo8yfplNlZVOJuTkeITFvDPyDEprQ7bsw5zant5qdCxSGeyX5FuXGornYWL9mGwXuGo0dFoMWJXb0FBf7lPev1XrS2khwXQX4dLh3jFk7c5ZbzaDntEa4YBOwzxQQiYrzF5QYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XSom5f/u; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732567524;
	bh=uw/f6R2/0BbiSVDePPonblAeC8H35guE5lqJwMPMFFU=;
	h=Date:From:To:Cc:Subject:From;
	b=XSom5f/u7g/tGnoRiKaNihkp2jokyboWPZcIyV1frNaeX0AYP057enYM1B0/+1MhX
	 RGmNPrCKHj7D6ib7Ygv0XsoJQJTTx3fln2cRxt/VzZNSQvTNYvgIhYbLK1sO4Dw2wd
	 OS+igfclkGod7wVL4DHNTrYF8zoxk98H9Cr8hBn4LctcsOsy20R6AqT09c3c0MrX+a
	 QQ3/dPsd7Wb6DoppImMwNNifKJT05q3lWu7n2Gnq2AevBl5x1IWd1E6r1jljs6/e7c
	 b6X1jGVQpH5vnrBIja24XwlvgVL8heq4y8lhwTYozywCkCf4j2wwdEbjr2o9aKJgtQ
	 OsL8SEl4aFxhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XxyQC5vSBz4xfc;
	Tue, 26 Nov 2024 07:45:23 +1100 (AEDT)
Date: Tue, 26 Nov 2024 07:45:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: "=?UTF-8?B?Q3PDs2vDoXMs?= Bence" <csokas.bence@prolan.hu>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the spi-fixes tree
Message-ID: <20241126074525.6131a32b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d5vlNIEe9ajGaeP4bho/XYA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/d5vlNIEe9ajGaeP4bho/XYA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  1c6f3eb4f394 ("spi: atmel-quadspi: Fix register name in verbose logging f=
unction")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/d5vlNIEe9ajGaeP4bho/XYA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdE4eUACgkQAVBC80lX
0GxJmwf/Y/W6tr/zUMwsGqdwKqehlfDch1QVRXVt7h9+Iw+Neoevc0N3bxwliEdR
GjzHlrlKc/J3b9Cdy/L7U+WXU4l/wi+TiG3cKpMGThPr9JzYcWRSXpXiU0Li/RwE
uZSwdYc8k6Vtaiy3nsSzUAwpsYQaT9mTeM11J4Z02vAljVyfXc6TvHmKbEpFeTG2
DXFaeR/kfc/92PUqDvqlIUGKdWTk61S+tPEkUXdeDpcD/RAgZ7GvENFpd6i+UcSH
Y5PG8alFEtuc38DI+lyBIdKVrHBj9qyBV2x31hx6mmzW+FYzDwk6xHuT2WiqMUG8
FGymReteK2ZW8c0f+jynn/bKUAErAw==
=TSMf
-----END PGP SIGNATURE-----

--Sig_/d5vlNIEe9ajGaeP4bho/XYA--

