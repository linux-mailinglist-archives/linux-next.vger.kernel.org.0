Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77CD31E1AAC
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 07:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgEZFUV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 01:20:21 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60903 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725771AbgEZFUV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 May 2020 01:20:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49WMjY2cLJz9sRY;
        Tue, 26 May 2020 15:20:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590470419;
        bh=B6Hi4gILlLDp7n+DVdTtsXOFIPKhldJnkNXQiTB38Qc=;
        h=Date:From:To:Cc:Subject:From;
        b=ExgUCfJ+xAr19RuEbN8K4XUAah4iEWvNOsbfZLoM26Isf2EWYdrDodAZ1vuI0vG+V
         SjiHrJnurJDbLxA7vFYGkMsFAGTnLGKPm3c6hPQu5cTK5evSvFlHsOEip+bq9bRMp2
         UOyE8XHxMb6WdgoJ9Ukgf4q7wBxWSkogX75wt99LbZvXI12erCQoZFkw+aHDOQUWXM
         eLgOX1znz+IKjtWB/344ha0DA2s861n0QJZs69VHzsFxAOW+puuW4Wgp7WhnfrpaIy
         B89vs4X7oSBIA8KvP4C0iF5Bc8x1hE6a81wZb+AU3j3wmCUZoNiTp+QH9boIkmAzNz
         taO1LBnCtHAXw==
Date:   Tue, 26 May 2020 15:20:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Wim Van Sebroeck <wim@iguana.be>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: linux-next: manual merge of the devicetree tree with the watchdog
 tree
Message-ID: <20200526152015.60b5bfd9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IstNJLgrb5qemln70tKIKuh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IstNJLgrb5qemln70tKIKuh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/watchdog/renesas,wdt.txt

between commit:

  ff1ee6fb276c ("dt-bindings: watchdog: renesas,wdt: Document r8a7742 suppo=
rt")

from the watchdog tree and commit:

  d0941cfb9fa8 ("dt-bindings: watchdog: renesas-wdt: Convert to json-schema=
")

from the devicetree tree.

I fixed it up (I removed the file and added the patch below) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 26 May 2020 15:15:51 +1000
Subject: [PATCH] dt-bindings: watchdog: renesas-wdt: fix up for yaml conver=
sion

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/=
Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 27e8c4accd67..572f4c912fef 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -24,6 +24,7 @@ properties:
=20
       - items:
           - enum:
+              - renesas,r8a7742-wdt      # RZ/G1H
               - renesas,r8a7743-wdt      # RZ/G1M
               - renesas,r8a7744-wdt      # RZ/G1N
               - renesas,r8a7745-wdt      # RZ/G1E
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/IstNJLgrb5qemln70tKIKuh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Mpw8ACgkQAVBC80lX
0GycoAf/cVP+jRU/ZUPUOWJoDaGcQo702ufuW+m6X5PQu1Z+CRC+Fl+GmhQhHkBa
ai69+D9mdnfzk22DTxco4nAXqUy1ALDbux4TG8k6ppwslWaQ6ghP/TzdsuMKbFBM
WHA5t+LouYzJV0zmVYIUVhdAqSdwvh1vGJMtHT2G8pGJWJWwzbwd2Qm6aR2h7f0t
5glook8fBy16/b1hEKhKqSzKYoSnZnLgt5k09rpBVqyUtyFwCPV0r3GBDAf1TuQ8
RDIz/A4PuYeBU47WAs2aB1pVabzutLAraCSqhe2dQrs4LZV0H7jkvpiFkV1f+Z0y
wcy48bp+JrWZOCHHLN7dQv0Qdn9Sfw==
=gkwN
-----END PGP SIGNATURE-----

--Sig_/IstNJLgrb5qemln70tKIKuh--
