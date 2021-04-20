Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32F9C36511D
	for <lists+linux-next@lfdr.de>; Tue, 20 Apr 2021 05:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhDTDtM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Apr 2021 23:49:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33105 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230037AbhDTDtJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Apr 2021 23:49:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FPV5w0KQFz9vDw;
        Tue, 20 Apr 2021 13:48:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618890516;
        bh=c13wjuyn1jdn7WOn1rpm2sz80sbvyU3wO/avQ8o6z64=;
        h=Date:From:To:Cc:Subject:From;
        b=OmhkWKizozd3g57+AlGpefnn4bPDWQSJfaIM/m3AuhGYFz/w/a6HJXug3RAQe72Jv
         tbW82jntJdPWYXOkAFbYWZUTds/9WtmYsP9DBkAjZqcrsD2Kq7f4gzhOCKROJSjnAj
         ZXIAwuiSsw6oIDq0B98j0BrGzTqBJCPoBXku9iBasjQfGIPxKSUx8Qcf72UUYL7cNa
         vxfOEX9U+P1oUXmLu7DG7oErwtA5B70CchInyGRx6CzsAx5O31yKwiin42Xgog2ZMz
         jir4HBh6hPrJv09AR55Akp1O7XjQiBvTeI3Wp/c2gFxGwKaAzgRZNT5XHNVCSvlISv
         d7uSU2eklWj2Q==
Date:   Tue, 20 Apr 2021 13:48:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the spi tree
Message-ID: <20210420134834.57467d47@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//=fx.T/036XDD7cF/3NPOQP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//=fx.T/036XDD7cF/3NPOQP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

In file included from include/linux/printk.h:409,
                 from include/linux/kernel.h:16,
                 from include/linux/clk.h:13,
                 from drivers/spi/spi-stm32-qspi.c:7:
drivers/spi/spi-stm32-qspi.c: In function 'stm32_qspi_dirmap_read':
drivers/spi/spi-stm32-qspi.c:481:21: warning: format '%x' expects argument =
of type 'unsigned int', but argument 5 has type 'size_t' {aka 'long unsigne=
d int'} [-Wformat=3D]
  481 |  dev_dbg(qspi->dev, "%s len =3D 0x%x offs =3D 0x%llx buf =3D 0x%p\n=
", __func__, len, offs, buf);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dynamic_debug.h:129:15: note: in definition of macro '__dynam=
ic_func_call'
  129 |   func(&id, ##__VA_ARGS__);  \
      |               ^~~~~~~~~~~
include/linux/dynamic_debug.h:161:2: note: in expansion of macro '_dynamic_=
func_call'
  161 |  _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
      |  ^~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:123:2: note: in expansion of macro 'dynamic_dev_=
dbg'
  123 |  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
      |  ^~~~~~~~~~~~~~~
include/linux/dev_printk.h:123:23: note: in expansion of macro 'dev_fmt'
  123 |  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                       ^~~~~~~
drivers/spi/spi-stm32-qspi.c:481:2: note: in expansion of macro 'dev_dbg'
  481 |  dev_dbg(qspi->dev, "%s len =3D 0x%x offs =3D 0x%llx buf =3D 0x%p\n=
", __func__, len, offs, buf);
      |  ^~~~~~~
drivers/spi/spi-stm32-qspi.c:481:34: note: format string is defined here
  481 |  dev_dbg(qspi->dev, "%s len =3D 0x%x offs =3D 0x%llx buf =3D 0x%p\n=
", __func__, len, offs, buf);
      |                                 ~^
      |                                  |
      |                                  unsigned int
      |                                 %lx

Introduced by commit

  18674dee3cd6 ("spi: stm32-qspi: Add dirmap support")

--=20
Cheers,
Stephen Rothwell

--Sig_//=fx.T/036XDD7cF/3NPOQP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB+TxIACgkQAVBC80lX
0Gz+7Af/RgSlzBNib302c4CXa9omBv5QRFGqaIWmsYcqYHhyVblU7qvm8sUgXakV
0Xj+BZTQWbipJwE2NFNS/XON8rcSQcM5fKIWxh+mLb4ezKDFQlc0iuorNRza1PgX
lmOZu0GDuk2UuCaUw9TJWAeOSdTJpuxz/53meoemhLElez3/9S5PPOzwoasfzpwN
K+wj/f6hFNtQuw11zWgc4sPSxsHgGhv/CPJJX93NbalYMaFEyS2dmPfAisMsIQPe
aBoMWKZAsPBmCPkcD/9AZWQ72oOjf8HrJEuKPzRgCx/mXGYcjYcCf2CJS28nLh3U
jENssrx6ObIzFYJDs486OnHlKAUIHA==
=uvLD
-----END PGP SIGNATURE-----

--Sig_//=fx.T/036XDD7cF/3NPOQP--
