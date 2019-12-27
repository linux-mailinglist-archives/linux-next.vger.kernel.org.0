Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9330F12BB24
	for <lists+linux-next@lfdr.de>; Fri, 27 Dec 2019 21:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfL0UkA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Dec 2019 15:40:00 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:53679 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726527AbfL0UkA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Dec 2019 15:40:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47kzGP0kMVz9sPn;
        Sat, 28 Dec 2019 07:39:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1577479197;
        bh=QNtvOMPUphKVzamQ66yK/bHLOgZ90t1QSmvpYzgK35I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=D2PFP95t0aigqHwCskIVohi6dW2a9SJmgNUDnq8ZG2AXfDx2hxPI+Ec4JgLOTlvh1
         z6FYpp2zTNlVgbfIpEXZxuUllN4+P0KCRo40OaAq2Bb6tfrP67qQrmbxChScGthi+I
         bZwbOQnLcRyc0aDUZMM7ZSfOUiNodgQWj4TQvQalIOVKuKXkrBxnpIek1FFaPg57FQ
         71Fos0jzjDuZBQzZVmOJQJez9ekdkea9Mf2q0DQDhDalS2DLpdqTVg1IYDowrdv4Qo
         719EZeoDOOlME31f63Sf9QNj+KKwqeIX1FaOhcQfXzKP2OJVnUpX0EOoQug+oqVtqC
         +5Xje1mI0xaAg==
Date:   Sat, 28 Dec 2019 07:39:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jaedon Shin <jaedon.shin@gmail.com>
Subject: Re: linux-next: Fixes tags need some work in the block tree
Message-ID: <20191228073959.5b3e73b5@canb.auug.org.au>
In-Reply-To: <d3ae7893-9b60-ecc2-4a31-65d009ecbb95@kernel.dk>
References: <20191228065553.6ba5d28f@canb.auug.org.au>
        <45665759-a76f-5631-51bd-488b04f6bf03@gmail.com>
        <d3ae7893-9b60-ecc2-4a31-65d009ecbb95@kernel.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QC1rb0voca7FCwExg82vX/g";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QC1rb0voca7FCwExg82vX/g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Fri, 27 Dec 2019 13:29:40 -0700 Jens Axboe <axboe@kernel.dk> wrote:
> On 12/27/19 1:27 PM, Florian Fainelli wrote:
> > On 12/27/2019 11:55 AM, Stephen Rothwell wrote: =20
> >>
> >> In commit
> >>
> >>   1a3d78cb6e20 ("ata: ahci_brcm: BCM7425 AHCI requires AHCI_HFLAG_DELA=
Y_ENGINE")
> >>
> >> Fixes tags
> >>
> >>   Fixes: 9586114cf1e9 ("ata: ahci_brcmstb: add support MIPS-based plat=
forms")
> >>   Fixes: 423be77daabe ("ata: ahci_brcmstb: add quirk for broken ncq")
> >>
> >> have this problem:
> >>
> >>   - Target SHA1s do not exist
> >>
> >> Perhaps you meant
> >>
> >> Fixes: 1980eb9bd7d7 ("ata: ahci_brcmstb: add support for MIPS-based pl=
atforms")
> >> Fixes: 7de3244530bf ("ata: ahci_brcmstb: disable NCQ for MIPS-based pl=
atforms") =20
> >=20
> > Yes, those are the two that should have been used, the two commits were
> > extracted from a downstream tree where the upstream commits ended up
> > looking slightly different, my script does not (yet) rewrite those, Jens
> > would you want me to resubmit or can you rewrite the commit message in
> > place? =20
>=20
> It's too late unfortunately, Linus already pulled it. So we'll have to
> live with it, at least the commit titles are correct so it should be
> manageable.

Unfortunately, even the titles are not correct, so they took me a
little time to find the correct commits :-(  This means it will also
take the stable maintainers a bit of time.

--=20
Cheers,
Stephen Rothwell

--Sig_/QC1rb0voca7FCwExg82vX/g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4GbB8ACgkQAVBC80lX
0Gy9qQf/TJ3qzsLzVKsFRlSs+dTKdDyNKBG9RQMy+yPskMv62dvvIUzQwfmExctJ
FWRC5Jrq7QPr8Ty/7QF986Nxg3zrTraX+oQoj8ALG9UgYHZ47kADMBpYjMWJia4k
7KMf+nW4EgSAXQgOTCs59Uw9fXtZ02rJIxqT+rt6/qgsQZvvzZ261ov6O6llqyoB
4byKb5wx9JTVBc3xbpqAf3kgdt95qTnlGN6qp8FiwgnuJz/VorTahOWUyfH3pPJp
8wAVdN5XXijDPsUhlmBkY1H02t38/BExmNkgxNimXWUMX5hU6N1CAMyjdQzyXVNr
cbdPgRhR/VG6DlE7nOhpgc8ngouAsg==
=6PsD
-----END PGP SIGNATURE-----

--Sig_/QC1rb0voca7FCwExg82vX/g--
