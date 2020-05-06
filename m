Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37F221C7984
	for <lists+linux-next@lfdr.de>; Wed,  6 May 2020 20:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730073AbgEFSgC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 May 2020 14:36:02 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36573 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729757AbgEFSgB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 May 2020 14:36:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49HQJv0lM7z9sRf;
        Thu,  7 May 2020 04:35:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588790159;
        bh=Y2lAKEzwmA1JYZ50EYY6uYNUPZZtDuL/PQBftQVk7oY=;
        h=Date:From:To:Cc:Subject:From;
        b=J2sniXj3aFxUp+9iAwkfz3sZh1r5A1CwEmuMYKwxE5uc3TD8VKLp16XmWDa6M+lrB
         z4yu64aBoo5SRMRmHdltNHVQ/QmiLZ3j6q18cCKC9cfnrrsPp8IvV2glZOw4DAcew6
         4/xObjUQSeG2O5bmQvprGbUdAIHsiPFfCPbEEmXnoGHEaSsmdLR6uT+2ySpr/xzeIv
         lqblZPLux2wE5SUc50nQqHWpDb4FqWAC7nH1W03pmHk61bpfhpOhVrq0bGYVNh0wgS
         kMF3KPEqdK8NA7lkcwuBdBiKRTllQaeYpagpoCZwr3XhLid1UijXMGPBxuHHib6m86
         XOncWeLXM+yJQ==
Date:   Thu, 7 May 2020 04:35:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: linux-next: Fixes tag needs some work in the arm64-fixes tree
Message-ID: <20200507043557.6ab89b7e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tu+LoBjscrMtLZZAFBI/hjU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tu+LoBjscrMtLZZAFBI/hjU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  20bf6ebaec5f ("arm64: hugetlb: avoid potential NULL dereference")

Fixes tag

  Fixes: 66b3923a1a0f77a5 ("arm64: hugetlb: add support for PTE contiguous =
bit)"

has these problem(s):

  - Subject has leading but no trailing quotes

--=20
Cheers,
Stephen Rothwell

--Sig_/tu+LoBjscrMtLZZAFBI/hjU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6zA40ACgkQAVBC80lX
0GyxrQf/ZuZyuvaOSx4qiOKx1wDBhlQjfEZvAcGrZkZrc+2eqJbN0KOtadcSaxQB
04Ujoo1opXdFoogjazx/Luq/RLBJAXQqfCDgB15ahjjTX+nuR91K06UaPQNgkScr
r3CF3JRgbb5UNpINUa7CAdYpbDWYI7Gi4299akkgroP/u2qsuzVq03gpC9M15y8Z
nEc+TFZhOvhj7qKnqA4AzHxCwMbocP5Fb/Y/OyhebbMoT1TZqldCkqlphgb86kjt
P3Escxz58D6D8mVvhWS7H6YUjHS6CTIEXGKN0OOlHX/K2sunG0pnn7UiH4ST4jDV
86YRGMAJysfUMgMPDh03xYFy7Hqdvw==
=67db
-----END PGP SIGNATURE-----

--Sig_/tu+LoBjscrMtLZZAFBI/hjU--
