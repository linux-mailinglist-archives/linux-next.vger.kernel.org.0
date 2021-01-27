Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D69243053E6
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 08:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbhA0HE7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 02:04:59 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34041 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232840AbhA0HCc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Jan 2021 02:02:32 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQZK61XNjz9sWH;
        Wed, 27 Jan 2021 18:01:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611730906;
        bh=l/MrulFb49v1zcRyeG/wr4btEhEEd48FW+4ULIXMaKQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YJO/8q6OES6IfrpiHR7JzAkV0h2e22RqCaawNYUKWOshspGslCNfcxNDU++oso1Wr
         cPaov9RYcFTfNgpGIrrGbrqipG0FEyPlj09UL/KY8ELzHpe9/9hfcwPIDduqjklyh5
         Vv4REgpI/f6t3i6Uz0tA46PeYw+G205e3THccKf13SGq2G/MnvlMxPpV+FtwX6gNXb
         9UOKmvOoWsMot/3GeZWnKV0OYLqbv0L38QIu/ssXsDjD9NBCrCxyR6NE4iHIrBcr+e
         MUDzXfI8bTyjzLTE2/FrygVfKRg1ZBIrvjtq/rrTaMYeXSYEFHoCmB/gA4xIfNnyeO
         c1/dD1pFyuKWw==
Date:   Wed, 27 Jan 2021 18:01:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Douglas Gilbert <dgilbert@interlog.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20210127180145.5b955898@canb.auug.org.au>
In-Reply-To: <17ccd90b-8616-1f20-ad5d-e250834c02fe@interlog.com>
References: <20210125151310.20e71400@canb.auug.org.au>
        <17ccd90b-8616-1f20-ad5d-e250834c02fe@interlog.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.xegP0jk/SIH7PqgT/xq65K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.xegP0jk/SIH7PqgT/xq65K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Jan 2021 00:53:59 -0500 Douglas Gilbert <dgilbert@interlog.com> =
wrote:
>
> On 2021-01-24 11:13 p.m., Stephen Rothwell wrote:
> >=20
> > After merging the scsi-mkp tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >=20
> > drivers/scsi/sg.c: In function 'sg_find_srp_by_id':
> > drivers/scsi/sg.c:2908:4: error: expected '}' before 'else'
> >   2908 |    else
> >        |    ^~~~
> > drivers/scsi/sg.c:2902:16: warning: unused variable 'cptp' [-Wunused-va=
riable]
> >   2902 |    const char *cptp =3D "pack_id=3D";
> >        |                ^~~~
> > drivers/scsi/sg.c:2896:5: error: label 'good' used but not defined
> >   2896 |     goto good;
> >        |     ^~~~
> > drivers/scsi/sg.c: At top level:
> > drivers/scsi/sg.c:2913:2: error: expected identifier or '(' before 'ret=
urn'
> >   2913 |  return NULL;
> >        |  ^~~~~~
> > drivers/scsi/sg.c:2914:5: error: expected '=3D', ',', ';', 'asm' or '__=
attribute__' before ':' token
> >   2914 | good:
> >        |     ^
> > drivers/scsi/sg.c:2917:2: error: expected identifier or '(' before 'ret=
urn'
> >   2917 |  return srp;
> >        |  ^~~~~~
> > drivers/scsi/sg.c:2918:1: error: expected identifier or '(' before '}' =
token
> >   2918 | }
> >        | ^
> > drivers/scsi/sg.c: In function 'sg_find_srp_by_id':
> > drivers/scsi/sg.c:2912:2: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
> >   2912 |  }
> >        |  ^
> >=20
> > Caused by commit
> >=20
> >    7323ad3618b6 ("scsi: sg: Replace rq array with xarray")
> >=20
> > SG_LOG() degenerates to "{}" in some configs ...
> >=20
> > I have used the scsi-mkp tree from next-20210122 for today.
>=20
> I sent a new patchset to the linux-scsi list about 4 hours ago to
> fix that.
>=20
> Doug Gilbert

I am still getting this build failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/.xegP0jk/SIH7PqgT/xq65K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmARD9kACgkQAVBC80lX
0GzmYgf9HxDTgbGajMySS4vfNVu1jklyPWPXiZevuQsFh3y2v+BXSjYfYEuPhs8g
o9E/MuN/wRViS3stAsfUn/+q1Z+KsJ8wnIOgQGtRwQc/1Hr7Y6hxTxKt9kW5pzfG
m4LqPmwzjbJNPrOVAr0yp72LBsVOdcguNMwcBhBvxH57EAnL3MJrWzI+aG5XV1cj
todVNJfv+zNpJ47w0hUirg1XKrpcO4N32Gz5WDLbjwzMSvtlYg7/fBXKwWGFS92I
dfa32uinDlMSGodxzMFNwKbmXxN8Ak7T+azIDb6ax5KL+mAhUbP8m4rN1z4ZUxbm
LqmklRP5aUSXGfpI5pfHCBeBXLmDGA==
=YRpF
-----END PGP SIGNATURE-----

--Sig_/.xegP0jk/SIH7PqgT/xq65K--
