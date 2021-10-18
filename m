Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064C643113E
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 09:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhJRHSO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 03:18:14 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:59595 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhJRHSO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 03:18:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXp7j23Xhz4xbL;
        Mon, 18 Oct 2021 18:16:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634541362;
        bh=b2JzZNK7/O7fcgl3qcXRGSKrRtuXFeYvkYhtEGTrX0Q=;
        h=Date:From:To:Cc:Subject:From;
        b=ewgdtQ7z5kH/gdpzOEOPmOc84lUYVe9KKv39ep62gXZz48RrmTUaoNRf3X0FJMBjx
         jBTSpCD7bU2jL44fAoMKB83ASZEg4oRxV+0hb9OM8Msmu0W2eWVrNamK8C9BbV9LSt
         zdMFojm+p4mG4I+4Qx4EGgdpEHVgunjVE4rj4aHv+HfyqW2ifhFpJvBdkz2d7V9Y8z
         mlXp35hZ2eKgxT2aIyqeLUPyqBfq6xUZODEXqlC+yKZAd/fmmfg0s0l/2nRnqL/0DY
         1zbW+dNrqzWXJlROyIbzEL6W/68RjWMmOihiZ+OoguPHxnKWJIswKDRgDMITFB31en
         9m9CWsY5mQxQQ==
Date:   Mon, 18 Oct 2021 18:15:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20211018181559.5d3bcf7e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/23g=ORi_5_sn=_TxevFQWcm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/23g=ORi_5_sn=_TxevFQWcm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp-gustavo tree, today's linux-next build (powerpc
pseries_le_defconfig) failed like this:

In file included from include/linux/perf_event.h:49,
                 from arch/powerpc/perf/callchain.c:9:
include/linux/ftrace.h:49:41: error: 'struct ftrace_regs' declared inside p=
arameter list will not be visible outside of this definition or declaration=
 [-Werror]
   49 |           struct ftrace_ops *op, struct ftrace_regs *fregs);
      |                                         ^~~~~~~~~~~
cc1: all warnings being treated as errors

(many of these)

Caused by commit

  c45ede6c2781 ("ftrace: Fix -Wmissing-prototypes errors")

I have added the following fixup for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 18 Oct 2021 17:56:30 +1100
Subject: [PATCH] fixup for "ftrace: Fix -Wmissing-prototypes errors"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/ftrace.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 871b51bec170..ada656c6824d 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -45,6 +45,7 @@ struct ftrace_ops;
 void arch_ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip);
 #else
 # define FTRACE_FORCE_LIST_FUNC 0
+struct ftrace_regs;
 void arch_ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip,
 			       struct ftrace_ops *op, struct ftrace_regs *fregs);
 #endif
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/23g=ORi_5_sn=_TxevFQWcm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFtHy8ACgkQAVBC80lX
0Gy7sAf6A3gbD0RJFFT0D17zAzVnpwhZdY0kIfx+cVOuNS8eVFPuot2DPOZrJaNk
lLZxcBX9a+u+8VLJmDR6X4Lpd0C2R9V1SBIfdQxx77YeS/eM1wLI8Q+xch+XSUl+
nmBuefHwsVXNjzfzhWmiu6a5oZ6sYkKmZtPC1zjYxRY19C/Byr9ATVntz4YutTTt
k3sAt92GBgiCMfqQKVcHZ1E5MxGCQdrA2isCIM9dFjX1nNEmliwL45eLWgKF0qfU
qv3l/bxTLmc2WZ9TVe9M63vhAWitGafusq/zf70g6BPTFjz0w8Fl4W+sFM0vzcsn
61lFoZUDpQ0Fnyrhc8qeLQ6BGIGDVw==
=MEpY
-----END PGP SIGNATURE-----

--Sig_/23g=ORi_5_sn=_TxevFQWcm--
