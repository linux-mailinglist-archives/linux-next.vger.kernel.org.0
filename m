Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8568032CA30
	for <lists+linux-next@lfdr.de>; Thu,  4 Mar 2021 02:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbhCDBvd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 20:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232032AbhCDBv0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Mar 2021 20:51:26 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528C9C061756;
        Wed,  3 Mar 2021 17:50:45 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DrYjb2xVfz9s1l;
        Thu,  4 Mar 2021 12:50:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614822643;
        bh=Qe1m6LyRO0eXSmUZfbrC7b+yJchdnpe8rA3g9XmrT6U=;
        h=Date:From:To:Cc:Subject:From;
        b=qadgF2ccyXwETzB3+iHz3IgbeCjeKiUGbWM2bGMlOdW6j2/CIfXNOiE6K5YcxZ68B
         H1ffAAGOVCvDpaVs2sDc1oF4m/Hv816EaUvuLPSjXZyZvlYPOrllcDXogdBmxdRACk
         TiDgZEaaizylE4OqVmkJBAMuMbzXDymQF08sFrHAvTpUej89vIvsF7oJCsiglC5rtL
         B9DNvvAU04V5yjlJzxrjAxuXPquhnsMfvUxQy0BXlNU9WB6qhLsjl3Nsfis9fHpkFz
         /4nLcX/Yc2ncUq9JGcE8L7rXLcXneYMLRWGrrd2sDXhlvEWttKyyiCpf6S0ExJ24+N
         3xUe7D9GgVofQ==
Date:   Thu, 4 Mar 2021 12:50:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the v4l-dvb tree
Message-ID: <20210304125042.68cc1041@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OcHhWuW_duuyI40MH2WuJX.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OcHhWuW_duuyI40MH2WuJX.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/userspace-api/media/v4l/hist-v4l2.rst:818: WARNING: undefined=
 label: control-flags (if the link has no caption the label must precede a =
section header)
Documentation/userspace-api/media/v4l/hist-v4l2.rst:853: WARNING: undefined=
 label: reserved-formats (if the link has no caption the label must precede=
 a section header)
Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst:47: WARNING: undefine=
d label: reserved-formats (if the link has no caption the label must preced=
e a section header)
Documentation/userspace-api/media/v4l/subdev-formats.rst:39: WARNING: undef=
ined label: v4l2-subdev-mbus-code-flags (if the link has no caption the lab=
el must precede a section header)
Documentation/userspace-api/media/v4l/subdev-formats.rst:53: WARNING: undef=
ined label: v4l2-subdev-mbus-code-flags (if the link has no caption the lab=
el must precede a section header)
Documentation/userspace-api/media/v4l/subdev-formats.rst:67: WARNING: undef=
ined label: v4l2-subdev-mbus-code-flags (if the link has no caption the lab=
el must precede a section header)
Documentation/userspace-api/media/v4l/subdev-formats.rst:83: WARNING: undef=
ined label: v4l2-subdev-mbus-code-flags (if the link has no caption the lab=
el must precede a section header)
Documentation/userspace-api/media/v4l/subdev-formats.rst:97: WARNING: undef=
ined label: v4l2-subdev-mbus-code-flags (if the link has no caption the lab=
el must precede a section header)
Documentation/userspace-api/media/v4l/subdev-formats.rst:140: WARNING: unde=
fined label: v4l2-subdev-mbus-code-flags (if the link has no caption the la=
bel must precede a section header)
Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst:75: WARNING: u=
ndefined label: decoder-cmds (if the link has no caption the label must pre=
cede a section header)
Documentation/userspace-api/media/v4l/vidioc-dqevent.rst:234: WARNING: unde=
fined label: control-flags (if the link has no caption the label must prece=
de a section header)
Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst:156: WARNING:=
 undefined label: dv-bt-flags (if the link has no caption the label must pr=
ecede a section header)
Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst:41: WARNING: u=
ndefined label: ctrl-class (if the link has no caption the label must prece=
de a section header)
Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst:246: WARNING: =
undefined label: ctrl-class (if the link has no caption the label must prec=
ede a section header)
Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst:269: WARNING: =
undefined label: ctrl-class (if the link has no caption the label must prec=
ede a section header)
Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst:100: WARNING: =
undefined label: modulator-txsubchans (if the link has no caption the label=
 must precede a section header)
Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst:119: WARNING: unde=
fined label: tuner-rxsubchans (if the link has no caption the label must pr=
ecede a section header)
Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst:167: WARNING: un=
defined label: control-flags (if the link has no caption the label must pre=
cede a section header)
Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst:245: WARNING: un=
defined label: control-flags (if the link has no caption the label must pre=
cede a section header)
Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst:396: WARNING: un=
defined label: ctrl-class (if the link has no caption the label must preced=
e a section header)
Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst:73: =
WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no c=
aption the label must precede a section header)

I don't know what caused this, sorry.

--=20
Cheers,
Stephen Rothwell

--Sig_/OcHhWuW_duuyI40MH2WuJX.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBAPPIACgkQAVBC80lX
0GzM/gf9HUEDBRvAvCBx/fPDu6SfnPW3ROtokbsWR0gmPrqeJxdakohP5XW7Sk0h
dUWZ8EWn6ut5gehDGgwFkcuBmaBnQplaegGGetzCeFlHPJl9EYtHDS6JUckAg7Fj
hR2RlR3eRgUBagyoOD5wy1McG/2zAVmLHcCuW5GTT2RZJM053ITOi7Q0aFSm8GI+
P2llpdxeW05KQzjXlJN7urXkPBfpZ8eXUf58iQ1SxvMzLTuQed5V9qs4CXrVX4qf
0rNY0viC/dLh7oCgGoieY6SN96gENyPZ0etkaAljA9dSb7syLM6aDk2MZ3UBmztk
KivIIbHbCIoPhWnKyHS+o9VpBMSWnA==
=EDNi
-----END PGP SIGNATURE-----

--Sig_/OcHhWuW_duuyI40MH2WuJX.--
