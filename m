Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDA223FD80
	for <lists+linux-next@lfdr.de>; Sun,  9 Aug 2020 11:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgHIJE4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Aug 2020 05:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgHIJE4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 Aug 2020 05:04:56 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CE1C061756;
        Sun,  9 Aug 2020 02:04:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BPY8527Jzz9sRK;
        Sun,  9 Aug 2020 19:04:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596963894;
        bh=CqZG1JMCrLO5uGHp+pSWgPRJe50FU0pO/9V1cf5xzUQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oZIVE34bypIXOZJOg3IlbOF2sUJyMARguCLVPHEXuQVCC9HpyuEQrcQ6R0v+yemB+
         novccSms0Y1wHWc4s4y8i1YW8k8bz+j6MtsNys0hgYmJ3ZpijvcW1469EVlaJkSieY
         BM6yi4b3GpJKzyClljgX1OMPQDlyjXqWXyDsemGEOm/TQSnG0b/qlkXghTP/g/c8EO
         J5/MUjbpQ9c4iEn7ohJaZxNx4uqD7Q0gbuzABRTK0iLaR8qnoamnq3Q2JPy0n1g7rW
         3So7gTJ/JG/6XX8pMXsbTtaNSW2Gg62Dg32aDJ92QO8H56dO+izH6K7FywKY/USoJd
         0SqTgs8Jr82Dw==
Date:   Sun, 9 Aug 2020 19:04:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: linux-next: manual merge of the set_fs tree with the tip tree
Message-ID: <20200809190452.5c1a19c3@canb.auug.org.au>
In-Reply-To: <20200727210444.458c56fd@canb.auug.org.au>
References: <20200727210444.458c56fd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hQw+IFV54xMdhX6nyX1rg3M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hQw+IFV54xMdhX6nyX1rg3M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 27 Jul 2020 21:04:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the set_fs tree got a conflict in:
>=20
>   lib/debugobjects.c
>=20
> between commit:
>=20
>   0f85c4805184 ("debugobjects: Convert to DEFINE_SHOW_ATTRIBUTE")
>=20
> from the tip tree and commit:
>=20
>   4d4901c6d748 ("seq_file: switch over direct seq_read method calls to se=
q_read_iter")
>=20
> from the set_fs tree.
>=20
> I fixed it up (I just used the former) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the set_fs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/hQw+IFV54xMdhX6nyX1rg3M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8vvDQACgkQAVBC80lX
0Gy4uAf/VXhnsR1Ooz6BAR12buNOIzDnWXyLlpyzbVAmScWlpLV3cSQxNSBmHhgD
k1qV5dyGgYDoTggLhhcuFSAEvEMrAmSVp0Q8wDjgPi/zmq73o2dpc7yc2EqI7DhE
SOesD5vcVgifWjLSE9InieBx5vMCBcWhLtZLy2yJHU6dwdXnU1F8RG81RMIFLvWr
B5oFj2MzPzP6FEIiTMBAZ4YPI1SG8QwbYc8CG4mU8n+aAKKVljkz2DksmgHr4dkw
ySRktpIgeHjnbMrYe8MJMQ3iQ4FcgBPxdLAcwglJe+AH5KIiV/unvb3GXUEdBwEl
B7onrkrLSxAq6ve7dbJAh+Rcgq+Amg==
=m5Us
-----END PGP SIGNATURE-----

--Sig_/hQw+IFV54xMdhX6nyX1rg3M--
