Return-Path: <linux-next+bounces-7135-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1D0AD4A08
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 06:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 414CA1883C51
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 04:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB00202F6D;
	Wed, 11 Jun 2025 04:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WFNSddxp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCFF178CC8;
	Wed, 11 Jun 2025 04:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749616121; cv=none; b=oj7X4o+f5Gh+H4zDXEzIhBMlUJ71c+PieDwnptFaWLljxVz7OxiBkHhAe3PHuo7u7+fnJNSdO9Hng2XJ2DEj/ol4+HJnZ0I+LzCwIeG0R8Nx6ZbkLG9lJMSWqUwOW7BDRWrmmdxsNQm9bvnD6s3GhzTsR9VxhPj9bSn79RBiFNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749616121; c=relaxed/simple;
	bh=Q/OCq3lXcxdbnUxhcOOO2D/dFPCxBlPFJi1bgVm4VaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kQY0kNWKfxzQi5ZYG4h9XZDGUVf3OrDgGWtEMp5KzD2tbFdGkGQsu0mV0cr6VHINrVfJjcEVAGdAeuYAcAwG2ceiGelT6UoB9QPkJ720t+4Y7d7ilEy7hraO+vAD0gX2owVptJQVnfdicQE8GvXIzsRk0FMg+5p0fDuO/7/Caco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WFNSddxp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749616113;
	bh=3eETuwPIbKtB9JIcRriAni656cBPkUHZeMnPz3I6g0s=;
	h=Date:From:To:Cc:Subject:From;
	b=WFNSddxp+EpD0D9qnA0S5wGiyyPO34yZNGejhrT4QAoBfAgUf4t6icPnbSFRMXshR
	 CbQHb1DNybqfTvvqR1mLYvQWzRkZB7Un/it52wQDvnyfejoHkM5Z8nNFvrl8G21WsT
	 q9BcphHtgLoXaGRAQp0AlytQYUxWye+Jh3wtGDrXiKhHeRck8fxgl2zac3uia8eXkL
	 GhEeVXDCM7yLCCQESCNZ3SH4pq7rvtZ2Hit7GXnzhE7iQCqrR7JhkDaWmHpjHsAj4K
	 McdPwMWCBxT5wCU0bm+jrY5K2JOS+6Smq01CXXTsAGfjw4X6HEqDyFgvmJy23fkGG/
	 29nYdxyxthGHg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bHCMh6mFmz4wbW;
	Wed, 11 Jun 2025 14:28:32 +1000 (AEST)
Date: Wed, 11 Jun 2025 14:28:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the crc tree
Message-ID: <20250611142832.1e151978@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/23Jdg4zSuZK5E/iFlloqB6q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/23Jdg4zSuZK5E/iFlloqB6q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crc tree, today's linux-next build (htmldocs) produced
this warning:

lib/crc/crc32-main.c:1: warning: no structured comments found

Introduced by commit

  3eee6f3d771d ("lib/crc32: remove unused combination support")

--=20
Cheers,
Stephen Rothwell

--Sig_/23Jdg4zSuZK5E/iFlloqB6q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhJBfAACgkQAVBC80lX
0GxOXwf8C4WVYAM01XK+7gwzn/7++PG0kn9k8K4C9CcKqBEqQ36Uibh7QNkV2pbe
c1mFuwoglBNfjP+L3hYLhu4gAPLQydkkC+IKgDsWJs00BM1IcAdg71Zr1510h7NR
8lRWzsQ/VZ2r9Ucu/3U+t6PfcnFpwQaavzO1PCwjgPQNnWaCigdw1lx9XQVDW7Yu
kPn/ea/naYqxBpO8kPq9PFx8JE34QLmd6r/RwPG3cVNQ+Q3i9AkC74tsRCrE+AfU
4GERfR8Oy017Qi8YZLFst7gxe6ITpp8uN1XmHrZzznKsN1+RrC29lBY1isjpXuHV
CYDf4iY95Pb3RZxffXlV2dcDwhHGIQ==
=jTGd
-----END PGP SIGNATURE-----

--Sig_/23Jdg4zSuZK5E/iFlloqB6q--

