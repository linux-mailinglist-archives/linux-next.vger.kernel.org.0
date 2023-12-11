Return-Path: <linux-next+bounces-315-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FDB80C0FD
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 06:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F30931C20840
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 05:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E6A1E536;
	Mon, 11 Dec 2023 05:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g1QYRRL0"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26804213E;
	Sun, 10 Dec 2023 21:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702273758;
	bh=5ownzIkARz43eQTloQkKelbMKKK9J+c14Q+Xkg/VpWU=;
	h=Date:From:To:Cc:Subject:From;
	b=g1QYRRL0JgzIR/pbzVUeOs0X3Oy8te73acyAmxtMQiUrZtQLpDlFBSkvl0pC0K/uz
	 h/a0AVTGZwQ+RTMd4lFEHpyxrOU3dPIlCgTfIQYP5tZNLNc+bwjmAvYP3QDJG6UorT
	 h5XnUabVn0trae5u3qQpq+3E6IcBF0799Z+ZZAOnUory6qqS79ZMOtjGMTRRuN6gUl
	 JPF8tCcCh+2DycfYsxYbqFoV4zZMMo9MtPmacJ/rUXK7eeLwDg4ZpiMnUl7f/xOF3k
	 9vAyQGYJx0WGLKgWfJNHEIp0AZ+pS/4K+I4NA/bGu5X5GjB6ir/cbuywybHKnhBxbE
	 fQu2W1xABUpFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SpW5p1Rx6z4xGR;
	Mon, 11 Dec 2023 16:49:18 +1100 (AEDT)
Date: Mon, 11 Dec 2023 16:49:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the nvmem tree
Message-ID: <20231211164916.6f0d2357@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nYikG/bmL+ZRJ2lLCNwpPJo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nYikG/bmL+ZRJ2lLCNwpPJo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nvmem tree, today's linux-next build (i386 defconfig)
failed like this:

/home/sfr/next/next/drivers/nvmem/core.c: In function 'nvmem_cell_put':
/home/sfr/next/next/drivers/nvmem/core.c:1603:9: error: implicit declaratio=
n of function 'nvmem_layout_module_put' [-Werror=3Dimplicit-function-declar=
ation]
 1603 |         nvmem_layout_module_put(nvmem);
      |         ^~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  ed7778e43271 ("nvmem: core: Rework layouts to become regular devices")

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 11 Dec 2023 16:34:34 +1100
Subject: [PATCH] fix up for "nvmem: core: Rework layouts to become regular =
devices"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/nvmem/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 9fc452e8ada8..784b61eb4d8e 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1491,6 +1491,11 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_n=
ode *np, const char *id)
 	return cell;
 }
 EXPORT_SYMBOL_GPL(of_nvmem_cell_get);
+
+#else /* IS_ENABLED(CONFIG_OF) */
+
+static inline void nvmem_layout_module_put(struct nvmem_device *nvmem) { }
+
 #endif
=20
 /**
--=20
2.40.1

--=20
Cheers,
Stephen Rothwell

--Sig_/nYikG/bmL+ZRJ2lLCNwpPJo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV2otwACgkQAVBC80lX
0GxrhQgAmGlntDh8OyosiXZ5XBpZQRAHQPVjinRKuBEa0QMBqP/ozsVEmRp3VM11
THPuzzrsaFfFaSyXrHwwI44XDPTbdTZ1X833tsWM5GOtV33pgLq7LLJ5m60Xb8DI
qNbKR30addnNolHnI9eipaeZSjlKxXwWC7Wg4g2xyMBljtfKERK349Qj85mCnicf
iLyaM4woBrLBYHBo4ZsWb/h5ykE1DRI40KPuJM9JVNnOiC0vFYRyl7xBsUtfX88I
WkZ77SQ6iOM8zcV/gWwGZj2FaCBqZD0BMmhunu1E0W1bUsn/2Z2YXJH8bZ1NfLqy
H/Cd06ddyZK4KcaPcgCl0gZs2xeIoA==
=4mza
-----END PGP SIGNATURE-----

--Sig_/nYikG/bmL+ZRJ2lLCNwpPJo--

