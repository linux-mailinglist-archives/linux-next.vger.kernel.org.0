Return-Path: <linux-next+bounces-7535-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E80B04A84
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 00:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05FEC166FB3
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 22:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E6C277CB3;
	Mon, 14 Jul 2025 22:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kewX7Vd8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13707277035;
	Mon, 14 Jul 2025 22:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752531757; cv=none; b=UNSFoXUMqABQDhekkCvHiugOMh1oVyWSQ3kaNuKgct7Hq+yZ3TsqGkq+AaeTSw5fRZI8HDiXLMzOuybYjTg4aGx0ws+21eBC4aPXp3eYZz08YRS/eEch9KG1FbZtfzDaZp+F/hp3YhCwXQjIyz4MqgGMw4dicvHbaOlkOCy5EXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752531757; c=relaxed/simple;
	bh=H/rUtKlTuPgoSauFrLhwQiEJfb+OwWO5jy25yqbUZMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mpPys+WLXhslKCd1NGGsRN4GHRMaOivv400EhSbl9/Dlm310Zo6HLI/YBb+yh4NmgC5DF2P3yw2sswpG99dWdpdyHB0iijxBTfx+1bGMsRYYBQPNBuq/j9251gvDz6iPEGIlhOtWq9ghB16S5DKJGvADQJKFOFfG5sPrqe/p3ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kewX7Vd8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752531646;
	bh=eBpqteH/pBpzNfMhDYDJvCnUUzJdriSw6w0u6InNYpM=;
	h=Date:From:To:Cc:Subject:From;
	b=kewX7Vd8Rc2Y+9XLDfKRJd+Wp5WxywFzDqEw/I/v8MyhKGeuhPBqcGCxXiJLZjNND
	 iRzueZekG1PVODznZ4//ZS0aSt3ImWHRSip2w7hReJlcmIp62cGkV78HEsAeHlbD/a
	 Yg2L3SnVJGZ1Xr442g6Wn3t6eOYQML+aQTgIktADntycKcXLo9J/nM8/pvdYiZQIZ/
	 JzfrWlTbFYTYFNFMbTgrJDUOCDSi24J99B55YFcCMVyOcI/7lgezJzlVhlcz0RTNbn
	 rGtj1jH1PpefmrgMWOU+Yl7YtlU7Un33tNWrMrvf4w0udy+KZGI9XujFaq9Yq4hgS7
	 IahsU7HYjqODA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bgxbd4F0mz4w2Q;
	Tue, 15 Jul 2025 08:20:45 +1000 (AEST)
Date: Tue, 15 Jul 2025 08:22:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Zhang Yi <yi.zhang@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ext4 tree
Message-ID: <20250715082230.7f5bcb1e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//n.eiB+mCfh.1hNaJ=V0Ubw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//n.eiB+mCfh.1hNaJ=V0Ubw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ext4 tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from <command-line>:
fs/ext4/inode.c: In function 'ext4_set_inode_mapping_order':
include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert=
_652' declared with attribute error: min(({ __auto_type __UNIQUE_ID_x_647 =
=3D (((0 ? 4 : 6) * 2 - 1)); __auto_type __UNIQUE_ID_y_648 =3D (((16 + __pt=
e_index_size)-16)); do { __attribute__((__noreturn__)) extern void __compil=
etime_assert_649(void) __attribute__((__error__("min""(""((0 ? 4 : 6) * 2 -=
 1)"", ""((16 + __pte_index_size)-16)"") signedness error"))); if (!(!(!(((=
((typeof(__UNIQUE_ID_x_647))(-1)) < ( typeof(__UNIQUE_ID_x_647))1) ? (2 + (=
__builtin_constant_p((long long)(__UNIQUE_ID_x_647) >=3D 0) && ((long long)=
(__UNIQUE_ID_x_647) >=3D 0))) : (1 + 2 * (sizeof(__UNIQUE_ID_x_647) < 4))) =
& ((((typeof(__UNIQUE_ID_y_648))(-1)) < ( typeof(__UNIQUE_ID_y_648))1) ? (2=
 + (__builtin_constant_p((long long)(__UNIQUE_ID_y_648) >=3D 0) && ((long l=
ong)(__UNIQUE_ID_y_648) >=3D 0))) : (1 + 2 * (sizeof(__UNIQUE_ID_y_648) < 4=
))))))) __compiletime_assert_649(); } while (0); ((__UNIQUE_ID_x_647) < (__=
UNIQUE_ID_y_648) ? (__UNIQUE_ID_x_647) : (__UNIQUE_ID_y_648)); }), (11 + (i=
node)->i_blkbits - 16)) signedness error
  568 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |                                             ^
include/linux/compiler_types.h:549:25: note: in definition of macro '__comp=
iletime_assert'
  549 |                         prefix ## suffix();                        =
     \
      |                         ^~~~~~
include/linux/compiler_types.h:568:9: note: in expansion of macro '_compile=
time_assert'
  568 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
      |         ^~~~~~~~~~~~~~~~
include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_onc=
e'
   98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y=
_))
      |         ^~~~~~~~~~~~~~~~~~
include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
  105 | #define min(x, y)       __careful_cmp(min, x, y)
      |                         ^~~~~~~~~~~~~
fs/ext4/inode.c:5204:17: note: in expansion of macro 'min'
 5204 |                 min(MAX_PAGECACHE_ORDER, (11 + (i)->i_blkbits - PAG=
E_SHIFT))
      |                 ^~~
fs/ext4/inode.c:5211:39: note: in expansion of macro 'EXT4_MAX_PAGECACHE_OR=
DER'
 5211 |                                       EXT4_MAX_PAGECACHE_ORDER(inod=
e));
      |                                       ^~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  e14bef2a00b5 ("ext4: limit the maximum folio order")

I have used the ext4 tree from next-20250714 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_//n.eiB+mCfh.1hNaJ=V0Ubw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh1gyYACgkQAVBC80lX
0Gx7BAgAhRbz+BPY7I+h/T5keqD4ZQJlQWBgeOdt5KCFpq9s3+KT6SD6U87vjGiO
pzQbFeBY5Va34ZLQvQjTAJm/IgD6D5Dc633wUOCip5B3okfi4U9esQ1ex8vd+lVT
83Goc8bHlgO0Otcomv0gLEDSkVvh7vTuwc8uNWhGosYg1k4Y5gYlMc6ehtXI3yCY
kjyXGVDOcplCsA4Lv4CKhXXNx324yfRZnXbt1Sw5AnFHZxHE9fQmdJXDqDNzxa6o
VWe4ljmfTUecvy2fD7ZIpHOwtuyB1pmn+04piURmZFFmi8Nj9Q/4s29tAyHql3I8
x6DRz7FoTn8QKQoD40Eg7zqiWFtaRQ==
=XQqP
-----END PGP SIGNATURE-----

--Sig_//n.eiB+mCfh.1hNaJ=V0Ubw--

