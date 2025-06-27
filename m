Return-Path: <linux-next+bounces-7261-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CDBAEAD12
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 04:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A500417C7F0
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 02:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D99194137;
	Fri, 27 Jun 2025 02:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gowXgdXn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10D81362;
	Fri, 27 Jun 2025 02:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750993096; cv=none; b=PDRb75nzje/mTKHAFjLpD8jbTaXvv0otOQrXZCiQRvjeE6XS5ZHvGIF5Fda0G2YBIMsHAaJP9Gtn0T8I/zivOOEQNIwwCXzpXk7XKnFYZgAqin/q4+uKdbQitL/rWcAhJHeMv30a4hEmZI5zcA5ruzZCXlzh1RJnpSqOYjrZVR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750993096; c=relaxed/simple;
	bh=Do34ts/POB3SPVNCWTjYk641I1WSgzqH0QCzIHTOszY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sfPoC1r/9pLGqppbxETkEWr0qmNcFAu3nQU5Lb2VzfEXpa9crsuo8rmoNp2uAX2UV7TvGeTImslppnvjn/r0x0qbMi2FjAxfrg6nSkjFjYWtU/YC0HjiENPGo3idjkzrqP6bKFNXIVdm25yx+FgvYJzEAI0dFgZWfz97K8AhZ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gowXgdXn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750993083;
	bh=A8X8e5bE1iuLOEfVaOHH29HSozNnnErvuoEviaz3Fiw=;
	h=Date:From:To:Cc:Subject:From;
	b=gowXgdXnmnBlfrBlRRw8JF7Rbfgs9ccWs3B5i3NFxHIjK1fJNZExXkz5oMWkXV8l9
	 DjB7KahJusieRnlYiTWRk9XBc4tBtWOwmeSTe977ehzuwLoXgnv7BIUPC10yG3qelX
	 9pDKHETpt20TvxfcrmqcEEwDpL5yRtBG5jRuu4Ga8ukVw6jHNZbQ1aMn8WxbCk+gfv
	 6CEy0BIlRPeKq6Iv8QW9Hg4uiVyBpLYaUTIm1QtDoyIIr8va4Pp9Y9xdMh8DM7eMCD
	 DZe4jSxsSb9K8qVeexDV/YEctU6Mb0UP56kMgzVUcYmy7LFYn7/FiRUrR5lPFrE41K
	 nUxVQ61HdAEaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bT0bt4Dn1z4wyh;
	Fri, 27 Jun 2025 12:58:02 +1000 (AEST)
Date: Fri, 27 Jun 2025 12:58:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Maarten Lankhorst <dev@lankhorst.se>, Michal
 Wajdeczko <michal.wajdeczko@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <20250627125801.53203be5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ofP6NELqW_yRXUluNun=XkR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ofP6NELqW_yRXUluNun=XkR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_ggtt.c

between commit:

  af2b588abe00 ("drm/xe: Process deferred GGTT node removals on device unwi=
nd")

from the drm-fixes tree and commit:

  b2d6fd7ac598 ("drm/xe: Do not rely on GGTT internals in xe_guc_buf kunit =
tests")

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

diff --cc drivers/gpu/drm/xe/xe_ggtt.c
index 2c799958c1e4,7b11fa1356f0..000000000000
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@@ -201,13 -222,22 +222,29 @@@ static const struct xe_ggtt_pt_ops xelp
  	.ggtt_set_pte =3D xe_ggtt_set_pte_and_flush,
  };
 =20
 +static void dev_fini_ggtt(void *arg)
 +{
 +	struct xe_ggtt *ggtt =3D arg;
 +
 +	drain_workqueue(ggtt->wq);
 +}
 +
+ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
+ {
+ 	drm_mm_init(&ggtt->mm, reserved,
+ 		    ggtt->size - reserved);
+ 	mutex_init(&ggtt->lock);
+ 	primelockdep(ggtt);
+ }
+=20
+ int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
+ {
+ 	ggtt->size =3D size;
+ 	__xe_ggtt_init_early(ggtt, reserved);
+ 	return 0;
+ }
+ EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
+=20
  /**
   * xe_ggtt_init_early - Early GGTT initialization
   * @ggtt: the &xe_ggtt to be initialized
@@@ -264,12 -290,8 +297,12 @@@ int xe_ggtt_init_early(struct xe_ggtt *
  	if (err)
  		return err;
 =20
 +	err =3D devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
 +	if (err)
 +		return err;
 +
  	if (IS_SRIOV_VF(xe)) {
- 		err =3D xe_gt_sriov_vf_prepare_ggtt(xe_tile_get_gt(ggtt->tile, 0));
+ 		err =3D xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
  		if (err)
  			return err;
  	}

--Sig_/ofP6NELqW_yRXUluNun=XkR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmheCLkACgkQAVBC80lX
0GxRSgf9GQKT6emBuigjyr500/ciuU+U7OChBkvALDEiC4U4z3e2SOrXbIEMegr9
eo1NGsYBzqEoEE72v/Wj74TPPbb27wUeg5adxJi/GlWkauLd83AYoJBAVjCZFSJm
6/9DZ53ncr6rJD/f6/Am0UmiPJDN+sw1d5lVHnMdkDtuQGQ9WFXUHsJkSbYTU66n
isdQDbr58nEK8tzoHCdDlqAYMFtL+8G7oqP0VD1vUE2agsUV/HRiaK057LJHqQ3+
SJz67MRM/SHPxYhjuCQMomY8epAqckD3QsTDv60Y3EETAIWz7G5dDNTvvlR8mux/
BblKGz/EvJRGOUgt2Cct5DT/A2D8Nw==
=H6SJ
-----END PGP SIGNATURE-----

--Sig_/ofP6NELqW_yRXUluNun=XkR--

