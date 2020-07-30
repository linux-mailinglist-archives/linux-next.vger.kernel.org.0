Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95225233BF6
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 01:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730687AbgG3XPz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 19:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729896AbgG3XPz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 19:15:55 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B02C061574;
        Thu, 30 Jul 2020 16:15:54 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHmVc0pV0z9sTH;
        Fri, 31 Jul 2020 09:15:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596150953;
        bh=H0PekvttGilRr8EfYLLNLROEEOGZEAbmSxN8d2UBIY4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LH5DfwKk2Ii4aP0pevbtyr6n35p2a18H92xyoa5+DQzGC3VC65Dx8FADI7RWf1582
         7/6ZHBQJw8qs4s02E9QevNulW1rteHoirdkupArKzcOK4tAOjdAqZG1//EUeu8B0+t
         w3YYlnVWb3yYUUMRKpXAuhe+orVs5nPoXEaTs67ZOUKEs8+CZWWWt0ySb1UtFfp9aa
         Vy+RuLt6x2y6KWAv3qip1hQKtl1tLK0wIRz82p05b9dpbEavjtfi0ov4WvrbAGJByq
         Z2EuO9tWfHFMeHRrLVfbbHXU7NMBh4pOD9q8hskQLkVgRgDSRDC5wqmRthZE+PShWx
         v4FxwtjeP7ntw==
Date:   Fri, 31 Jul 2020 09:15:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Tarreau <w@1wt.eu>, Russell King <linux@armlinux.org.uk>,
        Linux Arm Kernel List <linux-arm-kernel@lists.infradead.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <20200731091551.6ffb11df@canb.auug.org.au>
In-Reply-To: <20200731085836.139d3180@canb.auug.org.au>
References: <20200731085836.139d3180@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/esTCAaVcmiVc0R1eE2PNo3w";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/esTCAaVcmiVc0R1eE2PNo3w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 31 Jul 2020 08:58:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the origin tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> In file included from include/linux/random.h:14,
>                  from arch/arm/kernel/signal.c:8:
> arch/arm/include/asm/percpu.h: In function '__my_cpu_offset':
> arch/arm/include/asm/percpu.h:29:34: error: 'current_stack_pointer' undec=
lared (first use in this function); did you mean 'user_stack_pointer'?
>    29 |   : "Q" (*(const unsigned long *)current_stack_pointer));
>       |                                  ^~~~~~~~~~~~~~~~~~~~~
>       |                                  user_stack_pointer
>=20
> Presumably aused by commit
>=20
>   1c9df907da83 ("random: fix circular include dependency on arm64 after a=
ddition of percpu.h")
>=20
> I have added this fix patch for today:

Looks like I sould read further ahead in my email :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/esTCAaVcmiVc0R1eE2PNo3w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8jVKcACgkQAVBC80lX
0GyWaAf9EFHRzGshoZghIc9tNzvlZJhnfWDJmdjBF+bfxodH4d1Ua2VwHEb0S8kL
op4Nga4yLJrEW9lf62TRAY7zlJ/49s4FkW3XBpNx1SsljUu3L6Q97yfo3C/GTmt7
kP2onVkEXQnFPGYw6/OvWWd/CGAiMOzJDpr+p083PCpcVHRt7bmDwUGK6H48V9OE
P7hF8D4H69k4IQsnnJ8JzCL45/fY65Ti99de6iHxMnA0f62UU+H68SrXFDW63Utx
uJUTdWz8fcGrG84z2D91o60CyQHnp9cENA5wW7pFOLZCbdCJy6A1iJDHFP5p7YRU
N+pTaSK3dFnOs992WDdrFWzvea4xhg==
=tyst
-----END PGP SIGNATURE-----

--Sig_/esTCAaVcmiVc0R1eE2PNo3w--
