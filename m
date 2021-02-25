Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2154C325A36
	for <lists+linux-next@lfdr.de>; Fri, 26 Feb 2021 00:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhBYXdi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Feb 2021 18:33:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhBYXdi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Feb 2021 18:33:38 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB10C061574;
        Thu, 25 Feb 2021 15:32:57 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DmpxH4lPhz9sBJ;
        Fri, 26 Feb 2021 10:32:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614295974;
        bh=eQ6kffqDVHJ2uzHeKjRoPUaCZwkfCTZSsKybnP6LcIo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BRzyLAt0uvOGcDlP32qk5RNrfneXetL2OdlYSMNQjcylb17fIv7KRZdvT3LGV4wXo
         AegvrOGj8ZZmadFttVkyUPDwA8jswncIhSCroEQ136bP7AhbiSQaSykesN3FJz3pnq
         DsSMsmDdT68HF/wHGEnHINlGwoMDFSwHs1bXsvLSSeedRq2pxaKaMGzGI+baBkMJ05
         MI7jDn2XPklcVFziUrwr63jQp4qsylmSfLt0kVhiXiS1vEVh6D1nGlLtx3+fCuu23f
         gTfPeNfmcsCmri/762lWkloyxEM7okiIz0ZAvx8TiSTSwDPcdFGlANL8fPCtXKmD4y
         WbopmqwfgaCQw==
Date:   Fri, 26 Feb 2021 10:32:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Martin Raiber <martin@urbackup.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 btrfs tree
Message-ID: <20210226103250.7b08a233@canb.auug.org.au>
In-Reply-To: <20210215084634.06c1b430@canb.auug.org.au>
References: <20210127223918.1b3e4b3f@canb.auug.org.au>
        <20210215084634.06c1b430@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uo1/9bbAQ8+im9In9I57Sx6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uo1/9bbAQ8+im9In9I57Sx6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Feb 2021 08:46:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Wed, 27 Jan 2021 22:39:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the akpm-current tree got a conflict in:
> >=20
> >   fs/btrfs/file.c
> >=20
> > between commit:
> >=20
> >   0225a20db6d8 ("btrfs: Prevent nowait or async read from doing sync IO=
")
> >=20
> > from the btrfs tree and commit:
> >=20
> >   ddcd14c48a30 ("mm/filemap: rename generic_file_buffered_read to filem=
ap_read")
> >=20
> > from the akpm-current tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > diff --cc fs/btrfs/file.c
> > index 5282f456c99c,898ef7b792b7..000000000000
> > --- a/fs/btrfs/file.c
> > +++ b/fs/btrfs/file.c
> > @@@ -3629,18 -3639,7 +3629,18 @@@ static ssize_t btrfs_file_read_iter(s=
tr
> >   			return ret;
> >   	}
> >  =20
> >  -	return filemap_read(iocb, to, ret);
> >  +	if (iocb->ki_flags & IOCB_NOWAIT)
> >  +		iocb->ki_flags |=3D IOCB_NOIO;
> >  +
> > - 	ret =3D generic_file_buffered_read(iocb, to, ret);
> > ++	ret =3D filemap_read(iocb, to, ret);
> >  +
> >  +	if (iocb->ki_flags & IOCB_NOWAIT) {
> >  +		iocb->ki_flags &=3D ~IOCB_NOIO;
> >  +		if (ret =3D=3D 0)
> >  +			ret =3D -EAGAIN;
> >  +	}
> >  +
> >  +	return ret;
> >   }
> >  =20
> >   const struct file_operations btrfs_file_operations =3D { =20
>=20
> With the merge window about to open, this is a reminder that this
> conflict still exists.
>=20
> The btrfs tree commit is now
>=20
>   1605f1b63c76 ("btrfs: Prevent nowait or async read from doing sync IO")

Now

  5b1c5c4216f2 ("btrfs: Prevent nowait or async read from doing sync IO")

> The akpm-current commit is now
>=20
>   de45c82ebea8 ("mm/filemap: rename generic_file_buffered_read to filemap=
_read")

Now in Linus' tree as

  87fa0f3eb267 ("mm/filemap: rename generic_file_buffered_read to filemap_r=
ead")

This ia now a conflict between the btrfs tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/uo1/9bbAQ8+im9In9I57Sx6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA4M6IACgkQAVBC80lX
0Gw/Qgf9F4Gq3mkCg6vBGD9ub3M4dJbLl9ep6unGy1Mg6ueS2Yr6PP12tt5Gh1/f
B4W4h45TVoFeyO1WoDcojr4rXrSh1rlwYY1uXbgpyPn38ip7xj4Zqtf7Km5vnq93
0N0QkxGryNQix6yAM2G2LZa6bCeQ+jK4i34RdvsuVaFh7GwY3NOZqvzSzUZ5a+To
KFLSueQNVApD4MJQ6NyhYsdcP8AnmgnK6inZRfosKlwhTR+ITlpeRhfAjfoAwzw1
1C5NO7MNTp+hNuWdhtvrJD5LMU1B4jzr/cdrKHEJydyIAzqhdhP17w2Tu0ZzX+PX
KC6BOS26nJMdpRxUlRO2r6FDl+Ykcw==
=cBHK
-----END PGP SIGNATURE-----

--Sig_/uo1/9bbAQ8+im9In9I57Sx6--
