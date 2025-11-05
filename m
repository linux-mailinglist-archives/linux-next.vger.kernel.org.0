Return-Path: <linux-next+bounces-8835-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF25C33FBC
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 06:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDD17462D77
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 05:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1B9230BD5;
	Wed,  5 Nov 2025 05:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GcyDSSRc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E315721D3D2;
	Wed,  5 Nov 2025 05:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762319925; cv=none; b=UKJ1CDR8AV0j879hw9wc4asodCiCFaOo52pIRR+IHdA2eQvnqTXwqX0u7LGA/WobF+Gu87XK/IvsfOCGqn3tWGjp9EVp2O+FjElNYriIXIftsoLOrMZ+mRgwxupZCVA5irOMexDArhsxrU2tyBvjmEqFnDqUQJpDdCuG6K/6CCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762319925; c=relaxed/simple;
	bh=yaTMEskE7h7fVXAemQzy7VygptbFBLgqnZ1JHjAgufU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CBWiv/0A5rCXuTxTcE50NQE19DZEFDYqAQ1TQSg9LjP426juaTfIpaHL3iWY3J4N6bM8+0kT99DghYn5GMEzzy+jXhWZNjBjOr1syxg4UdywaQfqnWpo5vN+SgcrNQ6PR2ckV3GeR89xaH1dSy9Z4zSSx56/tE5JckxtuYSep7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GcyDSSRc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762319919;
	bh=ichHGeDwY70+I/RnBYNCZZZ1BhgPXBb2VMOvu1qEqvI=;
	h=Date:From:To:Cc:Subject:From;
	b=GcyDSSRcAEtJfO6DH4I+takfpzblYIi35S8o0TZEtdE6WVU5wIOPK0iW3k0r6QO3j
	 jbQcygkgvFcvnkTXKAt3/JkI/U+dQum797he6MKcu1LIp8YiOkFewVopzINxc4eLZI
	 ZyLsQnwh1BX8WP/MatcOCAqW72KctoaeTyhIh+OAGq9IWSDLW09sbOo7Ky1dQ3gKrM
	 JSc6bTNh7h4KChyU45b2kEtHrkyhAu4GAcXZPY4kBX34ebjUGdr4raciVAA0CsJRF+
	 ROfBCtsIgmhHxPAq8At+VYHn3FEuuKuOM33Ux4q/5QCuoczeZmib0z86NDMjtEbPKQ
	 yymB1VOwCfIXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d1YWf6Kldz4w2S;
	Wed, 05 Nov 2025 16:18:38 +1100 (AEDT)
Date: Wed, 5 Nov 2025 16:18:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20251105161838.55b962a3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gEv+8uzGFpiFpXs6qTHfFyL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gEv+8uzGFpiFpXs6qTHfFyL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (KCONFIG_NAME)
produced these warnings:

Documentation/gpu/drm-mm:40: include/drm/ttm/ttm_device.h:225: ERROR: Unkno=
wn target name: "ttm_allocation". [docutils]
Documentation/gpu/drm-mm:43: drivers/gpu/drm/ttm/ttm_device.c:202: ERROR: U=
nknown target name: "ttm_allocation". [docutils]
Documentation/gpu/drm-mm:73: include/drm/ttm/ttm_pool.h:68: ERROR: Unknown =
target name: "ttm_allocation_pool". [docutils]
Documentation/gpu/drm-mm:76: drivers/gpu/drm/ttm/ttm_pool.c:1070: ERROR: Un=
known target name: "ttm_allocation_pool". [docutils]

Introduced by commits

  0af5b6a8f8dd ("drm/ttm: Replace multiple booleans with flags in pool init=
")
  77e19f8d3297 ("drm/ttm: Replace multiple booleans with flags in device in=
it")
  402b3a865090 ("drm/ttm: Add an allocation flag to propagate -ENOSPC on OO=
M")

--=20
Cheers,
Stephen Rothwell

--Sig_/gEv+8uzGFpiFpXs6qTHfFyL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkK3i4ACgkQAVBC80lX
0Gy6QQf/YaptmVCpT1E3I7EpmWV/90tU+zWzEWtUS/xExSsKbm5jribfBZojPIPG
ynloJychSiFMOr/rvB35vfArDrMKZ+2249re1taf9k1Hm3oOVtXKdxx3O208VkFn
PqX1k6mmcAReCstQTjfW6F+W3urbCu9zWTJCwr3tXtCx3qVBP1wevZX5/mDDvJwZ
RrvJi1F6uF/SHYtT3Q3T0/aqYKC8a/SrnrdzD4LGSEpRHaT5hdu1uKZNe277ZlfT
sihZNq8gIEsb7s4hcVtU8FFubM+0xBZGF5UBTQOBEUzzrlgTjmZXFP24wzK2b9Em
GkPWkgoAxm+xSn3IcbGZpPdMo0KRXQ==
=tMzV
-----END PGP SIGNATURE-----

--Sig_/gEv+8uzGFpiFpXs6qTHfFyL--

