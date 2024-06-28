Return-Path: <linux-next+bounces-2702-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7495291C021
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 15:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A699A1C21317
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 13:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950311BE843;
	Fri, 28 Jun 2024 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcwcSxxD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C66E1E89A;
	Fri, 28 Jun 2024 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719583165; cv=none; b=RGOMpYX3uWNRcVKTzuWpyXQK7weVXoaAQU0DfeVnPfmA7+BK3sCam2+rE2jAiUJ5JKKLkLKTsh97tItfSEAmbsPUnbFQb/uP0Nmcx1Av3P0G4ugjlQF31loq+kCam5K2aI1BL6aaasp8fKuSsxb6ryiPU67y43gxb/qa+6WF+Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719583165; c=relaxed/simple;
	bh=JKP5LbX/sS4jmKSQXTGB/C89N6UVsIaQooxZpoxlQoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=htla7djwNaR52Uwx0pULqwksQ5wUZKI+oNlDIlUKpqYu2c2Hc9rdIN72fhgqUX1qpk3U/0FpAKLcsWF6cdTUlzRU7eY7LkWOeRtroLheNxVxztgzF/6akkLqkvg4uz/4GgP55vtEYekMARTafTEE1JEBl9iBYn90GkYLYOsO2KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcwcSxxD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52B1C116B1;
	Fri, 28 Jun 2024 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719583165;
	bh=JKP5LbX/sS4jmKSQXTGB/C89N6UVsIaQooxZpoxlQoM=;
	h=Date:From:To:Cc:Subject:From;
	b=KcwcSxxD0OLOaqLA2+rjs0yKqgiMLAr0VJzHmKrhsuNXAo4RS1AzPokPDqeUj2U9t
	 cOaLx8eNj3rJ5BoGzjyNt5EVWmHIvX4h1cnOa4MjXcjJoS8H7CJibSfbj+caGQnCSf
	 Mit+6Im7rDs68yuCkeaOJN56HR4mXOAaiXp/G+fwDuc+0C2hltWr0LCKT+T8i5VUzz
	 epQWkg3z6EebIyeZTK/yf8tntWZDojOM8WjPgA2qBrhbJPqW7V03kg2C3wBbUhaKcc
	 K8jBLBOvf9oPwTa9Lxt/YnA/7CEZNMJM1KmgWkLNBe665vJyfOWUEXYtgxKb1Avrcp
	 HsM6V+oHv08aw==
Date: Fri, 28 Jun 2024 14:59:20 +0100
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Filipe Manana <fdmanana@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the btrfs tree with the fs-current tree
Message-ID: <Zn7BuMWlQxmzB7lm@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="caGNKGGUnezGAgPE"
Content-Disposition: inline


--caGNKGGUnezGAgPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  fs/btrfs/qgroup.c

between commit:

  a7e4c6a3031c7 ("btrfs: qgroup: fix quota root leak after quota disable fa=
ilure")

=66rom the fs-current tree and commit:

  27a6520fbc259 ("btrfs: do not BUG_ON() when freeing tree block after erro=
r")

=66rom the btrfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/btrfs/qgroup.c
index bf0f81d59b6bc,3cf9724eb188c..0000000000000
--- a/fs/btrfs/qgroup.c
+++ b/fs/btrfs/qgroup.c

--caGNKGGUnezGAgPE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ+wbgACgkQJNaLcl1U
h9CyVwgAgYefifBatz0MEFkP3KCf+hQeCRKEJUt6iFc7bm/0Tb/6rUGybumFIb4j
FE6lpidRTj/KdVqGvNFNxjSE/pElELA4zEyrIG7WNvx3m83JKTYs7a/LIbkpcRjh
tU8v7R5k71O8lZNW8gRa0kIENQ/Mk4EV2R5Rd13HgtZy/+/f3WX6yFvOS3WT9MF9
dgksXSfSeEBoiUrVI4fnfzLEaGnm7/JvWZ7GgVSOfwfZ87NXjLbGiTCgo/VWhJFw
xEcTjTjXGRXxzbWqWYYFSOfeINzbRyruxP7KmKRNUzwLLDmqsjfqABrWcRO6PIm5
uNM2pI+uoVC1agDSZGHMSYpXu2WTLQ==
=83SX
-----END PGP SIGNATURE-----

--caGNKGGUnezGAgPE--

