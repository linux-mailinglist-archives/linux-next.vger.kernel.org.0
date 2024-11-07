Return-Path: <linux-next+bounces-4647-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B4C9BFDA1
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 06:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59C521C21658
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 05:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BE119048F;
	Thu,  7 Nov 2024 05:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jUy7e92f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B941917FE;
	Thu,  7 Nov 2024 05:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730957115; cv=none; b=aCJXKdLhwIoxkO2LtSMzRvbh7eue+Zc7elJdVZd5gHL2j3AnA3lKOw1nX4P2HVQfTiYvccpngcsCGfiMxUv9InY0VLc1ZB8WJVBpDcJnpUGntBGjXuSz2H9zzf9/ddX2idIyHRt7GXlRd6kkFfwDcCehLMYZHAJmbmIJavmsOuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730957115; c=relaxed/simple;
	bh=Vt9Cs5cB/C38gUKqclQ+v1jvHHP/Z44iPOcSGq8Pq+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qJ/j0IBqF8fuEpC8K9U37T2YCumsLg7ff031P4qV80J+VhUR23biNjNTjAygyYoe8yC1ux43bkwGBFpYwx+u3raRrFRMgh0PpeTb9HKN3esOFYwRo7NdyGvEsw+9xUeKv0WH+lTufxhIeV3LkJvFz9cZLvQAY40EouQDRejK+/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jUy7e92f; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730957099;
	bh=T51IWPPUCUcNaH1BmKtk/WlM0E4bvo6/dDk0WtGda0c=;
	h=Date:From:To:Cc:Subject:From;
	b=jUy7e92fmdRE6SjPeFXzDqh7HhAKRlCOlrFWxGQ9mucvjmgJIe6Ac6RqwP+QxxqK8
	 a7gDd62WTO9HMxGDtA3kDwf4NLRpw+4XJ9O49gYmdgCVPhwdLkiX3GExgO1TIthriL
	 t7OGrPi826Sj1rrNYudhGoHxMp3KeD95zq/wt51Wda3OIzZcqxik2vT+JMqDQt2+x3
	 JUhs9DMwuPTlQ9K/CqnVdd6MYsBCPG3H+1g0BypOkqeMfSgeEqHSduNSn2jlebHHED
	 fp4lJQE46GESq5zHBlE7jDF23O2x2o05nI5BvvgJfDvS0apdiSj9u6UWY/Y0j4KPrp
	 JR9U+wFuGR+ng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkVrW26Jyz4wbr;
	Thu,  7 Nov 2024 16:24:58 +1100 (AEDT)
Date: Thu, 7 Nov 2024 16:24:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Philipp Stanner
 <pstanner@redhat.com>
Subject: linux-next: manual merge of the block tree with the pci tree
Message-ID: <20241107162459.71e0288a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KVRguCQE5VXDW+h2LsySCAn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KVRguCQE5VXDW+h2LsySCAn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/block/mtip32xx/mtip32xx.c

between commit:

  5080394a8fcb ("block: mtip32xx: Replace deprecated PCI functions")

from the pci tree and commit:

  91ff97a72259 ("mtip32xx: Replace deprecated PCI functions")

from the block tree.

I fixed it up (I arbitraryly used the former version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/KVRguCQE5VXDW+h2LsySCAn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcsTysACgkQAVBC80lX
0GxMIggAoZ7P5eMVm6b5apztxVjYlz/5yV2/v9rXMChU6uZ1WoC7c6J03XpoB4or
1R7em+i1mBy+pLIojHygcqm8e6mdxCPYurTT1wLQ5hTdHwITW654HY97uF2opoHs
uRN8u3WbVBs/We262nttL6bELcQ6DEez4Ny3u0N09tY0Hobw++Erl6mrDqTwUzaR
wspF1oFqsqxqUO7JgzWM5fZxkKKvcBECJzY4nEMAphD5oKEHqp7LUsCMBb15w2yf
vNq0NqhDnI/weR/x5M8Ibqvm39RThBt9JXUltM8o4S5ja7WJyBnGfuD699Yswo4p
nvpOIn7YAQqIECTUeu7gkIAb9b7foA==
=DRd7
-----END PGP SIGNATURE-----

--Sig_/KVRguCQE5VXDW+h2LsySCAn--

