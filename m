Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 476F943F41D
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 02:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhJ2AvN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 20:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbhJ2AvN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 20:51:13 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618C7C061570;
        Thu, 28 Oct 2021 17:48:45 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HgP1k1nxzz4xcB;
        Fri, 29 Oct 2021 11:48:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635468524;
        bh=FCQzWvP+AB7oAHT1PeIYE1IUj7mEzomLovvkTip/16c=;
        h=Date:From:To:Cc:Subject:From;
        b=qjxF5xtiyG5blf9o1DtE77u8umPSM+iX33aaZJbtiKCy/tcIhr8Db3Vh95fc5/Okg
         F1qnyULiZpEHtympzIIL6wgL/xRDQ+3lrkc5lqDtP0If+QdOBJJ2L//ZALjbryBTSf
         pUpuZ7M7przQgdcGsdOr44epvX2jhHtmSXIdMrOco6F05/ynDfqpQOXglCKazfrP9l
         3PF5QdZN1KNPjgUdCFbAg2ULbv1mUOsD72ggY2fJ5tlcMXytvLJfCfMZtPAeGxRvUH
         2ylJe/l1bXxvqa4DP+vxZ9Amg7CJbqPX0IdkigRHaFKj5l+L0c5NehCvkhK0P0B1gf
         5rNzU6XRXxZkA==
Date:   Fri, 29 Oct 2021 11:48:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     John Harrison <John.C.Harrison@Intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Matthew Brost <matthew.brost@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20211029114840.6a3a78bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xt5z.i2.qZV/j7OqA=Pyt6z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Xt5z.i2.qZV/j7OqA=Pyt6z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/i915_trace.h

between commit:

  9a4aa3a2f160 ("drm/i915: Revert 'guc_id' from i915_request tracepoint")

from Linus' tree and commit:

  3cb3e3434b9f ("drm/i915/guc: Move fields protected by guc->contexts_lock =
into sub structure")

from the drm tree.

I fixed it up (I used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Xt5z.i2.qZV/j7OqA=Pyt6z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF7ROgACgkQAVBC80lX
0GwDjwf9ES1kV83+eTsl0RucN0MlLoR/a90yvyKRhvhlScgHdKUkuncE1mLzRUUi
9Vfe6eW0invRkjBkjabzTtQn/zwIArLe6k1Dcfv/IzY0OXWGgD9hsNYM28tSIpo0
FMYxt37NXrPJ2Zdv32n5UpU6WuZEcKAi3WnFrXCp25VOjducOy3M2fVJJ7/XmTsN
bUgBH+hyoVv07kVBlniRtMrKR1lczaSLD2v6hgAgGp/H68bK7EmF7EH7QWmUexYc
FaFukquqfUxbGktJn/e7+7GCDnBlYGZPif4qZ9AVPN+JWjUzQSXhIMSDE5iaWrwS
x2DjrMOjo3PF6Fbu/f2w4VS/Ho72bw==
=li/R
-----END PGP SIGNATURE-----

--Sig_/Xt5z.i2.qZV/j7OqA=Pyt6z--
