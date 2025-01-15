Return-Path: <linux-next+bounces-5208-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E022A11674
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 02:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0C7E188B088
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 01:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA2F200CB;
	Wed, 15 Jan 2025 01:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Nbgizg/+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69490F9D6;
	Wed, 15 Jan 2025 01:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736904119; cv=none; b=gaqtdpYB01mCZqEu0JXxeqHZXMpDiehVsJ5QFSdXJo/vWUhBxJxb+Ynw3kxJZuEsyYCtFwAZ88xvYALudiXUaNczliBqrwyPcP28O8aImAqgu70YED1+GGiEvmkrVuMaM1n5s0swHBbHGc38KW1qafiQF5FTyE/5szvC+vvKdg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736904119; c=relaxed/simple;
	bh=H4/QQ7eT0HZFPZJJblHfOvOeTwSt4izsyDxEWwx4iuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pqg74lzbZHjUmlpAWFWvTWGpXOuNnIiUL2Qd/duiegukn+eedXN+vLROH00RXbspVYbbXou/R+U0iv02iX9zTibOYYMfCjTK/XZogL8FmANqOa9d0Mtf2b/4Yy70nulcuLKH2klJAT1RBHhudyw9KHEYNwkv1cpzflfYfS0ew5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Nbgizg/+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736904106;
	bh=kb7+rS4racKCDrINUR7ofdq57fmaVolCAbgQYocRaBs=;
	h=Date:From:To:Cc:Subject:From;
	b=Nbgizg/+TILeb1ftRQFrkMKVnc/cEfVs/6E0tPymKsjVRSG5Wo2Zw/CRyzTNFqHkr
	 M6yQU1g3+yTzZ/I1ub6xO/Xd2ZDcYw3EaZmaFMBcCQvMykOpDe1QbaEtJ6z/JaeNTh
	 3vmyewGA4xwrYCizNDTGq/lMgfnm/jNHmTs8eso2lMeD7jhdc4sTJ+cVWI4GM5tTed
	 1ew4O9rd4MQFxV2KS4cnCSl1ZjS+uY/Z8WuWDn1IE2txb6G+J651hjbW1BcB7EeB/R
	 BMNOHsgM6nnGWKAx5zYIDFoQJffvGwlLN11fiolapmuWVZAsHmHfOp9OiZktCw9L2V
	 o8kfiUHIyHSoQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXpB21ZnJz4wj1;
	Wed, 15 Jan 2025 12:21:45 +1100 (AEDT)
Date: Wed, 15 Jan 2025 12:21:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20250115122152.760b4e8d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZV3m6HjlaBf_wsy8=.bV=5S";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZV3m6HjlaBf_wsy8=.bV=5S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/realtek/r8169_main.c

between commit:

  1f691a1fc4be ("r8169: remove redundant hwmon support")

from the net tree and commit:

  152d00a91396 ("r8169: simplify setting hwmon attribute visibility")

from the net-next tree.

I fixed it up (I used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZV3m6HjlaBf_wsy8=.bV=5S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeHDbAACgkQAVBC80lX
0GwBfQf/R67Fl0s5Zwk9umBbwj6GeR594BEapLVealWbPfmaJiaNVPJsTO5+1b7W
EEVXVCdhYONHJOftNPQ39xgZjH9MCo7PL+DJCRQRbvYkbqVrz6ME8CmzI2LgoOko
xXR8WC2f7takrF+5dd11x7o/morx9cpHIedgkiDMD2qDtxbFwcPE0gkNtM8jOa7e
zWr5G3BuI6DazPXA1ZDAY92obYyVdyGqwFg9ebZ1bx3keIb3jszWAltmQDA7/V4Z
4QfqWknfqRUPpHUwuYvcmOetUuvcVRKO+KLJW2NQpkWDs/qClQvDnqF/HZHQt4sI
bSVVhXYm91j4jPI6wgwWcA1Tshj2Fg==
=Qb+O
-----END PGP SIGNATURE-----

--Sig_/ZV3m6HjlaBf_wsy8=.bV=5S--

