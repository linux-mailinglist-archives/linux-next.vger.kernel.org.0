Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1DE434144
	for <lists+linux-next@lfdr.de>; Wed, 20 Oct 2021 00:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhJSWZO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Oct 2021 18:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhJSWZO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Oct 2021 18:25:14 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A2DC06161C;
        Tue, 19 Oct 2021 15:23:00 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HYpCk6DDWz4xbX;
        Wed, 20 Oct 2021 09:22:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634682179;
        bh=iLDqRXur7srB+p/mAgEXltNX0n54+7xkeKIirqJucSg=;
        h=Date:From:To:Cc:Subject:From;
        b=s9amZAZa1OpZhdJAlnKOimIKSX34fIqCDk+rDKUNdyi0ynjj7GnZIkjn2rfKg7IX/
         AdClWpnpYk5o33IcS5JhMRRuK1AKZaIrcCE99EI+N+03fOLhV2gRnb+SOZTFNvY+IM
         fNQCOSHswsqT79T9pEmEhPPAWhyLz8y8ds1gXg6Vlm2vFMQCpgNiED2CtUcpsVzSPX
         m7qaGXKmfzNRWUJtzA7JDW3d6rcJhlVngk5hNQOVYezoo3XmWPhqk4+kCiEqw7F4vQ
         2hk7sXoXO9yJTK18vXqhJN2hbcSfLma+7GDkZXEGdgubBvrlccENTw/uOGfwsKeSAu
         ventU3l4Fcz6g==
Date:   Wed, 20 Oct 2021 09:22:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Andreas Gruenbacher <agruenba@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the gfs2 tree
Message-ID: <20211020092258.71861678@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qB4ldzyDKcjrwVSaR1qHkI+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qB4ldzyDKcjrwVSaR1qHkI+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gfs2 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from fs/gfs2/glock.c:39:
fs/gfs2/glock.c: In function 'may_grant':
fs/gfs2/glock.c:332:16: error: passing argument 2 of 'gfs2_dump_glock' disc=
ards 'const' qualifier from pointer target type [-Werror=3Ddiscarded-qualif=
iers]
  332 |   GLOCK_BUG_ON(gl, !test_bit(HIF_HOLDER,
      |                ^~
fs/gfs2/glock.h:222:26: note: in definition of macro 'GLOCK_BUG_ON'
  222 |    gfs2_dump_glock(NULL, gl, true); \
      |                          ^~
fs/gfs2/glock.h:219:70: note: expected 'struct gfs2_glock *' but argument i=
s of type 'const struct gfs2_glock *'
  219 | extern void gfs2_dump_glock(struct seq_file *seq, struct gfs2_glock=
 *gl,
      |                                                   ~~~~~~~~~~~~~~~~~=
~~^~
cc1: all warnings being treated as errors

Caused by commit

  9d0f1e82baf2 ("gfs2: Introduce flag for glock holder auto-demotion")

I have used the gfs2 tree from next-20211019 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/qB4ldzyDKcjrwVSaR1qHkI+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFvRUIACgkQAVBC80lX
0Gz5ugf9Fg7XP6A7rvHPmkuV/yNYC0RJr1GQHly3f+4bbsGULmAsEiCdxAs660SL
dgcc6l1bPY0XJexK7WNsB9IhWHouvfX1WNbFMfsZ2acpDRx+R2zsYeBRQasTiNpM
e8LdP5SLtSYFIUVvAF8tXMKnsGgoNZxuZVbCUg8eUffgqGmhAcyRtHaQUvEiv7CF
vt66SFxrtLlLQyAszRSURVLZxLdN6wq9OIFhwsgxDCsSjRbpV5MNAxsbI2A89MnM
wfMcuqo7e4MXN2dUW8VuCxsaR3DzJPGgD1PPEiF+lKy6BBnJbXmm/TECK93i4x4N
adCZKn/SXLzgOF/sFZ6/BRCNk38unA==
=n3+q
-----END PGP SIGNATURE-----

--Sig_/qB4ldzyDKcjrwVSaR1qHkI+--
