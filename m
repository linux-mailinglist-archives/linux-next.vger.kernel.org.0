Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDEF428422C
	for <lists+linux-next@lfdr.de>; Mon,  5 Oct 2020 23:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgJEVh0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Oct 2020 17:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgJEVh0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Oct 2020 17:37:26 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3742C0613CE;
        Mon,  5 Oct 2020 14:37:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C4v7z0VqVzB3tZ;
        Tue,  6 Oct 2020 08:37:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601933839;
        bh=iqKQLzV/9MJ4NlJgoNl0vHUi9R13MPmpW2o15p6wdSQ=;
        h=Date:From:To:Cc:Subject:From;
        b=qE6ZL/5iK1gljFs/d101JfILjdDIXvJJa6swE4QEwKSrGHqV6Q6g6YN7Gtw+DSN0B
         xe6TimBl2LoOmM4TPJKp6pt5EzSdHWLsJKA8AMZSDSEvajZlZnHzKvSOVBhb1khWCd
         y5dmjB/r2vnTOSjXnKCr9mY1zeOaUKVSbbcVI4eKdkLTLKXr8hVucKAVFGH7IRI6cf
         I44TR11izDdriSINvFwbZHqwxv9QxMz482yfcNlqYGyyXxk9mdXJF9H6xdDz4ISOZP
         WVUWDI1pRpcrU2DvnORNLXiFBKPRJcDIsAYfBGCoYc6KqQrNaWeaEGWeyu2v84oYI6
         3eStAipXGfG4g==
Date:   Tue, 6 Oct 2020 08:37:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the dma-mapping
 tree
Message-ID: <20201006083718.4f3ef310@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Nej0ub_i+pHPOWozsaU0XVM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Nej0ub_i+pHPOWozsaU0XVM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  82a18d4ce1ef ("cma: decrease CMA_ALIGNMENT lower limit to 2")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Nej0ub_i+pHPOWozsaU0XVM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl97kg4ACgkQAVBC80lX
0GyYDgf8CSO8JWh0Cazr82eEloh7y4MIwr6XKgKVblTguuvlBFAKJv1Sf4zRpypM
ON0nUBB8znqbm47U2r+Zs5Mloc0jiPN/bj7sP3NJE2XZycnEL0rx7TU0+R/6k1p4
akH/sreJdjKxZ+xosPuxftA794th1cSIHTABO4ziFVnfreYThC+eqMgHLBmohKNA
tM4eTBaOAKqkhfZaYhf8SKgG4Ia8MP6OWnF5aazd+nr1LgamrenVs92+32nfE/JN
qMdNnhJYC5oFaiQj6PZ8tdtBkGGN9SEQNy27U0t4qoNhzbhDjLZ9wOwY7GmZdp5x
NMj3FFE46aN3vQitB2+i9EVvs9cOxQ==
=uJnf
-----END PGP SIGNATURE-----

--Sig_/Nej0ub_i+pHPOWozsaU0XVM--
