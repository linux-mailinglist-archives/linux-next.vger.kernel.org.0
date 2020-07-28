Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53D8522FEBD
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 03:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgG1BJ6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 21:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgG1BJ6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 21:09:58 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE6CC061794;
        Mon, 27 Jul 2020 18:09:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFz9c0hsPz9sRN;
        Tue, 28 Jul 2020 11:09:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595898596;
        bh=ZSq8/RySf4rhhqUW8ceGKDLlu0oFiQjeHgQaxcuCH7I=;
        h=Date:From:To:Cc:Subject:From;
        b=RTcw3R7YxOhAzXso46J+0ptqIxB94s03NwrUem4d40VnN+TSWwGXzZAXRMzbb5t8f
         d8gCs5vkzDfWE6+sj1izgKNbE4SSsoXHeXc6sXR/nRjIL3FsLBESD7RnMWwXl9xXX6
         XrUPV0rfELtZ4y8xekADHItpIVjuzDhVtjAh8h/zVD1RwRBo/9Y8OEDqXT77LDL5kn
         lObN8Oxg2jV2BBC3i+6Pi1xY+zQKjpU0hzWlmgupqbiIlQnR0t1+AH4V5OZvil/BLr
         5j+8A06iYwibZ0S0C6CDKLodOSkg5xaDV/ZWX2TUp257Jlq4iIwRtK1mpBct25aeuT
         qSYpz0cxa7RUA==
Date:   Tue, 28 Jul 2020 11:09:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kevin Buettner <kevinb@redhat.com>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Message-ID: <20200728110953.45e8e686@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/33RIyBopXNtysEeQfaDbgO=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/33RIyBopXNtysEeQfaDbgO=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  arch/x86/kernel/fpu/xstate.c

between commit:

  5714ee50bb43 ("copy_xstate_to_kernel: Fix typo which caused GDB regressio=
n")

from Linus' tree and commit:

  0557d64d983e ("x86: switch to ->regset_get()")

from the vfs tree.

I fixed it up (I just used the latter as it included the former fix) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/33RIyBopXNtysEeQfaDbgO=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8feuEACgkQAVBC80lX
0GxE5Qf+P3rdXRmDoNIAc76GkBE7aPWuXcG6doqZBqDWtJjTwfN2D6v3xvHSK/fg
1VMEce8wOfrLjW/2iGSMlrFHj13ty3sCzX45wy9PfJOlNsRZg03NmwB+ZHkHEdjj
0gdKQ7tvg2r57zKtSldEvsvPxtIRZzmFc27TPc07TLMWe+f8GJ8O5wt8MRzGkKOU
hdk6ebtN5+J9apPWLJ6LcQz+67LBOGEL7b8Ys0jzChNtD3FwWaAAVblN/E6rs9rT
Ra3+duc+0qWh4AY3030hI85cvGELAQUgVR8ZenOXVJPAdTiWNdovEzw+FzcqpZDo
LG4dl6Y4Q5ysfO9qYYPPMA10u+rA5w==
=qkbn
-----END PGP SIGNATURE-----

--Sig_/33RIyBopXNtysEeQfaDbgO=--
