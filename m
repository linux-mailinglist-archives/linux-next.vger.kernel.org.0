Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDC036F6B3
	for <lists+linux-next@lfdr.de>; Fri, 30 Apr 2021 09:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbhD3Hs6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Apr 2021 03:48:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50627 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231573AbhD3HsY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Apr 2021 03:48:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FWkx34BT6z9sSs;
        Fri, 30 Apr 2021 17:47:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619768855;
        bh=v+iDnH1C1xLCEvECCCvOjVchRVZR6qRgzoqmxmjcvJw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hbOplI2oV4YT7HLgD8Lstu1ZbEQLi5662q1yFSNZgoAV9FQ2aSrGHGLY2KubZEeOA
         qVBqqSLQ/7Bwllwmrai4+HFjAJfS2N5pU2qj8k9F2qz/DI7awBUoENEPSYwHPgHPXp
         txCxCBv85qZskEWB6RdugAfVtXjLqX4hSS/BiagltIw61XbAcVSTIZ2bxIQ9mEPkOw
         7K+AZpKoj3orXEd7LKoZmgPPtpqohoe3OR+uwqzQCQq96UsguwydlMRoSgBP94A8oo
         lvhIVwmzSCJ+kvGZlcnvMBxW+mMVa3dFO4b7G+mfkCk2gdkJIPFUq9OJFbaMXJ46nd
         P41Vtmcs/54nw==
Date:   Fri, 30 Apr 2021 17:47:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Walker <dwalker@fifo99.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: removal of the cisco tree
Message-ID: <20210430174733.5a31d0c6@canb.auug.org.au>
In-Reply-To: <20210430044931.GA22125@fifo99.com>
References: <20200616150009.6b9b1140@canb.auug.org.au>
        <20210430044931.GA22125@fifo99.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JzPYsrCFe8+lKq=sJCBK4Rd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JzPYsrCFe8+lKq=sJCBK4Rd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu, 29 Apr 2021 21:49:31 -0700 Daniel Walker <dwalker@fifo99.com> wrote:
>
> Can you re-instate this tree ? I had planned to start using again, at lea=
st for
> a little while.
>=20
>=20
> On Tue, Jun 16, 2020 at 03:00:09PM +1000, Stephen Rothwell wrote:
> > Hi,
> >=20
> > I have removed the cisco tree
> > (https://github.com/daniel-walker/cisco-linux.git#for-next)
> > from linux-next because it has not been updated in more than a year.
> > If you would like it reinstated, please just reply and let me know.

I have reinstated it from tomorrow.  Please do not add any v5.14
related material to this branch until after v5.13-rc1 has been released.

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

--Sig_/JzPYsrCFe8+lKq=sJCBK4Rd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCLthUACgkQAVBC80lX
0GwCqAgAlsz2kIZFFZXmknnC4p+yeg/TaRGQMNmDQLdUP+iAdlIVhLPOeFyDvmYi
shpki8xKQDS+KNHO+48JkuXRDHayshmoWeHYzeDivszHumdtmIhF9dfKPgX/M4tG
r4gGTcYAhXa3glUKTX/NnQwQtamFzKPkRmY6xfJBum9o4f03DK3IQkB6uk3Q4hsS
cCkXNRVH84joaBs/leFGaZ5gO6EihsHF1JHq+A6z8Z/dJJymSUy1emp5Xw4HjPys
I9I4Yf6uzjAp7WGZPbrbL5EaCzI1gKNPFlPok7XgAZMvgIY0XSH79975G0f9CNjX
AAZCor6pmSL6xL5Evaxd9+NVdDK7xQ==
=iTb2
-----END PGP SIGNATURE-----

--Sig_/JzPYsrCFe8+lKq=sJCBK4Rd--
