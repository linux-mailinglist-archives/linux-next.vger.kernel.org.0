Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BCB4A7C24
	for <lists+linux-next@lfdr.de>; Thu,  3 Feb 2022 01:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239568AbiBCAAA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Feb 2022 19:00:00 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:49329 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234065AbiBCAAA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Feb 2022 19:00:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4JpzLj0t3Sz4xmt;
        Thu,  3 Feb 2022 10:59:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1643846398;
        bh=2IHWp8kmKG6pwvVBxGoqJsHFkv7IjW45tANE/ocUJCo=;
        h=Date:From:To:Cc:Subject:From;
        b=mJtV8cNfomv84yN40D9zLILinFiDXnuLdhS5HtKMiCSolQa5nXgCwNu48gAmdeR23
         aGMv5lQ09i4e4Tg0vjm7ZWznYu3j8cRtwyRn3hAT+aekIaFjGbZSPZWZwxrjRUNFDJ
         cIrBWbEspI9bpuqCif/67QEj6wTb/6h0ADzfp3ZvEDP8ddL1j3cHJHJ1zhbzC7HNcs
         ax9PCdNfa5oKCfmZnRI9zloRoGThlUDvkqWC9ke9H1xHHKrjJmhgIYh9B1wcvFX9Z9
         PihnREsvN85pTyehU0BUR0s2BJjkZUUjLMP6Lw/OGaGuPWnjSBwbfSGeg0RgQCHRJp
         5Ai8xd0oOh4wA==
Date:   Thu, 3 Feb 2022 10:59:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     John Harrison <John.C.Harrison@Intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Matt Roper <matthew.d.roper@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Message-ID: <20220203105955.1cd61502@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qYjjXV8pFbe/W.USU2pBn4_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qYjjXV8pFbe/W.USU2pBn4_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_reg.h

between commit:

  b3f74938d656 ("drm/i915/pmu: Use PM timestamp instead of RING TIMESTAMP f=
or reference")

from the drm-intel-fixes tree and commit:

  22ba60f617bd ("drm/i915: Move [more] GT registers to their own header fil=
e")

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

--Sig_/qYjjXV8pFbe/W.USU2pBn4_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmH7GvsACgkQAVBC80lX
0GzaEgf/ciUxwV2kDzIokzbMY0hb4N3b7NoLZIMauwA1+8VuA4IxKNAG3Rvoj2jG
+jSAZW7bL8rXjB2clWosD78q7Rjgj4wEFOpbCueoaaSFFU5bRwuft7UFr+Tak5Fq
6HWtKy3teCRqojMnEP+tIKg5mmF5Xb27SQwXd+E5tBTUVhCbftLR4tOaQeoZmQJD
Yba5pNP8fI82Fgml1xp5Du+3rWfZmZ/KbggIV2FvLA5tlt/JEk596MmXueqnQ+93
MRDAVvi6t7MfQtoZ6NfpDrJJ0vHzdqFutIQU5W3VmDKdKVLrgJihYeuKkNCisIaA
CK3kBAJ+Ku897zHL83PnQTzTkRT6dA==
=cpd6
-----END PGP SIGNATURE-----

--Sig_/qYjjXV8pFbe/W.USU2pBn4_--
