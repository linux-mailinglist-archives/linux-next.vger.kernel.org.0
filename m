Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5026240A23F
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 02:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235841AbhINA7h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Sep 2021 20:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhINA7g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Sep 2021 20:59:36 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C021C061574;
        Mon, 13 Sep 2021 17:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631581096;
        bh=4bBuIPMdmELoKylP2iX669QdoWBwKrAGFrRPz3WvvPE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lnNSLp21rLaW0GmVIciJrY+OzGGH1asjn1nsX1tLQ7ky7e0ZjgjW0zNIXfW7IVOiK
         idCAvOP9iKLI0lVpEcSADgemxzPRnCETkk6VwYMFj0zRVSf1N5iiHjMyYcoQGkfafk
         N+r0o53H6WdcaAzHwerH0JGtllQ6zKBjZgScyZwn+mNugDwAOfiYN97HYHk7rfh+OZ
         3wY4VHwyJyTdVweNxGhHua0T6ScLGQXsabafbk0il5j7ryU06sI0V9HCH8WVmI0L4L
         KcBqMf+GF043kcmBGnWxAZJNSF0DmnMo/Mu4ZiKtzqrCkSF52ZvYp1nLrcxnKxrYQC
         zifa6UxR+1UQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H7lMX1Qk7z9t0T;
        Tue, 14 Sep 2021 10:58:16 +1000 (AEST)
Date:   Tue, 14 Sep 2021 10:58:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <20210914105359.5c651d55@canb.auug.org.au>
In-Reply-To: <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
References: <20210914100853.3f502bc9@canb.auug.org.au>
        <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
        <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UTHTjl21XVSe=CpidRPfhNW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UTHTjl21XVSe=CpidRPfhNW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, 13 Sep 2021 17:24:11 -0700 Linus Torvalds <torvalds@linux-foundatio=
n.org> wrote:
>
> On Mon, Sep 13, 2021 at 5:19 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > What version of gcc is this? Are you maybe on gcc-4.9 and we just
> > didn't check that properly? =20
>=20
> Hmm. That version check works for me (tested by just arbitrarily
> making min-tool-version return version 15 for gcc ;)
>=20
> So you got far enough that I don't believe you have gcc-4.

$ gcc --version
gcc (Debian 10.2.1-6) 10.2.1 20210110
Copyright (C) 2020 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

> I have no idea why it then complains about removal of the GCC4 macros.

Me neither :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/UTHTjl21XVSe=CpidRPfhNW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE/86cACgkQAVBC80lX
0Gx4lggAkRjo+wZPYMVZ8m6LU0Oh5xuknc9Hl+j/VClUpARA9WHSwiyIdBjK2Ncm
Cd9stopA4xLjDrF1PU+19NIImKpJbJjH6AJ6QrjWlhK1x24AQbWwE5bEDMJ5rNAO
MLLAXXexFZQbuiLRtx4bFwsGisYLnDtdmKAK/XBw5WKxy/yM4j26cDUHLB8lVvJq
MzGrwguzcKKtbE3Fa8H0eIvG++0I3UA2JG50YrK/Jq/ejdH46+a+Hn3xTYMxXm/e
ASHKEjr56GtKYYURtvc8Z/zKIuLpqs08tZDyXVEtLkG8AD/k+zn822O/YboTKNaL
LVIBPcRg+KGYMRW0iUz4Yo4+Z7/elQ==
=oysf
-----END PGP SIGNATURE-----

--Sig_/UTHTjl21XVSe=CpidRPfhNW--
