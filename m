Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0EF3B2D9C
	for <lists+linux-next@lfdr.de>; Thu, 24 Jun 2021 13:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbhFXLTW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Jun 2021 07:19:22 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34553 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232310AbhFXLTV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Jun 2021 07:19:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G9czH6788z9sTD;
        Thu, 24 Jun 2021 21:16:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624533421;
        bh=Dn5VASjZWmEO2v/Guxjpa0+M1l0Gqt4A1n1jTK5ya0c=;
        h=Date:From:To:Cc:Subject:From;
        b=ckwfQwc9hRxHKl1N3dzNgnenEYVC5Vx5whpK7ANnDH1EWzb0ulpka+ukPt/4JcVds
         Jp+AxfIwEe2/JI9hJ+UWyTsMZ1u9CCU+gg879o43PN+GyJ77Me9b7BWoqX5r9nmQj7
         lmyaFJ/G5JfsNwT8cfIA/6BreGEbIlDeMBFX7Kz5i0MwGOgF+K9FIw/wcOUe/GBwoG
         lfnmUHm+PQD6k+J0vh6PHwaJ+haG8BOrwQmcGbpQLoByxpFJtLSQghedfXeKiVDCxK
         oVnCxUU5DEbKTA5eKFFY29+bUuwSWcSRT4GTaMGi05bXnMF/IUTh27b4tj6+yLFOBR
         iBCgfuIIselrA==
Date:   Thu, 24 Jun 2021 21:16:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Vincent Donnefort <vincent.donnefort@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20210624211659.3ab5b2bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z23IHINlmhn1M1S8YtNEM7v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/z23IHINlmhn1M1S8YtNEM7v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d7d607096ae6 ("sched/rt: Fix Deadline utilization tracking during policy =
change")

Fixes tag

  Fixes: 3727e0e ("sched/dl: Add dl_rq utilization tracking")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  fecfcbc288e9 ("sched/rt: Fix RT utilization tracking during policy change=
")

Fixes tag

  Fixes: 371bf427 ("sched/rt: Add rt_rq utilization tracking")

has these problem(s):

  - SHA1 should be at least 12 digits long

This can be fixed for the future by setting core.abbrev to 12 (or more)
or (for git v2.11 or later) just making sure it is not set (or set to
"auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/z23IHINlmhn1M1S8YtNEM7v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDUaasACgkQAVBC80lX
0GwIjwf8DJYfxwUpr83jsWb7Tc6z7b1qG2UQA5gjZVeTONvTOGoyWYYhfJnwTGq8
MuU13BVSk1BYtSe0yCW7XVzkd9CWdVB35nN9bTI9nzZ0/UD0h81n25gkPxqS5yuV
SilYzkP7NAMLUML2jfXvpAtcyyUebn0Ao9MIPy3PzQ/7UtCVJxSRpZNSltfT2kZM
9oo62KtCM+ze9+2QuawaKs5n4q2nBgNnli5/L1p5tHFZoVfusu3QEPXFY5lT4L7O
nJZlAuYtmps9BOtw9HNPCc+ZAvY75kOBbTR/r7fA00KT//DLPQWQd6akONtVqWhQ
Qhj7ItXXqIW/pznHI1u3yH+NEC5fnA==
=yRry
-----END PGP SIGNATURE-----

--Sig_/z23IHINlmhn1M1S8YtNEM7v--
