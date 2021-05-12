Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D1D37B46D
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 05:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhELDVV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 May 2021 23:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhELDVV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 May 2021 23:21:21 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4399C061574;
        Tue, 11 May 2021 20:19:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fg0Q24gKbz9sSs;
        Wed, 12 May 2021 13:19:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620789562;
        bh=f/tE1O7TnGwKtzXIWKZ9E9+OSqVX+6t2Zlft+8e4zu4=;
        h=Date:From:To:Cc:Subject:From;
        b=Y0PeF2eL4ZhBcho8ZSPSW80+0Fl4+9Sdm3ZhVIo0SUupySAj1Jx/6SZozCGUhpniv
         BrW5KU2GJZpsQ9ldNTJd/FQ3QtBXULJRQCKUjI4jmIyIlquRlwSTokwoNoAaRmJf66
         Iz2f+PP1boghUx0mhYquXDgI4Rf2KyTfY91ddebf3BsC9zRH6Hde1fNMO9rg8ns1gS
         VHl0p4f6qIfclvPVKKzSbecnQz98tRdzwZNSv+GQoZjwXZOAYZtEYOzAv2uCfA+xU2
         1e/jJkcY1kaJwBQpm1PdwWUMOPbYavZMpcFcv+dCDi1MmWgjLZrdP7GNeJrITR+0Fr
         t+TzhNpSbQ//w==
Date:   Wed, 12 May 2021 13:19:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wei Liu <wei.liu@kernel.org>
Cc:     "Andrea Parri (Microsoft)" <parri.andrea@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the hyperv tree with Linus' tree
Message-ID: <20210512131922.716824fa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k2q9RJCw=ag.ovMZwDStgWC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/k2q9RJCw=ag.ovMZwDStgWC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hyperv tree got a conflict in:

  drivers/hv/ring_buffer.c

between commit:

  0c85c54bf7fa ("Drivers: hv: vmbus: Drop error message when 'No request id=
 available'")

from Linus' tree and commit:

  8e74d1f319bf ("scsi: storvsc: Use blk_mq_unique_tag() to generate request=
IDs")

from the hyperv tree.

I fixed it up (I just used the latter as it included the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/k2q9RJCw=ag.ovMZwDStgWC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCbSToACgkQAVBC80lX
0GxOdggAi4Eh4OkQbQvHLilXjkcgWpjZFEq822lLfbf/BeOeWNXq5Bh0N3VFFoWb
as9EZHF9s0AliQ70kS+g3+85bGZjnJU5O35UDo7DwPJSFLifPn/K6fgBVsB/IlzG
fqbAXABcU1NGLbEWx4bKB/j64r7Umu/ATApwv7+uCOVmXjO9LRHETFI1MC9fV5TW
jddiTiNOA4XHtpB5VypsWH3ds9hfn2wagO/zBH9msTzttDyWyMjf1ptNHZEQGPfu
A70ATP8kJpUsqwHCeQr3lXOuFYFWTnbXPyiM378uZKQnEWvh+WCDF5MPFZpSVY17
5FmwfHbC9tTIVb6/XnR46xY3aD/4vA==
=T3zQ
-----END PGP SIGNATURE-----

--Sig_/k2q9RJCw=ag.ovMZwDStgWC--
