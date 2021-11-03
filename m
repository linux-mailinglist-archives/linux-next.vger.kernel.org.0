Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A02444B8F
	for <lists+linux-next@lfdr.de>; Thu,  4 Nov 2021 00:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbhKCXXu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 19:23:50 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:46993 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhKCXXt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 19:23:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hl2ny45ZQz4xbw;
        Thu,  4 Nov 2021 10:21:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635981671;
        bh=JNlfKBzq1zCmgZ/McVRuEOMjaKuga2C5Z0se1VCnUoo=;
        h=Date:From:To:Cc:Subject:From;
        b=gAwkvG4QzLUGbzV4XtzlD3bfpZaDLk+XN5bnHfdSLsvzLTDXVOoPU6ZOjUb5tmm+P
         b2vEGPTwQxi2RY4GFe9oAPc5FyVgqac8hEA68aLW/EOeLwVP3x0AO6CR9aiIKlU7k8
         fuzxFzUBBjYrN7jZoDTJzCrmyxer58QJY9YwI79u4zAESUspzFfL8p5Y5xYopsG69k
         XVAoZJetQw+nsMjG7cyhVt4R+8bm49BGE+wNP1dmkr7Orwh3YOSs7tCFs3DNR1vhR5
         p2UbUzLyVqHD1yA0mXHH2rdncQzseKKytdtDF0BHH5zpELCrxW/IC3LTtsNZn6DjRY
         iTdFkp4VANTYg==
Date:   Thu, 4 Nov 2021 10:21:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     David Heidelberg <david@ixit.cz>,
        Jesse Taube <mr.bossman075@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: linux-next: manual merge of the input tree with Linus' tree
Message-ID: <20211104102109.129031fb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/69=uXyE_D/iridArR=DSJjA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/69=uXyE_D/iridArR=DSJjA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the input tree got a conflict in:

  Documentation/devicetree/bindings/input/cap11xx.txt

between commit:

  a8bc0707e134 ("dt-bindings: input: microchip,cap11xx: Convert txt binding=
s to yaml")

from Linus' tree and commit:

  322a552e1955 ("Input: cap11xx - add support for cap1206")

from the input tree.

I fixed it up (I remove the file and adde the following patch) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 4 Nov 2021 10:18:15 +1100
Subject: [PATCH] Input: cap11xx: fix for "dt-bindings: input:
 microchip,cap11xx: Convert txt bindings to yaml"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Documentation/devicetree/bindings/input/microchip,cap11xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml=
 b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
index fa0f37a90ac9..d5d6bced3148 100644
--- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
+++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
@@ -19,6 +19,7 @@ properties:
       - microchip,cap1106
       - microchip,cap1126
       - microchip,cap1188
+      - microchip,cap1206
=20
   reg:
     maxItems: 1
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/69=uXyE_D/iridArR=DSJjA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGDGWUACgkQAVBC80lX
0Gxzsgf8CsEwu0hUyolWfxDX0VLLJmP8b8gw/jG/Gg+d3Eo2v27t6wj1iqKFn4Xr
ajl8pD9LJQZlb5Q48KQ18wZaZ3/YSD1ddTF7wHrEiVc/1PRKzWWhTw5D1Gb1uiDp
IuKG/Nz2Cbjs3bZGPmr/12Up89O3qyU+JE/GxLkSDPM6liuNqJElBqbgLlOtOK4m
/873ifp4GHx7AyftITpuarhv8nI13z1fkeCH/ADmNlsB95/wgGoTwOyTgMEnS+wR
HrGPCSg86F91DwfTpdGWdgJCGbk07kYXURVcDXm33SBp3lKX82+TcbR7NVQpWCcM
CbGtiyZk8A56ExuSLlzFluOi0hi34A==
=39H5
-----END PGP SIGNATURE-----

--Sig_/69=uXyE_D/iridArR=DSJjA--
