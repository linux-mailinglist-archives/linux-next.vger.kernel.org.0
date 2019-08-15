Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2347E8E8D3
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2019 12:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfHOKLJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Aug 2019 06:11:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36983 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfHOKLJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Aug 2019 06:11:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 468Mfd0wT4z9sN1;
        Thu, 15 Aug 2019 20:11:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565863866;
        bh=FXkZV2wQC0ooyLnCRgInG5DeilSuwNCCOEw8zxf7GgE=;
        h=Date:From:To:Cc:Subject:From;
        b=dxGYEt8vCSvJvuIVQFzN3KoDrXh3gvsTWXAVsi1E4zSEAyToy9/kdXcXLxhfRpQCc
         Ni/bTRzWzx9XqOiv3xqMneJL4X1157GYw3jcsW40TU5Doe5P9N1lwsqOBBtTg7aXIr
         lcfUBIjujP2nrQCYSNaoAD1PsUadtMT1NkJI4+ZROlAS7OEAhi50OK8U3ExYzfx0wy
         eHuDZCpxuiVOoTHTmU4R7+IHz5cEI12gySUkKqovlLKdTyxSI9PYEr64JYMtNZZkyc
         5XK6W7VTdrSZK0sk+eGqc3GGw6qH05Ua8/QrfMFNK1eUaEmPlEemth8WqHbNJspnK4
         B+Bp+RK1qYN0Q==
Date:   Thu, 15 Aug 2019 20:10:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: linux-next: Fixes tag needs some work in the arm-soc tree
Message-ID: <20190815201030.7e726870@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NoG8Uo78I3L8Gembp_iLP=x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NoG8Uo78I3L8Gembp_iLP=x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  dbc3c6295195 ("ARM: ux500: add missing of_node_put()")

Fixes tag

  Fixes: commit 18a992787896 ("ARM: ux500: move soc_id driver to drivers/so=
c")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/NoG8Uo78I3L8Gembp_iLP=x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1VL5YACgkQAVBC80lX
0GxZSQgAnFlqIQmlXx2RIttBQD+FbFSeImwmT8SSc/DWZdoo6kvZjXu+6Dzzz7UN
e1hlfEtDhDYEkG4fWYYrtFw7zueWk5qXBrG6qrfxnAPUBD2UgmLdnpupSsupMjoh
ssq1z4c9882EzFYW0HKZgUq6PtrgU/zDYzAvB1m6nyPGH/EtXWRjGAgzJwngXFSI
KYpraA+MwxikxpjBypBdLnAqYnYB+zJKvYjxBAf9qomARYPm7wmJILKyfYre1S82
HMTnsR0czqf9m/nYnn0RJhG56ob3EjfWfZtMFKgeO0HvwcRh9QSCsYBSV2RpevPe
7fMDpyQcEmQvi1kT4raGhPvLtyX/+Q==
=USk1
-----END PGP SIGNATURE-----

--Sig_/NoG8Uo78I3L8Gembp_iLP=x--
