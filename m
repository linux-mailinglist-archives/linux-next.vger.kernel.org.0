Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228FF348495
	for <lists+linux-next@lfdr.de>; Wed, 24 Mar 2021 23:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbhCXWZY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Mar 2021 18:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbhCXWZG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Mar 2021 18:25:06 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90175C06174A;
        Wed, 24 Mar 2021 15:25:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F5N8T3WjPz9sWS;
        Thu, 25 Mar 2021 09:24:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616624700;
        bh=Lt1046lPm+M0t+PnUEF/7zYkeQkAleAyRe/nHCtvliQ=;
        h=Date:From:To:Cc:Subject:From;
        b=n97owxz9QYJoqMkBquoOBIbQ3m85Fn5VJrXFdU8xakKvYG7bPyTsEmTK6KrHVv+1A
         wzgBTsDbTG5zvav6L1oxzvYrf5DFfbA+Og3AiddKpHAZI1TYjxrmb+/lWM6+2+oGSc
         7AwGwYX0i6UmPW33OXpYA/zqQQRqMdgLKsXca865Emjt/WzHNimyDq+n5ssgaegFcj
         JHpbZLlSa/bE3Tu7AbEp1z3BBhRhGfE9NMlLyGCL6d7VYNq7TxBY/Xnrk45pWTDNt7
         P4jJLnjKj2YPx/gGvntMX+tO4j7nHvqU8+BeG7ygFjC8OjTOgO4XZ7L087v5TOQdno
         bIokMdizzJIQg==
Date:   Thu, 25 Mar 2021 09:24:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Imre Deak <imre.deak@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-intel-fixes tree
Message-ID: <20210325092455.7a629047@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nicSjGR_B/XICY4AoVrQOrA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nicSjGR_B/XICY4AoVrQOrA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel-fixes tree, today's linux-next build
(htmldocs) produced this warning:

Documentation/gpu/i915:22: /home/sfr/next/next/drivers/gpu/drm/i915/intel_r=
untime_pm.c:423: WARNING: Inline strong start-string without end-string.

Introduced by commit

  8840e3bd981f ("drm/i915: Fix the GT fence revocation runtime PM logic")

--=20
Cheers,
Stephen Rothwell

--Sig_/nicSjGR_B/XICY4AoVrQOrA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBbvDcACgkQAVBC80lX
0Gwu7gf6AipS7+ub2HMWch7KBKGHskD98Lxo/DuFL9WVwNXFWpXDOdVJ6pT9wsHs
DlBBT1/4uSXzY2SDIQ+bxSlANTond+9Mc6ne6a+0JlrI3mMu9Q9R8nfKPNi327GJ
qTOq3NtPovhJZqzg4EhNjM+H0jF5L6NUbaeA2b5fW5j3BszhdouKOtyG6OPd74l8
bqLYAsLOMmyisDDanymY9lumMw7we4e2kZdmzLYmqPt0+Vhfa74UJre2OzAluVpm
+d7GniRz61rLuqUgKzZxIpxBZbmkdbt6LYYvFzxMOr4Ut+G4Ueo8ywvxJTcBX1IV
1yQNdIDrukr8nQYS4v6fpAr5Lbh2+g==
=dyCb
-----END PGP SIGNATURE-----

--Sig_/nicSjGR_B/XICY4AoVrQOrA--
