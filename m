Return-Path: <linux-next+bounces-2568-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D52A190B9C3
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 20:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D61A21C240B2
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 18:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCED364BE;
	Mon, 17 Jun 2024 18:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5ky6mip"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335DE134C6;
	Mon, 17 Jun 2024 18:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718649201; cv=none; b=qk/5f4QFRI2Lkh96Eq/ItI4+9BgIw9PRCvCxROygZX/fyY0ucSsjcK3HVCetdL1HY/nV1vxMm+Opu0WtU88n/9SV+BqbttSDuhz5FN9ylB2OabZvjEf9+IjOqmTqimDiCri0Gn1HfaC+pLsk3e08hr8y+schYqfm6TMNb0/Q8GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718649201; c=relaxed/simple;
	bh=Gt5AbKd0+XH+0wVvRk0f/xTWi7oQGBUFmyKGBfxlRQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MpMy+60pZ6UvjLb89I3FR2k3AzmxSbgVkklPVLzB8/OJvBnB2cZ00H3QFaKLYitVF4Jb76spVKseicN4Lf9ewS6Dqx7Ez8OKGCZLrN/iB7yVibhSFwA/Kk2Bd2WFRPpqgp4uP7kIpCgYgjUYHVRijlrgpYDUMbdH1xryErP9leE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5ky6mip; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7632C2BD10;
	Mon, 17 Jun 2024 18:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718649200;
	bh=Gt5AbKd0+XH+0wVvRk0f/xTWi7oQGBUFmyKGBfxlRQs=;
	h=Date:From:To:Cc:Subject:From;
	b=l5ky6mip2fAi9OyJx8SV0jjuR3GhcX3VJ5uyUNfB2Re+py+2S4JN4TQlbxhyswOWL
	 7EE+KqdZTAW2plGjz1GBV4xMUUkr6ScT7ZKPGopdyYNgHc5bi6CzbhuQwKiXvBZirJ
	 M3rCb2Fw5Jn17vhxoU8Qe63FXbd76FOl+nng17RWjTIz2zLqwwRcTGW5cQ5rSP98LH
	 bNiu6w/IwXd78IGUk5gvzhsseDCA6b61Le0RtmiHsJW88JEfMx/B0G1GvMVLYbidrh
	 NYJEhsXjDbHk/RH+ob8vwL+W27XCiHIe9lxqthALQX1k6NBkcVRkMDtcLXxtzLVoqv
	 Im6MfFZ/QeeiA==
Date: Mon, 17 Jun 2024 19:33:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Riana Tauro <riana.tauro@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
Message-ID: <ZnCBa7N6-wLbkERq@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9evfg1dnY7P2krFD"
Content-Disposition: inline


--9evfg1dnY7P2krFD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/xe/xe_gt_idle.c
  drivers/gpu/drm/xe/xe_guc_pc.c

between commits:

  2470b141bfae2 ("drm/xe: move disable_c6 call")
  7c877115da419 ("drm/xe/xe_gt_idle: use GT forcewake domain assertion")

=66rom the drm-intel-fixes tree and commits:

  21b7085546481 ("drm/xe/xe_gt_idle: use GT forcewake domain assertion")
  6800e63cf97ba ("drm/xe: move disable_c6 call")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_gt_idle.c
index 944770fb2daff,5d6181117ab26..0000000000000
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
diff --cc drivers/gpu/drm/xe/xe_guc_pc.c
index 23382ced4ea74,508f0d39b4ad5..0000000000000
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c

--9evfg1dnY7P2krFD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwgWoACgkQJNaLcl1U
h9BPCQf/eXvzZZ5eZTqLMhQFs/NGozaFYKFjrAyueXxCVJ8IiLpTqKNWbD+16hLG
Zb/LAezv9dmR0iwtxMELBPX+YH5J/H4wMHA1tQ0FzqOVUhbr42kVNvv0ta/DZwb7
kyGfE95XkK4dZSVUld4TZhz5nhptU3KtSu5fE5o9VT5QQ9kPPsvovT4zZ1qcpzWe
chyYnpVSV8EgR2R653aqQ3DjIMYRReNFixwWL/MLwfDrCDvkuLLLxwb5eY2vV/IC
hr37RAdtC6NTlAmMmQzCCQPyEeL/u7AqspaZzjVIIOdL/BJvTWKfttlrG3HZAlfb
pwCtKRHC+eMAOsyN6Wh/mGyma47R3Q==
=COji
-----END PGP SIGNATURE-----

--9evfg1dnY7P2krFD--

