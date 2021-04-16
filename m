Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2280B36179D
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 04:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbhDPClL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Apr 2021 22:41:11 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48141 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234548AbhDPClK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Apr 2021 22:41:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FM0nT35z7z9sSC;
        Fri, 16 Apr 2021 12:40:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618540845;
        bh=OwZiIABFu7AJlIJwLYAVUQTyUXxkqTtZCX8S19sU4h8=;
        h=Date:From:To:Cc:Subject:From;
        b=LfiBsVKVrv2MJWMn0fKIiphzrlxfYUmPWVfPmfwkAKTP40lG5yZaMBD2eJ5uuz0mU
         Ubi7LRskPM2nEKgurh8g6sdqNLGWKaDfk6JchCxyi2cYgRyAqsZqZ4DNXMsZET/ptC
         vKDsHJP25i/2IFtZPLDu5/TcRik9dc7/58icilxe5ptcS3Xx8NRFcavziIexkaEFLs
         gefLAip1/pU/s0WVAb5pOetILnGXhmFZAMDxu2XytEJuRfIi8l7BruDCpJc/LZwk6j
         qdiiS/JlNakOU7mOtYQE0isakyutZYi4v+UFabNWnPvOh1XibQTxXE8qwVRz17PA3Q
         9j6zLky23dGCQ==
Date:   Fri, 16 Apr 2021 12:40:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Prike Liang <Prike.Liang@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210416124044.53d4beee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HtVi6+vP_cKBfTqVPR61JVi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HtVi6+vP_cKBfTqVPR61JVi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/pci/quirks.c: In function 'quirk_amd_nvme_fixup':
drivers/pci/quirks.c:312:18: warning: unused variable 'rdev' [-Wunused-vari=
able]
  312 |  struct pci_dev *rdev;
      |                  ^~~~

Introduced by commit

  9597624ef606 ("nvme: put some AMD PCIE downstream NVME device to simple s=
uspend/resume path")

--=20
Cheers,
Stephen Rothwell

--Sig_/HtVi6+vP_cKBfTqVPR61JVi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB4+SwACgkQAVBC80lX
0GwW6Af+P7F0mElELCManZPeB/IsOmGPLRkWHmfDQp5aWzWdX1Sclu1t8KbGrWN3
Bsz0c1aPaEriQGTk2whvpPy9eIYUHfHNOFMAqRvh94Y3SZrKUgNuS0aDMgPJA3Xq
iRaElxc6NbaoZFiUSHGV3QYNf1SVrbHX7k8DhGDEUyLIS3RN52Z3b4nsgPEPgtfH
7F3Zr1D8rEMKuAie+FgFKEi4UBPumSrIiiD6u0kTsSRTy3qMbiK/EjGmdJV2oFPS
9U8h8flG9oaxzInzHN6qhx9kuCA0uvT9EMXJvmv2h8eIKl2v5kqkymb1DVPcwXaD
AnGC2PCwYtrN+k5pr7hOqzFqZn3zAg==
=cfmR
-----END PGP SIGNATURE-----

--Sig_/HtVi6+vP_cKBfTqVPR61JVi--
