Return-Path: <linux-next+bounces-18-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 601BB7F3B11
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 02:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B68B2827BA
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 01:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A744D15C4;
	Wed, 22 Nov 2023 01:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Lt1SgvBh"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3ED61BB;
	Tue, 21 Nov 2023 17:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700615457;
	bh=x8jTVZuJ1SIBE9Itnw2oH1Ikt8zUpUVpvR9A2GRFlCc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Lt1SgvBhbg/58EstgSIomf2ZAHMkYLO42aJUCMjYBlOFYjzvIyVLHy7/k1Otp3WnM
	 m8RSG8fUeOrhTCyMD7/HuG4/Nz5ZVwNof8il2doN74uWku4OWgucffyVgwHJr9x+JF
	 OXA5VBTt1PkqaguTTVC7I4AlBhhikZBSWF6kxq3TwDjb4ZBSukyAeNwBaS/buT9DXm
	 8Tikc8QaURw4BJoxnlfFNwxmtA6DlQiO8MmrwhjmsWPIL6unufy7Jgg7SgTARjhdsc
	 YL0CyxWL4gd2BaA6zdTpa+VCLsF+RY1zJm+pqfhts61s5LrwS3jRN5I5+MWUlRwcSI
	 caHef7Wjs+B0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZjqN32rVz4x7q;
	Wed, 22 Nov 2023 12:10:56 +1100 (AEDT)
Date: Wed, 22 Nov 2023 12:10:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Alex Deucher
 <alexander.deucher@amd.com>, Imre Deak <imre.deak@intel.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wayne Lin <Wayne.Lin@amd.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20231122121054.0d660cd8@canb.auug.org.au>
In-Reply-To: <20231122115137.04a33a6c@canb.auug.org.au>
References: <20231122115137.04a33a6c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fcudTv.a=RMzgcutdNML3A_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fcudTv.a=RMzgcutdNML3A_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 22 Nov 2023 11:51:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-intel tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>=20
> between commit:
>=20
>   9031e0013f81 ("drm/amd/display: Fix mst hub unplug warning")
>=20
> from Linus' tree and commit:
>=20
>   191dc43935d1 ("drm/dp_mst: Store the MST PBN divider value in fixed poi=
nt format")
>=20
> from the drm-intel tree.
>=20
> I fixed it up (I just used the former) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Actually, the resolution I used is below.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index c7a29bb737e2,53e323b71d26..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@@ -209,11 -210,11 +210,11 @@@ static void dm_helpers_construct_old_pa
  			struct drm_dp_mst_atomic_payload *new_payload,
  			struct drm_dp_mst_atomic_payload *old_payload)
  {
 -	struct link_mst_stream_allocation_table current_link_table =3D
 -									link->mst_stream_alloc_table;
 -	struct link_mst_stream_allocation *dc_alloc;
 -	int pbn_per_slot =3D dfixed_trunc(pbn_per_slot_fp);
 -	int i;
 +	struct drm_dp_mst_atomic_payload *pos;
- 	int pbn_per_slot =3D mst_state->pbn_div;
++	int pbn_per_slot =3D dfixed_trunc(mst_state->pbn_div);
 +	u8 next_payload_vc_start =3D mgr->next_start_slot;
 +	u8 payload_vc_start =3D new_payload->vc_start_slot;
 +	u8 allocated_time_slots;
 =20
  	*old_payload =3D *new_payload;
 =20

--Sig_/fcudTv.a=RMzgcutdNML3A_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVdVR4ACgkQAVBC80lX
0GzuPQf/VOh8+IwdxziZyUsjKcm3yIhPPVmxgtSCWsgGOC00PCVaC4L3J6ktverQ
MSCFmxOpp0rOcTTH9EYl1J3K31SHvs2q605cIFb98W16+kaSy7lHAgBKWk/rVG93
DgOJDlzDjQWVB94eMSkt6aVY+ydyv5K3+klmzldYfNPcP1ouZ40qrB52Ji/vyQZ3
QwbGQ945WfedLtnbjR3uppBmNAljSYfvSvFmPpAaKSRIbLhRXOFo/354E31jSkOH
q3sp43BhpMhKeTZ5W7zZCzxtvrVv3/wF1uGMV2fxF4eapIfvL4mlS5Z+rTNAq/3c
gUPVx6g1mJI0WiQBVbDLgqQkeKBsfA==
=SMFA
-----END PGP SIGNATURE-----

--Sig_/fcudTv.a=RMzgcutdNML3A_--

