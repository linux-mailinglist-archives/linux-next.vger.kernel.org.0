Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B602220EB17
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 03:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgF3BwO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Jun 2020 21:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgF3BwO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2020 21:52:14 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E9EC061755;
        Mon, 29 Jun 2020 18:52:14 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49wnR86K8Nz9sDX;
        Tue, 30 Jun 2020 11:52:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593481930;
        bh=haJsUCTl3HXOuqQW+RwIUPwO3u5ZbxUOYuPPlYz2MkY=;
        h=Date:From:To:Cc:Subject:From;
        b=Fm8s6BH4ANPG1t7ms3hWULh21qdZu2xbZ5RHbUmbonZe7c+S7kuPYBBpGuqW3E9de
         R2RvxspH7pqkmVwAFrplgYuAoFaFZKHbWFA7uahGEOtTCi9glUvC6vpGd1Ks5WdtMO
         8Z1QiikuaOjAO3sQFailjKePovZSpgOIv5NKM/A1kt0F9mTBOXHwQTKe963wNOPMxR
         wxY7zLp5W5T3Kx/XCzayaNuwURIvAynjPpOQWfNot42qJqZ+7Di2QwZTmhgqF9f3z8
         PEXxdEyfWUaNc8MvDlylYM2GAV0psJrFz0KpWLzdJ4cpY7Ast7dvNJKexm58kCIwHm
         urNbzzKGheFgw==
Date:   Tue, 30 Jun 2020 11:52:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Colin Xu <colin.xu@intel.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Dave Airlie <airlied@linux.ie>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Message-ID: <20200630115202.04c39f9b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4fPofAu7Md8T4NHp79C0oXC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4fPofAu7Md8T4NHp79C0oXC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/gvt/handlers.c

between commit:

  fc1e3aa0337c ("drm/i915/gvt: Fix incorrect check of enabled bits in mask =
registers")

from the drm-intel-fixes tree and commit:

  5f4ae2704d59 ("drm/i915: Identify Cometlake platform")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/gvt/handlers.c
index fadd2adb8030,26cae4846c82..000000000000
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@@ -1731,8 -1734,9 +1734,9 @@@ static int ring_mode_mmio_write(struct=20
  		return 0;
  	}
 =20
- 	if (IS_COFFEELAKE(vgpu->gvt->gt->i915) &&
+ 	if ((IS_COFFEELAKE(vgpu->gvt->gt->i915) ||
+ 	     IS_COMETLAKE(vgpu->gvt->gt->i915)) &&
 -	    data & _MASKED_BIT_ENABLE(2)) {
 +	    IS_MASKED_BITS_ENABLED(data, 2)) {
  		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
  		return 0;
  	}

--Sig_/4fPofAu7Md8T4NHp79C0oXC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl76msIACgkQAVBC80lX
0GxjXAf+PDgs9BZ4I0/T1J1Jwnp4cQHq+tdnzow+RsWfWh57G8b6de2+iWwGoOZ5
AtAIEWvlxl8NLPqpislhRpx9hBk3Aob/SLYAuQL94xD3stAqm5HnpprFxtKNLC6X
30oiw0K12JvOfTZ7KqzCCh1LrbERmhgx4+DJBqv/hy3L3Okg6MPfoMEX3p0kHn01
udqw1vlTf9ruOwMVIX69mLAr3E2Q3iMXbbwhXPiQPxby1ZkmGfGtGUfLesYxKp13
umLi0qe7AQxO27lAtDLxL0yvWEP94iH1VuhQtWG9XhMO1gU7+hvrBmjRmzxJF0Xq
GxkdgTRtqBENst7A35lvATu1OzdhmA==
=GyE7
-----END PGP SIGNATURE-----

--Sig_/4fPofAu7Md8T4NHp79C0oXC--
