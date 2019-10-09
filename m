Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E5DD049C
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2019 02:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729487AbfJIAKM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Oct 2019 20:10:12 -0400
Received: from ozlabs.org ([203.11.71.1]:53451 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727051AbfJIAKM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Oct 2019 20:10:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46nvjr741Pz9sPJ;
        Wed,  9 Oct 2019 11:10:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570579809;
        bh=M2JGGKz6pf/UCv2VzRT9RzRQgEvwfLMOyVP1wpLhvRw=;
        h=Date:From:To:Cc:Subject:From;
        b=MXrg8WZVJH4VaXD5zteICeGGPj0TZK6h0n734yA74Ka7eLXyF5I57LR707EIDw+jI
         lpXidsHBUDJygCOmYf7E3BYInfwCRhh+pkIEturQXJVZ+IQxGs8ym2utkSkZ4tROiS
         Hp8LlesS2w3t5XTO4JtTH+Et+uPIZM6qAcixwIIzu3e9W36dapKZCAScEJ6GpAMwKv
         Jab6AeAsZFKvk5Z0CO8R4ZkZCVWD97DSNp2O0bfQG/NOb1kJU/cgg6zphIVqrV46oL
         3B8qXbJdkD1ap0TJ7empmeFW6+yCQh6tqqwS3P7YExgalR2hjrgVOdX+w80P/Nqr+N
         yOw7JdOKXfzjQ==
Date:   Wed, 9 Oct 2019 11:10:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Matthew Auld <matthew.auld@intel.com>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Message-ID: <20191009111008.0853cad8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J9iT0kQmK2lprFt7nC9I6dj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/J9iT0kQmK2lprFt7nC9I6dj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/i915_vma.c

between commits:

  1e0a96e50882 ("drm/i915: export color_differs")
  33dd88992313 ("drm/i915: cleanup cache-coloring")
  b290a78b5c3d ("drm/i915: Use helpers for drm_mm_node booleans")
  5e053450c1c3 ("drm/i915: Only track bound elements of the GTT")
  2850748ef876 ("drm/i915: Pull i915_vma_pin under the vm->mutex")

from the drm tree and commit:

  71724f708997 ("drm/mm: Use helpers for drm_mm_node booleans")

from the drm-misc tree.

I fixed it up (the subset of 71724f708997 affecting this file is in
b290a78b5c3d) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/J9iT0kQmK2lprFt7nC9I6dj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2dJWAACgkQAVBC80lX
0GzoKgf5AVtlP9pdgCnVoOOOW8BNUxg2ew2ZT5rd6HpZgufsLFDkG+3zIj0jpJ4n
3dAYd0HryL6JTGU4JvDIvbwEd/yloSjx6p1mFK+7GjUHpy0W/gluGv5jHOrOdeRe
bPnmRsb94Q7nCY0Gv0X3nao+oerB7l3hYRm9YdqCbzk4pdTzMG183tm3IrZ6MF1N
18d6kMGNbEBlm+ybpyAvE0oM3028J/M2GqszSm25vj3C2f+tFW/NcmIpR2CxiNma
FlDuUUcgNi7ZsHK+Fgb4RLVmq2gx1YTDiXOt+iggaPMLeFHArv/kn/iZdor0bO7Y
vCtR4SHLZnfBEyr7JeFJ4l4/X6VP4g==
=Nyqk
-----END PGP SIGNATURE-----

--Sig_/J9iT0kQmK2lprFt7nC9I6dj--
