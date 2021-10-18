Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41ABA431072
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 08:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhJRGZp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 02:25:45 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:54089 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhJRGZp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 02:25:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXmz76vZ3z4xbb;
        Mon, 18 Oct 2021 17:23:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634538213;
        bh=wFfQjUVSlELzOvVkwtPiuSslpY32vT0yZ5KFAyxwfJM=;
        h=Date:From:To:Cc:Subject:From;
        b=S2I3769UHtKQSIKjlTtREtiNO0V3mWxbx49CH93im3taeevNTKwv8PEXecm1SbfpY
         /dCyNXtI3OnY0532lvk4yiBpXN86+q0XWaWxF62TUKD3aRAKsBa4hFUzJzRs9LRwGq
         nq7Mh+PGQWwx2a0RtgG0DhdQLZ3xIS53kkOW37sMDEtobSckGhzhyNHRRwY6VyVN+t
         ITO/SqDo+IcHqf/frL9UgsLiNxk3joeAdVJKdhCRx5dL9ooRqc/PvgCSVD8J6I5CT9
         yL6jwSJ2XGQgeMMyNe0BJjO8lX0FO0b21beHVnaKBW2E7e5Xu3Sy5mtnf7P7XXsIJB
         b9ILZHynV9A/g==
Date:   Mon, 18 Oct 2021 17:23:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20211018172330.379b2061@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iea/yGZ+7Qs/j230w26yVX1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iea/yGZ+7Qs/j230w26yVX1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
failed like this:

arch/x86/kernel/process.c: In function '__get_wchan':
arch/x86/kernel/process.c:950:2: error: implicit declaration of function 's=
tack_trace_save_tsk' [-Werror=3Dimplicit-function-declaration]
  950 |  stack_trace_save_tsk(p, &entry, 1, 0);
      |  ^~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Caused by commit

  bc9bbb81730e ("x86: Fix get_wchan() to support the ORC unwinder")

stack_trace_save_tsk() requires CONFIG_STACKTRACE which is not set for
this build.

I have reverted that commit, and commit

  42a20f86dc19 ("sched: Add wrapper for get_wchan() to keep task blocked")

which follows it, for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/iea/yGZ+7Qs/j230w26yVX1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFtEuIACgkQAVBC80lX
0GyLewf+JxIj44eOOvF0/ffEXEESx61ZtHmzjJJrILL8JDr5NJz3eQKe211B9IzM
OqHEGZOTuFiJx0sp1hrOYFpeoi3Dm7ebVk7c5M2vQczwGBgfIT2R+y266Pfb30Ed
zMdEH34D28vakMHb5Ts7yl9wevpPoA3/mJgxiAHCjWAH3xMwRAHUg9Oi8+NEXgF+
PctvZaxODWGhkQXYNmPmSdx1fPguUO2TDHtIjZwhfp/TYQLvCw8Pzwtd7q8Ar8sp
Hf3tYgBaESppjPA4IFuablPhZXZKUUJclEYkLMEJKQ8H+fnWYS3EC5D/1m2uohjt
eIuddEBm+qvm1nGwSGhUlq8VG2t3Sg==
=0fe8
-----END PGP SIGNATURE-----

--Sig_/iea/yGZ+7Qs/j230w26yVX1--
