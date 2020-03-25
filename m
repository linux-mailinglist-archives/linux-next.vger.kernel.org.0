Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 541581934AA
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 00:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbgCYXet (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Mar 2020 19:34:49 -0400
Received: from ozlabs.org ([203.11.71.1]:52653 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727395AbgCYXet (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Mar 2020 19:34:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48nkx264C1z9sPk;
        Thu, 26 Mar 2020 10:34:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585179287;
        bh=2qT6Jbv2ojF384qMcI/I7l2UauIgXvUDKtuCjeKVD10=;
        h=Date:From:To:Cc:Subject:From;
        b=oaUcwdnpxrD71muXG8iojgn9T/KL59Y8KLilYvPr2Ds0r3u/VtwIWRd5ybnC16QRq
         KZFsC+LoSQq9jOGLbjnsfX3Q3uqreGciRWL3hmk9sBiNxRrm/mzp89XxGk1xvaDGoX
         nvnih65Z+x5vXd3rFLdNKQVwtgHQGySmVuQMjiQqIlh/AjU0/TCydztiYl9tdNJt+c
         8zZtJczqsJaAoZv9Gc8rdCOAIShy5Zn4awxkryJ6gxqJCw0hetPpyzIno9TUH02KWU
         oFCla6Z4MhO1tHKyOzmCobvNHOUPCazOyV3Pzr6Kx3vOxqf9r7tQ66/9MKszQpGQsN
         HE7R3jtbRIvmA==
Date:   Thu, 26 Mar 2020 10:34:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Keith Busch <kbusch@kernel.org>,
        Max Gurtovoy <maxg@mellanox.com>,
        Israel Rukshin <israelr@mellanox.com>,
        Alexey Dobriyan <adobriyan@gmail.com>
Subject: linux-next: Signed-off-by missing for commits in the block tree
Message-ID: <20200326103436.0fd71727@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kRpAp63FXvKcTDgJpYjl8n1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kRpAp63FXvKcTDgJpYjl8n1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  c363f249e7e6 ("nvmet-rdma: allocate RW ctxs according to mdts")
  ec6d20e16c2d ("nvmet-rdma: Implement get_mdts controller op")
  02cb00e233ad ("nvmet: Add get_mdts op for controllers")
  2db24e4a22bc ("nvme-pci: properly print controller address")
  e2a366a4b0fe ("nvme-pci: slimmer CQ head update")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/kRpAp63FXvKcTDgJpYjl8n1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl576owACgkQAVBC80lX
0Gzu5gf/cSocBVOgOLbeGy5pP4hnBAhIJZI2U0/kKZiPthXod2eyYPij2UmwHowe
AK6iqm/xLhz+dcy9WgPXJDRPNEE/i+7x0YndOiRpbkJMfByuy+yBN2i+Qb7tM5jM
oDjnFX/7JR50ty2rUjJyKTBmqQZGuYYm/KwOOYiCXraoYU6+VEBaM9yeGf+GVJY3
+SBy7vASK51QJcHlbSUxKcn85IG8U5njgLHxFLM1WlDNuEoY7wqHXZHIacEjP6Bo
CY3Ef4fEX7KZpO2LPcqmQdczZpVjDyMiMmRN5gFfN13tRmab2xS/0DmiwA53qubP
gio96wMgVwt1jXMhFrf8B2jyL35hYw==
=kX13
-----END PGP SIGNATURE-----

--Sig_/kRpAp63FXvKcTDgJpYjl8n1--
