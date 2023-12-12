Return-Path: <linux-next+bounces-346-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FCE80E269
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 04:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 645F31C20FED
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 03:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70ECA63A5;
	Tue, 12 Dec 2023 03:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZTNRVue1"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26ECF9C;
	Mon, 11 Dec 2023 19:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702350098;
	bh=m86dpOAQjGsXOqUOF2XV2eQduIA9Rj06UpCPyxJanKs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZTNRVue1JqufBNS4qBi7Pi21dinUU0cY13S3OajzQve10wY9A2mKFLlQo0+WODgPE
	 5fnpCSAOLeV1FUAKLbczWpfrOOwdwT5cJ2Ct1hyfFzs475aKzDODHHpGKdeFIcuakS
	 t9YDf8NRJ8kzlIOnqHSIN/4qgR6bpMu2q78M7hjSQVRYqTaJ041fnYybVOeTyPDhjL
	 R/Vxe0INiTJNWd1ILhnn7qgbqhu+DuNuBa8fRRdR+WCIfvCPenxh6/NOzEhu4KrFEC
	 gSzg3utINzvbeCvupKMW3Z/VM9IHgZ5rIPgUKnSg+DXWdN4kKnP22OaP0YOIEjhsqJ
	 5h/UYT4dusB9w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sq3Kt0BFXz4wb2;
	Tue, 12 Dec 2023 14:01:37 +1100 (AEDT)
Date: Tue, 12 Dec 2023 14:01:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20231212140134.13ffafa8@canb.auug.org.au>
In-Reply-To: <20231212110415.6f849fb4@canb.auug.org.au>
References: <20231212110415.6f849fb4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gu_LY_vSkXSh5An5Ar8/IKl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gu_LY_vSkXSh5An5Ar8/IKl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 12 Dec 2023 11:04:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> drivers/gpu/drm/drm_atomic_uapi.c:366:1: warning: 'drm_atomic_replace_pro=
perty_blob_from_id' defined but not used [-Wunused-function]
>   366 | drm_atomic_replace_property_blob_from_id(struct drm_device *dev,
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Introduced by commit
>=20
>   1d2b049e4582 ("drm/drm_property: make replace_property_blob_from_id a D=
RM helper")

This became a build failure in the i386 defconfig build, so I applied
the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 12 Dec 2023 13:53:55 +1100
Subject: [PATCH] drm: remove unused function drm_atomic_replace_property_bl=
ob_from_id()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 42 -------------------------------
 1 file changed, 42 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index 70ddbb93e466..29d4940188d4 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -362,48 +362,6 @@ static s32 __user *get_out_fence_for_connector(struct =
drm_atomic_state *state,
 	return fence_ptr;
 }
=20
-static int
-drm_atomic_replace_property_blob_from_id(struct drm_device *dev,
-					 struct drm_property_blob **blob,
-					 uint64_t blob_id,
-					 ssize_t expected_size,
-					 ssize_t expected_elem_size,
-					 bool *replaced)
-{
-	struct drm_property_blob *new_blob =3D NULL;
-
-	if (blob_id !=3D 0) {
-		new_blob =3D drm_property_lookup_blob(dev, blob_id);
-		if (new_blob =3D=3D NULL) {
-			drm_dbg_atomic(dev,
-				       "cannot find blob ID %llu\n", blob_id);
-			return -EINVAL;
-		}
-
-		if (expected_size > 0 &&
-		    new_blob->length !=3D expected_size) {
-			drm_dbg_atomic(dev,
-				       "[BLOB:%d] length %zu different from expected %zu\n",
-				       new_blob->base.id, new_blob->length, expected_size);
-			drm_property_blob_put(new_blob);
-			return -EINVAL;
-		}
-		if (expected_elem_size > 0 &&
-		    new_blob->length % expected_elem_size !=3D 0) {
-			drm_dbg_atomic(dev,
-				       "[BLOB:%d] length %zu not divisible by element size %zu\n",
-				       new_blob->base.id, new_blob->length, expected_elem_size);
-			drm_property_blob_put(new_blob);
-			return -EINVAL;
-		}
-	}
-
-	*replaced |=3D drm_property_replace_blob(blob, new_blob);
-	drm_property_blob_put(new_blob);
-
-	return 0;
-}
-
 static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		struct drm_crtc_state *state, struct drm_property *property,
 		uint64_t val)
--=20
2.40.1

--=20
Cheers,
Stephen Rothwell

--Sig_/gu_LY_vSkXSh5An5Ar8/IKl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV3zQ4ACgkQAVBC80lX
0GyDyQf/f/yMfxfOTBIoZNh2eftasEz9FRuSkwWYs8Z2mW0n+grtNvtXrYhro/d4
1S2b9eEoe51uL+RgYPT23JPjcKdlg0xx3D6VUDxG81JOz4AB+hzitV/dIaEbhM6r
cqLlL6O90z2dM7ousgXUkWl2kIDghLMExGP9PzQ/5JaD93S6zJcATP9/ZAEd74T2
HWossy/nhDTGM0yH5sZkhr2VOAkGdrizJeJxnSwriYTvOUlwcmC7dU1KqX5XTRtd
S9ffgTpW6O9DjPblAcOEMvgJkd+GK49HKTx2Bb5Gm7Zo57JiE3hMdWsVz38yyGtB
HFftrG6eyceZLeQNpNmREqE1Ts0z5Q==
=rGPM
-----END PGP SIGNATURE-----

--Sig_/gu_LY_vSkXSh5An5Ar8/IKl--

