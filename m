Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485213548A7
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 00:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236032AbhDEWf5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Apr 2021 18:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbhDEWf4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Apr 2021 18:35:56 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F346AC06174A;
        Mon,  5 Apr 2021 15:35:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FDlqQ2Rswz9sV5;
        Tue,  6 Apr 2021 08:35:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617662147;
        bh=ZOuZOYa/bNcWpeTzNNm5XLxlS19DdjI5EG3m+2dxQB8=;
        h=Date:From:To:Cc:Subject:From;
        b=L2tTJW1/nvTkGXpRfZ09PCLzyRwenY8gyLNucqkyHrc2cdYz62A8KMwovwBQBmkcZ
         YW+J406+5Tf9rvv8cEc1r0OePpNA8HZs0mv25STrneu4fDyUHhWUBS9Ywjx0YgXeI8
         9L0NYj6EnD2O+j3kku0SuTLZWq5iNdHxmhdq30vM3KEPiUBUCdvKKx4vOQ/FNiXECA
         YhzbVAheu89bxf/69yeFL0Thl6sY0CRMZY2IoAvGVEsOwxlGX6Uf11/tJ6+lZEQM0M
         oSBf1P8G96nlm71DvKRRToizhQhlrkknGM/lkISl+wxQmlUz6HwkN6l81SSKE0nhZV
         W3t3QlrpejQtg==
Date:   Tue, 6 Apr 2021 08:35:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Guangqing Zhu <zhuguangqing83@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the thermal tree
Message-ID: <20210406083545.150ae47e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=AZ1JFqhiE+17XxXBC1YQal";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=AZ1JFqhiE+17XxXBC1YQal
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5845dd350432 ("thermal/drivers/tsens: Fix missing put_device error")

Fixes tag

  Fixes: a7ff82976122 ("drivers: thermal: tsens: Merge tsens-common.c into

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tages over more than one line.  Also, please
keep all the commit message tags together at the end of the commit
message.

--=20
Cheers,
Stephen Rothwell

--Sig_/=AZ1JFqhiE+17XxXBC1YQal
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBrkMEACgkQAVBC80lX
0GwodAf7BRitqAT35vNl2NvZmWUP3nXWggAYC+cEOr0pjkBC66YdGqOE8qrUcB6D
CcoVbq7C9/VxH+fEc8nzz5JRTVeANNf208kJrqFh9c4e8Jk7K+FA87qLO1bgXfKl
FXecsVie76xuKzz5RjoFZ/Y3j3PcDhSKpfGsSFQh0iSKgV3rt7K09VIXqYh/DKzS
jIR2UjlJ2XoWlbOSX8/juLtCg8R+YNIAqfIdNLUe9QMavyan427Tgg2VAq/UwgdZ
P7pmrLK/K/3bNYMyoTbFSmdyQcTGjya9zEQ1kQkvTb/BMc5RVt1rlYQfg43WH1sP
BpsrzBAu20Xy9P491bp+VsjBsnYOfQ==
=SvuW
-----END PGP SIGNATURE-----

--Sig_/=AZ1JFqhiE+17XxXBC1YQal--
