Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6894D1F6F49
	for <lists+linux-next@lfdr.de>; Thu, 11 Jun 2020 23:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgFKVRU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Jun 2020 17:17:20 -0400
Received: from ozlabs.org ([203.11.71.1]:53891 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726380AbgFKVRU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Jun 2020 17:17:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49jcBN3w0Kz9sRh;
        Fri, 12 Jun 2020 07:17:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591910238;
        bh=OGFMYw8ljagnSiVHi1fwMgAbwtYDYMEoXbb7PbDUUto=;
        h=Date:From:To:Cc:Subject:From;
        b=E0jAppJa27nrYLalm2jiZ/Cml4xjdJbHiLFGIpU0Vg9PX8OBWjAR9Eg9dC0BOTwrQ
         TGzN8L/WrE7IYqCbYQFVvfItJzFrMqmUDzRWG0Mms+wqCOsrbJXfrydJ0Vm4liPYvP
         cHvUO84pLMbE/80CmuyG0SV9Jz86UFNG1EsILJdzJGoQqzSv1DUEY3SFTE5XRYD2XZ
         NoC8VeDpp7Tp1IpfQu45Ffg4bUzEYJaDmxGt8IOIsS5OO9RHZaheEBqUxh63oN7bSH
         vB6tVzM6zrWb9HHLbR9/ebLrh59m3B3fTKBEk5BHNecvn9LTe0JzxyUPiz1ikeD6zB
         IcpQw8nA4+D6A==
Date:   Fri, 12 Jun 2020 07:17:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb-next tree
Message-ID: <20200612071715.4ae9ecf7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y8LgOFngY7.h62LN+8rDOuU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Y8LgOFngY7.h62LN+8rDOuU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5be5f41dd785 ("media: v4l2-subdev.rst: correct information about v4l2 eve=
nts")

Fixes tag

  Fixes: commit 02adb1cc765b ("[media] v4l: subdev: Events support")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/Y8LgOFngY7.h62LN+8rDOuU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7in1sACgkQAVBC80lX
0GwWDQf/aEkavZyKgfkb48ZGTc8jw+nEs3H9Qzt2XiqVcBJwsa8Lrec0MGpdGAAJ
+xLZ5SZm5cbVURvg7e10soa5sBKSOi1da+U2TO8QxECfBs1yQw/MnX5eOS4SgHdG
u1GBg3sQDR7gCY3jcdN/03hhbNXJjazf+L4Rmg9wat7PtwBf1l8FboAtjCO1k2hG
8cyvsiD8rMv5uM6/DuCU9JsVfzEP3DkIUgiJxdJqO8JBkzStRa13Y7ZFHHCCYdnV
d2UYSvrplTVgbUOpuZukMrut8wyei6TU9uixx9QnwBJkRMIl+HKSAYeD1BJfRGVE
ZZqdaleM+xrolyCVpmv0R3TZQlGo1w==
=kRmC
-----END PGP SIGNATURE-----

--Sig_/Y8LgOFngY7.h62LN+8rDOuU--
