Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 923CA2E8BFF
	for <lists+linux-next@lfdr.de>; Sun,  3 Jan 2021 12:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbhACLdY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 Jan 2021 06:33:24 -0500
Received: from ozlabs.org ([203.11.71.1]:43061 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726008AbhACLdX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 Jan 2021 06:33:23 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D7xSm3rL2z9sT6;
        Sun,  3 Jan 2021 22:32:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609673560;
        bh=aOxMdxTiKKWDgvmaly2Mb6LQmZOgKi2ub9umQm8x5FE=;
        h=Date:From:To:Cc:Subject:From;
        b=cWgnmliGabxWJeXiwF10I8+safed4GrkX4H5qqtK65tsmBCKUqRNq5fMbk5XB+e/o
         ktfwz9S2Nq7/qk7XAQhX/tdCM/P1ilWbP/CdhU+pnOiwadLYSpW/XfQHzo4/3JGGhZ
         mRFfwklpqRHamW8jwwRtrpQJtcGbt5GapFI2gQG6KFHkGssdl0l6Gyx4vrYWJbT0DH
         7j60WAYs0OeJuHZ34T7LognLpXN4f4zoZrbtIqlHqszpdQFPwkwpB6j70w+Poi5fcm
         bV63qoSdhQcVRhbNtiNmRWNeyL/Fcu0EszzoC4J7PJCqE5JhB7X4gQgoAecXVUbsJm
         4mx3c3EjjdfHQ==
Date:   Sun, 3 Jan 2021 22:32:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: error while fetching the i3c-fixes tree
Message-ID: <20210103223217.478bc238@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/66w/rusPusG9zizKvuhpQ_.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/66w/rusPusG9zizKvuhpQ_.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the i3c-fixes tree
(git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git#master)
produces this error:

fatal: couldn't find remote ref refs/heads/master

Should I maybe use the i3c/fixes branch instead?
--=20
Cheers,
Stephen Rothwell

--Sig_/66w/rusPusG9zizKvuhpQ_.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/xq0IACgkQAVBC80lX
0GxvwQgAjSkI5SG7QJdmnz5SM0ac/QcgV5JbwdyOxIYj+ljzz/kkk0WiZrai7NZg
/lVK8D5p5pot0C6m365hSzbNbWyv+JX5N1p6Xwm9RfLWmDgCRYqU4pN+NaHc0kzc
wgBdLjZjiLjB6pqmYUBJtNDSNNjK9ZcW1Br45kFfZHdtSg0oYDb0AETgVkHb6vBp
eJE66emc3csEeKhvhK8owTfqknX+QJVzfiaf2AUmgwyqUyi8REh7e70XBavwFYpo
PNDCfNDogxDnqsOozt4kKjU3CEinkd1uj4EzaxiYVTKKm7j8zLnQGFyXk6Hp+r7M
6+SvG1vOz8yebcy/8k4dgs+K/1Ieaw==
=m3qL
-----END PGP SIGNATURE-----

--Sig_/66w/rusPusG9zizKvuhpQ_.--
