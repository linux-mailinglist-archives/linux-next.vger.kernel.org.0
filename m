Return-Path: <linux-next+bounces-2751-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D0A91D9ED
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 10:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A6E282766
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 08:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FCA824AE;
	Mon,  1 Jul 2024 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D+8/mzLa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E966824AF;
	Mon,  1 Jul 2024 08:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719822516; cv=none; b=H4niZdIXFtX+uxRE08lhRoJMKjoszrbFhiWIwzYHsCYD3mTwGLY4DSsmA7JladW1C3ztozRUIjpgNUZyjy4WRbqq3agPAIvcZoRxpneIArWzdDJGlcKczXMEkNdTRxBFGtsCHx19pnxtj8cv5QAuNycXXYcx3VEdEPVhk+WMxgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719822516; c=relaxed/simple;
	bh=s2fBiJyREcC4i9H08i5WrySqxNVK3cYGRob83QSf9eE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ICUo659GANLzdWRenGpM6qSATf6/7r/wl08JszK+rCmAIUlZw5SqesInJA566r30dFpsWvBNtBhVARZNcJUb1j8bmeTjglhqJIL0kOuAtDu2xkXOSOmOOstYUPugEZlV+3rvo2ia8hhBf7Cw4SYN1yjdoUy6bV4gxV2g3+qDKc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D+8/mzLa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719822511;
	bh=3hsbIPaDjys+Ehj+HX+kZMbDeNv4mL+sLfHc4C1dJ2k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D+8/mzLa5pr+4DyV01i4Jw16nzMl92X2WjF/o8ViHF4EegxePPmlTo4mHZX/iS1uL
	 lQ6jNgOZFaHVEAhAbiBI5u29XUKUY5hYYZAc8Q+xYreeFCJRxCUZ6pERWDAT5xUA9h
	 fn/l2n1oCrIApkyyb7vX8Zp9ikKIJiGEDtHHn0JpWXjJZ63utolSZvpUzrVnXHsmEj
	 l0KoZRiVfxhENLKABohEtJ+RzvPPeV3LSFsxiZa7Di2XBSn0c8mOLiGrL1yB4GIB7X
	 77mAWIi9RLmFdcn489+oQdpq8qgJVpKf/EFzPqtexDIyZ11ZuSxCWmOiievFtHrK89
	 1XGYLkqC19RvA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCK1q46VPz4wc1;
	Mon,  1 Jul 2024 18:28:31 +1000 (AEST)
Date: Mon, 1 Jul 2024 18:28:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrii Nakryiko <andrii@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the mm tree
Message-ID: <20240701182830.0fd1950c@canb.auug.org.au>
In-Reply-To: <20240701110113.1248c8c2@canb.auug.org.au>
References: <20240701110113.1248c8c2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7sKor7V.xBnoUCqxgNiNO0d";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7sKor7V.xBnoUCqxgNiNO0d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 1 Jul 2024 11:01:13 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the mm tree, today's linux-next build (arm
> multi_v7_defconfig) produced these warnings:
>=20
> fs/proc/task_mmu.c: In function 'do_procmap_query':
> fs/proc/task_mmu.c:598:48: warning: cast to pointer from integer of diffe=
rent size [-Wint-to-pointer-cast]
>   598 |         if (karg.vma_name_size && copy_to_user((void __user *)kar=
g.vma_name_addr,
>       |                                                ^
> fs/proc/task_mmu.c:605:48: warning: cast to pointer from integer of diffe=
rent size [-Wint-to-pointer-cast]
>   605 |         if (karg.build_id_size && copy_to_user((void __user *)kar=
g.build_id_addr,
>       |                                                ^
>=20
> Introduced by commits
>=20
>   3757be498749 ("fs/procfs: implement efficient VMA querying API for /pro=
c/<pid>/maps")
>   df789ce1eb90 ("fs/procfs: add build ID fetching to PROCMAP_QUERY API")

This became a build failure in my i386 defconfig build, so I applied
Andrii's patch.
--=20
Cheers,
Stephen Rothwell

--Sig_/7sKor7V.xBnoUCqxgNiNO0d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCaK4ACgkQAVBC80lX
0GzJFggAn28rsNTouJwd+khjs5Izuu8CupaaZEARMxKPl/7YpYq5KjwmVcfzARXz
hkdDTI+RXkXMoysUHQB4t2VyhhKQAlOu8sIMKD8vZYDYPxs8TPiQm9FnmQ6ldOG+
KDlfLCM/dALKHl7ATNlvQjfxLnUxPE0x6cGevwZoapuBVky9LWbR6jt3MGZ3DLnK
GY3P45/j791dGui6J5tX1Gjh6d2yH8McDP3bS83yMt8GZeBAywhJaptHl+UtVasU
052UJfvehaLqlPxOA4gXWecKuwONu1qXCDQK90mrdw39opbfAwzONeLhEuM9rlY8
Re53ozErzIHI9GdRPRNiU/iZ54GM/A==
=lTjr
-----END PGP SIGNATURE-----

--Sig_/7sKor7V.xBnoUCqxgNiNO0d--

