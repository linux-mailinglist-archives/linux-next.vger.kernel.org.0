Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17EECE7EAA
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 03:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730942AbfJ2CtO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 22:49:14 -0400
Received: from ozlabs.org ([203.11.71.1]:49659 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730932AbfJ2CtO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Oct 2019 22:49:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 472GJ64gv9z9sCJ;
        Tue, 29 Oct 2019 13:49:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572317351;
        bh=z9iDoqE3rAEy8yLXrglEULStcqpS4OmiGIB4A5Rf5Lk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ez2ximaZcuQAKwH3wsDnmqF6QAIQJtmLCOdXAjNNBKdV9s/yN6KkGdDQ/kFsMcf5i
         l3FRjgVM/1QGL6W2sNaZeiluh3nFWh4i0uc2lkSq6LbtLTfoPjDMk94n0lwQ4rS7wq
         0QXCl/F2c8wdTSTb7iNl4be9O+eHdUGUnc4Pj8lPDAxTtEgN/qBC5rHfLF7SBfoycP
         xEbbBGPJ5s4Ww0rQ6GfZ58A2mxLrS9wqCyOajaow6k5CiY80EWNPlSReUW4/R5Tv2+
         WaEysBrMztvmAlU6az5TI2gUGVr9xh+rdaovu/X+3NLodk/w4LtZIxFZhUzIYMbP52
         ZWlwPwTEE+vNw==
Date:   Tue, 29 Oct 2019 13:48:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        James Smart <jsmart2021@gmail.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20191029134856.616b2cd6@canb.auug.org.au>
In-Reply-To: <yq14kzs8evg.fsf@oracle.com>
References: <20191025140736.0c9e9d64@canb.auug.org.au>
        <20191028164924.232e32e5@canb.auug.org.au>
        <yq14kzs8evg.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nM/2khBk4F2CI1g2k7mpd8.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nM/2khBk4F2CI1g2k7mpd8.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Mon, 28 Oct 2019 22:28:03 -0400 "Martin K. Petersen" <martin.petersen@or=
acle.com> wrote:
>
> >> I have used the scsi-mkp tree from next-20191024 for today. =20
> >
> > This build failure now appears in the scsi tree build.  I have applied
> > the fix from James Smart for today. =20
>=20
> Should be fixed in my for-next now.

Thanks.  I also see that James B has merged your tree, so its all good
now.

--=20
Cheers,
Stephen Rothwell

--Sig_/nM/2khBk4F2CI1g2k7mpd8.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl23qJgACgkQAVBC80lX
0GxtLwf8CyKWb2OHdAuKE0f8NTgrZ2rrU2sw5vrrBlat5lh1xvBjXrHwmO0X5LN0
xkIGJ/TG0U5OfM5b5NZyT1u9AjKxXuaLtKWLUzxahNyNeAV/aZ/Lx+2sHZac0EHw
kUrjLW+79smfx3A5E2BRY22JY8Hl+5gfrBl5sMkd0ZDTHwZw5J+spu0vb6Jgkwha
xDKgeeOOCm1EERfH3Odxvv5lQWTHbERsFcoK2tXtKvs1ThEQWwCVjiiyIgOvSRXs
OYZRfkQneOetPABzVPz5W9tUNoLaaj9M5TA4jmcl0CN4izLUvlWS79FQBxAiwSUs
Rdl3O2tuyH9pVYjBJysqnZblMmMwhA==
=6xXZ
-----END PGP SIGNATURE-----

--Sig_/nM/2khBk4F2CI1g2k7mpd8.--
