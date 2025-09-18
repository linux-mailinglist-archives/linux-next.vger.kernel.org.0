Return-Path: <linux-next+bounces-8371-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8454AB8456F
	for <lists+linux-next@lfdr.de>; Thu, 18 Sep 2025 13:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39EC35843C1
	for <lists+linux-next@lfdr.de>; Thu, 18 Sep 2025 11:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BDC30102A;
	Thu, 18 Sep 2025 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4+nE3IC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED6854764;
	Thu, 18 Sep 2025 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758194802; cv=none; b=DQ63SYQQj37wGBoV+x4DpuEFW9ioXTQde5luAdhxsa+noXy4egh8HD9SAa8KEI4IxJWsLLot5gXbkJJaf8qyWzjO+DAK4OFSMG2ytOEIBs+kqqoX/xbBFDpFSUWlPB78qA1fJdZc+su9mNvsiLRQg4wxch88tS3JCivtgQ4tkWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758194802; c=relaxed/simple;
	bh=kr5kWcGzYj2XyCMPilSIrBXm76fCPWAC4NZhPU1BXWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SUfPnyvuZKkA+VCQ1tptOBPpoSrBTLiTSM235I63Fn9kyGlcFo07xsWpsI8rRhM3zOtPzXxEK3J1vk80/LkcQROw3Pb2Zk9bdxZ+H0Qxfpq/09dtLPXHTzOVJVcrfwJBFo/QWVZyako/tlwnqf4+FfsmQCB7yQUHzL7vcOnBjTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4+nE3IC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231E2C4CEE7;
	Thu, 18 Sep 2025 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758194802;
	bh=kr5kWcGzYj2XyCMPilSIrBXm76fCPWAC4NZhPU1BXWo=;
	h=Date:From:To:Cc:Subject:From;
	b=d4+nE3ICnnB1KmiciqVTZGWHVs5GJB61zKtAG7E9k6aOHynWej5yUmYinJGIlLapG
	 hxSsDX8k9DDaqz3z5cI4AXx/6lmRasWiO7y7ym3lRpf5gY+A8h+cNpG9kuKenEAEl+
	 Eqdk2ruxQdtinRmE78M8SY+5IyhszR6BK7vufV2YjOerTQHdP0ZG6BCT7gTJicU5Hc
	 uQhaRw98KJaeQf2Ac7oRlz+82icdB4r+BvgRSgAxhxFkDrJR0DpvM8jGMYwoWyWTVx
	 GRnLBnRPHm2/p0z7Q0Dr/5wsVZmpsBjQ7S5JV24FrnWvLHCx8DAWnt5xEHyk6ut//+
	 RLNP/JalGYS1A==
Date: Thu, 18 Sep 2025 12:26:38 +0100
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Qu Wenruo <wqu@suse.com>
Subject: linux-next: manual merge of the btrfs tree with the btrfs-fixes tree
Message-ID: <aMvsbkR_l3ZHwP0O@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7Fn8XiC37OUt0ER5"
Content-Disposition: inline


--7Fn8XiC37OUt0ER5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  fs/btrfs/compression.c

between commit:

  4b63a8a8330e2 ("btrfs: reject invalid compression level")

=66rom the btrfs-fixes tree and commit:

  6e8a10e90f2d4 ("btrfs: reject invalid compression level")

=66rom the btrfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/btrfs/compression.c
index 5329712d5dfb0,c865e0f2a7e87..0000000000000
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c

--7Fn8XiC37OUt0ER5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjL7G0ACgkQJNaLcl1U
h9DULgf9F0qQz0MXwaeeE8oYhFlegypOGX37RNUdEsNiiy3BOCLa2D6xz2mHtFgI
24V5cHwdC2pZyHAHGHvMRXz6OVkeHU7qY7dxYpPBnE+vXhdxcNbK9tQVuMFy8okJ
B8Tl6Ntu6K6UwpBNnw0TgTsRhdpi2gE2w/gT0xOiVKVfW9MjpDvNpmzAGBjEg6e4
YpTVpN3g/pWLyHAs2StlkNER4Jb5qop8ZXBKDUlfQ6tMRvJ92LtBfRTl3I8cDcir
aA1CW2j9ujndoAiom1lL8Yo9IRsyXmeQozll4pe6QyxV1gF45zewWfuLqSyP3CgQ
tvtO9hawocFB0loPQl1TDAttuh6ffw==
=sXo5
-----END PGP SIGNATURE-----

--7Fn8XiC37OUt0ER5--

