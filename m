Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0CE183F09
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 03:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgCMCTK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 22:19:10 -0400
Received: from ozlabs.org ([203.11.71.1]:43833 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726620AbgCMCTI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 22:19:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48dqBd3LZWz9sSW;
        Fri, 13 Mar 2020 13:19:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584065946;
        bh=NVMEuaQx4TxOWTt4RbY0DGYKQCDGpPDgE1FjtwKP62g=;
        h=Date:From:To:Cc:Subject:From;
        b=OXZtnXflXSgETNQG9tzLywnQqzVk0BwXxjOA0ddMxYjFqGMvNhdUBmre2f14XQUms
         ENMNmBs/lIQPsEjDLv/rAKVy6qpb+JE6opcuZiWNtQDDJFAvr6GnvZX1qa5pPuJ1eN
         SdjphArhLeBoP2hDi3jgc7HjzosZYwWwh2JZZ1g/10wL6Wo3pgbp+XIPKsj6naDWxk
         /iRt6/vlOwXksbjBBXnmtu4UCKbdnHtMU19AkycLOfi2G6jQ4tMbThv0KUvJuEEx2f
         +L5TXNNJNcD3ipHWIBfEvnrgzAAlxvnmhStGW680vKhjBKZ1WNvt3QLiNvCtkq/3Jd
         uMbPBlJSNe+4g==
Date:   Fri, 13 Mar 2020 13:19:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Message-ID: <20200313131903.3975cdd2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aaVrJ9xWlerAddN4drz9MQ1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aaVrJ9xWlerAddN4drz9MQ1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR: modpost: "fwnode_get_name" [drivers/media/v4l2-core/v4l2-fwnode.ko] =
undefined!

Caused by commit

  dfc22c073b78 ("media: v4l2-fwnode: add initial connector parsing support")

I have used the v4l-dvb tree from next-20200312 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/aaVrJ9xWlerAddN4drz9MQ1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5q7ZcACgkQAVBC80lX
0GyThggAokPa7fqKCMQneit5QBLLZcBkldmDSeJ029oNeEefcFSqSeafcDr1uynQ
7K4phlybJFhpkEJ7U2o1Wc8fACBv6/Fq7QST1INm+vp+VKPeDM5Aq9CSYIP3qjhI
jqWne8+4OrO99AgNm3maphfoPTweri2b9VDR7mcoKsEZGnCabsauS7T2mERsis6O
eR/J039gfqBu7XFtaMP+2FmMBcF4qyX+vW6VFjN6IIX5KXbk6myo+M5eKUaR7TzP
C6n93me0Zptg3gjnXIbgXK+Fbyq79S3f0IeOXlHHkR3MKIjrN5JkJPeW3g2mYDA5
Lb943M/XV1FOlLALi8SsvE7Ezfhu4Q==
=02CG
-----END PGP SIGNATURE-----

--Sig_/aaVrJ9xWlerAddN4drz9MQ1--
