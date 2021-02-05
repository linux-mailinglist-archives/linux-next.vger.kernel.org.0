Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 358663103D5
	for <lists+linux-next@lfdr.de>; Fri,  5 Feb 2021 04:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhBEDqZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Feb 2021 22:46:25 -0500
Received: from ozlabs.org ([203.11.71.1]:40683 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229979AbhBEDqY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Feb 2021 22:46:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DX1Xk2vJcz9sVb;
        Fri,  5 Feb 2021 14:45:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612496742;
        bh=QfWsKzcgs3CT5TN3x1n4KGoVfJ3XRtC5/yGO5p540fg=;
        h=Date:From:To:Cc:Subject:From;
        b=awMO1hN2lccbRrFPp3/1QMajbyNKTVOvtmU83NZFnL2WNKVelrCJOpf68NB8JNas+
         7ZiRmK5JITcVzsiWdLd0WK0+bqw6D9PCo4uczHwQs51Kk8qBu+CBRWB54Wkf/yfmde
         Dbj+GOawxXLjN6fcomn60Icftf9IUD2CNHJOyw45QQhKOoQECdSGgtMNezC06TzGMI
         m8L3o7IG/0xSH1e/PzU536fNfOMGfujZXstSwouaAJvYmHs5HFDTFmtmJQ41ZoY1sJ
         1Bd8H469K4Jb1c/NYvHpt3cOgf4j9++LNCgSReaAlas+ZuN7ycQdzBGVhfN+NhJLhH
         emIUMKtJc0IUw==
Date:   Fri, 5 Feb 2021 14:45:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: linux-next: manual merge of the devicetree tree with the kbuild
 tree
Message-ID: <20210205144540.1438cc3c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q1nJy/2MJTuDaL58gb34Tw0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Q1nJy/2MJTuDaL58gb34Tw0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  scripts/Makefile.lib

between commit:

  d73a6a04c76a ("kbuild: use always-y instead of extra-y")

from the kbuild tree and commit:

  ce88c9c79455 ("kbuild: Add support to build overlays (%.dtbo)")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc scripts/Makefile.lib
index 6f248ff91982,b00855b247e0..000000000000
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@@ -85,12 -81,14 +85,14 @@@ always-y +=3D $(userprogs-always-y) $(use
 =20
  # DTB
  # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
 -extra-y				+=3D $(dtb-y)
 -extra-$(CONFIG_OF_ALL_DTBS)	+=3D $(dtb-)
 +always-y			+=3D $(dtb-y)
 +always-$(CONFIG_OF_ALL_DTBS)	+=3D $(dtb-)
 =20
  ifneq ($(CHECK_DTBS),)
 -extra-y +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
 -extra-y +=3D $(patsubst %.dtbo,%.dt.yaml, $(dtb-y))
 -extra-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-))
 -extra-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtbo,%.dt.yaml, $(dtb-))
 +always-y +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
++always-y +=3D $(patsubst %.dtbo,%.dt.yaml, $(dtb-y))
 +always-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-))
++always-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtbo,%.dt.yaml, $(dtb-))
  endif
 =20
  # Add subdir path

--Sig_/Q1nJy/2MJTuDaL58gb34Tw0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAcv2QACgkQAVBC80lX
0Gy0xAf+PRYXIy6feQvq7zVUTxg869jUJLfEBcBRuybpTiCymDa8+vWrK37E+7fD
RZvD6lWOsze5fgZIZ/cAlJX/c+EIf/LUtw/q7QomMzvdvoAzaqtmmxtmQweCo18B
jr8ranuxVwG6iv23Ig6m5g4gPV0fU5byUj/Hhoo9zoxpKYvq08wQ08BKQBzuyeWz
DeZ8ZvC/DfSE3WjMcActmWkv3lChOsEKZpYTOgEOYJPGWOzFDQsvjoFI0rwcGuSm
Dg3Q2n0A0vDoSo19EU/TZ9RZAmGzRe1+FXlaoE3x8AD8hFmZo9gBqU2uQOi7VOzF
Zt1tV7u3pMQB8fqXbERHuIcQTQTPHg==
=zeNo
-----END PGP SIGNATURE-----

--Sig_/Q1nJy/2MJTuDaL58gb34Tw0--
