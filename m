Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC3721CBFD
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 01:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgGLXLG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jul 2020 19:11:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42329 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727785AbgGLXLG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 12 Jul 2020 19:11:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B4jFM4Gr0z9sQt;
        Mon, 13 Jul 2020 09:11:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594595463;
        bh=tH6hf7ozcFNXgyIXjVc+EIELN+h0qREIX2OBskR1VaY=;
        h=Date:From:To:Cc:Subject:From;
        b=nyFumVMq+310laxAqrr+F18HjlmH9QOKNuERRF4YvLQUfOx3plfDlW9OmE1vzzyn7
         sqw1+XAwaA5IhJko1xy4A6okm9J14n44zMOtKqcH+pPL9U9qlAzp/4cF0lM52IeAc5
         +ClpjkWD+yGi06U/Pv6xMBt0I4/GDN92XaKcwd7SmzcpC/4VzEq25o1Roucb8xd+h3
         wpY1b+17wILFIYOrfnj6gY2p4O4w5pDMcGhHQ3xhjUJYNfJHeFF3aY9HQCeCsJbxfc
         +qINPex8/eTRpkBsbFVZ7AD2xbKNcKIRTwH7J8i6MpgP65W2p4syYHbhvY5HSF5UQb
         a1lnLcBZVmLHg==
Date:   Mon, 13 Jul 2020 09:11:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: failing to fetch the dmi tree
Message-ID: <20200713091102.28d186ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4bvstfZKOm9NWYF0eZa.Kns";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4bvstfZKOm9NWYF0eZa.Kns
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Attempting to fetch the dmi tree gets this error:

http://jdelvare.nerim.net/devel/linux/jdelvare-dmi/series:
2020-07-13 08:58:05 ERROR 403: Forbidden.

I am still using the previously fetched quilt series.

Jean, I don't suppose you would like to produce a git tree for me to
fetch instead, as yours is the last quilt series I fetch (apart from
Andrew's which is special).

--=20
Cheers,
Stephen Rothwell

--Sig_/4bvstfZKOm9NWYF0eZa.Kns
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8LmIYACgkQAVBC80lX
0GyIpAgAo5bz5JCxQH7AoOZ68w2/xVUD8Bec3izSVafNU9a5rBMmzGcbmoSLmLn/
HqQ9/LKWlTTTNgM30fD1OgKR3mzwJGjW3F02f+9HK7NhU889+0gx9nKxrkmrJvBz
rExQhA4Ro1XsZXlpFtGSfxxRky+6w5feq1AnDsNdURxW9YVbZ4tjJPN8bZvzbq0P
UAfWw1gORfYE/G/s9a5CsnBe4UfWML2psqnzvq3VAcRXzQJwU1wPaMeFDYNO9LJY
SuGVjxm4YdRyAGc+yClFV5HPOCkzdHmYX0LVrwu+tDIsNGyEEnYCEUlmMFuy3j0G
sZI47Dimu8SiB+TlDIVR7fEaTRsh5Q==
=xQwg
-----END PGP SIGNATURE-----

--Sig_/4bvstfZKOm9NWYF0eZa.Kns--
