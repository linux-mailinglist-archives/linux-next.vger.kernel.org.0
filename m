Return-Path: <linux-next+bounces-4458-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0A49B20F4
	for <lists+linux-next@lfdr.de>; Sun, 27 Oct 2024 23:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFE5E28145C
	for <lists+linux-next@lfdr.de>; Sun, 27 Oct 2024 22:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B4217C7C4;
	Sun, 27 Oct 2024 22:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CCkYOVWA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3402027442;
	Sun, 27 Oct 2024 22:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730066618; cv=none; b=NgwBf4vc+UOjlUgKSim+7+rj/wd1AjzVW5Bs6PCXboQK1O9zeAwUBb8T6h9HCUXv9dRXrDmdYDUBru6lqGHBZlPBJFMjE2SNuKO5LSGB5rtSR+4Tq8/U2Vy98eRIkJkPhz/yaqL3MA7/CTmmeF8AvZTkSe1XbNHJ25+i2Ob7O4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730066618; c=relaxed/simple;
	bh=miWLG9iPjtu/kB6NfUmmP2/eXMw1Lg9qaDwf9fDKFxs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hhKqTJkCiDIzBkvA7U9mf3Hm9nVidZCLuXtn/dBNBNbM5E8q+6C1dA807nIE9p9YQwdS43UjQ8n/wH16aIPbYtZI0RBaHD0MiwvkT+MywoVHX1j7q+IogXp2Boy7Zi2pJf3ent1uhJVIAwP8ZrYvShVitfsuS3xnjx2vAWeHthY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CCkYOVWA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730066610;
	bh=VABkq4kqvIF7ClrQLCfLUplMykbAairViTQuKNQyz1U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CCkYOVWA2D/5NYYsvzYeMNFPrIZeOf8qOeuMJ67Q8kubxz0N14FSis5HGo6Gnjcsb
	 ZV1Zt7XjAFfn9/G3ldLORTLnbes4t26hJrWZncudc3BRV4m/94PxOVK6Ddjs4PCmLo
	 411y159fzL2oLKnLv20YattfKc24YUAMThSguiZySBuYGli+sBF1kqjOXncEZsjxtK
	 M8fxbS8DZoF91WpVd8xaoS2tNQpCNl6E8pnD49FBAfeHF5K6PbSBAuxkL+0W4OW8tS
	 gANF1XzjisQSeZzlLB8neRNnLrd4GYNrcL9JElTku8ybbnTgK4HsYH2VxxhYtsGwWD
	 1/eYbsVkN4SUA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xc9Wk10DKz4wbR;
	Mon, 28 Oct 2024 09:03:29 +1100 (AEDT)
Date: Mon, 28 Oct 2024 09:03:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Message-ID: <20241028090330.2e16fb3a@canb.auug.org.au>
In-Reply-To: <20241024085701.64263a3b@canb.auug.org.au>
References: <20241024085701.64263a3b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AePrdpW3RpdTFJ_LZ9KqkJQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AePrdpW3RpdTFJ_LZ9KqkJQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 24 Oct 2024 08:57:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the btrfs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> fs/btrfs/super.c: In function 'btrfs_reconfigure_for_mount':
> fs/btrfs/super.c:2011:56: error: suggest parentheses around '&&' within '=
||' [-Werror=3Dparentheses]
>  2011 |         if (!fc->oldapi || !(fc->sb_flags & SB_RDONLY) && (mnt->m=
nt_sb->s_flags & SB_RDONLY))
>       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>=20
> Caused by commit
>=20
>   4642e430c55b ("btrfs: fix mount failure due to remount races")
>=20
> I have used the btrfs tree from next-20241023 for today.

I am still seeing this failure.
--=20
Cheers,
Stephen Rothwell

--Sig_/AePrdpW3RpdTFJ_LZ9KqkJQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmceuLIACgkQAVBC80lX
0GzOOwf+Jn3AM5vK5aIF16tmkKZV/CDbxjYeMrMe/nNw77oWZZnuE+mxWIXvtj9g
2fPz60J3E/4uKTsIb3wVO8gCCcb3OkaI9w4wLr4egueu93JWwgGIvNGKfINS+XjC
kzyu26VM34l+1kS9km+k2+3qN/OOA9A+iLo5Q2K0iT1An3JlToRpoodzIlKVx8je
NdlWqhDrzsYBBzokyZfu6jPOVxzwg7PtWbFVoO2YLVsHgQfrCH9F0FPMIAGj/tBj
rRcMB+eqrcKOKcweKXMpPWr0SqLxxu1pcpLARyh5VLVOpu7etruXO1335oiEjYFL
rSZ5kj0s5a3sjn2OXGV1VSoPbXAOQw==
=WHcw
-----END PGP SIGNATURE-----

--Sig_/AePrdpW3RpdTFJ_LZ9KqkJQ--

