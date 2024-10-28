Return-Path: <linux-next+bounces-4465-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D979B22BB
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 03:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCA3E1F21C48
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 02:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693AA155A2F;
	Mon, 28 Oct 2024 02:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ho1cZ+ll"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBA7374FF;
	Mon, 28 Oct 2024 02:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730082575; cv=none; b=J27k8NaM5fiBnhxdoMw07ggMTYf9DL83wSErPe2uh+uAjnikemNtaR7etzTeQQLalEecagIB7Yuk10wJ7i7uZmjpQx1+umc/SdAIwzY/iIS5cIfJS1Eg7gL3jVbk3YgTu3eC1lHWTnuRo/muqOKbK4iQm55JIAD2E63q3Yv/mts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730082575; c=relaxed/simple;
	bh=64tougm9nmJj4xKK9q6ZM9dc9EcYNXRxxkMy82H+8c0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jagdbY601Ks7KRvBPBY2LlVNHybohgPVXjGSwFdSJqSFjJqPN4G6kVVoOzPegOlEZHAnP4O80g1IFsbviGuxrHB0otVvj6wgk7/YFN+1wjt80TCukZi6hKq2YjpdJsdXFgUnrVFNbHtGER04EYtwj4HFbIXrAR14gWokVtlB34o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ho1cZ+ll; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730082569;
	bh=DtCkAVAEc3Y0s+qaAQzJ7S7dJ/qpMzYRGAoTLAgQp5c=;
	h=Date:From:To:Cc:Subject:From;
	b=Ho1cZ+llhAulgCfkrsBVpVXa5KeAf/tMBFWzrPsX5u0mSgfclatJPVfuQRyf2sCBg
	 4RiUOuD2B5xlcfVOD5RjygFf+3QBYU5Ah8yGZ1Wyv0zvv6yZaimNriCs0gGoR3V9Ol
	 trog6I3q7cIkfOlAZhST/w6MX8CpVKWjDJ9XOcDVLo6PCqjMF1VeDiJgP3xhIHVc1c
	 mva3qTV+ApWy9iy3PTZayRTFbZrsFiF7gSOgMwJnsGACtANOsbZ/qIb8hr22JpEH88
	 lCNY8I+A3N+BXjys0qhakOvh/g/AF+qUjcA/awf3qfBpiM/swuvkky309obPh3K8CQ
	 U55I6vrq99+dQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcHQc6jvHz4w2L;
	Mon, 28 Oct 2024 13:29:28 +1100 (AEDT)
Date: Mon, 28 Oct 2024 13:29:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Cc: DRI <dri-devel@lists.freedesktop.org>, Arnd Bergmann <arnd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drm tree with the asm-generic tree
Message-ID: <20241028132929.3786e425@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kbxojL.auj6N3miGzsIGzpJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kbxojL.auj6N3miGzsIGzpJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/qxl/Kconfig

between commit:

  65f5bf96750f ("drm: handle HAS_IOPORT dependencies")

from the asm-generic tree and commit:

  92c13542e878 ("drm/qxl: Run DRM default client setup")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/qxl/Kconfig
index 17d6927e5e23,1992df4a82d2..000000000000
--- a/drivers/gpu/drm/qxl/Kconfig
+++ b/drivers/gpu/drm/qxl/Kconfig
@@@ -1,7 -1,8 +1,8 @@@
  # SPDX-License-Identifier: GPL-2.0-only
  config DRM_QXL
  	tristate "QXL virtual GPU"
 -	depends on DRM && PCI && MMU
 +	depends on DRM && PCI && MMU && HAS_IOPORT
+ 	select DRM_CLIENT_SELECTION
  	select DRM_KMS_HELPER
  	select DRM_TTM
  	select DRM_TTM_HELPER


--Sig_/kbxojL.auj6N3miGzsIGzpJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmce9wkACgkQAVBC80lX
0GyICQf+MgfxragsezMHAON2VP9UtIWBllNOPdreocza1pozLf4KZVFkxT9y06iB
YdR9WY0D5N1mr5dHZ6WePK4Xh6mONhsSJhxvE8Y3NwU9aJInYu8SQ2KHhd1Qc2sN
E1CIan9NLZZbgdJ3JS4PLDI1xUQct7eVJwMe0zEwjAhqN2sssZ9ghqgUMlqNheWy
9jGJoxQNZo6XojzhQ53cc1vyYo5ujTESvAkPNhKSQKlMgVDgoEQWF+L8beI5JY4u
ZWvILS4fiIV5vAecpSlKJTRVWjIGRmIis/bSsiHH5tGNqwJRpoxNmD9JLjM9gDx7
IrM2pG44UM6xrXdwH3babbEZUtJwHA==
=oBy3
-----END PGP SIGNATURE-----

--Sig_/kbxojL.auj6N3miGzsIGzpJ--

