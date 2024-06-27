Return-Path: <linux-next+bounces-2691-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D314191AA80
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 17:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F95D289C33
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 15:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7BA1990C4;
	Thu, 27 Jun 2024 15:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rSrvCMgN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E0F1990B2;
	Thu, 27 Jun 2024 15:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500796; cv=none; b=h4PZBoh78lqlszaqjnOoTrIGGZms4V8XP4dlxlrrY3UCOFipqcDJfHin5xUlnc+xjaZOeMlsAA4VB4QFn9eBTOsn2iwru5KCHH5KWM4lavYjlsnsYVURTWvaYZTl2cMyglKJkIBryQx0aGuTF+bygAOPLHGEIWsCJpMzbP4vtPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500796; c=relaxed/simple;
	bh=Gm2UFxhA+RaA9MN0RMcn3u6Nvg2T9TqR9643ksfP5cE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EuGHKXFSglHxb38U8Aagi/suTriRkItHljgkeB2cdE1y/0IY7NI6cCkYTtV5oytMyfndYgY23o9ucD9BtjA3qTovR9FVHAhD+m+luhdZtnN40Q9jVYlgLDEZTpFh8/udW+O9Ah8Rs+fX1IC917kAXKRs9fSv0nCyAKe6/b1Iitg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rSrvCMgN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97395C32786;
	Thu, 27 Jun 2024 15:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500796;
	bh=Gm2UFxhA+RaA9MN0RMcn3u6Nvg2T9TqR9643ksfP5cE=;
	h=Date:From:To:Cc:Subject:From;
	b=rSrvCMgNNT2qxLrnn2He3h4Rb9n202E6mjGezePttfjt7jd4jXvZkNS7WIs8zbLVb
	 1UxWtBBk1aMlYdC/v+F9D0M3OoU9bKoH5P13MBeVUZLsYf3PqVHui3oD0z5Rzc6rGN
	 usBUeKl3PhMh5xqNcbMO61p2R6KlW/BV6Asi+P+SkKvD+lMeTaB6msoqNON3EIe3cx
	 tBBeZhtRyGCYO5cx6k/SiVJKIIW/6i1V1idNVyVwek4qJTq24rZNruxx68apLBVfJj
	 YWyqV14phrHuRYs5afm/Fz3n8t77bCPX2DNCXz3DsWZNxRYZldrCvkdL2/OpQhf/KT
	 WtVSJFqQ/iVzQ==
Date: Thu, 27 Jun 2024 16:06:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Dillon Varone <dillon.varone@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Michael Strauss <michael.strauss@amd.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <Zn1_91pUC7YENzRY@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M50tsz2cPts8X1x/"
Content-Disposition: inline


--M50tsz2cPts8X1x/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c

between commit:

  c03d770c0b014 ("drm/amd/display: Attempt to avoid empty TUs when endpoint=
 is DPIA")

=66rom the origin tree and commit:

  0127f0445f7c1 ("drm/amd/display: Refactor input mode programming for DIG =
FIFO")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
index 199781233fd5f,428912f371291..0000000000000
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c

--M50tsz2cPts8X1x/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ9f/YACgkQJNaLcl1U
h9BKpwf/ctDg3kmV6vtDRNYOgTngHtqfriBgFenwSMMLV+Qw0ujIMej39V4TQLUP
8U90dPj3nI3xMrC7Sqc6bvMQKnnmYcYuUDXIzHZ0BcqYUa2qn8bzi3EPzDVKTiMg
YbFpjKdb5g2ffm04j+LHSJ7h+pBH214lDyceFxE2Ap/OidYoBzTFUaFS2/P5muDs
AoAotaPxRYYyb9quZAV8TRFQnUeEW9SpfYqh4c/TgCV4Pzv6wusR6Bvfo3BbiRrT
he69Im2SkVUYf4IWWSNJgCGQmT2l5RH/la/oc3zNG+J9Sfr0NVNey7VrMJ1RNC2K
d3oHmebOefsd4nQIdsLEK4XH050ukA==
=zMEz
-----END PGP SIGNATURE-----

--M50tsz2cPts8X1x/--

