Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A0713CDC0
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2020 21:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729610AbgAOUH3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 15:07:29 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46793 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729532AbgAOUH3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jan 2020 15:07:29 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47ydf71xWPz9sR1;
        Thu, 16 Jan 2020 07:07:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579118847;
        bh=Z04FIIRqPjnEL8JK7PfsFjab5s7X/unpLZ6oNxJXT8o=;
        h=Date:From:To:Cc:Subject:From;
        b=si2r3OOOssVGqMHbTG1QOKSWrqgCZNZDGT1mt8O4JPWHu3PaZGtZzB/yitADrt/nG
         FzsROuh5XMLMtzewRNkGv1MXB6UvWtiCHMP724iEk5nq2EcGCJFbHXUbucrR6ywbmi
         dZs0e9HVapz6K1ipjlUeCHYnn/HrxilxosdZue+x6sQJt9QFOPDbFXlVkK/0Sv3/x9
         1l63o229MD57wsQLNV6XvDcQhD5TpyvtyhkUR6QGzyNaJDi4e38I/ywEpxpDAFbXPh
         sJRltNtpHKKoz0U8dfS24CpcsTv6vwRUsvzN5Qlw3Oo4u5etnkGPlVh69Q+5nCL+Io
         8V8KxJPM4bPug==
Date:   Thu, 16 Jan 2020 07:07:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: linux-next: Fixes tag needs some work in the usb-gadget tree
Message-ID: <20200116070726.7e2ef8cc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.p77+Mi=IAde7eX3zdIM0o/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.p77+Mi=IAde7eX3zdIM0o/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  6a6ae4e8e926 ("usb: gadget: f_ncm: Use atomic_t to track in-flight reques=
t")

Fixes tag

  Fixes: 40d133d7f5426 ("usb: gadget: f_ncm: convert to new function interf=
ace

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.  Also, please keep
all the commit message tags together at the end of the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/.p77+Mi=IAde7eX3zdIM0o/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4fcP4ACgkQAVBC80lX
0GwhbQf/YI72X9THb9ltJjkXFPj8Or/DZikqYtkv7pmFNR14rdnLDPcEnbs0BvPY
nTtcXuCEipIOaxZgrwpUB00elkAl1ESEJVlm/nGQhMntrgodP4cX/9KNuDW1oISf
ZPSmC/AyxQFEHvayxccWOeqIbWPTrsqFhBzbiXqye9wCmC5FAFg18Z7Dv265mx5O
Qz07vvEKJ/4YwLofq4jpjfyhk4w54oxHpb26iiAZJ81g0JvBLchGjDmYmwe8wEca
C1ii1MXWTwFODv3sbPpnTHrQu6OM+mvTCeCnFIuQ/jKAw7qievibecl1ySjjJWD8
MO6Hb+C+q3oyUogUtYT/CeFHxQZqVw==
=SHvD
-----END PGP SIGNATURE-----

--Sig_/.p77+Mi=IAde7eX3zdIM0o/--
