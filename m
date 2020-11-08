Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1AA62AAE37
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 00:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgKHXXE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Nov 2020 18:23:04 -0500
Received: from ozlabs.org ([203.11.71.1]:55171 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727949AbgKHXXE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 8 Nov 2020 18:23:04 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CTqtF5NZqz9sSf;
        Mon,  9 Nov 2020 10:23:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604877781;
        bh=9Kz9jfaTBlizIbjTWQU2huAKZtn3zrpAZ1BRXUOk8Js=;
        h=Date:From:To:Cc:Subject:From;
        b=Ox5VqPsDXcxeYqzvcXh7llGzvnOhZN+o4wiGFc7stW/rMI5SEo1pg8UTAEjt0PtDV
         Rkqkk/NWSv9Rq4ZN08TN+v3H6/w+cXX+sQ+sats2cCS+VX5Zdm/6QhQSSYIru+xmYr
         TvxPzuC2jGSw784xWX25a8tJKKnKKtsYQcRn8vSuxFvt8DbNnYUjzTiFg8pvg9XQax
         ziA92s6WpPOkHklwgR2bfxLO48tSp/zMqBXUSzJnij5ALX9ZemYau4sBk+yYgaBZ4F
         n80O/YoW6/fmxGyT3c7r10O2RoY9yvAIiXFeRpOUkVUInoDvWAi/gm1eRRnlyM6pkt
         6fM+7OG6qRZVA==
Date:   Mon, 9 Nov 2020 10:23:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drivers-memory tree
Message-ID: <20201109102300.539961bb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mJTKNNHvjHNMfuQMXEoFU.h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mJTKNNHvjHNMfuQMXEoFU.h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-memory tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/devfreq/tegra20-devfreq.c:18:
include/soc/tegra/mc.h: In function 'devm_tegra_memory_controller_get':
include/soc/tegra/mc.h:211:1: error: no return statement in function return=
ing non-void [-Werror=3Dreturn-type]
  211 | }
      | ^

Caused by commit

  1f1997eb44b1 ("memory: tegra: Add and use devm_tegra_memory_controller_ge=
t()")

I have added the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 9 Nov 2020 10:19:44 +1100
Subject: [PATCH] fix "memory: tegra: Add and use
 devm_tegra_memory_controller_get()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/soc/tegra/mc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 43876216de34..d731407e23bb 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -207,7 +207,7 @@ struct tegra_mc *devm_tegra_memory_controller_get(struc=
t device *dev);
 static inline struct tegra_mc *
 devm_tegra_memory_controller_get(struct device *dev)
 {
-	ERR_PTR(-ENODEV);
+	return ERR_PTR(-ENODEV);
 }
 #endif
=20
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/mJTKNNHvjHNMfuQMXEoFU.h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+ofdQACgkQAVBC80lX
0GwKsgf8C3c9FlIaMxyDQjiqU0F55uwZcreIZ96JWGLtlTRLB1adPo4m6vFshCAd
EyWoj+fzd+Jdsd9Pja+6rOmr76zHw68mRyfcdZqgoe3WjS32CtBK0WViZAKfNyUO
XokhE7Y2MuJP0BIDvGJcS6ZvRUIY4HhoYMit6qf2wD70VvQzj75LX6X3wX/m17dj
4QdlAAFxAz4bTczn2Ief0PEEAoiGsHq3s11OPpOiV2iUTW+/5lumYjV5Yt8ZOBDb
xbSU9kjPIoXr/xqfgS8johk4a4DLZ1NetFERgYotXMa6qeswsx8PJBUR1VBkEOeo
5UXQC+qnVmbAUL6R/NaKgltLZkfuJQ==
=Y3RR
-----END PGP SIGNATURE-----

--Sig_/mJTKNNHvjHNMfuQMXEoFU.h--
