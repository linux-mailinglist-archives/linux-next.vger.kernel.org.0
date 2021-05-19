Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75E93898E5
	for <lists+linux-next@lfdr.de>; Wed, 19 May 2021 23:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhESVyY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 May 2021 17:54:24 -0400
Received: from ozlabs.org ([203.11.71.1]:60961 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229455AbhESVyY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 May 2021 17:54:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Flmnp2fl7z9sV5;
        Thu, 20 May 2021 07:53:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621461182;
        bh=3Wr2asGiMeqShxZC14lvl44PWKk1mAJ+rNRv1o6iLWw=;
        h=Date:From:To:Cc:Subject:From;
        b=BZWffnfFuQjGQBKTF1mf0E4bmPRphA6L0ykcU0p6ZkQNMw3QdB82SeKytfaWMc2Iv
         deLRurHfvoq9X4c+oHpW01cG2q1nKpmL96PUionBwLyHb+ObJpeucGzr/CgrIm0FJR
         6GbrLyOEIc4MY6Jcxbqwk5XY1DSl8ZNVb9t6wHvohjVFcrg6V1rhi4SVqPaUH3mceG
         IBkEbS8m3Wtt/oAiSHMxddThL+te/GHkdi7UbLQsuhK/2zCQANlfMhDLcH/70L3y0S
         rR/v2ZheV9Y2Ji9m+dlx+7X8GftVnTFDb8u/Lf72FOGiGGR3pmVnKOQyFYyKlO/FAz
         tGvlhn44r2moQ==
Date:   Thu, 20 May 2021 07:53:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Ronnie Sahlberg <lsahlber@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the cifs tree
Message-ID: <20210520075301.6a2cf55c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uG56_pooXROXh8Yp_A=3dFA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uG56_pooXROXh8Yp_A=3dFA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  158c6b1e3dff ("cifs: fix memory leak in smb2_copychunk_range")

Fixes tag

  Fixes: 9bf0c9cd431440a831e60c0a0fd0bc4f0e083e7f

has these problem(s):

  - missing subject

Pleas just use:

  git log -1 --format=3D'Fixes: %h ("%s")' <commit>

So

Fixes: 9bf0c9cd4314 ("CIFS: Fix SMB2/SMB3 Copy offload support (refcopy) fo=
r large files")

--=20
Cheers,
Stephen Rothwell

--Sig_/uG56_pooXROXh8Yp_A=3dFA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCliL0ACgkQAVBC80lX
0Gx0ZAf9GyeA4JIcv6GdNywnjeyRZN1sml4sSb8oURSjkFspne0w+s5h3PgppZll
qtowBNHnVkZmSR2NNbI2TSrOgarTQiVKcKc9irTRwiurvCBK5TuGBi0wOnPCMmAJ
dWAJhG/QSVVFktULHsDyBDDW6sy/zvBCt0H9+LcFBw/Cv9uK3tcASLsa90Wsz/LE
4RXz40FK82KFu88IA8k0USt/HBcII4Tl2B4UAZ9b915CDVk72wj1DFxKSSvm/fHc
yTWqEqA36rtvmbKH8zDG+7MhW2KdU8pN15Vj5S1wvrugNBeWkLT3BtJXsKlOyHqT
sKehsN/gLOTzlLXAfqLUgfhk22q/jg==
=mTzL
-----END PGP SIGNATURE-----

--Sig_/uG56_pooXROXh8Yp_A=3dFA--
