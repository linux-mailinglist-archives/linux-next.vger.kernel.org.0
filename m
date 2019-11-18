Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C873FFD85
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 05:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbfKREJG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Nov 2019 23:09:06 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37183 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbfKREJG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 17 Nov 2019 23:09:06 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Gb734K3kz9sPT;
        Mon, 18 Nov 2019 15:09:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574050144;
        bh=mkXvmpEAu9p9EiOd11+f+65UBhxqEdWIRPREiV7EO28=;
        h=Date:From:To:Cc:Subject:From;
        b=SJGuIPL4oZV3MFLI1aq8mKI0be/8/op1Wd6jDp6krsWs/riGZlujuur5unWi/RsWN
         VlMKnTpCuFt7Em3mRsnP0LYtdHwKh5h+GufletqAR0AjNsDb4zv1P060HB6Z+Yq0pb
         BYaZ9rMqLkK7ky1E19dSEZXkcU1LHbNJsdLSDeUj5oS61xwHOW53kxc7v8tj/Dol5l
         Fh+i/LcCDp66+GLwS/hzFffVJ1iLj1RVbGFjC3v5wEpCLn+Oee7mqJ+PQPBCu2jBIF
         Ouz5if8OHZ88P7amY8+pMHvR1rE7UBq8eEW7AKeJn8CksuJS7N+GWqaWQPbR/FGa4F
         DStxbT8fNlGrA==
Date:   Mon, 18 Nov 2019 15:08:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: linux-next: manual merge of the workqueues tree with the tip tree
Message-ID: <20191118150858.1a436a12@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l.=wrc79NzWG0japl4GYqQz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/l.=wrc79NzWG0japl4GYqQz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the workqueues tree got a conflict in:

  kernel/workqueue.c

between commit:

  5a6446626d7e ("workqueue: Convert for_each_wq to use built-in list check")

from the tip tree and commit:

  49e9d1a9faf2 ("workqueue: Add RCU annotation for pwq list walk")

from the workqueues tree.

I fixed it up (I just used the former as it is a superset of the latter)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/l.=wrc79NzWG0japl4GYqQz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3SGVoACgkQAVBC80lX
0Gxn3Af8DBCO64ZGZ40FpA/jOgAWhkdQpraxigpjHr/b2fBzYI/GHLtRabwykNTD
eRQDBnYRE0BQW8rEhuDz2Xy8B1XOWuOOnawwrHlvgT6RPMLHC+u0NjuYiqefWmpT
rI0+4R38xqZ9nDszzX1KT1chYkJoKgxsNXB0Zc/nr3P6tCejHV2Xz/gdA70cCi+4
Wmwrf8/9RD3L28px3jqa6miFktuI2wpO953TSpBOe3qiLbme9JMYXI4k4ThnKNMC
hkf5jZMyc0AtTOcY8pAzZtu6ePc70mHk7jPL7HIy8phjae8g0v7hOgYv9HC32tvO
AyeXaavHfy7qjY2i0URpJTRzuPfLJA==
=YYlg
-----END PGP SIGNATURE-----

--Sig_/l.=wrc79NzWG0japl4GYqQz--
