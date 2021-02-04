Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F81E30EBA9
	for <lists+linux-next@lfdr.de>; Thu,  4 Feb 2021 05:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbhBDE7g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Feb 2021 23:59:36 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:49495 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230273AbhBDE7f (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Feb 2021 23:59:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWRCZ069Nz9sxS;
        Thu,  4 Feb 2021 15:58:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612414733;
        bh=o8GSPtJAR94fDp96R4qjjwurgzky4QNCyNbf1MHRNUo=;
        h=Date:From:To:Cc:Subject:From;
        b=kGBJSCMAXBwtRdGIxCxVpmvWVNrtd4tvYkaz3A11UfhcllC25yfZv2eoELUGg9pcl
         G4spDJ3RXSxcDBBKxbM/988UYnJaG5y+Nr18pZFeBbrVF/aAR8l4br8HY9XsVwZ+BC
         vbT+zJyuTbZ87c1n1HOhoBshKl9/vWrkWugXwFXyUxF6d97oiPs7fTz0mpWaJwzHGk
         LeFiOL7emIUZ7ChVOrREVdFE5oVfyxjp8hnaedusjYX/MnyseCGBhm3+QFgxnpKiUJ
         jSTCOULWkGD+Eu3it5IK+uDluKs4SosZ+OCKLd4VKN0npJCsZk46JRkKTMiyYk4NNv
         YTpjQ58HNKp8w==
Date:   Thu, 4 Feb 2021 15:58:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drivers-x86 tree with the drm-misc
 tree
Message-ID: <20210204155846.5aef94a8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vXMANa1gQE/6.UO58AyQ+3L";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vXMANa1gQE/6.UO58AyQ+3L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/gpu/drm/gma500/Kconfig
  drivers/gpu/drm/gma500/mdfld_device.c
  drivers/gpu/drm/gma500/mdfld_dsi_output.c
  drivers/gpu/drm/gma500/mdfld_output.c
  drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c

between commits:

  b51035c200bd ("drm/gma500: Remove Medfield support")
  837f23bb4b60 ("drm/gma500: Drop DRM_GMA3600 config option")

from the drm-misc tree and commit:

  bfc838f8598e ("drm/gma500: Convert to use new SCU IPC API")
  25ded39ad064 ("drm/gma500: Get rid of duplicate NULL checks")

from the drivers-x86 tree.

I fixed it up (the former removed the text that was updated by the
latter and removed the last 4 files) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/vXMANa1gQE/6.UO58AyQ+3L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAbfwYACgkQAVBC80lX
0GwxMwf/QawMM9sngMztt4iWCkh2mZAwbY53aT65k+mzk/du8vDr+MMA8NGnYAFY
UUp0zhhDvmdrClHEIOl4R3QnXabIzWcBiURnrcKiSJXbTVapYGXXJ26hkgJDGuRO
sOdwtCS+rzTKZqk+fMwgqU9vPokz21UMjCgCFC9ZBrzoAHyWa5KhyZMTqy+hE+15
vmajV32ryu9tP+al4lwKyfGRKia6vNA8YTfiV4+8uGg+nk1r0vJDnAFXsrwk+yzF
SWse70ZbtRCvShFb/d3+z/hT4aEzm+PPaW88nwO8LL9tsc3AtoFs3zD/DbH151V+
EDRLDV/a5YdWb0vMM9U0xCNxoJQBrQ==
=/Zsb
-----END PGP SIGNATURE-----

--Sig_/vXMANa1gQE/6.UO58AyQ+3L--
