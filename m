Return-Path: <linux-next+bounces-3439-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE129600CA
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 07:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 653FE1C22296
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 05:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323E14C92;
	Tue, 27 Aug 2024 05:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="O6mLgYfA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03088003F;
	Tue, 27 Aug 2024 05:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724735102; cv=none; b=dPzdO15DV/IvQAIH87e1qo6dVDIx99Eq0vcL40++PbHzKR+BVlyfkvTkq/uPX0RhnTMJ8G56Uk8Q9dUNdwmipDErxhJcsmcb9Zl9OJ07kN2dHvrDFp9M2uuAn8IJSvxdIPmngxK9p74l8je1zuLvGFhc/e/gLlDmM0UZpTtDvhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724735102; c=relaxed/simple;
	bh=U998PSJAVHBi1Z85yV09mYvX6ZmZOAJJCzKtuWHmvP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=W48IeWS3PRdTxS7umwRMVQ7/bFY9yhouM1h8ZxJHlLtL1Do1fnRuT19KCXK0jrhGu68UPUwVv1CjZuM6qBkKCWpk2qsGnNhn4QgI0ElLmh8uLl3W/LE5Mqo4Wy8MSc1H5STcySBh9EWbYGMZf0eb1TQhiZWf/Cmzu6dCQSnejmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=O6mLgYfA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724735095;
	bh=DZvI6+WkgyE9jU5Z9HsYnFDJH+i65tV870q6M2Vw/3s=;
	h=Date:From:To:Cc:Subject:From;
	b=O6mLgYfARYMnlQAYe2lS8VXV9eN8boiD+aPny/oBUc7orxfGXoJ8mUX7JmH8a4xdu
	 S1GuAOvOrbD0yAHtHDMViMt75t0dCG8Vd+8q9qfwYOddSeulb7TYT6R0SMimMQUaRh
	 kVlxWCPtKj4ruFfnLhqX1kP2A7gRexgTcn6+Bu5pJ/MFUPgA1ZzfWWfmdF+eJQIRnd
	 Ps+6jUB+XMB1Son9shWDO5yzFUpxE/VRfbDCMp5M/xW9rpiOMR/PStsnlIx4wuI7hv
	 D1wubDbz8UihquKYbqy76hzU+y2jx3wwymeuUQfCfcw42UFyTQh1tHN6QYAv7InXIx
	 75gWgw5QDivSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtFpZ3y7qz4wxJ;
	Tue, 27 Aug 2024 15:04:54 +1000 (AEST)
Date: Tue, 27 Aug 2024 15:04:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Mike Rapoport <rppt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wei Yang <richard.weiyang@gmail.com>
Subject: linux-next: manual merge of the random tree with the memblock tree
Message-ID: <20240827150453.26bff4c3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pZx=CWpt0io03xA7GxD0BSb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pZx=CWpt0io03xA7GxD0BSb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the random tree got a conflict in:

  tools/include/linux/linkage.h

between commit:

  d68c08173b70 ("memblock tests: include export.h in linkage.h as kernel do=
se")

from the memblock tree and commit:

  9fcce2aaea8a ("selftests/vDSO: fix include order in build of test_vdso_ch=
acha")

from the random tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/include/linux/linkage.h
index 20dee24d7e1b,a48ff086899c..000000000000
--- a/tools/include/linux/linkage.h
+++ b/tools/include/linux/linkage.h
@@@ -1,6 -1,8 +1,10 @@@
  #ifndef _TOOLS_INCLUDE_LINUX_LINKAGE_H
  #define _TOOLS_INCLUDE_LINUX_LINKAGE_H
 =20
 +#include <linux/export.h>
 +
+ #define SYM_FUNC_START(x) .globl x; x:
+=20
+ #define SYM_FUNC_END(x)
+=20
  #endif /* _TOOLS_INCLUDE_LINUX_LINKAGE_H */

--Sig_/pZx=CWpt0io03xA7GxD0BSb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbNXnUACgkQAVBC80lX
0GxymQf7BIPlmlIot4Iuv1PyzQPHJ57fvgGl5hCfUip5n1xbv+Pcl6EumXiLD+qP
8vHR52Syj3vnpGOolfEZmKc2vg9F+DWEOM1xP3EAAa6Oglh68t5JIkj6TEjpokqb
n54a0gyfbme9CYce4rt8Ozjt7cHbAeePhyh6LuVte57UxdTGhsz+KgaQ2HQtAHRe
Zj+RbsIu80NeH4cHj980Faz9DSFHcyOLmh2abh4TDc8qHcrLXPs3avj12nsd3aQt
Joe4p3zTFB3tHHld0zGxESmGE1c869zWshmCtpJftVLTsbxVzHYxXoQpHLJpDB0n
3oPEH3skeayiypT7upqgCmTzD/Mz/A==
=Zn5m
-----END PGP SIGNATURE-----

--Sig_/pZx=CWpt0io03xA7GxD0BSb--

