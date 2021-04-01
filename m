Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4FED350FF9
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 09:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbhDAHTv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Apr 2021 03:19:51 -0400
Received: from ozlabs.org ([203.11.71.1]:33119 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233383AbhDAHTm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Apr 2021 03:19:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9vh86P9vz9sVt;
        Thu,  1 Apr 2021 18:19:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617261579;
        bh=2/EUPL3rwrP2ZNa91wW4p5emzJueDGRU/eFifvPQ69Q=;
        h=Date:From:To:Cc:Subject:From;
        b=ATWdnMpSXQmokcmm4NKtG93jQfUzaWDDRIeOV2HMcJrFA9XRbwrdHqgSBAHUvkPzK
         GrDautztnurIuO/YCbIaPN23qMUqNNGOKFSO/Sbm3gdBc5Th7Idrwkhq4d5UprlJMb
         cNeYE7JmxM7x1bcla1b6mnnWSHaTWmFzNt1JwVzkB1ZmI6aZPBCPhCRLK9MFG335jv
         nh+SF1tAhC++Lbe2vcmdaplhSIz+R9clvTXQZlXWnxeaEq5rXMKlX+EoXvJwd3tfNA
         wpqoEugjpfVKoNJoXBSPHYBKUciSo9mRVeMIlRZaApT6NQTiUzH4HyHM2jUp6zv5yh
         /KXm4zZGhCXhQ==
Date:   Thu, 1 Apr 2021 18:19:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20210401181933.08472e2d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cAk.5IP+iQqeCBvFKkw2UWy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cAk.5IP+iQqeCBvFKkw2UWy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:102: warning: Function paramet=
er or member 'ww' not described in 'i915_gem_shrink'

Introduced by commit

  cf41a8f1dc1e ("drm/i915: Finally remove obj->mm.lock.")

--=20
Cheers,
Stephen Rothwell

--Sig_/cAk.5IP+iQqeCBvFKkw2UWy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBldAUACgkQAVBC80lX
0GyelQf/fO9p5D16nYuhlyV7PcSrHJfWc6YGZSpwkcCzDsvcfXQMkgZhH37uYniD
G0qKlmnmGv6+gok0+wjJJNlf2rOK8vgiE0NHeOENMCU7JY3oHfuFkd6zCVG+IbyB
zD4ZgLwAp6NCTMpbTAIu6fNwCJYgpLBKE7H+dZhz/JSSn/qI6IPvV+CO/Wo0nTB9
nW0x7oxCaB9HRh7lYqUn2G3TuRMhTOR/beqAuhf2UDx54fu9cRBanckCA1afogQQ
BQAUkyGj178otbGS0lCZZNAwSPRdX+YnI5dyOppQFwaIeUb9acHY7Kxj0rwLdaW6
XT4FiFkjyD2HFRt0zreaYlEjQ9j7rA==
=gAer
-----END PGP SIGNATURE-----

--Sig_/cAk.5IP+iQqeCBvFKkw2UWy--
