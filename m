Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAE039ED38
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 05:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhFHD6j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Jun 2021 23:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbhFHD6g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Jun 2021 23:58:36 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9DDEC061574;
        Mon,  7 Jun 2021 20:56:43 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fzbyd6LsZz9s5R;
        Tue,  8 Jun 2021 13:56:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623124602;
        bh=x5Ty/qnyFuqgqiao7YcBAwUn1L43IMnSjEoIVgkW1r8=;
        h=Date:From:To:Cc:Subject:From;
        b=EMBGfcKnGq0/jCUGEsDdia/epRmbi7moodYhfX/QAdDBKmsfMU6z99eVvxXNtRoM/
         3wAwYs1lq9KtzegfASy98TV6497LArY/h5Oho1LOgVd+sajYr781L33/r4Qlfedy1Q
         ee3hFniU9syk3k5eEit/TG70G5bA0qiI4vZ1OOT8ugQk9eHrVKzU0048cX2lJlVkCq
         bU3N+2vURngG+aIns2Rho7ze/zyNnBkz9mclZzXB6UuUoBb/aNy2PgwPk7na/rQZFl
         qCUwl3ElpKIUkO9+ehzLHroAyU51CkB0zBzyrHlsInltLRvfe+/8jfSthq8ILRdfMX
         DMyPJVTFuUVlQ==
Date:   Tue, 8 Jun 2021 13:56:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iommu tree
Message-ID: <20210608135641.67e123e6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8r/nd8oEgEItWvRc1J/yyXG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8r/nd8oEgEItWvRc1J/yyXG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommu tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: vmlinux.o(.text.unlikely+0xddf06): Section mismatch in re=
ference from the function detect_ivrs() to the variable .init.data:amd_iomm=
u_force_enable
The function detect_ivrs() references
the variable __initdata amd_iommu_force_enable.
This is often because detect_ivrs lacks a __initdata=20
annotation or the annotation of amd_iommu_force_enable is wrong.

Introduced by commit

  b1e650db2cc4 ("iommu/amd: Add amd_iommu=3Dforce_enable option")

--=20
Cheers,
Stephen Rothwell

--Sig_/8r/nd8oEgEItWvRc1J/yyXG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC+6nkACgkQAVBC80lX
0Gyq1gf/ZFzFWja7cobOoszb+vsMFVX61FwRs/5SYortrhfpbamVrQ4XptMfDqgz
TSHZr1ufOdboVr+U4voSWkObDFjnRzXSbuc5VdqLnoGBdDdKwF8wzyFL1SPzXY1l
sIOwnZmafleOJH+UDecmHcY3OTWZMLFVyt/OXgRlSTkn0lLrK141E3wOu+Sf+6m9
HsrtdjLjngZLYjcazMG1mYxauq/cTws4kbQeWVo80LW9NejQHYd9ZsHvwc5zokgQ
nk5uLfC71axAhikRudPegdfr3dxcffcwMGQtaMTzaSLAxuelwzkx8YYdHqAfOVlG
aEy1Tim0/X2kBc3mdkz+grJR/VaBHQ==
=AVZv
-----END PGP SIGNATURE-----

--Sig_/8r/nd8oEgEItWvRc1J/yyXG--
