Return-Path: <linux-next+bounces-5342-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E2FA22638
	for <lists+linux-next@lfdr.de>; Wed, 29 Jan 2025 23:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8FFE1885B9E
	for <lists+linux-next@lfdr.de>; Wed, 29 Jan 2025 22:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AB719D8A9;
	Wed, 29 Jan 2025 22:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZdZ1fV8g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE951EEE6;
	Wed, 29 Jan 2025 22:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738189980; cv=none; b=O0bDhPeQT2jQj1niShztCqVycC+ldRRZTIy69jy3hgvr1eDSDYBsqVA0wc5nL+6LfM0v0u68VbNLx12teEkSJonjEPWLXAQ508k/OapJ6rnevqKLmgLjR66zOdU0oKxQm7cnVc2Ndc2TRSFRPLozAUjLI0YFw25WBwt/SoxkwjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738189980; c=relaxed/simple;
	bh=5T0XAhj8R1xspPwIaCv2Zxs0CU6xMJWWPNHBgjw/Aqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bzeNKYFb84zngiwYgnBMecRmnCot6gmA3ckuhRh2jaSpC1E7g4Dig7Mt258ULbWjJkIP0ewju7W2599Qx5SYLe0LGhDEBnlB0hjXtaOyW6X+ikoBx9TLYUJPXuVOgQ0WqgVTZk9OvfYYykfIG4iMiQa4bShAqkxs+DR+D8x3HOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZdZ1fV8g; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738189965;
	bh=OXLUGGrzgK0pFfvtRxF5lZxN5zxECmrb8dQuBQGJikU=;
	h=Date:From:To:Cc:Subject:From;
	b=ZdZ1fV8g7ufCuT8moDjBwvJtQlMA+e3WdwM7+tx5fNZkX0sbO8/ponLZlyTWOqBp8
	 zaGOF7XOUDqzaN97cje/UQHCPUMFt9T/TQ99Yp78u4cxpBDG0zN3XO1mHkd9RNw/bP
	 WDBpdL0bJeNYOupw1aI4L4fyuFoNUxFJF5M/59X7v5V3B5QxYo9jSyIQmBpZUgAFlX
	 xZsAnV3/JxhsFRhQPinQkwhlYm3nsKHpr9N0vHQWeves8I20sbPKbjozcJIvh0VWwN
	 ndJZ6d4xumLT8KncsB8dtQ9DkccAk3CiOx8NVu5h7OloKXRWjLytI2QPZe2rO+5Lrp
	 Y7HoPfGZRZt7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yjxk46C7Hz4wc2;
	Thu, 30 Jan 2025 09:32:43 +1100 (AEDT)
Date: Thu, 30 Jan 2025 09:32:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Joel Granados
 <joel.granados@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the fuse tree with Linus' tree
Message-ID: <20250130093252.78a892bd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/thsWKslhB1POJ8OAIztEfoa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/thsWKslhB1POJ8OAIztEfoa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fuse tree got a conflict in:

  fs/fuse/sysctl.c

between commit:

  1751f872cc97 ("treewide: const qualify ctl_tables where applicable")

from Linus' tree and commit:

  9afd7336f3ac ("fuse: add default_request_timeout and max_request_timeout =
sysctls")

from the fuse tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/fuse/sysctl.c
index 63fb1e5bee30,3d542ef9d889..000000000000
--- a/fs/fuse/sysctl.c
+++ b/fs/fuse/sysctl.c
@@@ -13,7 -13,13 +13,13 @@@ static struct ctl_table_header *fuse_ta
  /* Bound by fuse_init_out max_pages, which is a u16 */
  static unsigned int sysctl_fuse_max_pages_limit =3D 65535;
 =20
+ /*
+  * fuse_init_out request timeouts are u16.
+  * This goes up to ~18 hours, which is plenty for a timeout.
+  */
+ static unsigned int sysctl_fuse_req_timeout_limit =3D 65535;
+=20
 -static struct ctl_table fuse_sysctl_table[] =3D {
 +static const struct ctl_table fuse_sysctl_table[] =3D {
  	{
  		.procname	=3D "max_pages_limit",
  		.data		=3D &fuse_max_pages_limit,

--Sig_/thsWKslhB1POJ8OAIztEfoa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmearJQACgkQAVBC80lX
0GwslQgAhnEJvLo8yUFgziu3womYkQJF2dORG5vn0FQlCAQTRyICtsGpmQ2J7YBX
mjrzFuqfPMT5Wsg5Vg/NluKDedYi72WH38zcE4dC12DnOfOarRl/R+T2QrQTtml2
rXn8llidfbvF1G37vEShxf64ECJ9jAepqYElq5ApNUb5Hp52lSpefA5bnanyZ/za
zQzlSGhxkb9iUcHJrU8U+fLr2W6wann+0jhSRhHPjUV6eE2To/v4HGCfJgKhIRml
+aRvC72O9IcTKvNwVTl+R73pY5wmPp6p9oGm/oooMEaW3T3DP+ao4zlA5EttUhwI
6EZTiJXeFc/Pdy+tuw8ShAH1yHwWHw==
=otkX
-----END PGP SIGNATURE-----

--Sig_/thsWKslhB1POJ8OAIztEfoa--

