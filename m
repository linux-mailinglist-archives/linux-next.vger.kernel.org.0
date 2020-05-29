Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E5E1E7A08
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 12:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgE2KFw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 06:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgE2KFv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 06:05:51 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404B7C03E969;
        Fri, 29 May 2020 03:05:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49YKvZ06r5z9sSm;
        Fri, 29 May 2020 20:05:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590746748;
        bh=AyvzTANU4eDrPNdhR4zDAfYUYB2L3nixV7/kubUEeHI=;
        h=Date:From:To:Cc:Subject:From;
        b=KRTgqTNz8LBlY6b4nb94by+ZPWNrAMiDwRUyqxA1/rZlWj8nUlW1jLgQ+tJqHzVJx
         mPYP2qT2Hk7wv6VpQ9P0TRKOE07O2rs4J7HyheReSrr4rtZzFhfYi9EdOGLWOLRL5Z
         ALXez7zyoqeU5kH2b6QYfxMV1sr8ljBIOwzbPuMoyhSi9AcH2z+HQR8pHI3Lkzw5Q+
         uGUJwJ20ZF8mXladZ6ngiETEyYQkO7bL5DMP/kcPSe/7xe9Yfsy3f5ttEExSp8aDh6
         IyUFhdm2dKt4A8KlmlWqrIL/A1f0TN13LQvsQP6dO5Y3Ek0VNMBMyZ8r+KIXUEpZHB
         /DMFvKF1Cw7tg==
Date:   Fri, 29 May 2020 20:05:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@suse.de>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20200529200545.5b973861@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iC0vo/l.9S5DeKinDIZ9bkA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iC0vo/l.9S5DeKinDIZ9bkA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/sched.h

between commits:

  5567d11c21a1 ("x86/mce: Send #MC singal from task work")

from the tip tree and commit:

  e87f27165be1 ("fs/buffer.c: add debug print for __getblk_gfp() stall prob=
lem")

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

diff --cc include/linux/sched.h
index 5216bd5ff4fb,98060427c53f..000000000000
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@@ -1303,14 -1293,13 +1307,21 @@@ struct task_struct=20
  	unsigned long			prev_lowest_stack;
  #endif
 =20
 +#ifdef CONFIG_X86_MCE
 +	u64				mce_addr;
 +	__u64				mce_ripv : 1,
 +					mce_whole_page : 1,
 +					__mce_reserved : 62;
 +	struct callback_head		mce_kill_me;
 +#endif
 +
+ #ifdef CONFIG_DEBUG_AID_FOR_SYZBOT
+ 	unsigned long			getblk_stamp;
+ 	unsigned int			getblk_executed;
+ 	unsigned int			getblk_bh_count;
+ 	unsigned long			getblk_bh_state;
+ #endif
+=20
  	/*
  	 * New fields for task_struct should be added above here, so that
  	 * they are included in the randomized portion of task_struct.

--Sig_/iC0vo/l.9S5DeKinDIZ9bkA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Q3nkACgkQAVBC80lX
0GxNhQf6AqZZ7SZBCUv8+w9dUSN3rWQ4BsolfYYtOr4nQA6PbdOaYD+DV6PJgLpT
bv/mSuntQVTp73Ib6P0SJZfwhMP8lrkXHtWhGpD93W7Z1bHcrDvrmHt83ZbqmIj5
s20O34k1ZkwhEcPOkSffAslcJHxn3VevOWGur7TswDiLP8ewulGZBN6627KIeNxU
6ksHUr5GvVcK5RG/ecmP+lUUPMAPoRszJ11ZrTX+h2KLVq9rmd4Odk0NPsP3/fRi
174MqxcF874kp7magej9SfokJMSbsHviVlCQ+5Ya31UkV3frG8S9rKJx6YqjzDrK
3OQ24JPtRX3OJjIk8e3/x1e1gmYURg==
=PrUE
-----END PGP SIGNATURE-----

--Sig_/iC0vo/l.9S5DeKinDIZ9bkA--
