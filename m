Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C217133FC81
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 02:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhCRBCg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 21:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhCRBCc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 21:02:32 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429CDC06174A;
        Wed, 17 Mar 2021 18:02:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F17zL5VWJz9sW5;
        Thu, 18 Mar 2021 12:02:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616029348;
        bh=eHnajfXpFjdDfsAqUJl4e1LeqfH+swSe/7cEiSQT42s=;
        h=Date:From:To:Cc:Subject:From;
        b=l2DpR/zl20WaZNiWbMGAUulClkYx2Cu9g8c5cdwIO9ZGomxPJ/KCJIvbH+9fPN6Im
         CKCZDyixJW12f59UWcuS8uBnZfIWsCQDkvjs7B2Nal0uv5LX0ecbfaTlGEqI2OGfAM
         VpJIjxhw+deICaRTovpON3xVoMBj5pfm5EHxTn/5E4nLALi3yh//m3jKRXjlLukk39
         Mmiged9tUKObYy+8FFfq3CQrMIuSZEmlzZSo8R8ulPwSlbP6qGG6k7qKqsC93CRH4r
         F0X8v5sgXBmEvReMuScs4l2OnAlLgZOSqInZxbI8JRcmeCSLvW2vaU8YyiiVMzdqjo
         VsqmWeYv+0nAA==
Date:   Thu, 18 Mar 2021 12:02:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Junlin Yang <yangjunlin@yulong.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Menglong Dong <dong.menglong@zte.com.cn>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Message-ID: <20210318120221.6dc8f33b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oZ.TksL4dDhKBuenfDKgVzi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oZ.TksL4dDhKBuenfDKgVzi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/omapdrm/dss/dsi.c

between commit:

  690911544275 ("drm/omap: dsi: fix unsigned expression compared with zero")

from the drm-misc-fixes tree and commit:

  bbd13d6a7b2e ("drm/omap: dsi: fix unreachable code in dsi_vc_send_short()=
")

from the drm tree.

I fixed it up (these do basically the same thing, so I used the former
version) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/oZ.TksL4dDhKBuenfDKgVzi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBSpp0ACgkQAVBC80lX
0GzsEAgAmAl5/2tglQc8Eo/ncN6jarRCoL3sucB5Zy9s3kE8SORVB8B3cqWKum0U
n7R735XgojEs8nJLgIbXIy7gUOF8yIoSAHGWHKI0JLLUlP7gtpwEg3uTmO+zjIPD
Z60oA0t0sAtYAGyLIJHGGnt56aGJ5KWEzhEnj0xBG1A8qtAB/Fr2Yg/UvZRNmLXn
SW07t6LeBR5V+NJ6zX8EiveEiVsVI0j+DsP3y8t79UD01pRr7AJ+OiYf2xrTTgWo
KXFKeFST+fq5n0CBCOtwj7pcihNFj4r9+2hv3VoMqPQQMJ3ZYqyAUOvVEJv9xYLl
cnPb28mXq1CGz+pnH4CFGOcjFCu3ZA==
=ry2h
-----END PGP SIGNATURE-----

--Sig_/oZ.TksL4dDhKBuenfDKgVzi--
