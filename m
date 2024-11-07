Return-Path: <linux-next+bounces-4659-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5963C9C02E1
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 11:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FC551F21FF3
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 10:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65921EE02E;
	Thu,  7 Nov 2024 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ReuwcC3s"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2F71EC01C;
	Thu,  7 Nov 2024 10:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976541; cv=none; b=MDOtVgyiZRz4k6CnUhiGFcfRT6Nqj7A1Wvi7Auftuf1H8y5fEHxWH7uTrN4v8rJ5yNbR2u+GL+sUu58P6urr4R8JtwdSSPc0QBN0FV6L4VnQzvvtavTHBV20KM7DAE2MCoq+wbJddtQSShCsSdW24AD2bYpgVHV5HW3UDb3r5ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976541; c=relaxed/simple;
	bh=69iIimEgXf9zlgND0EXFh5dTi5/vvprbNQ6RRKcB2no=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gn2L5fsSShHTDdC70x+S7WqwSQHz8dXu4YPCDdNfOBuBTW3ZalXRnX35SUbaHp2eUaMfOrT9O2JicPSQkByKxMOoVCpQXVV2ut9uXNjDI3YrCdN4L9Xd5RRBoTrb6h1sW8099X5ZhalXuE/B+bgrgOZSUNcg+T8WhkUuWstz2Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ReuwcC3s; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730976535;
	bh=7HukMj9yu7DbJv85ts35JBj2wkftKYiK/WmpCCdDNjQ=;
	h=Date:From:To:Cc:Subject:From;
	b=ReuwcC3s7i1+VeDrRxjceA7li7idCGbZ6g14mFYv/dm1b7hJEFpQSkOoIDpwBKfpm
	 ntkn356BqrcXU4y6fyeJHio0AChlmSXk2thFFuxlZx0dkM/wUDFETH4ylBIbR7ycP9
	 2QRzMcMZiMvYcl/jPnt3/wcnL9u01ryuBmIaTGu9sfQ3uViLu3MWfI3EpwiGBmEXoO
	 RzWtGsmajTcSFbDaSQsqM8+2WlV+4piYxau50S8XWVk0LUtNLILQjsWI2yMu+Gt22D
	 anRG1gjBDm/84iiW7IFkNJ2u9NyKets2oFh5QUSI4/H5vvQT/d40dngQCSY19kIOpD
	 bqCyYly6kvVqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xkf2G6ndyz4x8f;
	Thu,  7 Nov 2024 21:48:54 +1100 (AEDT)
Date: Thu, 7 Nov 2024 21:48:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the pinctrl tree
Message-ID: <20241107214856.36aecfe9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TdBh6H37cagsI.9sgaJqNFe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TdBh6H37cagsI.9sgaJqNFe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mfd tree as a different commit
(but the same patch):

  50dedb1eb1e6 ("dt-bindings: mfd: Add support for Airoha EN7581 GPIO Syste=
m Controller")

This is commit

  f49f37f3cfe1 ("dt-bindings: mfd: Add support for Airoha EN7581 GPIO Syste=
m Controller")

in the mfd tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/TdBh6H37cagsI.9sgaJqNFe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcsmxgACgkQAVBC80lX
0Gxqhgf9E2bHBSNf8RPQR6NhnYud+8QiMhijRWZP6OrFjxgKNZS55keIuCWm1IJu
Ouixi0NMMWEuDWhDnwa7T6YZJ61KZ+g1rMEXCQ1ugwH47aAnDeKviT7HZUJOIQ9s
oLI43yCD3Yeia64LntRqEHAoWBe/wi9ZmWKxhCg2JaDwi/ck69g/N6Ml6mhHXL9j
C2DRew+35xuxwzmIyaIe+cNTdkBuSCZSlpRNmS1UBGehOL0RUqWcGrOiF9/3c/5Q
KE6rMOZeRNEuRtdZuv/r+0xKGC2FsnQG634dz+xAq+cM6plRB6v+FsIog72j7lQb
t72rzCkpkipnK+kD7YA+pH3OVWEO5g==
=xj1O
-----END PGP SIGNATURE-----

--Sig_/TdBh6H37cagsI.9sgaJqNFe--

