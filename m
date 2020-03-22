Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D36018E94F
	for <lists+linux-next@lfdr.de>; Sun, 22 Mar 2020 15:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgCVOIv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Mar 2020 10:08:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53859 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgCVOIv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 22 Mar 2020 10:08:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48lfWM39hGz9sPR;
        Mon, 23 Mar 2020 01:08:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584886128;
        bh=v+avydRkhT5ope5s3q1yjw/QAkHfksGUTqmRNqlrD0U=;
        h=Date:From:To:Cc:Subject:From;
        b=iBQtUWUHqpOYC7sRSkR6s/8qqLgYfQDa8thK54hccDZznTgiz6r8qpMLSJvyuJyMt
         DKCUxLPozIFUV5GzFUoWAiSrDJeNOIlEyUSH50ZCXfE3hj+B3uvEB9zxIkRKVlJQnD
         cSDkohvvRio088RE90317uC+5+GZj3ev8Mkd7/ZYws1gOzP6Y1M+Pof4Wnet0++nnl
         wMoieGoDT/YN9wvfTQtTpF0eTj1kCu91sHfPYAeP3v/vxzN11fB8JWyJxPepDhOURo
         TJgExDjKeqAhSX5ob6vNoVwq1c5qpf9a0wjaAymVz6jawAcKiRWKLwfZLbEcTmJj5m
         dOmS+mswo7qAg==
Date:   Mon, 23 Mar 2020 01:08:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Zhiqiang Liu <liuzhiqiang26@huawei.com>,
        Feilong Lin <linfeilong@huawei.com>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20200323010842.335a248c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0XuDueXN4ndoo/Zj1FcL66L";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0XuDueXN4ndoo/Zj1FcL66L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2f95fa5c955d ("block, bfq: fix use-after-free in bfq_idle_slice_timer_bod=
y")

Fixes tag

  Fixes: aee69d78d ("block, bfq: introduce the BFQ-v0 I/O scheduler as an e=
xtra scheduler")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/0XuDueXN4ndoo/Zj1FcL66L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl53cWoACgkQAVBC80lX
0GwQfAf/VfdPM0p93yPULc6qDhkUuqsDAd+CmfMKgnJ5kZ3ZJLOOP7hCjNk99iQL
8Vr3p17cRT3qj9h/7B4HnacVqp7Bu31e8OXk284nFfv3a6qIdXcowwGhS0Eh1ub2
XhxvAGjY7KpealIGvQ2NkPrf2lWq6blqP1fuJylj/uBJ/Dq0Kg1+gTLCayakvwG8
bRllNvLYW6gnD1/f3r/NxLqZya22C7gzm4JcrV2fxcAbxL3JUUKiQGByvS3OqFVX
AYZozTjiTKwHkT8Wg5riFjekcqf/tvI329TkMEh/tgMJm1kCtaTO2vWUXLU7gxEh
9bTn/TwGLJgz9BB/cEgpVgUPea1Okg==
=csYG
-----END PGP SIGNATURE-----

--Sig_/0XuDueXN4ndoo/Zj1FcL66L--
