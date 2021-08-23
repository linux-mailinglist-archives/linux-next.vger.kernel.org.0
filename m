Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9363F47F5
	for <lists+linux-next@lfdr.de>; Mon, 23 Aug 2021 11:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbhHWJ4b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 05:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhHWJ42 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Aug 2021 05:56:28 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DCDEC061575;
        Mon, 23 Aug 2021 02:55:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtSKp4R2pz9sW8;
        Mon, 23 Aug 2021 19:55:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629712542;
        bh=zwzpiVdFpUOY3sgpUH9+i47HU7keaNx8ICF/xEg2hKY=;
        h=Date:From:To:Cc:Subject:From;
        b=Ldz2HmwxLh7cUWHIhCxZj5vYjNzl7SWL3bsnjAU6T8556c06n6QdNJRBkwCkGx6R7
         LW5E4tfDMsVyafrAkVGfF7n9wjnKz4DZ38rvLkndsoOFGvrjibQeKLySV28x4loW7X
         sfyb4eV4cba+P4/miXxfvsmpLa9xjZLpYo2+hnKIk9LUOFUUDgz0xggolkTbRpUa2U
         7fStyKn8qcQI3GRiX2wUFrFrMuDk6+2WRuN00kvJUGOH6uFEjkhJEmjGyfoMlhIcxV
         N/YwuzAnjP8jSuKP3DpS3VSW3fnXKpYhGWSKpjv3eshJjT25xN2hVGu6+dN7VX8cBx
         lB7Ji5T6Hg06A==
Date:   Mon, 23 Aug 2021 19:55:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20210823195540.4d7363ed@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OD3gpQqjzB8vriqSeKQB=VJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OD3gpQqjzB8vriqSeKQB=VJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (htmldocs)
produced this warning:

docutils.utils.SystemMessage: Documentation/powerpc/associativity.rst:1: (S=
EVERE/4) Title overline & underline mismatch.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
NUMA resource associativity
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Introduced by commit

  1c6b5a7e7405 ("powerpc/pseries: Add support for FORM2 associativity")

There are other obvious problems with this document (but sphinx seems
to have hung before it reported them).

Like

Form 0
-----

and

Form 1
-----

and

Form 2
-------

--=20
Cheers,
Stephen Rothwell

--Sig_/OD3gpQqjzB8vriqSeKQB=VJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEjcJwACgkQAVBC80lX
0Gwknwf/eh5eOVTLm0/phY7/CRqjgQcgkibEQyOqtvv75dvTPGVX/nZtzfRp9n0p
Xqyk/sWo7FldmiKb3mp8me9CnTaEDayf46TVX8VqxNx5o82CAHbtEymja9SBces5
trw5sejneOtOWhPF9yIYTXTVy1Q9PDiLbJQCcRfFP5piFGVUDTiTqadPbFDdGWbO
CASRhJVras/MoOdKEpF7fy6iED0BDTn/gU1Oi0jqPrC6H0euL5TRgDfaTRqsJhol
BRtytK/oM4n7PBLbyC50pjsoOGGFmZ2xGP2YosqR3bWAaN/h95v0bvoK0IX8bWUI
iGIu6DbGTceYrOMcXM8CrQ34b9TtzA==
=UOWd
-----END PGP SIGNATURE-----

--Sig_/OD3gpQqjzB8vriqSeKQB=VJ--
