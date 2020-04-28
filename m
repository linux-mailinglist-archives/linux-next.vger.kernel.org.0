Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13DC11BCF7E
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 00:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgD1WKs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 18:10:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58569 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726256AbgD1WKs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 18:10:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49BbSP5QTtz9sRY;
        Wed, 29 Apr 2020 08:10:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588111846;
        bh=NFHOw8DhkuLXgbLDKqz2gsB1gbmBTqIp6DqHrznV//g=;
        h=Date:From:To:Cc:Subject:From;
        b=KRgBWpcchS33S6HiC5MAAh0oDxZPUcvW7OaIJmng8lNUNkiFqKo+zXolPb1BGEXkq
         AZCzTgv9JHoqvpWVq964MuMNcI4joyvZxCH/uJZHqpZT+3YhEIMNxOqEPcllE2m9SP
         Oqk47OzBqkyhHQVScVDtOXJp4UBIYJvKA4fMaKecNmRcYAKvk2yqCFpZ1n7k6xyEc9
         yf2nIogVYB33O9sJviXuGLDWl+4OTwv2mIOm55biafVe2QKMuxvRvASpp+hXgseMWx
         I1aKJ1DY9RBRbmJLfgfs2EKNm1+pYJiTCrq+D/biG/hnpuvAtIUgefMJQWgPkQ6Hc4
         OTMJtU0/kO3oA==
Date:   Wed, 29 Apr 2020 08:10:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: linux-next: Fixes tag needs some work in the spi-nor tree
Message-ID: <20200429081044.0ab542cd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bepKriXO+D.MdKYpZ0Ug6JE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bepKriXO+D.MdKYpZ0Ug6JE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1f241ad2a093 ("mtd: spi-nor: fix kernel-doc for spi_nor::spimem")

Fixes tag

  Fixes: b35b9a10362 ("mtd: spi-nor: Move m25p80 code in spi-nor.c")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/bepKriXO+D.MdKYpZ0Ug6JE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6oqeQACgkQAVBC80lX
0Gx3qwgAlGGdCWB+eAOhLYnr+OFhva+Q9xrf0abpV5jZwoMdBTORv+0Nk6YEHc/R
OiOAjaENTl39wXr5MId040mhb+N6YJJEOQq2e8XlaFuQFzu8nbWE/QJZcDhzK8o5
N03gWTqd2ue56myR/673b5MlP4OgGMAMRXST6l4wUF+Uf6OlcqukC3LBTZV6afSk
+cYWldwWYIKDPTNO53z5fA3qTUaY3PjBnKlhIwu6t1E/8rO+9oQsOAfmHqYRTiF3
p7FOdKEJmZ40ST30iPpNHWrBfwqRaDPW3rp8m/9QlT+E7+EsD1gip+RwFS5s5oq8
ZW6NYLTh/589PVlE9vQh9eelQc/B2A==
=mIsU
-----END PGP SIGNATURE-----

--Sig_/bepKriXO+D.MdKYpZ0Ug6JE--
