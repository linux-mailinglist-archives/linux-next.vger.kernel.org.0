Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4198431B2EC
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 23:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhBNWAT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 17:00:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbhBNWAT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2021 17:00:19 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D6BBC061574;
        Sun, 14 Feb 2021 13:59:39 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df1Nj6Rdbz9sCD;
        Mon, 15 Feb 2021 08:59:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613339976;
        bh=NrAe61u6Sjbojr9dkYz/RB+vJuIKfMkQw32Zxlhg3L4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YAeMr1qlQWm8K9T24uDAqbaxFkZQT5D1FK5iM9dpg/Rog9YHEVih2+ECSCADzYYES
         ESg7Z7hXv4HE93W8/AM2oMWT9IKNVL3SVi4n9eRVsnhM23ILXCGIwLhWyw/iAn3G1W
         i1QbHmcsQcsTTdJ3xRm8dd7h7XqGwN8W0mkLtGQ2FHB5hyrA3W7S2Qd4d7o8PjDv+s
         SQ2yZ7MyhtDlMnTdJQPHxvoDzQc/SxS3dZ1lwUNRaaTN/7peR7VJtM3wuht6qwdyyd
         YgJQAVVJ0nhNYNj+vrLJ4hjrj/6wRtLeeTMHejmCP8JO/R2FoeAgO9xnAgzBUtlaIo
         JdQ+bjMHggIjQ==
Date:   Mon, 15 Feb 2021 08:59:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sasha Levin <sashal@kernel.org>
Subject: Re: linux-next: manual merge of the scsi tree with the kbuild tree
Message-ID: <20210215085933.53d42bf0@canb.auug.org.au>
In-Reply-To: <20210128165611.24fcb9cb@canb.auug.org.au>
References: <20210125150213.2b09c92e@canb.auug.org.au>
        <20210128165611.24fcb9cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mVXRk7oNoSzVZxC/pwmNUrv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mVXRk7oNoSzVZxC/pwmNUrv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 28 Jan 2021 16:56:11 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Mon, 25 Jan 2021 15:02:13 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the scsi-mkp tree got a conflict in:
> >=20
> >   drivers/scsi/gdth.c
> >=20
> > between commit:
> >=20
> >   537896fabed1 ("kbuild: give the SUBLEVEL more room in KERNEL_VERSION")
> >=20
> > from the kbuild tree and commit:
> >=20
> >   0653c358d2dc ("scsi: Drop gdth driver")
> >=20
> > from the scsi-mkp tree.
> >=20
> > I fixed it up (I deleted the file) and can carry the fix as necessary.
> > This is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts. =20
>=20
> This is now a conflict between the scsi tree and the kbuild tree.

With the merge window about to open, this is a reminder that this
conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/mVXRk7oNoSzVZxC/pwmNUrv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApnUUACgkQAVBC80lX
0GxJaAf/R6MUE1zwS5cuRIEuK2Acv0OA5jerZ+7td4veR0mg/VHE/euacXYSxKPr
QF6aYV3i8xWCAvumm4Sb73yJ94UeCdGTVwL85iq+MDc1OrPRF3Vt74x8h22E7cWr
hTshVBUHO05TQwo0ww/YBrSgFo3Nf/Zl+0xzYbJjD2Vzd6H9KJwKXItnHjJ87IfQ
C7FEdH0VVeYjguKff+R4KOBpMJ9k44do+/PhVF9WPrfix4bxxDFHigelzSPUMuxz
Mx3l81wf8ludNHSxDMAFgG/sXH06JSQMaeyUniQRbhjVxZclY06l5Tffy6BHwIBs
k/bnEQkm7wgQOmFOSQBdE1Bm6tydqA==
=KYdI
-----END PGP SIGNATURE-----

--Sig_/mVXRk7oNoSzVZxC/pwmNUrv--
