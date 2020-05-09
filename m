Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F83B1CBBBF
	for <lists+linux-next@lfdr.de>; Sat,  9 May 2020 02:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgEIAT3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 20:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727878AbgEIAT3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2020 20:19:29 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B94D2C061A0C;
        Fri,  8 May 2020 17:19:28 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49JnrC50Gdz9sRf;
        Sat,  9 May 2020 10:19:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588983565;
        bh=4ltaBj8up08ni1Gj1qR5Eh1Aj9N+2Ghk5iD5CJLi9Lo=;
        h=Date:From:To:Cc:Subject:From;
        b=kljGBKCX2Xc9bYfsMPxYZeZaqppuoNbzdElQgQgfaceLDS7n6E2ADCYzGM0FmqNdi
         EalsE/L6NUIp5jsWlep5WY2RY2Z6asDoq/N2IYjYTy8uvl5n4AsmPKQzzKq7sziKgS
         CcRnhRJsS9ZbiXOKJZm/rZif33LSgnvW+HYaoGfkaog/OGdzXlWScgw+O6bem7NZIb
         hL+cKc+MvY7vNgBs5amBnMZjlu/wN6qMTrliB1XtLqRSHDPM7uHQUFcoyaeAhqXLGK
         vRY7vlqgAM2ITEPRyQ79pTfQ79vCLd1X6+Jcu6CbbVcmYL9NAKaO/0n7jMf+epO+CM
         pWuTZwyxWpx7A==
Date:   Sat, 9 May 2020 10:19:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joe Perches <joe@perches.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Mike Rapoport <rppt@kernel.org>
Subject: linux-next: Signed-off-bys missing for commits in the akpm-current
 tree
Message-ID: <20200509101919.36231cf9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dzDGQRzlgx.yz6yk50vTN0x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dzDGQRzlgx.yz6yk50vTN0x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  a41ffad2df78 ("mm: free_area_init: allow defining max_zone_pfn in descend=
ing order")
  ed1e07587fb4 ("mm/gup.c: further document vma_permits_fault()")
  da5d272cd01a ("checkpatch: test $GIT_DIR changes")

are missing a Signed-off-by from their authors (I haven't reported the
-fix patches).

I guess the first one is actually a fix patch and will be rolled into
its parent.

Also, the Link tag in this last one is invalid :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/dzDGQRzlgx.yz6yk50vTN0x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl619wcACgkQAVBC80lX
0GxoyAf7BC1NsVPvyosai4EjA/IuQISKb124WOTOGRXw+n9ajnt72nToEc1VRJz7
wJkLlO4jYuRdnptpEHv8D+dVWemRzf83M62OqH70b2qQTPDmyVWeAT4174kKsycU
Kg3KztbM2jh1TtK06zaFtxQ2hLDhQSyQyMk21Do26Apyw4pdqsxO6CcZV0Vn/vvk
0yjmqpzJJlq5fFklV+N8unC8sEM/dFTk3dnJ5KGirFX7DIalfLXSoLm2F9dsKIRQ
PjJYa+7sdRxzgkhdDJcTDwPZhKA1SQYD+mQ9Dh1kuzs7SOB1Iy2udDTvOFzxyYSm
tI67azH3pbg9hpQS5uhkP0/4EykqPA==
=CmW8
-----END PGP SIGNATURE-----

--Sig_/dzDGQRzlgx.yz6yk50vTN0x--
