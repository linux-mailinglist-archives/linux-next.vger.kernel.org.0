Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE5AB32E9
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 03:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729040AbfIPBXA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Sep 2019 21:23:00 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52790 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728872AbfIPBXA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Sep 2019 21:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=+2NX8howexdlblQAhSP9/O3k5EI3/NQZYnxbZcI+KRA=; b=m0mxagbs/RC0Mj3LmrSfAKj/s
        WXVzv0nmqlqn28vZ3EhfykxBTWX5WjCG4dCF/PlPsHFHEPU6J0hBQB6rdM4vTTr4HYaLV4mPatHfk
        gPgOTdhOB4I53GmBTeyrVI+E3stKqkBF3yvmRW5J6UiCqgSUzARZobDUhVwnd/2wgrCdA=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9fjC-00027l-Gh; Mon, 16 Sep 2019 01:22:54 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 558192741587; Mon, 16 Sep 2019 02:22:53 +0100 (BST)
Date:   Mon, 16 Sep 2019 02:22:53 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Christian Brauner <christian@brauner.io>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Hridya Valsaraju <hridya@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the vfs tree
Message-ID: <20190916012252.GS4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YvpO9wCO44Ze8QQC"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--YvpO9wCO44Ze8QQC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/android/binderfs.c

between commit:

  e7d8840d4b626 ("vfs: Convert binderfs to use the new mount API")

=66rom the vfs tree and commit:

  f00834518ed31 ("binder: add a mount option to show global stats")

=66rom the char-misc tree.

Since it's very late and it seems useful to try to get a -next out with
the state prior to the merge window opening I've used commit
ec13c78d7b45 from the previous -next build rather than fix this up
sorry, I'll come back to it tomorrow.

--YvpO9wCO44Ze8QQC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1+4+sACgkQJNaLcl1U
h9DlKgf/aEhp80KPdPQ3byacESVuhc/yB4CJZpnFNEVataQ8UCrKspNsRvT48dZY
PyLC/7PFocuteecFxfL3VgrOjaljcBHQl4wQkQCnrsGgx5VRl+kSXdY7I8UcAWNB
TtZl0AAjUT9rP9bqj8gy6XkjRE/0qE3Q+WxP36QtUuSlqVMZtcm27I3KB8GboWQA
+E7stmjwCoLuraybxPfhs8PvNAzSft+ggMoCFJ6JcTK151ayAPSRykNbLs3cTgAd
ot/CzQCRPBMsW+pL3UtARX8HQAyGhYKDjpyKuIINTubINGdgl/n82zSPOl7udohz
x7UnY0TBcKfwwImzuQTJ/XFfLUL0Lg==
=6x7Z
-----END PGP SIGNATURE-----

--YvpO9wCO44Ze8QQC--
