Return-Path: <linux-next+bounces-8413-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB740B8FB79
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 11:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A57A47A1B35
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 09:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0BD1221F0C;
	Mon, 22 Sep 2025 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YL9puHuZ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A667329408;
	Mon, 22 Sep 2025 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758532732; cv=none; b=oMJL4xLy01esI0yAhp0+P5dG4VDcezhzgXRvSjkyliWRi6RtxNnnyz2hFjtvnoBTGhyFm+b2hoHD7BdrGuz3LZ+QkvSlDqth45gcVGNG0jzKsOei2o1xOvPoh+0HIuXsbuZRfN3tVzJ1iY0iaaZmZrg//zN829o3IRgGY9lNjy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758532732; c=relaxed/simple;
	bh=cL7qxc+LLXAE5w/og2wnPxm/k0waLfLygHTgq4loXJk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H9JEl4OLledyVvpKxjNFahNIeM9gySBd7/jusEmenh5Psy/O2GRXUq3RwyUkxstTzD9Y4eb3I/zf99XcM+Jfi1kxVo/qfNjk3g2r+f6ExY3Gt9S3Eqz07qb9EnYdVrIlQY34t+TDgEfRe4kVchITGlfLKcrKe8qaGOJUzDnRc5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YL9puHuZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A004C4CEF0;
	Mon, 22 Sep 2025 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758532732;
	bh=cL7qxc+LLXAE5w/og2wnPxm/k0waLfLygHTgq4loXJk=;
	h=Date:From:Cc:Subject:From;
	b=YL9puHuZpPR9a/vqEgL99WS1NnGo+ub4gSZ8XOunS7GsxJ2Td7Cp+DUXdAa8IXXV2
	 uw0lvgzSL2BRl3z+0OijeDrnX6khlMVvAFoFSOyOmVhs7L7AtuAlGB+c7cINLVTKEg
	 rbufvsuUoWvLdHw4qlCpLtZivOuxCzNieeSluMCNDE9dQzQijkYG7AdAckqqBCmgif
	 wFapTI+tIYMYRwBQw08WOhFZ76Ocs3MknnXqFcIobqIGlVeEKQIeWKPKYAxrOC+joy
	 TD7SFA52R+rP7d/a3Dw67mWNVKgxqPTgBKrvHALYCWwQ9AoaYkXXvUSFFq0UFFGmX5
	 DWT3xW0edRgng==
Date: Mon, 22 Sep 2025 10:18:46 +0100
From: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>
Subject: linux-next: manual merge of the fs-next tree with the arm64 tree
Message-ID: <aNEUdggN8pkt5ylY@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1tonRWRurIGOpQUB"
Content-Disposition: inline


--1tonRWRurIGOpQUB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  arch/arm64/include/asm/gcs.h

between commits:

  ea920b50ac9ff ("arm64: uaccess: Move existing GCS accessors definitions t=
o gcs.h")
  9cd2a7f1180f9 ("arm64: uaccess: Add additional userspace GCS accessors")

=66rom the arm64 tree and commit:

  053b5d3aac293 ("arm64/gcs: Return a success value from gcs_alloc_thread_s=
tack()")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly

diff --cc arch/arm64/include/asm/gcs.h
index 8fa0707069e8b,b4bbec9382a19..0000000000000
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@@ -167,12 -91,8 +167,12 @@@ static inline bool task_gcs_el0_enabled
  static inline void gcs_set_el0_mode(struct task_struct *task) { }
  static inline void gcs_free(struct task_struct *task) { }
  static inline void gcs_preserve_current_state(void) { }
 +static inline void put_user_gcs(unsigned long val, unsigned long __user *=
addr,
 +				int *err) { }
 +static inline void push_user_gcs(unsigned long val, int *err) { }
 +
- static inline unsigned long gcs_alloc_thread_stack(struct task_struct *ts=
k,
- 						   const struct kernel_clone_args *args)
+ static inline int gcs_alloc_thread_stack(struct task_struct *tsk,
+ 					 const struct kernel_clone_args *args)
  {
  	return -ENOTSUPP;
  }
complex conflicts.

--1tonRWRurIGOpQUB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRFHUACgkQJNaLcl1U
h9Bymwf/Qr9XKINliXO7sKeE9r7HwJ3HE7bSYcdzRqqc9Sn9BSa/eFmsGEdmtWb0
MFiCGtK1MGhaZD+XRqksJVqXexJaeeyifmOb20wsXwYTyi22IFuHpWwMb4mivgev
fPqapAwbf79uMj2FeMe3rEAoywg69drw18e2gOR+h2YHeYKUGQcO7LzWjYUAvNpX
Q5LhxBif9KRaU/Gg1xkPaRF6Dmz3H0wVle0KDBxmnh/wnEI0ckBw14Ax5StDWa+0
epce5a2TUJ1d4guLbbY8D6S43n6NHtBpTvY9aKo91Hn1Z3kXIwXxS8Q0/eMn47fA
QZXYzBXWMlkioDVSVWumplTcdH6rNw==
=wF5x
-----END PGP SIGNATURE-----

--1tonRWRurIGOpQUB--

