Return-Path: <linux-next+bounces-3919-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA8797C22C
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2024 01:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 451121F22493
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 23:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950E71CB316;
	Wed, 18 Sep 2024 23:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OC50h1Cj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84367178363;
	Wed, 18 Sep 2024 23:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726702079; cv=none; b=lUEQjpqRDaQCqZglWUlr7Lb98qY6qZxr23upste8eVZy/1e2eXEuh062QrOMeWSsQXE2Lq+HWwjwB5oQcYNMxG7W0EqUVw3zZSfCqhR+VwPnZ6cXZs2r0IMhjeGuX3bYM+gpT1cbWu/uOcde8ulsjJqGDoyCFMTK2wEJjnzzCEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726702079; c=relaxed/simple;
	bh=BN111YqS+cU0rYfWDZbQPk6uZkP7l6o/VpvthgUnC/0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AQTAgGYKDFBL2xsCbGMwYx6xHZGH2RP1aH3Xxq14QacT5KlysPfRNWUtxxYWKTmC/oPFIN0MiL7spTbRLqKkFUsOuR8dRmSUwOZ2r3S5PlKmRNg4Pn6qQ8YDgiNsjkKBVokYPBsX7amaTCTeb/7rgUn6t7HfSudMLAAch9ETEr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OC50h1Cj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726702074;
	bh=Bt9ELa2GeiYVRmNenmyVyQi+u/04qU1WIiulWlet/f0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OC50h1Cjn2iLle7reaPstl1d2eNvEvbXEkv3WoXagMwHEUMU2yRNEsJH4TR9kmyhE
	 E6LxGWLGdHr9et6ZTHN/r+9Gr/HEz8MxckVneortLy4o0/U9ZaNKGX0tBhl2Chz+En
	 ssOg95RimhNmLJSnW+I5rpR8Jp8HDTDvcRXp06HfaHoWGU2FezphjqmXSxNd8VW+if
	 9EvMBrnal4SSjEF03rPkFP0Wbp2H27Jyd/raikb5iCfM/2H2rpyBRiAVbOejeOHbmW
	 X1aw7lifYHS63n6n7TzgSfEiqHI/ZlUtyUmWEmWiHkd8PDu0uQBg8abzRzzhM5uFxL
	 qXJfuMxH6bJ8Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8FF53JPxz4x8D;
	Thu, 19 Sep 2024 09:27:53 +1000 (AEST)
Date: Thu, 19 Sep 2024 09:27:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Cc: Kees Cook <kees@kernel.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, DRM XE List <intel-xe@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Dave Airlie
 <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <20240919092752.5a832aaa@canb.auug.org.au>
In-Reply-To: <20240909195939.067c1c13@canb.auug.org.au>
References: <20240909195939.067c1c13@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LiyUh+CzuED8EVHPam0+hFK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LiyUh+CzuED8EVHPam0+hFK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 9 Sep 2024 19:59:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the kspp tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/xe/xe_gt_idle.c:56:27: error: redefinition of 'str_up_dow=
n'
>    56 | static inline const char *str_up_down(bool v)
>       |                           ^~~~~~~~~~~
> In file included from include/linux/string_helpers.h:7,
>                  from drivers/gpu/drm/xe/xe_assert.h:9,
>                  from drivers/gpu/drm/xe/xe_force_wake.h:9,
>                  from drivers/gpu/drm/xe/xe_gt_idle.c:8:
> include/linux/string_choices.h:62:27: note: previous definition of 'str_u=
p_down' with type 'const char *(bool)' {aka 'const char *(_Bool)'}
>    62 | static inline const char *str_up_down(bool v)
>       |                           ^~~~~~~~~~~
>=20
> Caused by commit
>=20
>   a98ae7f045b2 ("lib/string_choices: Add str_up_down() helper")
>=20
> interacting with commit
>=20
>   0914c1e45d3a ("drm/xe/xe_gt_idle: add debugfs entry for powergating inf=
o")
>=20
> from the drm-xe tree.
>=20
> I have applied the following patch for today.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 9 Sep 2024 19:40:17 +1000
> Subject: [PATCH] fix up for "lib/string_choices: Add str_up_down() helper"
>=20
> interacting wit commit "drm/xe/xe_gt_idle: add debugfs entry for
> powergating info" from the drm-xe tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_i=
dle.c
> index 85a35ed153a3..0f98c1539c64 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -53,11 +53,6 @@ pc_to_xe(struct xe_guc_pc *pc)
>  	return gt_to_xe(gt);
>  }
> =20
> -static inline const char *str_up_down(bool v)
> -{
> -	return v ? "up" : "down";
> -}
> -
>  static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>  {
>  	switch (state) {
> --=20
> 2.45.2

This is now needed in the merge between Linus' tree and the drm-xe tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/LiyUh+CzuED8EVHPam0+hFK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbrYfgACgkQAVBC80lX
0Gyv3wf+LJfbXwQUt38mt6FZfvFVeKG/GC4SVPJFFIVwJP+8Jl30Yk/jJNf6vppD
w8XOQFY/FGiinjnfMJFkZccll7mF4gAhhfgL7NWoH2mAfRRQ4Ltiw6ecMAi9iK7y
MsogrW7dprxJFo+HR+nJMmePMceVfUDiiD2LD57eN69VUS+sbiWw1drS/BuZbxFS
qjOCqPgbR19Y2Ov5aLi6UL/r+o53yWN1l+9WpyosYA4BcJujARauhnWXvqYxUNCV
jnl7n/dxBQGOz7tjqjxt++uFvy5vbPdCPnk4HrtKdg4lx16YLJefYI6nJRk8qQhN
ZZ4GJrhMCMFn/CkNCJU7LlFZxouauQ==
=F3w5
-----END PGP SIGNATURE-----

--Sig_/LiyUh+CzuED8EVHPam0+hFK--

