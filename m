Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF3F33FF7B
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 07:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhCRGYj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 02:24:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34619 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229743AbhCRGYW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Mar 2021 02:24:22 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F1H6q4jDTz9sW5;
        Thu, 18 Mar 2021 17:24:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616048661;
        bh=RbhtW8WPKPBqkshU+FVlRuoPeEEOnOrT/u0YWwzIOQA=;
        h=Date:From:To:Cc:Subject:From;
        b=Im1uYSpvOmH41xUd+wQd8YMvRamLnCMoGG88xjGFYnS/iovoqMJrTos43eViDrQvp
         Q6AJ0fFlboPH5zhldcbVgHa7ItL+QRccVBLAhuZdVirBp6N82pKA0gq95i6M02AKUF
         ax/TZfQBn3TpJntQsGK//P2Ky5iuXY4/X2+suz6okWIiHp7Pqul32LB7oKtorf+2R0
         kX4/1cXKVbwqfczw0VOnXeiKdixkhs9+NoMzqXN29ywzgQsXJNbISGeCvOKhjwcSEp
         ZEYqBkmVO718YIL2pnfF7rF/oLUMtYiKwX15IlIrl5ocWYqmL/lpuRhMJi/Cc3N9Xj
         AguBCdNE308RA==
Date:   Thu, 18 Mar 2021 17:24:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the rust tree
Message-ID: <20210318172418.1438800c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v7+.hx1TXIijFVVH1SVoyYS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/v7+.hx1TXIijFVVH1SVoyYS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/rust/coding.rst:24: WARNING: Unexpected indentation.

Introduced by commit

  c77c8025525c ("Rust support")

--=20
Cheers,
Stephen Rothwell

--Sig_/v7+.hx1TXIijFVVH1SVoyYS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBS8hIACgkQAVBC80lX
0Gy6+Qf9EZKQReyvspHdaIe5UFPYp9t6IC3C14Uoy6GfdMw/a2JVsnCWMFCsls6K
Owr9W67BSFRmfjNVmqMqgVnpJ7KQtnRtzn+lj6mGA984wrapA2SOTxOwfdXMxtrM
yA8InuCqY29BcdjQOua7s3Iipio4r1MVd/ZL9e11t8w7J0Itsw/IMKid+j36+h8+
wLN17lhz3nANIvgkuXlgaSymebbFtxorCykTswHcwC0K5rh/VSq8XXBQwHwpHwbp
rEaLLR2T4Fqq/t3FNLDCTD3ixSVcVHXR2owt8KVFcqtLyv1MTIBM8enAmAD13OG7
dIOt7jP3AQ55cIoLWsVZjk9QrkXP2Q==
=Y1MI
-----END PGP SIGNATURE-----

--Sig_/v7+.hx1TXIijFVVH1SVoyYS--
