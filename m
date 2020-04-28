Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108E61BCFD1
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 00:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgD1WVJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 18:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726044AbgD1WVJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 18:21:09 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFD4C03C1AC;
        Tue, 28 Apr 2020 15:21:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49BbhJ6K0Kz9sSX;
        Wed, 29 Apr 2020 08:21:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588112465;
        bh=3WUNfSrS/3iQEnyjoUKmYhjkbiqGenobmh2k/XGSMqc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=H1Rfr0+bkUs+XmIiUl3RRy+H6rV3VKINbzjfkb0Ee/ifrY/Z1/BJWxf7Il6UsHJ8Q
         XRM8L7u44gMsyjCtNLE4+eHXahX2u0wDt0MLpnM4zEAOPSg1Q6O5F/VMLodz6ajswI
         vv6VWBARxlmrOhkhohYsJ+EH8fkMEntWkSJRwYIsrqKKOOKYWGZXZ0Ilh6epBD6v1Y
         DbYTIpRWCE2k0KIUx6N9UqH8DHPAT8HXZ66sjD10Ovw8s5FLokhJVEp32j6PNrmTHU
         qPBoZFCLxFPFPS1kkG+Oxxsr1aQdOsGOwJBRouOf841O37787zn5RExqLEe0gD1yio
         dnKWbtye0wJYQ==
Date:   Wed, 29 Apr 2020 08:21:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: Moving linux-phy tree
Message-ID: <20200429082103.1734518e@canb.auug.org.au>
In-Reply-To: <20200428051804.GZ56386@vkoul-mobl.Dlink>
References: <20200428051804.GZ56386@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yhUI.YRcbb9iiYCWwc3fhT/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yhUI.YRcbb9iiYCWwc3fhT/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

On Tue, 28 Apr 2020 10:48:04 +0530 Vinod Koul <vkoul@kernel.org> wrote:
>
> Kishon has asked me to co-maintain the linux-phy subsystem [1], so can
> you please switch the linux-phy tree to new location [2] and list both
> of us as as contacts for this tree.
>=20
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/co=
mmit/?h=3Dfixes&id=3Dc31cd5a5b2f2e5c645f90a788ca6961a8dbbb2fb
> [2]: git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git

Changes done.

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

--Sig_/yhUI.YRcbb9iiYCWwc3fhT/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6orE8ACgkQAVBC80lX
0GwJigf+ML/gYTfDRbfmMag5kBQnBUv8o++5TAeB9JFK7DeVd9Lr5+HJa94tCA2i
ReF43kE4Ll7RiXcMeicuka0Inb49/UAnvDyYplMwHHnDHyQTL6rHNJv+yCuVwUY9
mNClEGOZgrFIl0/Rj+COv4T05g8m3ygsmdqNuJV/bI9wcoMDUpx4PxAY84j/2zeh
oiyQCGS5s9PoLAUzHeaPiwH72Uj+ZgRjU6LLYAKR4USMDmV8cuYaUPfK1/YlIVLf
QnrZfTbYRik38E/Sm0kgigucJu3yl2yT1Lh9BjUm71GvVM3C4fpLJ7SDLyXspYki
lgFn6d0+Xoxabferu7WC8nWlw3uCkg==
=Fz0h
-----END PGP SIGNATURE-----

--Sig_/yhUI.YRcbb9iiYCWwc3fhT/--
