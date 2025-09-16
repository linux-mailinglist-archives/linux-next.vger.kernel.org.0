Return-Path: <linux-next+bounces-8332-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8ECB596F5
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 15:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2485A189F2F8
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 13:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD733314A92;
	Tue, 16 Sep 2025 13:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7VYfevE"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F8A313E39;
	Tue, 16 Sep 2025 13:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758027920; cv=none; b=H9f4IKHkkcHqMtxK6USyzONQb/9hrF384bVJecCNF+EKzUY8ocn8h+nERdxIk0hk5ZUvsmyFVllrNY7JTi+YBeHLEblwGwxxBpXuERzpcD0U5k4oHfy3SBfjkwPdNFCkYQMGRIcT9F6bfeVn4xL0Uoy1hdZFli1vnKzus+F7A5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758027920; c=relaxed/simple;
	bh=ma+EU55+6vAx5dd7uibo0FDmRcI1W0AHuXTIJN1dG8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kenzG+lV84S2sQ4o6bt5zvURGMrOb6JESnrm+mmVTVIs+d+2w8VgX2Xwn3DAzwrS+g02Ka9+0FJcn+sFs6FLdBizu010XzAzY6Zx0YoJe/aHOjrg5UYIHPvkCokHraJYHBY4g46Bc7q/SAZUQxbg6Qg8+aiEC00i5a13ju0Txc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7VYfevE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180E6C4CEEB;
	Tue, 16 Sep 2025 13:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758027920;
	bh=ma+EU55+6vAx5dd7uibo0FDmRcI1W0AHuXTIJN1dG8M=;
	h=Date:From:To:Cc:Subject:From;
	b=h7VYfevEN/xTbO2dBz1dfazu42QkNEQIBpEB85+9p1pkwiXcVdDu4fLBpJ8jFTlVm
	 m+ItljtDz5+PDqurKHNEVNL0rIvYd5JuvNDaUVWsvm3GBUyoyHtXMLrV5VqgiS+iuG
	 0dh/YFYxCFWL7bJKsnmV3p8zt62ugg/h88d3ewD8pjO5iNbYe363UNOEYteT8d7NIo
	 GtIDD7/t733fbLzyzWlHTw9einOt3tu7xVqBHLeX6ZtkH5xO3UyNP/zFUcf5Wd8OpR
	 lT02M23CVrT9w8ktNpGV76C/yAT6doobUYzELeSUBfCxgMebWaJZ30l4te5ZCzBVOt
	 0Xb4H6VVAYnPw==
Date: Tue, 16 Sep 2025 14:05:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the drm-nova tree
Message-ID: <aMlgjL0ZKsrvwQcB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B41DWEp7YHC36pzP"
Content-Disposition: inline


--B41DWEp7YHC36pzP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  drivers/gpu/nova-core/regs/macros.rs

between commit:

  6ecd6b73e0845 ("gpu: nova-core: register: improve `Debug` implementation")

=66rom the drm-nova tree and commit:

  4b4d06a7630e1 ("gpu: nova-core: use `kernel::{fmt,prelude::fmt!}`")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/nova-core/regs/macros.rs
index 754c14ee7f401,6b9df4205f469..0000000000000
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs

--B41DWEp7YHC36pzP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJYIsACgkQJNaLcl1U
h9Af1Qf/RehicUPQWdQbHcw6U+0JuR4pr/FsQlPnbw9MkQbRwWPHRsXTaoL57S6m
6OGfslO4s4fHzc+DwySl8WJW0CzSzk4kz+5iBJsSiEwdrFPPGkXujE1RdUYl4VEJ
db3G1GXph5cnD0pO7lICCo58YYgp9VV2wDvzBje00YpOgz3fDIyNVkU0SA/Fw9B9
sLPaKxwK+ZtZQPQISzxMF43gY0LjtcCuMspxBNdkqvOipdrCzgwVT5WcJnHge9Wf
2wpOLJwwVT4kySZlm7Mocg7NPZywTMoFukRF8AEmqysDFevPS64ngyEnHAVNBY1i
FgOtLMorwEef/e2sS0V0zHM/+AcQGA==
=+7oc
-----END PGP SIGNATURE-----

--B41DWEp7YHC36pzP--

