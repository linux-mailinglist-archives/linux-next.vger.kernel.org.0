Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0472FF9B8
	for <lists+linux-next@lfdr.de>; Fri, 22 Jan 2021 02:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbhAVBAW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 20:00:22 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38423 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726226AbhAVBAL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Jan 2021 20:00:11 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DMLWH56wLz9s2g;
        Fri, 22 Jan 2021 11:59:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611277165;
        bh=5MOIKx6UAY7cemlTgtirL6yvU+TcKElOkiV4i4zzUd8=;
        h=Date:From:To:Cc:Subject:From;
        b=TypTUPS08a2PlfNI7bWmc1L4OatjR4NLEnxlaiUIBkP3Mx9SMbbMUUaTQWsoN5Kqk
         KlQwskmmxmvvxsIpOT6d34UEq0Z/O4i2y6wlSAlKf7sz7yJjkYNfJ1l5wKSRVEN2jj
         MYrLvzqsplvnPizQJev5wJgzoTIGWhYjHUUMECnV+YzZjWLkN9xYj2dKqcDMRHjz8e
         b4sKnBZlPdWMS6rY942PCNG3KB5QnDVUhWHWX6yuovQUHsRIFq813HJ6Yt1bS6nBdN
         0eY2dSkE+HYjcy/zQgL6J4elWY+cPZvOQrh72Olc8kBpnH5YQ9YgdTFoWyvQjhcQx5
         LzTcIgz2E4coQ==
Date:   Fri, 22 Jan 2021 11:59:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20210122115918.63b56fa1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GdWx3aZncyw8SWUmKZ=fJhu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GdWx3aZncyw8SWUmKZ=fJhu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

WARNING: unmet direct dependencies detected for DRM_I915_WERROR
  Depends on [n]: HAS_IOMEM [=3Dy] && DRM_I915 [=3Dm] && EXPERT [=3Dy] && !=
COMPILE_TEST [=3Dy]
  Selected by [m]:
  - DRM_I915_DEBUG [=3Dy] && HAS_IOMEM [=3Dy] && EXPERT [=3Dy] && DRM_I915 =
[=3Dm]

WARNING: unmet direct dependencies detected for DRM_I915_WERROR
  Depends on [n]: HAS_IOMEM [=3Dy] && DRM_I915 [=3Dm] && EXPERT [=3Dy] && !=
COMPILE_TEST [=3Dy]
  Selected by [m]:
  - DRM_I915_DEBUG [=3Dy] && HAS_IOMEM [=3Dy] && EXPERT [=3Dy] && DRM_I915 =
[=3Dm]

WARNING: unmet direct dependencies detected for DRM_I915_WERROR
  Depends on [n]: HAS_IOMEM [=3Dy] && DRM_I915 [=3Dm] && EXPERT [=3Dy] && !=
COMPILE_TEST [=3Dy]
  Selected by [m]:
  - DRM_I915_DEBUG [=3Dy] && HAS_IOMEM [=3Dy] && EXPERT [=3Dy] && DRM_I915 =
[=3Dm]

Maybe introduced by commit

  4f86975f539d ("drm/i915: Add DEBUG_GEM to the recommended CI config")

--=20
Cheers,
Stephen Rothwell

--Sig_/GdWx3aZncyw8SWUmKZ=fJhu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAKI2YACgkQAVBC80lX
0GzTqAf9GEMrVgQiHntaHpFKvx3v4XfjPvmjNemLl3YjrVlmcynz/eF5F0L6sZ9f
JyCEOYi5wt4PAWXthiazKz0dRxXeOdtRIJ/CMF17NWY7DRntx4hAyFkADPU6qmjm
Xv/nSfrzNVGAdrJ08Ri6OExtKH4XafvzYP7VNXJ93ea0CkQCoKpd59OEDtIEyYMM
D8M7p/VU1Z2VnJVtgty8JfTrmp3HZI/qXH2uV8ZuN1EZ4rcE8Zdwab+I9rngJifs
36hxiW4RjM/4sBbF3ichvXYc1dtukaK1mS8R0+jUSIPmbdQ5SKZsxJ7mZOK/jTw+
o/8HAzJHeis8xgPyTWyuKgzizJ/giw==
=Ae35
-----END PGP SIGNATURE-----

--Sig_/GdWx3aZncyw8SWUmKZ=fJhu--
