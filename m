Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46E86115084
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2019 13:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbfLFMnL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Dec 2019 07:43:11 -0500
Received: from ozlabs.org ([203.11.71.1]:55923 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726124AbfLFMnL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Dec 2019 07:43:11 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Tsgw2k62z9s4Y;
        Fri,  6 Dec 2019 23:43:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575636188;
        bh=gQcLRyFjPBi06XcUxhtqw61VL68HJnWLK6+tiU9fGAU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AuYZH8BOw94vx748IvDjUhHp2u5v0G89QAsp3WauB2Uu6MfaLWB8c0HMgEsF1RVkE
         3racdR3fgl6NcImUL873CI9lN7Y5/bWgr6MhdWqWROswuyLELsTB2PnxMW9CCrz2UR
         DWZZ9V+n3ZVKYsqCGbnM84E2PZIV5E8PXFe5j2SSCRUht8UxHGlokouttw4ECK5xfy
         qGWt/JxYOdPgbV/rVXEFIqqRkDtvu1RRqaGpqbrVy/c04keSdMo89Ov5JlYn3nqMuP
         Wv/ohFORThPPNdQo9Maya/utu4KLLAswwXnjIz8NWJBF4nHhQt3Q6mVUwzJaPJBZFr
         i3+Szite0Yl3Q==
Date:   Fri, 6 Dec 2019 23:43:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Dec 6
Message-ID: <20191206234300.5071290a@canb.auug.org.au>
In-Reply-To: <CAMuHMdVHXYhXtyMAR84L5kQTSU8Ds71AJftrEBqepiy_NV88kA@mail.gmail.com>
References: <20191206135406.563336e7@canb.auug.org.au>
        <CAMuHMdVHXYhXtyMAR84L5kQTSU8Ds71AJftrEBqepiy_NV88kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YcFlRH8OyiCFKwoT.ajJyX_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YcFlRH8OyiCFKwoT.ajJyX_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, 6 Dec 2019 11:15:49 +0100 Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
>
> On Fri, Dec 6, 2019 at 3:55 AM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> > Changes since 20191204: =20
>=20
> Hm, yesterday there was a next-20191205.

Yeah, the script that updates this depends on today's tag being created
...

> Looks like the next-20191206 tag didn't make it to kernel.org, but the
> master branch was updated (so I'm happy :-)

... and there was an error when the tag was supposed to be created that
I failed to notice :-(

I have added the tag and pushed it.  Thanks for noticing and letting me kno=
w.
--=20
Cheers,
Stephen Rothwell

--Sig_/YcFlRH8OyiCFKwoT.ajJyX_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3qTNQACgkQAVBC80lX
0Gy3AAgAlq2gW7b59Notnsjlw5OvURhb0CdhpdPEICgDMGNbEirANeKukzbvnFYy
bvoNPdAfbCa1akvGB8SzWPQIGUlu95XEVo9fT77nVuGKo3CzdIZPX/NHUk+Aa60C
+HMl8IHL1sAItCjPfqaCP7wYTJmolCBL2xeeHFTq2mZudTtbwYLetdqPtwwOYQoy
oDly8GU06A/2gVdzqEc4TQivQJ01qJcaabnVPprZWuH3fVwHHrG2xjfZyBl/nV5p
TMdQcojxtPSJpbjM/94ej+n3qeW296TJWJ9uMPJxehNsgxgERoRL4xqqhgDd36xm
IYFIhlOeEW1LU666ZXRT7ARj0PrPDQ==
=cHel
-----END PGP SIGNATURE-----

--Sig_/YcFlRH8OyiCFKwoT.ajJyX_--
