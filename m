Return-Path: <linux-next+bounces-8023-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 787FBB2D155
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 03:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B3B02A4B4E
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 01:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B0B1ABED9;
	Wed, 20 Aug 2025 01:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Yl7iJrHc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDB71AA7A6;
	Wed, 20 Aug 2025 01:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755652912; cv=none; b=Ak710wZ5DRXkHQGRBfqPP2N4yLqofa7WSHpp9e1Bq+lsZUaf2IuSm81QUK8nxBRrHeqwC+aev5zWP2SaaOBQLaUtoRtDzFOXbTaZsraxyA7hz84a4jjQS9JduYUrb7H+wnwi2taIyFyPlKZBfQW4DxoieSejx83H0mfmWHowaSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755652912; c=relaxed/simple;
	bh=YEUK+xkgcAHI26fmPUIN7lr4NhSAUCC76VgSwSocTrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dXuMTbS1dAYiwS+288z9XrbSgbESdpGulPcwT1L7j93GRwQWYTr/CzXdur0Wp58alCvDIeW4E6BZAJDfi94JeGU9daLlgONbFLVzjXMQszEE2m2zZcXzwWbcMv2u14RHNdODZE6tMqik26FobryeleQjU9YSyAfO4qESlLoRPbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Yl7iJrHc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755652906;
	bh=Cax4wsit9vDfDJ2iuUp1ECYmVzYSecXd37uVDPRDpBQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Yl7iJrHcVMSN7pKJYQCxvuYTYI2uAh6cMvOq3cRTI2j90MpEN/ZfIW90FX+Ja7OuN
	 HYtOUbmudABUn8xCqifqWQwAgV6XKR0rRjvRXgr2Kx8fnKU4fWKlwFbdxGKrlVNfbS
	 wbSuv2LtgIToIEeSIFE4U4W6MUMwtvxmZI6wMmnXsE6vKIvu/xnR7t6a/vUW1uLNrg
	 yysPfHDLoY5BMaiRu6fXRj1rlRpTcc8FXQrLe00fu4IuQXZybSw63Cy02RpPIRF/oD
	 DiWUP81na6yb1T9/vuIl4rX8NBZ5AzYlOALmA4ftRwgj/VESHF0sAxlrSh6YB4h+QG
	 EkhnLxrb+QzEg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c67vt1Ltyz4w2K;
	Wed, 20 Aug 2025 11:21:46 +1000 (AEST)
Date: Wed, 20 Aug 2025 11:21:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Beata Michalska <beata.michalska@arm.com>, Danilo Krummrich
 <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, DRI
 <dri-devel@lists.freedesktop.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Message-ID: <20250820112144.43714c90@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/87Z0/l_jCzW6qIQhqxZCqCL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/87Z0/l_jCzW6qIQhqxZCqCL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/nova/file.rs

between commit:

  db2e7bcee11c ("drm: nova-drm: fix 32-bit arm build")

from the drm-misc-fixes tree and commit:

  94febfb5bcfb ("rust: drm: Drop the use of Opaque for ioctl arguments")

from the drm tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/nova/file.rs
index 4fe62cf98a23,7e7d4e2de2fb..000000000000
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@@ -39,8 -36,7 +36,8 @@@ impl File=20
              _ =3D> return Err(EINVAL),
          };
 =20
 -        getparam.value =3D value;
 +        #[allow(clippy::useless_conversion)]
-         getparam.set_value(value.into());
++        getparam.value =3D value.into();
 =20
          Ok(0)
      }

--Sig_/87Z0/l_jCzW6qIQhqxZCqCL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmilIygACgkQAVBC80lX
0GwchQf+M0lvHfwjGjfP6fpmNDnpbu+t+DHfUtBGIANf3KbiJW+/D/aHMmMil/I8
gATE4939NH5aVAe+LZ1BzF6KcPJN0FfjBvCg7SIIcyyzPgGLv6jVt2W8vCo4R0Ma
/xD5jNVLCa/jnUxDFz53SaAvqU+C8meNWcuYNDSvFEoUf1FdPQ0JL0D1Xwo8bWuz
OvxVbYnAl0f2SwefYCo5HRCDPnDedioDux0VPzwMIsW2WWbljs5lGSnt8tZpINxc
FO8mOKO1YK/YzvS90YKOsp+vnoqG2LWKLIg5GtsgHuzAGnbVdN1KdwNkbBYS+ERc
CQk0uWyqKHiSmj834aBzOOaEHGIxKg==
=a+Tu
-----END PGP SIGNATURE-----

--Sig_/87Z0/l_jCzW6qIQhqxZCqCL--

