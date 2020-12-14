Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD4E32DA1C0
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388601AbgLNUiO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 15:38:14 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50535 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503151AbgLNUiK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 15:38:10 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvtVb0bN4z9sS8;
        Tue, 15 Dec 2020 07:37:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607978247;
        bh=F8W/sHrl7s2jvPo8Lke/2+DMVfOKctENiZyZDtH+AjI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Zw+sEBFmMV6Hd+3s2J2pvu0Euw/d3JM3+uRn9PpmH4ygLtjty//cyQYnpC3d1Ov/0
         ssaOuqCIAK38C767qmXrK6Q6aQELFJEbAhHd1/Bx2BzxUjZxernQl9Kz/3/AzAZw+J
         /gqDoF6PND26GWI3iL6UhYrP0pm6Li/obSih/LlpgKoLyKp5K8lrEZl2zzPESy9Xv4
         hx+4sS3pW6R9i44abCCHd9UQZtQIIceN7ShxNsgf53hR0v7oxulfz/Mjx0l3b+Z8Sp
         tYj1ahkUhQ9RV406ALVxbjlccuaADf3hNWr0qb06eMmjaHmstarp+IG79WqdQvnroI
         08WplmGiji52A==
Date:   Tue, 15 Dec 2020 07:37:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with Linus' tree
Message-ID: <20201215073725.42abe121@canb.auug.org.au>
In-Reply-To: <20201208160222.04ad114f@canb.auug.org.au>
References: <20201208160222.04ad114f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MDP2PmQ0gePUPIoZcwKACgy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MDP2PmQ0gePUPIoZcwKACgy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Dec 2020 16:02:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the ftrace tree got a conflict in:
>=20
>   kernel/trace/ring_buffer.c
>=20
> between commit:
>=20
>   68e10d5ff512 ("ring-buffer: Always check to put back before stamp when =
crossing pages")
>=20
> from Linus' tree and commit:
>=20
>   5b7be9c709e1 ("ring-buffer: Add test to validate the time stamp deltas")
>=20
> from the ftrace tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc kernel/trace/ring_buffer.c
> index a6268e09160a,7cd888ee9ac7..000000000000
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@@ -3234,12 -3391,16 +3391,14 @@@ __rb_reserve_next(struct ring_buffer_pe
>  =20
>   	/* See if we shot pass the end of this buffer page */
>   	if (unlikely(write > BUF_PAGE_SIZE)) {
>  -		if (tail !=3D w) {
>  -			/* before and after may now different, fix it up*/
>  -			b_ok =3D rb_time_read(&cpu_buffer->before_stamp, &info->before);
>  -			a_ok =3D rb_time_read(&cpu_buffer->write_stamp, &info->after);
>  -			if (a_ok && b_ok && info->before !=3D info->after)
>  -				(void)rb_time_cmpxchg(&cpu_buffer->before_stamp,
>  -						      info->before, info->after);
>  -		}
>  +		/* before and after may now different, fix it up*/
>  +		b_ok =3D rb_time_read(&cpu_buffer->before_stamp, &info->before);
>  +		a_ok =3D rb_time_read(&cpu_buffer->write_stamp, &info->after);
>  +		if (a_ok && b_ok && info->before !=3D info->after)
>  +			(void)rb_time_cmpxchg(&cpu_buffer->before_stamp,
>  +					      info->before, info->after);
> + 		if (a_ok && b_ok)
> + 			check_buffer(cpu_buffer, info, CHECK_FULL_PAGE);
>   		return rb_move_tail(cpu_buffer, tail, info);
>   	}
>  =20

Just a reminder that this conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/MDP2PmQ0gePUPIoZcwKACgy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XzQYACgkQAVBC80lX
0GzSfwgAjL2ix6rG/NAKY/8DbpHDLB87GCayec0QaoAEziC3v2ALt38rRzVtQpsB
OkJe/02cm3zjAQJoNo8qgu7l2ElmvuvR2u2jEMPr8XuB2wc4P8JZONtWEkNj62zZ
JjeQfhL1E8dB29opCkN3qDb9AiVdOFbE+MzsZbroE/kr0avArBBleKyBcmKRLDKh
hDd8ghwNyc2eZLrgZA+Nws/QQPdMMtZvnvSYFLztixZOhUZYkRto/1qDLQzjXmxn
tsVGJfrARM42Gtab/Yjd1lwp7Fgpez9o1OAxd7nglo/SFVX85UBgdir0vopZ7+PO
qzWdGqbz98d4hURJVsFt4hgW+bhPSw==
=W04S
-----END PGP SIGNATURE-----

--Sig_/MDP2PmQ0gePUPIoZcwKACgy--
