Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0223549C4
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 02:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233321AbhDFAp2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Apr 2021 20:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhDFAp2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Apr 2021 20:45:28 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D3BC06174A;
        Mon,  5 Apr 2021 17:45:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FDphn49Gbz9sVb;
        Tue,  6 Apr 2021 10:45:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617669915;
        bh=fRaGAjHItpyVyGdF4/hxyiWEab3ZshMZfb91sbMvSNo=;
        h=Date:From:To:Cc:Subject:From;
        b=SQBnbuRZ2z9gRZZzhNhlaxazl2iHCSiO9qiHA4sAowTvK1pZFSYH7JQHFXKVD68p6
         pKSG/LMJZ2DDekGL6wsYhL7Y30QN+4WaF03/e2QGB/x2VqLvNDFg2kVEzKj15ib/13
         GIbAvojnFzfkZmVC9LrLmkCU3lIyyA3wewNFOUMogFoq64YS3fMYA+mhUbtSsKTfGe
         wTqRSuacb6aaQ99LYJ8p5Y2avGBpecr3g3xqcsyqpwcRxTGto844xMBClufxQEJdHU
         SerWq3rvZnc8P/uzp26xWkwNkovYK2MpbG/flFR7xmr8LoLObNiKQlGFubLjTbxEsA
         nA7r4EchbuPPQ==
Date:   Tue, 6 Apr 2021 10:45:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Dinh Nguyen <dinguyen@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the arm-soc tree
Message-ID: <20210406104511.2535b830@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ili35lo=7NquedPZ8QHVoqq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ili35lo=7NquedPZ8QHVoqq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/clk/socfpga/clk-gate.c: In function 'socfpga_clk_recalc_rate':
drivers/clk/socfpga/clk-gate.c:102:7: warning: cast from pointer to integer=
 of different size [-Wpointer-to-int-cast]
  102 |   if ((int) socfpgaclk->div_reg & SOCFPGA_GPIO_DB_CLK_OFFSET)
      |       ^

Exposed by commit

  cdb1e8b4f4c2 ("clk: socfpga: allow compile testing of Stratix 10 / Agilex=
 clocks")
  552418658acd ("clk: socfpga: use ARCH_INTEL_SOCFPGA also for 32-bit ARM S=
oCs (and compile test)")

--=20
Cheers,
Stephen Rothwell

--Sig_/Ili35lo=7NquedPZ8QHVoqq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBrrxcACgkQAVBC80lX
0GxAfwf+OqgRCTn9vH8W09vhY70swud44n50ONMMSXeM357OQzJfvpobZ53m2l7t
sibwkppbWrBWFQRrE00QJMtoHoafvxV38JMsAoZC+uLEyPGPgGdk4jTZVthz2ree
MxaNm4MmHCJ76Pii7DhMl109ScfEz8M75hcXaRbBTslVe+1pFj/JJjjIhCifCUmr
Gcfs2ecIvaoiqspH043kcDkJ/lsddtj4JPctHVkjoOIxdPqc16TA69ZtsNseZwVP
85+zd9VCMO8Za0x5rG1dp9kyEu5dPJb68kdUOdwtrSvW1nGk67gp9u4YZDXDyI4G
k5H36wcByZgzidTcVYhFAwNsMzGebQ==
=KScD
-----END PGP SIGNATURE-----

--Sig_/Ili35lo=7NquedPZ8QHVoqq--
