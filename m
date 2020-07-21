Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6792B227582
	for <lists+linux-next@lfdr.de>; Tue, 21 Jul 2020 04:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgGUCRt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 22:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbgGUCRt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jul 2020 22:17:49 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3293C061794;
        Mon, 20 Jul 2020 19:17:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9j171SqLz9sR4;
        Tue, 21 Jul 2020 12:17:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595297867;
        bh=I45GVsDCNk/R2oPtF45ExzI8cXBJ9bqkldc1fr62dbY=;
        h=Date:From:To:Cc:Subject:From;
        b=G3ShTEZfLYq4iaLs3ZH210NcOBCtAyq0JSKtCCsoDzeKYYb8es4PZmPsMez2Fl3/M
         5LFTSlJ8sCbsJ/Q5xwzde/AJRY+zm90zs1ycde31m8qgjen+KyAjDmVUNX5y4MSAPY
         iGNOjxINJAC/fcwZqoA0t8c54So3gRYDabLG7bvyfQBc0/oxiarVA6yzc9IEKf/p85
         nBL7tM6zNWUdXevm8iRXhgX4NydBF3UEwilVMGQrLVLZsYST5gQ2WHeJPrwc1Lp9u4
         WrNBY4ooa64Z9ASfVm9Uxjlu1r/PhoC82qbM2sDhS9VJIh+z7AZv0hIR5IV8kj3oGa
         o/IW1Lyrxuv+w==
Date:   Tue, 21 Jul 2020 12:17:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the devicetree tree
Message-ID: <20200721121746.37e540ad@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/syf51WeqTU7=k0D6_IXaoPR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/syf51WeqTU7=k0D6_IXaoPR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  74ea3273d24b ("dt-bindings: media: imx274: Add optional input clock and s=
upplies")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/syf51WeqTU7=k0D6_IXaoPR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8WUEoACgkQAVBC80lX
0Gy9DQf+P1Wr/UmN+4+ZsSbmWX0LAmOCLCbnUVnID7ZW+tXo1HR2TtYp2G7PD55H
/5Rzuf2HqWSib/OGDLcU+maNBEG3yHSZ/pJRj8PzaAD3xQCpXZLbsji+vqE036mJ
o7ElB4rhrnNbfGve7/LlYg+d5N171I+tgI5l4TYkNo2HT9nHDv6KEubF+lzhTC9q
r2VZpWZdjdkOhUr5y/Hml745/HgqAf7zMQpuZnGhXZ8OygWLlHTJ3/DP8wcxwx0k
/4eoIQJtVKc23PEAnlTIb+6GMhhizqZhhx2UIa3ju9By7PF3xYXE/jiRWGe48AOz
sVB6NpGAWEzCvB/GNmrmoPphEoQ21Q==
=8sxK
-----END PGP SIGNATURE-----

--Sig_/syf51WeqTU7=k0D6_IXaoPR--
