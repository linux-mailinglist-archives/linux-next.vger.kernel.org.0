Return-Path: <linux-next+bounces-4871-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 748869E2CB5
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 21:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AA3F28B157
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 20:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4EF204F92;
	Tue,  3 Dec 2024 20:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4gNRBJd"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CC3202F86;
	Tue,  3 Dec 2024 20:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733256334; cv=none; b=lHlOOsyBdU9bRw3Qs+RTka39zwr3DKuo44oG/fVQGiLl75Aj/4KZJrLO+bQivT0Hw5kPeXdwZfzwutXXSyLKMSkgRS9YXZzVduItpiljphz6oI2ve/2a5Lp5KUHmrv1Gwbkva9q5vgN091XJK71qLrcox3cE7oDjAden/SahBxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733256334; c=relaxed/simple;
	bh=Yrbc/l+xD4S/+XGL1vpPMBgFYNpUEoULuxt7XeELIQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QASlJaQh3yq38wssdiFgmyaxSe6MLHe+wWoOn+G4SH/xIrgJr3TVLBOYjjrsrhzKdWE2fKpUNFef6xE7ufzS3GV/ud0DfmitO77w70Q4m9uns/hqY7yyiQjOqjTAdIRnbv2/3i6FHuv5Uc1xfq0F3+f0B8l2mSzE3qhGKqK/3gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4gNRBJd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21EDC4CECF;
	Tue,  3 Dec 2024 20:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733256334;
	bh=Yrbc/l+xD4S/+XGL1vpPMBgFYNpUEoULuxt7XeELIQ0=;
	h=Date:From:To:Cc:Subject:From;
	b=H4gNRBJdg9Ivv4L/m83TP2Jqkg7jqALzF5q273mkarIkOTVUawzu+C+lVc31b8byV
	 njlpQb3gpfA0sLERXtPAISP54eF8AeffcYWxVrUr3tgcXryax0qUV+T0Qx+zg07JzQ
	 G+DgJVDeUPiHKS5vmHFveLgeose8lyT7V0sU3fTguATjYabwjRwICOOjpkW7InbSzY
	 odXRvjm4h9BvqLQmAXC06thNpT/KeqPGuWiDwYYF9nlZwl/XkOjehy+8O91LyhUTMb
	 8rCsETFtGxG/XZP/l6LT+w8Qx59nx+c2TfQPzXUlvsZTLr7umoack8KzvPyaF1U5vv
	 gCZuwLSsQM7+Q==
Date: Tue, 3 Dec 2024 20:05:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Message-ID: <Z09kidsTlxhP51ff@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TJMdyoU9CQls9ZU9"
Content-Disposition: inline


--TJMdyoU9CQls9ZU9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_dsb.c

