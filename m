Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED848B3B8D
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 15:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387420AbfIPNkq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 09:40:46 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50874 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733272AbfIPNkq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 09:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=w3bobEKmdltUYp3wdYywVRw65l/zXxvDNG8WKRQOF04=; b=L3h6qJyEkF7Z4Q+eevCqRrGLj
        +p1+xrRJoB0E/NxBqrZjB8JC8uvC05p9FzBOnoTdjIm/1MIMpCbLzBcuvAF7Z8c+W5DDEZAZN/7b0
        YbHO5liyYQAGum8+A6zBMyXIyu3xGimJTa4xWJgZOmie8US5dM7wE/O/TqzZrKVVYJTdA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9rF0-0004b0-56; Mon, 16 Sep 2019 13:40:30 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 91B992741A0D; Mon, 16 Sep 2019 14:40:29 +0100 (BST)
Date:   Mon, 16 Sep 2019 14:40:29 +0100
From:   Mark Brown <broonie@kernel.org>
To:     David Howells <dhowells@redhat.com>,
        Richard Weinberger <richard@nod.at>,
        Artem Bityutskiy <dedekind1@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Al Viro <viro@ZenIV.linux.org.uk>,
        Wenwen Wang <wenwen@cs.uga.edu>
Cc:     linux-mtd@lists.infradead.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the ubifs tree
Message-ID: <20190916134029.GF4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rMHhSL690X5+a0Qo"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--rMHhSL690X5+a0Qo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/ubifs/super.c

between commit:

  9163e0184bd7d5f ("ubifs: Fix memory leak bug in alloc_ubifs_info() error =
path")

=66rom the ubifs tree and commit:

  50d7aad57710e2b ("vfs: Convert ubifs to use the new mount API")

=66rom the vfs tree.

I fixed it up dropping the ubifs change and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

diff --cc fs/ubifs/super.c
index 7d4547e5202de,a5fa725e7cf16..0000000000000
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c

--rMHhSL690X5+a0Qo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1/kMwACgkQJNaLcl1U
h9DXgwf/QZnfXeiu+WYdJ0NjI/wa5d6J1ojcLsWvDBM/TIPEO8EMwBqvqgF03u0k
SGg0TMTUDuQtR5s9dFlefWdbYWz1FPiOPED7mqkPXBUGUyGopHxM5Y5eRgoeVz64
2jk0e87um3mPWW5X1+dhPBnjjlCeEp7R+t05VG440MI60hExp5NTKlQgDeM9TzaM
Tz6FZlzMYJV2DJAEvBImpI9omlrfzyo2d6S4ZxGx45M/p1o5pfq25kl3R+1DYSYz
Zn3xTdQoUi+YYyPwi4wYk/bt4Zu2rBArVr/nZrDDTZHDjHCkyinjyvGqaR3usr+h
jn2/CH9wfVKTkZHsbyXRvK6XLZ+7oA==
=RVjy
-----END PGP SIGNATURE-----

--rMHhSL690X5+a0Qo--
