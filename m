Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90C2913B79F
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2020 03:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728880AbgAOCX2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jan 2020 21:23:28 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44275 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728877AbgAOCX2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Jan 2020 21:23:28 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47yB2P5KqDz9s29;
        Wed, 15 Jan 2020 13:23:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579055006;
        bh=stHvswn9sK7Zi+BgE8W1eVXr+Ed1WoFsrfYI/u2Q73Q=;
        h=Date:From:To:Cc:Subject:From;
        b=eYIgdkwWbY0xEH+0gqwMcS/hsp0mQuKE/XD7P9JuodY/MnFxwIRoOCW3S3Y2pcgNk
         DPr+pKVdoYzmhZaOf8rdxybNYHRzto88EZe05S6nQxxEdjM4191uV4daqWdVr35On1
         KmrpiPIJuuDFJLEtXaRCCPuiWUcoOTJRD/FEDwm198QGG7ZCJAqm9vf5JrXeXBXpm6
         0WfZUvfUN8koEqTqR10BvYdmEBDQmHgRtT5keAr4g8EpdL69sFdTWWZWWUpXhTYPXG
         bXAmzLN5C9wbPeeFfUNJnJfeLqXxsYxtovZGdHFboE3xUZMq+vP0zRjczr41pWyECr
         AESl0Az0EK1Gg==
Date:   Wed, 15 Jan 2020 13:23:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jean Pihet <jean.pihet@newoldbits.com>
Subject: linux-next: build warning after merge of the spi tree
Message-ID: <20200115132325.3ac3ca0f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vs=MdSqJ5uWEzn.LGFIjOm8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vs=MdSqJ5uWEzn.LGFIjOm8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/spi/spi-ti-qspi.c: In function 'ti_qspi_start_transfer_one':
drivers/spi/spi-ti-qspi.c:392:8: warning: 'rx_wlen' may be used uninitializ=
ed in this function [-Wmaybe-uninitialized]
  392 |     if (rx_wlen >=3D 32)
      |        ^
drivers/spi/spi-ti-qspi.c:318:12: note: 'rx_wlen' was declared here
  318 |  u8 rxlen, rx_wlen;
      |            ^~~~~~~

Introduced by commit

  e7cc5cfbea4c ("spi: spi-ti-qspi: optimize byte-transfers")

Looks like it may be a false positive.

--=20
Cheers,
Stephen Rothwell

--Sig_/vs=MdSqJ5uWEzn.LGFIjOm8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4ed50ACgkQAVBC80lX
0GxhLgf/cNbQRzGsh2af+SU3SfiIGUWJDE73bxIjIDVLMpVoMV1NhVzgRB5tP7vR
dC60DtHGH3Ttl/seMa6f05326dQj3kkCAVlv0EpJmByokYspHCUiBeVQK7EtTgyd
LLYH5MFQntULUU6cyKQce1J1EEvh0iiiOQFnSpRoGRsuubgRaNE6VuXjg45fk6gQ
ZpzaN/tqWYm4cJBnif7YW8Hnp/4oPSsX43oTTw9r03laXfzyVLXdFKnWdlPgiu6x
rYcOLPUmr+D5QbVkBlzHDRZHctnZwKiFKxS7A5p0OCZ4UheJLQrSPrYfVvWL/MYi
cSC3fkZpg6bFVaTrKN0kDvU3G1GRxg==
=eV2g
-----END PGP SIGNATURE-----

--Sig_/vs=MdSqJ5uWEzn.LGFIjOm8--
