Return-Path: <linux-next+bounces-4208-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 999ED997FBF
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 10:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24875B2367D
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 08:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5731FBCA4;
	Thu, 10 Oct 2024 07:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oVa0KA5/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56C81C5796;
	Thu, 10 Oct 2024 07:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728546286; cv=none; b=WS2wlJd7mtwwvmWbvVkVL3viO6mfxhZ4spsVbhsDfRzaJCMpcnqb6NZSylpFjmyEoET3ANAVU/h+1WnQu64ZHmAX4y2BdtrV7Siu6MUqUlugZGzIKoe2YirI3DUPZg5oB3Mvs6UuRInGjsXrTHlHTssXVqj4wuRpdl7Dws4NkQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728546286; c=relaxed/simple;
	bh=9y7cxzKYMVtl+pGbPH1Hg4lL7cQy5WotXAZh0Lw6Q7A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EKQm5AZ/vfmd/HYOBYJ/Z8V45eyQjMMf1xl/ltVmKPoHRD8M/pbGheZ//R0t1A+1as/u5+wGV5QXb8vuuFeaEaBavCAbbt/BNnjK+Vnp7ZELsZcMLS4DEJbVjCmOXKN5tA07i5phpdQkfPf1CH79NsUjdSS5zQl2T5+xch8C9uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oVa0KA5/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728546278;
	bh=K/AD73DuUdch8HGxphzMDTsYOFAtNv/gN1rgFYgMX9o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oVa0KA5/iPAs2wNEXWzs7QCZdQ/liIhCR8mFQL6EsVglg4tjpJF4PhBEv63NARepP
	 LPciUxXUovoXWTES2ih6wgIYSvs/6mi3xtLwKiLtpFKMzhK8fcN8X+5PtpXnDcJbM1
	 BQTpiQT0m/mxdKLnT/VDZfpctYX0s0whpVFuAtHbuIWdirIhUf7n9c7XBGqECY74Es
	 63vp3ZFsHaGpnuXkx3kCDI4EQufWxoXJhEcBLfKGWXv+NYXRGbyw6twIKwdSg/DmwN
	 w5mh5LWEGBtqYpktN8idoQVm2Q2VUZK8RIfH22qntS9MIO6vwjiAxJ570quwBr0uqj
	 QrFcBb+bxgL/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPMGZ0WyLz4wd0;
	Thu, 10 Oct 2024 18:44:38 +1100 (AEDT)
Date: Thu, 10 Oct 2024 18:44:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michal Hocko
 <mhocko@suse.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bcachefs tree
Message-ID: <20241010184437.5d8e7f8d@canb.auug.org.au>
In-Reply-To: <xwlm6pc32uhs6qzbscwbeiuyvqsuxtqsku2eztkzlvwlgse5qc@2r2vlkksohwj>
References: <20240927104628.2ca6ad07@canb.auug.org.au>
	<20241010165018.47b3fe1d@canb.auug.org.au>
	<xwlm6pc32uhs6qzbscwbeiuyvqsuxtqsku2eztkzlvwlgse5qc@2r2vlkksohwj>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E1UQs7VmFtMi2f=lZ1mDLzt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/E1UQs7VmFtMi2f=lZ1mDLzt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kent,

On Thu, 10 Oct 2024 02:10:13 -0400 Kent Overstreet <kent.overstreet@linux.d=
ev> wrote:
>
> That's been dropped from my tree...

Good to know.  I will drop the revert of the revert.

--=20
Cheers,
Stephen Rothwell

--Sig_/E1UQs7VmFtMi2f=lZ1mDLzt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcHheUACgkQAVBC80lX
0GzW4ggAj9BjYQ6kL/Fxpz/nlXYX4jBDOkMXO7zcFo6HdL8x9qgVpcxZppbt/VpG
LTdv9PfTFGP2NwUFeFFteuKhafGtgaL5mM9uD8hnBCiSlD7FfPyE1+fv485IfemW
sSs48QMl9rIQdWI/bi21qXMXlSZooV5wuEWRaE/CT+e1nSR+oZgEYSUYgg2VxYLg
1THgWTot55jOdDed0aMWQoiDfg1i0jdrEMSPkpS1elKhTeEFH++OYnBiYIZW7uiH
1wxwIADhXlfBwFkpguVzy5Hyzknk3yXApLHikb284b1Zz79uFwzhSkjXJrQ0HVk6
Tinmpox9IXooNFFnsZNyf0mIahl5vA==
=PyGz
-----END PGP SIGNATURE-----

--Sig_/E1UQs7VmFtMi2f=lZ1mDLzt--

