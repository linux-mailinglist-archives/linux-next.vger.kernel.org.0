Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B79412BAC
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 04:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348617AbhIUCXz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Sep 2021 22:23:55 -0400
Received: from ozlabs.org ([203.11.71.1]:60137 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230145AbhIUCLd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Sep 2021 22:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632190204;
        bh=a3cUIv0cFlgM60XQqhckvEnF+VTAPa9qbJSBXzctUew=;
        h=Date:From:To:Cc:Subject:From;
        b=dQ+CdJrJKVxhya6ZJ+kPpJGhLSKwem4Z/lF6SSB0T0whNhnDdDDBR6z+3veqEMhDc
         U4QeMx1OY4RXoVTlqxaS1Il/rLY0+JxgrHTEs1auj5n3sITY8Ie2Q5QHI0P9gmZ5SR
         qpMQHs91W4AHYjna4SRumlH09PwOoHPO+dre4G/40MjA4MK29LnWtUS2HbHfk+9ZQO
         bDT0zVUhniSc20xzV0Gd4lS8kClAbFpcnSptxKgACg0sVWzEy3WNsmE7aqNhDqp3jA
         QYwDRQH08q9e9ik8+fPlfkWtoDlm3Z8cwzmXMVgg0PEVcqZGN4aPlHXZULXvdRG4eU
         p2NWIH0N4qzQA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HD4d84Dqwz9sR4;
        Tue, 21 Sep 2021 12:10:04 +1000 (AEST)
Date:   Tue, 21 Sep 2021 12:10:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in Linus' tree
Message-ID: <20210921121003.3cac20c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/npQHd+6GqU9GyVpncn1yOcJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/npQHd+6GqU9GyVpncn1yOcJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  345e1ae0c6ba ("afs: Fix missing put on afs_read objects and missing get o=
n the key therein")

Fixes tag

  Fixes: f7605fa869cf ("afs: Fix leak of afs_read objects")

has these problem(s):

  - Target SHA1 does not exist

Sorry, I could not find the intended commit :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/npQHd+6GqU9GyVpncn1yOcJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFJPvsACgkQAVBC80lX
0GyT0QgApPk3VJE8SiOw6Ysxy2t1pI8DJqM2sFf4BqHy2Ss98Z+WDZXGJoixxB5J
97sZcaERqu8/qVNrqMBQn6NYnYByOOaPf0dgxpPFYDRIk+73qRyDorH5LbWVn6GD
TLXj6RcsAmnH8KfAMxVohsJLRmDLOgtUZzBcHBVZd6c5MW4dfSRC1iqWe4wSpxuU
7+O8neopSmEQrt9bWYn0MBwhCaJ1H+YScRHRxT/VyhpWikvh8fbdtE/kulQz8ohV
MVzs5kzi54reMmY8rrjoIAXvMq5b4bCPEbwkMIsBPnGnPDk8eR06okP7SnAzf7HO
UBfbLdkmPSoYitEVIr3nw811f/JTUg==
=5Uve
-----END PGP SIGNATURE-----

--Sig_/npQHd+6GqU9GyVpncn1yOcJ--
