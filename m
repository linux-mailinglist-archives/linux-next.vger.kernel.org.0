Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49E941D83E
	for <lists+linux-next@lfdr.de>; Thu, 30 Sep 2021 13:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350192AbhI3LAz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Sep 2021 07:00:55 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:35805 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350148AbhI3LAy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2021 07:00:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HKqxT3pQGz4xbL;
        Thu, 30 Sep 2021 20:59:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632999549;
        bh=vKklB6o09Y1yL5cOSbFAteng8qd4SOl4++Vtzd9VLuI=;
        h=Date:From:To:Cc:Subject:From;
        b=OvOKrNQuWclkABtNb/XIMVZ6ZY1anXLJVSdGc4rW+x0Oj96h+nUQaCSlOUK1MOZTv
         0CBXAGsVMhH9IrvBKBjYQkUbgg6ooyoiw2JJmg9OeeXNWvQTqovmtWs4Zj4UzOcUrY
         TBIyvKx6bzzcWicaPUFUxKF2A3gnlt7vs4KziOjM83Un4tWPOg9vDtTrHqVENgjY5g
         AIh3SYMwVbAa0mv0kSakrUSn5YD8HvfgcEUgx3/c3yWpduZc5lIyLe53qZjYEFpOJP
         rQ4+DHkRMZPM2MTkCODnwxXg7aQMQgubAEuY59Rtrz4tSfymCm7jQu9quVkVytHS+K
         F2Rt1KWFFYwug==
Date:   Thu, 30 Sep 2021 20:59:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the v4l-dvb tree
Message-ID: <20210930205907.6ddffc2d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_HWem8ieZocih/SKWy=_mpq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_HWem8ieZocih/SKWy=_mpq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  a466530b3a1e ("watchdog/sb_watchdog: fix compilation problem due to COMPI=
LE_TEST")
  135291f36d22 ("vboxfs: fix broken legacy mount signature checking")
  601e6baaa21c ("HID: amd_sfh: Fix potential NULL pointer dereference")
  38245d0340ea ("HID: u2fzero: ignore incomplete packets without data")
  ef1135704651 ("HID: amd_sfh: Fix potential NULL pointer dereference")
  94f9c3567eba ("HID: wacom: Add new Intuos BT (CTL-4100WL/CTL-6100WL) devi=
ce IDs")
  125aaf6ec2fa ("HID: apple: Fix logical maximum and usage maximum of Magic=
 Keyboard JIS")
  689e453a9b9c ("HID: betop: fix slab-out-of-bounds Write in betop_probe")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/_HWem8ieZocih/SKWy=_mpq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFVmHsACgkQAVBC80lX
0GyMuggAi5CCwKu9C0qa/CVBr4k+VwyEiTNaLLCtrsyeK1vIbOCoxRJal1F/neEH
fbaf4gQVN8VaqG7NjIAqaiFqWijNz1lIKDrZfyImSuRp/TSdJhq6VD+Qfj7zv7yo
AN+lnIyLaBNA5nfydSwQCaolKMU1fUUppWCtNF4DA9xLdsRegnpn+g1VO/DVX6hW
9r6JNXGJemuxKCjxJBlBdDIJolKdaChePCNSqN/S3XW2jex5VMR1d65rVgE1zYm5
/b3JvcR/o9TE65kqKHwudOPv1l7Oo9VFCrhov4BRUpgOHzWfS6LKf6PuUSqHjvWY
AlEfbqjz4iAtZBTd6d3tSe8uyDA1FQ==
=a5uM
-----END PGP SIGNATURE-----

--Sig_/_HWem8ieZocih/SKWy=_mpq--
