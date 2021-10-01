Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F7041E61B
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 04:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351715AbhJACyi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Sep 2021 22:54:38 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:56089 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhJACyh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2021 22:54:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HLF5w3b0Bz4xbL;
        Fri,  1 Oct 2021 12:52:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633056772;
        bh=I37CBx08ES7xEgxVUJBgPMwAK/uWSAPkRFMdAZDfiJk=;
        h=Date:From:To:Cc:Subject:From;
        b=M61r42mpSVPfaVqfDOi6YLzSEDjX/Oxef1EhtAJo1x0L4T1LVFTkYk4LOhAHwGtRL
         BgQyuH6uduJXXXagTlWkLGcCHhsBEtXqMDLAHrtsyA2KZsT71H50dPItKBR+Az8Wxi
         Y0P2dyoXeXGC51VytDObFG9SUmMbns90Qcg7ggNEmoOmTLPHAK72YQCwyeLEPiqYeV
         0REUD/LWEXEGzrQ3j3oVdC7gHUXfeiM1u7N49YF0czmpbSzLPbojHDQbGUXCwnga4i
         O8UhRkAmPhqjz/6l3062WdueI7qVFG7E//JrN79m10RfRbhmWO7yb4DKrPGZ6waDrw
         It9MitWA22aNQ==
Date:   Fri, 1 Oct 2021 12:52:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Corey Minyard <cminyard@mvista.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ipmi tree
Message-ID: <20211001125248.30adbdf3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M9zV3o.3FgI5l9Z+cSmFz8t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/M9zV3o.3FgI5l9Z+cSmFz8t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ipmi tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/char/ipmi/ipmi_msghandler.c: In function 'bmc_device_id_handler':
drivers/char/ipmi/ipmi_msghandler.c:2376:3: error: label 'out' used but not=
 defined
 2376 |   goto out;
      |   ^~~~

Caused by commit

  2d7a6d8467f9 ("ipmi: Check error code before processing BMC response")

I have used the ipmi tree from next-20210930 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/M9zV3o.3FgI5l9Z+cSmFz8t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFWeAAACgkQAVBC80lX
0GwUvQf/YR3ir3A+80P9bAW2+Q6KGGwdduziyfM0cexQ5osdbeUfD1ArhzK8mKG7
LzH4Z5ZiRoHvNBA6scnTOKOLY6newv3OatR/V9129ujqN9Ds6T/YpHciOqG/aF/4
n5ehkOXw5G4LG6bXHMBKIjBec2LdFQ7yZOyl3SOhszojTqz183ggDyIP9J6Eqmz/
TmjKAF//KHYUvyCQPrzXMl9t9ESza4vX/boZFNVn1Iw4oxEhf5ulqehJqIn6aN2O
6SZPsxEeL/rC07I4JwZ7h/EIXbyU4/ocukyuRsg/xIv0iGvHCws7deU1i0v932Nv
+HfcjPSIw2hNALdepVPlIZpyYxLiUg==
=1apl
-----END PGP SIGNATURE-----

--Sig_/M9zV3o.3FgI5l9Z+cSmFz8t--
