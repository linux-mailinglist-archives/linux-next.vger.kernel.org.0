Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0141EF10C
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 07:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgFEF7r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 01:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgFEF7r (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Jun 2020 01:59:47 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24766C08C5C2;
        Thu,  4 Jun 2020 22:59:47 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49dX6S51Bkz9sT6;
        Fri,  5 Jun 2020 15:59:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591336785;
        bh=jrSarrFkaLqRVlO7fpe3eJP+9MxgBrcvr8Z/DafsGs0=;
        h=Date:From:To:Cc:Subject:From;
        b=b2bHcJxTA4CgJVzNlX/m05K433GD520Q8NqWU5GHvhv45GAFM3u+M0cPlTQ/ONpEv
         /cY5DQ4U9PBCSoT+1pFTaqbCTQr8DwAfphbFLq5jDi7HVPR+UsdgzSWPC2aRw3DiSd
         1tSCClprcU78LJXH5OGH88AEY4//MuSkFD6KDkjhllo/B2Zi0HdvTByz75XMXIQyh0
         211rMfrHPyJuO/VVCsE1cr+dg64kiI/4q2DQoAsrkf1gcFt8R7PUxlFjl4AaHLdotP
         21fqHW2jCeguBquQ0J63pzC7nBCLMDTJotz8zg0FvJSL5q4D+LfSH524MlEqsBD9/+
         Yayq1bLvlLlnQ==
Date:   Fri, 5 Jun 2020 15:59:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Rich Felker <dalias@libc.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm tree with the sh tree
Message-ID: <20200605155943.2eb372a2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qjwOQKHeMv1U447Ql9iqATJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qjwOQKHeMv1U447Ql9iqATJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/sh/include/asm/pgtable_64.h

between commit:

  37744feebc08 ("sh: remove sh5 support")

from the sh tree and patch:

  "mm: consolidate pmd_index() and pmd_offset() definitions"

from the akpm tree.

I fixed it up (the former deleted the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/qjwOQKHeMv1U447Ql9iqATJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Z308ACgkQAVBC80lX
0GyTjwf/eZlal0iFtCHDCg+OXFNYmFw3cMpAzuZrdUxHLp7cx4/uJkxHjDLqpWS2
iQrJ7z75ElzA8qPDR+CdP2s9RIuNy2tspJltV2T3iNcYRpf5yVM+7hznWj0NXLK/
YbteStMXwJ/p0MX8x7KARXkSH3VRwsM8ExG4+vQfc1/gJRvxA4AIzvC9bRZVWn2Y
PsX5FTsbux+6/PKZA0rfUPYPT/IpKzFK4Dd1Vm2g4h5cQPdgWIQjh+f3Pp0Ad+2x
7FqfNuvNrmUmaPysIBvCKNcyOLQLqR7witW+ov0GA2aVTQkwPJ+MvtFl4Wqk+4RP
pmiEhn2tcMzcHkeUAD8+l/zHRzEl0Q==
=fD//
-----END PGP SIGNATURE-----

--Sig_/qjwOQKHeMv1U447Ql9iqATJ--
