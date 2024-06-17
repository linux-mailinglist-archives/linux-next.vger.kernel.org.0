Return-Path: <linux-next+bounces-2569-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BF890B9CF
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 20:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7195D28276F
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 18:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D69194C63;
	Mon, 17 Jun 2024 18:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yg+ggz3a"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346A5194AD5;
	Mon, 17 Jun 2024 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718649443; cv=none; b=nB8EmtIIZV0N1qarad+D9D9E0fjI/TEKDserbow3Ir9fyktnH+zk5XNADbOpGzNFXXHu5V1romLfGhTAGEd71jz0JKJ2Yg8PnQddBJogA/1c3h3t3fVry5zbwjYKviybg3jL2//cG7g7aCrjqMlwx3BikDzQV0YFPgOJ7OwfG/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718649443; c=relaxed/simple;
	bh=rDUtIIK2UsaWuKIM2+e8+3bWeJgkVkmgOstme6s8ouo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ulDYhqV2TCMVlUdDDQkWSzHS4QFs/RMw4la2EfcOmD9PVJdcB2bs76NIPWSQVgOnA9ul21wMixm7J2RgUTy3Hz9gB+OgkhXaldTXfQDGhSORZrMZvajYvYEIZ9FIXvTWdsgfN1gukRTvKasy+vOvecUD9vho0mn4+s9b7JY3lwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yg+ggz3a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C37C2BD10;
	Mon, 17 Jun 2024 18:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718649442;
	bh=rDUtIIK2UsaWuKIM2+e8+3bWeJgkVkmgOstme6s8ouo=;
	h=Date:From:To:Cc:Subject:From;
	b=Yg+ggz3aYPkzCyvd7ZTedjWFkjS3f7v4Srpu4zFEgeJhEfJkQI4r/p5uHxyAl7CiN
	 FPaP/EZsYfzdnPq8Mp8WSh/J84I4Rn2Tie0HEWS2pim+RUs+5hV6VUaBX4OTyQLmBd
	 EQAITmT+Ook9IrTSGO3644WM4SsCwWzic09ttQqzfA2/CqYA22GQ5ktbuz8j3pmi/W
	 isV2ywdADo4SLzf88Fk18FiMpF2nFeVgpF9nsNCkDGIcN7/6Cj/joFjuOH5IYSn9jm
	 TeSvxz2fBcMUT0u+FR/0v2zdL76CG6fA/R6SOpEiyvqGckDiSSz8orK1x60P8HprLH
	 fkvyZ4UDWpQFA==
Date: Mon, 17 Jun 2024 19:37:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: linux-next: manual merge of the amdgpu tree with the origin tree
Message-ID: <ZnCCXS8BhYFjY15h@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uPjCyrta/bxZbYJp"
Content-Disposition: inline


--uPjCyrta/bxZbYJp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h

between commit:

  2c92ca849fcc6 ("tracing/treewide: Remove second parameter of __assign_str=
()")

=66rom the origin tree and commit:

  030631e97b209 ("drm/amdgpu: revert "take runtime pm reference when we att=
ach a buffer" v2")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 7aafeb763e5dd,2fd1bfb35916f..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h

--uPjCyrta/bxZbYJp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwgl0ACgkQJNaLcl1U
h9AK1wf9FxpzFjkKEE4klkmJRe3bEcsEKj64ImUi9RVrFm1jmZ73s22AqF2fWsax
+n2aK2sUxToGeDvHXNGL+F/7Fc9XVwPdqkRXPnP7VOfy+re76+bSeZ5mQ3ckcz8w
Q0Phq/5jUN4km0mK4YsvDEhtUlfzdrs/z65wz4i21cfqCNROtyckqJqIxf8ANkcR
VyY/4MDiYTlESm4cY80mGlQAOeYQY8ySbe0/ifJMCNKSmsQhn5rlhwgasDFhHWgb
ORJ8TOqxBGqbQPGkJxD8WFJcCjEldXrTI34LBS4+MaoXC3z0ikOln89B+xKVn9Sp
CYY2tejIgthZN3VaZGbixngVHAWRCw==
=dKFe
-----END PGP SIGNATURE-----

--uPjCyrta/bxZbYJp--

