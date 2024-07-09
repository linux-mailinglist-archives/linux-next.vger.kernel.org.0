Return-Path: <linux-next+bounces-2881-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 741B292B4C6
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 12:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E335283C0D
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 10:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D687155C94;
	Tue,  9 Jul 2024 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NmC1CwQf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994DB153824;
	Tue,  9 Jul 2024 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720519738; cv=none; b=o1cdKgBSXstMjZDODji0tDFn60ToYKKnYD67liugq1JSmU4N5r1hoOn0B1Bt9xcB+/QWyyWYOs0v28vwQE8pLRBVbzfKK1URnUO24UdUNN3tRaNyduTpOw0xC6+bhnYspwY4G5OMoVyKk3Cw+oxuY5AW6V8BkpXA7GqqQ8L6bgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720519738; c=relaxed/simple;
	bh=b3D5mFHe2gAV5XZGi93yiYy7VXXyq8oSkdfJoHhpfXI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tjgm6b7gWU04PRLqTQYQqjtlLhVcrnpBE/bNZGF3U7g2QjMTE2T807v6ZwTkQTzjl0NDAWj1b8ekTklRtbFY4crpfQKq19b9jGXGm7iXpVdy+jjY61fIOy+F5/OnbramTYXP41+lOpu860RJCHlCytke/4XL3UJr56p5Nv6cTjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NmC1CwQf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720519733;
	bh=5N1CgL0czTrdQ1O9I3N4PZaujusxp/eBhYnrXEwNLaA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NmC1CwQfVwAtG9lnEozKuDGmwMH2prkhlk63xC1VEJN+vEa03pC32WpRa9O28dukM
	 TImJvSr0CK1+aEpdMRKKAzxlFJ3I4BHMdiUVqp9bIPbgfJ+/C9/VTc42qq4qXI5mbM
	 WQTamuiz0cHTHyVb9ZEYIo+tmDRvekOAhMsEzcpAcow3WT3FlgvPx+nVgwOsAAb4t+
	 ZuLZYPdZ42Dm1H3cng0K+d+NkrmXaPFfA0V1f43jcsUw536+masFHwFEffaSKsR+Jm
	 UAVjScYI1SwWMjds8/g5+Ir5elHfgTOa6a9JALByO+pEsYQovEytXCYV2u3cLmdLkP
	 0uzpZwVOVLaxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJGsx2SDdz4w2R;
	Tue,  9 Jul 2024 20:08:52 +1000 (AEST)
Date: Tue, 9 Jul 2024 20:08:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>
Cc: Christian =?UTF-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 asm-generic tree
Message-ID: <20240709200851.4d921e43@canb.auug.org.au>
In-Reply-To: <20240709105709.18ce785d@canb.auug.org.au>
References: <20240709105709.18ce785d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uChFyqG3dnbzBxBf.3BwiZn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uChFyqG3dnbzBxBf.3BwiZn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 9 Jul 2024 10:57:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the fs-next tree got conflicts in:
>=20
>   arch/arm64/include/asm/unistd.h
>   arch/arm64/include/asm/unistd32.h
>=20
> between commit:
>=20
>   ea0130bf3c45 ("arm64: convert unistd_32.h to syscall.tbl format")
>=20
> from the asm-generic tree and commit:
>=20
>   e6873349f700 ("fs/xattr: add *at family syscalls")
>=20
> from the vfs-brauner tree.
>=20
> I fixed it up (I used the former versions) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This resolution may be not enough as I now get the following warnings
from the arm64 defconfig build:

<stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-Wcpp]
<stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-Wcpp]
<stdin>:1609:2: warning: #warning syscall listxattrat not implemented [-Wcp=
p]
<stdin>:1612:2: warning: #warning syscall removexattrat not implemented [-W=
cpp]

--=20
Cheers,
Stephen Rothwell

--Sig_/uChFyqG3dnbzBxBf.3BwiZn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaNDDMACgkQAVBC80lX
0GxI5Qf9ESLnzAKkyfCYvrEzYJEGI6eSeeMKnfM/VEjejyl//lEB8B7KvCf/jjXL
3xBhgR9wrYElXRZemOiyyEXOQSskrPTW6HysJKJ3v/2vCVeHfFhW9FCi+9hK8b1K
9BsUF70O8H2Nvz+jCmuhaqJuMnogpcRVkX5sq/O/6zhuhQei4J2TCjalJcUr9gOb
9+6s4Vwj4c2EAuWqLB55oPWtxZoeSLHWY6OlsTDMxSb65UxU1/F+wy6sWaSnuRkq
jDces2t/JULyIw+FI23ubZNfyniGLklbNzVKfXe0m+8cptxVv6zpwc8J6STXv+cj
1+Kks55aTAzbL61jt9JLZTtAuHqXPA==
=gcpY
-----END PGP SIGNATURE-----

--Sig_/uChFyqG3dnbzBxBf.3BwiZn--

