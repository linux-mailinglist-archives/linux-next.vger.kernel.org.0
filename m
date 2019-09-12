Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B653B1031
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2019 15:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731650AbfILNoT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Sep 2019 09:44:19 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39751 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731283AbfILNoT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Sep 2019 09:44:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Tg3c4shxz9s7T;
        Thu, 12 Sep 2019 23:44:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568295855;
        bh=Cnv4+khfML5daX7u0yJp0trudJnS360W+hZ6z7qUYSo=;
        h=Date:From:To:Cc:Subject:From;
        b=PA9DbItKEukRd8VthZ6RjjULpGvwsJLj1NoQ3jCvr6Q0v55SJUAicH7NkxyCNV8eL
         G6UETro3PasCGBKWUewmRIYSfys45zCwq6fPdQck4AZEl351XirDQSBeO7H19UCIzO
         uMcBgO/eh8q835F4FSucpZPj767eq+IELb838z1S0Q76aMGaXR1hKytE9jM9cUCvV2
         Cj8F2YX3GaX5cjHek/n+Cpws0svnJK1VJmYWGbUhpZyN2fDbIT1mZq+EgsLm03estp
         8fb/pnehQBL+y4jE6qrfzI7KQHvap/dxugrVZPH+CBF1Q0i8HOVVaEfEHhoc3ID+t5
         2ABTGfvnbOUMA==
Date:   Thu, 12 Sep 2019 23:44:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>, Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the configfs tree with the vfs-fixes
 tree
Message-ID: <20190912234412.38998b12@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DKU+xGk5GDUWWRExFeopTVV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DKU+xGk5GDUWWRExFeopTVV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the configfs tree got a conflict in:

  fs/configfs/symlink.c

between commit:

  e272d4fb74d6 ("configfs: fix a deadlock in configfs_symlink()")

from the vfs-fixes tree and commit:

  351e5d869e5a ("configfs: fix a deadlock in configfs_symlink()")

from the configfs tree.

These are slightly different version of the same fix.

I fixed it up (I used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/DKU+xGk5GDUWWRExFeopTVV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl16S6wACgkQAVBC80lX
0GwIWgf+JsBvOediGgSa/jUOFbjXma+67AVDNxH8cHfeIr7ezolPvzKK05TU+St2
QASYltdXPi7D/CkfQXHYtumvlzAZcMrEDNqRjxXZBcwEIp8L7Y9F/K63r08iBeu0
CbvhVbPHmO9jA/bij9uS1zKSoFyUKTc38tw+gZBErLAPKDODbmE/SKFQepDDW6/w
fdO+npXXhj+4159g0h3m9gSi0zQW6pdeJ5kxs7EEcbfajyae7YUFu3vchBBAAFf6
S8RbYcH5pHgQU0VMnxASxJdwsThD8Ar7O/RbKFln/gQKfxhLamndK3woO5nXmHUG
i53FOGCwpsogmqcO7pw0F7kDQJeFAw==
=6Hv8
-----END PGP SIGNATURE-----

--Sig_/DKU+xGk5GDUWWRExFeopTVV--
