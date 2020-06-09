Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A933A1F4975
	for <lists+linux-next@lfdr.de>; Wed, 10 Jun 2020 00:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgFIWkB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Jun 2020 18:40:01 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37275 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728108AbgFIWkA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Jun 2020 18:40:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49hQ6k0p9qz9sRR;
        Wed, 10 Jun 2020 08:39:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591742398;
        bh=dA0JwROp87FWujpZdHmbCyvHgliivh3cSiE4ws+NCrQ=;
        h=Date:From:To:Cc:Subject:From;
        b=mdxUB6dpjBexhv54tbwS53nAqNjVNTOK4vSRYBZIMSNGOQsJf76JxROA49z+gA0V9
         eS1vK3yC0dglt/I6ApHI/LL27xtEbLfRedxOPDCN9oC+6vyWhWfoQGT+o8N4mP+3np
         X2kqsBxflEuXD5eXBSsITgML6ycyjC8vimG9PQH8cwFw/lFbcuZVO+LbOaFeR6tsIA
         wIAYBtX/LXC7pC/5McAzz3d28JvdUMIiZr4liK1FihV+yHC+dgnCQUt1YIjtxC8Q8v
         G9FgYBDhD5ne8HZLgwXSA6fEmeajhoArEbof8sF7B/fN/klpNNHRhxxv5H1UdvEtsR
         5RcUaXFnnCm8w==
Date:   Wed, 10 Jun 2020 08:39:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the omap-fixes
 tree
Message-ID: <20200610083956.21820d73@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cE9ciLePVRM+n3cb/CfzlJ_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cE9ciLePVRM+n3cb/CfzlJ_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  e711da8e6306 ("ARM: dts: am437x-epos-evm: remove lcd timings")
  02d1ba4bdba0 ("ARM: dts: am437x-gp-evm: remove lcd timings")
  dc7677dbb854 ("ARM: dts: am437x-sk-evm: remove lcd timings")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/cE9ciLePVRM+n3cb/CfzlJ_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7gD7wACgkQAVBC80lX
0GyZTAf+JpbYiKRBubtX1nNWV0huR5l4lHtVok1Tpw30xZzSilRjiwc/Sw24G17K
505KuchM7/+uhZ6KVf15e62mBbbkjmnpdJ9qudr+jS9bybP9E9pSwuRUpMaEIdM/
reV5JYt4CLNG93WNDziGZSqfstvQ8KMAwJBcdfvfrV0RCC23V3GuAy2DjW2kBT2u
0QCvquPPO6oFEu7koZsxglUMO2waYLKVXpw8Lb8K8Spdz7saHk4ZOv6zMz0sPJTO
kvqvaepEEUGodY/GOa0g3TxXMYchKAyQYeYLwjNiPc3JT+ITXvcXVzlGIhQx0OWn
Y4umzBotPYR8UUMfsaMz1252WoTuOQ==
=DV0T
-----END PGP SIGNATURE-----

--Sig_/cE9ciLePVRM+n3cb/CfzlJ_--
