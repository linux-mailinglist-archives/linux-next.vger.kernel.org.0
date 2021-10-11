Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A024A4286EF
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 08:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234232AbhJKGnH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 02:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhJKGnG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 02:43:06 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3966EC061570;
        Sun, 10 Oct 2021 23:41:07 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HSThc5f8Yz4xbV;
        Mon, 11 Oct 2021 17:41:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633934465;
        bh=LqvuD4D+kOfepT0Wnihi4XbiLrE7R/+cI4dVzIbSY8A=;
        h=Date:From:To:Cc:Subject:From;
        b=tDekxlpR8+wK3w9lEA0fI7+S9b5RLbf4IlPC39vSgN4AmOAx44Uk4XowtiQJwEibO
         DbCJ6K+aZwrVKCHurZC3XkLyv0TPGqUZrpyno7xCC5wIRbi0s1YKKyCg0tY/D3/qRP
         pbkxa0OFagD3mfC7OKWR3dlhxHqAZesnUDYeJYLlqHCKZhazqDVI64xgRUNXemt+Fv
         Xago4VpUv7QLz5TOnkNixQfBOz+azGJd+GT2k82FwFBk13HZTcRrCfcRHshtjXW5sX
         juwnrt8yacamePJ9jo3nvyFg0hbcaJPsx7/wspmJWGq+Tv3ss1bn9eIIv4d5Uc4+U8
         +QAyPbqbFu4rA==
Date:   Mon, 11 Oct 2021 17:41:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: linux-next: manual merge of the akpm-current tree with the userns
 tree
Message-ID: <20211011174103.58413a7b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7Wn0tqi_WrLjsm0io1aaMfX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7Wn0tqi_WrLjsm0io1aaMfX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  kernel/exit.c

between commits:

  d67e03e36161 ("exit: Factor coredump_exit_mm out of exit_mm")
  92307383082d ("coredump:  Don't perform any cleanups before dumping core")

from the userns tree and commit:

  27692e64c49c ("lazy tlb: introduce lazy mm refcount helper functions")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/exit.c
index f702a6a63686,8e7b41702ad6..000000000000
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@@ -480,8 -440,42 +480,8 @@@ static void exit_mm(void
  	if (!mm)
  		return;
  	sync_mm_rss(mm);
 -	/*
 -	 * Serialize with any possible pending coredump.
 -	 * We must hold mmap_lock around checking core_state
 -	 * and clearing tsk->mm.  The core-inducing thread
 -	 * will increment ->nr_threads for each thread in the
 -	 * group with ->mm !=3D NULL.
 -	 */
  	mmap_read_lock(mm);
- 	mmgrab(mm);
 -	core_state =3D mm->core_state;
 -	if (core_state) {
 -		struct core_thread self;
 -
 -		mmap_read_unlock(mm);
 -
 -		self.task =3D current;
 -		if (self.task->flags & PF_SIGNALED)
 -			self.next =3D xchg(&core_state->dumper.next, &self);
 -		else
 -			self.task =3D NULL;
 -		/*
 -		 * Implies mb(), the result of xchg() must be visible
 -		 * to core_state->dumper.
 -		 */
 -		if (atomic_dec_and_test(&core_state->nr_threads))
 -			complete(&core_state->startup);
 -
 -		for (;;) {
 -			set_current_state(TASK_UNINTERRUPTIBLE);
 -			if (!self.task) /* see coredump_finish() */
 -				break;
 -			freezable_schedule();
 -		}
 -		__set_current_state(TASK_RUNNING);
 -		mmap_read_lock(mm);
 -	}
+ 	mmgrab_lazy_tlb(mm);
  	BUG_ON(mm !=3D current->active_mm);
  	/* more a memory barrier than a real lock */
  	task_lock(current);

--Sig_/7Wn0tqi_WrLjsm0io1aaMfX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFj3H8ACgkQAVBC80lX
0Gx2Sgf6Ag5I2T7HSX0r75F1ZiyU4d28AlF1HRkjQ7G7Pur/dvSn++sltJFPjrT4
WPrGfa2ZioYF8UFQpgKpVBXO3Nbzco1UCPF95d53Y/ALouIaskHhBg/b2iwlH6d2
O6K7JmVNBl+t70YZLIhcOckvYgtF+q1azhYbB3/8Fc2SAKHwme90G4dbaukaao2U
UHDhQxZJmwLTBZlvDwPuKbc0WlbVD9KbnE58gezzGOFjnCZlV0+RT9DdhXLLvdYQ
9WRCsZdlId4en7N5wHY3m3zkJjDz2wBggSlRiowHBwfOMU8nw4McMXS0LexAd0Bn
Ut7KqNYE9MyO7M4pLWXmVkup/Zu6Nw==
=Nk5n
-----END PGP SIGNATURE-----

--Sig_/7Wn0tqi_WrLjsm0io1aaMfX--
