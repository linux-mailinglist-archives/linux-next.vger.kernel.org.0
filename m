Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 031EE9C63B
	for <lists+linux-next@lfdr.de>; Sun, 25 Aug 2019 23:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbfHYVT2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Aug 2019 17:19:28 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43903 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728944AbfHYVT2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 25 Aug 2019 17:19:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Gp181YlRz9sDB;
        Mon, 26 Aug 2019 07:19:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566767964;
        bh=qt4Itlsc6WLieV0IdMhZdJ3KT4pry9RhsobHoCuAOn8=;
        h=Date:From:To:Cc:Subject:From;
        b=jBo1RDXcsKidmj48UPKdGQB3qFkP8+uygBNZS/LdQsv0gxVlOG9mNucCXghw1m1aS
         tFrWpMT5l9WSJurAhjr9eu9pdQKN6m4xOh61R0eyMWLbtEISkqhMuvLgnS9Quh96B9
         ZoYHZiqxG4Byggs9slL0GjCJmX6SVeSos/F6aFMufRDPPMHOWrnz/+EicTJZYiZiMs
         a0mikOyjYAOuDrU7ivRgvzOkSZVFrt1o/lcRPlqgHfd19Z8qj+H2/QwcG8E16bLe++
         GlUuVT1o4HAC+GSNu3uhHGw7s+yqbFfpH3vpLLO8vdGqvt0C8q+IwpK67hYnkq0Wb0
         5oj+XAg0EAEKA==
Date:   Mon, 26 Aug 2019 07:19:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: linux-next: Fixes tag needs some work in the leds tree
Message-ID: <20190826071917.44d44598@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hf9sltObuOb.i43PMh5881o";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Hf9sltObuOb.i43PMh5881o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3f5381c2ba60 ("leds: lm3532: Fixes for the driver for stability")

Fixes tag

  Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the lm3532 LED driver")

has these problem(s):

  - Target SHA1 does not exist

In commit

  c4b8354e5341 ("leds: lm3532: Fix brightness control for i2c mode")

Fixes tag

  Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the lm3532 LED driver")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: bc1b8492c764 ("leds: lm3532: Introduce the lm3532 LED driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/Hf9sltObuOb.i43PMh5881o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1i+1UACgkQAVBC80lX
0GzmWgf/TIBObmQGE2Sm5ObgGBUoWqyIojFgGS39XCPtc7aEks9Rhhm1CKjmdbqT
KWn3XJQgEqDQ3b1FbUYHcUUWKRbuey/z8tMxOKKItHjkNh9AjcFtz7zJv5XoiDmc
24u9V96R++aAAiLpxSKSRFjGFOMcy+z0w6GOTuog83qWhyK/ka8q0WV+DJiUnZpn
0Elhd8Miqypy/MV/2W6H9fudz+dUBdiEgYECVEwm24cP9DFBqQteOQ9VUDLgJsQm
y3aDP+BxlpEj95XDgIZJ8nVih0zPWYpub/shvUOjaXV/reG/fbaBa3XYQRXmkcgi
BhNzOCxdn0SW4fH0Zy+qbBOUmhSk5g==
=Infu
-----END PGP SIGNATURE-----

--Sig_/Hf9sltObuOb.i43PMh5881o--
