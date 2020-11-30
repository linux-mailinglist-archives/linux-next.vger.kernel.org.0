Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3BD2C7EA7
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 08:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgK3H3Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 02:29:24 -0500
Received: from ozlabs.org ([203.11.71.1]:50095 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbgK3H3Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 02:29:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ckxfx3VDYz9sVD;
        Mon, 30 Nov 2020 18:28:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606721322;
        bh=xH6zmF9WrynSxw8iWL7nHWWK9P7ueOEeVHeyhYESor0=;
        h=Date:From:To:Cc:Subject:From;
        b=YIksfZ+RvcytlA4xbGp/n6qmSPlnBdQlHb9RDn4b9SmU7gX0DWQLXREZUg+AltTMb
         Uvx/g0VBJc0GfBdjar98V7qyf1M8JVdVil2LjLkrV4PhPNvrO51BB3HRYUgLA59ouE
         BqWDH2OdPwtqrRGbEcc5KsGs3IPKMMT1MG85lomgH6CXV4i+RO+ixY3Eokwec9gGyP
         bHGimcbv02zjIeUsH5ywv/l1AkHIugjdkUixQz4d9P9HUPig1lQQxFUebV/bc4CISI
         NIXDw4mCtOrOSHNTqxL6sOM2avUDRZ+ke9J9TGut3tg8zFmDzzOQX7IsXfQZfCqgAa
         VLlehUCloXjJg==
Date:   Mon, 30 Nov 2020 18:28:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: linux-next: manual merge of the akpm tree with the arm64 tree
Message-ID: <20201130182840.02a96a67@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qH6fjUvUTJbDbzafN9ywPF+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qH6fjUvUTJbDbzafN9ywPF+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/arm64/kernel/mte.c

between commit:

  e710c29e0177 ("arm64: mte: make the per-task SCTLR_EL1 field usable elsew=
here")

from the arm64 tree and commit:

  44a7127eb3a4 ("arm64: mte: add in-kernel MTE helpers")

from the akpm tree.

I fixed it up (the former just removed some of the context for what the
latter added) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/qH6fjUvUTJbDbzafN9ywPF+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/EnygACgkQAVBC80lX
0GzwVwf+MxQSiu/KDppEYRVrwL21mxBd+jx48O4YRhrXX5JeVNgdUW+5qZ2lNl9f
tO2UIQ7IT/sBiG8wj70Km/iZa+J23oi6f4fW7ytfqqoSHUKAIUd9yo82sVHD54rv
CrmGk1/RVaM1JlE8pDLidHk8NO0pDYmjTwRUJzsSjXVBJYZcvV4uuE7I/CRQ0K/y
d5jIdc26GYJi95aMaSwO/b294oP9tVBTlc/IV5WluWs4o3jg1pu8xMedMjbiTeBh
CGYgR8FbWYRZoz2E8qaM2M3Qg0+h+9CHDndz1+BO5ZAz0uW8P/90mZI6gv1pWLRz
XlXGeCjHeRCWF6dizr+w5/k0pnAMYg==
=b5V/
-----END PGP SIGNATURE-----

--Sig_/qH6fjUvUTJbDbzafN9ywPF+--
