Return-Path: <linux-next+bounces-3921-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9293997C3B0
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2024 06:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5092A28334B
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2024 04:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE9F17740;
	Thu, 19 Sep 2024 04:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U8cXTgJW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBAC13AF2;
	Thu, 19 Sep 2024 04:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726721645; cv=none; b=ptUsygNRLuKtNJeErF87uKHBCTQoZy080HRwAi5tpgRt6DOs9rvUnwIs6+V2wkbTuZj1oeuwHK/mkFKvpadhupKhjhGz3Cc8IIIch9yjMM57V7nN1rRcigAAI6XPfjvypP4DQnjdmOOgPTdv9p5+lYldyAn2MB99+Fy3wDDXdHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726721645; c=relaxed/simple;
	bh=tz6E3ka3jkCWhvPCM7EMHBBD4rPBH2CXpJdZlMy/fw4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LQoMEdPZF6rolkt9nCb4jSOc18ZJpxLqMRrLUKz52FW09L3rWAkgvt2TrJXsKdFel+AsKpOSkOIXe7NKbbr8DCn0nXBblwCSjifewGYm2898mnqieXQOK08EeDlX31a0w/9XQrfelXerdUapZtbIVja6IxyqSUALdsmDjC88oX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=U8cXTgJW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726721637;
	bh=2VKKWjjoVAmfJI9kGaDqtDlZVRiio9DIaoZrwwXawBs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U8cXTgJWXU6xYZhP3mtXHymmRV4Xy2E3U+uYG+yw1cA8YAIRQKZoU/d2MpP6u+7YP
	 KcrhB4YthrqOUXVH+GSKxeS/f+PiV9A+DwaXVl7AfzJmfJM361wcBjfnoetrgd8QdX
	 BZHpy6IP+lB0z3rch8ooBGyPJup6r7fanLTMWdSZ9oQvrLgNX2eQXA4DxVcKP6J+gY
	 WsdRpxj7quvXbaOmpl2gY6Hk2XcWMwJa9r+mqcrcLWVxLCtGuphrjbnwoAIGUcL4UL
	 58KkVib8g3XAIi5wPUpWZBjOU6z/tl7t1BYBs2M+1oVoudDPnOcaUMT2QhzPg/XiNr
	 ILACQNGB6yifg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8NTJ6lJqz4x6l;
	Thu, 19 Sep 2024 14:53:56 +1000 (AEST)
Date: Thu, 19 Sep 2024 14:53:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Rapoport <rppt@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wei Yang <richard.weiyang@gmail.com>
Subject: Re: linux-next: manual merge of the random tree with the memblock
 tree
Message-ID: <20240919145356.2f205696@canb.auug.org.au>
In-Reply-To: <20240827150453.26bff4c3@canb.auug.org.au>
References: <20240827150453.26bff4c3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EWNTv1kVTskWymq/oZwg7sb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EWNTv1kVTskWymq/oZwg7sb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 27 Aug 2024 15:04:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the random tree got a conflict in:
>=20
>   tools/include/linux/linkage.h
>=20
> between commit:
>=20
>   d68c08173b70 ("memblock tests: include export.h in linkage.h as kernel =
dose")
>=20
> from the memblock tree and commit:
>=20
>   9fcce2aaea8a ("selftests/vDSO: fix include order in build of test_vdso_=
chacha")
>=20
> from the random tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc tools/include/linux/linkage.h
> index 20dee24d7e1b,a48ff086899c..000000000000
> --- a/tools/include/linux/linkage.h
> +++ b/tools/include/linux/linkage.h
> @@@ -1,6 -1,8 +1,10 @@@
>   #ifndef _TOOLS_INCLUDE_LINUX_LINKAGE_H
>   #define _TOOLS_INCLUDE_LINUX_LINKAGE_H
>  =20
>  +#include <linux/export.h>
>  +
> + #define SYM_FUNC_START(x) .globl x; x:
> +=20
> + #define SYM_FUNC_END(x)
> +=20
>   #endif /* _TOOLS_INCLUDE_LINUX_LINKAGE_H */

This is now a conflict between the memblock tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/EWNTv1kVTskWymq/oZwg7sb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbrrmQACgkQAVBC80lX
0Gy57Af4h8n3NFnHsa2wjKYKzROHagUZ/TVZWRRBuU0YBwNGZ2K1YkkibY2zXDis
J92s1Yhn3VWzo3a+qLz7eDbW9liypUgDdNLvi18sS78ta0zl71YNDT2mSfmRSjk8
y899lAIIxtzEzbZb04AbVMQCVBmHb9+hjhGc46ntRjuYF72t+D6BL8oP3HhcwYTj
UJBlZpmY4zPKCXtjRdNMidKPD+u2kNEv3Gv7ng5Oyrw6K5hciUSvAsR3B3+Xjwpi
5ThlBBCOYkrqTB0w/dPfy842MT+oHrv0OlRyLpTD3gncIDof9pVUi0/eiNISwqCF
lK6Gc93HsSmWA2AOQQMeXFazlPnJ
=NIdo
-----END PGP SIGNATURE-----

--Sig_/EWNTv1kVTskWymq/oZwg7sb--

