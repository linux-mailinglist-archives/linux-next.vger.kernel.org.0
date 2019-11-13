Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50357F9F60
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2019 01:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbfKMAkl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 19:40:41 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52255 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726960AbfKMAkl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Nov 2019 19:40:41 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47CQkr1WLgz9sPh;
        Wed, 13 Nov 2019 11:40:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573605637;
        bh=zGB2x+uOiISDFNlvQBfSFlh+hinWcZ+bX2WnqS9eN/s=;
        h=Date:From:To:Cc:Subject:From;
        b=QOZye08E4DLQdE/1wDa4pOlovdLZGHrmxdKO7KfoHhdbrCW0pqagyPbYvZfxDZb4x
         4V7Nr7a6M5YTAwOOCCbOrZzEZn8A5nv/mg3I1UAZOeV0if8jQcc87RGwZxOdh61TmH
         hqovx91m9xZ3LEFFP1/tRaTPsnOuaf9sla0TE83OKAy+cGL1loYWmVpys59HL0FhIO
         6w5ersLHqSL556YiuDKbh+o94zGhwSlYu3DoSRr9GjKhRLPF5ID2nI27BSe/3TvU/P
         MIFfYuYchwHx6xD+nQsQ7O8y/CBbczPcu8/fKLGFgejp2SQtjRd6KGAeVRPlDkkyU3
         TLAD7veaDxB6g==
Date:   Wed, 13 Nov 2019 11:40:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jon Bloomfield <jon.bloomfield@intel.com>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20191113114034.3332d688@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gOUalc+A2t=HKgB0T6_S/nq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gOUalc+A2t=HKgB0T6_S/nq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/gem/i915_gem_context.c

between commit:

  f8c08d8faee5 ("drm/i915/cmdparser: Add support for backward jumps")

from Linus' tree and commit:

  a4e7ccdac38e ("drm/i915: Move context management under GEM")

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

diff --cc drivers/gpu/drm/i915/gem/i915_gem_context.c
index e41fd94ae5a9,de6e55af82cf..000000000000
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@@ -443,9 -527,10 +529,13 @@@ __create_context(struct drm_i915_privat
  	for (i =3D 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
  		ctx->hang_timestamp[i] =3D jiffies - CONTEXT_FAST_HANG_JIFFIES;
 =20
 +	ctx->jump_whitelist =3D NULL;
 +	ctx->jump_whitelist_cmds =3D 0;
 +
+ 	spin_lock(&i915->gem.contexts.lock);
+ 	list_add_tail(&ctx->link, &i915->gem.contexts.list);
+ 	spin_unlock(&i915->gem.contexts.lock);
+=20
  	return ctx;
 =20
  err_free:

--Sig_/gOUalc+A2t=HKgB0T6_S/nq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3LUQIACgkQAVBC80lX
0GybQQf8CjfWsd4l/CLD3ydwD6MgdMFfg2fzHEoMVGD9rdzzUWrCMHcckA4BUYe+
H0dF42iBBJJklIKeF4bA+R1ZuQx4wxGZJySBLmddAS6RJieyPnu+ztXbmeDrMEss
RPc3nmNHN9ZkelMRBksUWDNRgMrmXqMgrECsFk5utQOphr41dV7ZFVcLbVAq2yuq
Up7v36R0OivLnISQnpRvstW+TkgPDuoZ9e6zHGI4uAgbgJA1Rwa6HObkRQ9xko8w
wcEscnH1Bcp2bAbcG4jTCJNrUY4ILYEskHTb5UJE9LmJtqo3WcJJ4xoSRvdf9A21
Q5MUZBnhrdlMtOBbLqIGdVpaNKu71Q==
=X9cU
-----END PGP SIGNATURE-----

--Sig_/gOUalc+A2t=HKgB0T6_S/nq--