between commit:

  ebd1e5faa72af ("drm/i915/dsb: Don't use indexed register writes needlessl=
y")

=66rom the drm-intel-fixes tree and commit:

  ecba559a88ab8 ("drm/i915/dsb: Don't use indexed register writes needlessl=
y")

=66rom the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/i915/display/intel_dsb.c
index 4d3785f5cb525,e6f8fc743fb40..0000000000000
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@@ -304,55 -295,34 +295,43 @@@ void intel_dsb_reg_write_indexed(struc
  	 * we are writing odd no of dwords, Zeros will be added in the end for
  	 * padding.
  	 */
- 	if (!intel_dsb_prev_ins_is_mmio_write(dsb, reg) &&
- 	    !intel_dsb_prev_ins_is_indexed_write(dsb, reg)) {
- 		intel_dsb_emit(dsb, val,
- 			       (DSB_OPCODE_MMIO_WRITE << DSB_OPCODE_SHIFT) |
- 			       (DSB_BYTE_EN << DSB_BYTE_EN_SHIFT) |
+ 	if (!intel_dsb_prev_ins_is_indexed_write(dsb, reg))
+ 		intel_dsb_emit(dsb, 0, /* count */
+ 			       (DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT) |
  			       i915_mmio_reg_offset(reg));
- 	} else {
- 		if (!assert_dsb_has_room(dsb))
- 			return;
 =20
- 		/* convert to indexed write? */
- 		if (intel_dsb_prev_ins_is_mmio_write(dsb, reg)) {
- 			u32 prev_val =3D dsb->ins[0];
+ 	if (!assert_dsb_has_room(dsb))
+ 		return;
 =20
- 			dsb->ins[0] =3D 1; /* count */
- 			dsb->ins[1] =3D (DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT) |
- 				i915_mmio_reg_offset(reg);
+ 	/* Update the count */
+ 	dsb->ins[0]++;
+ 	intel_dsb_buffer_write(&dsb->dsb_buf, dsb->ins_start_offset + 0,
+ 			       dsb->ins[0]);
 =20
- 			intel_dsb_buffer_write(&dsb->dsb_buf, dsb->ins_start_offset + 0,
- 					       dsb->ins[0]);
- 			intel_dsb_buffer_write(&dsb->dsb_buf, dsb->ins_start_offset + 1,
- 					       dsb->ins[1]);
- 			intel_dsb_buffer_write(&dsb->dsb_buf, dsb->ins_start_offset + 2,
- 					       prev_val);
+ 	intel_dsb_buffer_write(&dsb->dsb_buf, dsb->free_pos++, val);
+ 	/* if number of data words is odd, then the last dword should be 0.*/
+ 	if (dsb->free_pos & 0x1)
+ 		intel_dsb_buffer_write(&dsb->dsb_buf, dsb->free_pos, 0);
+ }
 =20
- 			dsb->free_pos++;
- 		}
-=20
- 		intel_dsb_buffer_write(&dsb->dsb_buf, dsb->free_pos++, val);
- 		/* Update the count */
- 		dsb->ins[0]++;
- 		intel_dsb_buffer_write(&dsb->dsb_buf, dsb->ins_start_offset + 0,
- 				       dsb->ins[0]);
-=20
- 		/* if number of data words is odd, then the last dword should be 0.*/
- 		if (dsb->free_pos & 0x1)
- 			intel_dsb_buffer_write(&dsb->dsb_buf, dsb->free_pos, 0);
- 	}
+ void intel_dsb_reg_write(struct intel_dsb *dsb,
+ 			 i915_reg_t reg, u32 val)
+ {
+ 	intel_dsb_emit(dsb, val,
+ 		       (DSB_OPCODE_MMIO_WRITE << DSB_OPCODE_SHIFT) |
+ 		       (DSB_BYTE_EN << DSB_BYTE_EN_SHIFT) |
+ 		       i915_mmio_reg_offset(reg));
  }
 =20
 +void intel_dsb_reg_write(struct intel_dsb *dsb,
 +			 i915_reg_t reg, u32 val)
 +{
 +	intel_dsb_emit(dsb, val,
 +		       (DSB_OPCODE_MMIO_WRITE << DSB_OPCODE_SHIFT) |
 +		       (DSB_BYTE_EN << DSB_BYTE_EN_SHIFT) |
 +		       i915_mmio_reg_offset(reg));
 +}
 +
  static u32 intel_dsb_mask_to_byte_en(u32 mask)
  {
  	return (!!(mask & 0xff000000) << 3 |

--TJMdyoU9CQls9ZU9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPZIgACgkQJNaLcl1U
h9DfIQf/SoCA06H1HA7SzYcLnmr1j91iBNfuorL7JDrOYYJo7s4u+iNplrl4z1w2
DpqO4w9khwF+DHpxo8aHkLz+T6/B/TGjFHNrXuWYxIXDCn07Q20oz+nI05ty99XP
7X6LnVyVxeymUiDwlfg87S+2SlhcAhWMXZBl31+snLaiol8tCcrdpEzYqyRBIDl9
ADFOIgVtmKOZTohrtoDfC+XmWz0PjowzYIUUI+cnTdN6mlczxdAsyvYQX8ks94PV
ngxPZy3TNYqf/FnyVmi9srN/aVkNNecL4v/rj5VFKWz2zd2w+NPzcqhvf0CnVTqy
jISI1uZutV477SMwsKnYvXdqrzRKBw==
=t1ob
-----END PGP SIGNATURE-----

--TJMdyoU9CQls9ZU9--

