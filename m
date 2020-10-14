Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F85328E7C6
	for <lists+linux-next@lfdr.de>; Wed, 14 Oct 2020 22:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgJNUQZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 16:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgJNUQZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 16:16:25 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAE7C061755;
        Wed, 14 Oct 2020 13:16:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBNwM6thNz9sTs;
        Thu, 15 Oct 2020 07:16:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602706580;
        bh=eNEEZgIPupcqA5n45g+xly7jZixWVNAD+SX6Tr1tU+A=;
        h=Date:From:To:Cc:Subject:From;
        b=miJ5rC30kLdCbAsVmhWx9USOh859mnDroD8PZoRj2yZ0vEyLNNTHfdzCcIes6Tfvp
         /2aNfeW/8tCw08SgcX/JZ1GClN7A6ixZrZFtRChWWJ9Osv8R+FJcoI2wO6gvygzBST
         dcmnO4NxMl6w21Vy6Fo11rWiOb92+G7Z8DV/7kmYN5zEfaA/XdPJLEPxDlt39NT91x
         v4KrG86z+STdahWFvgBgazmndjCx+ARLQHfoWx2oibmWmZwTvJ83YZ1vnHmHVK85NW
         8gkZGHm9XyoVyW3ijRvDjDufGIQVHq+CErdQrnsvEp1Rd9J4VPPaDNRg2nTYoc7PHQ
         3sL9+erL6a53A==
Date:   Thu, 15 Oct 2020 07:16:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Jamie Iles <jamie@nuviainc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the f2fs tree
Message-ID: <20201015071617.1f5ab26f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mi+Iz0HzWe.c_ez6CV+H.rC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mi+Iz0HzWe.c_ez6CV+H.rC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e965857201e0 ("f2fs: wait for sysfs kobject removal before freeing f2fs_s=
b_info")

Fixes tag

  Fixes: bf9e697ecd4 ("f2fs: expose features to sysfs entry")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/mi+Iz0HzWe.c_ez6CV+H.rC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+HXJEACgkQAVBC80lX
0Gy40gf9GPQNdq301i5DwRNTqE4FPb+/9Sxa0HzQzF0FgV++VmHPskC7qaF8j841
Pu72IA6V801KhjZwQiuQyNVdk9w/rLgeWUtdILwPrni/xY8fFOtMenEInR/B9jj4
TwjdqwyAM3z7Nt08O9JeDHMzC95sK8dBAVlLZ20Hjb64n7NhwkVbOrrdEEYdwFIe
Doog5UNS4AmX5RRXPmyk4Vo94iRwMlNit3o9YUkZkJNs/OFfuUhJ3L6HQe+lvhj+
YA42NpNX9sHe7PXm3mqAOSVaGOIkvHGxM0lHJhw6/frSwREwSJ86Awka0LbAp/gW
BFDVSYXYDVTzDUMyGv2m/vBckgUJ2g==
=Y8wK
-----END PGP SIGNATURE-----

--Sig_/mi+Iz0HzWe.c_ez6CV+H.rC--
