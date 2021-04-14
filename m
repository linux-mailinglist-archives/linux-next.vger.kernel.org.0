Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B75E35FD85
	for <lists+linux-next@lfdr.de>; Thu, 15 Apr 2021 00:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbhDNWBq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Apr 2021 18:01:46 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47037 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229449AbhDNWBq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Apr 2021 18:01:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FLGdZ2Xbbz9sTD;
        Thu, 15 Apr 2021 08:01:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618437682;
        bh=+tsBx46Pbf8Kk965zfTWB8zwuyyZbWU65Zj3NakYzdw=;
        h=Date:From:To:Cc:Subject:From;
        b=pYjxEb3CgBKpRBoj+g2+xVAnWBbhwoDB5dIqp3io2W3V7BDyf+jGZOfklSWXv3nyW
         JrfNXgSAyJSKVtGNO6w+GnnMBOFSQUdgEHdZmC6cMHME2tzrdKGRZ8zFClAjq1ptve
         MK1Tri2PMJGAYRNhYnYnOR6Ll4+4n48N9aIdQkcRAo5NyZXelcBYc0GCWqxRHdotXp
         H7CpxWOqebCIVfEsAI+OhaWNIWhTpUK21XqoDELfEeRHm/ADIrnnb19+Fo2ZkB3pZW
         wtkQkdqLVhxQSwGJ16waCPETUAmgCwiVbs5wITIlVvfKaoKCuDlo/n1ig06mk8ivkJ
         ZwFb4S8ndGTug==
Date:   Thu, 15 Apr 2021 08:01:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20210415080121.0861facb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HjM6JFmZCqe9Sc9A1Tpo9u/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HjM6JFmZCqe9Sc9A1Tpo9u/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a4856e15e58b ("ASoC: rsnd: check all BUSIF status when error")

Fixes tag

  Fixes: commit 66c705d07d784 ("SoC: rsnd: add interrupt support for SSI BU=
SIF buffer")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/HjM6JFmZCqe9Sc9A1Tpo9u/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB3ZjEACgkQAVBC80lX
0GzMaAf8DDVTj330IVlIaIk35o4DHbeOFDNlwX1JuBZHsAHUnU7cXVTzVX2bQr9S
6Q6I8C5nBQ6/cMZ3CKdM6/XtcKQaXrv7UvBF7GRGIgJi2YeYQSBvF3S+40CM2NSk
bnNEwpsCqdgpXemGAQihrnc1HRl0rhfwnQejPLm/Fjwy15z0Yv7pl+nJ6V7ynZpD
bQ5BBRuITF7kriqLrOAgvK/XQSNDGGectGek2OtqEsnQ/G2gHKKgGNf106LWG/d6
rZJLup9n4Zmy4YwT3Rz29K4/DsBchjVwrsZ9VkjLzNG90F51KCu9wzGyTPVd/BMf
1dVlO7mqd3ksN5UkXXN5NfKPHoECyg==
=xBoY
-----END PGP SIGNATURE-----

--Sig_/HjM6JFmZCqe9Sc9A1Tpo9u/--
