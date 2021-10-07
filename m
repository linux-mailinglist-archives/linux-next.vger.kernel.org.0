Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBAF7424BAD
	for <lists+linux-next@lfdr.de>; Thu,  7 Oct 2021 03:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhJGBlX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 21:41:23 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:40701 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbhJGBlX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 21:41:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HPvBR38bxz4xR9;
        Thu,  7 Oct 2021 12:39:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633570769;
        bh=I9cGaGjOKy5tT2LwwIEIq60fQSJN66dNSfGYPKXt2qA=;
        h=Date:From:To:Cc:Subject:From;
        b=kmV3SWlNl5cgOn31Amws0RrljfBeKjXSfk74kUvfT+/G5lu83VKPCUYnN31uwv3ku
         CpgDF4HMy9zcq+jN7nX6Ssrk6SwgF7KKmE6/HYhEv7z+5/mwPonvknWTkL4HzzHmQr
         omuOfsmkg0bNovLuWuYRs+mjzUmgaCmHFNMqASzHoaXE6kNwjrbDb0KaZlnBD0Ng5n
         qb4hGTMxv39CIPV4huZV+rZcamAbB/3UCc1y0npJYq25pDpHIWCFacmCg8lgZr5oNz
         TxT5d2CWsn9AS51b2QeS0X7Cm/EbJbxES+0CtRthIc8V52yUlh9DI5qRAEl70Japny
         tdq8W4cE1sGHQ==
Date:   Thu, 7 Oct 2021 12:39:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: linux-next: manual merge of the ftrace tree with the tip tree
Message-ID: <20211007123924.748d2dda@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Tgt4XWhF/nsZURA7=Q8mxNs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Tgt4XWhF/nsZURA7=Q8mxNs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  kernel/kprobes.c

between commit:

  670721c7bd2a ("sched: Move kprobes cleanup out of finish_task_switch()")

from the tip tree and commit:

  223a76b268c9 ("kprobes: Fix coding style issues")

from the ftrace tree.

I fixed it up (I just used the former version of the changed comment) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Tgt4XWhF/nsZURA7=Q8mxNs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFeT8wACgkQAVBC80lX
0GyPlQgAkh3z7GWr1fy4rHwcmi38AJlmqxAYmPRcgOnUWPrPSq/3ejrs84+DKQmX
IbCfuck9dIWwthqykqgpHGYxFONImzRtt3NmDn+9zRJyc1xVNyI8eA2GayeJx9Ou
RcXH44stjk5FNnzPr90acxf/I+kit3IY9GuSMLlHcQeWi9V6j6rYfP6hkacy/Wwj
Vm9vziZjBmBO+lTF07J6p6cVUEDcu4edYCaM3QqRIjMBVCQEgcqO7/ourN3oCzqv
GAnBCGfYkYNAcrVqoDIBlS0sCzU2RtoEfqUh2imait6nTbcDlQtssWPHlGioFPIq
/lnGNbcS2XlEAXHpWrbFlTNbmnVpsA==
=k8cm
-----END PGP SIGNATURE-----

--Sig_/Tgt4XWhF/nsZURA7=Q8mxNs--
