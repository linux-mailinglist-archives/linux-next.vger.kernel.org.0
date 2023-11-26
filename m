Return-Path: <linux-next+bounces-66-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C9C7F9584
	for <lists+linux-next@lfdr.de>; Sun, 26 Nov 2023 22:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C847B1C204F9
	for <lists+linux-next@lfdr.de>; Sun, 26 Nov 2023 21:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E8D134DD;
	Sun, 26 Nov 2023 21:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SzyGJoTL"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7296CE8;
	Sun, 26 Nov 2023 13:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701034344;
	bh=m4c3MMaM5Jb7y6O4jt1oh7KB9TXWPcvGPoYTaAvC0B8=;
	h=Date:From:To:Cc:Subject:From;
	b=SzyGJoTLFpWl6ZtOWy5XSVpRhF0kxQbLmQCcOwunKR4x48vZDuCHejxKAk/ihRGDb
	 ieFkZTlUSEOuTIM+Z4NHeZCxMIrHXEjFXPYcAra5ltQoY15e6b70CmL4ivOHnCSkqW
	 tBrVpFSmYaG21ujFXIVHNKQZrW57Ry2E8BtnZfPH29yZ+8DSUvMXjAze+TB7VvEPwb
	 w0WD0meVuy3z3BiQoFPpzNkTokCwitPgWyKD5tX6Ra54EfhKRhiz7jXmyNKUOW23C3
	 KOB4JZTtpsb28HIk0BUVz/Qw4uh2ssZXb6rRV27H91gELqHq2f1RfiUrNhVk6ZUS5w
	 lJJVaJ8b3Gftg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sdhkv0QBJz4wc8;
	Mon, 27 Nov 2023 08:32:22 +1100 (AEDT)
Date: Mon, 27 Nov 2023 08:32:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>, Liu Ying <victor.liu@nxp.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc-fixes tree
Message-ID: <20231127083205.44b25fa8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hIMrf_P/ckwsQ.=GozpjKyq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hIMrf_P/ckwsQ.=GozpjKyq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "device_is_dependent" [drivers/gpu/drm/drm_kms_helper.ko] u=
ndefined!

Caused by commit

  39d5b6a64ace ("drm/bridge: panel: Check device dependency before managing=
 device link")

I have used the drm-misc-fixes tree from next-20231124 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/hIMrf_P/ckwsQ.=GozpjKyq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVjuVUACgkQAVBC80lX
0GyZ8Qf/QyUqgY9MYX9H3CKy5c82Isrenp7R03/3/+WZDEg0qyGKST7nbmdXMuqo
gYIS9KqTd7NDY/S/D+cBHq/7ih8U1cwPLZwDPONhWMkGTuGAYKb2lHAORvVG34f8
v2IFY0337RvARAO+tg2sRZSCS9y0xZRAls6sx9q3zeT0MIMw3tn/z46aZrSCxta4
rIZhRvNXby0/zG2IIUt3CaD8keFjJAP7foNVyXWMpqjc9BCO5VfS8eRvgyEzARVR
6BCTWs0P7oMsBxTyGd/Q0PVZqm0lhOuVNuaW9fSAfpSI8W3cH1/2Amt+23XyXycg
4Q5kCiernY7N5w4NSh+mx+RlwJXHPg==
=y/AT
-----END PGP SIGNATURE-----

--Sig_/hIMrf_P/ckwsQ.=GozpjKyq--

