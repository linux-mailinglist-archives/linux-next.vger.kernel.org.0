Return-Path: <linux-next+bounces-3491-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAB0963721
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 03:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29D361C21CDA
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 01:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3168A125BA;
	Thu, 29 Aug 2024 01:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="o3Yf+kIN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B830679C4;
	Thu, 29 Aug 2024 01:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724893225; cv=none; b=Ah9MzXnTBjBBAokHAMIzH/hcDhFG5K1CBa7E57hnJzQP5BJQqDauqGp+XE41EYlK3PNKtvhBg0Um7iHvhT709LxS39EefmQNBuJB4IGX5talgROreiZZ4BMJVtOInuN3ySOAnSM/9Q/3kWhdebo2D9LUnLdSxNj5nVi9FjvZOr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724893225; c=relaxed/simple;
	bh=6KwvJ3MhT3qT7KjwV0IMDOV/O1jw9oxPCN/qfherGDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PFPE2djc2Pqp44/RObaB3MN3PuaTJdQZrNC4I3UHMwOXY5do1qLVYrdWBImxe6R8k2BFnUYmp7g7Jvg686+4h8qT/1vZlwbt3mF0QjVG6rDoa2bni5TrYIo3OxKwQmmGl4Do1KMSluQYTJFE5HQOlQt9PZwoxtZ/dBHeEkJYZzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=o3Yf+kIN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724893221;
	bh=t6GVX6srBa6sfGXGzxHDIXcl1PJ8YiIr8GKD0wNw9zs=;
	h=Date:From:To:Cc:Subject:From;
	b=o3Yf+kINEyQY8SM10LbQH3rUAT2CmbBayAnK6wPaWubMoKQG7a7IYrUpheEZ2yZVA
	 u4whmTilAfojEzy6Kz1KZ0qTk+MVAF5xcJNyTnil8tlKlRp9heaWjWNVcuvkZDR9np
	 ECb+VJ4CJzUOr3IND/MKncVFOp8tK28w8/H3BXf96t1n5M+e3CxTKuomujB81B/m5C
	 mce5yvWK5te/QzvNGGQcqrvg0l5Mji0EChhlLbM9ZqUks3f1EwMPutxmpuZybM3t+t
	 UU9q3lZv/McGhwghWK84KgOAWAox0+cjx1tTweFWpBAX1T3rJVBhswnsbXtwsJqN8g
	 kf0OxnxLI29qQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WvNHS69yhz4wxJ;
	Thu, 29 Aug 2024 11:00:20 +1000 (AEST)
Date: Thu, 29 Aug 2024 11:00:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Ulf Hansson
 <ulf.hansson@linaro.org>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thierry Reding <treding@nvidia.com>
Subject: linux-next: manual merge of the drm-misc tree with the pmdomain
 tree
Message-ID: <20240829110020.4c57cc46@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wUzKVJtthUU5ZLDz4vYnon=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wUzKVJtthUU5ZLDz4vYnon=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/tegra/gr3d.c

between commit:

  606cb5b75827 ("drm/tegra: gr3d: Convert into devm_pm_domain_attach_list()=
")

from the pmdomain tree and commit:

  f790b5c09665 ("drm/tegra: gr3d: Convert into dev_pm_domain_attach|detach_=
list()")

from the drm-misc tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/wUzKVJtthUU5ZLDz4vYnon=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbPyCQACgkQAVBC80lX
0GwxcAf+Kx/Gz67b6DAP9B1auUz4ZoGPkH5RVSNk1kU26C5TqIIH0uYHRmAdB0bN
4yXf9IgOldE82w7/8if2ksupEOV92CDNPvGjjhVH++ftgHDgfFF9+I0a/WD4b7js
2xanWUOMouJbmy/pwP+AfZ80a51ajv67SIyT048gk4+nGLxCbGs5G5Nw/wzS3+Zj
n7ZvzFX2RLmCUdIRSBJBTEbdnMj0xWl6cu3isAQ0oBYlVSZqbsrMPfEe9ynx6PSd
7BGu2supWiQp+dwoErGhD18TErmYbfHsY2vvuYEPFVfAsxHtd5ZNdK9ArMVubBGU
zc8u5ypPPMD0oI3lDMLkJEabzLBqrA==
=ZS+H
-----END PGP SIGNATURE-----

--Sig_/wUzKVJtthUU5ZLDz4vYnon=--

