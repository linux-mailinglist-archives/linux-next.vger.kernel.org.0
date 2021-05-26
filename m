Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A576390F9B
	for <lists+linux-next@lfdr.de>; Wed, 26 May 2021 06:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhEZEdz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 May 2021 00:33:55 -0400
Received: from ozlabs.org ([203.11.71.1]:59225 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229522AbhEZEdz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 May 2021 00:33:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FqdMn0J7mz9s1l;
        Wed, 26 May 2021 14:32:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622003541;
        bh=iRliBSzmw7J/OP5tc7g9DslWFGtZnkpfvgpSiPxkZ7E=;
        h=Date:From:To:Cc:Subject:From;
        b=r+j5tVYfPaf4ZYYtq4vKXVi1g/itP2N33Iwprb6LTKmj/Qw85tA8DhfKmmNBRB6dT
         8MXoyAHRAJT9vOx8Nq6LxJumuy4E1eAIGxDvfhzyybjImY6VjyTea9yIkZ4Cnk/XYW
         DdiS/reEfJn8Tz1XJPefitUxgj347feL6+EhCL93FMO5WObCBNK+qdlW38oVjqztfq
         RHLPIVIMs5C/ab/BMDHfDoGN+cZHFU9Ah0AHNVUOhrDwc6wYaNz5hxxQ8ETxmGnRSt
         H2ewF58vID2fc5Fq/crlGz0uuvGA7MSHOeTI+FDc0LbePOmHe8qJbp/b75PPGL+zs9
         v1avfDSDbC6mQ==
Date:   Wed, 26 May 2021 14:32:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Alexey Gladkov <legion@kernel.org>,
        Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the userns tree with Linus' tree
Message-ID: <20210526143219.02af1625@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_gzXKJZkTnDnYYN4D1bQngJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_gzXKJZkTnDnYYN4D1bQngJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the userns tree got a conflict in:

  include/linux/sched/user.h

between commit:

  5b8fea65d197 ("fanotify: configurable limits via sysfs")

from Linus' tree and commits:

  21d1c5e386bc ("Reimplement RLIMIT_NPROC on top of ucounts")
  d64696905554 ("Reimplement RLIMIT_SIGPENDING on top of ucounts")

from the userns tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/sched/user.h
index 3632c5d6ec55,82bd2532da6b..000000000000
--- a/include/linux/sched/user.h
+++ b/include/linux/sched/user.h
@@@ -12,8 -12,9 +12,6 @@@
   */
  struct user_struct {
  	refcount_t __count;	/* reference count */
- 	atomic_t processes;	/* How many processes does this user have? */
- 	atomic_t sigpending;	/* How many pending signals does this user have? */
 -#ifdef CONFIG_FANOTIFY
 -	atomic_t fanotify_listeners;
 -#endif
  #ifdef CONFIG_EPOLL
  	atomic_long_t epoll_watches; /* The number of file descriptors currently=
 watched */
  #endif

--Sig_/_gzXKJZkTnDnYYN4D1bQngJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCtz1MACgkQAVBC80lX
0GzQygf/cwVyqBnkCStGAx85fqRGD1qYQD963lvOByqGFulOlKPpmTAZECYKjxm+
3V2zo1wrpYM99oSj/Q0efIv77EwIp1sf0K07mTldkIMZjPf2n5DxPoApmR0PvxFx
WebU7e+WdgXbZMtqrhvnXZ7S8JHmWe/4HtxWHASOv8SxpvohtqCSA6OnoadndSNj
X5kTLQpQVLxdNW0rtTpaPZfpAD3Jr6necNsRQnyYtb/6Td1EjuQkLA4uNMHBjOCm
iGk76fsqbwNjnW8KoZvAuwCDOBgncOdRAnj5aEu06PHevdeV5seTKYoysH/Fr4zo
VzBWXeXVIAd+iZzKsDNzGfQwl7BEEQ==
=n3PA
-----END PGP SIGNATURE-----

--Sig_/_gzXKJZkTnDnYYN4D1bQngJ--
