Return-Path: <linux-next+bounces-5210-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A76A118FC
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 06:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B5071612A2
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 05:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40E01C5F24;
	Wed, 15 Jan 2025 05:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="N+b9wsLA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F2B156F3B;
	Wed, 15 Jan 2025 05:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736919115; cv=none; b=qUjO68mZU+qNYL9+iFI5vgNRYPu4WXkOkr81yVxWSbvsIolUs/BuRUXVfkhYyVp6VtEcoWfkShif1f1z8JS20F1loyqMmo8CVM1S3OLvugDKtZDXZiDFZM8WNx3EoAb3p0JT/w8irygqxSdfaLjHAIX58Z3WREBSchQuzQo3qrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736919115; c=relaxed/simple;
	bh=ZXf+QG0BRFg2NWdjopnI+WjccTBvkFWY4ABcXCpo1UM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dJGX+vOjfiJeH/5Gp4CKWTJ+0Oa/GQW+a5BHbe++uKOTgkoWubQrEdxMclAIGDrBsyOK9oTUV+oPNEe1+sJIjzCk+AN5MDX7YZmQufQN9RLT9TU4G11DNLBANwhtJfeCd+vPn8ZH36CekIuuhn/Ntz+nSppeMr08IUfQd4kvXCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=N+b9wsLA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736919101;
	bh=/1NnPb7G2E4GwRBQcFjkDxaL0JBo1marbyfh2I16EDg=;
	h=Date:From:To:Cc:Subject:From;
	b=N+b9wsLA6tdlRTGnN5WShlqGsJDcAIgwz6Q1slhOIvHFVS+zJ3X+9ieGuSlgVkCR+
	 +OnreNSP67YFfP9Zdf8uNQAPGsLk7w/YGYz1yW4tx+TeMEKC/ndU3vU99BAbKgS6ug
	 lhgoCoOrAbfvvcgI8xZuKCjJ3dTS4afkP71fWPZfAlB+i5a76G7wzwuohRwMYor4ie
	 XZWtS9L6rQ3b/pcMk4kwGcknw+gCqNtmVmExzKYVtxBBZy420QXQjf/ZV9uKLaDXCa
	 NcG3SAZ7zBSSjTgqvhmItN3oS/JPJBAPwa0qAy5Au0LjqlPIILjf3auIcEeYQzdd67
	 PlfJ4D9D3gzAg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXvkN01lHz4xMG;
	Wed, 15 Jan 2025 16:31:39 +1100 (AEDT)
Date: Wed, 15 Jan 2025 16:31:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the i2c tree
Message-ID: <20250115163146.6c48f066@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XeMommVGIZCsd7z3hcZHYml";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XeMommVGIZCsd7z3hcZHYml
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the i2c tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/i2c.h:351: warning: Function parameter or struct member 'debu=
gfs' not described in 'i2c_client'

Introduced by commit

  d06905d68610 ("i2c: add core-managed per-client directory in debugfs")

--=20
Cheers,
Stephen Rothwell

--Sig_/XeMommVGIZCsd7z3hcZHYml
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeHSEIACgkQAVBC80lX
0GzVfAf/cMwP7IoqkA/w0VwPjORUueFNJlBZRBJgDLgyBOGxsU9m/ntve3kAB/wH
qWz+EXrUmK9RRFcScNK0FWGnIhFQB+2Fy0dFWpF+wsuFYeqONqDl5VhMQ0j4w8Ex
JGwsjawur+IbmlNz/QwtV5Aws3YBxpoQSkxwlYzm8nVjwlj2NW2pORaQI6Yud/2g
p2ZUNXqMo6TjW4w3eJD2yXcHJUmiDgaroBIHTMCEOweDe83WjoDypV898ldU0E9r
raqkcWa0sVHwbOQoEDdTm2M4f+Q3GNdQDlTXkFUeGs03U1M+EM5o75xu2BJl7psk
mrh8hjLcdDOsu0lSUZA7/SJiRJv0bA==
=+irZ
-----END PGP SIGNATURE-----

--Sig_/XeMommVGIZCsd7z3hcZHYml--

