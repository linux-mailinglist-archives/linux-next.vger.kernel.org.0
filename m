Return-Path: <linux-next+bounces-2623-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D6D912689
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 15:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96194B2543D
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 13:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF3E12EBE1;
	Fri, 21 Jun 2024 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqVRAuVn"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C410122094;
	Fri, 21 Jun 2024 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976079; cv=none; b=GSoUK6hnkiOTUYDAw8vWi5STwYJNc80JolTYmAjV0/Nf9l1Hi8ZEBirHIyA0Y/eVFqfiQl+7qFz2MatFr1t69uCAvxnTAikPmsU5iU7YC/tLMWb/CDzXv3kx3Gx0DD1SHa680bgCaCn3VWh2C+l8IchUUyh5JBH7NMXXnRJfCa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976079; c=relaxed/simple;
	bh=eEBjK7L9zo7dYznjm4ZoCU0EEdJVjmtajHqCxc1dnhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gcz2SLSHz5RXrHOvO3Q46kwUKBKJDEKcH46L0OjMiCzV4px/xvpvQ2vOirXcDAoWLazu9kj5iKM3d2UK2+MEjhQPBPTl33cYebdXE5g25ML+/u4+FotZWkjqmYpjo54kQPedG7VpAe/25TDx2Ac1Zv286JuxQivVdgGUvu+E9nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqVRAuVn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8955CC2BBFC;
	Fri, 21 Jun 2024 13:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718976079;
	bh=eEBjK7L9zo7dYznjm4ZoCU0EEdJVjmtajHqCxc1dnhI=;
	h=Date:From:To:Cc:Subject:From;
	b=JqVRAuVnTHIw6D5/uqDKXXNm7JNokOfiLq8/btn0kxMfp1kd2uq1YrOaR0i2I9naV
	 VcMeTW3EPsY69Hy87DN1ljANH5fesyYF+U/K9VlG4yqb0QcA903TyXcg2EwxCaIimy
	 aZBdng5s5nySzZbIIxumy9Eq3qSkSGI9SflGzObEdz8F61YrGom6eaFDIwiAex84HH
	 z43lJtMcpBYMRRSBarhkSHh3FfRk8nR3tfR+iSuX6uzSLA5OcleTC7af19fP4zsRIx
	 YtftL3nqhr6BiHku+Pj3q+pyr+RI1cGTXSr7Tj7Tjr6Q7edwErule1YwdWjuYIuaUt
	 OClFU/D2DXZEw==
Date: Fri, 21 Jun 2024 14:21:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Dillon Varone <dillon.varone@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Michael Strauss <michael.strauss@amd.com>,
	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <ZnV-SlwKvgfpYYK9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6v7f5m3wwL3qaoRy"
Content-Disposition: inline


--6v7f5m3wwL3qaoRy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c

between commit:

  c03d770c0b014 ("drm/amd/display: Attempt to avoid empty TUs when endpoint=
 is DPIA")

=66rom the drm-fixes tree and commits:

  47745acc5e8dd ("drm/amd/display: Add trigger FIFO resync path for DCN35")
  0127f0445f7c1 ("drm/amd/display: Refactor input mode programming for DIG =
FIFO")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c b/drive=
rs/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
index 199781233fd5f..30e6a63988391 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
@@ -157,8 +160,8 @@ static const struct hwseq_private_funcs dcn35_private_f=
uncs =3D {
 	.set_mcm_luts =3D dcn32_set_mcm_luts,
 	.setup_hpo_hw_control =3D dcn35_setup_hpo_hw_control,
 	.calculate_dccg_k1_k2_values =3D dcn32_calculate_dccg_k1_k2_values,
-	.set_pixels_per_cycle =3D dcn32_set_pixels_per_cycle,
-	.is_dp_dig_pixel_rate_div_policy =3D dcn35_is_dp_dig_pixel_rate_div_polic=
y,
+	.resync_fifo_dccg_dio =3D dcn314_resync_fifo_dccg_dio,
+	.is_dp_dig_pixel_rate_div_policy =3D dcn32_is_dp_dig_pixel_rate_div_polic=
y,
 	.dsc_pg_control =3D dcn35_dsc_pg_control,
 	.dsc_pg_status =3D dcn32_dsc_pg_status,
 	.enable_plane =3D dcn35_enable_plane,

--6v7f5m3wwL3qaoRy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ1fkkACgkQJNaLcl1U
h9AyjQf+NYcwSmnP3xpW16rF7WaCcqQmKBlzH6VMIQFcNdUDyyfKEifrumflFV7G
p0DY+ttTzgrKcKh5TNxzgxFK/Zrc9RCzhnqZpsbCz5dfr9YSuUGoK9tcnoMfUgXL
Cii+JhXyM+t18tu53iT6XlOLGl1GzrC2fMT2N4R5AeIvhL25my7PErl92VchvncQ
IkN0EiS6KHH0PwSt7omzgnpq3ovdZYXE8F7+HmJyVLTYFoXCOkeYYDLK0fv/3Auh
llfyOYxdp8BWXPDH11D1bkkcw72FZpAI4NXX/lmVMWQ1qkCa3l11marLj3R6QhbE
txUFOeftL7zzc6HHDW3RwR799O4V1Q==
=Pcbk
-----END PGP SIGNATURE-----

--6v7f5m3wwL3qaoRy--

