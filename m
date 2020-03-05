Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C25EA17A0A1
	for <lists+linux-next@lfdr.de>; Thu,  5 Mar 2020 08:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgCEHoi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 02:44:38 -0500
Received: from ozlabs.org ([203.11.71.1]:48623 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725880AbgCEHoi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Mar 2020 02:44:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Y2nw0f0vz9sPg;
        Thu,  5 Mar 2020 18:44:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583394276;
        bh=HQOjKU2saBqKtdOf9baWYIhRvPXjw1G4W3YpNZ8OZqk=;
        h=Date:From:To:Cc:Subject:From;
        b=nAHJxLWFDPtlnBYT4HmR54r43miirPhFSU/Qr2A2f1h32UHtq1FY6YnEyYGVLwUI6
         5TXLflfEe5juA6Q7vQTRfjK1GQ4RaPByDkvBGSk9Z2e6BJ5STHJ3kN1qGlTKNpYZxq
         mM7G+Rv7OxXKd80+YzCbOuiOtOKqrGxGnPaVY7mTNHpTc1qT/CtMYi1vaG5M64Z0MF
         QrJ6rNFfRcnmkY4IbCs+orcqYlJJlIYkWffT4WGUAE/CYIq5uDZuxxU9miVV1tqaM/
         qmbZbpDr0/rUuU2aoPBJ/K1TEeA8+WzzqgQsjnbyEKeDxXXBB/NNFik4JiSs+Y+UgH
         TRals66nXrUww==
Date:   Thu, 5 Mar 2020 18:44:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the
 devicetree-fixes tree
Message-ID: <20200305184429.0b6a38c3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.Y2z2ubC4qh_XDeXpSz8noP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.Y2z2ubC4qh_XDeXpSz8noP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  9dbf66696d29 ("MAINTAINERS: update ALLWINNER CPUFREQ DRIVER entry")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/.Y2z2ubC4qh_XDeXpSz8noP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5grd0ACgkQAVBC80lX
0GyflQf+KKUSw3VAQJn2uTDDbU6AXcwKeFuEwLlHZYdgh0I3RYe4HVZLvMixXFGR
9MmlYUR2bQDDv4EoDwQzhi1sP5akFujAQ5Nb96CuCGIGHZfXuJy2stY1m1gbOCzt
GF/Sovdx6eHpETUJ+Ky/Lz11mBwyoPPG6DhQAHQsViWc3xqNc5XX14iNAmD43tFK
3hA4J+N1ZjxqFm1LWGd3diJ+CrIodW6Latxzsc/kh1UtF3VC8CiNQWa3rXSDuCgq
06UZjQMq9LelRUAgRKr8/HvthLxTVtVjTfGpmAi6ZB7mTfb3nQr0iK+iFyZxJl5q
SZMLJt0XT+6VFQr7EvLr5jZ9kDKCjQ==
=Tyd7
-----END PGP SIGNATURE-----

--Sig_/.Y2z2ubC4qh_XDeXpSz8noP--
