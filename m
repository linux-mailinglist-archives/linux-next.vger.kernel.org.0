Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E91364F5458
	for <lists+linux-next@lfdr.de>; Wed,  6 Apr 2022 06:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234158AbiDFEsk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Apr 2022 00:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2361243AbiDFEZm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Apr 2022 00:25:42 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D64B2C;
        Tue,  5 Apr 2022 17:34:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4KY59V1grWz4xY1;
        Wed,  6 Apr 2022 10:34:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1649205247;
        bh=QqgDmsFvSYcgWUESimdJ8L2VbsOjXioSTdWO5yoK+sc=;
        h=Date:From:To:Cc:Subject:From;
        b=rLk73Ha/H0NukY3HR2rCuYtPehs1SnGxxMUO12TO+iC+BdxvU/NtX8VODTKI18Ire
         dHn7QTHafzv+jbWMpLJlUZW559uyF6T8bxANz9yOXmvZhQnnieKsvog0Yys9f37AV6
         ARfxov3RnOGAke0TatW4FcMNxZ1IxleoVEnMXdUtoH16ANL0VUGWOqQqFzYXUNdgQf
         Zd3BTmfgxZAySLkJQH5lguNtOANau84S6KSV0Q0/tLWu5CyQp+Dt2e/QA6b54ftK+n
         aRwNLOLNGQFl6iNBdRCX87QQBsorL/n5ayAPweM5ytoWpHA6Df0xQkmwnn4qKaM/jq
         uQYTsVdfTZPig==
Date:   Wed, 6 Apr 2022 10:34:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <20220406103405.299c06b9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HS+hEAkeP/V.TjBE.IFp.s9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HS+hEAkeP/V.TjBE.IFp.s9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

between commit:

  fee2ede15542 ("drm/ttm: rework bulk move handling v5")

from the drm-misc tree and commit:

  184a69ca4d41 ("drm/amdgpu: separate VM PT handling into amdgpu_vm_pt.c")

from the amdgpu tree.

I fixed it up (I used this file from the latter and added the following
patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 6 Apr 2022 10:28:53 +1000
Subject: [PATCH] fix up for "drm/ttm: rework bulk move handling v5"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vm_pt.c
index 958d7ed97882..a29933fa001f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -630,7 +630,14 @@ static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base=
 *entry)
=20
 	if (!entry->bo)
 		return;
+
 	shadow =3D amdgpu_bo_shadowed(entry->bo);
+	if (shadow) {
+		ttm_bo_set_bulk_move(&shadow->tbo, NULL);
+		amdgpu_bo_unref(&shadow);
+	}
+
+	ttm_bo_set_bulk_move(&entry->bo->tbo, NULL);
 	entry->bo->vm_bo =3D NULL;
 	list_del(&entry->vm_status);
 	amdgpu_bo_unref(&shadow);
@@ -653,8 +660,6 @@ static void amdgpu_vm_pt_free_dfs(struct amdgpu_device =
*adev,
 	struct amdgpu_vm_pt_cursor cursor;
 	struct amdgpu_vm_bo_base *entry;
=20
-	vm->bulk_moveable =3D false;
-
 	for_each_amdgpu_vm_pt_dfs_safe(adev, vm, start, cursor, entry)
 		amdgpu_vm_pt_free(entry);
=20
--=20
2.35.1

--=20
Cheers,
Stephen Rothwell

--Sig_/HS+hEAkeP/V.TjBE.IFp.s9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJM3/0ACgkQAVBC80lX
0Gxogwf/exk2DdA1yDjnxFuGFmWqyrQlc0z7MS+nraBxW/sGxr0WCISIaq3m71tn
cB46hEIgHt/Ob0BtV+gDLmTHihgasmCZ4xCdmo7MY9XmG7xcs8+VSwk7OPL1B4RN
Bx32107zw/Qa0wce1GPJQbnGOznqqG+AfYUvLkc9LBBaKNM4pfhpnqKLfcKvil2Z
HVSqiVinejMJNHI14fJhhFJDKAkbS8sLhDXBnTYaiEvyHMILz2fDQ/j19cxEwBre
ac1rWzhYvCsQz4dc3J+Z8pvXL/BV3mdQ2jKDVGerrh6hiX6oyUZ7TcRNi6QU1tyk
RWI2Sk04O8v1VBB0T2uEgLmrmCIKFA==
=7nog
-----END PGP SIGNATURE-----

--Sig_/HS+hEAkeP/V.TjBE.IFp.s9--
