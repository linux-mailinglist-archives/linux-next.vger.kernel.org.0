Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C1538D85C
	for <lists+linux-next@lfdr.de>; Sun, 23 May 2021 04:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhEWCvZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 22 May 2021 22:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbhEWCvZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 22 May 2021 22:51:25 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEEE9C061574;
        Sat, 22 May 2021 19:49:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FnlDy3J0tz9sSn;
        Sun, 23 May 2021 12:49:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621738196;
        bh=VJHU8czcH4/8+jhkb3TP1Kqu6v8pvk4s6xXcHof8N38=;
        h=Date:From:To:Cc:Subject:From;
        b=W/9ZacOZqUboD8SsVa4N7870lqdkQNLXp/dXJdVM2rIy6+ihDcZMkisnRZgBvIM+c
         b9wpVvwrt81Un2270yTab+hmwtRqmP91wRGAUnpSBlc6G5I9riKQHPijvsdwQWBAom
         c04bXVwjMYTfD9jPMcCgETJkgVLQTl28pfoxlQK8/39u+jL9WqLObaMGD8ap25Ow45
         94wYKXNgxEHcHd9nYx8iX/Rm7krcwpD8o/LFoLa7p8pSbuUBHKpv+vgPxeqWdxT8E4
         ebLIRmjtdfPLjZynlRWs1SIhumjobPv8FAbP5xbuFeUhkIw5EacP+g0qaHdj1VsSy6
         DQdsekUbl6mwQ==
Date:   Sun, 23 May 2021 12:49:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Sean Young <sean@mess.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb-next tree
Message-ID: <20210523124953.7a5108b4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5.ATFdsf3X69/qLqfLjRzjI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5.ATFdsf3X69/qLqfLjRzjI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7c8a36e1fb30 ("media: rc: i2c: Fix an error message")

Fixes tag

  Fixes: acaa34bf06e9 ('media: rc: implement zilog transmitter")

has these problem(s):

  - Subject has leading but no trailing quotes
  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/5.ATFdsf3X69/qLqfLjRzjI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCpwtEACgkQAVBC80lX
0GxbuAf+PHzWHqT11OcwjUqpw0/Zn4RB7NozJvKzTpxEQL8/8nHB0e2cK8/9kVhD
o1Geeojtjhz8GcjtyyQAcsMr11p3TtmWQSKk0vPu9ugyhzybTDJvUx4hbz42RGnb
JnwG1GGP6pke3ZA2d8WLw6ssnX3EynUS22jOQCgRIkfv9pu2cM0ncc0a6+RgVgVM
q9VXGVFQtyDrLhMw57I/Dck8iqiTTJGZ/UgBAnYq21Mbk+ymDNfgnxE4POoHfdBO
K4bhf9UlGhU7Jx60QU+DLDPyihlIGvlZ0i6yK/tG4eC8UFCGgteLe9ym67Yxy+Vq
I0nauTUITn12RHSvU4TpBn8zUrveig==
=OvyO
-----END PGP SIGNATURE-----

--Sig_/5.ATFdsf3X69/qLqfLjRzjI--
