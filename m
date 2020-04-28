Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB08D1BB689
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 08:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgD1G3S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 02:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725917AbgD1G3S (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 02:29:18 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDC2C03C1A9;
        Mon, 27 Apr 2020 23:29:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49BBZ06QC1z9sRY;
        Tue, 28 Apr 2020 16:29:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588055354;
        bh=GnxcI0kkLzQz19bJb2kB7GvBixqRVImJBSF2kt9g9tk=;
        h=Date:From:To:Cc:Subject:From;
        b=SQwyib3KHot5j38pdCwwNfttpWYV9gx+jbRIrpYQCURiZ+iNde27t4Zru33nz/Yid
         GvtZ431uyw+CXFogxZiUYsAkyo3wtbnPG9/MjJ153ikeezXdneMnvP03uJOT+Sg9Bg
         YCx4KpK/8oZtt0mGEbfK+aUs6m87h8vJMGhkVLLN6MmFtouLyzutfYwVeNqDMprm54
         MGmNdTysamxHafxdeYZ4TazY44VTTkbhOW2EMIBWcIkJClzFD2k3JHFuy0y1p3mafF
         mX6EeDUfDUyuMYTuM2aF7X4ejJCTDvz4plnEdzO6WSBSXkNY9vOk+v0f7+rafRNjev
         132ZGFZtAnLmQ==
Date:   Tue, 28 Apr 2020 16:29:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20200428162910.0dee6f52@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HHh.isL9q9ZPyWaPWYipMyu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HHh.isL9q9ZPyWaPWYipMyu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
produced this warning:

arch/x86/kernel/unwind_orc.c:29:26: warning: 'cur_orc_table' defined but no=
t used [-Wunused-variable]
   29 | static struct orc_entry *cur_orc_table =3D __start_orc_unwind;
      |                          ^~~~~~~~~~~~~
arch/x86/kernel/unwind_orc.c:28:13: warning: 'cur_orc_ip_table' defined but=
 not used [-Wunused-variable]
   28 | static int *cur_orc_ip_table =3D __start_orc_unwind_ip;
      |             ^~~~~~~~~~~~~~~~

Exposed by commit

  153eb2223c79 ("x86/unwind/orc: Convert global variables to static")

This build has CONFIG_MODULE not set.

--=20
Cheers,
Stephen Rothwell

--Sig_/HHh.isL9q9ZPyWaPWYipMyu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6nzTYACgkQAVBC80lX
0Gxr2Af8DtURpiQP8RSDSzqWrGJVXcZcmVG3bzN3fY+x6rt2qxz2KvWszV5uSvNN
ZrS0anFoWP/GCqD5OQtVQZy2EXrVwHT9z/7zKCnU3R8ckpbilmvRRNkAKHx4+PLX
wslr2WkgHg5DWgSqUoR2bGlOXMPwbn3wn/NVV+cHslAOJpDl+fFSfF30p01Hiccz
dYtucOHViDLqLxvZG7be8Hmw7mreaJqIbesFAuwFYf3a2zqFhc/qQIZMRmNFEcly
YUateOoP5TFsH2BCH1w9KPx3tk29I0mXDe3Szb3XGeOrLqa7yDGzHAgvBu6O76dx
b/rOzW6wSsGD62FfCWzoLyM3G3IPqw==
=bs8r
-----END PGP SIGNATURE-----

--Sig_/HHh.isL9q9ZPyWaPWYipMyu--
