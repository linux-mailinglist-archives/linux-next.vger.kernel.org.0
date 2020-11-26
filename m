Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134972C4EF9
	for <lists+linux-next@lfdr.de>; Thu, 26 Nov 2020 07:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbgKZGsy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Nov 2020 01:48:54 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33265 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726287AbgKZGsy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Nov 2020 01:48:54 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ChSyr1DWQz9sRK;
        Thu, 26 Nov 2020 17:48:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606373332;
        bh=Rsygi9L9GoLVZejz2LN+da0eo2oFOlcEJ8PL0kbtHv0=;
        h=Date:From:To:Cc:Subject:From;
        b=XiqU2QdbPZHF0e10RR6aNKizwDr2QQYUPx9N3Z6U9xBD9t7yCgRITRTJPHGKDFmd9
         Zze5J6Eu65RQsBORMBvlnQRs2chXmXVa3Z4wPnnBbgK4kJRTzUALCTtYp/oE31+kHz
         2GIDDw933ndQf72i0VsdkYJxpdllwO+De02rv5i+j6el9Gl2PIW8NvEUyP/C/vfJ5Y
         lEWDKaonM6p++H13YecStNc81CxE/NSTj9YJdps+7gyv43dlN8mWUbT/nDxbjL3GK7
         0PK3c9nlAoJ8IS2sOulkP/4LZbfIp8RkIKRySB0hyiTlJs9bcN5DkLjiDTU0EgbLZp
         d9ppD8m+7Hiiw==
Date:   Thu, 26 Nov 2020 17:48:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>,
        Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the arm64 tree
Message-ID: <20201126174851.200e0e58@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n9ofhb6RLCy_GVvf1KZDlNf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/n9ofhb6RLCy_GVvf1KZDlNf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm64 tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Unexpected=
 indentation.
Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Block quot=
e ends without a blank line; unexpected unindent.
Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Enumerated=
 list ends without a blank line; unexpected unindent.
Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Unexpected=
 indentation.
Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Block quot=
e ends without a blank line; unexpected unindent.

Caused by commit

  63a816749d86 ("iommu: Document usage of "/sys/kernel/iommu_groups/<grp_id=
>/type" file")

--=20
Cheers,
Stephen Rothwell

--Sig_/n9ofhb6RLCy_GVvf1KZDlNf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+/T9MACgkQAVBC80lX
0GxFyQf+MCx86Qjrs6UUXB20rg+PXTdQ0nGq9P3zlyhcTstJ+oH+xxA8Uwo+7PiP
lKfY4pZif6N4I2P4BWPZbtrP8dxqPAXbfuv91fAmKmXFMawNNxiIgcWTef0wp2XN
DEkluxsVtSZ/KHRSWkmj84iMW78a7xGbn7SVRBITEHp4v7vIslRa1ysMsdlCs2g1
Krz4HvHv/kZAJqxLooUvvi9CpK/sOUq3uho7akhXznFsA9k0oaOfq0EQ90IK/1N6
es2oWMihMq2cR6jGI5yJnSWgVybXfkCMJDwngBlxrsWtwULlPeVXm771PncOloED
UvsKivlSxPtsRK7Cfiu5UBOMZXyHBg==
=L6gA
-----END PGP SIGNATURE-----

--Sig_/n9ofhb6RLCy_GVvf1KZDlNf--
