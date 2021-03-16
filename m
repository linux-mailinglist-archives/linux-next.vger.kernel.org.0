Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B97C33E10D
	for <lists+linux-next@lfdr.de>; Tue, 16 Mar 2021 23:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhCPWCd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 18:02:33 -0400
Received: from ozlabs.org ([203.11.71.1]:46951 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230193AbhCPWCE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Mar 2021 18:02:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0S1k3gCDz9sW1;
        Wed, 17 Mar 2021 09:02:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615932123;
        bh=zNKsKrl3GS0O1oNwgAREAIn0rLakA+RJqS3VM2Bw1b0=;
        h=Date:From:To:Cc:Subject:From;
        b=AmvdTAxHVrdXPV9XkG4EoTtRgWMyl/ykeVm5bixCzusg2i8gSzc1wyQy/HhMyxCJ/
         9mbeyxEVNQZbDdXOjZ3lyUrxOA4EVpzNOCsM8QIVN4nz7CRkkJAJfjpCrOOyLZcPIv
         z02shy7DnpW9m+Zi2uimWc1fCzLBKFd0tR9GJHqPUOtTIbqEXUHqNpTf+BadfIJXFt
         qpZ15e6E71OmMIdlUwajrLFpGwR7hTKvOISayeyEsl+0aGd91PNtNpu3/paxpzF6Q6
         RbPTceiYzEjpP1u7LldrEeKgZb5N6d8QYwQCLb3aR031Fl7EB11p8oc3GxZQZVieNL
         dhrft9kou6BAQ==
Date:   Wed, 17 Mar 2021 09:02:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the gpio-brgl-fixes tree
Message-ID: <20210317090200.2fe81618@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jupunq=f3HWf3nAK_rgOyj7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jupunq=f3HWf3nAK_rgOyj7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  6cb59afe9e5b ("gpiolib: Assign fwnode to parent's if no primary one provi=
ded")

Fixes tag

  Fixes: 2afa97e9868f ("gpiolib: Read "gpio-line-names" from a firmware nod=
e")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: b41ba2ec54a7 ("gpiolib: Read "gpio-line-names" from a firmware node")

--=20
Cheers,
Stephen Rothwell

--Sig_/jupunq=f3HWf3nAK_rgOyj7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBRKtgACgkQAVBC80lX
0GyLdQf/Z3E9uydKYAs32kEB9AJDSgaWXdEuR/0XN4wzSltGPVdX6M57aQz3v36k
R5kP5enX4dyIdBQSJoVQGkmTeCafPAFw3nIsAR7kvLnE9iZWW4YIiBxIoRbZEu6h
gVfwEgO543pg0L6NotQmzvCasPeaIMf6RiAVWLbxBWOafFLMNCst2iOh2q9rmu0T
AnTw8UC/1vCa5BHlxJGOcsanMeOpOgyi0JxGgyHsKJ/27XZKbOQk6U2Lq73RFblE
RABcaJ7Bjk33d1MtSHZbCR3a24bOj23qH0M10Qu9LCH0Z93hgPyVJ8lc0bV3cI4v
TW4kIi9MeZn9Cpe/daVf7a6LziFwug==
=slYc
-----END PGP SIGNATURE-----

--Sig_/jupunq=f3HWf3nAK_rgOyj7--
