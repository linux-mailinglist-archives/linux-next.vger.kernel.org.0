Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5ECDF2032
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 21:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732167AbfKFU5E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 15:57:04 -0500
Received: from ozlabs.org ([203.11.71.1]:59531 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732639AbfKFU5D (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Nov 2019 15:57:03 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 477f3c4PfJz9sPL;
        Thu,  7 Nov 2019 07:57:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573073820;
        bh=r2WDuU2hTMAjHdwFRBiisdoThjuRRn8Tzsv998zA1S0=;
        h=Date:From:To:Cc:Subject:From;
        b=GNUQO1RZBNFvexq4YWF2dZK1G5vev9lbqKFawxu5B/kqof7YK+oeWdnkrf5hf3gpi
         AnfQ9Fohp3+S8/BcrjS1qx8Be92vb6Ay3rMktqlSVA31qxCE8yz3evD9f1QGfKOflm
         assjo9xrqRjjEdDn5AXl5kOLh5VAtcAn8//FDUn6qvIglfKz1iv5a2hu6g07kWBegs
         z/TDSj7pE92RP80fL9QsECq7ZH3T6oisiXwg0IBh7kkaMlyjQfDeiYKVAHPvpFz2MZ
         Ql98gIWepD/9t798wV/2EU0y34b97UlZ3YYmkVkM5C1vSK4BJzuE1tcfwdA7/zoMOX
         h+q5OGbyiVpdQ==
Date:   Thu, 7 Nov 2019 07:56:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Gerecke <killertofu@gmail.com>
Subject: linux-next: Fixes tag needs some work in the hid tree
Message-ID: <20191107075655.5a98df97@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MIK31HDQKP+fi4fCu3v/fT=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MIK31HDQKP+fi4fCu3v/fT=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ff479731c385 ("HID: wacom: generic: Treat serial number and related field=
s as unsigned")

Fixes tag

  Fixes: f85c9dc678 ("HID: wacom: generic: Support tool ID and additional t=
ool types")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/MIK31HDQKP+fi4fCu3v/fT=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3DM5cACgkQAVBC80lX
0GyEsgf/bf+UliNfbw+nTtT7SICIMQXHq9m8v3mh1Mfox67LXy9D273xt5BTy0oV
FTrnLtReUStdU8EbmWBEn3LBz9aUmG/G14hqKU8DoVX1BVUmx5k6PkDoRC1Q5KMF
QeL1mtRuB3YYaDBfU/8uY7LzHdHD4oHdX9vOPqX1Y+aNEbVO0Td7U6apJyBr/S9o
Po/s+714v0ETkiOkt63e47iBPSzjwYk0fcg9wgf0WdoEBRxmQdjkwjQclv5Ha/zZ
repCGJiN385F+8Cbm9nXQHi1lUPkeNwLeHNoi6yr4twVXPhSgwuAJ2XBHKkZGgm5
cyYgpYDA5Th7a77xZWEJne9xqnP8ng==
=QB49
-----END PGP SIGNATURE-----

--Sig_/MIK31HDQKP+fi4fCu3v/fT=--
