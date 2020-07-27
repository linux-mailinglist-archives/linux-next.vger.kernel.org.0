Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8572822EAAA
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 13:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgG0LEt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 07:04:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55691 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727090AbgG0LEs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jul 2020 07:04:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFcQP55gHz9sPf;
        Mon, 27 Jul 2020 21:04:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595847886;
        bh=jbbYAGGF5TkFumuzxoC4AbluT+cv3457AvUjKy9IdI8=;
        h=Date:From:To:Cc:Subject:From;
        b=ehp9guwSIcGzXqaHZ68GtNWe0ltGk/Ax8i0Xqon6ya8Arvcyd1BiN5k1HxSF8COLZ
         uKWlDC17Nbr8YiqcgK+k7sKORCV+yhBQ754+Ol3PyvRGJk/nlMJymUrDcKNX8LIWac
         Zi4kQlVjYjTEDkvW8GmImwKQLT5Jyo0t1YxOoL8tXT0rLLY+VCttddd+WmMTUQpUpD
         JkHTk12Cqj4+/BRLyp2H+BHIqlRAoBHfoTtO8ZgAdkrvxkczQm+HGwPFKF0HI+0oxk
         NYr+BxzB88PqYr+E3VlylzC24ikWi4w+mIwXGjeMURyI2qt4qFVJ7d4j2WArTYdWNz
         dnQUlGZIbjbKg==
Date:   Mon, 27 Jul 2020 21:04:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: linux-next: manual merge of the set_fs tree with the tip tree
Message-ID: <20200727210444.458c56fd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y7fVASij+Hlu4Wh5Qy6k5/h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/y7fVASij+Hlu4Wh5Qy6k5/h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the set_fs tree got a conflict in:

  lib/debugobjects.c

between commit:

  0f85c4805184 ("debugobjects: Convert to DEFINE_SHOW_ATTRIBUTE")

from the tip tree and commit:

  4d4901c6d748 ("seq_file: switch over direct seq_read method calls to seq_=
read_iter")

from the set_fs tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/y7fVASij+Hlu4Wh5Qy6k5/h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8etM0ACgkQAVBC80lX
0Gxj5gf+Nk6ycrK2zCc9gPqy9Fn7t1CFf+RzvpahhBulNjBoMXxPt8cDg0TqdURm
3a5oRkdmCfgN9/VN0hHT/DGKUBi6Q/5VR9fxO9a4Whm7A+H+6rny+UN3dUv5/voN
vUn3bJBwxLcvMgzEEMzHzc4pRMy0wTMF7VlAl8dS6jDu9uWa5tVPypqyVlICvdUs
bHPdr9JxmkS25xPX0e+32Kgp6AK1WYCeWpdXqLkZL3U4UEtdHqagJ1IY+nZdUWqK
tbm2mjYg3nX/UnQriC7f0tV2DrhRwvhP6j/YKUStwgk8yGgcRTKvLKplhb6txSQo
FFDtMEN7ClH16Dc8p/itvAYgrQM1vg==
=/sjm
-----END PGP SIGNATURE-----

--Sig_/y7fVASij+Hlu4Wh5Qy6k5/h--
