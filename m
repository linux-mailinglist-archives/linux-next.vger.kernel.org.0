Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A73C1E903E
	for <lists+linux-next@lfdr.de>; Sat, 30 May 2020 11:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgE3JxR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 30 May 2020 05:53:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43907 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727964AbgE3JxQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 30 May 2020 05:53:16 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49YxZd5ZTbz9sRY;
        Sat, 30 May 2020 19:53:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590832394;
        bh=I1H8v8dbDnf9XHEHYvPBupzsc1Aa6EbfBeqV81M1T7o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cX19vHPBin+eO3UwSrQxz2LEDsRoPVhbpVebW8JOQgNZRRIYq1ILk1rDxgcd8CoEk
         aDbKg6Z1Z2tT4qUFtmB1w3341UTO4fcXhzEA26UZtbjWV5O0e31uRIhxw7+7F60ymf
         CYir8msnjCAG/asekYQ8wwd45yJ+/uwQhT9PkepveOHXax4HD8sQo8Lc2CH8Zide4/
         IZu13K8E9Y0JXXYsHZt6BlKAx2Ngc8lnYi6oKF83NR5dUMZoVWAMYHiUJ/zWsB0Tdc
         dWU+ADTMnKplSfNPcO0IVEhSODqt404FE2SYrq4LklE2M/M/xomypoiSLY767tm+U0
         ZPHlZxSkh7GDg==
Date:   Sat, 30 May 2020 19:53:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the arm tree with Linus' tree
Message-ID: <20200530195311.0ae2d1d8@canb.auug.org.au>
In-Reply-To: <20200530091747.GD1551@shell.armlinux.org.uk>
References: <20200528090941.341ad93a@canb.auug.org.au>
        <20200527232257.GS1551@shell.armlinux.org.uk>
        <CAMj1kXHRi3zUq-j30ptqUifOs+sn_h8i4ic+8xT9q1SrC+rjsw@mail.gmail.com>
        <20200530084103.GC1551@shell.armlinux.org.uk>
        <CAMj1kXEBcH4eW9dL95mfwTTUArxZxmWdjcqmzVeXjUPzat0YeA@mail.gmail.com>
        <20200530091747.GD1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+Rc3oGUDwmtygxpFvdmGz5x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+Rc3oGUDwmtygxpFvdmGz5x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Sat, 30 May 2020 10:17:47 +0100 Russell King - ARM Linux admin <linux@ar=
mlinux.org.uk> wrote:
>
> I don't know - I don't have a resolution for the first one, Stephen
> didn't provide a 3-way diff with his report, and I was expecting a
> 3-way diff from you for it rather than another pull request.

There is no 3-way diff, because "I just used the latter" i.e. I used
the arm tree version of the conflicted section of the file.

--=20
Cheers,
Stephen Rothwell

--Sig_/+Rc3oGUDwmtygxpFvdmGz5x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7SLQcACgkQAVBC80lX
0GwMIAf6A5xGHskwO/pwk2AXE6oyYGOjuyc1kG67ctR7EDUgZT/FBhTiiSYnUDGy
t2zzd+sCLcUnwZlkrSmCEkqv7mMTXknAJcBkkZmR5POqQuc0FzlaDrYEfQjbC6De
DDeVOqLT1jD0sGI0GXx0AJ0AAL1be0fzhRy0dpjSsi28JlSnQ3GXSDDwyKdRMRj4
oUV9Zv6+hydNG6u5oRLjJ2XsdpD6izNrNSu0L5jpOCLG8XHOaR0CLN7DS7rd5I16
X6CjBIf7GX7vZg0qLWk9Kq/NccdiaZ57ij1rqIzd43D2WSqs8Pgim+mxrBvdR+q1
UGCmIZuEFF5gGJRKcin24mX7OVxwuQ==
=is9B
-----END PGP SIGNATURE-----

--Sig_/+Rc3oGUDwmtygxpFvdmGz5x--
