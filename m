Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E82B35C590
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 13:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238121AbhDLLr4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Apr 2021 07:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237705AbhDLLr4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Apr 2021 07:47:56 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE443C061574;
        Mon, 12 Apr 2021 04:47:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FJn6J4HVmz9sSC;
        Mon, 12 Apr 2021 21:47:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618228056;
        bh=E9S/oqrY0+lUSUuX56T15kWI2eHfHM6JObKhhA4nUAA=;
        h=Date:From:To:Cc:Subject:From;
        b=lh8PRVclnmdx+hF75KQFOyXHAvyo4gMSM3DCRFiJklvC06msGSu8Sncsrze2QbyAA
         n91ZjYe89GWWqnpeYC0L4Jd3RUIsvn+jS8yXi/qZ7A5VI1E5x5h0qEDKCBIQA3ihTu
         +/lNgAjSV/qppmpevlkofuBlgYs7Ppq6hslFiK3msvIAx0pDz3t3OkSH1pMVrTmvxf
         l7AG/lAxH4ihbBwlJS7cD2qRrlukaRG63D5fK7wktgm4RGvBcvrMWzISSnH3zENZHc
         947rYQGBgYW/J+K6czPKx0IJN9YvBb+yoFZYo8bdnNoC8Tg6B/AlEww0Fuq1083gUg
         1V0TKrar8Ae0Q==
Date:   Mon, 12 Apr 2021 21:47:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Miklos Szeredi <mszeredi@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs tree
Message-ID: <20210412214730.2dbbcdff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xQr/7BBGQBAbNLWKFgbTOhz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xQr/7BBGQBAbNLWKFgbTOhz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/filesystems/locking.rst:113: WARNING: Malformed table.
Text in column margin in table line 24.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
ops             i_rwsem(inode)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
lookup:         shared
create:         exclusive
link:           exclusive (both)
mknod:          exclusive
symlink:        exclusive
mkdir:          exclusive
unlink:         exclusive (both)
rmdir:          exclusive (both)(see below)
rename:         exclusive (all) (see below)
readlink:       no
get_link:       no
setattr:        exclusive
permission:     no (may not block if called in rcu-walk mode)
get_acl:        no
getattr:        no
listxattr:      no
fiemap:         no
update_time:    no
atomic_open:    shared (exclusive if O_CREAT is set in open flags)
tmpfile:        no
fileattr_get:   no or exclusive
fileattr_set:   exclusive
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D

Introduced by commit

  10a489bbff3e ("vfs: add fileattr ops")

--=20
Cheers,
Stephen Rothwell

--Sig_/xQr/7BBGQBAbNLWKFgbTOhz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB0M1IACgkQAVBC80lX
0Gy/rwgAjlagHSyK9ONQsNwUjA0KfX3Gasqjwlpt6and+Synou/INIijblcvnNSF
zV/N7v8gzAmWigbf2vg6X6B9P2LEHOdNy+6bzNXzlycfGvGCruFaCh6d3csIS6mC
sI2HFCmPV11Haf6t9yDB25CKB/PQX40gMVKsdtGdF9K9p0lWNW+EPQxnaiRq4grc
k04ACrzefnukQVzJHFddadtz5RWlRRYbl08H7q47R5V1r/MpTWRrU0ubz5Mg9XH6
4KkDyVOnXaEel3vyXsHN8aZFma68XTPDRKIOGVEX2x43fzbGvyFO++mFFLAf87wH
0S33aK3AzZ16KVSCJy/3uFTvoxnzhQ==
=XO0G
-----END PGP SIGNATURE-----

--Sig_/xQr/7BBGQBAbNLWKFgbTOhz--
