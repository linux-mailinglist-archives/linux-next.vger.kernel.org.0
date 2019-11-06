Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25A00F0C3D
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 03:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730874AbfKFCxq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 21:53:46 -0500
Received: from ozlabs.org ([203.11.71.1]:49815 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730870AbfKFCxq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Nov 2019 21:53:46 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 477B1c4YhQz9sP6;
        Wed,  6 Nov 2019 13:53:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573008824;
        bh=kXnr4JybHuzbklbCxQwtQCFx0u0ttwyvhroyoGXLmiI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DBRT6IKu9kyQ1mGGPvb8oK/STCflETI+H6Ksx7KHNPhZQ6hhY2nTBudO+k5Hcj5k8
         cFry9rC29D5pkRhpU9QvhTaX3+fOwyHuFVI3YchxHPt9Qh18r287jH4sRZCXJmRhA1
         xXgKVx6QjqI7ejSDxDQmgjt3Z1wugyAHr/xzv7tSeXtL0Xo7+mGLfd3Mo21C15XYDj
         7hw5x1/8uu59JujYai+8xoLXFg07aix+nZOpD+g5aQBtcgmu2m6jyFIEOmrEDSdH/t
         TT0LaIk4gSpR9bJcwJiHKdbDX28NXEUk8HPbO+is6L2/Pg1SKJ3CcW5V3T2O7r3hOz
         5nW7K3waDwMgA==
Date:   Wed, 6 Nov 2019 13:53:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>, Qian Cai <cai@lca.pw>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20191106135340.3fa45898@canb.auug.org.au>
In-Reply-To: <20191010131448.482da2b2@canb.auug.org.au>
References: <20191010131448.482da2b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VW6llrPudTqo2dW_VBOacYv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VW6llrPudTqo2dW_VBOacYv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 10 Oct 2019 13:14:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> I added the following merge fix patch for today:
>=20

This patch is now just:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 10 Oct 2019 13:08:43 +1100
Subject: [PATCH] drm/i915: update for mutex_release API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/i915_active.c    | 2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915=
_active.c
index aa37c07004b9..a47387174434 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -385,7 +385,7 @@ void i915_active_set_exclusive(struct i915_active *ref,=
 struct dma_fence *f)
 	mutex_acquire(&ref->mutex.dep_map, 0, 0, _THIS_IP_);
 	if (!__i915_active_fence_set(&ref->excl, f))
 		atomic_inc(&ref->count);
-	mutex_release(&ref->mutex.dep_map, 0, _THIS_IP_);
+	mutex_release(&ref->mutex.dep_map, _THIS_IP_);
 }
=20
 bool i915_active_acquire_if_busy(struct i915_active *ref)
--=20
2.23.0

--=20
Cheers,
Stephen Rothwell

--Sig_/VW6llrPudTqo2dW_VBOacYv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3CNbQACgkQAVBC80lX
0GxdjQf/S0M3ryc3d9GRdi7jkkq0TiF/zlwiiwtKRaVqw6Gi+j0f7blRZRKizSZr
E9PfyIhmbl+PKyCs+LvhDxG7cDDh6zdqIzVKtjBMvlldty7Z73EKvwmX8LEjpGf9
VkXcxqCGnhQxpAQaJpxzYq6x+Vx26Ubr6LJ5B4ilChMbfTTz2qkIQJ8ARw+LR7+p
RfZYnGxGDMsPSeLy15AJhzUXwFDL/zaotzkWvAXCF/JMr0l9rTKeZNRUXPvxeF9J
hgU3az9xjnfkXqsV7+IKUdm0R8zUnHhyGm4AcBGWqHz2xOnYUkNxQQudMTc8aXQv
HVzUxnHBsNZ2B7LpfFWCAzXUgPo+Bg==
=nrAt
-----END PGP SIGNATURE-----

--Sig_/VW6llrPudTqo2dW_VBOacYv--
