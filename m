Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38FC4214891
	for <lists+linux-next@lfdr.de>; Sat,  4 Jul 2020 22:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgGDUNY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 4 Jul 2020 16:13:24 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33667 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726909AbgGDUNX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 4 Jul 2020 16:13:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49zjh039Hzz9sDX;
        Sun,  5 Jul 2020 06:13:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593893601;
        bh=3o+AYAld1Uz6K2VKHMEd2orW6cryHaz5XCb8LLg7sbU=;
        h=Date:From:To:Cc:Subject:From;
        b=jNffwTmSMPJjO8SJZbcoapTH0bhy7nXAP97esHjqo37fWXTVm3Fdm6V/ciBxG+1yT
         p/FqJbuO2t8ssfYtZuAER+KNIS1BgqBEPVvA0hqNc90ofhRpF8ZKhoaB4ekoxoYvlV
         aHj5NMdWBLE74oTCIlcTFXeM3Ddb0Kh7As2hoWmDI+J/C/3J93Yb/4RQUCvoQnd6OV
         6HQhx2BcQhjIbn2BmzQ/FhGxl6vcCyuVDuv2pRYhnpkKDIluYMNn0JNeJs59kjIpF3
         Qw3kknEEbwFFjlD789q4dN56kyRFBT2Dz1A9zqVt9ee2nJf69C1DgSIIURuauzf670
         gESdyNsOx8hdw==
Date:   Sun, 5 Jul 2020 06:13:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chuhong Yuan <hslester96@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb tree
Message-ID: <20200705061319.4a2ae191@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TzNLVsalb_8A9Dw9Lr99uZS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TzNLVsalb_8A9Dw9Lr99uZS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  18ffec750578 ("media: exynos4-is: Add missed check for pinctrl_lookup_sta=
te()")

Fixes tag

  Fixes: 4163851f7b99 ("[media] s5p-fimc: Use pinctrl API for camera ports =
configuration]")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/TzNLVsalb_8A9Dw9Lr99uZS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8A4t8ACgkQAVBC80lX
0GwBXgf/VGsJZZq57EIN1xTkyQKLFO0rP107Fl5StwOR6v4pz1oVqrlWNN/YWTtt
cYAitwQzSzE8FIjfQg7Gaglz1XyRohJMdJ6/N5j8L+KzVd5OrRIOzqEWWKw/SHCj
axr1Y0RaYyvI/t8tCdiTzDi756lKWldJvacbTzzi9jjdQgwAXkjGETauT65j3OSU
PxVYGMfvYoHf/wnV6BPBArpI6z4RLWAVL4HijfyEqpM3h/lv+U47LoCzHCwWQtMk
gCav4TnyeVAhFjmZW5vEuFYaxYtaLCXcI60pKgFarp5gRRHxJWCjq4ytOKxOZC5b
o9sUf/86FO56tbQHd0O0qMnc/gIlqg==
=vgtP
-----END PGP SIGNATURE-----

--Sig_/TzNLVsalb_8A9Dw9Lr99uZS--
