Return-Path: <linux-next+bounces-3258-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 091AD94B5B2
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 05:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 804081F2363D
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 03:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706A112FB37;
	Thu,  8 Aug 2024 03:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e0SpYyyc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EFB7D3F1;
	Thu,  8 Aug 2024 03:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723089522; cv=none; b=W3WEIg/zVoZJwjUPTXxjnh/Fmt+IWZoWKh00BMcbOeOMM0+3KbGyIQdkLjqDnk0Ob6XKoPlnBH3yA6NLRHtF3eM3SzfphEB12pQyZn6V39zzeqzZ6nIE7XU8tbyLaQBKGlY0Vff2dUWWzMXWoyZm75OVSeYmpWld7QAxGkc2rFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723089522; c=relaxed/simple;
	bh=vJY59zBCJw3KDsmjm4CdnwtPss4yedSaqTtaW4O6nvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Mhz2PQd68yUIJvkIWnufLOdpFqMn+i4CHMmH+uqezYukK6TZPxEarr2Lo7qQVCffdod31GeznPwh9ymSJIYoAQzMQTF0ZZ4o7u/qNXQ0DSyGqQX5l6rr69FadM8YvUYUZTBhfhlnlKXJKz7v2meeVzXu+rX/wbNG4QmQifGCUCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e0SpYyyc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723089517;
	bh=wGIGZ80trm6iOZCYJunvn40iI28sdFGMuWXzI4QjzJ0=;
	h=Date:From:To:Cc:Subject:From;
	b=e0SpYyycTIaSYQLTxiD5RVxOsdEq/UWlQmn3t0GLvvwcWx1LqRi3gWvAjvCSPWC79
	 Dx+K/4p6yHvnWWlUWROcqtdnGIgOVBpMHQpQvNAi9/DUoOObzhMdkHbreqN6HNtpoq
	 Oa0VFvX9iFatoUr1QyfR4i1mh3U+/dSBmS4IN7ikyO3jbJBA6vlhs0afbBg3N9QNkV
	 lAKuILMSuDYp/vT+xRznMxE/SrMJ5kxbPECyLi7SeJ/xHpczG5YDpvxFnsr1+A92zK
	 K8KtT+RDi6fmhUVJtCAUBQqRrIls1R2BpLShzuGfzfensJgJv+3V71YCuSJXlbDd2o
	 awcQulz4mP47A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WfYDs2HN9z4wc3;
	Thu,  8 Aug 2024 13:58:37 +1000 (AEST)
Date: Thu, 8 Aug 2024 13:58:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the s390 tree
Message-ID: <20240808135836.740effac@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OJOy.6CHNQZrdZKVIj_1pSu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OJOy.6CHNQZrdZKVIj_1pSu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the s390 tree, today's linux-next build (s390 defconfig)
failed like this:

In file included from include/linux/percpu.h:5,
                 from include/linux/percpu_counter.h:14,
                 from include/linux/mm_types.h:21,
                 from include/linux/ptdump.h:6,
                 from arch/s390/mm/dump_pagetables.c:3:
arch/s390/mm/dump_pagetables.c: In function 'add_marker':
include/linux/slab.h:848:61: error: too many arguments to function 'kvreall=
oc_noprof'
  848 | #define kvrealloc(...)                          alloc_hooks(kvreall=
oc_noprof(__VA_ARGS__))
      |                                                             ^~~~~~~=
~~~~~~~~~
include/linux/alloc_tag.h:206:16: note: in definition of macro 'alloc_hooks=
_tag'
  206 |         typeof(_do_alloc) _res =3D _do_alloc;                      =
       \
      |                ^~~~~~~~~
include/linux/slab.h:848:49: note: in expansion of macro 'alloc_hooks'
  848 | #define kvrealloc(...)                          alloc_hooks(kvreall=
oc_noprof(__VA_ARGS__))
      |                                                 ^~~~~~~~~~~
