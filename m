Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F55532DE51
	for <lists+linux-next@lfdr.de>; Fri,  5 Mar 2021 01:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbhCEAcP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 19:32:15 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54693 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229601AbhCEAcO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Mar 2021 19:32:14 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ds7wY1DqPz9sW1;
        Fri,  5 Mar 2021 11:32:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614904333;
        bh=utaOnAlq6zISU7KfJhEnBiiEFwY0iUvHewbg+F3sDVY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Cr7O3yks8KKoCjTKw0MaOCU/bPZjBKWkWImecbLLF7fUj+rgVnxnKcG14cP1npvXK
         l5FF6PSgj7K9PYcyeW/3ssYFt2aYZ1JTpZ9qiPMCwtI9yWqa7bJp6u9kZkNeLVpkhp
         Ad9Iu1sGkqzjxBx7aAxcyTCyswfNZmXHh/F+pygy9UOi9y0EWkPkhgtthHuJisTsjU
         +TMc7HbnF4xQVtyBw0aQCg8qZvmbxvvE9Qg5PNeya8dpzFUVp5290Y3R19J6nOK3Vr
         ReuEE0s6E8XcG9R8Atl6RhyqZOAjpo436tIYw1B6i1JYldo0mQjbrwWaMYuQA9cyDD
         qI9n9NpXXbYTw==
Date:   Fri, 5 Mar 2021 11:32:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: rebase of the scsi-mkp tree
Message-ID: <20210305113212.66f8f965@canb.auug.org.au>
In-Reply-To: <9a15538c1cc29270d306a4fff6fd9089c9ca56ec.camel@HansenPartnership.com>
References: <20210305110402.70ff1080@canb.auug.org.au>
        <9a15538c1cc29270d306a4fff6fd9089c9ca56ec.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kqR8xFx9bOcCpYpkrsV9=4c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kqR8xFx9bOcCpYpkrsV9=4c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi James,

On Thu, 04 Mar 2021 16:21:20 -0800 James Bottomley <James.Bottomley@HansenP=
artnership.com> wrote:
>
> On Fri, 2021-03-05 at 11:04 +1100, Stephen Rothwell wrote:
> >=20
> > I notice that you have rebased the scsi-mkp tree.  Unfotunately James
> > has already merged part of the old version of the scsi-mkp tree int
> > the scsi tree so that commits f69d02e37a85..39ae3edda325 in the scsi-
> > mkp tree are the same patches as commits fe07bfda2fb9..100d21c4ff29
> > in the scsi tree. =20
>=20
> It's just the flux from Linus announcing he's screwed up -rc1 and we
> shouldn't base on it ... it should all be fixed soon.

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/kqR8xFx9bOcCpYpkrsV9=4c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBBfAwACgkQAVBC80lX
0Gxf2Qf+JhwJ/RrXbIRiJkSr8uLeGyX3UD9K8x39dKUbs9jQhmh2pIQmArjU8kGi
SZ7A+jPnCTuMszQ513Z+CFJJQuFKVYxbPGYjB6fxasyJcbkltagKHhn8+X4LTnz+
SmmTeVKUDADOW9I/hIULjERC/4IbbFo/BQyvPkTBk1MxXodxJnUaxVNZMpQ5mBbq
kxZt+tR5Whyf7THR9NBfDAkVQKwwxDuX1J2HsyACuFx5BJkbz0x+ey2DhL7RCsTD
s2cGj97UNYYkqwaUHXgvMckxavN/TYn25RP4iI7EFNY0vJM3d+OH+BM2ZqwfxLVD
ocAPJ3V3i8Tpc8NVzn2DlkbTUmIXJQ==
=hxfq
-----END PGP SIGNATURE-----

--Sig_/kqR8xFx9bOcCpYpkrsV9=4c--
