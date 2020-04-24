Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354271B6E26
	for <lists+linux-next@lfdr.de>; Fri, 24 Apr 2020 08:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgDXG0e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Apr 2020 02:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725889AbgDXG0e (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Apr 2020 02:26:34 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474EFC09B045;
        Thu, 23 Apr 2020 23:26:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 497khj3rpJz9sRf;
        Fri, 24 Apr 2020 16:26:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587709589;
        bh=3KATHD0A6kR9b3h5/QmirAJhCawfwk6TyrSacRyl2ac=;
        h=Date:From:To:Cc:Subject:From;
        b=VT1GlRxf87dIX+roC+4FCt/+gMvAitctsyNVa8ufP7SxxkrBoG3aWAXXQrmTiegOc
         7MqhnSIi8Igp+IjqyzuGHNVED2GacETenM3uLYh9EUZXTNTyVVSaQWLh3nr+E50faV
         M1aWYpFbrn6TDseIu/0e0GVrJQBStu15gVbrPKi2uHO1IYusFOsvZg8su4WLziJh1u
         rPvY8xhqgU11mt8W8QlooN3E6O3zYzJxWUdxYDT/IBr6cwSkRO97ZJUCHXSn0+nevR
         kIQ/euin0pMebxgvwFaILKTaHU8kRASxInPzEYDFxXQpb9U14ImPLribZjaHapXQsB
         Gd3RJmDilUa9w==
Date:   Fri, 24 Apr 2020 16:26:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20200424162618.0f66a100@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6C=uSGRtIkaPPJJah8HdM3l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6C=uSGRtIkaPPJJah8HdM3l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

WARNING: unmet direct dependencies detected for SND_SOC_SOF_IMX8M
  Depends on [n]: SOUND [=3Dy] && !UML && SND [=3Dy] && SND_SOC [=3Dy] && S=
ND_SOC_SOF_TOPLEVEL [=3Dy] && SND_SOC_SOF_IMX_TOPLEVEL [=3Dy] && IMX_DSP
  Selected by [y]:
  - SND_SOC_SOF_IMX_OF [=3Dy] && SOUND [=3Dy] && !UML && SND [=3Dy] && SND_=
SOC [=3Dy] && SND_SOC_SOF_TOPLEVEL [=3Dy] && SND_SOC_SOF_IMX_TOPLEVEL [=3Dy=
] && SND_SOC_SOF_IMX8M_SUPPORT [=3Dy]

--=20
Cheers,
Stephen Rothwell

--Sig_/6C=uSGRtIkaPPJJah8HdM3l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6ihooACgkQAVBC80lX
0GyCvQf+IJnOPNnbRbqf6vvbZY0jHiOfjaxH+/vVzE+DSdER0MQp4pcGAqbj6sr8
KiR/CvYBj0aIYIWXOMjdqn4PUf1Sx1kcqTZmeK81C3hWXyTR40jlF7IxCWVbNp76
ASHvK7OtksCDN6/AhXwYYV0r4AIsAbFSq0h8l/7QXxoHWgNUvl9jaHMWwSROs9NZ
0smnw7lqq//v/KglDuXVUl1+aiH86LMwudigd/eptMLIVOg+te4y7hwsao2RjZJz
Ihz5YnWcrD6S4Q2CORYs/qX40ez40c05DUUVXJL09XK/tFjGj1p5AwhFypAFuyuE
F3lka+VG/kfpl0LpqbODW6TXhLlacA==
=NONS
-----END PGP SIGNATURE-----

--Sig_/6C=uSGRtIkaPPJJah8HdM3l--
