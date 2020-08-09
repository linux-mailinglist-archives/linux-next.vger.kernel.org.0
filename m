Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7BA623FD7E
	for <lists+linux-next@lfdr.de>; Sun,  9 Aug 2020 11:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgHIJD2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Aug 2020 05:03:28 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55709 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgHIJD2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Aug 2020 05:03:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BPY6Q20cSz9sRK;
        Sun,  9 Aug 2020 19:03:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596963806;
        bh=YMDzReGGaz00AcNbnMjPbuji41C5xozOTXhLfYzwezc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=k95NQEgNk5fWKUhhx2JVH5lA0ahe07P3HuKziYzB9FbYWhhAEy1IlEUR+wCnqRFOu
         qX7at3dCdN3didU6s1wrntoY69JjmNUZnkXapA7XWTVKkaMxQ90YFq8dcIUDjk7yCK
         NgW4lAtfLQuwfu3KrA8kB44yJ+TeMwvstmDQPIhufmfxAZrgRtvTGl35Uo0OI/7y6Z
         mgmRbKJ6l0i4qKnVXwSU0EmcC1GbUlgS8GoZvcPBknRvwyhu28IQWWOW7X3i32a+oD
         mwGjS/baEp59zbUAwPSKo7rqlHtDoF/L+/PKgNw/I2fKz4Zt7o3Tpcr74WjQJisALr
         xoUCZv4sbTjFw==
Date:   Sun, 9 Aug 2020 19:03:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yongqiang Liu <liuyongqiang13@huawei.com>
Subject: Re: linux-next: manual merge of the set_fs tree with the battery
 tree
Message-ID: <20200809190325.70d60bc7@canb.auug.org.au>
In-Reply-To: <20200727210137.01a5d03d@canb.auug.org.au>
References: <20200727210137.01a5d03d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ur3s598+02RvmAvwYpvCQ1C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ur3s598+02RvmAvwYpvCQ1C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 27 Jul 2020 21:01:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the set_fs tree got a conflict in:
>=20
>   drivers/power/supply/da9030_battery.c
>=20
> between commit:
>=20
>   9d832cd36c60 ("power: Convert to DEFINE_SHOW_ATTRIBUTE")
>=20
> from the battery tree and commit:
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

This is nw a conflict between the set_fs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ur3s598+02RvmAvwYpvCQ1C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8vu90ACgkQAVBC80lX
0Gwmqgf+Lg55BAeQDuZoyMsFdb3Y2kjMhBCav6nkw9zISYh194YWUCiZBAAfb53k
G+MyecUhfK6Wm1h0s35iOWghDAlZp1BehpzlF4xR/KO8k1DKtQIshg69fU5209P4
7APBNHfqYfBNZWV62JTYMDDdjC+sxvjgvi3fAUF5hcHsjlSgv2Cz3Paq1pkXyy/K
i1soFkr+uYbLIDwD17R+fLdl467lFbO93rA2+yg93KWpohu/O4KVd5ZK3AclsnvZ
6VPOJXkhe9pAidgbBW+7TkKG58F0+yMINRYUuln5pAVh+VmaW6EP9er88as6UmxR
DoUhvTCj+5q52DcUAhpWy58o8Gr+zg==
=XJvk
-----END PGP SIGNATURE-----

--Sig_/Ur3s598+02RvmAvwYpvCQ1C--
