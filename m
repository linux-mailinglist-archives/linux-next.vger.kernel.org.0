Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167EC343790
	for <lists+linux-next@lfdr.de>; Mon, 22 Mar 2021 04:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbhCVDpV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Mar 2021 23:45:21 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44881 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229614AbhCVDpH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Mar 2021 23:45:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F3gPD342Bz9sW4;
        Mon, 22 Mar 2021 14:45:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616384705;
        bh=y5zl+b8knrXFb5tRNYcr64U2woI+Jjhequ0OvtRkpfU=;
        h=Date:From:To:Cc:Subject:From;
        b=cM6HvbOoK6iMG76jTu864lMolzeFWsMmNX+LwDpYRw9zx2vxVx9tgXnZPXQ8POzsw
         41z2rcOVXFhvE8VutjddLp2mMn2YS2GGA6ujZXSY4o1V/HFCZe/rX7wPQ1KgcIlFM4
         VMBU/p8CdTRelMAJaQsuwWxifCC27QjCOGpiDA/QQy5kPXDREdtZUWRmqiaqolXdCL
         9PQ4qkFrbxp3eAR6SYOfKfaXpf17N4zcwapCHTIT9oTBdXSlWBg0zI0zHGfXHVRa67
         vGL5NgA7rKoZzRebrymtgqrsIJu/g/J07ddb+dePvVL9U+aIvzgAa60LXG1LfhS4W1
         quJWg2TwCKS0g==
Date:   Mon, 22 Mar 2021 14:45:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Colin Ian King <colin.king@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ftrace tree with the tip tree
Message-ID: <20210322144503.26e2b6ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RfTJIQQUr_9FkywWzfjddYi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RfTJIQQUr_9FkywWzfjddYi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  arch/x86/kernel/kprobes/ftrace.c

between commit:

  d9f6e12fb0b7 ("x86: Fix various typos in comments")

from the tip tree and commit:

  e0196ae73234 ("ftrace: Fix spelling mistake "disabed" -> "disabled"")

from the ftrace tree.

I fixed it up (I used the former - it fixed a second typo in the same
comment) and can carry the fix as necessary. This is now fixed as far
as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/RfTJIQQUr_9FkywWzfjddYi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBYEr8ACgkQAVBC80lX
0GwOEgf+Jr/UkBFDiY1w+66zXjvBD21avD1ugtkmvEjMayiIVNRTVjK8zr/1rRNB
dz+I8BTDakp46UvviviRF2mV3HEUHMBVDfscGQSxRXzwlr+O8KH7ewGjCT8bAFZ+
0TCsbgehHPu/eOVsQ6NLxYEo0F2nHuTMJonv5qJPtJVFNj7U7FXOlEbj3LkFVt5P
yYnTlEj/qitbwfEB4tULpBj3Woqi/BiMSEfL851PuYTtMKzaLVGX9ekfCtr8lin7
FxviRuw9jCWuL18Njo28xTfv6kQ7oKNenwFvGYsh75D2Di+4NkxJaKAXlKJ4u4IF
Q9g+aGXZyK9HlFFjGClECULlpRkgSQ==
=cUes
-----END PGP SIGNATURE-----

--Sig_/RfTJIQQUr_9FkywWzfjddYi--
