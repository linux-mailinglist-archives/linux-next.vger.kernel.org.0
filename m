Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFFA02609AD
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 06:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgIHEq1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 00:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgIHEq1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 00:46:27 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953B2C061573;
        Mon,  7 Sep 2020 21:46:26 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Blszy6yL7z9sSP;
        Tue,  8 Sep 2020 14:46:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599540383;
        bh=008NKnJE31ueTtAb1ZIhem6ygft7V7iwf/aAlWlUcs0=;
        h=Date:From:To:Cc:Subject:From;
        b=n9XFDaCooE+FKUqUBff1q/EdGt3YaGWAxTdpZmbh/R0En+r+abfFoHnykKeAhTv4T
         zKObm85WfRYBszfdTLQpnf7rD8d3mBFxbFFvUIlFyTc1b+8f+/AT8YjLc4foAJG2Za
         A0qe5kI4+ynvYS6Tqy0+kiV6Uvd0+IGPYG2O8ny85+iVxhnVDfnwBYskbot9YkKJQE
         zMd98igKxksw/Odpa9sTofnz6tBMMbasoAhnsEs2DNevz8UWPLdu+7OKFRso4sCgTo
         EsJFJ0vyMrR+eE44JDCjVJBPjJbQnFx6eS5XSDKgxZojNNyQFH4rgby2biG1YA2acc
         VzpSW//6KdIRw==
Date:   Tue, 8 Sep 2020 14:46:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the mmc tree with the samsung-krzk tree
Message-ID: <20200908144622.09385c88@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J=0aav4tGkOolwnBXDQHDlc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/J=0aav4tGkOolwnBXDQHDlc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mmc tree got a conflict in:

  drivers/mmc/host/Kconfig

between commits:

  cb6c03019cdd ("ARM: exynos: stop selecting PLAT_SAMSUNG")
  db8230d29c3a ("ARM: s5pv210: don't imply CONFIG_PLAT_SAMSUNG")

from the samsung-krzk tree and commit:

  54d8454436a2 ("mmc: host: Enable compile testing of multiple drivers")

from the mmc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/mmc/host/Kconfig
index 0d7c61d8d1d9,dc646359b4ff..000000000000
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@@ -289,7 -301,8 +301,8 @@@ config MMC_SDHCI_TEGR
 =20
  config MMC_SDHCI_S3C
  	tristate "SDHCI support on Samsung S3C SoC"
- 	depends on MMC_SDHCI && (PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS)
+ 	depends on MMC_SDHCI
 -	depends on PLAT_SAMSUNG || COMPILE_TEST
++	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
  	help
  	  This selects the Secure Digital Host Controller Interface (SDHCI)
  	  often referrered to as the HSMMC block in some of the Samsung S3C

--Sig_/J=0aav4tGkOolwnBXDQHDlc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9XDJ4ACgkQAVBC80lX
0Gwi4wf/YHbYgyckzto3cmzEuFntJtIXBkO1zLL7mAbBrKTvqcTLXSrHoYFh995R
Pk00TfXu2A7532xpW6BnGg/j3aCDqLxf7wa5HFyZYrOQHNphRZqrbDtWE35zkIk+
a8EhqbVPAlYh8SQHP9taTfiwzwVltmVUexGueuNT9WsvNCO0QYqQXNVGSH+IQS02
7mgJtzJEjsswGxngtd0ooPt2q9IVujGNERxSrV7RtntwYcYA2sbB++nbD9yWMqum
Rb1zW7myPsrouh8wcksP5a5MPx/gm+dkjIJlVpvE8SYkOntaOTK+KKxl4zeyVlV6
CrA3tU2g9NbKBtQ9hja7QYEveDPeww==
=5waX
-----END PGP SIGNATURE-----

--Sig_/J=0aav4tGkOolwnBXDQHDlc--
