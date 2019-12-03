Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7DE10F552
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2019 04:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbfLCDAz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Dec 2019 22:00:55 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37479 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbfLCDAz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Dec 2019 22:00:55 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47RmvS4RY0z9sNx;
        Tue,  3 Dec 2019 14:00:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575342053;
        bh=X3dwqvlcWqJxqxmFoyi4SdNifU4XJBFxpZs22IwDcz4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cCer6lW01K4UANdIZz08cJa38nTb1SdrRualII/5mf+PZzgYLe1/dfus+kw5bujla
         1MA7T856WcMlGMkGhPtwK6miViKJXbIBViuXdgsoSfC4s6KUKhDN9otVRetWYlQJQY
         3+8trHgPVUCr7YMdkVWRtIshFSJQC/BX0hpMeO5Pu/oaeC6FEFydAhfyUcxzZqpgxi
         8CUVw+nEZ1lAhOIByucrMZQkOa83rSJ8OvXTv4LKmCVS5M+f4HRb3zfUXfaAkGyw8h
         9x3EOGWxBnwwa8XmKbGCftpE+fR3gKf1ww+Uh3INyfD8lZWnHRTjs0K9bWzDfy+QJE
         Mayp+rDlCD+Yw==
Date:   Tue, 3 Dec 2019 14:00:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: manual merge of the y2038 tree with the scsi tree
Message-ID: <20191203140052.0ed8810d@canb.auug.org.au>
In-Reply-To: <20191107153757.4999749b@canb.auug.org.au>
References: <20191107153757.4999749b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zf.0TYPUMqU1Q2r/BsYjzzg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zf.0TYPUMqU1Q2r/BsYjzzg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

This is now a conflict between the scsi tree and Linus' tree.

On Thu, 7 Nov 2019 15:37:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the y2038 tree got a conflict in:
>=20
>   drivers/scsi/sg.c
>=20
> between commits:
>=20
>   a16a47416d3f ("scsi: sg: sg_ioctl(): fix copyout handling")
>   c35a5cfb4150 ("scsi: sg: sg_read(): simplify reading ->pack_id of userl=
and sg_io_hdr_t")
>   d9fc5617bcb6 ("scsi: sg: sg_new_write(): don't bother with access_ok")
>=20
> from the scsi tree and commits:
>=20
>   98aaaec4a150 ("compat_ioctl: reimplement SG_IO handling")
>   fd6c3d5accea ("compat_ioctl: move SG_GET_REQUEST_TABLE handling")
>=20
> from the y2038 tree.
>=20
> I fixed it up (I used one side for some conflicts and the other for
> others - see the final file attached) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.


--=20
Cheers,
Stephen Rothwell

--Sig_/zf.0TYPUMqU1Q2r/BsYjzzg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3lz+QACgkQAVBC80lX
0GwwxAgAjkH42IYT8Vpt8nayPxMus1Jlfrix0wImLz925lT29M8C7So+Q3rOH4L9
i92JjPOwo5joG2yzAhKjUrqFK1ra/9N3ruQdBhptFRumk8grHPlZlOIojuynZC8i
LtbYT03Eg1mfy7G4q96zC1RSkp8NtaPkT5WvzpFznxngFtVzOqnn24Z+P6bwJ9Xq
59GXOogE+a4QAQHQ3ZQSW0RJKdkBZqaufN0LOU1kHiWT1zPDTfduwFfeB7T0MLyT
BahRJIx+b/cEZuJYYmeCzeErpu3qU6+smfuttxfcgMITT15W+srauK/TLrRMhpcE
6EvQv7z3hdnXxkx6FtQtlAS9Z438yA==
=6HGd
-----END PGP SIGNATURE-----

--Sig_/zf.0TYPUMqU1Q2r/BsYjzzg--
