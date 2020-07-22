Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F37122901A
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 07:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbgGVFws (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 01:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgGVFwq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 01:52:46 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E99C061794;
        Tue, 21 Jul 2020 22:52:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBPkd2qC6z9sPB;
        Wed, 22 Jul 2020 15:52:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595397164;
        bh=+DXFXfkYQ7uc+rrRZx7ipC29lUJNlQ0fiSh7XiaivgA=;
        h=Date:From:To:Cc:Subject:From;
        b=A91MMATIUEaxLTuUSUSdP7KATr04kAPL8N5UX9dO7hhyHoOXaLRV8iG1/1lML/umk
         sSBpcfCEtqy7XFgPDk2QXzVewAD+ZKdK1potR30457KWa6szjB2yqH3SV3drCMBpjN
         jQH0Z99e/UDe4R55zZBKOfK/hpvb0xwAY37vw+TgR6AeTYI6rVIgXZaC5fEfLmgz0l
         kff4Kr/f+nNa8fm7KXdxeR3iYKTaPvAdrNc9rFztrIUp+iHURI1i+XiPRtNOjRgO7h
         Nn9AzYnTgWqmR8GZMhkoXtwar7loQlKhUA4f13IFnQxCSe6NRgHVuLh5Naso0YrLf8
         Wrt3AM/F5MG5g==
Date:   Wed, 22 Jul 2020 15:52:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: linux-next: manual merge of the devicetree tree with the drm tree
Message-ID: <20200722155239.07bafdfc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oWXN3SQ8lhH9H.AU2OpA83W";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oWXN3SQ8lhH9H.AU2OpA83W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt

between commit:

  5a2e9b658cdc ("dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml")

from the drm tree and commit:

  382646090f7f ("dt-bindings: drm/bridge: Replace HTTP links with HTTPS one=
s")

from the devicetree tree.

I fixed it up (I delete the file and adde the following merge fix
patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 22 Jul 2020 15:47:22 +1000
Subject: [PATCH] fix for "dt-bindings: drm/bridge: Replace HTTP links with =
HTTPS ones"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.=
yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index be10e8cf31e1..f8622bd0f61e 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -11,7 +11,7 @@ maintainers:
=20
 description: |
   The Texas Instruments SN65DSI86 bridge takes MIPI DSI in and outputs eDP.
-  http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=
=3Dsn65dsi86&fileType=3Dpdf
+  https://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=
=3Dsn65dsi86&fileType=3Dpdf
=20
 properties:
   compatible:
--=20
2.27.0

--=20
Cheers,
Stephen Rothwell

--Sig_/oWXN3SQ8lhH9H.AU2OpA83W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8X1CcACgkQAVBC80lX
0GwyWwf/YY8JKEer/2P6zf3IYHeHk0ZD+pm8MZsXm19M+/dHnvxs0kSficrlJ5iy
oOQhfgCgBIgzUUQqR5PH2bXkXEyiPp/LsX2WupbNOa9V+zUpRIUanbDJbBMGf8dQ
BBSTeJtOpf/U6pqOdY17NQFPBuBMRi4ng+9eiGXWJvjN6uoqWrIhWOilDuAxC9gC
oO1YQesKFh46ONrGJJLKbFVjnhe+XDrsUZwdZPQHbPncUZK4AWhqs4BA560hqmmd
Cm8nT4nqpuCPOvrKrXVudFj4Uu1FSiT7N1/Ati5/FEj0hZM1FzOYPaQ34v5YDeae
abW5mOmRlOGr2JDHVNZc2ut4ZK8PTg==
=aBZg
-----END PGP SIGNATURE-----

--Sig_/oWXN3SQ8lhH9H.AU2OpA83W--
