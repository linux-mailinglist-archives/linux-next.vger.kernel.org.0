Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25D563E5387
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 08:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbhHJG3f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 02:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233987AbhHJG3e (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 02:29:34 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 969E9C0613D3;
        Mon,  9 Aug 2021 23:29:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkNMK2pwKz9sX1;
        Tue, 10 Aug 2021 16:29:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628576942;
        bh=K4C1RwrWgHyekanq/bm9+5n02wgTy4ZOdMkGJYxefDI=;
        h=Date:From:To:Cc:Subject:From;
        b=fY7XtVEvPPc0eCmW38K8Tqzwluy1Y9p6LqTtILfIevjZhz7U2yf7cnhlTqsySkuNN
         UDsXrayYUPDK4xDg/r8ENEtppUD/v4nVCP/tsetGrZMkQ1hrcDqUtz5LXlofKhLXx+
         UlFVezNvJefCvxSNlj/2KDH9bnpL0QyVeUvdtFQUhY3nL5QylrfIJy3mOcmLQyhQRR
         D+aQjHBgZe7Wn9A2IGuOOzEaDSOiCbdOlGsgaCfWJoAETidSUHDF/kISpyVqeCjJDn
         DQHwFMDEBzW3sBHxnaGBHODa8A49h/KDB2yNQ3NRV8wMMh6di98t+P1DGSwoyit1K+
         /YdWGXLpnyTHQ==
Date:   Tue, 10 Aug 2021 16:29:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Zhengxun Li <zhengxunli@mxic.com.tw>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the spi tree
Message-ID: <20210810162900.3efefa1f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uLgfB2qPPWNwy.CQqezHQKd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uLgfB2qPPWNwy.CQqezHQKd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

/home/sfr/next/next/drivers/spi/spi-mxic.c: In function 'mxic_spi_mem_exec_=
op':
/home/sfr/next/next/drivers/spi/spi-mxic.c:401:3: warning: this 'if' clause=
 does not guard... [-Wmisleading-indentation]
  401 |   if (op->data.dir =3D=3D SPI_MEM_DATA_IN)
      |   ^~
/home/sfr/next/next/drivers/spi/spi-mxic.c:403:4: note: ...this statement, =
but the latter is misleadingly indented as if it were guarded by the 'if'
  403 |    if (op->data.dtr)
      |    ^~

Introduced by commit

  d05aaa66ba3c ("spi: mxic: patch for octal DTR mode support")

--=20
Cheers,
Stephen Rothwell

--Sig_/uLgfB2qPPWNwy.CQqezHQKd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmESHKwACgkQAVBC80lX
0Gx6HAf+L/izfXTap2oFpd/I1bWoZHAyDz1aE+1FV1ZN5zxwuMo2lCc7A7hKVqKn
prX+E73uj83wY1TS3Ukz1tXV3+su5yBAzoXVxtALz7LxSCoipSzNQao9b+0DX7GU
p3WB43SQhRjCcy5LDbadGOWLxUz5L24wtcW5/3QBs4sa7hd8G0QWaU9Hoi4W2CDg
hE8cDnc8ulDtyaSN+piq5yMF1uRd6c/HvE2sJ+0wawQ5X6DNR2QhWHHmP9qW+xSL
dZEehwiwVax4lvDtP0rK6KCnEJyxwYTnvX+HZpQ0szK/cMzkPDhg/nlVuuLgPCmx
0qxQeLFUZ98NfsMzvp4tptLyen6wsw==
=TaSH
-----END PGP SIGNATURE-----

--Sig_/uLgfB2qPPWNwy.CQqezHQKd--
