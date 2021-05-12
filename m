Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F2F37B303
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 02:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhELA3Q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 May 2021 20:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhELA3Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 May 2021 20:29:16 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F468C061574;
        Tue, 11 May 2021 17:28:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FfwcM5W45z9sWT;
        Wed, 12 May 2021 10:28:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620779285;
        bh=wzxqF8VP57iO8VsSfCS3l59Sht3GWfjqDTx+GVL9UWc=;
        h=Date:From:To:Cc:Subject:From;
        b=ABPwpCXB41ws80GgNYcG/dIZOQ8zRz3Lqt+UtC1qWdPALLvnNa5iidHqkkViDsyUH
         oXV2GlY7lkPG/FWwMpPnnHFOqBb9lNv8fha1WYwWKiomaUoD7M08sK3yf2u5sdbe9Y
         0TLJEBfGuDCOZTF1d4WVdj+wh/BOJ1t8Gi2BVpbzFDD8XtjFALRu24+sAgTMhPsp2N
         NeLY4DLsRQ4f/wxE7ogiR8dNuosk4302Od/nrS4aXG1giLdR+1VVNLn1HVP9/DFYWl
         KEexmhej7aVwWdmK+ANrekUDPfStyPWK5wzywDwqP7bjqNlLq4UKZjz3NDz/D9JkM1
         FhWKeUpuuaHMQ==
Date:   Wed, 12 May 2021 10:28:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Jason Ekstrand <jason@jlekstrand.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20210512102802.307861cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aLepwFzyOaaiX.gbf06/EqX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aLepwFzyOaaiX.gbf06/EqX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_pm.c

between commit:

  e7c6e405e171 ("Fix misc new gcc warnings")

from Linus' tree and commit:

  c6deb5e97ded ("drm/i915/pm: Make the wm parameter of print_wm_latency a p=
ointer")

from the drm-intel tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/aLepwFzyOaaiX.gbf06/EqX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCbIRIACgkQAVBC80lX
0GztkAgAl5z3Cv2n1A/M3BBjk1JNfDaRxhKDrwjiMmHUdNqOMjn31OWYhWS3CjAi
7vlnJpw51ZV+1S9V+XqKo3U52U3s7l4LvelLEBJdCRsyTOQ8vgcme1o1W4NyJXQF
MNBUiOhaMBN62i5qU89z1ZJ9tJSCan41b1xGQ+xIOAxlHA8cwQb0AEmxKgVEUvg5
wjm96GaPqFfyO2vXEAT/eMyINZpwRBBmyoxpjE+/G/hRAts7OHYhFjmKPW3MTHQg
SyOaFdBLBYqrNFsQJ3gmV9o6H9OMQDPGlq/Q/CX1k7rgf/hSbs3D22A3vVua8x5e
4D3qjumkvyy4XFQL+PziTHVWsI6Keg==
=UcGr
-----END PGP SIGNATURE-----

--Sig_/aLepwFzyOaaiX.gbf06/EqX--
