Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE50331B2E3
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 22:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbhBNVrY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 16:47:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhBNVrX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2021 16:47:23 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0438AC061574;
        Sun, 14 Feb 2021 13:46:43 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df15l3Z1Cz9sBJ;
        Mon, 15 Feb 2021 08:46:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613339200;
        bh=IEKRx6JJNBtw7F5gkckuDsYJJ3HqRzrE+ekwNwTUNiQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=R7AN6hKGuJRKH63ZKJqghvFXfkHfFLFp3tHtHb+phEkXFd/g8XDTGfqc7zbFfo7xG
         msRHBe0P2bkJxbXo7JUM/0hWdd85JOA0onZYg2kzttaZNEGAaLpj6rM/dR31JZa0KF
         gGpLtur1IZtoWGQ6jUE6NCpCaYC+yentgVpqmN0N0T8XU1nuqWzZzzqSlCN02ACoBs
         p2lsOQmb+MhjagS0GSCRzSND7TpdbUgZ71ZC9jGngRCNhQ69BGVmx1uVoN7bwvB/ep
         OGLsdFXLBKqLYwI617GiN2xZbIRHVNAwwj1jphvuAPw89pbAZi92oKpKuw2B/1IkDa
         MaOhLbdGnnM2g==
Date:   Mon, 15 Feb 2021 08:46:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        David Sterba <dsterba@suse.cz>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Martin Raiber <martin@urbackup.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 btrfs tree
Message-ID: <20210215084634.06c1b430@canb.auug.org.au>
In-Reply-To: <20210127223918.1b3e4b3f@canb.auug.org.au>
References: <20210127223918.1b3e4b3f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.4DdQRYZz9OiqpHX/i5.qP0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.4DdQRYZz9OiqpHX/i5.qP0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 27 Jan 2021 22:39:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   fs/btrfs/file.c
>=20
> between commit:
>=20
>   0225a20db6d8 ("btrfs: Prevent nowait or async read from doing sync IO")
>=20
> from the btrfs tree and commit:
>=20
>   ddcd14c48a30 ("mm/filemap: rename generic_file_buffered_read to filemap=
_read")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc fs/btrfs/file.c
> index 5282f456c99c,898ef7b792b7..000000000000
> --- a/fs/btrfs/file.c
> +++ b/fs/btrfs/file.c
> @@@ -3629,18 -3639,7 +3629,18 @@@ static ssize_t btrfs_file_read_iter(str
>   			return ret;
>   	}
>  =20
>  -	return filemap_read(iocb, to, ret);
>  +	if (iocb->ki_flags & IOCB_NOWAIT)
>  +		iocb->ki_flags |=3D IOCB_NOIO;
>  +
> - 	ret =3D generic_file_buffered_read(iocb, to, ret);
> ++	ret =3D filemap_read(iocb, to, ret);
>  +
>  +	if (iocb->ki_flags & IOCB_NOWAIT) {
>  +		iocb->ki_flags &=3D ~IOCB_NOIO;
>  +		if (ret =3D=3D 0)
>  +			ret =3D -EAGAIN;
>  +	}
>  +
>  +	return ret;
>   }
>  =20
>   const struct file_operations btrfs_file_operations =3D {

With the merge window about to open, this is a reminder that this
conflict still exists.

The btrfs tree commit is now

  1605f1b63c76 ("btrfs: Prevent nowait or async read from doing sync IO")

The akpm-current commit is now

  de45c82ebea8 ("mm/filemap: rename generic_file_buffered_read to filemap_r=
ead")

--=20
Cheers,
Stephen Rothwell

--Sig_/.4DdQRYZz9OiqpHX/i5.qP0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApmjoACgkQAVBC80lX
0GzgmggAkKTaLtuRpY/PIWibxnYsOT0ICBWlsLzTI2DwqzfKqi9g0WTwmkvV5nvx
4FNFVOgT1MAxXvKG+DRMb9MCzMiy5HnwxrSqKtmXkqPEoTsJu4hpcLkdO02RoMeg
/kCdgP9uBZj1/uFP2/IqXMLrmSfi1sdw5O+4ZeCKLQmVgJpVKLTkFrxUvoYCGW7X
7fx0pAR55uPzce2V3B/1kRxEM5+puNWfVqzjOK0ChZj5wpWTlJzKi/X1AHs4zeWy
AEOoUpehy/A9EaPPnPJGVQNf5vLeZ/m5YrYcgmAx4Dd3YBWZfTyLDA7E6NBKwriq
WLXbhSEHHnoC5EkhanyR2i7nLkVcig==
=O4Ra
-----END PGP SIGNATURE-----

--Sig_/.4DdQRYZz9OiqpHX/i5.qP0--
