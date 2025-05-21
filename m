Return-Path: <linux-next+bounces-6871-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C625ABEAD8
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 06:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1809C1BA4E3C
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 04:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513EA22F762;
	Wed, 21 May 2025 04:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gaVWtqpY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18771231820;
	Wed, 21 May 2025 04:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800804; cv=none; b=tAeI+CBOy2vmf8hZmLRzmGu0PFL1tE5zhWvWywHqvKknAPDm4apwxhMTor/6FM/dUR+fvCpKQkRColzgkMNG37cqgCyUU2U6/opZd+Fc0LjloL2ylIYHaSehET6QyOnKV1SHMK/WJWSuvqKn5sITV1rsj31MJrLFIlw8ZdGjBDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800804; c=relaxed/simple;
	bh=DrVBlB/buQp0pzdc7l46W8jr860JTGUWouVNEVK4gEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a60d8kwp0S/UyihL/wb875pqP1L2Mztu27K+0gv0/Wo+fcwtdp+j3i9xqBo2ZGEkNR9/Iz1fR9AFC2YIGwpqA/ZNogYx02eq4e5qJS2n5NdlKZ+sbT7lpt4WKWAIHa/qDiGv++DgBmaQ57kpN6A2qUctwS/jS44P14G3RwCH7Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gaVWtqpY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747800799;
	bh=IuQzXp6oBU+GS2kSc9VjQ4GodVMmVBCGt7StEo3adBU=;
	h=Date:From:To:Cc:Subject:From;
	b=gaVWtqpYkCq7jaoP8OqYHZBGokPd6sgvLQS/IZtirlpTF0VBe7R2R/AODa27DI3P+
	 c16lCbpBddOzK0Jr/NHEtllhzlIQM4SFiCqcJkjF2LnKlxtOFNmNaI8dDib648uFOi
	 J9O/NFAq9eCQMSHv7qNzAkaZDp60pba7SDooOvB1QwcRdDJ3PauuO5GMYHGvJFxeZ2
	 rQlsfo9wAJYhczULE2WhOsTwLveSThVRoGzBlAYOWvXFLmRZQOZ0rkdNpKE2HH18yT
	 47awjW4Ec6PaUtFLRcnhdWt2H0dxTsYbtbtvZhaDFr7VYu/Gc/SOze39F7FAXgjEYO
	 kLwJvIlfCfaTA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2J1p6xBTz4x8f;
	Wed, 21 May 2025 14:13:18 +1000 (AEST)
Date: Wed, 21 May 2025 14:13:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Francois Dugast <francois.dugast@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20250521141318.59a76e45@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SP7c+4K614WChixKf9IiO7b";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SP7c+4K614WChixKf9IiO7b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_svm.c

between commit:

  794f5493f518 ("drm/xe: Strict migration policy for atomic SVM faults")

from Linus' tree and commit:

  80bcbdfc8cf5 ("drm/xe/svm: Add stats for SVM page faults")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/xe_svm.c
index 975094c1a582,d25f02c8d7fc..000000000000
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@@ -654,18 -650,12 +659,19 @@@ void xe_svm_fini(struct xe_vm *vm
  }
 =20
  static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 -				  struct xe_tile *tile)
 +				  struct xe_tile *tile,
 +				  bool devmem_only)
  {
 -	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
 +	/*
 +	 * Advisory only check whether the range currently has a valid mapping,
 +	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c
 +	 */
 +	return ((READ_ONCE(range->tile_present) &
 +		 ~READ_ONCE(range->tile_invalidated)) & BIT(tile->id)) &&
 +		(!devmem_only || xe_svm_range_in_vram(range));
  }
 =20
+ #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
  static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
  {
  	return &tile->mem.vram;
@@@ -727,37 -717,15 +733,45 @@@ unlock
 =20
  	return err;
  }
+ #else
+ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+ 			     struct xe_svm_range *range,
+ 			     const struct drm_gpusvm_ctx *ctx)
+ {
+ 	return -EOPNOTSUPP;
+ }
+ #endif
 =20
 +static bool supports_4K_migration(struct xe_device *xe)
 +{
 +	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 +		return false;
 +
 +	return true;
 +}
 +
 +static bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range,
 +					       struct xe_vma *vma)
 +{
 +	struct xe_vm *vm =3D range_to_vm(&range->base);
 +	u64 range_size =3D xe_svm_range_size(range);
 +
 +	if (!range->base.flags.migrate_devmem)
 +		return false;
 +
 +	if (xe_svm_range_in_vram(range)) {
 +		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
 +		return false;
 +	}
 +
 +	if (range_size <=3D SZ_64K && !supports_4K_migration(vm->xe)) {
 +		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n=
");
 +		return false;
 +	}
 +
 +	return true;
 +}
 +
  /**
   * xe_svm_handle_pagefault() - SVM handle page fault
   * @vm: The VM.
@@@ -790,7 -754,7 +804,8 @@@ int xe_svm_handle_pagefault(struct xe_v
  	struct drm_gpusvm_range *r;
  	struct drm_exec exec;
  	struct dma_fence *fence;
 +	int migrate_try_count =3D ctx.devmem_only ? 3 : 1;
+ 	struct xe_tile *tile =3D gt_to_tile(gt);
  	ktime_t end =3D 0;
  	int err;
 =20

--Sig_/SP7c+4K614WChixKf9IiO7b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtUt4ACgkQAVBC80lX
0Gyb5wf/VNW+ePzF80Nzg4o+F1jCHbso53TJqAGkv2if8EP4+83G9QpoCIF2yUhk
O3HKUDCfX3auMko2/nxzZ1iH7NoM1whZMxaTe3wRiIkTZnsQDozYKqOuPjZrMN7J
O9GSqFQTerzJaCL6ttG/64oTw8wkn0HawZVU9r5qNQUFCfbIv44AoMnaGgWmYgjj
CWMW39WtAy0jH/v7BqstdMY0pLG39jcLTJWvxzrGKqYVjrb/vzq/IeVEo9Kh0wTt
IF22WgIolB2QNxbAiDRXG0e39ln4AWNDnDDw8xyfI3+ZMb+7LPfTdqlLFXAGRR8G
ZEt9G3FsTtsTycm8NtIDFbFuEU44Rg==
=ubG4
-----END PGP SIGNATURE-----

--Sig_/SP7c+4K614WChixKf9IiO7b--

