Return-Path: <linux-next+bounces-4425-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 635029AF4E4
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 23:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 944721C21F79
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 21:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856CF1F9ED5;
	Thu, 24 Oct 2024 21:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IGhu1iSA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2C41C7281;
	Thu, 24 Oct 2024 21:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729807135; cv=none; b=WxvRPuSml/IJzU3o0UaJe8lQIxIBtqXS3DGM220gL93bGcdgCVslA69Ux2OFdQo9BCjyjrGIzYFjTyg8p7mgwR3heeWpWKCGGFlqp7qFn85kVQIojYUngvR8NVA8WPSMIMLEe+5PvEoW2HeMNX5zRu7E2QJ3OmOKIMjo4WjnqKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729807135; c=relaxed/simple;
	bh=GdsenZrGy/zmFVQ1ssAIjTI/CS452cIwWXgmh5PKvPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hifNxyIASeKCIOgx458FaVfQD5BSwSgDoL8FSNE4JGUPEprBie4y5PZFF0bsVqkxWEXXLPDWiVD+84bASXZVv6faYtoF2aSsrKcawvZKquF82PIEL6sUnXcpPlZ+cz+pUtsdQf6P59G3rYjpz6EEXre2ZlkMnm8CZ/M+fJDcDa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IGhu1iSA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729807126;
	bh=z7xdXgXUv5v4bNIglvdD1Vq3paOYO3yDic/Kz8hXXsc=;
	h=Date:From:To:Cc:Subject:From;
	b=IGhu1iSAmotp/HO6afE+ewDlfTd6G1NZvw6FHBnA+RMVvP1NzT6w3KmiXplimjkBF
	 BklNg7ZZKhIZuyb6r3VL9w3HcBvqDwAW6FkYq+YMSxBs2Cg0d2xly9WsH6SMlq0A7m
	 K/iHxh2VQrRxUPzUvbOUYdt3tqYai3T2F2uHJoIuJRZuBQg+HUVWxjHiih3g//D9MS
	 ahHzQbwvCsjpjE8bxpZd3EIIOcyUYbV3A1Pu15Q0vBxTmKXp20j6WrMPk+J8hMX1AI
	 sdzJCr3jZ6IDCU/0Ga9ymkUH89mJSKnu0Vu8kaJTytS8dOu8X7bYwiLfJ93kMCX7P9
	 Da+MFStczFEaQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XZKYf6Fs0z4wyk;
	Fri, 25 Oct 2024 08:58:46 +1100 (AEDT)
Date: Fri, 25 Oct 2024 08:58:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Jeongjun Park <aha310510@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the bcachefs tree
Message-ID: <20241025085847.59c61aa4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1Sd9a76aJ+g4lCPQctsyVOb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1Sd9a76aJ+g4lCPQctsyVOb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  63d1a1b90aae ("bcachefs: fix null-ptr-deref in have_stripes()")

Fixes tag

  Fixes: ("bcachefs: metadata version bucket_stripe_sectors")

has these problem(s):

  - No SHA1 recognised

Maybe you meant

Fixes: 7773df19c35f ("bcachefs: metadata version bucket_stripe_sectors")

--=20
Cheers,
Stephen Rothwell

--Sig_/1Sd9a76aJ+g4lCPQctsyVOb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcawxcACgkQAVBC80lX
0GxkJQf/VJ0LB0EchD2oYyOxkg7mfKPFYqrT/ZihFndaWBiPgjHZGB31YLUvdGj1
c59Uw6PSgi8kqhHrYOyKl8dA/QwjzvUZFxpDnH8c16T2Nz5GVYVPHIotbiJTTLUe
tzr1qoMIMEtpnHTwvDZbG2ZumjrRVNWAQObVkDP6QmkAY06yjY6YUTWnxReNlOEi
p3a0xZlDVaNlJVDnEYrSS+KLLX+ABOcLbNv7oMZdxdHZYIomsRpfrP+h8L4Ygz/Y
zC30KAC433XReloq8aznHPT+sjiFlhPR52JRjmx7mAal5S+M4LjCpEookTPf0Jo6
NrWNLk3mT+zNviHR5+h8sOfSkSH3SQ==
=0j+8
-----END PGP SIGNATURE-----

--Sig_/1Sd9a76aJ+g4lCPQctsyVOb--

