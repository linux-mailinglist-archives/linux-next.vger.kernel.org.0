Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B58472D9673
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 11:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729895AbgLNKjI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 05:39:08 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56329 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729917AbgLNKjD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 05:39:03 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvdCB3CTWz9sS8;
        Mon, 14 Dec 2020 21:38:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607942295;
        bh=u1oVlLhsoWJ4/09HBMQW98glARlLRiO0KTxI9NZ2s4Q=;
        h=Date:From:To:Cc:Subject:From;
        b=LhPeDPdmJq+1a7dOPfHYikrWMgoSRvgh2SsmzySXHgKmHlFMkzqhoTRpwIMyXDqq1
         v3jn5oZ4Gq2GDQ2/H49ri4cfa1WQfjUuTfepeF4mlQGGRSrApyYDl2yS+rsGn0ume4
         oq+ubVz/rfE0oVjH3ESjYBw+4dz26UWWmG6Y9nz6EdqAm9qb6aan/oKj73EnMY/c1m
         ctiiLEAgAJzD5UtLvTkRR3Kf10m2qqTQdH+hQ+spfZ8BFcZV7tczKhUZGHp/+pyRoi
         6DPrcVmuo0LrCWW58XtGSKsxTycFgRCikkC2asOFx/kZFfcjd3Ip1HELb4/u1emWjv
         N3qzuN/wmhHbg==
Date:   Mon, 14 Dec 2020 21:38:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Trond Myklebust <trondmy@gmail.com>
Cc:     Dan Aloni <dan@kernelim.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the nfs tree
Message-ID: <20201214213813.0949d61c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WMNVbGAIHB4AHSwz_EHpxdo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WMNVbGAIHB4AHSwz_EHpxdo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  526a842bec1d ("sunrpc: fix xs_read_xdr_buf for partial pages receive")

Fixes tag

  Fixes: 277e4ab7d53 ("SUNRPC: Simplify TCP receive code by switching to

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").
  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/WMNVbGAIHB4AHSwz_EHpxdo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XQJUACgkQAVBC80lX
0GxPtQgAig6HcvTDiPZjclE0lD/KbwQh76tIVgD57q1ljnt47XtFw425mmZTBBXk
9kIov08Srp96qoagY9B95QGLr6tUdH71IqFC5ekfjjEFa3N/tRZkD5PX12N8956k
5HFjMMnYrUzf5eHLq8Q3qZsz7/Vg2DGqiy4H4fRIbthgpvXdhTTtQC0nFqY4614I
+uG6BC8zKc0UtLlgL+65uq6IE6RGlHtkxTmhzm1SRbvLQgArclEzX23JTpRkFcI2
EtRJBLCcrG7sK1jjJVC4VRoFLDp8w0L1mnhZd+9us2/c5Wml1Gyu8Cu/cCCtuGxv
w8TcOA9x/9aSgB5J2RFPoFMQ9OR3lA==
=XhhI
-----END PGP SIGNATURE-----

--Sig_/WMNVbGAIHB4AHSwz_EHpxdo--
