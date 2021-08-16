Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB223EDFB3
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 00:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhHPWHd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Aug 2021 18:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbhHPWHc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Aug 2021 18:07:32 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4436EC061764;
        Mon, 16 Aug 2021 15:07:00 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GpStn6CPzz9sVq;
        Tue, 17 Aug 2021 08:06:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629151618;
        bh=qAT+0iV/LPEzNzYxGXkFe9N0tg2WfZPWfSMMZwA70w4=;
        h=Date:From:To:Cc:Subject:From;
        b=a4iNgDmcTc8TBx8yel49AS6vVEuZ4UJqRdlF+jc1AmXiCozdEkwXUpxw3dTHcD6zk
         SUhAH3bbk/H5cLU2nZ5QY+GmRCRQSPhXBeUTVKwno7ziJJN1kjg8cvoMX+mGDv8SGa
         1nvroJzMDGpINuG4ig0bFfuPVF5LH1+TglnHHIW7cD3Ff0nw+xh0z7NL4Umx1eUGDX
         M43R/dPoTGtxR/9Brn7HmqRsrzHJJIQbiiX437pIan4YIn4lKu/c01qavq1t1R0IPG
         7zvWF91wwT8lkwbyqey3/XXkUsaS0+kLgikGwLUgOznteCNYX1jF5zpH4XxQUX3w0k
         3V2shB4SDH5AQ==
Date:   Tue, 17 Aug 2021 08:06:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Richard Weinberger <richard.weinberger@gmail.com>
Cc:     Zhihao Cheng <chengzhihao1@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mtd tree
Message-ID: <20210817080657.771be36b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H_/qB+baDRPW9H1v/HQfSvZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/H_/qB+baDRPW9H1v/HQfSvZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e128bf2f39da ("mtd: mtdconcat: Remove concat_{read|write}_oob")

Fixes tag

  Fixes: 2431c4f5b46c3("mtd: Implement mtd_{read,write}() around ...")

has these problem(s):

  - missing space between the SHA1 and the subject
  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/H_/qB+baDRPW9H1v/HQfSvZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEa4YEACgkQAVBC80lX
0Gxq0wf+NzuVFEpFMioD0ey+b4ouyPSmZqKyGYiIhklgwBZP7/CIP4h362Wi+Udw
FGiZXPBtYOFg/V61f9BPyVQykeHoFihQW1Nu5NYMwabl3d4uj1bNFUS6B/AO+eiK
JBK13QKJyywTBLRlwVI7lN4CBLU+sD8adC6ajnjtDFngq8WPtYgy/hRE3OQbOLcn
JTCjthX8nvwK5Lj/x4d9gXZqqcH0NJvvZuGFS8WW12bR/sVgNt9HC0YnfYL1B8Ul
OqcE1FKnIzgmbkkcwrVXLTEHMH5L1uKz8/f/jdjWs7WbSvL0IboFikRGC1sB8+LL
MuupJCFSIivaAuepsd3vZv2IOiAY6w==
=ZEHA
-----END PGP SIGNATURE-----

--Sig_/H_/qB+baDRPW9H1v/HQfSvZ--
