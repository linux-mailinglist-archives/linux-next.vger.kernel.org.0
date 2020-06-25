Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBAC02098CB
	for <lists+linux-next@lfdr.de>; Thu, 25 Jun 2020 05:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389310AbgFYDlh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 23:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388485AbgFYDlh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2020 23:41:37 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9E3C061573;
        Wed, 24 Jun 2020 20:41:36 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49sm5n6M7nz9sSJ;
        Thu, 25 Jun 2020 13:41:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593056494;
        bh=t4FZnJ0/KGnAfLisfBAePPcPen+efEotoz8KIt4Yzmo=;
        h=Date:From:To:Cc:Subject:From;
        b=IKwSVNQJvue2V/LH9JeMV4QZCvBmIlVSHT7hrAcH+/yoP8spsAFU/zm5p6fapA/VU
         Si0IYABs/LuKjOZSGsd+vc4NQjYCopIGrcMox4of3+zmx8PhhbMi/HzkEGRtJ14pTj
         jJOXUoAiigcPt+hz7hPtyr4UtXmQnphq5kuLUQA4Fr670eaLaUmM7n6HtjNNhIobSw
         1MQWPMYaoNelM0m4CAcDJkPUvl96JC7f/WiPXiK9wInxjItBRPE+cNabJVcXbFoa6S
         neTQmmDdGli7Qn6167aIl/26WfCFQIwyrn5kMi3ndz+QaDS0oNBymlFkGdWjR9Z5Il
         Ws2Rdu3xs7uVg==
Date:   Thu, 25 Jun 2020 13:41:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Seungwon Jeon <essuuj@gmail.com>
Subject: linux-next: build warning after merge of the scsi tree
Message-ID: <20200625134128.3147193f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hvzrZyylR9G=+Oa8qmuxuUy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hvzrZyylR9G=+Oa8qmuxuUy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/scsi/ufs/ufs-exynos.o

Introduced by commit

  55f4b1f73631 ("scsi: ufs: ufs-exynos: Add UFS host support for Exynos SoC=
s")

(not sure why I missed this earlier, sorry)

--=20
Cheers,
Stephen Rothwell

--Sig_/hvzrZyylR9G=+Oa8qmuxuUy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl70HOkACgkQAVBC80lX
0GxMwQf/ZfuM4ac3mBRHUMwpxz87dgKbTPAwHRr4QwBW37KyHtJMwYYUCgu3JDqV
S8keTCrcLqQkqrGAjDfCicBQVAmh9lQk/W4EtRsUmzRBqnb6nnYxPFeF3mpqWgm5
9Afi44oERu29EV0Fk/XpDrJHMdRC26wDip+wZVbH816KCzDFno5l+nYLDLxfJhC8
u3iI3Akrs2zOkt+3y8FRW2PlSVMJ7+0NZz0Qe/XB6n8OQJAleaKPIC/yTAstN+sx
UZFn6vrUOp9oJG2VZXbR99Jz+QXgw+hSXvYoCHMzP7/DVK/0s8HgrZdSSwqAkvCg
gCKcbygG5pprRhCCbxBiSJqeTgMqcQ==
=1uU1
-----END PGP SIGNATURE-----

--Sig_/hvzrZyylR9G=+Oa8qmuxuUy--
