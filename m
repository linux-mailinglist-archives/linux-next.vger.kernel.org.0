Return-Path: <linux-next+bounces-2705-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1734E91C429
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 18:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C14F81F22AA8
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 16:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9483A1C9EA1;
	Fri, 28 Jun 2024 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpuuV/eY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA41D2E5;
	Fri, 28 Jun 2024 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719593496; cv=none; b=TUOlmS599ms6WgZesvibJ0+N9DwzqYzHPLQSJySUfXKNdBlJ2K8hW1G6FI/HL6uBHPvIIuZyi95ckyVGmtiCIc+O/vRpwydGP6ydpwuxXgukr3ihFL8JVP/AcY+OUyntXMx7PMRV2SpGiwZQ6sokFHWOh8jT7gqxHInYaLD/u/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719593496; c=relaxed/simple;
	bh=Xx8AHRpEaxvuZ24nCW01xv/wTFnUrbCQevtmg0yUDOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YT+7CeaWy5S83K0hKcBVmj/PEIazm7HwcV3uXuGv161e3pjnE9aZjtt+tJl4g0YX7B7PSPqO/qgqwjCcF+GkSmljpdV2/ThZNWLGYu7pVSPwQARSZ+7/+aKtMJI2HuiLDU9gcwufIavazroX8j1iOwbeW4bpp7BgSc2YdStFDBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpuuV/eY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D31C116B1;
	Fri, 28 Jun 2024 16:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719593496;
	bh=Xx8AHRpEaxvuZ24nCW01xv/wTFnUrbCQevtmg0yUDOE=;
	h=Date:From:To:Cc:Subject:From;
	b=JpuuV/eYiclGYNAVtvJDqTrDM7x5lvbnXrdH/8BFy+8SlQMDNob5sS/Wxijl/qKPO
	 FEg0YmRorYkgAnBeiCIeFc6bfUA5YnQMgCWxVNZ+Pqj/uwGoHzKYURZSY7Fh+EYkuH
	 o5B0hLxONKr5r5omMZgv/Pp3i4Tp2u73N7uqUtSL7QOybpCNh//RVQzK4m0gnFfpo0
	 vWSx1MVCfhnl4FW7o42JtzfalJcnrGBZFFWo+6i6ibpu1R3zZra/grUTePRlfCtkMf
	 fht6WAR8o2GK2yd89Cx/1n0Bp0IZ6TQnPCGAkPRbTnZwQQIlpvz5joGHc6YZrYqNAs
	 sCoDg8cgAqTxQ==
Date: Fri, 28 Jun 2024 17:51:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Riana Tauro <riana.tauro@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <Zn7qE8rGdTMXmhK-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7IWLkhR3deeAeUwl"
Content-Disposition: inline


--7IWLkhR3deeAeUwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_gt_idle.c

between commit:

  2470b141bfae2 ("drm/xe: move disable_c6 call")

=66rom the origin tree and commits:

  6800e63cf97ba ("drm/xe: move disable_c6 call")
  38e8c4184ea0e ("drm/xe: Enable Coarse Power Gating")
  ecab82af27873 ("drm/xe/vf: Don't support gtidle if VF")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --cc drivers/gpu/drm/xe/xe_gt_idle.c
index 944770fb2daff,67aba41405100..0000000000000
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c

--7IWLkhR3deeAeUwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ+6hIACgkQJNaLcl1U
h9BZvwf+J82kZVRXzrNZjb7UKRVQsQVP8nAbDDMXpbBJsyU5tUHusr+/urAZoZAz
Ph8paEH9AykYvDGiGMZ+He+UwFYd90x5EXsvdD+v4qeFHRT33RDWPJ9HeqKO7czY
9d7UIkFw1/j4q5prRT0PrGvirif5W6JCR1SS8iIU/BG/gEUZ6wBHBFuab9YOPWsO
p4Ab6BJimKGf9xrzYBW39GkArebZTVD7QHEnP6AGSWrBmvYATBMhZ6tEUVFWvFHG
37mXZjJFjw/Jnb/bccp+8LjPOtaMs1fEEr/Fd4YQ6nW4ENQSBJOqeV9OMwaH53AP
DlTYhtWsoaGvWk/GU5kPkcSj7TaP9A==
=HPbD
-----END PGP SIGNATURE-----

--7IWLkhR3deeAeUwl--

