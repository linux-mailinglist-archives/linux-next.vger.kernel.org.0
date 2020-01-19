Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D991E141ADB
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2020 02:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgASBWG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 18 Jan 2020 20:22:06 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55901 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727070AbgASBWF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 18 Jan 2020 20:22:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 480cTk6Zszz9sNF;
        Sun, 19 Jan 2020 12:22:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579396923;
        bh=iJCmLNB7VaN1PDmQpq3kFHAT3Ea/TWkjVPfNL4T6SlM=;
        h=Date:From:To:Cc:Subject:From;
        b=c3PhgBRBSVcQ9jUByIBYSIWfOLH9OPxj+e7ScC1o1ykwahwzTOS6uPpyBQ17A6EL9
         VpGtz1MOIRqItu3C3eKsyKoWlI9VXl/HSsKurhO052RHRuCxYI/V9H5dw7gi7JHGBz
         z++zqR3e43YfiJhhLkz/Fqu7AuHYMc3NvuOeld/cgD3pGI5Et0ivK4JeSm3wxM59p3
         gvY2HZKIfeqWMin5wHinJ7wOs7Y2zOOZYtn1x88M4S1ukn9HNR5GEU5ebyaxnyurxT
         J6w7AIXBwKnjwWaS40cH9C0C62ojAUjenkDYy27G4iiswGBJw/5LRcXqztr89eFe2H
         yyzgezix4Jd/A==
Date:   Sun, 19 Jan 2020 12:22:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Message-ID: <20200119122200.460fa314@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LOC7_Y4b3hsPY+26tWleHCK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LOC7_Y4b3hsPY+26tWleHCK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  e09386c25142 ("cifs: remove set but not used variable 'server'")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/LOC7_Y4b3hsPY+26tWleHCK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4jrzgACgkQAVBC80lX
0GxVjQf/WAl5mffVm1r604/YYdCL+IXhGJq2llrHqd5cJ+OdOuyHdm3jYcqZSd50
8RdclWpOYNWU1PC7lcNU2GwmCHxgpGd5SLcFPdc9QGT6WVhuizMgftpAdSjvLaE2
2CWjGXoqXq8yizITfiXsagFFS04P0ZUGhlWrYrQvSijxOoa1dxCMndvIlxLZKls9
eFrI6mYW8OMaQkotEL/fhWWAvhyWjvfRRWm2/VimDw2eNfgGejSNl0/5KpCKADPf
gOuY4NDZ/7pvtbjbNMlpNG8lqS04vt751NT50pwl+RseVXIJvlQ8LhRpebNoTrFv
oi38UsqBu3K4hMC42bt//a3Hok1DCA==
=Pyb0
-----END PGP SIGNATURE-----

--Sig_/LOC7_Y4b3hsPY+26tWleHCK--
