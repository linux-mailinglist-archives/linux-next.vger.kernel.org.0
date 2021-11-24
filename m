Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875F645B090
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 01:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240595AbhKXANM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 19:13:12 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:48431 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbhKXANK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 19:13:10 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HzLx30whkz4xcK;
        Wed, 24 Nov 2021 11:09:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637712600;
        bh=X4bEEqqhqXPwwuJUvJkcN72qA1+JmSUCFA8Yvn1FfIk=;
        h=Date:From:To:Cc:Subject:From;
        b=jeF79H9Sl0KsBUD/7E5fG2dU335wZnD/dFu/SQ2hj7ZTm+PiGRPrsIERjqTbOMVe1
         RqVbBJb09oYBhS9YHhsBRg1izzuuClJFzXkfZdL17t5jmKdn/YwLceLHIk9JkKx6hQ
         kdVp6KychvZnF8ala37qJ8fJgE351AFseksF1HziyO0TvfpNtJXEhiMy81Tom1taFu
         dOOAKEmX0+FLl4PjGJgUhWh4+5wx1N7FsvVXnsqZBfL8tGXKZ+LSAX4zvtPLA09a8Z
         ijW8/onAQidGXGBfESJf0HicB46RZDFet6XYdykW3NzFL2TU2oVbZS/6siLaTWrs/V
         Kb3r8PHRgu50Q==
Date:   Wed, 24 Nov 2021 11:09:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     =?UTF-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
        Juha-Pekka =?UTF-8?B?SGVpa2tpbMOk?= 
        <juha-pekka.heikkila@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Matt Roper <matthew.d.roper@intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Subject: linux-next: manual merge of the drm-intel-gt tree with the
 drm-intel tree
Message-ID: <20211124110957.18dea3f2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wUXCq9DPBuql/7JaF56gUnb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wUXCq9DPBuql/7JaF56gUnb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel-gt tree got a conflict in:

  drivers/gpu/drm/i915/i915_pci.c

between commit:

  3c542cfa8266 ("drm/i915/dg2: Tile 4 plane format support")

from the drm-intel tree and commit:

  a5b7ef27da60 ("drm/i915: Add struct to hold IP version")

from the drm-intel-gt tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_pci.c
index 69b8029da6b6,5e6795853dc3..000000000000
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@@ -1042,9 -1030,8 +1042,9 @@@ static const struct intel_device_info d
  	XE_HPM_FEATURES,
  	XE_LPD_FEATURES,
  	DGFX_FEATURES,
- 	.graphics_rel =3D 55,
- 	.media_rel =3D 55,
+ 	.graphics.rel =3D 55,
+ 	.media.rel =3D 55,
 +	.has_4tile =3D 1,
  	PLATFORM(INTEL_DG2),
  	.platform_engine_mask =3D
  		BIT(RCS0) | BIT(BCS0) |

--Sig_/wUXCq9DPBuql/7JaF56gUnb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGdgtUACgkQAVBC80lX
0GxU0Qf+PUWUrX4jQtgN0mLg/SXLooNQP3GQ2tzj8QUvnQQDNWPvuMMFy77hfimC
z5a9/9cdIrADDTyjs2sbqSCCRmPpQ5L68Thm/ayivtwzNZlq9sAk7wa7Q2ZJwTM1
Qfs5nxlWqHFUjS75oJM5scR5BihwB/AnC8zramdSdwJlG9shEHrbH7AqWYjachRl
YWOkttrQo0uK/RC3L2ipSDdkrM/19/HGa6yYa2zt6hXCX5aOhGd0ZpBfbDwMlrnz
N6mxrxCBESqBr5t2I/0Hlt8XYok/zNaYWlOg6PX9UuDtKTL8iH1zJtHVzfgN9zze
0zjN1FpZl044j/bCg4CBWOar2M0uOw==
=64P/
-----END PGP SIGNATURE-----

--Sig_/wUXCq9DPBuql/7JaF56gUnb--
