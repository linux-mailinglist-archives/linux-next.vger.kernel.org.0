Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045AC33E851
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 05:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhCQEJc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 00:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhCQEJP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 00:09:15 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D00C06175F;
        Tue, 16 Mar 2021 21:09:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0c985vXmz9sWH;
        Wed, 17 Mar 2021 15:09:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615954142;
        bh=Diatv00U0N4F/ZC73u+RQ8ic+Jh6CzZ5uTBozzfJxCs=;
        h=Date:From:To:Cc:Subject:From;
        b=WQ6rM7sUxxMVcDr+ncAvCw/OwnForlqHx3nSQhCugQ4v1JDNOT6t7XIptbH2BDcSu
         UvN/oVDxscxiv+UqJLR06O1pFbMkxQqkay8MvdCtlNHjLurgC/jQn8zZnfnko3WM5r
         qHyM8UQZBMRvNNf7rZl1K8EY+zVF+MMEKSxSSe36enoTTZUnn+qgyjbP2ALUSfZYnJ
         qaKIecvjudwxqXjRU498qdi2XADURZJyZw912RwbumEeDz/xCjftPwAZuAZKzgIucn
         XFJVa7VSHOvnBtLDfVkdezxMOfYQZEly/lD3ShusmLQCoJ35mSgosdpCs5rMiteatR
         /P9Pjrosn7BIg==
Date:   Wed, 17 Mar 2021 15:08:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20210317150858.02b1bbc8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IFhsR6z3yG1pgUq_Q3p/dH9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IFhsR6z3yG1pgUq_Q3p/dH9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (native perf)
failed like this:

In file included from util/intel-pt-decoder/intel-pt-insn-decoder.c:15:
util/intel-pt-decoder/../../../arch/x86/lib/insn.c:14:10: fatal error: asm/=
inat.h: No such file or directory
   14 | #include <asm/inat.h> /*__ignore_sync_check__ */
      |          ^~~~~~~~~~~~

This is a powerpc build of perf.  I can't see what caused this failure,
so I have used the version of the tip tree from next-20210316 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/IFhsR6z3yG1pgUq_Q3p/dH9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBRgNoACgkQAVBC80lX
0Gzx3gf/YItlGrogp8m+ykfqB2YmX9v4Bx0Js+7DchHD6Eur21TNNwxp3M7FE3ze
OpUjmlcFpZRUmq1SvxMWaggzfh/SatQ9Vx7UMoY/tsjgiUY0J8l3uA9Vi6ACnByA
zuOD75YNfBsKxgrt7tRISVNdDhzlUcor5Kq5dFOLk0nmgjfwF2a0YeT1K/r8Dp22
trtr2hOcCRvliClus7KNUJ8Em5kQOmqk4DwJePfI67fTwm01tdyP3Y4xlQpOLp1x
pUYoLt5wvkodZxbEAlKKIoFj/tqmDn31bbI3oGRBSrrHRBiE6oPYmn2XbQ43gajI
ao04SXLYpEsskQ48WHRRMRf7cfRpcA==
=1+Yb
-----END PGP SIGNATURE-----

--Sig_/IFhsR6z3yG1pgUq_Q3p/dH9--
