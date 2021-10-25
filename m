Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82737439046
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 09:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbhJYH0t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 03:26:49 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:43491 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbhJYH0s (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 03:26:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hd6085xT4z4xZ1;
        Mon, 25 Oct 2021 18:24:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635146665;
        bh=dXIinREqgpwzVsJsYb5smWyWjV7n6bBDSq2MiewVOrQ=;
        h=Date:From:To:Cc:Subject:From;
        b=gSPNxHGxZYh0/YQUjv6uGFFOI741RzuWpGnMS2osBbJewwACCRQPmXADrKGgEfBY1
         2bovqUngMVWKeFO/P4upMFXxYq4omt9vive/jIX/armUUz8XYdYY2srgyIX035O6dm
         yIuAdL9pqpe+jaT1sR0J1cAvYCqPtiqZFuPp7BDsmkZ/dtdmR45gdX1Pv0weFBECRg
         T3ApkvGVADXb6//b3TFYEhhcesTm7JCRNrPychHJomA4nSt4/nZ8fnNHT14Zjv+6RN
         2z4mlcR0hEt0EZJ69M/YNDqly9FfGksyaW5LGE1iZlQVI/O3uUaO7L+zltMTmQtn+o
         VMmkHKSgy/o5w==
Date:   Mon, 25 Oct 2021 18:24:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kspp-gustavo tree with the ftrace
 tree
Message-ID: <20211025182423.723b70c6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sC5BXMuh=7iRcpjVkM4t8wY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sC5BXMuh=7iRcpjVkM4t8wY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp-gustavo tree got a conflict in:

  include/linux/ftrace.h

between commit:

  34cdd18b8d24 ("tracing: Use linker magic instead of recasting ftrace_ops_=
list_func()")

from the ftrace tree and commit:

  c45ede6c2781 ("ftrace: Fix -Wmissing-prototypes errors")

from the kspp-gustavo tree.

I fixed it up (I just used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/sC5BXMuh=7iRcpjVkM4t8wY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF2W6cACgkQAVBC80lX
0Gx1awf/bAi1MfANz68h0BdgHC0fTShUlDshjTUHaoESSipiCV80a/xKOZpsBCWJ
OxNt5zFrUZxGrONPMr78NOTlrOzNUjZs5irgprzIJOYDmYzQatzHhiZjJ/CTIs5X
Rx/A9kUWUvo60F0W+fBx8Uffw8n6/wzfdOqanB/ccO1kjWp9E/o4dWLC510qeqor
6KnKaloIW9dlbeaIFDO8JrDd0TjbUxASCy0/lzn8/mv4DajhC1+J5cW+i0jRRS/O
Z7ksYPCv96ttXzTmfznkj+jRNlulIy8nx2aTKR+idColH1UGZjWbdXZSelDsC5A8
DAvLMKeSMiH0ThiOwr2SpRV/WXgAtA==
=o6vX
-----END PGP SIGNATURE-----

--Sig_/sC5BXMuh=7iRcpjVkM4t8wY--
