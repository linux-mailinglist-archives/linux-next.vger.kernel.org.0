Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30077268271
	for <lists+linux-next@lfdr.de>; Mon, 14 Sep 2020 04:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgINCK0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Sep 2020 22:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgINCKZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 13 Sep 2020 22:10:25 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06503C06174A;
        Sun, 13 Sep 2020 19:10:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BqVFB71Dnz9sTR;
        Mon, 14 Sep 2020 12:10:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600049423;
        bh=czzVw1X9umrKlqXKzA6kNpSv3y0geLZMHepujkNHsls=;
        h=Date:From:To:Cc:Subject:From;
        b=feeTzdN++0/grAHhmuNK6MMODXgfLyP7FP8Zbl/OjKfTsFJSa1sYqLrjeiqBaTgLu
         TMi1VExhWSjlhoIXnwYRvkkXdPHhx+VRr1FadcqmeaeIIEPkc5gnzfYF9aw/42ZdXB
         I0eS+OqgbCoyFd2fs4aXn265N6y16dY6pejUE/yL9KCYD3AVLOCFzEw+/VDD1Ul12C
         REZeePRcIA95ABRkMIzW8sUJ8Pa21h+2+bBWs5V9FRYVIKwiiNAq2biK9/SuXl8faK
         Ri4g2gsMTgDRs3YtqRygwOv5cIQ1rM+gY7rJV5Y1piC0D+xYshi/N9UT58dZ9oX9vY
         72ThWCVYlQ69g==
Date:   Mon, 14 Sep 2020 12:10:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-msm tree
Message-ID: <20200914121022.2c5c494a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9IVE0RfM5BBrakyo_BPayQZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9IVE0RfM5BBrakyo_BPayQZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-msm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c: In function 'msm_dsi_pll_7nm_ini=
t':
drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c:882:19: warning: conversion from =
'long long unsigned int' to 'long unsigned int' changes value from '5000000=
000' to '705032704' [-Woverflow]
  882 |   pll->max_rate =3D 5000000000UL;
      |                   ^~~~~~~~~~~~

Introduced by commit

  1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")

--=20
Cheers,
Stephen Rothwell

--Sig_/9IVE0RfM5BBrakyo_BPayQZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9e0Q4ACgkQAVBC80lX
0GxEPgf/TMDfbnrfkqc9iJBa138krCqyN1HIsRvTqGuhLfzum5SCMxBIF+0U+8Gr
DWbAbmeiARV207duUIJZfz+qzvxYum8tSMd+9vB9eW42iVZKT4kTqHNA6UtU6Amw
WlnXaJJ56TTN+FP5w2KWNKt/PCWHuyw565t6SB0l39XKVN5DSYaqx93Kkr9ue2IS
ts6eWlNpvDN7wY3oKdPzeQCsIsCmlTSACcpwKlgk0BCOkICFHGfVAEWGMZJztnEl
ZZMlUoyoSWaRhG+4+X6VrT11013np44cNeko0UuRnFSP6mNuJVKDN2+fLy8/Wuo4
h2zrUw7znsr/LjiG2mt+8UB0oF4B6w==
=V6Cz
-----END PGP SIGNATURE-----

--Sig_/9IVE0RfM5BBrakyo_BPayQZ--
