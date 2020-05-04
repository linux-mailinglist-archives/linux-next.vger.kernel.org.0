Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6F11C316F
	for <lists+linux-next@lfdr.de>; Mon,  4 May 2020 05:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgEDDZf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 May 2020 23:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbgEDDZf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 3 May 2020 23:25:35 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5952FC061A0E;
        Sun,  3 May 2020 20:25:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49FpCH6vM9z9sSc;
        Mon,  4 May 2020 13:25:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588562732;
        bh=Uv+FYb608C2j7NiBsyEny73mMBk3BjoxXwlf0a8AdAU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KA9UijhFkegDG9idM8FusG9u6vyudPMzSRYbS+pNE+7tUO2tFcNu16pVexWsR+oBk
         Chi4h4gUFYGUR2/P59PW8qFil52jFefpP9wNmrR58h6VwYvovZjY+aoEAqmjM2XQ5C
         ItHm+XuGY8l+cFKmQf5smtZkugCbSuSnuDMjfegFIRD1hecaDEFJfNMVrgk6JLwtE1
         pxxxohpnngqJ68tOZDWtMwns7jlCN9vHGVGko5EtxV1s6+jRL3ZJIVfm0re6hRnFuK
         LXcZPNmvHQXdn71toe6NpbASH5wasfSJJ3+Ca0tmu+vIFZdFFXyzOzkwMn20hXOsia
         SPPHaqioPoz/A==
Date:   Mon, 4 May 2020 13:25:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: Re: linux-next: build failure after merge of the keys tree
Message-ID: <20200504132529.44037944@canb.auug.org.au>
In-Reply-To: <20200302113737.7c3fdee0@canb.auug.org.au>
References: <20200302113737.7c3fdee0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VW.234rJBC/4GE2/O1e+N98";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VW.234rJBC/4GE2/O1e+N98
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 2 Mar 2020 11:37:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the keys tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> fs/io_uring.c: In function 'io_splice_punt':
> fs/io_uring.c:2473:6: error: too few arguments to function 'get_pipe_info'
>  2473 |  if (get_pipe_info(file))
>       |      ^~~~~~~~~~~~~
> In file included from include/linux/splice.h:12,
>                  from include/linux/skbuff.h:36,
>                  from include/linux/if_ether.h:19,
>                  from include/uapi/linux/ethtool.h:19,
>                  from include/linux/ethtool.h:18,
>                  from include/linux/netdevice.h:37,
>                  from include/net/sock.h:46,
>                  from fs/io_uring.c:64:
> include/linux/pipe_fs_i.h:267:25: note: declared here
>   267 | struct pipe_inode_info *get_pipe_info(struct file *file, bool for=
_splice);
>       |                         ^~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   549d46d3827d ("pipe: Add general notification queue support")
>=20
> interacting with commit
>=20
>   52b31bc9aabc ("io_uring: add splice(2) support")
>=20
> from the block tree.
>=20
> I have added the following merge fix patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 2 Mar 2020 11:27:27 +1100
> Subject: [PATCH] io_uring: fix up for get_pipe_info() API change
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/io_uring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index fb8fe0bd5e18..8cdd3870cd4e 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -2470,7 +2470,7 @@ static int io_splice_prep(struct io_kiocb *req, con=
st struct io_uring_sqe *sqe)
> =20
>  static bool io_splice_punt(struct file *file)
>  {
> -	if (get_pipe_info(file))
> +	if (get_pipe_info(file, true))
>  		return false;
>  	if (!io_file_supports_async(file))
>  		return true;

Due to further changes in Linus' tree over the weekend, this fixup is
not linger needed.

--=20
Cheers,
Stephen Rothwell

--Sig_/VW.234rJBC/4GE2/O1e+N98
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6viykACgkQAVBC80lX
0Gz3cQf8DUU/HSj0wI2d8OdR3r1cWkdPrY7dEQw+CXwktgQOEcNQ08N/lUQ7vj0c
VoeiCsJjfnbPFbvaVUDxOs0okqndNq6yN4QVXB0i6SwytaiTLWqd8rsJbNyfKl3i
mLMMGL94xVLciVbytR5gu0ckq3gr3RgbCvdz9NUYQEd7ErLUjNRBs0UC0kGWcP7+
I51AvYDqliGqPDVRGHhktid8zAdoUWo5ofMZ3LPz0pO0sj2ZHv+DT091pduwBr9y
sXxJFoAnXJlRhyTxtuIpq6BAnyBCQN9pi7pfloRPwoIqKL02SaA0Od2QJZtOyQ3a
qaskGLHuc7J/EyLT4ZW0aCOG9BgWRA==
=qvZ5
-----END PGP SIGNATURE-----

--Sig_/VW.234rJBC/4GE2/O1e+N98--
