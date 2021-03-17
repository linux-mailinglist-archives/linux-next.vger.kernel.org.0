Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFEE33EAC1
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 08:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbhCQHrQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 03:47:16 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52091 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230289AbhCQHq5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 03:46:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0j0c024Pz9sRR;
        Wed, 17 Mar 2021 18:46:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615967216;
        bh=QPhanD1cLucA9zYW648gcWSyz6HZcM18ECwnbzg3RTI=;
        h=Date:From:To:Cc:Subject:From;
        b=kN/wOh+jgCvNUHzqniyKL44daYQ/jFWVhxLzMEKDiilIwusKzfCYJTx2gFnCzWTRG
         AhGOW7Ck3mThZ0Dhpp3hsaaoJ8GtLUkhX+r6Au5XIp6TNxgW3C8pDkdgSNOmDMrvTc
         GU0iDq7SX0AOSvyKLHMYKj+WfJKFlUibM4K6NRM4B9IWscERo9E6nYBPMJJ6QgtoK5
         v2IS+Qds9+MDqJ2G4jrGgszqd6/4a950OXvzWZ0reszZmh7vNCsJFEO4HZDU3iE8jM
         z8LiI0o/dNVmfZ2TN9Y0HELfELO6rmmXY/YXgtAoF3lTAEsOvdyC8hSPyxwOsgXe3G
         EBOQqo2DCVNmw==
Date:   Wed, 17 Mar 2021 18:46:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>
Cc:     Namjae Jeon <namjae.jeon@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the cifsd tree
Message-ID: <20210317184655.4d369e9e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6O6RX+RCS4iSnTW3vazTQXH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6O6RX+RCS4iSnTW3vazTQXH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cifsd tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/filesystems/cifs/cifsd.rst:3: WARNING: Title overline too sho=
rt.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
CIFSD - SMB3 Kernel Server
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Documentation/filesystems/cifs/cifsd.rst: WARNING: document isn't included =
in any toctree

Introduced by commit

  597357deeecf ("cifsd: update cifsd.rst file")

--=20
Cheers,
Stephen Rothwell

--Sig_/6O6RX+RCS4iSnTW3vazTQXH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBRs+8ACgkQAVBC80lX
0GwtyQgAoHfvjBWueGT67+3s1qcWhuzvjq69VdY91Hq6p9M9TB+oBYWC1FsONZV7
wpNusRuwUs3cqP/eytJ4yYGht8oQyjQyaMt5RskBGDAwF41qZEGaZi5Knz7bxdgc
jtyojUYdMTldflN2ZB7Fp4dxxHC/+VaeIbJwaafAX0jlCwRq1ZyataLKpqsODCBw
uIQR+sDX3YraL0kB6mIMzDHb24eni47CLQJ/MgPwMyvrJnjk/GwWKEN+D8oKZwVv
F2DQJndV4ZSsmPekfdgkFhlGa1R5tf6xzcBXLlaeqO8IxDjohN84j7G3/nEvRY96
Df2rxmy3vzBS6emba6aeIa25H23mbQ==
=Horb
-----END PGP SIGNATURE-----

--Sig_/6O6RX+RCS4iSnTW3vazTQXH--
