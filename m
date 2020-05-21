Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF0951DC50A
	for <lists+linux-next@lfdr.de>; Thu, 21 May 2020 04:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgEUCID (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 22:08:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41919 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbgEUCIC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 May 2020 22:08:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49SCh04xbDz9sTK;
        Thu, 21 May 2020 12:08:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590026880;
        bh=/ZCIw5niHHXy/up5L6Xql/N7Ub50XCcuiBb0xDDGQV8=;
        h=Date:From:To:Cc:Subject:From;
        b=F2UTqwNXEsIZgvC2Q+B8l6bmgegxqxfGU76s2WDCV2zyZfskvwSOpJsroZadS+WSl
         HU9BggKw+zdoOani1YYCrL7bGtP5JP5irH0ItiQ8Me5i+4RPFKzzPraWLztmO+IHJi
         S8+sKrYckC0doqUBdYA4fQ1AVsLy78PX7IW4XFQW/edDGzY0Jy060OhnSYaYgKcRJi
         z8TpFxsMvvaDzVUAI7t+0hYd+pKyPfyijqX8hwjaa6384x0L2z0KZtFrMEMlDMqXPQ
         ovU5rmXE65B60tPYSnAS0f9ADKCZkVTel/GVfY6N04B0KcXjzLtJX/XXKUdi9Xg8mP
         RAd/hQD3GxE+g==
Date:   Thu, 21 May 2020 12:07:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20200521120759.0068beaf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.WsD=uB.gKW3sRbkOS5cTN3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.WsD=uB.gKW3sRbkOS5cTN3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (x86_84
allmodconfig) produced this warning:

drivers/staging/media/atomisp/pci/atomisp_v4l2.c:764:12: warning: 'atomisp_=
mrfld_power' defined but not used [-Wunused-function]
  764 | static int atomisp_mrfld_power(struct atomisp_device *isp, bool ena=
ble)
      |            ^~~~~~~~~~~~~~~~~~~

Introduced by commit

  95d1f398c4dc ("media: atomisp: keep the ISP powered on when setting it")

--=20
Cheers,
Stephen Rothwell

--Sig_/.WsD=uB.gKW3sRbkOS5cTN3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7F4n8ACgkQAVBC80lX
0GzAbAf/XuaR5ngmAzIXsjKGqaosCCa/Z+eQVYJ1nJIS+OWnzM036yaSpk06iIH/
x8e3EGhIyEICzAeBK1026D9LcHMJdS3XA0GLhdM3PaeK2ZXzXtkLYjNMixtNiUlk
/8yUojhmOVFfG7ppzkEdOrHzfq2GqG0ua8bg9hO4EdKnyPaW3k7sJ3K8Ny5zeSlX
h7xQpoXKseQ3cEXXT1cqCq0UfH6pULCD9tuD2kDVZJ5MEpEvS9z6dAKW3dNavdem
fqGLxHIVGZQZw5dWqOpvhyLQ90BThBWzxHaxwwkXfTXk2OrrtYWB59jYMFzLi606
Vo2jicn7ThkQFidkFRyruz+IjQgNyQ==
=P/jg
-----END PGP SIGNATURE-----

--Sig_/.WsD=uB.gKW3sRbkOS5cTN3--
