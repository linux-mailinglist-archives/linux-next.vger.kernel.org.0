Return-Path: <linux-next+bounces-7131-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E55FEAD4855
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 04:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4147D174FF6
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 02:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC50158538;
	Wed, 11 Jun 2025 02:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JrBvaL/9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F29E14B965;
	Wed, 11 Jun 2025 02:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749607691; cv=none; b=Ne3LPlwz116EYI15FeWp4xZ1ytyCFk9rcc1clKjMd3TKhfRJd7Grtu6lImvUVZdrS2jdJLVI50o/nmk2SNrKj9fB49m/6+IfJkQs/ycN6mb9s8E8HAOPo2//hYzAAtym9z3rjEPIbmo58Wnr9BI3Br5t9+JQa2fJeeB75/QxoWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749607691; c=relaxed/simple;
	bh=lPS+saJyF22lEituIljUGn3gpsIa5rtdnhgXpYaBrY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YVPQxGDa94R3kUmvcBhr2Dz5AUK0u0gINOav+uJtAcotvQZjlZ75qlXrGvbpjUZyPaD/aaTOw9zw4q1f2prH5YyBNp3oz4oJorQVbtAy9inK6u3biJG21qxbs7Zz3UYssU8pUc9AQdPWmLmU6Ki1GmmrEts9mK7obg0cr+H/rYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JrBvaL/9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749607683;
	bh=REcs1wFnLHXC5/tgOun5mcsWTntGLj/q6Gx6NYBTaA8=;
	h=Date:From:To:Cc:Subject:From;
	b=JrBvaL/9Q1VtMtdyp0D3qcPlPpuOl8T70ZMChJKypSVhqg+ZZYG3iCYtpDviuZpdu
	 dukxiY+OeysM+Vh1NOMDJ/CdCHFdH58xzuLqaJeHvjOTrJTkaM9gbWh9ofCZIFyUzK
	 3oUAGS/JIbKe3c1EVV3+IV4mcVZTiQouECa9IGE8PiRHfkP1ugLYBg+trUapm5Lyps
	 vqKMHrmg1Nd7YBXM9PdZIBBFIyYIKQKBnMOTyu3qT64GdUn66Mc+vshDl8Wm5g45Fv
	 h+09ytwGXLP4FeaO9/pKWGpYiIfxwCnkCWVbreCXmZRd7+h743ANo1qZrR9fjeDZaW
	 52oW+rdV3/fCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bH8FZ61Gcz4wbW;
	Wed, 11 Jun 2025 12:08:02 +1000 (AEST)
Date: Wed, 11 Jun 2025 12:08:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Gabriel Dalimonte
 <gabriel.dalimonte@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Message-ID: <20250611120801.48566070@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q/mECVjvsV7CLbvRf5Gkl3k";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Q/mECVjvsV7CLbvRf5Gkl3k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/vc4/vc4_hdmi.c

between commit:

  c0317ad44f45 ("drm/vc4: fix infinite EPROBE_DEFER loop")

from the drm-misc-fixes tree and commit:

  d9f9bae6752f ("drm/bridge: allow limiting I2S formats")

from the drm-misc tree.

I fixed it up (the former removes code updated by the latter, so I just
removed the code) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Q/mECVjvsV7CLbvRf5Gkl3k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhI5QEACgkQAVBC80lX
0Gx5sAgAma9RHCJSWk5R3L3oKbQiQZ4Esp3YpBsZ/0pijUYtjHkJ0qLIW/A4nmeS
Xm2zkhxQVblyDElX+5oD0J6ng01+gxW34v3aPtatw8OVMKIGGmc0l4DVJVmE6iVf
xKfnLTuOk2rTH2G6prIbxxlinDHLap702gDWm1gsII8Hj/a/S96pN5AVac9MN4he
kTTEmN06kQP7OMFqDD9FT7n/FUs4U/xmOewOpHF3lor20HwxDK/ZnocsoL5YFK2H
3hk9CEAUr0HM8jlbQoRbLyK+PETY9uJKYBGdXv2kor5W9VSpeAhLM4jtSmFKsP//
C0zPDtpuK8Qg4wYZNCJ2LFJu02IjtQ==
=eatc
-----END PGP SIGNATURE-----

--Sig_/Q/mECVjvsV7CLbvRf5Gkl3k--

