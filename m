Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5758D133843
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2020 02:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbgAHBKs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 20:10:48 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54435 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgAHBKs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jan 2020 20:10:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47srln734mz9sRf;
        Wed,  8 Jan 2020 12:10:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578445846;
        bh=8snj5kP76dO4vwtqodaDJCVWIHACH1y3jhD4DSEN0bM=;
        h=Date:From:To:Cc:Subject:From;
        b=LSHtolFT2hA75F1bJn8csV5oKJvFi/Ls9z/Pwd6GLLc1gPli4slfsCyFgIj5tzXMY
         0togMcts7I0XTlC17mOusm9z3qOI8VetYsFRmiTDFHotwDtOec/XvM7TfUi5I5tHpS
         eALLJAWUoHDuDBeBXpR9YKlDJqvA328wzOWo6CEZXZLCio1edmvb45WNKBz5hHUeVa
         HiaqujaT2p2GuV5ZfFgBJeG9VapSXBdgpiqtrjWveNBGwcqj0nh84VglkBxBKCiBrH
         5ZCB8PDGxo8c/LRpMw9lFwHdDUBvAIBs/jxRBT41MjZdaePZuNF5c8XLt3KCo3bDYP
         PDdZYv1cAjShw==
Date:   Wed, 8 Jan 2020 12:10:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
Message-ID: <20200108121044.5edb4992@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3R2owpPGhb9DVxdhV1I8.j/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3R2owpPGhb9DVxdhV1I8.j/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/i915_drv.h

between commit:

  ce69e553b9a4 ("drm/i915/gt: Restore coarse power gating")

from the drm-intel-fixes tree and commit:

  90eb7d2aa3ce ("drm/i915: Simplify NEEDS_WaRsDisableCoarsePowerGating")

from the drm tree.

I fixed it up (I have no idea about this, so I just used the latter
version) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/3R2owpPGhb9DVxdhV1I8.j/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4VLBQACgkQAVBC80lX
0GyUqAf9FNfH1ULiBD17CzD+OZNTl4C+JPgs1amIfl6E493anPXkH/CQeDJs5Hgy
Idsqv/KaqEXLbkcMLCdpqq4iO+ySstjUQWojpnWClE8yGXxlnHZPJxmw+5wk8B79
yJzznQoQTLw4Qv8Fa/IceM5ZB75Bzr+gitgCA3JsO1lN0V9bxd2lFS+JY+AxHYc4
XlKBVvssh2iVH++cVG6M6TbBkb1QDujK38+XdzVwxXhUWxmVExcC/dq3UMHxWjSo
oPvFgsYV0f3mnpP+iNvO4QjzIEYX0eoLCQg+cAc0ijAAUOm7977b7wmXgkf6GexR
1GUsZNYhZVmkFZbL051UGcvcKeWJyw==
=Nr1N
-----END PGP SIGNATURE-----

--Sig_/3R2owpPGhb9DVxdhV1I8.j/--
