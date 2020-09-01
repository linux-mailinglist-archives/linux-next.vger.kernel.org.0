Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB8E258AEE
	for <lists+linux-next@lfdr.de>; Tue,  1 Sep 2020 11:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgIAJD7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Sep 2020 05:03:59 -0400
Received: from ozlabs.org ([203.11.71.1]:49879 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725989AbgIAJD6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Sep 2020 05:03:58 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bgh2M5xvBz9sTS;
        Tue,  1 Sep 2020 19:03:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598951036;
        bh=EBqFZ+7gjT+GJqGJ9xRTYbNv77jFG4C4i0OaQps+hKw=;
        h=Date:From:To:Cc:Subject:From;
        b=DRtqDkGz/O9/EtHDHqYh4dDvQO1WObwKsOOuA+GB9C8EiLL5zn2gWmp9H4mZJwqBs
         WElOdqdc5TLhJUzEGKt2A7t4Mm433+SHdd/URaLoSaRqZuht/jsk2Vb9DcMtJSh2py
         eM0TdGokCsYbvvkMPVw7OUWRUIqa0px19o8TYgsWy5WpcO0UszukSnTF2AzUQIw0pS
         PdYQP7F/YKJBfgUHTy4VprLUopG4bIvNuZnkunmQJB2CXjme/XKLo3JlKByMoprwQJ
         o00APKU/RJ6pryfpdOeKs4b4KMIbZVzdQF4rSnkWxbzCIwKiNdXrqKnjIZwTjeaC5p
         IhD2dE9NWBFCQ==
Date:   Tue, 1 Sep 2020 19:03:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>
Subject: linux-next: Signed-off-by missing for commits in the v4l-dvb tree
Message-ID: <20200901190354.38b0d16c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/POKICJpTD8GfIrtLag1qN0H";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/POKICJpTD8GfIrtLag1qN0H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  063a27cb9820 ("media: tm6000: drop unnecessary list_empty")
  1c047c859965 ("media: saa7134: drop unnecessary list_empty")
  3fdcea7c763a ("media: cx231xx: drop unnecessary list_empty")

are missing a Signed-off-by from their author.

--=20
Cheers,
Stephen Rothwell

--Sig_/POKICJpTD8GfIrtLag1qN0H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ODnoACgkQAVBC80lX
0GxOOwf/SZ1MgrrSp2n7ghJmNc88l33v3luuTzZZ5jSLNyQPHW9sLFhmw9pRrf8i
GN+nWKkQVWp8HnajUfzqgUShyY9yzVOgGlcdZgytGaVEv4pu6nQGVoravvxt7UW6
kec4wnX36m+5XRnNgnvjJl1Lpx7YmyrBPR3bRbkQpU8lxvIFnzuRV9IWvWspLOC4
KZ3ewUo7mZNGVwBkNG91uhPe08a9LEFhDiprj2jt7ayJsPSkYI5JurkfA6jCIZBu
+sofWD7ZI7W/7O9L+SGANY9109rI3467Jk2uWBuKgfZNqR/ZbfYa8TuuoJPfuB4J
cm3yJLWsM05ql+6iZoRJF+RkebXuBQ==
=G8lv
-----END PGP SIGNATURE-----

--Sig_/POKICJpTD8GfIrtLag1qN0H--
