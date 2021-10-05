Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F4D42228A
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 11:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbhJEJog (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 05:44:36 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41817 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhJEJof (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2021 05:44:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNt0z3yrGz4xb7;
        Tue,  5 Oct 2021 20:42:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633426964;
        bh=tLt7WEiqm0CmAxK/qY5YSRAjYAvlFvyUuQvq4nXXoCY=;
        h=Date:From:To:Cc:Subject:From;
        b=UoFMT1BKP4u4JQ+PPkPDoKftsr0uryOX3mbs1M/7tP23JaxxddS2v/AAuWfl4AbRo
         MidxB51iGmVpyfOJ1qmQXD7+jmxHl0mMVLNuixRxkcSaXlPdPEjJk+a2stw2msXtEN
         zwk21RvPThEPjtkfh8TRCB5Nsm16GpBErCSGYTv2A7m61YmOtM0C7IVJv9mM7A3cXA
         Tifu1SN40VtxlA4HF4V+3Q14gmGJvqhnV7a2LUbS6HcUCh8QQ8d97ZZ9yq8GKC/DTK
         uP2ybYEQqmAttHyoRAgstJ2Rs+MK4SbEGXA7IeEZkKFThfkhfJBO8KJytLOIWlXkL4
         lbxTdSLdddU0g==
Date:   Tue, 5 Oct 2021 20:42:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning in Linus' tree
Message-ID: <20211005204239.6d14a745@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MMGqIl7=lCbE_0/fyCyv5dB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MMGqIl7=lCbE_0/fyCyv5dB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In Linus' tree, today's linux-next build (htmldocs) produced this warning:

Documentation/driver-api/infrastructure:50: /home/sfr/next/next/kernel/dma/=
mapping.c:256: WARNING: Definition list ends without a blank line; unexpect=
ed unindent.
Documentation/driver-api/infrastructure:50: /home/sfr/next/next/kernel/dma/=
mapping.c:257: WARNING: Bullet list ends without a blank line; unexpected u=
nindent.

Introduced by commit

  fffe3cc8c219 ("dma-mapping: allow map_sg() ops to return negative error c=
odes")

--=20
Cheers,
Stephen Rothwell

--Sig_/MMGqIl7=lCbE_0/fyCyv5dB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFcHg8ACgkQAVBC80lX
0Gx3twf8CnnjlRzzrSPNVZUdqrC2ck6r8YWgje+RUGY+6o4YETePJyKrygwE0HMn
XTDlpAnGtWYaT8BXa+IiWCaBp1KHUo0VjSQqJl0UfL7p/TJenLm04wctx2UXmOdB
ZABUpQqDq1nVLUeFYZyNctqo9hzAZUzz03fKUbPM4emT5owQtKGxS/rrvbcNiG3o
5BkGvfqe9Ej8IH25S/HQlkt8Jngs20pD2riy8QqxW8pKVJUbRZc4ESO+UTHU+nK9
5tkqcqJN+NQhb4aeLSME1FUbYvFQC6CFHur1CTNYf4X1Byw5SIpORVQY9469Jk8h
ViCsRVJm24Qb8FrwzsYUzn7AXwm5oA==
=Uyp8
-----END PGP SIGNATURE-----

--Sig_/MMGqIl7=lCbE_0/fyCyv5dB--
