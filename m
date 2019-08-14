Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6AD8CCFC
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 09:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbfHNHf0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Aug 2019 03:35:26 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42821 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727017AbfHNHf0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Aug 2019 03:35:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 467hFP5gLBz9sNx;
        Wed, 14 Aug 2019 17:35:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565768123;
        bh=AbhlP0YN/t21Gh6VHypds9xO7GALcd9PcpzEvbJBWLY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mKr4y7ubBT1RSL5MteT4KE5I6wGGlkimt2wrdzWZjTnXHZuelmhaAF0qg51WQBf0F
         Ay/pHUiASdiZ4kfV206QP/fdJyucfmeYoLpFQy8MS8UkNTCq4aDGQee3nSIq+ZxP3W
         8tZ8BkhBCcVif7e7iNc+nsc6CU15aPjtRNd3VxXtt1gEHA+GNySe+xhr2oePwAzHL2
         MdrDb72Kpm6aCGotb5ij4O3lox8vek29gLNS5CQGeaUmjpLLOanllfsNjoZ4pi8/T0
         a8k+YvwSF1wC/lBLI8J52j4v6WhCHTbtFGeonHn9kP6Pe0hKjvPOnEUPBkYhCgtcTv
         Y+BN8QtTRJTyw==
Date:   Wed, 14 Aug 2019 17:35:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Matthew Garrett <matthewgarrett@google.com>,
        James Morris <jmorris@namei.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Aug 13
Message-ID: <20190814173502.26849651@canb.auug.org.au>
In-Reply-To: <c17d1844-7e13-aba5-0fc9-98c4b247c147@samsung.com>
References: <20190813191924.7c5310dd@canb.auug.org.au>
        <your-ad-here.call-01565700115-ext-9407@work.hours>
        <CGME20190813145654epcas2p2981ea6b19b84470dc37825469cba91de@epcas2p2.samsung.com>
        <20190813105645.4ffba70c@gandalf.local.home>
        <c17d1844-7e13-aba5-0fc9-98c4b247c147@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hKv=nLl41CRqYFReUFUYyDM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hKv=nLl41CRqYFReUFUYyDM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 14 Aug 2019 08:14:18 +0200 Marek Szyprowski <m.szyprowski@samsung.c=
om> wrote:
>
> On 2019-08-13 16:56, Steven Rostedt wrote:
> > This looks related to what Marek posted.
> >
> >    https://lore.kernel.org/linux-security-module/3028ed35-3b6d-459f-f3c=
8-103c5636fe95@samsung.com/
> >
> > Care to apply the change he suggested to see if it fixes the issue for
> > you. If it does, Marek, can you make an official patch? =20
>=20
> Sure: https://lkml.org/lkml/2019/8/14/75

I have applied that to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/hKv=nLl41CRqYFReUFUYyDM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1TuaYACgkQAVBC80lX
0GzxBwf/XZyO2R13ZCKJdXnXCGQnkbohwC1M6LrhuSQ6nGt1zyBClZ85ToZy/t2B
2pn2uPEgAiJv6QtMhEt2Tza6Ch1PYhWsRqut19JfZZLzy1qpY2KEY4AiDH5Ywvur
Y4l9iJcOnE80XifjzoXrO8tnBZnWZly0xxb7p1ERtIcatE2lNUCA9y/jUHI32sm3
rdQjZ4PY5ex5QL2jCxjWC9ZNPbEmy+KqAvsdxkiKppTzEya4SSxIz8MS9pU3ZVtC
QoSRYcSd9HGZxwwmWW1EUiRREXTAxFBo8y/ra/O0YYhjgoPmX1oDSkd2lIQD7lRv
P6Tc0rNUgBbyQj8kKLR043OmE+qdHg==
=Lk/j
-----END PGP SIGNATURE-----

--Sig_/hKv=nLl41CRqYFReUFUYyDM--
