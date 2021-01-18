Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA8BD2FADD8
	for <lists+linux-next@lfdr.de>; Tue, 19 Jan 2021 00:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732244AbhARXqY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jan 2021 18:46:24 -0500
Received: from ozlabs.org ([203.11.71.1]:57053 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733092AbhARXqX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Jan 2021 18:46:23 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DKT1Z3mLkz9sVS;
        Tue, 19 Jan 2021 10:45:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611013539;
        bh=6ec4/79b0jlPaNx1rlz8S2B+hZT4CZxrgTBzsmJNbgg=;
        h=Date:From:To:Cc:Subject:From;
        b=h0xpHFr59kXUTdq5aoyNANyFi4JDn0ZtLROpiRYg4lU7gpm/M6erwW3TmVZpThVS6
         77YY/EDmJfg8EIluwWChmebZ9z75pMaAYkXZqH9PMRYjg3SebfJmYOC0iVN5wqjkEd
         sKmeDDynAic+SVvRlqsF4Fs7MeGSkDl3kNKH3ZUg/7DEvdF8P9CymO+XCMleIACoz0
         K8XxQi/WqmzsQkvSmikEEbn49KFR8vsniXerxLF3ML3lRNVYXL7lZfgCNHJHe/+Mma
         e/LmS7+ZuW9kyMW9Uhv/DU1OoBgCgpO3rFEsfgv6AFT7pckCf5vRXY+nJMXFsOGb9g
         OgPC26pS2IAjA==
Date:   Tue, 19 Jan 2021 10:45:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the hid tree with the qcom tree
Message-ID: <20210119104536.50e08bac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oYa.72d_FLo8xHDiK1KSkY4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oYa.72d_FLo8xHDiK1KSkY4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hid tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  74b87103b3d0 ("arm64: defconfig: Enable HID multitouch")

from the qcom tree and commit:

  1fe16cfd311b ("arm64: defconfig: Update config names for i2c-hid rejigger=
")

from the hid tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/configs/defconfig
index f2107444df08,326198305beb..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -756,14 -746,11 +756,15 @@@ CONFIG_SND_SOC_SIMPLE_AMPLIFIER=3D
  CONFIG_SND_SOC_TAS571X=3Dm
  CONFIG_SND_SOC_WCD934X=3Dm
  CONFIG_SND_SOC_WM8904=3Dm
 +CONFIG_SND_SOC_WM8962=3Dm
  CONFIG_SND_SOC_WSA881X=3Dm
 +CONFIG_SND_SOC_LPASS_WSA_MACRO=3Dm
 +CONFIG_SND_SOC_LPASS_VA_MACRO=3Dm
  CONFIG_SND_SIMPLE_CARD=3Dm
  CONFIG_SND_AUDIO_GRAPH_CARD=3Dm
 +CONFIG_HID_MULTITOUCH=3Dm
- CONFIG_I2C_HID=3Dm
+ CONFIG_I2C_HID_ACPI=3Dm
+ CONFIG_I2C_HID_OF=3Dm
  CONFIG_USB_CONN_GPIO=3Dm
  CONFIG_USB=3Dy
  CONFIG_USB_OTG=3Dy

--Sig_/oYa.72d_FLo8xHDiK1KSkY4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAGHaAACgkQAVBC80lX
0GyHhggAh/QZi6QD6ziGLnC8sennkav1Y8hJe/DlyCncp85eQBN7pDE5CGUKuv+J
bGm5SIYfJwQJdkJXMvub5DMgYL+oxncAeuUpA4MD/6SDNiL7ySDcNpnsojSq8/M+
eUU69N+HyoIwCmrc1ryIm/3wSUK1qsIWx2LBvKI20NXKtZ7p5v9AKTRyrPO/3+Dk
zqhS9xrk29YWHzb0gFLs4t0aJ4ePIcMC9tbf6bM4aO8dMdQxD8W5/Hb+D6XVsMXa
eS30lk+GtrKcaWjFF6SziM2pyrFaDz+xjbe8tw6SWU+0LL21x2nvQEyH+3HTMFf5
i/fh7EBokW0eQ/gFUYKOY/MD9r1Y/Q==
=QaY7
-----END PGP SIGNATURE-----

--Sig_/oYa.72d_FLo8xHDiK1KSkY4--
