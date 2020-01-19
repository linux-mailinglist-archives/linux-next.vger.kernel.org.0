Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC4841420F3
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2020 00:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728851AbgASXkc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Jan 2020 18:40:32 -0500
Received: from ozlabs.org ([203.11.71.1]:56767 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728841AbgASXkb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Jan 2020 18:40:31 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 481BB34ywzz9sP3;
        Mon, 20 Jan 2020 10:40:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579477229;
        bh=FZC+RtbJVHLsTocEizkcrcvUHUxlK1trtKfogEUIXQA=;
        h=Date:From:To:Cc:Subject:From;
        b=FLBf9zgoNPEXEJlk7gYkDSOAx+b0B6Z+2fqoxFiSD64F5dHmhF6BuAEGz6hwtao3j
         t0Qx02LjIjbiva95XFLvBZd3OQQaQRdDvNajo62GjioLJpex2XIOdBH22tvn0oslK+
         wkr+zUyJ9V+QKeRD8l82UZ0FZXPLMC2X2tO9/Ln96LiaNaL8E0P4Xzb0XsHwvlnWa3
         dzpz22PM0Gh7p90ARCFLW0SbObNWUHme9N7shQb3jwIfFEe7j54q/J7UCmc3ewmzFg
         nSv3M3Y0ppbDuJ8+9joE3P8utpe790HqxqmTED+A4pNN+xNipS83GsU8hzDebY4Fm5
         N5E/FSEwir6+g==
Date:   Mon, 20 Jan 2020 10:40:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        yu kuai <yukuai3@huawei.com>
Subject: linux-next: build warning after merge of the pm tree
Message-ID: <20200120104020.385b2aa0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4EXXwej5D3lRE2Bv3uJ3yNw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4EXXwej5D3lRE2Bv3uJ3yNw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/pnp/isapnp/core.c:752:29: warning: 'isapnp_checksum' defined but no=
t used [-Wunused-function]
  752 | static unsigned char __init isapnp_checksum(unsigned char *data)
      |                             ^~~~~~~~~~~~~~~

Introduced by commit

  04c589f35bc5 ("PNP: isapnp: remove set but not used variable 'checksum'")

--=20
Cheers,
Stephen Rothwell

--Sig_/4EXXwej5D3lRE2Bv3uJ3yNw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4k6OQACgkQAVBC80lX
0GzTpAf/RClCPPEY3OUR/JNIiYppFz+Crgqz4NTHwR2rf2bIlM4XTuB9+sSESSPu
KJJpn7mlcA5bCmJ7BV3wUqzICceZYF54wweAS1MW8g7o0jAqn46zgMXYTUlkyiGv
ogUPiMZXIuQMm4wvRTGmh2x5zUkU8vpqQLGG+7VeKS1WKAdavtDIED7f0ojCuayd
QRFwKlENY2sPbHC8TXko0Hth62gaXyzhxC8IuoY805Z41Jad1HDDpChlrkJrnJb+
0ZdCDMijflHIXXgRpS7mpYZoTp6xucK1r7+wLY4/Gns1sBbSaFcuYtp8CUUgVbAk
TNyEe6Ipt24oaoNbt9PDokLthDuYWQ==
=leQL
-----END PGP SIGNATURE-----

--Sig_/4EXXwej5D3lRE2Bv3uJ3yNw--
