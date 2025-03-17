Return-Path: <linux-next+bounces-5836-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D122A6602A
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 22:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 700541892008
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 21:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932AE1F5852;
	Mon, 17 Mar 2025 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PqjKNESz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B221B393A;
	Mon, 17 Mar 2025 21:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742245801; cv=none; b=CWGei4uZaFHMcoJkhcr+ZuYO81LDx9OVL3mctK2IcEB/chbPZBsUkTRH3Z3D5gOoKqt3Tq01NNtQ27TRHNls+nmGuJaWuIilMW2V+rvd7CFpvjjbz/7RTas0BUCQbNay0O93P4eDIQ/+f5waae+JX4aHm+0tmy6KhXlvbhqhyZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742245801; c=relaxed/simple;
	bh=RV4zKHuWdRwFrOoGAOvvfhFQFF/Jzow9rIzlvPpUUjs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aNrKxEWi4VPrfdcQCUpWxO/hJY72f3edcsQ0gj8zTAmPweOqEPnZ4hlvVGGgD9ZPUVn99401NQYl4W8Fuzps854f+AkIRPOl5LpUHFtOQCv/YGSBUu4TdDFwxa69rz9GU7UbBIN/Ly3TUmqUfNpnrQYiqosXNMyZpYzCjioCZww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PqjKNESz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742245793;
	bh=HWJgiIhzJR50/ZGvS8R6AHJ6tWeVJoPnp8wm7ibd6g4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PqjKNESz/JMeILtnxZvMVLT1LGl/tCPVUfXfggag8g6Jpe+rY2JOjNnoBIk+wDh8c
	 wk0bcpwFHGT1QhoEdEVfiGSk0Y6jqfW89+eozgO1YwsmQEQfe6nvmlHia3iyTYN6kE
	 UslF894CxHfrxx+UX2WHZIpExnLDmNw1lo8SFLwktDM5ak6fwKHtZaEr/hDDnJ0VUk
	 gOgOLoyPO90qZg2JRJi4hZnlim8lSzg+CkrY9DW9Laq83FSFlcFyPji1genOWsrvbO
	 KeupUD+YAtBEN7xhGSsz9NzqImemn4NsDAqALklzMGtVuInwg3X/udRHHkZ21kMnAC
	 3hESwlZHJ66Iw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGnfn3LWRz4xCy;
	Tue, 18 Mar 2025 08:09:53 +1100 (AEDT)
Date: Tue, 18 Mar 2025 08:09:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the ext4 tree
Message-ID: <20250318080951.71772135@canb.auug.org.au>
In-Reply-To: <20250318000658.29a791b4@canb.auug.org.au>
References: <20250318000658.29a791b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TLYwLWuBjI22vqvc8uVuc.p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TLYwLWuBjI22vqvc8uVuc.p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 18 Mar 2025 00:06:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Commits
>=20
>   400bb71a00da ("ext4: fix out-of-bound read in ext4_xattr_inode_dec_ref_=
all()")
>   4d6eb75d2364 ("ext4: introduce ITAIL helper")
>=20
> are missing a Signed-off-by from their committer.

These are now commits

  850d8d9ff97a ("ext4: fix out-of-bound read in ext4_xattr_inode_dec_ref_al=
l()")
  8bffe40e9e9c ("ext4: introduce ITAIL helper")

--=20
Cheers,
Stephen Rothwell

--Sig_/TLYwLWuBjI22vqvc8uVuc.p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYj58ACgkQAVBC80lX
0Gwj9Qf9EOQ1HjQA2wp2+lwy3IrVd9FmapKSscm5TEgNad3kAgHBeu9ZC29l/ZGy
R5k/U4KUMSsVE78dc9XLPhpQTqgN9lDJl9QjYl23NZUTvmLGGmP6GidMwIesm/Rd
9W6K8YHMQnSVD6l8cjLK792E3XszbbTRBxpO98KZbr2wPo2uLon0eaWbDyBBM5Cz
p0uhhyyfVMLpuTdyBf2MKVxxuSAAX+82PHjVQmyOR4Wp/xug7Z5yjALDls+FbLap
ItFXDcd5xOwe+VoCd85fSNqi3D/+tJ8twqxmFTc43rwGpC59tr2d9c+Uw02St7zV
hyMTxeIwpK5sPg/ZeKfVg+yZX74oKw==
=C3b1
-----END PGP SIGNATURE-----

--Sig_/TLYwLWuBjI22vqvc8uVuc.p--

