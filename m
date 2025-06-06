Return-Path: <linux-next+bounces-7086-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0345ACFB20
	for <lists+linux-next@lfdr.de>; Fri,  6 Jun 2025 04:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F30631897C3E
	for <lists+linux-next@lfdr.de>; Fri,  6 Jun 2025 02:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8241D5CD4;
	Fri,  6 Jun 2025 02:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Q57xqbm9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39D729A2;
	Fri,  6 Jun 2025 02:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175749; cv=none; b=tXbbVab2Ptn/1lq0m3/Pt7KHuxOgJeZBsG+6kiNNXou4wrCxsF8ulWIivMXgp2AXl4ZdMuuNivnL8fNKManv5g4rBAwZsfbc+aKvuXL4zJWK/JL2A2pG9MRUJgBNw6AZx8aExA4B2H20bIRlL5530KE4msKfctXLiWhAbpEmloY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175749; c=relaxed/simple;
	bh=V81H3xi9hEpvTucrDEOQra2A0kLZ/me/oH8QExuvP5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Fh1N0xKXgv4rK8DE+KxgYOih1q4J8ka0KdEYxEgy3OVzlvXaqlmVAzZlMOMNC1ornDFTGRGahuxscrywHzrrQ9ZURn3p8MMRAB0Fpg8x9mMZFBy/q3XxnGK3GZ3w9pqkgNZrK49b3WpZncSG7h0Tiahg6vMxlYlh/wkpjJxyJwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Q57xqbm9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749175734;
	bh=0LvDLW8pjIlwfV9Vh1GdQE5WkfXK6wyTvC9z9te5Uls=;
	h=Date:From:To:Cc:Subject:From;
	b=Q57xqbm93O7cx14vhNion14cU6swt+0+QSqdi3iiNTZpQI+Jd++1P52Zua9mKdzmH
	 XQl3XewF9sM72L9HwjTQ/SpktYs/WpDzd/9SUjxx1hySG/zMVZXtQkZKKCI2yt1gLa
	 a4fKVOCTEoaiV4C9KS6rEySStukgGcOwxY+NT7WgAutXFSaiNe9FcoKMzB93IkPn+l
	 DgsxQr+YMq7Q1cBs42kCiTFUDs7IFYBe6slYYEaPsQBkd8qcPeg3bMEPwb3prvN03K
	 0TwB1W8+5V5B5+OAS9w+8CbLC6JrUbyMjcIS8sSGHeODM9eFzhRTRYaWhFGXd8vb9G
	 T0X56VZ9SLcfA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bD4Vs3LPCz4wbr;
	Fri,  6 Jun 2025 12:08:53 +1000 (AEST)
Date: Fri, 6 Jun 2025 12:08:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Umesh
 Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20250606120851.2736b781@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ne38GWR6BK2ZlcAeggg0ydw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ne38GWR6BK2ZlcAeggg0ydw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_lrc.c

between commit:

  617d824c5323 ("drm/xe: Add WA BB to capture active context utilization")

from Linus' tree and commit:

  2b0a0ce0c20b ("drm/xe: Create LRC BO without VM")

from the drm tree.

I fixed it up (maybe? - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/xe_lrc.c
index 61a2e87990a9,e1db6f2a1ad0..000000000000
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@@ -909,69 -876,7 +909,66 @@@ static void xe_lrc_set_ppgtt(struct xe_
  static void xe_lrc_finish(struct xe_lrc *lrc)
  {
  	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
- 	xe_bo_lock(lrc->bo, false);
- 	xe_bo_unpin(lrc->bo);
- 	xe_bo_unlock(lrc->bo);
- 	xe_bo_put(lrc->bo);
+ 	xe_bo_unpin_map_no_vm(lrc->bo);
 +	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
 +}
 +
 +/*
 + * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating acti=
ve
 + * context run ticks.
 + * @lrc: Pointer to the lrc.
 + *
 + * Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks=
 of the
 + * context, but only gets updated when the context switches out. In order=
 to
 + * check how long a context has been active before it switches out, two t=
hings
 + * are required:
 + *
 + * (1) Determine if the context is running:
 + * To do so, we program the WA BB to set an initial value for CTX_TIMESTA=
MP in
 + * the LRC. The value chosen is 1 since 0 is the initial value when the L=
RC is
 + * initialized. During a query, we just check for this value to determine=
 if the
 + * context is active. If the context switched out, it would overwrite this
 + * location with the actual CTX_TIMESTAMP MMIO value. Note that WA BB run=
s as
 + * the last part of context restore, so reusing this LRC location will not
 + * clobber anything.
 + *
 + * (2) Calculate the time that the context has been active for:
 + * The CTX_TIMESTAMP ticks only when the context is active. If a context =
is
 + * active, we just use the CTX_TIMESTAMP MMIO as the new value of utiliza=
tion.
 + * While doing so, we need to read the CTX_TIMESTAMP MMIO for the specific
 + * engine instance. Since we do not know which instance the context is ru=
nning
 + * on until it is scheduled, we also read the ENGINE_ID MMIO in the WA BB=
 and
 + * store it in the PPHSWP.
 + */
 +#define CONTEXT_ACTIVE 1ULL
 +static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
 +{
 +	u32 *cmd;
 +
 +	cmd =3D lrc->bb_per_ctx_bo->vmap.vaddr;
 +
 +	*cmd++ =3D MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSE=
T;
 +	*cmd++ =3D ENGINE_ID(0).addr;
 +	*cmd++ =3D __xe_lrc_engine_id_ggtt_addr(lrc);
 +	*cmd++ =3D 0;
 +
 +	*cmd++ =3D MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
 +	*cmd++ =3D __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
 +	*cmd++ =3D 0;
 +	*cmd++ =3D lower_32_bits(CONTEXT_ACTIVE);
 +
 +	if (lrc_to_xe(lrc)->info.has_64bit_timestamp) {
 +		*cmd++ =3D MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
 +		*cmd++ =3D __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
 +		*cmd++ =3D 0;
 +		*cmd++ =3D upper_32_bits(CONTEXT_ACTIVE);
 +	}
 +
 +	*cmd++ =3D MI_BATCH_BUFFER_END;
 +
 +	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
 +			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
 +
  }
 =20
  #define PVC_CTX_ASID		(0x2e + 1)

--Sig_/ne38GWR6BK2ZlcAeggg0ydw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhCTbMACgkQAVBC80lX
0GzlDgf/Re/eiNIta9nH1Jrpf0C9QYwL/5QEf5jOpYHaZ28x+aplm2YYDODS+Pfy
JY44fX/5oW/E4wQgmVdJm27cIRgC9iP+L3UcZxG30jRYqIgBq9FGjaL8VG8U+q1b
ipmVdATPf9bJW4qsIg8DODmzQmCp0EVLIpO/iUe8t8NDeLKlm1MbeWCtZBBR8m+8
rXbZwPunIKYZLb705ugFfOMAIRO44vy3YHqG6TkG+64aoeirSpJIBZbhOgg6ehVA
idGjir4kZxSsVNwi+GaCGAqvHjcGhYRJ9q/BL+Iru6gpqROuJAH52sx/Fwfz8WWC
ihW/Lhv/LhMiiqp+EMulf9beQlWivw==
=f4l9
-----END PGP SIGNATURE-----

--Sig_/ne38GWR6BK2ZlcAeggg0ydw--

