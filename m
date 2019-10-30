Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A546E95D1
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2019 05:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfJ3ElJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Oct 2019 00:41:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45511 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbfJ3ElJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Oct 2019 00:41:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 472wkp0Bbbz9sPK;
        Wed, 30 Oct 2019 15:41:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572410466;
        bh=c/GWYbrpwJXaU4bwFu4wiFur1OqI7HoLNJSwazqhhE4=;
        h=Date:From:To:Cc:Subject:From;
        b=dgwlRKenKCQ89lxYXn2LGV5/fkFugGOVnTrcX2CxI4gvU6Frgv35L1jiokNlDA3Cz
         53CuAu3ByeAA9P/q69CKQilisIYzKqIUfErEB1/f3eEizYmBvXH/ScYRYVMp9f68QC
         iwZW7XNAd6qxY1T1l0NgMBx9pUlzPbgZmLK0gNv9xeGTr41VQjMSDlD6OqAv/MHGYA
         rMac/Q6DThK4K3cUJxjQg8Rlj2nH2tD4qKVdL/jbWMmazoWV0tqs1399T+NcgZ21pH
         UWCqZm8vnRWK+gnHxjxicjrn8JZVikSDdPIaZagZTqsaPrWhICu0x6ejCiLk2Rq/B1
         Mbduhx2roXaWg==
Date:   Wed, 30 Oct 2019 15:41:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the rtc tree
Message-ID: <20191030154105.16a2797f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8Fm2_jNpvMCIEAIe/1oA4Vz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8Fm2_jNpvMCIEAIe/1oA4Vz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

WARNING: unmet direct dependencies detected for FSL_RCPM
  Depends on [n]: PM_SLEEP [=3Dy] && (ARM || ARM64)
  Selected by [m]:
  - RTC_DRV_FSL_FTM_ALARM [=3Dm] && RTC_CLASS [=3Dy] && (ARCH_LAYERSCAPE ||=
 SOC_LS1021A || COMPILE_TEST [=3Dy])

WARNING: unmet direct dependencies detected for FSL_RCPM
  Depends on [n]: PM_SLEEP [=3Dy] && (ARM || ARM64)
  Selected by [m]:
  - RTC_DRV_FSL_FTM_ALARM [=3Dm] && RTC_CLASS [=3Dy] && (ARCH_LAYERSCAPE ||=
 SOC_LS1021A || COMPILE_TEST [=3Dy])

WARNING: unmet direct dependencies detected for FSL_RCPM
  Depends on [n]: PM_SLEEP [=3Dy] && (ARM || ARM64)
  Selected by [m]:
  - RTC_DRV_FSL_FTM_ALARM [=3Dm] && RTC_CLASS [=3Dy] && (ARCH_LAYERSCAPE ||=
 SOC_LS1021A || COMPILE_TEST [=3Dy])

Introduced by commit

  e1c2feb1efa2 ("rtc: fsl-ftm-alarm: allow COMPILE_TEST")

--=20
Cheers,
Stephen Rothwell

--Sig_/8Fm2_jNpvMCIEAIe/1oA4Vz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl25FGEACgkQAVBC80lX
0GwW5wf+J+bypPtP+n/HtLbVK+zNcQ+DMVAffnMsbRzDJadjgFBJuU0R7sXGfm8q
OqA2blzmTCF4HrE90ZmYIVkJErUcKRGhlFjEscqyqbM/0fu9D0IcruKfT++lCfyN
m9MzYy9DzyPDI/yjPnGiu7KNNfplrHEu06jBrbJ739L1GBg/zv9yJW1AA9QSiKGc
ihDWElIeNhRvB/KUeHyx/wNuo/iMHxf1QIYeNwGT7km49TIe6u0khcgma37mMxqi
2dLpwFcAJrX0jsmJAJfmBWak+XZuetvMYfLtpas5k5Flash6V0msWj8cT47IFB+M
9Pk5NPxuBAqzDTy1TKSM8xfpGDZ45A==
=9yrS
-----END PGP SIGNATURE-----

--Sig_/8Fm2_jNpvMCIEAIe/1oA4Vz--
