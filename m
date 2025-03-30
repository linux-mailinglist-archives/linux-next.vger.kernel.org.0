Return-Path: <linux-next+bounces-6095-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E6EA75D65
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 01:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91BC73A78BE
	for <lists+linux-next@lfdr.de>; Sun, 30 Mar 2025 23:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1F11ADC6D;
	Sun, 30 Mar 2025 23:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pId25eYh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD3B1876;
	Sun, 30 Mar 2025 23:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743379035; cv=none; b=FzF28GECRAwow/F2cln4WBjW0V3eNH9/2OfAWotL0J4k/bCM5FdhAG498h0+opA9nt5JdJ/uG3jriEh8Zh/xSD32EWKSRS6UsxzxGMnmW8Aia1IuS+jhbyEc82wsp72nBpVU1RVJWMyuQu8U8X0B18MA9MtNf09x8ZNLzaQ8KCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743379035; c=relaxed/simple;
	bh=LmuhSVgZKmyT4HmOcs80V3yny9lafUjqV8PzWLmoMNc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BwXDPAJaBGv4ioSfbOgDpAZpK9iZEzI8910+SRQDI1wFzqitrN0QJ5sr0MKK5q6JMdc0Nxeq5XjbHCf79E8I1DnHhZFXnngHKMPXWInTSlqAvuBofmArMnLn7UDaZmSv3VRMiKtK4Qdf7kzSLI6o2TG0VhICN5LELoYwlr7mwXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pId25eYh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743379030;
	bh=1Dmo4GHPifvt9bk9c1jPpHERZ/BKdA/aLhRg//dKecI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pId25eYhtY6xK/nft2AomMzH+XEaZi5GrLlucBj89ixvjXmuwg/tavb9tMrcScH2U
	 /iMq4zcgMdqAg31M5ByTuMIbIT+dRy5wCuWU0Yz71ZXugiH2uQ7kKnQt9Ekp85JYLA
	 kAAJ4rFU2Pft3JXQRMdDBeCZ2pl4ZRq0TGV9rJCo4zuwhhOlXtJaKGb/VJnrR8xHyH
	 al04ftPnvOq+G7TZqdIdkJiBzFmmqfBAeoxyBkUCH0/nA0sZcs+iZA/e1ZCGeJmbo3
	 GDiV2Pkb5ii016+i39xSv/SWBrMFf/cDrLLaaDPZfwMugYpPCY1l9yPHgH7bbybB7j
	 abwzPh+1xAXMA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZQrln6fq7z4wbx;
	Mon, 31 Mar 2025 10:57:09 +1100 (AEDT)
Date: Mon, 31 Mar 2025 10:57:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masami Hiramatsu <mhiramat@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Uday Shankar <ushankar@purestorage.com>
Subject: Re: linux-next: manual merge of the ftrace tree with the kbuild
 tree
Message-ID: <20250331105708.331ec145@canb.auug.org.au>
In-Reply-To: <20250324164111.20c92791@canb.auug.org.au>
References: <20250324164111.20c92791@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fn5qcwP+BfSlpDSjOCX53fw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Fn5qcwP+BfSlpDSjOCX53fw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 24 Mar 2025 16:41:11 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the ftrace tree got a conflict in:
>=20
>   scripts/tracing/draw_functrace.py
>=20
> between commit:
>=20
>   9d702bb1d3c0 ("scripts: make python shebangs specific about desired ver=
sion")
>=20
> from the kbuild tree and commit:
>=20
>   a926d15a799a ("scripts/tracing: Remove scripts/tracing/draw_functrace.p=
y")
>=20
> from the ftrace tree.
>=20
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Fn5qcwP+BfSlpDSjOCX53fw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfp2lQACgkQAVBC80lX
0Gze5gf/W3ZJD3yNtQFKdZjC5mKll29ce0pO3oDh9yDxbgzx3pGIBOBp0X/xybyt
2a+GeVZAsTRov1iYMO25Gs6womett4aVP7ueN6GmNhRLRlJDw+tN8B7BNUboomyK
X3CmB9O77suMFooN1X/KFU8Pk1TZ/VGBF4i76cLjauLF5VkGP2S8XMOtUmHOE5Ol
vRjNGT7ShsUL/EIa/Xv68sj5FR375at2TBKRGSpq3JCGkGOpxwNwFrhbb2i64lxU
yJTrcjY7Y1rFkS6U+x+KCidQlxZLcCUOxk/mKwz/3IcRTlPePqKKAVDNV5AGU6jt
LFLerBpXYnrdeU8H3348Di2CczP7qg==
=1mnR
-----END PGP SIGNATURE-----

--Sig_/Fn5qcwP+BfSlpDSjOCX53fw--

