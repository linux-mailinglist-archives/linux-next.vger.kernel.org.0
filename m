Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7AD2F95A0
	for <lists+linux-next@lfdr.de>; Sun, 17 Jan 2021 22:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729331AbhAQVuF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Jan 2021 16:50:05 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55181 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728042AbhAQVuC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 17 Jan 2021 16:50:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DJpTq4RLfz9sVn;
        Mon, 18 Jan 2021 08:49:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610920159;
        bh=5z6wkdBTCB/75/iPjTRc2GPKy8SLN9/ijjIZK51xKM8=;
        h=Date:From:To:Cc:Subject:From;
        b=GF2/cK5crvlIXSoIFlOOaQaBbPPTSEDc44NBn/+l28ZN4DoT4KI/NpbJHxyXiX+pg
         X7lTXRGtRu9fCJiE5TQwsymd5El+1RVXZGv9xEC5QhPhz/6oEspA35PBRL4e7l/IiG
         luP5AalFrVtKc6bcXvGDUgBxwwB4cjw1Xtu84suRMypV/k9pNUy78LpFKsmSBn0x9f
         DSzY4APCKSuVNXnKSl/aEaK0QV2+JrDAn7A6TMs25tizNfIuKJfjvEtmcgzGifhapY
         F6pLgQjIl+rnk5at1gdJ5ruQXxGw9LCUt6onZeXy5nu0CRuElb+G/k4T04GU8krMX2
         ABkdGABWeHnYw==
Date:   Mon, 18 Jan 2021 08:49:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guo Ren <ren_guo@c-sky.com>
Cc:     Zhenzhong Duan <zhenzhong.duan@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the csky tree
Message-ID: <20210118084918.356050f3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=F8TlDbitBZsH4gKP+lZDrI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=F8TlDbitBZsH4gKP+lZDrI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8bfb676492da ("csky: Fix a size determination in gpr_get()")

Fixes tag

  Fixes: dcad7854fcce ("sky: switch to ->regset_get()")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/=F8TlDbitBZsH4gKP+lZDrI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAEsN4ACgkQAVBC80lX
0GyjpAf/d09FYbinZ8MzHMKpDogEZ3pa6SUPQhyqimcDjBP1aqsZ5wbzLp/lR4Sz
0k7KAeKBWFkFchLIf25YDqtdwURdKv7ANkgTCtZVrNmsZsENnGCbOH2JJ1LUH1og
zl7RuaouWSQRt32z4ujyAlCgEg9+t1wpqW8gOoN4ihLiBxfm2BUd7sILUsAywfoD
UX02pQJ9tQ3tCqfTLG4myNUGUNQ8BBwXAWRHYTuEvy+Ue89DL/Qt/znrm1ULxO68
N0uAYa1bTsTYj10qszWmxep1pRA96V5bBrSfeL417etCSVsN5XojznEK2AF0ZHGt
igNC7pzhpnDv5s+fBusqUCyE2qYabg==
=i48N
-----END PGP SIGNATURE-----

--Sig_/=F8TlDbitBZsH4gKP+lZDrI--
