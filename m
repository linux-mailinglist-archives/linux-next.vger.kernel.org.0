Return-Path: <linux-next+bounces-3684-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9565A9714EF
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 12:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 523BA284AFA
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 10:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D741B3F16;
	Mon,  9 Sep 2024 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="si+DqjI7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEF51B3F08;
	Mon,  9 Sep 2024 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725876593; cv=none; b=aiKJXbawJqRREc2Pb25F+VvSd3f3jN7fx4CeDhDGkXpav/vJ0Ei9GZXtrQvPtbukNkhl9Ozy9arBEI14GUlOPnlDsm2qsp7uWAVEqUoaWTA704Qk0/cCFiVL8txiehZ6+U4VZr2OIayhneSAoN0d1sNtZAn9b+wdn6JAy4lgLJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725876593; c=relaxed/simple;
	bh=Tqhktm48Tvpwa/Mci0L+SpDDhG1xC06qNM5v7GRooLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NEDw75dFdEWTmy0NMcKUa5RenXXauEdXD0v0wCatNiHQ1h2yyYA3hp7hinRLw2Xjnyqs9T3vJZOCJgP+HI9Xqe+3G785wUoSugyY2dynyQvH+AqPCTS2yzHuHgVpFstJFyql4me0tDZlvETVYVE6vJhpxC0kJbSEQRaWId19iv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=si+DqjI7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725876589;
	bh=jlMhYQgkHnB97TYYkfaMe1TWYOcT+z7w/DMkDtkdwqo=;
	h=Date:From:To:Cc:Subject:From;
	b=si+DqjI7XGoiwjiLj1DdM8l+YpMTMZ70L0nO9Y8wEAZUodDyAJ2GD3hQwfqR1CaKn
	 UEtOtNBQz2hTLiyhpMTeyQpXynUWeZyhilEmBjyfIBlJrIoaQq1jQTqh3WKVXbcRFL
	 LTiRiBfeotdYn71yOHJQakmJ2m9I/9NiuW49dCWPEjiYy4nfGnhgI3iNW/yUHUDXBr
	 9uy9mFBzyBrL6PlcHDB6jrC/nIv+1F7pLdrOeh1HxTlGCJHr7MLDzfKsXXsjDbS4LY
	 zA43NTUd2igl0aY0SFQWQtRRo2VEKkygV2dsrgZcsoVmxFu9JNVCL4cyDbThNZULzE
	 7JKNWzub7eiIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2MyP1TcSz4w2L;
	Mon,  9 Sep 2024 20:09:49 +1000 (AEST)
Date: Mon, 9 Sep 2024 20:09:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the powerpc tree
Message-ID: <20240909200948.70087f49@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4AB8h.HOyFeR3ZsoL+kqqtR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4AB8h.HOyFeR3ZsoL+kqqtR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

make[3]: *** No rule to make target 'arch/powerpc/boot/treeImage.ebony', ne=
eded by 'arch/powerpc/boot/zImage'.  Stop.
make[2]: *** [/home/sfr/next/next/arch/powerpc/Makefile:236: zImage] Error 2
make[1]: *** [/home/sfr/next/next/Makefile:224: __sub-make] Error 2
make: *** [Makefile:224: __sub-make] Error 2

It is not obvious to me what change caused this, so I have just left
the build  broken for today.



--=20
Cheers,
Stephen Rothwell

--Sig_/4AB8h.HOyFeR3ZsoL+kqqtR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbeyWwACgkQAVBC80lX
0GwVEwf9HVJTba1AJeaFI8U2LkU+rCnMOKxJbXsV+/Xjm7rKzngSv/Cx6n5rpXEb
LjQ1a31r3x1xFcLDwz5BiZyPIGiR/LHO7FR2NMKgyZR06d2LyU/iDB/6VFeCTYyW
phYAAHiRNM6rdpxMpPsLFripeNHfpdWy5wgkLBYxwBQ/LZHYGJPYzGdpXpLsIHnG
Bd6xBdN5H5obPvPCQFjtKVa3SyyHxV1HoeVYnzCgODHD9QR937y7zRnXEm+3UJgs
ec+jqd9kQIj/HWtEs2s4cTyOtrblk9bzJ5/bvUhsKPIUImiCVyhDEV3KuACgwORo
IWSJWUauBAg4N3tN585x+oDGHJs2nw==
=XbtQ
-----END PGP SIGNATURE-----

--Sig_/4AB8h.HOyFeR3ZsoL+kqqtR--

