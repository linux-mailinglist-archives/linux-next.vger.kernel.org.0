Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779E420AA43
	for <lists+linux-next@lfdr.de>; Fri, 26 Jun 2020 03:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbgFZBrQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Jun 2020 21:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbgFZBrQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2020 21:47:16 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E88DC08C5C1;
        Thu, 25 Jun 2020 18:47:16 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49tKWN6DKbz9sQx;
        Fri, 26 Jun 2020 11:47:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593136033;
        bh=49j0qfVVPLvmSauDNneK5qCi+Gro2gGbknl+YWH2PJQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FB82bP69lWQZ/X1gKv11KSN7ltmrb/Plgf8lxNt0mRnTjDR0pXfGoy6MNYhaquhDX
         9iCOYW9nrbkIirij80YoxA/gfYM3G7Rvaafru3dNaZOj0+S88537gLO554eCrSErXk
         wmznLm1yYhLHLhywrNla4VR0mvV4FMu2YS24SNHynScFzKyoIWFe1pLNmKZH7CEemD
         oWnNAwPNZpFyCPw8TjkvJfbsXPKZDcMlglsqOvNx8V1xBPI5UxfU9b8I/50q1syf6T
         IvZgBPqq2bdCt1CVGPwXxzEpI0rgZTct1Xg6zVlK1CV5uKh6SZ9/2TGi4cbKjjgO0x
         URdU6uOdYdhqQ==
Date:   Fri, 26 Jun 2020 11:47:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mukul Joshi <mukul.joshi@amd.com>,
        Christoph Hellwig <hch@lst.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20200626114712.056d37c3@canb.auug.org.au>
In-Reply-To: <20200612102552.2d573ebb@canb.auug.org.au>
References: <20200612102552.2d573ebb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hoVlH3Mp3a=yT3qHlz6fofq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hoVlH3Mp3a=yT3qHlz6fofq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 12 Jun 2020 10:25:52 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c: In function 'kfd_sdma=
_activity_worker':
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:118:2: error: implicit=
 declaration of function 'use_mm' [-Werror=3Dimplicit-function-declaration]
>   118 |  use_mm(mm);
>       |  ^~~~~~
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:145:2: error: implicit=
 declaration of function 'unuse_mm' [-Werror=3Dimplicit-function-declaratio=
n]
>   145 |  unuse_mm(mm);
>       |  ^~~~~~~~
>=20
> Caused by commit
>=20
>   32cb59f31362 ("drm/amdkfd: Track SDMA utilization per process")
>=20
> interacting with commit
>=20
>   f5678e7f2ac3 ("kernel: better document the use_mm/unuse_mm API contract=
")
>=20
> from Linus' tree.
>=20
> I have applied the following merge fix for today (that was previously
> part of the akpm tree).

The merge fix patch now looks like:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 28 May 2020 20:15:34 +1000
Subject: [PATCH] drm/amdkfd: fix up for {un}use_mm() rename

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd=
/amdkfd/kfd_process.c
index 013c2b018edc..40695d52e9a8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -184,7 +184,7 @@ static void kfd_sdma_activity_worker(struct work_struct=
 *work)
 	if (!mm)
 		goto cleanup;
=20
-	use_mm(mm);
+	kthread_use_mm(mm);
=20
 	list_for_each_entry(sdma_q, &sdma_q_list.list, list) {
 		val =3D 0;
@@ -198,7 +198,7 @@ static void kfd_sdma_activity_worker(struct work_struct=
 *work)
 		}
 	}
=20
-	unuse_mm(mm);
+	kthread_unuse_mm(mm);
 	mmput(mm);
=20
 	/*

--=20
Cheers,
Stephen Rothwell

--Sig_/hoVlH3Mp3a=yT3qHlz6fofq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl71U6AACgkQAVBC80lX
0GxQTgf/YLE8LcSV4WWP4zDSsIN8rMTGAUFzCZiCMuCWE1j9fTyTnjieREITBjiO
YAv5d6SckgVNnZfjVGlX5GgoAz6L9CunyUOm/coQm/gWct3PeORSKI/FtntOP3i1
0C1ofJ2KHyx7DvE/2XFfH1wek+/pF6hrsxq1Duz2CV5neNeda0vQCRbu943NIhYL
Efbwuj6YNNWHv0FSbUMEUBazqkKz0ZXCqDhn+lbZ7+54jnIbfVFDae+BqVdrEYsf
dl/miWcLQJAycB5VARib5Q9VW+ft/h5DZxwhE6Ps6RdYwzxziHXYoN4QqVHPYADu
Tj47V8Siu2Onf2xrFL3wwQRxh5k2Dg==
=5Akq
-----END PGP SIGNATURE-----

--Sig_/hoVlH3Mp3a=yT3qHlz6fofq--
