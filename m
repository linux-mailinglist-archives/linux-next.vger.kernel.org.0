Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE4C22999E
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 15:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732427AbgGVN6M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 09:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbgGVN6M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 09:58:12 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC22C0619DC;
        Wed, 22 Jul 2020 06:58:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBcVk14RJz9sRN;
        Wed, 22 Jul 2020 23:58:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595426287;
        bh=Ar/36BU5b1JALnEh8D2rR9Sczsbb2i7m/hyLGbACMRo=;
        h=Date:From:To:Cc:Subject:From;
        b=dwLHhZb8eCxuBAvtFkGsbJbzibH6zu5Gpgaw3B9sZLsQyOqPK6zt6iLiiKdWUxLWT
         BBTCKLyYxL/uOH52UlO/WdjK8Drk2GC9AWTxAXMEa5l5TUj7iid8mnGjpuq4ymByqS
         FyRXtezr56rh4mbL6E827aymMtQmnH/+wvY5gmMVkqpFZzQhdpx9g0yxNLFE1Cgrqw
         ovUXZQe388Xw0lx3183WXkrz8k2T9w/nRP5TvIzWEQJFcK0tw6aKIv4rT6hAjA128N
         32ZLOxsWT98Fem8WSVq3omr19VjxMfw88qvzgj+Myig6ygUNnO6jIdqQGNIeW5zqnk
         /J5W3XQyZLQpg==
Date:   Wed, 22 Jul 2020 23:58:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Subject: linux-next: interesting merge in the zonefs tree
Message-ID: <20200722235802.1f01457e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8q6A2uYfujIo74WNTDp2wUk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8q6A2uYfujIo74WNTDp2wUk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

It looks an old version of the block tree has been merged into the
zonefs tree.  Is that deliberate?  Other trees should not be merged unless
they are guaranteed not to be rebased (which is what has happened here).

--=20
Cheers,
Stephen Rothwell

--Sig_/8q6A2uYfujIo74WNTDp2wUk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8YReoACgkQAVBC80lX
0Gzoegf8CCylamuV5sAnrasN7luW2oMHGcj6zHPVHATfi8Rl2Xlcx3LL4cPK8/U3
5aErb0b0gtgXTZBiC9SGu0kk9T1WKSgYKNb+cnX5MfW3MEu9/kamlZf3s+qVYUQD
Ct5oSukAsmgjtFXBXNkLUfixZ1LObEM9OxsqhWpSyBlc4vrycUBLxigIEq4rkNhl
K8RSBcLT4j0hnM1QcT5GzveHLQtqjVloqKaa6qkmCNmxnCCwt5hGnb8VOp02cIOi
/gi06yFmDBfCMdzoenWZer2ZXf4hCar5fkU2OrScYkG/IETCOu3jwtMb0n0pzE7o
OjUjEsOi8noD84QrSixC3Bcb9qMduw==
=rz6a
-----END PGP SIGNATURE-----

--Sig_/8q6A2uYfujIo74WNTDp2wUk--
