Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B39A71A60F4
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 00:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgDLWuq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Apr 2020 18:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:32982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgDLWuq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Apr 2020 18:50:46 -0400
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF6DC0A88B5;
        Sun, 12 Apr 2020 15:50:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 490n5p0vMFz9sP7;
        Mon, 13 Apr 2020 08:50:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586731839;
        bh=ouvuSGWpY8zCYwGIJvJauHXD9yFe7/WcWfZ8JgoLDwU=;
        h=Date:From:To:Cc:Subject:From;
        b=eipor2GOTvcm006DPDbtrDSZB/YjCbiYO3yQYcPDPl/QN1bVpIZtMVv/oY8LPAAWi
         mQ0tVSIJPYVTMLq4M9TE7FS5Tx8esBJ+Q/TcrHSD7Iouux3PQl5B4xh6lAipip0Bu+
         bVg1yM+E6+xa+BMWfnsAovG1wOKkyVitnqB4kOmKUpD1IDaH3yCT1WPomoQ90kPz21
         krXUqp5HcSU9zaBsiav4I9ro42v/v5ARPthKE8BNoTz0ZaA4LJezb0ivt20J++18wU
         4C0FzzxJGHWDEMB7g0UWOCVW+XFBlBrH4v1ufnU3lWGo3HVQSjvguxpg+1v4rSb/1g
         EDp4YdcBD4fEQ==
Date:   Mon, 13 Apr 2020 08:50:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>
Subject: linux-next: manual merge of the realtek tree with Linus' tree
Message-ID: <20200413085034.5e77f236@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SUqht2mkXPQtYMW.duPijK.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SUqht2mkXPQtYMW.duPijK.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the realtek tree got a conflict in:

  MAINTAINERS

between commit:

  3b50142d8528 ("MAINTAINERS: sort field names for all entries")

from Linus' tree and commit:

  d6656fa4c621 ("ARM: Prepare Realtek RTD1195")

from the realtek tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 6851ef7cf1bd,1b15d2dd2535..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -2269,8 -2203,10 +2269,9 @@@ M:	Andreas F=C3=A4rber <afaerber@suse.de
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  L:	linux-realtek-soc@lists.infradead.org (moderated for non-subscribers)
  S:	Maintained
 -F:	arch/arm/boot/dts/rtd*
 +F:	Documentation/devicetree/bindings/arm/realtek.yaml
+ F:	arch/arm/mach-realtek/
  F:	arch/arm64/boot/dts/realtek/
 -F:	Documentation/devicetree/bindings/arm/realtek.yaml
 =20
  ARM/RENESAS ARM64 ARCHITECTURE
  M:	Geert Uytterhoeven <geert+renesas@glider.be>

--Sig_/SUqht2mkXPQtYMW.duPijK.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6TmzoACgkQAVBC80lX
0GxJGgf/RKvJlfNRD23g7ndl1Mslb/0aHL2rcRiLKabQPWEKZJqtjcCV8P7qbOq+
4uFmQRGuIJwwwTSLcvX72iNc1gHKTeND56m9GMPjoS8nR/7Ia+vwmtJjWgLIRVFA
g8cO/20M8dfYLhlCtm+SIxUbTWdSbBdRhJ5bl1xR0GvF/dchf1ceDS2uNRSfoeNO
91UX81eg4MRh4YHbjO2KdyC0wbyYL1c+30p1/lWcfrbNWafCY13UMk/HkvMl7b6c
7w6Zc6LnfnOPFN9zoFZ6ey4ic04QMSAHWXEfYBgXYKa/vBZPK0u4Dmz/fGicDLt3
HR6Kzm3/ux34J2uSlDAi9jidvmje2g==
=r51D
-----END PGP SIGNATURE-----

--Sig_/SUqht2mkXPQtYMW.duPijK.--
