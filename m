Return-Path: <linux-next+bounces-6870-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E304ABEAC0
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 06:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AEE34A6EF3
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 04:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6918123370F;
	Wed, 21 May 2025 04:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KOynMY+1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7739C232365;
	Wed, 21 May 2025 04:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800645; cv=none; b=CXxT232cugRSpmMpuvp1MDVQLfpurqR/w3+n7OnFC8PpNSTjL/iLsT9wx8Zy7n/ArdUgUTjnaMShRLzK+C6EqKv4SoHFR3c4M+0dLGONoWKRFnRIRdwQsAxp8DBaOXfnrWSG9d173gj2PqssM7j8X9CcBrrTpox+/ldxtzC9+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800645; c=relaxed/simple;
	bh=1CNx8b+2wMGmH3F3XpJpXYptl7N4PLNmhv6GElmdEmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cdJl04qhaFg7A8PzhunjrufTf10Dp+p5exY8fAOkDjIq4jlz+g5ZazfDuT0RRoqKEpnDrrPj9dDRMtCOosJR0WjbvNmF3clQduzMckNumDQyxyx2bP/Ra5Ec4/y5k/dczF+Hul7vHZEtB+U2mhVA0rN5Un0E0Djp0BkFmbTxiCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KOynMY+1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747800638;
	bh=B/CK2s1nq8WYq4cdcoFZ9+BOemGBGQlObXiO7rnkFGY=;
	h=Date:From:To:Cc:Subject:From;
	b=KOynMY+1RS5oi3p8J7UV/6yC0ge1XdFiwOpXIqRNcy8ESFmf4joS9QuKPLityilGj
	 VBQHblyCnV9VxO32r4Esun5MyE262vgrw0NSzegjJKcPsdYuXnQ2FgDWBFOakA3SNm
	 UK4Uqc99HsA4ksSHOFB4AnutKcujAGq+JnRiuJ6AuyqK2mc/50GlTw2gf0W2g21mRR
	 vpQ/x/C65F5i36boa2/ssC2+aZkwK7bHtcQdvVKIEcSVY3LXZQcdKWVfdD4Mv+Nclp
	 YM7O25mv/NuF3l1ZreowscnUq1gTnVne87S+5Ny+JxG7glfLk4fVxgU4vAj3nZfbll
	 MwGkP7L0My5yQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2Hyj2MMDz4xTx;
	Wed, 21 May 2025 14:10:37 +1000 (AEST)
Date: Wed, 21 May 2025 14:10:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20250521141036.4eeb38a6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zx8.6xAwQ71JOs25jJ0yFmv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zx8.6xAwQ71JOs25jJ0yFmv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_lrc.c

between commit:

  617d824c5323 ("drm/xe: Add WA BB to capture active context utilization")

from Linus' tree and commits:

  bac016066536 ("drm/xe: Make PPHWSP size explicit in xe_gt_lrc_size()")
  7f387e6012b6 ("drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE")

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

diff --cc drivers/gpu/drm/xe/xe_lrc.c
index 03bfba696b37,855c8acaf3f1..000000000000
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@@ -651,8 -654,6 +655,7 @@@ u32 xe_lrc_pphwsp_offset(struct xe_lrc=20
  #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
  #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
 +#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
- #define LRC_PPHWSP_SIZE SZ_4K
 =20
  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
  {

--Sig_/zx8.6xAwQ71JOs25jJ0yFmv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtUjwACgkQAVBC80lX
0Gw1BAf+JtPdOzwJVks/SWd9on2mw4Qjq0SA0AWDjREmD4QzgGOUmluUy5F5pXVD
PKxt/lYYkNE11j964l7eaZg+bA/uxtjDsyI5nyrvgW7ymtLd8Mem2yShcHVJc3/z
c9zJYTZfIxl0NTQkvFwhsKelfDat1y0UPshL3lp+1uQR3moZJvfJVxUv546is7tr
KKEXJA1Z/uU7vFYY2ADX1N9Y+JeRyJcMs6SUUxUfMowr04qyF3IDpYzRAZw4GngL
AT0lUkOK3+SQo3YGLLRRW3AsCYaiLNBsESNXPtaB0951ZxmztNgW4YnQYYW6D310
fNAUKIbzZtxEYgHCPOQ5e5C4KeQXXQ==
=qFZ3
-----END PGP SIGNATURE-----

--Sig_/zx8.6xAwQ71JOs25jJ0yFmv--

