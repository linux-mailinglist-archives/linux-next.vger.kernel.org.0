Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09FC73938C2
	for <lists+linux-next@lfdr.de>; Fri, 28 May 2021 00:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234995AbhE0WkA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 May 2021 18:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233203AbhE0WkA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 May 2021 18:40:00 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CC1C061574
        for <linux-next@vger.kernel.org>; Thu, 27 May 2021 15:38:26 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FrjQQ1rV8z9sRK;
        Fri, 28 May 2021 08:38:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622155103;
        bh=B5qRpsD89HaPKiiUG/2tkOG72u7aUVMp0xq9Zi6VWFs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BqACpUKEd0NuRGEMffFgTXt/PvC/O/8zjlo8bsMPtqvLdNgckDHfZZR5InJVlbNe/
         NwG7SAmACSmLzcPxeqfCoRo+kP+ZfHGsYlcpD0AKyI997I61T03rn8K1Rm0MKty26f
         Xpo5fuWhuah77ZLWcFV3k7xWY3KCXLdWMF5Z2oXDur9fe6/HTLc2twKlWVqdIIffwj
         hBHBYJ1ytTJBVYFISWrLNNIon2j91DTcqpx9j4jamXk3VjqH90BrGhXABslG67Ihnu
         A0FRPLaKL3YDhVj/giHGq0pDiUOy2J9oR3iILHUpSdEe1P2ChBmaDgzH/NHJKpBUHr
         5dYgFXw5gjUxg==
Date:   Fri, 28 May 2021 08:38:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Carlo Caione <carlo@caione.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-amlogic@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: updated Amlogic repo used for linux-next
Message-ID: <20210528083821.72dda431@canb.auug.org.au>
In-Reply-To: <7hmtsgrpkt.fsf@baylibre.com>
References: <7hmtsgrpkt.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fhl1dbjAXh5Y/_qBzL7cgkW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Fhl1dbjAXh5Y/_qBzL7cgkW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kevin,

On Thu, 27 May 2021 11:36:50 -0700 Kevin Hilman <khilman@baylibre.com> wrot=
e:
>
> Please update the tree used for Amlogic SoC kernel development
> (suggested patch below[1].)
>=20
> We've switched to a maintainer group for this tree which is now
> co-maintained by myself and Neil (cc'd)
>=20
> [1]
> diff --git a/Next/Trees b/Next/Trees
> index 2d22ca1d2911..1794b9144f3a 100644
> --- a/Next/Trees
> +++ b/Next/Trees
> @@ -103,7 +103,7 @@ arm64		git	git://git.kernel.org/pub/scm/linux/kernel/=
git/arm64/linux#for-next/co
>  arm-perf		git	git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.g=
it#for-next/perf
>  arm-soc		git	git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#f=
or-next
>  actions		git	git://git.kernel.org/pub/scm/linux/kernel/git/mani/linux-ac=
tions.git#for-next
> -amlogic		git	git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux=
-amlogic.git#for-next
> +amlogic		git	git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux=
.git#for-next
>  aspeed		git	git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.gi=
t#for-next
>  at91		git	git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git#a=
t91-next
>  drivers-memory	git	https://git.kernel.org/pub/scm/linux/kernel/git/krzk/=
linux-mem-ctrl.git#for-next

I have updated the tree URL and added Neil as a contact.  I still have
Carlo (cc'd) listed as a contact, is that correct?

[The following for Neil's benefit]

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

--Sig_/Fhl1dbjAXh5Y/_qBzL7cgkW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCwH10ACgkQAVBC80lX
0GyD9wgAlCOJVWafrzL8wiCxZw0mxBuboVNgc85DWbsNk2J5BtjZZm1iZWrFV1/a
ZwZAKQmyQvr2KDu1NgBupDq5HI1ELi1o8Uy+YXUSGkdT8HdATpbillTaiC9Mo9N8
f+3StzJAV24SVz7cVjZg9UIS7mWgSW29nrSa6/Q5yq5zacfoh2vsVWOaAsykdMH5
FZzFOkixvxtOuGoc4+MXc0QFnfLtuPLYXvgXUjPTtFbniLuhZuOdAB56jaXqCl9w
TgjzOBJ6lHsKbBfvEXGVb+87pP2fQS3dnfuRN8zW23n7IYpS8pXHQ2eo85PLqALP
MIfm9SaXGyFm6ColDqzC3U+LbipXoA==
=ftyd
-----END PGP SIGNATURE-----

--Sig_/Fhl1dbjAXh5Y/_qBzL7cgkW--
