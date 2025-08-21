Return-Path: <linux-next+bounces-8052-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5F7B2EC07
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 05:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45D17A20B90
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 03:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E902472B0;
	Thu, 21 Aug 2025 03:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P3+GrhxA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F080214204;
	Thu, 21 Aug 2025 03:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755747350; cv=none; b=jp42bnu3K32iEDKzt/ljuvmDSA37Vr2i+nyaRaC8TZIYbkBygmO1I2qs+H+1nGabQD2xxt8FjSHm8Pzm7cU9NXcuAcn5sub4IUOf8SKDYkuTvTL6Y2QgPaX49UuKnE6idKV2oHA1Ww6F0uH4FfJeb+Xd954RQMQsFe/oGLJmuco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755747350; c=relaxed/simple;
	bh=3IfwOdcIMRM/TlEGGMXSCZl1y/qIcxYpZNnEJ8Xn75E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RRn+AFiTmQFCE6Tv+OFugNhlvO1RNrLD82plGMl8FP8MGieYiFRm2VbzMiBNXp3yoGMUKDy2ENF6sp/qt+nXcCcEVG6e4547XG21Vrb7pDK/uHfoeNaA7B1ahiQxwgaOqyxDctBYEaK30YCCOu9G0CSKYktH0I209eJDHSLK8+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P3+GrhxA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755747342;
	bh=1AKuf7vxx8IeHIhpQuTZq8jiosjOGEqTIkKTv6PxRs0=;
	h=Date:From:To:Cc:Subject:From;
	b=P3+GrhxAIBPNPn+zw4qVZPknRcJwjnxqWw+WwGevuEzBDBzLu4hCH9pa4UOhoSLZ6
	 EA+eu6vlNF628RYJUSb/a3Q1vIGlyjxu7fev8E+75cHlAuKUE/8ak64dxXTTtQqKdE
	 8NIuouscHGTKVXRE28BexQ5GH4KuJOACmdb8ARK38jSJy/wDzwBlcxNgXPbRhlopxK
	 gB2dV62gE89wRAbxGXZYCs+PKSuE8Kky+gvF0Bwbq+P4AaeVp7uVLKW+n+GfnaqcXx
	 dH8YceJs4rfvuiTn+dtoQrvUblCEZde7TPrYiiuWp572aJKDn4F3/fpuZfg6jslCc6
	 LRhfmGfITk04Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6pqx2d1lz4x7B;
	Thu, 21 Aug 2025 13:35:41 +1000 (AEST)
Date: Thu, 21 Aug 2025 13:35:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20250821133539.03aa298e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MerbLpHnCb_izFKYbRB=67x";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MerbLpHnCb_izFKYbRB=67x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: include/drm/drm_gpuvm.h:1059 struct member 'map' not described in =
'drm_gpuvm_map_req'

Introduced by commit

  000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")

--=20
Cheers,
Stephen Rothwell

--Sig_/MerbLpHnCb_izFKYbRB=67x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmimlAsACgkQAVBC80lX
0GyRIAf7BHOuRQZf/Orkw0SVZ3FevVsN9zBulFjPOaUxUnZJuEH9YDaJZWJpNG54
Ln2SyRaKVTwR/T/ks9iSpxICnmWbjAjYrA8C4AMrhItTAWHcWiibuNUwx16UzvHz
V0QDkQ6rWIzyrn1Wtm2/7KikbsSpot7yt3okcSGIUQjn1dYkCr4/4J9HsVgNCXwr
9PfFFGRv4UZ+ssQkpCMMZBA/bAQDn9+dpoWLhrO38EnY9l55y7HK0MtL8PfWZ9UP
tBU+KifXlUeknNVOim4YDo4cCkUiRtB+16rhIdkUPzFaMGCq0XDgugS03fOkDrlv
GfbxQyar5j/w9tgzkLujOmO39MLM9Q==
=yPRe
-----END PGP SIGNATURE-----

--Sig_/MerbLpHnCb_izFKYbRB=67x--

