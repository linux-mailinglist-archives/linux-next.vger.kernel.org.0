Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1646A2B0E
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 01:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfH2XkZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 19:40:25 -0400
Received: from ozlabs.org ([203.11.71.1]:43993 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725917AbfH2XkY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 19:40:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46KJxy5d0Hz9sDB;
        Fri, 30 Aug 2019 09:40:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567122022;
        bh=Dh2M1fm48opO/ywcJjF+FA4glUp10FnozOiYYF6CvFU=;
        h=Date:From:To:Cc:Subject:From;
        b=BcilHtQYp8bsvOyv8t7BKknnb3KeW97IDs4OTjN++NDbDk7wYF2STD8hUfNFCTvBZ
         lHmAs1SUFu4/EtpcQ7w9MDDtx8IVvTJtGFOyGv1LWNjh5PhlkyYGC7PDohe2Xpha3Y
         oaaZZE5QPDUO4NTxnmxXhLT7caBr/aA5ESpd4rvwQYxPTnQ099aGrcjVXyl+pNgZ51
         MkWfTQxVQ62Jjk1au6JfDI1os4qWXDr0/c9eHxWmNKtJAfMoN/70Mfk2C9P+Y8xkg9
         tw6VGOEwMrPFcONAjcAryo1SS7sh2vpuddObxr+3AHAZIM7hpzei1Ag7ldv7dnXJS4
         b6cwiMU6XXp3Q==
Date:   Fri, 30 Aug 2019 09:40:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Pittman <jpittman@redhat.com>
Subject: linux-next: Fixes tag needs some work in the scsi-mkp tree
Message-ID: <20190830094021.5a9fa690@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/in2w1OPp..Hb11udX_psrNk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/in2w1OPp..Hb11udX_psrNk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f18b30a01e21 ("scsi: fnic: print port speed only at driver init or speed =
change")

Fixes tag

  Fixes: commit d948e6383ec3 ("scsi: fnic: Add port speed stat to fnic debu=
g stats")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/in2w1OPp..Hb11udX_psrNk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1oYmUACgkQAVBC80lX
0GyGAQf+JS0igX7P7kcXd1bf9req2cz/bKwMWk5tHs0CYJ3F/kJxEVbO5d/mO7Sm
aZ2h0MHlpaaOJRvFbeFc99zY0oY4uAsqsElK6TSTrLXyTSgQ3xcn8HG0w67SdO4K
72moSlJqpU1S5upQzVrFxrRqTwccw1NvA3NnTzPnzvI+Q9S5Ww33gPd5lWG1+xkw
by3jy8FhvjxJIH2XJ/Fn2N/wIKnbVTk3sD7jUrcfTd0qCeKEYao8B278Xk3rPAWj
Mej+yJKDOnA9bdBSWsb9OJAaI8kfL1/J2L2E+H6LuS0lKRzSCDb0QX1ikjvZiHxr
f3dAJ8sveXCUpNdL1/rZLHkfOEGfKQ==
=Pxox
-----END PGP SIGNATURE-----

--Sig_/in2w1OPp..Hb11udX_psrNk--
