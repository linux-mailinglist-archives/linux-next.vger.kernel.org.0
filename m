Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D843A3737
	for <lists+linux-next@lfdr.de>; Fri, 11 Jun 2021 00:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhFJWjL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Jun 2021 18:39:11 -0400
Received: from ozlabs.org ([203.11.71.1]:42451 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230440AbhFJWjK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Jun 2021 18:39:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G1JkZ0Ktyz9sVm;
        Fri, 11 Jun 2021 08:37:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623364630;
        bh=nGBXmZ5pR69Nz3OT+L4NP5pAXNqS/z+zK57gIpUIdQ0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Zca7b+11WJLIHQ+fZqKh5FO8s5io4ZBwh9FFgPMGaMmTSqJ36Noj/DITbhQaTqyfH
         f4F86B0UC9QDkzVSUcTzau+sl7Q/URujPiEJpmrd0WaYwM/1Ma65mIyG8Obz7GZyEI
         h7ij+yHw3rh5znabFq4GAWmcSD8JB3UcW5ZkwulZgGqgYSnBmpK7XUdXHG/IK8XPgj
         dE1CSdntWWTPlnJLlPS+B4oLN2BxK8EzzApq9fFTL8j2MlLCvlDBCIIjrh6Kvz5Y0k
         ++hJuVd/AJrigQBzElB+1ecrNUrPFSIeLPwlArj4Fhl1gHywUbkc9+0TkROkfF0LAt
         +U9BcMG4+dtow==
Date:   Fri, 11 Jun 2021 08:37:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andreas Gruenbacher <agruenba@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: rebase and update of the gfs2 tree
Message-ID: <20210611083709.040cc790@canb.auug.org.au>
In-Reply-To: <20210611081135.3245330a@canb.auug.org.au>
References: <20210611081135.3245330a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z/I4GucHwUi/_jgJbdV8Reb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z/I4GucHwUi/_jgJbdV8Reb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 11 Jun 2021 08:11:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> So yesterday I reported a conflict between the vfs and gfs2 trees.
> Today it has been "fixed" by the gfs2 tree rebasing and merging a
> topic branch from the vfs tree.  Unfortunately, that topic branch has
> been rebased in the vfs tree today, so now in linux-next I will have
> two (slightly different) versions of that vfs tree topic branch (and
> presumably I will get more conflicts).
>=20
> Please think about what is wrong with this situation.  Hint: two already
> published branches have been rebased/rewritten.  And maybe there has
> been a lack of communication between developers.

Please read Documentation/maintainer/rebasing-and-merging.rst

--=20
Cheers,
Stephen Rothwell

--Sig_/Z/I4GucHwUi/_jgJbdV8Reb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDClBUACgkQAVBC80lX
0GwEngf/d8UHjVEsnRfFU1i2Rs6zKBsP9yYoUU+t9ysHX7tOeo4WXM58FW10s8ZQ
uHC16uYFmS55ZO+Pgwbat/iH2zYmdddCMr1Ekomol4SUMeapqDQS9uI6xZ2r/r2g
pDYDD/HHV0SJE8Aj2tXtBpFVq33cXK8KrVjAjeYiFOdb2XvonKWHFoQ4BIRj3Zxo
bqpz3iACcZgpbr3gaV64pMkdclnh4NjH4TlcnP/NcutDdEpz0rqVg62P6hTr0q8t
8zBne0ZMntZPs+7tSWUqvqobpBEeFwy6rrocLcOl/gemztPg+q9RjAJ57cF25LyS
gOLX14RxGULW4sdJIB45FwT7JkWsaw==
=IA3U
-----END PGP SIGNATURE-----

--Sig_/Z/I4GucHwUi/_jgJbdV8Reb--
