Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAFBA27C1B5
	for <lists+linux-next@lfdr.de>; Tue, 29 Sep 2020 11:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgI2JwB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Sep 2020 05:52:01 -0400
Received: from ozlabs.org ([203.11.71.1]:52607 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgI2JwB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Sep 2020 05:52:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C0vmt3WpWz9ryj;
        Tue, 29 Sep 2020 19:51:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601373118;
        bh=/UqAU7011XTSxM8Odjpdoba4HXdub/28FHyXfr9VDpI=;
        h=Date:From:To:Cc:Subject:From;
        b=dIj/eZyfw+55aEIdKO8HC8PE32itvRp2Gg25y6ZNySuDSdUy+FuE1C68tJXbUgVM2
         zs6F2H2cf4XKb9LPj5lUPTv5l1RnF6W+tYXKNcMCgdWsAunjl3MKVSGoLtz2U4zgJa
         m9W8tuzoWLyBvWNO9adkmFJJf/YPV/rGO/G+qMx7KSQ+srnA40HbG5y+KCP+KMrkfO
         cJa0cDBqLvt9WMyqp26Y5iV3hbtfFRfbMFIl2NV2+FHSIBiHcHdfBvIvQFkEAwfPO+
         gK1vDFuFnkosKgdmKKm4I1/BvgiV0+VydDJg8PaH5h/0//Ymhqb9rcBmpfl/ZDW2D4
         QALX3J3+25O7w==
Date:   Tue, 29 Sep 2020 19:51:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm64 tree
Message-ID: <20200929195157.147ea306@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YUbYQoHY0xpILsM7N=.UA3h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YUbYQoHY0xpILsM7N=.UA3h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  9a313c5d65a5 ("arm64: Get rid of arm64_ssbd_state")
  d48ecc90a0e1 ("KVM: arm64: Convert ARCH_WORKAROUND_2 to arm64_get_spectre=
_v4_state()")
  780bb94b072e ("KVM: arm64: Get rid of kvm_arm_have_ssbd()")
  2197c8674ce3 ("KVM: arm64: Simplify handling of ARCH_WORKAROUND_2")
  977ce2df500e ("KVM: arm64: Set CSV2 for guests on hardware unaffected by =
Spectre-v2")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/YUbYQoHY0xpILsM7N=.UA3h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9zA70ACgkQAVBC80lX
0GwqFQf9E4mpGxrLTA0vGc1FCcPtteSJHRa0erd+X9L0W5NY8jjIAro7YAifhV5H
q6l3yU4YhnfL60CMbY13DTqlulxqMkIZK28I2s8agRo25w77V6pcB3/uObuXj2Sn
M8TyeBr2h7LELWZuNpBVSDUzZ5dWLTk3XkqUAWSpCCGcSDsI2SVgcRGRbMOWJKO4
bc25J57JHEo7ykBD7vqHfbvu23DlgD7IfIdQPjcoz+r/np01ir6zbQB/k0lF1Xu7
uBCjdWCkbsxssohMjqAJDn3T0NlrZUAJro7YNz8nTrmSzsGq4ld7sVRYTlNM7fzY
7f7Mkn66PEFxWLESmkTUe3q+vpV0dA==
=5UDm
-----END PGP SIGNATURE-----

--Sig_/YUbYQoHY0xpILsM7N=.UA3h--
