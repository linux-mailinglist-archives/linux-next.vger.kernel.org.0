Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57A0C43BD17
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 00:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235479AbhJZWTc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 18:19:32 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37243 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232718AbhJZWTc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 18:19:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hf5lk1nJQz4xbr;
        Wed, 27 Oct 2021 09:17:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635286626;
        bh=DvdDyr1TSw29nQTLtvEiazqeBjIwNYSuHPpJlfGEoCY=;
        h=Date:From:To:Cc:Subject:From;
        b=n2/BJYKcPjybhAUKO37IQSaz7J83pvB/SwZs6cl9OgyBxor3zosIyqwBx98IzkvsU
         2H3688FW4Fa23KDTtaaJWXksz2jUSMotiyv31auhrQIYL4FXxIZ+RKQjO6l38j0pi5
         +v20KfWtaCwY0k9toW+Cz2+JBksNLaHTYVYbRWVS4TZo7ET9LlvT/ntejdREsZZ0tb
         7pEwdOMaOcFJCGpsxfigYKZPIGPfvLBYnD+bvUs53klf4IalPeiIyXElJpdIjVViiL
         Z88G3+1HaX3+ScsiP9fw3jTR0qw1ZynabCfCmbJ8aG3lHhynv4fW6dJTU5HmNXoPow
         HmbVIAg7gh0BQ==
Date:   Wed, 27 Oct 2021 09:17:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc:     Alexey Bayduraev <alexey.v.bayduraev@linux.intel.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the perf tree with Linus' tree
Message-ID: <20211027091705.1e24694e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kl_5tiGQv+HiJPXr+ZJU55F";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Kl_5tiGQv+HiJPXr+ZJU55F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the perf tree got a conflict in:

  tools/perf/util/session.c

between commit:

  8e820f962345 ("perf report: Output non-zero offset for decompressed recor=
ds")

from Linus' tree and commit:

  3a3535e67dfd ("perf session: Introduce decompressor in reader object")

from the perf tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/perf/util/session.c
index 352f16076e01,51bf2efceb7f..000000000000
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@@ -2116,8 -2122,8 +2122,8 @@@ fetch_decomp_event(u64 head, size_t mma
  static int __perf_session__process_decomp_events(struct perf_session *ses=
sion)
  {
  	s64 skip;
 -	u64 size, file_pos =3D 0;
 +	u64 size;
- 	struct decomp *decomp =3D session->decomp_last;
+ 	struct decomp *decomp =3D session->active_decomp->decomp_last;
 =20
  	if (!decomp)
  		return 0;

--Sig_/Kl_5tiGQv+HiJPXr+ZJU55F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF4fmEACgkQAVBC80lX
0GzPhAf/VnPGdVKrtXZYojHLnBzKwujiu9p9U4mTytgNrMo+1eFdNT4KphKH/61I
3YjN3ZmV7YBQpkxXP7qdqDmTbasaZSDwK1U3wBlOSjsT+CU7jzQcZcuLB86k59ED
K4xdj4w5dwYffgY2PRdOKjao1x5Wwp2vCGkGZ3RwNRnVlxdBSCBXwX24c5VbEtxa
Hb2IJWQav9wsqCNTOcUZI4Xj/17Iy5RCTQ7quqVmbefq6SXseVOP4CmTqr7KGeZI
dwPtGVPQuaaa8WWslZNQSPYPESVR61HRJILsIcUZxeDH3MtRInivw3T1NVlMk0nj
Q0h9RLkdzZ7hZkCBnmwEM+RF0qBSYw==
=rZVn
-----END PGP SIGNATURE-----

--Sig_/Kl_5tiGQv+HiJPXr+ZJU55F--
