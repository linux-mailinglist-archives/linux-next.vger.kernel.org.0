Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36EDF39EA0C
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 01:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbhFGXXo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Jun 2021 19:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbhFGXXo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Jun 2021 19:23:44 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28076C061574;
        Mon,  7 Jun 2021 16:21:52 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FzTsV176Lz9sW6;
        Tue,  8 Jun 2021 09:21:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623108110;
        bh=341u1WcBu3uL5xHi1SKjECS16kRSGYLl7VyY3/khpAk=;
        h=Date:From:To:Cc:Subject:From;
        b=itSg0ui2ZPSHUwWqZe/bK/N6AeId5dtuyFWpXfAz4dST5K5Iea59ywKPzeFGUlcja
         a66qxkFuDsXGprjdyi6R0CHsSgoWlGx24qxgYD7K5gZifovHskk7XBHTl28H22Vphu
         GEUN7/nXIzSa28Rz+aNF/7tYf0gOC4x9BaqF1BtimWl2wKbo6REdlhnrDKda74Wbcb
         SLik7cyr0dgCIDf3fMOnwtBFWwJfjqk7DJhDSEZpya2BnUI47ncgSESmdJOzhGJX2I
         P88vz2qgqHrvhPebFfuF4GosDiCN5nGbWBB3TksOWE6eMa9tFLvw0yItKPsEE1LgAz
         CP2cEfSsgb1tA==
Date:   Tue, 8 Jun 2021 09:21:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the irqchip tree
Message-ID: <20210608092148.4304e644@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6Hc8th9/TjCAIwso3Vw=733";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6Hc8th9/TjCAIwso3Vw=733
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the irqchip tree, yesterday's linux-next build (htmldocs)
produced this warning:

include/linux/interrupt.h:131: warning: Function parameter or member 'desc'=
 not described in 'irqaction'

Introduced by commit

  bb33916b527f ("genirq: Replace irqaction:irq with a pointer to the irqdes=
c")

--=20
Cheers,
Stephen Rothwell

--Sig_/6Hc8th9/TjCAIwso3Vw=733
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC+qgwACgkQAVBC80lX
0GxNVAf+PMRL+IBNolwf0vClJ884rxT+BKRNYv+TEzBFgZK2yN3NRmmynKYdX4uN
l6Vqh/3ddIwSfKXgJ+U7zE136UqXXPtYz2/fgAW/3raNYgW+JKr74tP0v53r1A3Z
NxicTrArgOKtdX1uJ9tGUXCrUXwADvr924qBCdWTZcxYKdpa2OxOXcCreQ8Sq7d/
RTnhe8vqHpgzLEkfC2IMFCMyrn0ynMSashW17vyP3kUTxhQtNk17ZvNVMrB29JPp
zQrOT801TsltPqS6E4zDYPzTzuWgDgXLftYU28y8G1rkmqoin4RE9eDTzWGxzu0g
c1TUSMWRURX3VDyc+B6AgZzi6g18Rg==
=MguI
-----END PGP SIGNATURE-----

--Sig_/6Hc8th9/TjCAIwso3Vw=733--
