Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F203C79C4
	for <lists+linux-next@lfdr.de>; Wed, 14 Jul 2021 00:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbhGMWn7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jul 2021 18:43:59 -0400
Received: from ozlabs.org ([203.11.71.1]:37449 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235536AbhGMWn7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jul 2021 18:43:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GPbFv20vGz9sW8;
        Wed, 14 Jul 2021 08:41:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626216067;
        bh=J/itNARh4aENrF5yMCdjo3tfisLF0MSFuwr2HJFVY60=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VyJM1Vq0nphVz/rNerR+0L7Nyo9FliPj3JVNE28IaPIS8/0DvmVwBszS4Qju6q4O7
         977+q1ADtctMKvZqF/ftx1u6CZzZKP6ThaD7JxqDcXHhN/FM60aESKzmq4QFN3o1h2
         RNZ/+8axINtkVnID5kBFvn7gi+igODlAif/iVVFGgWHJsPoQwFucPDprPFRI5oGYDi
         Xqbj3eCY4+XjMYplzCN7ufhyPy0f+FtEbWOSAAghAydTSlTU7ULjhqkUCmlCa5hvLB
         Z3ljzwPqtT3zeDxV9a0HjKENdc+81VhF4ixqInP2JK+6+lQnkiKMpeNG7XJvSsras+
         pCGknj4+4y8hA==
Date:   Wed, 14 Jul 2021 08:41:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jul 13
Message-ID: <20210714084106.0525b879@canb.auug.org.au>
In-Reply-To: <CAMuHMdUb_VvjGZUsnKuGpSwQfJMa0pqQ-tN5HCwi_-Am7angJw@mail.gmail.com>
References: <20210713180305.5ba41f10@canb.auug.org.au>
        <CAMuHMdUb_VvjGZUsnKuGpSwQfJMa0pqQ-tN5HCwi_-Am7angJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RgVhqow=b/sVknUkVFgF8WF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RgVhqow=b/sVknUkVFgF8WF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, 13 Jul 2021 10:44:40 +0200 Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>
> I've just noticed you don't have
>=20
>     renesas-fixes git
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git#fix=
es
>=20
> included yet. Can you please add it?
> This branch contains fixes intended for the current release.

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/RgVhqow=b/sVknUkVFgF8WF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDuFoIACgkQAVBC80lX
0Gw4zwf/ZQ2XLyGQeYBDRCtdYsVjEgbyAFLaWzWCTSxgPcXq4X4bNtNuSY2Ixtig
4cBWT0s2kvQuGaaZFyvqsOtd3NBWMkkB915tyi8TRIk6yydBGBAfDvClVlyFFqrN
fqEbu4zAalMe7CtHrSYLguD/JjGwfHcJM19AoJujYqo6VyWFFL/A/IFnceB5qZ01
wk530dv9RwnwmgtScAhsQFMvGyCRWUCE/53pjbDJHR9EYRU0C17z84x7ZfLt8THi
63yv4MwuvDBi/E6G5MN8rZAtt3Z6hhDd1XuKn+5xshISCOEI5FdKy0kWybvbTUpm
0GfN+Sij/Uh9cjVmJSZrXgn0JZTiJA==
=gKZN
-----END PGP SIGNATURE-----

--Sig_/RgVhqow=b/sVknUkVFgF8WF--
