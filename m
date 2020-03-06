Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB1217B5D5
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 05:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgCFEwO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 23:52:14 -0500
Received: from ozlabs.org ([203.11.71.1]:59643 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbgCFEwN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Mar 2020 23:52:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48YZwT6J8nz9sRR;
        Fri,  6 Mar 2020 15:52:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583470330;
        bh=KXC3AaAgw0tWWpfFlcnONebvbosi/zh7zjM0fEYO3wU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YI/lICwVtIBymD95aG6pzDiy8BU2c6Uw09gA0u3Qc258hKmUPfeU0o8Zc9VzVn1x/
         Uoom+3c0XjK8dFRTMBayuvC5A12BRw3xexaNUn6y9DvaUe8d8D3Bp7c/nLflveaCPp
         YtasX7XSox1siXlq8lJwnDbW71bDxkS1VNvjtP7zPCKgwQRh2+xX3hwZFTT6ND6MPr
         0aiStPyZBGCxNbqTD4hn3g7RGO7k/CX6drJE3Kzcbpd3xrjXgv3VFCX2Ak57jBgOa0
         uDmMKZpF5rDfRBp2uEIR+PoDeBIxoRbF9SHc7jkepgC8RdXjSpHgnwLkr3umfHaj6M
         O/rnQLpp50hvw==
Date:   Fri, 6 Mar 2020 15:52:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Brian King <brking@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the scsi-mkp tree
Message-ID: <20200306155209.34e85ab2@canb.auug.org.au>
In-Reply-To: <5bff0f26-3b20-e240-e1b4-65af411a3a56@linux.vnet.ibm.com>
References: <20200302133543.7052d654@canb.auug.org.au>
        <5bff0f26-3b20-e240-e1b4-65af411a3a56@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vAPUngZMh4Dp3uyQoC.V2fO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vAPUngZMh4Dp3uyQoC.V2fO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 2 Mar 2020 08:36:20 -0600 Brian King <brking@linux.vnet.ibm.com> wr=
ote:
>
> On 3/1/20 8:35 PM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the scsi-mkp tree, today's linux-next build (powerpc
> > ppc64_defconfig) produced this warning:
> >=20
> > In file included from include/uapi/linux/posix_types.h:5,
> >                  from include/uapi/linux/types.h:14,
> >                  from include/linux/types.h:6,
> >                  from include/linux/list.h:5,
> >                  from include/linux/module.h:12,
> >                  from drivers/scsi/ibmvscsi/ibmvfc.c:10:
> > drivers/scsi/ibmvscsi/ibmvfc.c: In function 'ibmvfc_tgt_implicit_logout=
_and_del':
> > include/linux/stddef.h:8:14: warning: 'return' with a value, in functio=
n returning void [-Wreturn-type]
> >     8 | #define NULL ((void *)0)
> >       |              ^
> > drivers/scsi/ibmvscsi/ibmvfc.c:3644:10: note: in expansion of macro 'NU=
LL'
> >  3644 |   return NULL;
> >       |          ^~~~
> > drivers/scsi/ibmvscsi/ibmvfc.c:3638:13: note: declared here
> >  3638 | static void ibmvfc_tgt_implicit_logout_and_del(struct ibmvfc_ta=
rget *tgt)
> >       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >=20
> > Introduced by commit
> >=20
> >   54b04c99d02e ("scsi: ibmvfc: Avoid loss of all paths during SVC node =
reboot")
>=20
> Thanks. I'll send the one line fix.

I am still getting this warning, but it is now after the merge of the
scsi tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/vAPUngZMh4Dp3uyQoC.V2fO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5h1vkACgkQAVBC80lX
0GxC1gf/Uoi4y91OkNEr3u7Er4m3Md3ex5UJ7/YEI63/deBaSOMG7AGzZnTJOrW1
RDwr9kTIjp3ei1fUxyHCncXpYJPFAsuBhdvY9qwvj91uofu8fYLx1wcSjXzEIfM6
E5DjLJ3BBWgJ2/YzmCnyj0AT0ZsDT44ixSDHb8SFyH0DtJjaKs45evCOQniijU8l
sp9R/nzMGEi+1ESYFJXiGQj8Fneqc7IoaRjCcBbcQq+oO3Jvl4r8Db7Lw+eiufbS
4wskLe/zCgYsjN8ZPL38N3wpaKwZz2rQNCsdSiZAwoTzJlnlxGqlbEXHWbE0kcwQ
S/Io+bqndVpiGrzBbOGfdmCAWgy1Cw==
=QgMQ
-----END PGP SIGNATURE-----

--Sig_/vAPUngZMh4Dp3uyQoC.V2fO--