arch/s390/mm/dump_pagetables.c:259:27: note: in expansion of macro 'kvreall=
oc'
  259 |                 markers =3D kvrealloc(markers, oldsize, newsize, GF=
P_KERNEL);
      |                           ^~~~~~~~~
In file included from include/linux/fs.h:45,
                 from include/linux/seq_file.h:11,
                 from arch/s390/mm/dump_pagetables.c:4:
include/linux/slab.h:846:7: note: declared here
  846 | void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
      |       ^~~~~~~~~~~~~~~~
include/linux/slab.h:848:61: error: too many arguments to function 'kvreall=
oc_noprof'
  848 | #define kvrealloc(...)                          alloc_hooks(kvreall=
oc_noprof(__VA_ARGS__))
      |                                                             ^~~~~~~=
~~~~~~~~~
include/linux/alloc_tag.h:206:34: note: in definition of macro 'alloc_hooks=
_tag'
  206 |         typeof(_do_alloc) _res =3D _do_alloc;                      =
       \
      |                                  ^~~~~~~~~
include/linux/slab.h:848:49: note: in expansion of macro 'alloc_hooks'
  848 | #define kvrealloc(...)                          alloc_hooks(kvreall=
oc_noprof(__VA_ARGS__))
      |                                                 ^~~~~~~~~~~
arch/s390/mm/dump_pagetables.c:259:27: note: in expansion of macro 'kvreall=
oc'
  259 |                 markers =3D kvrealloc(markers, oldsize, newsize, GF=
P_KERNEL);
      |                           ^~~~~~~~~
include/linux/slab.h:846:7: note: declared here
  846 | void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
      |       ^~~~~~~~~~~~~~~~

Caused by commit

  d0e7915d2ad3 ("s390/mm/ptdump: Generate address marker array dynamically")

interacting with commit

  d4a913add37d ("mm: kvmalloc: align kvrealloc() with krealloc()")

from the mm-unstable branch of the mm tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 8 Aug 2024 13:50:39 +1000
Subject: [PATCH] fixup for "s390/mm/ptdump: Generate address marker array d=
ynamically"

interacting with "mm: kvmalloc: align kvrealloc() with krealloc()"
from the mm tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/s390/mm/dump_pagetables.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/mm/dump_pagetables.c b/arch/s390/mm/dump_pagetables.c
index 9e2dc42143b3..fa54f3bc0c8d 100644
--- a/arch/s390/mm/dump_pagetables.c
+++ b/arch/s390/mm/dump_pagetables.c
@@ -256,7 +256,7 @@ static int add_marker(unsigned long start, unsigned lon=
g end, const char *name)
 	if (!oldsize)
 		markers =3D kvmalloc(newsize, GFP_KERNEL);
 	else
-		markers =3D kvrealloc(markers, oldsize, newsize, GFP_KERNEL);
+		markers =3D kvrealloc(markers, newsize, GFP_KERNEL);
 	if (!markers)
 		goto error;
 	markers[markers_cnt].is_start =3D 1;
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/OJOy.6CHNQZrdZKVIj_1pSu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma0QmwACgkQAVBC80lX
0GyeNwgAjGlH1excgkJqP1BVOOLHMEVQQ3N4iTO8tDtET7c2GXx9QTFSwider85+
DbMamh+oyhkx65MSkMki59Noga+flc61khSgCjjs0Itsa9vkIprv6YmyNhHP3FCj
4QI1t6EPr082JEKLKomvrRJu4PkgtbPbGIV232c/YP5j7+h3aYdlP+zagOgkagG9
sX8icBH1rBi+JkoFwm5a1czCaoxcHbzUuEs4VJWQNXeNipyWR5a6vAK3zrDoEUTg
zonBcqeoLjYtDCUq0SoOnjlmz+ZbD474wvSpzd8S3FxNbLEtYb1S/ZQNmFTqaN4x
TlPK/DqYSiVaUsk+cjxC+ABchFtyrA==
=GlRW
-----END PGP SIGNATURE-----

--Sig_/OJOy.6CHNQZrdZKVIj_1pSu--

