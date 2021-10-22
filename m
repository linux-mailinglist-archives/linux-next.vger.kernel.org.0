Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8B1436F23
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 02:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbhJVA4A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 20:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhJVA4A (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 20:56:00 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18091C061764;
        Thu, 21 Oct 2021 17:53:43 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hb5Sf3L14z4xfH;
        Fri, 22 Oct 2021 11:53:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634864021;
        bh=d6ItCl+Efl1Nk/5Rb/6mxbH0xgfWmTzJa5UQ5hcJI44=;
        h=Date:From:To:Cc:Subject:From;
        b=I7VGwtVF4rpm9XyA+1CHWDHQgD42WZWwLp9vQDO4xcYhgWdqkhiqZ7hDLEz6zQuw7
         1PSIvn6OpB+vNWAZzxpt2mTJntN7g97Ow6pef2HgWUbkG6GV2+loZaWvnA+Mao0w75
         dPY9dl+XKJAf5cqqbJEfOEtpC19n6LP8cQ2OgGr3vIlZ6/43YM6MBB5JPm2l1fFtU7
         17ZlM71G1MtxC4OAerNqdhgTLov9UVo+ny7FsdObSIOcnd3SvSTLRAUwtuXi0ZAss9
         nBFGTNjMBJ7+oD9aUk2bwdXFxkbCPggEgUqNKFCj6aGX1Ark4JAviqCM25oItPwQWm
         LcfA+KEEvb8Ew==
Date:   Fri, 22 Oct 2021 11:53:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Bryant Mairs <bryant@mai.rs>, Hans de Goede <hdegoede@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Message-ID: <20211022115336.28e41185@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QAgoVkw4C2wHzZH=MYSvvXG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QAgoVkw4C2wHzZH=MYSvvXG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/drm_panel_orientation_quirks.c

between commit:

  def0c3697287 ("drm: panel-orientation-quirks: Add quirk for Aya Neo 2021")

from the drm-misc-fixes tree and commits:

  072e70d52372 ("drm: panel-orientation-quirks: Add quirk for the Chuwi Hi1=
0 Pro")
  63a4881572d7 ("drm: panel-orientation-quirks: Add quirk for the Chuwi HiB=
ook")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/drm_panel_orientation_quirks.c
index 30c17a76f49a,62e8ccc7ab9c..000000000000
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@@ -134,12 -140,20 +140,26 @@@ static const struct dmi_system_id orien
  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T103HAF"),
  		},
  		.driver_data =3D (void *)&lcd800x1280_rightside_up,
 +	}, {	/* AYA NEO 2021 */
 +		.matches =3D {
 +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYADEVICE"),
 +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYA NEO 2021"),
 +		},
 +		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+ 	}, {	/* Chuwi HiBook (CWI514) */
+ 		.matches =3D {
+ 			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+ 			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
+ 			/* Above matches are too generic, add bios-date match */
+ 			DMI_MATCH(DMI_BIOS_DATE, "05/07/2016"),
+ 		},
+ 		.driver_data =3D (void *)&lcd1200x1920_rightside_up,
+ 	}, {	/* Chuwi Hi10 Pro (CWI529) */
+ 		.matches =3D {
+ 		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+ 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
+ 		},
+ 		.driver_data =3D (void *)&lcd1200x1920_rightside_up,
  	}, {	/* GPD MicroPC (generic strings, also match on bios date) */
  		.matches =3D {
  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),

--Sig_/QAgoVkw4C2wHzZH=MYSvvXG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFyC5AACgkQAVBC80lX
0Gwwlgf/YzLzI7xb2reXJgvWAk/JLKFVEQOBWx5cYdRpFA/w00uo87yKWUQqkdFv
lR2dIpDjd5fsc4EFRkblAZikNZiazEVj43NWlfd2eRQdlrsgYNWiu5j82bDqinTh
QcIDAmZp8WNSh4AUTCCk/Su/nJGKKj/4bpdRoIeQS9fsQEKUEKUQ2tqgraUkLdeR
EEP36LkbPTlrHmOVyFD1sjrz+f1G5/p+rY46yE/4QZTauvAOrhx1+e9ubsYg5Max
YKD4wiGIMasfF3dHm2O8ZJ86wPoqgx0CrISFQr3H+R15GVLgdSkavfe5moJGmavr
zs3JA1680M2oqshbADaN03MaGyEOPg==
=Njwx
-----END PGP SIGNATURE-----

--Sig_/QAgoVkw4C2wHzZH=MYSvvXG--
