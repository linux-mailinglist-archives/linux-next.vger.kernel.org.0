Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D179230505
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 10:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbgG1ILg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 04:11:36 -0400
Received: from ozlabs.org ([203.11.71.1]:58159 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727856AbgG1ILg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Jul 2020 04:11:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BG8X56MfSz9sTk;
        Tue, 28 Jul 2020 18:11:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595923894;
        bh=CYCfm5gFxK22/x7tm4WBdBFVH65a/pCXuJr2gHqUwbs=;
        h=Date:From:To:Cc:Subject:From;
        b=Xlnurer9U9fujj+HjGss8jcy/UkcX6VNWdeWJ7sxoR2a1Ouu5BuRqb5VuwaAMYy07
         x7hmabiPNTdkNqXlIGtFZ12DW8vidBARP/XhjWxsUTHGcOXd8vsIBAalD3ekRrGTeu
         /sjF70/oHqlS9jUn/CMmHoZw+fNfOObJg2ZtwMZFi0CiL+T+RJxWotmrmgtEJOGDqj
         h6fPoBxJbOxtzZwv3iiuNJJR0JsJDqGFjRAYVr89phOGC6jbiukrCmLFXjciuDAOmG
         UPCNDVneA0W8ZXxjeGetlVxM2owfAoAXpH/HPk1pufDKwkexkJmepW2jY1yg+PlNNQ
         ck+hHC3bYXfPQ==
Date:   Tue, 28 Jul 2020 18:11:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the vhost tree
Message-ID: <20200728181132.55476e07@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fZ9GYVKaF_R/xgj4fBOPwQM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fZ9GYVKaF_R/xgj4fBOPwQM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vhost tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/virtio/virtio_vdpa.c:17:
include/linux/vdpa.h:43:21: error: expected ':', ',', ';', '}' or '__attrib=
ute__' before '.' token
   43 |  bool features_valid.
      |                     ^

Caused by commit

  fee8fe6bd8cc ("vdpa: make sure set_features in invoked for legacy")

I have used the vhost tree from next-20200727 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/fZ9GYVKaF_R/xgj4fBOPwQM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8f3bQACgkQAVBC80lX
0Gxc7Qf/XGad8TTxtrbVpLDLnKk9KqOJPCEenc3Vt/NbCFPWoErxWGVSvVAkSbVn
R2wUAitladgEhvjJpdrowZlfPlkUpKcEMOc2K5i4zGDk9DqCCPTQ8/GcpAoNnCDr
6sP51jdWMDI7cN3Kyqb4n5q7VNjQsiJu/j8sDdkyo3VSHaX12jyLvKmUP6uGmWyS
XGX1hOn3H9ccWDqsM15BK7k16hC24csiQ09KDkzvbEfGLUe9A7N5ICbHcYP0zZFT
nxTdXpg8ibo92sl96JQZRhmcp9zvw0NVp0PXPTWaHvTzYcLtr8ZwhQ9b+8tcMg/i
66r7WKq9eDwAq13Bgnjeylmf/5a9Qw==
=RtOR
-----END PGP SIGNATURE-----

--Sig_/fZ9GYVKaF_R/xgj4fBOPwQM--
