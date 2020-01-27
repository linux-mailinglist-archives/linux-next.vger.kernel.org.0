Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFE8E14AB4E
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2020 21:52:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgA0UwR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jan 2020 15:52:17 -0500
Received: from ozlabs.org ([203.11.71.1]:37645 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbgA0UwR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jan 2020 15:52:17 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48624H42Gkz9sP6;
        Tue, 28 Jan 2020 07:52:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580158335;
        bh=5IAWXzKEP5eil4lytI4r0Q4DbY73zSR6CMbbN1GRfNY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FUXj16rVdcACorjfQjUDTr6SL8JrYQPsULHFEDmiQESJBRAnqGSRtD8bmsytOrXj4
         8uJJEjamKiFf09GgrepOYAl6866rwZsEAmjZC4h99flM/2vh+CHYNJCqmEsz/QGa3e
         RvLzltQuVQIC6qJ/eFMnJ4qjkQ03dI+FJ5meQ73ekRDECTZn421fiSf5IaoT+rZ3Rl
         bbcXQWO0B9hJOsLGul14oLldGJcuDIRmpZKifJ2lvlbpSvd7tQRp2yEICxr48ShtnL
         I+EyWS2b5BIRs3p5RTnXdsF8y9BzHuLyWqv4GRrHjTVCxzIgb+wItfT1giD8Yq5yEn
         SRCgQ0sZH4sXA==
Date:   Tue, 28 Jan 2020 07:52:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kars de Jong <jongk@linux-m68k.org>
Subject: Re: linux-next: manual merge of the keys tree with the m86k tree
Message-ID: <20200128075214.2177dcae@canb.auug.org.au>
In-Reply-To: <20200113123700.66678b59@canb.auug.org.au>
References: <20200113123603.33c957e1@canb.auug.org.au>
        <20200113123700.66678b59@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G.3uctNI+1673TIdUQiqCIo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/G.3uctNI+1673TIdUQiqCIo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 13 Jan 2020 12:37:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 13 Jan 2020 12:36:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the keys tree got a conflict in:
> >=20
> >   arch/m68k/kernel/syscalls/syscall.tbl
> >=20
> > between commit:
> >=20
> >   e8bb2a2a1d51 ("m68k: Wire up clone3() syscall")
> >=20
> > from the m86k tree and commit:
> >=20
> >   519c484a997a ("Add a general, global device notification watch list")
> >=20
> > from the keys tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts. =20
>=20
> Sorry, forgot the diff ...
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/m68k/kernel/syscalls/syscall.tbl
> index b911e0f50a71,83e4e8784b88..000000000000
> --- a/arch/m68k/kernel/syscalls/syscall.tbl
> +++ b/arch/m68k/kernel/syscalls/syscall.tbl
> @@@ -434,5 -434,5 +434,6 @@@
>   432	common	fsmount				sys_fsmount
>   433	common	fspick				sys_fspick
>   434	common	pidfd_open			sys_pidfd_open
>  -# 435 reserved for clone3
>  +435	common	clone3				__sys_clone3
> + 436	common	watch_devices			sys_watch_devices
>  +437	common	openat2				sys_openat2

This is now a conflict between the keys tree and Linus' tree - just a
reminder for pull requests.

--=20
Cheers,
Stephen Rothwell

--Sig_/G.3uctNI+1673TIdUQiqCIo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4vTX4ACgkQAVBC80lX
0GwXIQf/Z+1iag3JLhrU8jy8fK1Uvj5xMNrnkU+x10030B+os9vjGSSmtAn+dor1
yYMOu60+Gsr7+l3Smz2oBmTcxaYUKcZvhmnRfnURe2LEsKvdEcH+BHXhT2Sqwxbr
cOuMg1o+FA9MP4XGS47ZEF8xCkEkR0ay8+yKyv4SvJda8Yx9mb9qKuUTyyrxCFXL
xh/aGH99dJsqc7iNsMR3kn2Sq47lbqDvZYsy9GwInFd9V4xxd3skl6JBNKVMoZEn
7esS6JooLVNKQD/N5ye6ayD3S9Taky2fMgGBwbYl1NXbHW/aXwwrkF3C51qSopZj
ViFFvjBcHJ1veODnafrQyHylNUUAog==
=nYK4
-----END PGP SIGNATURE-----

--Sig_/G.3uctNI+1673TIdUQiqCIo--
