Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0CF93A392F
	for <lists+linux-next@lfdr.de>; Fri, 11 Jun 2021 03:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbhFKBOe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Jun 2021 21:14:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49593 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230299AbhFKBOd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Jun 2021 21:14:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G1N9q5Y97z9sRN;
        Fri, 11 Jun 2021 11:12:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623373955;
        bh=QFBPZX3fM/+3TGOBfe8KTEkysAJDVoYZKgKVIPksBME=;
        h=Date:From:To:Cc:Subject:From;
        b=cZ7P0jwRRn0JzPrdVkQ2XwbbNsAXeNlPjDDrGo9ocrqGweZA1qE7xQdseqs3QCVOZ
         A8XIYAby9QNqW+bMhWpWWgOBWcgdfE8uK2Tc+zaqYvRGVMwFkVkR5oPwfSUw6v64wH
         Qlj4RltKTfdZj6xmfA6Qdw8YksOYCKRnIrh1fZAcb8sem6yATwyvTNc+/BJ1AqnYMD
         y1rK//H9jmjTSbE5F/JT4+1S+vQv62iZldSVNMkzwwRaLzmW+mXDOPnI4BToWNrDfP
         G28zKvjbfX55U2Hgc50U6T/hfnkkMmdcSJ6/b4nIuD8U91jzMB3T18K0B5mz1DLDIG
         K7rvvu5M1xTGA==
Date:   Fri, 11 Jun 2021 11:12:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Al Viro <viro@ZenIV.linux.org.uk>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gfs2 tree with the vfs tree
Message-ID: <20210611111231.7750bb60@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=hKTzhIkkiai=MbU=pqZJ6h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=hKTzhIkkiai=MbU=pqZJ6h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gfs2 tree got conflicts in:

  Documentation/filesystems/porting.rst
  include/linux/uio.h
  lib/iov_iter.c

between various commits from the vfs tree and the same, older version,
of the commits from the gfs2 tree.

I fixed it up (I used the vfs tree versions) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/=hKTzhIkkiai=MbU=pqZJ6h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDCuH8ACgkQAVBC80lX
0GyBEQf/Qq5ndg50rw2POn6IslnIVV6WzEk/p3EyGYAflfJbQ5Qq5wzhgSbb3FO3
vWTQJWGTc4Bt69u03U6L83caxIHS7ETpMFltdTqnbf6zOffzMc/+ybUwmLcSOiGv
agSrxKbWBNvM26oP5/f00ppO5+pus2px3COQn0oHNm/CYqMGYHk1IvOaUb39Efxq
MQShpdIcTTgynELqvU7EzAmlzxsPjlTQsWTG8KlC3B6qiRBM7zlIjWmXIC1GX/Ol
vqdJPLkdGuhCkci72YFjNQrg3RI4xNwcgyXwmEKQBBdLRmYBtYhgtlVf4lUwP7si
WJfbUo2hjqrHNGzZIGc45ElHazGH3g==
=NCzR
-----END PGP SIGNATURE-----

--Sig_/=hKTzhIkkiai=MbU=pqZJ6h--
