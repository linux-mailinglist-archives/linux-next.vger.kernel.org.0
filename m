Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57A01426385
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 06:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbhJHEFo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 00:05:44 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:44241 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233620AbhJHEFo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 00:05:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQZLX1R5pz4xbZ;
        Fri,  8 Oct 2021 15:03:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633665828;
        bh=7GfZ3oR8Hg3rqnjlGuP/hPSt8H5/JA8z6SNwXIPVgqA=;
        h=Date:From:To:Cc:Subject:From;
        b=SbphkXQ3cUeWF7q7C97SS7VpngaTtKfnt/L6AOCwfn4wiyqfPyEw50Cm0efw5XrvC
         ii3cfTT8SOYLigtUTHYpvzCXzkm6TxTFQNfd2BnYQI/+XV36kOMzYyjW8jwGT+BaoY
         Jl4OYNaG8Y8hyjX0TKpLMm2aZVpQ8ECAENNm7W4bcgLMXf7JE6AAWipFxkF5ZN9QDh
         O9WXnnm8hWZFxzLdWkD0KD1nocOxKI8MQvvQVIienWoiD63e7zAf15db8g4jGY2pBz
         bgqzPq0Yi42Onut5qfDg6+pY93OvrOf21HUDoOimdjxbYbx65Kloi+NqRXnD/CMudC
         BCJhpKrNaGzQA==
Date:   Fri, 8 Oct 2021 15:03:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Qu Wenruo <wqu@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the btrfs tree
Message-ID: <20211008150346.557cf8aa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KyrCuPJdHBa/x7PBCivpPLZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KyrCuPJdHBa/x7PBCivpPLZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the btrfs tree, today's linux-next build (nds32 allyesconfig
nds32le-gcc8) failed like this:

nds32le-linux-ld: fs/btrfs/lzo.o: in function `lzo_compress_pages':
(.text+0x226): undefined reference to `__umoddi3'
nds32le-linux-ld: (.text+0x22a): undefined reference to `__umoddi3'
nds32le-linux-ld: (.text+0x660): undefined reference to `__umoddi3'
nds32le-linux-ld: (.text+0x664): undefined reference to `__umoddi3'

Probably Caused by commit

  0078783c7089 ("btrfs: rework lzo_compress_pages() to make it subpage comp=
atible")

This caused build failures in several other 32 bit architecture builds.

--=20
Cheers,
Stephen Rothwell

--Sig_/KyrCuPJdHBa/x7PBCivpPLZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFfwyIACgkQAVBC80lX
0Gy5fgf+N29+AHmTBqzdBoFda8ntpVskw/LWyUq0QsjmPYjDe3hNn7Jyojs0+REp
RoDq4MjrrJ4WhnQxjCMh1nXuk3Yqq24SDsAvQ+3hMKNImRqIfH1hScmk5GRpMK9W
KhN/y4Q7MNXrTKfAIV8DJE54Nnp8lZUgfUP4NtY1eGRhxJ4rXXG3+TF7p0g+SYTk
XWrT+mPQy4VeRnQs03/6VzZmlBg9Rh80AbyY4nqXSlfg7dI7RXx6nK02Qk+WwkwS
SsYMr9ZwCzTiAZjN8Bi2eipBe8yv/fwgWtX0qcHhRn2CQJP7734OPCogN1SaU2sy
+wLfZKSM8mBHO9BAl/nDzhsRdkgU7Q==
=+mF9
-----END PGP SIGNATURE-----

--Sig_/KyrCuPJdHBa/x7PBCivpPLZ--
