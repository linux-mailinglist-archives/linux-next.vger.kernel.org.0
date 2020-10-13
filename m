Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27EF28C8E2
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 09:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732565AbgJMHAH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 03:00:07 -0400
Received: from ozlabs.org ([203.11.71.1]:54127 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727353AbgJMHAG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 03:00:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9RHw4RCtz9sSs;
        Tue, 13 Oct 2020 17:59:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602572400;
        bh=x1KWFCxITrWKOyi5Mv/0ObqK/R6h8Do789neFaZAftg=;
        h=Date:From:To:Cc:Subject:From;
        b=RNv04j0Gn68mDN9Vgz52ZLJ/kY32JuKqR0hhpozs+9JwS0F3231vW19sQ6+hgynAs
         qOto7UY456E6BN2UCg31wH3TXpddcsNZXkA0kCMX7pxwe2RvSNZOUlCbWkm1uA6c5V
         nRFVvSasa/5Uxng3Q4vuTqXy2XTxdbtzZbqkMGSNACHZELUpfe1XxKK5GMo3GfY7r/
         p641mcKNGMgliuHRAJSo7I/RGFZj07Q/o5JIUPMUJ/uDEZN2P8RVI5/R2jFErplk7q
         Ibu7ZGKtCk1UyUPZypoqhaoYEXBYY2gdKwrNz+qyAdGzOivL7ZgqHVTWdnhm812TK3
         a9p5+v6XCBGkw==
Date:   Tue, 13 Oct 2020 17:59:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20201013175953.4cc33c06@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S5OI6YLhuOrH2lenvc3BufR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/S5OI6YLhuOrH2lenvc3BufR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/sched.h

between commit:

  d741bf41d7c7 ("kprobes: Remove kretprobe hash")

from the tip tree and commit:

  faf4ffbfd1c5 ("fs/buffer.c: add debug print for __getblk_gfp() stall prob=
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
index 1695d45c2d7a,a360da173c32..000000000000
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@@ -1322,10 -1320,13 +1327,17 @@@ struct task_struct=20
  	struct callback_head		mce_kill_me;
  #endif
 =20
 +#ifdef CONFIG_KRETPROBES
 +	struct llist_head               kretprobe_instances;
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

--Sig_/S5OI6YLhuOrH2lenvc3BufR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+FUGkACgkQAVBC80lX
0GzufQf+Ll91i6oCweRhM0PU25xD/psSPnXp11dDTujWUyWUxHuIynTdcbUuiSGi
duGBzmAzh7gYUSn743m44bCQdDtQG8e2x0SVzb/bqSaYlww63GbF/DcT/fSoZpNr
IZxUJDgXa/2w43uXu0ntgBbjqIMLPS+f8FB6BW02FI2PUnf9Ju1HlsfahmLzpKmD
m4tCjr2LRE7j/6RIOHOoKAVgEw7PeFACBKwni6ib5feNqgn+K9BuleyoMMce39jB
IhC9LDAxPoLrnljJCzlWaXXsMoTlJJLgBAHE4NlDkbv9vu31bezL1Mdukt36/4iT
NT8/IqIzWzLymO7GKbL+FafXuJkOlQ==
=ehVY
-----END PGP SIGNATURE-----

--Sig_/S5OI6YLhuOrH2lenvc3BufR--
