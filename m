Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8EAA158569
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2020 23:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbgBJWXi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Feb 2020 17:23:38 -0500
Received: from ozlabs.org ([203.11.71.1]:58657 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727254AbgBJWXi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Feb 2020 17:23:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48GgRC3C26z9sPF;
        Tue, 11 Feb 2020 09:23:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581373415;
        bh=5SNgMbuqxpx5DVSV6miPMGG8tUdpANItUtT3Sbh809Y=;
        h=Date:From:To:Cc:Subject:From;
        b=btqasubZvu/nPqQEQUrJfExh5dIjqi8npyLdzPTcOY/U++RKTUIOOUcwz2g5+ZqXs
         jDImQUZWsOKe4EMOK2PcA5Bec5Onl2eGkrQKJ72T32K8Fi6pZGpyi2BviEOfWK5LHe
         Ujr+67926U6Ioj/gBfOqoBwphV/Tgvq6Yl8H45MR6kR8JySJZNymSuEXwQ4L8/3RO0
         0R9Fk23q/wQ74s9TyL8SLGeEC8j5yvnT+9KP1cPZSAoK60nYbF+IScLfJETaw6Tm8T
         5vIJq/eVb6K407E/d2l2aY9JX8gafCpSZGok6krYDC4Ae0QfqbYXxRkR3eo2LjvTK5
         vc+VvajCjgctQ==
Date:   Tue, 11 Feb 2020 09:23:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20200211092328.34ba4b9e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M4Y3xAJX6HxqGWLa=p2cFqt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/M4Y3xAJX6HxqGWLa=p2cFqt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/hwmon/axi-fan-control.c: In function 'axi_fan_control_probe':
drivers/hwmon/axi-fan-control.c:419:26: warning: 'res' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]
  419 |   (unsigned long long)res->start, ctl->base);
      |                          ^~

Introduced by commit

  690dd9ce04f6 ("hwmon: Support ADI Fan Control IP")

--=20
Cheers,
Stephen Rothwell

--Sig_/M4Y3xAJX6HxqGWLa=p2cFqt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5B1+AACgkQAVBC80lX
0Gz6jgf7BgIi0EslwcsgRAQnmM94XpJTX6SlHaJAIWNwGutFOc7kwIT4px92smkX
9Pasm6dm3najlsuPtgHG8BsBOR8Oln3ge5JifVH+qYWaoPoVV8WG6iQKhknIgbZL
sNu4tEWTVI27c78/CMpk+Yr1CzgLyhWIB7M6oe8e7n3Fr0jvtQ7qZiPOODN1ThOB
5HRMXPD+tLPvbgdLK1tolug1V1s0D0rv2a2eQAoJ4KqIK1iZo3mtiFq8WPDVKoxG
h+lJ/ezFZ5NN6belk4eREruw4B7ECMo+TIPWC+Z0mYBOiQpKim0aoWW2gbw9A3rq
9GiwXbV+Oxr+A8RLxkClmVyYafNl3g==
=IXTq
-----END PGP SIGNATURE-----

--Sig_/M4Y3xAJX6HxqGWLa=p2cFqt--
