Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC33216132
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 00:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgGFWAE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 18:00:04 -0400
Received: from ozlabs.org ([203.11.71.1]:53981 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbgGFWAE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jul 2020 18:00:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0zyB11NHz9s1x;
        Tue,  7 Jul 2020 08:00:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594072802;
        bh=UXYG+NlDuPRRy5dtPsarnIzjPJrnE86KFdNzmLeK3k8=;
        h=Date:From:To:Cc:Subject:From;
        b=ccX4QfgAS48Mia2K3KxM9KbflbFvmHxuxGceEojNOMllclSfhSqHirENfQEXvenov
         QmhafmdWnaNHhURfcCDkL8pQZMCvekVmd6tGfNIGh4J2Iaw3ettgGTTimvTt9mPAbo
         oOEcRHLU1+r+QwuWkptA9DiD2BUKzx4LvL3xblX+noYUdMAV6/rijfilGup3OxxcMN
         dfPU+xlF8Qem9x0YZBEtc/5hQDUHCl5d+DBlSHKN+miX5b7oLPavAfcVaV7RfsS1qU
         JsOoNPJqURB7AmosEZ3CMq3nvP2eAOpD1I9FG5rR6WzzDuv56OpKieM0Cn7WD3U5rP
         jp2er7WyPv3eA==
Date:   Tue, 7 Jul 2020 08:00:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the spi tree
Message-ID: <20200707080000.507aed2c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rox1eQqkVFA0OpS/Z5ogLwp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rox1eQqkVFA0OpS/Z5ogLwp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  878d4d57a6e5 ("spi: spi-sun6i: sun6i_spi_transfer_one(): enable RF_RDY in=
terrupt only if needed")
  1e9ca016b623 ("spi: spi-sun6i: sun6i_spi_transfer_one(): collate write to=
 Interrupt Control Register")
  15254b028dd6 ("spi: spi-sun6i: sun6i_spi_fill_fifo(): remove not needed l=
ength argument")
  60b1f09675f2 ("spi: spi-sun6i: sun6i_spi_drain_fifo(): remove not needed =
length argument")
  9bfc242a9379 ("spi: spi-sun6i: sun6i_spi_drain_fifo(): introduce sun6i_sp=
i_get_rx_fifo_count() and make use of it")
  e0430d904098 ("spi: spi-sun6i: sun6i_spi_get_tx_fifo_count: Convert manua=
l shift+mask to FIELD_GET()")
  05bf34283c8e ("spi: spi-sun6i: sun6i_spi_transfer_one(): remove not neede=
d masking of transfer length")
  642d75131c8c ("spi: spi-sun6i: sun6i_spi_transfer_one(): remove useless g=
oto")
  09a7139e9e17 ("spi: spi-sun6i: sun6i_spi_transfer_one(): report effectivl=
y used speed_hz of transfer")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/rox1eQqkVFA0OpS/Z5ogLwp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8DnuEACgkQAVBC80lX
0GzBuAf9EDuT/Wy/8OoXWI4xKtYTUPCWW0w6wST0fSalfaQI3C52kEFlAI/RI33q
miduGX5odX9QJ4vrpEAfpkMD7GKlBtxT8PdzaQjSmSUBpvCr8OHrQonmJRqTHfe8
nvA4hYiucm7ttIoK1Z+aOI1pjhT7/NDRyTxO5MFFbcOkDPTvB9fpNd5/Gev6z1x0
Xp4AYQwza630Di/JLgsJ1nZZkzfYzb+q7MjestGT3uZKA1/1h+dC3+56TT9o+hvm
L9s0lEWc4eIa+p0Jv88iL2t63uDK9Q6JKmirf8dHc2F8PG7/va5qc42gdZj+IfpD
/yBhGqvnKsvLjTwzc+Qto6x4q1SdeA==
=5qMH
-----END PGP SIGNATURE-----

--Sig_/rox1eQqkVFA0OpS/Z5ogLwp--
