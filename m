Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2F638D857
	for <lists+linux-next@lfdr.de>; Sun, 23 May 2021 04:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbhEWCkN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 22 May 2021 22:40:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60637 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231516AbhEWCkM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 22 May 2021 22:40:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fnl014z4Wz9sSn;
        Sun, 23 May 2021 12:38:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621737523;
        bh=lH9AwdckluTJpRQiVDB7RMXCjnC/3+oXvLjYv6y4e8E=;
        h=Date:From:To:Cc:Subject:From;
        b=bSzDzM0UFtSLPnHea68W0ws0+TgrwnRgisMYUnd6wY7HF30ZquDNJP1fb0wt8MvW/
         cWOh48A0cSXmDae8cL8QaJPvTMRtv8/1b/d4ZTFDCn0/U9My+bu7GcgFQ5xfJssNwq
         Tc/6+3jFaNhGP5Z2X7c8RXzd7yqTebnmLeiuwQSi7t0VA5gqVY/PJOKJYnEVgNZhWU
         qeGyF0yhSNkAwA40YSoH7set2SiSNLlbFtkzxfZShBdM5OD49r5X8bvnsypVYpJ17p
         e0c7H44lCy+Ry0Jv/MevYI+chhVLVbcA7InhxOtvDpohfJ5m7firDe6FRt0h761FRy
         U7RUne+BMTeFA==
Date:   Sun, 23 May 2021 12:38:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pablo Neira Ayuso <pablo@netfilter.org>,
        NetFilter <netfilter-devel@vger.kernel.org>
Cc:     Florian Westphal <fw@strlen.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the netfilter tree
Message-ID: <20210523123840.101ddea5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FbsIMk5veJMUKTjyQFK=9Dq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FbsIMk5veJMUKTjyQFK=9Dq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  22cbdbcfb61a ("netfilter: conntrack: unregister ipv4 sockopts on error un=
wind")

Fixes tag

  Fixes: a0ae2562c6c ("netfilter: conntrack: remove l3proto abstraction")

has these problem(s):

  - SHA1 should be at least 12 digits long

This is probably not worth rebasing for, but can be avoided in the
future by setting core.abbrev to 12 (or more) or (for git v2.11 or later)
just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/FbsIMk5veJMUKTjyQFK=9Dq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCpwDAACgkQAVBC80lX
0GxMSwgAnDSz7sMT/9vItSvg3gP3XFRbR5MIOrpR+F1o8HUrTVw8Rz6rFgOC7Eq+
SL+jiiHhB8AW8kJLJzu5knUttr6SsW7N/sS+y4jRGhEsKANBjbZmfaDBtCGoUroT
5jqSoQ6EP/8wjWneXxl/OzWCw0KjOCLUeP+ZcFKM3eM7Sj1jauyGRxgigkWkaAR0
+4kuomfEdYEhT/SZ/NhhXmXJFhbMNETaW6Wbd56yS4RNWqHqfUjETNyztTOM+ERw
E+Q40I8TWNk7QHDkJe9bYChWpnZDUaGlOzKEofHQUHEcCA7KlWIEcQSWbYYcFWwt
OxXkMiT9J7pUP/FE0d4ZJFx9/iS0dw==
=0yE/
-----END PGP SIGNATURE-----

--Sig_/FbsIMk5veJMUKTjyQFK=9Dq--
