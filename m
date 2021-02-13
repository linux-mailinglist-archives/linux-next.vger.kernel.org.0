Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0DE731A98F
	for <lists+linux-next@lfdr.de>; Sat, 13 Feb 2021 02:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhBMB7N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 20:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhBMB7N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Feb 2021 20:59:13 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175C3C061756;
        Fri, 12 Feb 2021 17:58:33 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DctnH0xtyz9rx8;
        Sat, 13 Feb 2021 12:58:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613181509;
        bh=H/iqb4/Z+4UY6kU+XCeQ5sqbttHmMobg3wFbG3ZbMSA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eCvMYWohyum8n0Sxk9UBbdYuJkbqjymit253wql3yKEpz+8eE8Hr345BOfOQj6gta
         ztmkU0dkWDWWSA7rkzC6lfh0iE1NoPeLM8BXKOU+2xbeOpqRiuhKrYVymgRe1vhULx
         UY37/d+S1kFXWB3Ox3AVKHGFvcO6LgALotTJT2HhCZdtup/s82uhhYdBZI5y/t4ZGM
         /lTtTiiwuUptnsGkgsG/HKqi+rTQ3H4iBj6/NngPw+rrRduqOW58qQN28RfoMCK+JE
         uPg/XHaE81wOarrfH27w0fGE3jbSLLM9CshSpRNTVaXF8P9GNL4Hv+SPUuGHibR6cz
         jlVM8wK7zVEaw==
Date:   Sat, 13 Feb 2021 12:58:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the spi tree with the powerpc tree
Message-ID: <20210213125825.6aa0da4d@canb.auug.org.au>
In-Reply-To: <20210212122759.GA6057@sirena.org.uk>
References: <20210212152755.5c82563a@canb.auug.org.au>
        <20210212122759.GA6057@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qv/XSwTuxVuIrfv4MLHh6Xa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qv/XSwTuxVuIrfv4MLHh6Xa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Fri, 12 Feb 2021 12:27:59 +0000 Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Feb 12, 2021 at 03:31:42PM +1100, Stephen Rothwell wrote:
>=20
> > BTW Mark: the author's address in 258ea99fe25a uses a non existent doma=
in :-( =20
>=20
> Ugh, I think that's something gone wrong with b4 :(  A bit late now to
> try to fix it up.

Not sure about that, the email (following the link to lore from the
commit) has the same address (...@public.gmane.com) and that domain
does not exist. In fact the email headers (in lore) look like this:

From: Sergiu Cuciurean <sergiu.cuciurean-OyLXuOCK7orQT0dZR+AlfA@public.gman=
e.org>
To: <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>,
	<linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	<linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Sergiu Cuciurean
	<sergiu.cuciurean-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>

So I am suprised that it was received by anyone.  Maybe gmane has an
internal reply system that is screwed.
--=20
Cheers,
Stephen Rothwell

--Sig_/qv/XSwTuxVuIrfv4MLHh6Xa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAnMkEACgkQAVBC80lX
0GzNFQgAmMzKZk5SdO78cr1fRqI6oOzGll9twzHgagqcjZwg9FFtyRIWl414wLQO
pg3Ssi1yGW/GOhf3EYAU/N01QesP2TSL/LJi8IjwGUqOWvAt0RAkIeb2pNSaW2P6
erhATifFN/F2xA87A3iXBOJ52JZ9zx5MJlDxLdqwRyVTd4H6W46QfFRHz9tFhz2V
UwaI/Ri79DA2uBq8RPqxvQy3D4Zoq63heeO9aQqK/pkQwbA2gdDfLuEcPMkEM1kX
Hym355gGoQt987niv+jsPjmFj7Pmb7nt6D+5W6pA2RME2vyNY6oMk5stCrDDNNjZ
3zsBX5x5bqMwFXii9zIK5Fk7+68t1g==
=eq/W
-----END PGP SIGNATURE-----

--Sig_/qv/XSwTuxVuIrfv4MLHh6Xa--
