Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B7A442302
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 23:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhKAWHo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 18:07:44 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42617 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhKAWHo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 18:07:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjnC85l6wz4xbG;
        Tue,  2 Nov 2021 09:05:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635804309;
        bh=q0GES9R0bWYVtcu9L1O590gdxDQ4Pvs/ziBTUfz3620=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fcB9KaBDgoTmrfZzp6d9DPdcnMzHto/cTUBiRfrr94Lb8NY5ObO5b+Rz2OSPh+xDD
         22ZvdjIxjPhIoiIGcOWejRCbem3nHmYzPJC2TWBTW/vjVjzP8UiCHEeRYxiGYWfrJ3
         E6mryywb8jE1c0ZqI5QDIecTttgtRGcLZCKctyKwhE8jTTtf39V7wWyWQhe4Gjs+wq
         g1sMYiMck2oVO55JzLH8eRqLbP9u+Y0isZMUCABoonUA8Xtrj1k6jGpovxHHMo5nBE
         dZREtC1dQ8nC+pttktPsgYc0fJKM7CbWys8Suyf+dKbMqoQOffdIvl8cb8EUC1Xvol
         cNzHH6td/fYrA==
Date:   Tue, 2 Nov 2021 09:05:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the folio tree
Message-ID: <20211102090507.26f3c9ef@canb.auug.org.au>
In-Reply-To: <20210922141910.778a5a86@canb.auug.org.au>
References: <20210921142628.75ba9ef2@canb.auug.org.au>
        <20210922141910.778a5a86@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zysV=B_mryxcupjkUCGtyub";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zysV=B_mryxcupjkUCGtyub
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 22 Sep 2021 14:19:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 21 Sep 2021 14:26:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the folio tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > fs/9p/vfs_file.c: In function 'v9fs_vm_page_mkwrite':
> > fs/9p/vfs_file.c:557:6: error: implicit declaration of function 'wait_o=
n_page_bit_killable'; did you mean 'wait_on_page_locked_killable'? [-Werror=
=3Dimplicit-function-declaration]
> >   557 |      wait_on_page_bit_killable(page, PG_writeback) < 0)
> >       |      ^~~~~~~~~~~~~~~~~~~~~~~~~
> >       |      wait_on_page_locked_killable
> >=20
> > Caused by commit
> >=20
> >   be8f72914261 ("mm/filemap: Add folio_wait_bit()")
> >=20
> > interacting with commit
> >=20
> >   82766b47b26c ("9p: (untested) Convert to using the netfs helper lib t=
o do reads and caching")
> >=20
> > from the fscache tree.
> >=20
> > I have applied the following merge fix patch.
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 21 Sep 2021 14:18:06 +1000
> > Subject: [PATCH] fix up for "9p: (untested) Convert to using the netfs =
helper
> >  lib to do reads and caching"
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  fs/9p/vfs_file.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
> > index 4b617d10cf28..68d05b2aa290 100644
> > --- a/fs/9p/vfs_file.c
> > +++ b/fs/9p/vfs_file.c
> > @@ -554,7 +554,7 @@ v9fs_vm_page_mkwrite(struct vm_fault *vmf)
> >  #endif
> > =20
> >  	if (PageWriteback(page) &&
> > -	    wait_on_page_bit_killable(page, PG_writeback) < 0)
> > +	    folio_wait_bit_killable(page_folio(page), PG_writeback) < 0)
> >  		return VM_FAULT_RETRY;
> > =20
> >  	/* Update file times before taking page lock */ =20
>=20
> This fix patch now looks like this:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 22 Sep 2021 14:16:55 +1000
> Subject: [PATCH] fix up for "9p: Convert to using the netfs helper lib to=
 do reads and caching"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/9p/vfs_file.c | 4 ++--
>  1 file changed, 2 insertion(+), 2 deletion(-)
>=20
> diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
> index 7ed76a4c18f1..0f99ec49006e 100644
> --- a/fs/9p/vfs_file.c
> +++ b/fs/9p/vfs_file.c
> @@ -549,12 +549,12 @@ v9fs_vm_page_mkwrite(struct vm_fault *vmf)
>  	 */
>  #ifdef CONFIG_9P_FSCACHE
>  	if (PageFsCache(page) &&
> -	    wait_on_page_bit_killable(page, PG_fscache) < 0)
> +	    folio_wait_bit_killable(page_folio(page), PG_fscache) < 0)
>  		return VM_FAULT_RETRY;
>  #endif
> =20
>  	if (PageWriteback(page) &&
> -	    wait_on_page_bit_killable(page, PG_writeback) < 0)
> +	    folio_wait_bit_killable(page_folio(page), PG_writeback) < 0)
>  		return VM_FAULT_RETRY;
> =20
>  	/* Update file times before taking page lock */

This is now a conflict between Linus' tree and the fscache tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/zysV=B_mryxcupjkUCGtyub
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGAZJMACgkQAVBC80lX
0GzyoAf/YgiDenOjKzQRc4aEQGbOPb/nNDpSX88EkpkrYh/wfasMfAR8CHcolhqy
Woj0tR9taj1D2M1LQ6hLkFEQWxAiA9+APdeb0qHRcB51dMFdNa/Yw7nqJT7LhEKa
BRY4X/O95ik8IFTGnxN5MwK/Xt4Qzy7tym2rAbTprQE+nRGOY4Yth5mHlxp5Mip8
fhNBjDp08EowhPH6oNjhq/63LY7pJDuH0on3ij9Bhi7a9tugTFiLgfoh/Nldyjvv
iPVom+Mx3/+q+2m1Lse77p7/RnVtKsnawbCTHJZ7ATtXCcHS0YB+eu13Mqf4LaHK
r3+zXDzLQNG7223EMeWb/N9hhAS+Zg==
=qpUh
-----END PGP SIGNATURE-----

--Sig_/zysV=B_mryxcupjkUCGtyub--
