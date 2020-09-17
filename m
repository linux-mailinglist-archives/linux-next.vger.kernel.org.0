Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DF726D18A
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 05:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbgIQD05 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 23:26:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54331 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbgIQD04 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Sep 2020 23:26:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BsMp5010tz9sRK;
        Thu, 17 Sep 2020 13:26:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600313213;
        bh=ELr1x3h14ixxxrsflPbK5sh8QdFvlikfGcntJ32IDeI=;
        h=Date:From:To:Cc:Subject:From;
        b=DiegpUk0xhMm7xvLbA7Gl5TxUKcNOA9xTCXuiIgqTAjbtZCTrKZ3xFmcClJYXo28b
         IvKtFrx68SXZ0XjW1aWr6xa6WE0vETTetCghntRke9AZyqQ+3i+qc9ld6GNGL4jzrZ
         DEZ7w+vyNU+ew6qF4QfRUSsONJvOElK+9WuxSW5Z8pRV4r9gD0lg841xomK+8LpR3R
         UOzeH9Gd03mwAxtdQz5BLt+y1F8ohKPXJPiaAq4OIH5NjpRc0A/hSlh/khz046J400
         dc7T7Ib/x4elVN5nf15H9J64TngGfXYkuZcWLMu1ZCuK7iQjMyuiwJ3MykFtVgjyk1
         9m4dcFNJxvRiw==
Date:   Thu, 17 Sep 2020 13:26:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20200917132652.738c4cc2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_R95F7dG0bpFloOA5TN3puZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_R95F7dG0bpFloOA5TN3puZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  903c5302fa2d ("sched/core: Allow try_invoke_on_locked_down_task() with ir=
qs disabled")

is missing a Signed-off-by from its author and committer.

I didn't complain about this when it was first present because I figured
it was just a debugging commit that would be removed quickly.  However,
there are now quite a few follow up commits ...

--=20
Cheers,
Stephen Rothwell

--Sig_/_R95F7dG0bpFloOA5TN3puZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9i13wACgkQAVBC80lX
0GyNmAf+Jlgxzic9jjkBUQs4aLsVOAg7smlWRkQPjBiSOxibcVN2tA7GDLOJp3o2
gY/fRyqaaaq7cpsO6XVQQ0CTzcYmVT6fPRZm8z+3gIG+Cc+brh214uAwUtCHSNgf
cu8dXcW1x5rbtDaBSNboY6dOddkvqPXph4XpOhNUvg/KMztW1k7GczHk5cRPOKdv
Y7gke3AlGBvp7L8XuJP0E5VAy0RQY5dyDbwlHveMMbwV8HD3XMkrNT/Et5lMu1kn
CCwV1edSzlVtQkgMc/WUDzxEZxsbXXf7hqKCqhfP0l01JafGA6d/g+mgijgORaCE
W75MOx1dbIN4SG8f9CVBfEt4rgMWQA==
=q6m1
-----END PGP SIGNATURE-----

--Sig_/_R95F7dG0bpFloOA5TN3puZ--
