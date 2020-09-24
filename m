Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECEF27692C
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 08:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgIXGpc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 02:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgIXGpc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Sep 2020 02:45:32 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185FBC0613CE;
        Wed, 23 Sep 2020 23:45:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bxlt201Qfz9sR4;
        Thu, 24 Sep 2020 16:45:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600929930;
        bh=YYwHCgRAlaTI+jYtkJ8beDa9QHa7D0VMnI0MLn9JPaU=;
        h=Date:From:To:Cc:Subject:From;
        b=TNa7/yE9iQ0VxOnVUoxBz62+uKXwe1azWmpssPFXuWu+cwQbihqUiYXPA/e57fVgq
         O/VXobrDsZkKNy06Q1tnoXO8F+BmozT/nL4lHPW7aljqCykV3ICCB+2QfK4zV4Qmwe
         1pXdX0mXcc8bpeCE5XI5+d0UfmufqMYq3GNIpaRYjwl2U8H8zvhdsXHHwHD2P78i8d
         nk8rNmjFHw+hkyq1lhZdgWcZZgkwP3k9Mu3pl32IXG04QRywgdrt3sVxLkMMoD0KuP
         sFx3Y8HDTxWhIdDIEo5Ohf5IWKUv6MqvQKXq4iolJS8ZOLTg229OkEhYmVFu9Qmlh0
         cdsD/ZPhxd6Ug==
Date:   Thu, 24 Sep 2020 16:45:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dan Williams <dan.j.williams@intel.com>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the nvdimm tree with the vfs tree
Message-ID: <20200924164529.61ea980f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jwHNRXEmEeE4rEu/nXFGYKK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jwHNRXEmEeE4rEu/nXFGYKK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nvdimm tree got a conflict in:

  lib/iov_iter.c

between commit:

  e33ea6e5ba6a ("x86/uaccess: Use pointer masking to limit uaccess speculat=
ion")

from the vfs tree and commit:

  0a78de3d4b7b ("x86, powerpc: Rename memcpy_mcsafe() to copy_mc_to_{user, =
kernel}()")

from the nvdimm tree.

I fixed it up (I just used the latter, but I suspect that more work is
needed) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/jwHNRXEmEeE4rEu/nXFGYKK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9sQIkACgkQAVBC80lX
0Gyhlwf+LjOqtwQ3Vipamv9ks9ATKaj7h00KSJw0Ui2C0nNH8i+vZyFp3xLtEIpD
29gdr34GivCvHKTXpWSXG6PbORS3C7MAuiytoH9+yiI5zNst9zUNgnJncHQzCqgy
fMpBPq4b22qHQpO7CBWvqjaT9HPvBCP625ajUGUg6WLCrwEpAjEvBIacYJXhcN3w
XJlgAkq3qwrHOFmpAgBT0R+yt9TI96+F7lQq5MZjCcLKgslAS6aZ//TUmbLuSJL+
zMrWtj1PER+y5ZUPbAwGgTXN1LfS3SYgKbJ2UgngO5TElzw6aPsN3QC43MjPQ7WC
yy5xHn8GtQ6E+pldPfMMDh7h+M2ANA==
=r0vP
-----END PGP SIGNATURE-----

--Sig_/jwHNRXEmEeE4rEu/nXFGYKK--
