Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054052CCD48
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 04:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgLCD0R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Dec 2020 22:26:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbgLCD0R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2020 22:26:17 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D8FC061A4D;
        Wed,  2 Dec 2020 19:25:36 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cmh703jR8z9sT5;
        Thu,  3 Dec 2020 14:25:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606965932;
        bh=gSHMVyunM1cWrpjYKil83LzqwghlsHIx7r22D31WlvE=;
        h=Date:From:To:Cc:Subject:From;
        b=YY+bfyl1widmZCWSM3YY4uiBKa8l7WLPQiFLPPBe/amvQDlvrgIU4xLQduUoaCG2p
         57vZrWoCz+cjv52v7Q0oEhNyFqQvt0eE87nY8KoPYfL8ij726pW9OCceBdrj33dNHJ
         1Sn6DejFzl3PMLo/mDl9vBiKTkm/D+tVogbI8+cLUvIpmayHPhV/cic4Ofatdj8cXv
         nTSS2WSdUd2TFDOyg+9Hr9iU5HM3e95kEUjoi8GgXHoSNMyu2lbCaRMrPs4hYWy8Jt
         Zv0WJby2cxmYhBzp2xEqAOT7OwZztpkGFjV3FWc1wPmjiwJUuloqm/uUF1YWQ5do2q
         QI+/XZWb9RL8A==
Date:   Thu, 3 Dec 2020 14:25:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: linux-next: manual merge of the block tree with the arm64 tree
Message-ID: <20201203142530.4d962ea5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rMpoQI.Ms=dHRJ/iPtMyfp1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rMpoQI.Ms=dHRJ/iPtMyfp1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  arch/arm64/include/asm/thread_info.h

between commit:

  b5a5a01d8e9a ("arm64: uaccess: remove addr_limit_user_check()")

from the arm64 tree and commit:

  192caabd4dd9 ("arm64: add support for TIF_NOTIFY_SIGNAL")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/thread_info.h
index 015beafe58f5,cdcf307764aa..000000000000
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@@ -63,7 -66,9 +63,8 @@@ void arch_release_task_struct(struct ta
  #define TIF_NOTIFY_RESUME	2	/* callback before returning to user */
  #define TIF_FOREIGN_FPSTATE	3	/* CPU's FP state is not current's */
  #define TIF_UPROBE		4	/* uprobe breakpoint or singlestep */
- #define TIF_MTE_ASYNC_FAULT	5	/* MTE Asynchronous Tag Check Fault */
 -#define TIF_FSCHECK		5	/* Check FS is USER_DS on return */
++#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
+ #define TIF_MTE_ASYNC_FAULT	6	/* MTE Asynchronous Tag Check Fault */
 -#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
  #define TIF_SYSCALL_TRACE	8	/* syscall trace active */
  #define TIF_SYSCALL_AUDIT	9	/* syscall auditing */
  #define TIF_SYSCALL_TRACEPOINT	10	/* syscall tracepoint for ftrace */
@@@ -96,7 -103,8 +98,8 @@@
 =20
  #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
  				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
- 				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT)
 -				 _TIF_UPROBE | _TIF_FSCHECK | _TIF_MTE_ASYNC_FAULT | \
++				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT | \
+ 				 _TIF_NOTIFY_SIGNAL)
 =20
  #define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
  				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \

--Sig_/rMpoQI.Ms=dHRJ/iPtMyfp1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/IWqoACgkQAVBC80lX
0GzQXwf+IvxqJTCTdTuCfhV9tKeZbyYczFse3Nr6cDc6WkDl8k/HAo7IVJP9C4On
HsZJElV7Dh5RjIrJtXMhLoPRWZMNNjfo75RbgGvSfQN9dO+3zBzTV+OBCLiZE05w
gTz+6KskA/fhcBt+p78hEuISObIfLKwkVBMwkwp+S9/E2kPxO75iGY8Ny9VaSOYQ
/zhiQIWFxe1zUPdmMhMPiJeSiY79YVVkUgvEZtgkQ4oQjNdaNo0qcOONmRhrq9W4
06v3p17fiVU1JHcYwpSG01290wChvFCZ4ntdsifh3+UZNOxGpJxJSwMtIxHMRbzP
fZ0IBSiFzdQyimxfSJosNCldXHUHmw==
=WLsv
-----END PGP SIGNATURE-----

--Sig_/rMpoQI.Ms=dHRJ/iPtMyfp1--
