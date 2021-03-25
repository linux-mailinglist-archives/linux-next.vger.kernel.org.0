Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDE5349B44
	for <lists+linux-next@lfdr.de>; Thu, 25 Mar 2021 21:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbhCYUv4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Mar 2021 16:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbhCYUvo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Mar 2021 16:51:44 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35DEC06174A;
        Thu, 25 Mar 2021 13:51:43 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F5y2M5sTWz9sW4;
        Fri, 26 Mar 2021 07:51:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616705500;
        bh=hM85whDjn8tId4j+pNDx4mhu/JeYhD/Dz6q29CtQvrI=;
        h=Date:From:To:Cc:Subject:From;
        b=Wo9/dE6EyCJxsJYM20tctBe9RUI3rsKiqkAcB3DSb5Q0qIryD9Ajox+HDbBDaXrVu
         ZgX2oZJ/xkP7wcG/4qFtbrvW+Mj0csSlX/PJXAQM3SGCs/h3JattP4B/iSxB0/TQ34
         qVPU4Ac9HnpUzeWyLDE/B9iiLLHE1u8dOqyLg5UuzdxrTtVqofDuD3n31ka91la661
         vXjMeRT4cL/S8ukUKN3KQ3Peadox9kIw21kqILYOYcI8MrSfS/5ewyxDPTVKglJFLD
         AtTjPT4HMxW4pa3WSmS0e6SlmRbPeRxOurXbFSJE03T9L7ITDMrOb5ejR3odAZDIgg
         xD9J81tEdjGvA==
Date:   Fri, 26 Mar 2021 07:51:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vfs-fixes tree
Message-ID: <20210326075137.510797f3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mdfohWGpozhsVCev6Aa_U/r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mdfohWGpozhsVCev6Aa_U/r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  595a48eb7b48 ("hostfs: fix memory handling in follow_link()")

Fixes tag

  Fixes: 52b209f7b848 "get rid of hostfs_read_inode()" # v2.6.35+

has these problem(s):

  - Subject has leading but no trailing quotes
  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

The version comment is unneeded as it can be trivially gained from
"git describe".

--=20
Cheers,
Stephen Rothwell

--Sig_/mdfohWGpozhsVCev6Aa_U/r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBc99kACgkQAVBC80lX
0GxEVgf/QLh8Va9nqqLjzOFPC7Y9mdaKGes7NydCRTXbnMWujHMviedd9l2tr+kV
NmRCmbv3IUSTcV9bbpQXmz23l4xTCI1ycr3gVHa6ybEhaKwKPVG7/dLz+bo3k/+K
H4zkxjY7dEb9D85rseUb7qzMLakoMrZJ9/GjqzquxmrVnGGxwfm0BRFDGT59HbY5
wdS5mLXjYfdTXvp6YnTLzKIzQvOWLSrmuuv82CGKavb9EXms0S6qF3vWck4GLIyH
W9hwUaZv7jw9hECQdS7fBspFNGtZ+lsZ61nvH6dVbprL6bhyzAhhXofHXQLZe135
M37bUmjoM8PBpWVcqQSTJtYX5GDkcA==
=jsHc
-----END PGP SIGNATURE-----

--Sig_/mdfohWGpozhsVCev6Aa_U/r--
