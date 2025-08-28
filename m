Return-Path: <linux-next+bounces-8137-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE31B3ABD4
	for <lists+linux-next@lfdr.de>; Thu, 28 Aug 2025 22:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E606C174D8A
	for <lists+linux-next@lfdr.de>; Thu, 28 Aug 2025 20:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666DC28642F;
	Thu, 28 Aug 2025 20:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="o2ZiUAbI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDFF278771;
	Thu, 28 Aug 2025 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756413681; cv=none; b=SMLy7mHQ8Ucz3FNOjzmvG2XQI900Fw9eAsYZATVRwfPm7ivMuAeSvL+I/WFlbX77IIpvyN1hpLTfKdVTTB94RzEVeW6l27qG5XSOmDfDc6a7bmsHrHDcJXPnFVaOwgK1hw75rf24mBFyv9Ct3lbMilytt4KgsafZbbTyLPFD9/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756413681; c=relaxed/simple;
	bh=qRPHO8gQHPajIgEp5/3I9xSjYX/5pOJwwHV0hLSlH9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Gi5gye5t/n/GdpZ8oPre3Xv5ukjTO5totBwIMkcMF+FF6B81ufyXqxJOku0LNuzgOLV2fzm+GcxxmvZEbP4btrxu2MCDDKiqceUpQMbeMTMbykc7UeXk38bJZsjtja7hgvOqldPDxOldJRnGHQynSwNFyNoGAdXNJmzadMi2WG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=o2ZiUAbI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756413675;
	bh=Yk18VGt9D/krkaodUFdxaxLjsonJGEItT9n7h9+3A74=;
	h=Date:From:To:Cc:Subject:From;
	b=o2ZiUAbIV62Mb9EgzgpwF+ITKw0mEk9qJbjHB+af0vCdAJdT8yv2T/E3b68eRNzgK
	 zTMHwiZ26cduFacE2AVhLAyyF+d14iZM7n0awNFx7yuq2rYl+KbEKkFmyp0YhNclG0
	 9KNkVRorQRHDFPnkNOjQWDBgEWFwZRQD2cpjXc8t/x2FmijDHcEH7jz6veb2UE/UiR
	 ZpG6itIiMpL3m60QecjIKw5er5bLAMhpw/9IWFQLrZPAzwlHJwhzY9XY0htePrBteR
	 Cn2jMXijPdp0NIXMJh4vsvcvobqNmbXNxFpDRsJF/f12523WPTkHdMP0fW4W+FeOO/
	 5FcVh3wtfMZ4Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cCYG31X73z4wb0;
	Fri, 29 Aug 2025 06:41:14 +1000 (AEST)
Date: Fri, 29 Aug 2025 06:41:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the slab tree
Message-ID: <20250829064114.3d633180@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.bKy3s08UcL_C+kMMdGgKUi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.bKy3s08UcL_C+kMMdGgKUi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  8c7b8666cf53 ("locking/local_lock: Expose dep_map in local_trylock_t.")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/.bKy3s08UcL_C+kMMdGgKUi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiwvuoACgkQAVBC80lX
0Gzp9gf/XKgl4CtSjdkrG11s1yMY9bWwHlM9rsJ1hSyHjGn3BDgHRxlrOErcItok
LzkUX3iMZ6SWH/xRR5mhA9Pb6i2dS87KaaN+yWXl+dcgwqL9xho2NmAphavdkHd0
8TPVHVagWxj7L507g2tpbJTRHrWuTzei7Spm5tENR8FghSRVtgmYThS0eTC30Ro1
eKCLngmizjC1z+hVOcFZhRdQxlFmWkLPyg95OGEc9yDDZIGmeTYl1tmZIz87N7w5
Pj/Rhd2NUW8MnYsTiapUU4GqvfKgNVIG7ERqwsWev3sLkoIMERC25HvP4fvrGTfG
w8Lj6uvZIHr+aoCwAU53PGOpSK9+SA==
=N5XW
-----END PGP SIGNATURE-----

--Sig_/.bKy3s08UcL_C+kMMdGgKUi--

