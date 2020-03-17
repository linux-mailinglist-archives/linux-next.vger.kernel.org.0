Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E66AE188F49
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 21:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgCQUug (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 16:50:36 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38983 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbgCQUug (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 16:50:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48hlgG1Vjtz9sPJ;
        Wed, 18 Mar 2020 07:50:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584478234;
        bh=YxislPlYDcOrbEnlAds6A8PAKFcAav8LkLzt+kSz4SY=;
        h=Date:From:To:Cc:Subject:From;
        b=oYcqLL7NgrNuGaIMJIrjz1kdu9lxBVyn43gSCqFN80uOwmt3h3dFJWeJVg5yGfZqo
         JspQwD4mJxoAXSV6uIt5LEa5G/mjF2/JB5D/KMrIk9EQPZouY8EMjJbTI+9ngQNHqK
         ig8/rJ1c+OAA5n9mvoDDX999ip5IhJnHQ33mKAOCBU5nZG5dMU9Y+D4AwkVykCp6Et
         GRvttE26L+szGybMwyNpOyJxWaNxDKCusjgdpMvM6UcYqGwSov9ldsvu+E4tBj/qn/
         E1WlMe7Z7ZIQ+VtoijFfdzva3PpGhcUQqiB8rQ/LICBpIeTt6gS3IgEsYVQXGZ0zdI
         G6rx2QvY/0YJQ==
Date:   Wed, 18 Mar 2020 07:50:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: Fixes tag needs some work in the hmm tree
Message-ID: <20200318075033.4d06b1be@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZRJgaeRkzV8__XxmSCxCH7T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZRJgaeRkzV8__XxmSCxCH7T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ee37d9e6e474 ("mm/hmm: don't handle the non-fault case in hmm_vma_walk_ho=
le_()")

Fixes tag

  Fixes: 2aee09d ("mm/hmm: change hmm_vma_fault() to allow write fault on p=
age basis")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/ZRJgaeRkzV8__XxmSCxCH7T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5xOBkACgkQAVBC80lX
0GxN3ggAhjiTiQKbNQ2Wi3SP1s4/L9Q3XyLBFZAKeK7lZrCQ49QTqOlFqJY9AiF3
dxFcwat9O7l3hX6ZwJyimPWCVEWjeB9L7bYaIyrj/6+Zha6dg4BrxifcPmuIukKC
LZQR4tgjET+VOYKH+wJpD2Ac9vAC2pOkGx39NuYohh3nSDPc193J5gLECKoMDnIJ
TtZ5Y8U6MhVL5O+SdAJ6I1NdNsRUKQtemw7Kz2fYeq55LhAkKfmQTv7ts67LMFGH
rD7TYIJWQzp7YhK4l1QFz0pgDIhBZZEtM+XDQ/oT0HoUUzWLLkpykEJ0vvLrzwcS
79tGbnt4q1U+tBwUE+UOfO14jC9z3g==
=/FGJ
-----END PGP SIGNATURE-----

--Sig_/ZRJgaeRkzV8__XxmSCxCH7T--
