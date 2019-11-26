Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1D710A4B3
	for <lists+linux-next@lfdr.de>; Tue, 26 Nov 2019 20:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbfKZTpA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Nov 2019 14:45:00 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43727 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbfKZTpA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Nov 2019 14:45:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47MvWF3XFWz9sPV;
        Wed, 27 Nov 2019 06:44:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574797498;
        bh=bKB2nIv6EI51TfPvE5J9CjUCTmuAd+A4EK8VMXJ64lE=;
        h=Date:From:To:Cc:Subject:From;
        b=Ur3wMnD8RkQAeI8kJlrvXnS/YgerJlkQICHlzFT2LQkMoNiipQ5ZMqMCaGmqen76w
         ftqmykjhhSA2D/Q2QgTqImEBvfJ5eKetq688LU6TasZ0pS4tGRV41VzcnRnVz4o8Ta
         yLZiMECQhbKhxP9qVwjQdWtfAApAcM924EBAtKerTh4M1pt762FxDQ/GNnfJq1JIae
         BZYLPyD++CgAoSakWrfXpBD+EtrkPw8soY/FzGyaHL6WtSX+kZqWQaQTjtN4CI2unH
         KMALt8nSFl6pp+HSVEFoLQmRArC9fM77e+JKiGfYW4dyZ8uri98bYEmwyiIn4eXQGe
         AuzZOK9MiVlqQ==
Date:   Wed, 27 Nov 2019 06:44:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20191127064456.285e233c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uvQgj.5xpwWxPH6+/.NfLE2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uvQgj.5xpwWxPH6+/.NfLE2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1b8b896f1ea5 ("drm/amd/display: Null check aconnector in event_property_v=
alidate")

Fixes tag

  Fixes: cc5dae9f6286 ("drm/amd/display: Refactor HDCP to handle multiple

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: b1abe5586ffc ("drm/amd/display: Refactor HDCP to handle multiple dis=
plays per link")

Also, please do not split Fixes tags over more than one line and keep
them with the rest of the tags at the end of the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/uvQgj.5xpwWxPH6+/.NfLE2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3dgLgACgkQAVBC80lX
0Gyjawf9F4TmFRTB10Ve67bvnv7BI9VOOiU3DcI6q4vksNELFIvY9/1W/Zh4ZNoY
76NsYHhBYgLAu05o+weAL5J5xEunYz+WHmQPNiIGWlkAi04RZlfRsd7usu4/8OIz
D9QvNQm8r6YAc1FRZFK5EjT0wRc3/A3jMHTTDnkAtfkpKYtBYvcxRxFAhdug8cIM
DjuCl/UOYWlmk8z75TZm7gTWkLknXV0vugibdC63xT4q2yOApI46HtATmUAPSYkG
o4rY5W0QlH42N8cFjdJc63Hl+uHRtr7i/PMdzZm6guxRrNRyPWIKztZI220XtXTn
JECleURYMdpSB2JrIsqp1K3huAcCrQ==
=5hT9
-----END PGP SIGNATURE-----

--Sig_/uvQgj.5xpwWxPH6+/.NfLE2--
