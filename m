Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 799D9130C7E
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 04:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbgAFDVU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jan 2020 22:21:20 -0500
Received: from ozlabs.org ([203.11.71.1]:50219 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727307AbgAFDVU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Jan 2020 22:21:20 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47rglJ4zJJz9s29;
        Mon,  6 Jan 2020 14:21:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578280877;
        bh=5uJ61loontj87nlYov++gfh70xE3MbLMJJtZ52aRmh8=;
        h=Date:From:To:Cc:Subject:From;
        b=rdBjeYrQGTlBUtS94fhi8tcsv67JzwI4LQfJaasMVb3bj0uxBhdqfmtcy+lDg1w/B
         KKYtZ0MetR/emf7XZ5FE+sQE93X2qmQpx+rg8J+XnEziuSs+8K0chw/xz5GO1V17xh
         lKxvYk+BsQ4c/Ae4dqLEl+dTV1UxAtyrFfkd6AK8EMuHpQTsesXivaUiGvh+sRNDm1
         5oDaRG5HR8lgcL+cWWH/vxcylGA81n1u4dHnzLQaqkpFYVxxmLgjyOuzfIeaSmuYgr
         HJ7uSO0IaZzojDMsnRZuXemSdGOH59fgDHL7WmTr+UWLb2fapBo0fWnRcBUewGNuYm
         WNpn3dPO+PKzA==
Date:   Mon, 6 Jan 2020 14:21:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guido =?UTF-8?B?R8O8bnRoZXI=?= <agx@sigxcpu.org>
Subject: linux-next: build failure after merge of the leds tree
Message-ID: <20200106142116.538320e1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uo7NhdgcZK8Ustri2ntHTvF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uo7NhdgcZK8Ustri2ntHTvF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the leds tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/leds/leds-lm3692x.c: In function 'lm3692x_max_brightness':
drivers/leds/leds-lm3692x.c:355:9: error: 'struct lm3692x_led' has no membe=
r named 'brightness_ctrl'
  355 |  if (led->brightness_ctrl & LM3692X_MAP_MODE_EXP) {
      |         ^~
drivers/leds/leds-lm3692x.c: In function 'lm3692x_probe_dt':
drivers/leds/leds-lm3692x.c:437:61: error: 'max_cur' undeclared (first use =
in this function)
  437 |  ret =3D fwnode_property_read_u32(child, "led-max-microamp", &max_c=
ur);
      |                                                             ^~~~~~~

Caused by commit

  ef791c4d0ce8 ("leds: lm3692x: Make sure we don't exceed the maximum LED c=
urrent")

I have used the leds tree from next-20191220 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/uo7NhdgcZK8Ustri2ntHTvF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4Sp6wACgkQAVBC80lX
0GzxSQgAlCoWLNb6PbG3JjVeE4R4GZfZ+Jld829AHvQDYGf0qFCuhi+x/M+CLvav
CTbw9xxlWwqD4M8uPRg4N7tMDyiiJXXCEydNt3C3wGrIAWszSOVtZEplthRG3epJ
Rg5RULpCO2U5R2MSTQgmUTr9xSUrZXkisXSfyfww8E72921CnEgVOinX3zg+xpK1
xpYfDh0H8gKY/IJewrskcC4jGY/vcRvieuht/YLbf5NoBa4GM6IE5uvLD6neWEqL
G4dsxqjy8wpUAGkUvdh1ypDODxFTFm1KkLVMfi9FCvVKKL1FDAnGy/fd86etLCur
xD1yBDi+VCvbr5n8hqbZsgeOl29cYg==
=IPcC
-----END PGP SIGNATURE-----

--Sig_/uo7NhdgcZK8Ustri2ntHTvF--
