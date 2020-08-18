Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70A9F248352
	for <lists+linux-next@lfdr.de>; Tue, 18 Aug 2020 12:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgHRKsI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Aug 2020 06:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgHRKsI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Aug 2020 06:48:08 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD4AC061389;
        Tue, 18 Aug 2020 03:48:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BW70y2TJ2z9sPC;
        Tue, 18 Aug 2020 20:48:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597747682;
        bh=3kIXGotFaP4a+86oeoeZVflcMriWduQ4QxOHceZ7zjU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BFDo4pYzlA9vBlvXuAXLv9csKx7A/l3dFaYJVS2cyXxudz7rbbVoE0nquTZqTeZAZ
         1nAhdspfGIxp3gk1331GG+PI33+VXYHL0O74QyKpX988IE+ZjVRDW6kYWHRXAPdxWj
         tAvetSgYdicBkHtACRvKj5uZOYVrGNxod0CClFZcGLrIaoRuQz1orDMDZ6S66mvXFV
         EMxyn+u3WvaW6433x/oAazRqUHoi+QjEBPq8WxJ3vTp8wyDIC8ADroH6HEfZJwY98/
         UkRhrnnQTjy3AzmpYIV5VmW57oQfJKo1sVRglth3vPHnJy/cWKEN1J4JT4uBHH520y
         2Pk24MKl05izw==
Date:   Tue, 18 Aug 2020 20:48:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fsinfo tree with the kbuid tree
Message-ID: <20200818204800.1bce48de@canb.auug.org.au>
In-Reply-To: <2193240.1597738758@warthog.procyon.org.uk>
References: <20200817090523.68692855@canb.auug.org.au>
        <20200805163246.4df09c31@canb.auug.org.au>
        <2193240.1597738758@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sqADU2uWxS3SxU9/mwkWD03";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sqADU2uWxS3SxU9/mwkWD03
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, 18 Aug 2020 09:19:18 +0100 David Howells <dhowells@redhat.com> wrot=
e:
>
> Please drop the fsinfo branch for now, thanks.

OK, done.  What about the notifications tree?  (not pushing, just wondering)

--=20
Cheers,
Stephen Rothwell

--Sig_/sqADU2uWxS3SxU9/mwkWD03
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl87seAACgkQAVBC80lX
0Gyspwf/aF4pNeP+57KWhzJY3U6hyq66BzJ5CkYOZLArAuxTt2dHtaDo76piyU3i
z+gnixLss6qbQlhdEj+7OVI9GKVrQHGftVN8Oqt78y9G0/a7sOiKMpEECOeAz8f5
y4gFno0uI+NINb/qJ7KRYWJnOJMbdEDVAtHJhOZSES3PKK5WzmUZjLuRzNQ2pDI1
JAVcuvR5TG+SxOM93J6xKl03b1LugJ1a+vmCzaSv2XPKSF3TVfR8syTat28NEXYp
szYfS2kkvLysuhR2MMMHo++YQKIRyVvawQKXgdo1XO4Yw0SXUNHLf1FAHnjMmpdt
g2bM5/Bi8ecCrXvOh6nfTCjLE6J+IQ==
=8TTh
-----END PGP SIGNATURE-----

--Sig_/sqADU2uWxS3SxU9/mwkWD03--
