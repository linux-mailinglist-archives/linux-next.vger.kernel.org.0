Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D76B9AEDED
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2019 16:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732797AbfIJO55 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Sep 2019 10:57:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60729 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731464AbfIJO55 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Sep 2019 10:57:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46SSnW13P4z9s00;
        Wed, 11 Sep 2019 00:57:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568127474;
        bh=CzzYK7LmIfqYSITSVn4Qe5K5GimeLxwYyKauahEi5lA=;
        h=Date:From:To:Cc:Subject:From;
        b=ctYf5MQ0+dZbSVyko67G6AZmdJLPmqXqgHfzwEAvZtTyT6weCdtQ88IULtjkymQRd
         f/mA+75b0JuIFkMBfBYsWNKIKQ3OqsSYW8L3nH7GOTw/6jp/ORRWxaZ8C6malTgItM
         kIJ1EopOpyNAgw0+Jf90zWMSrhIWrHUoDB7ARpJFQgkVOXeGyp9F0aqlaUwOi95n/1
         2GBdGOpjhEXkZbOOBPVpPFlYXi3O1+PIi8e8rs4cqprpQBapAM91vP2mnS5h/DkGfk
         306igNm/iTYm7FQe5D2SG+Z7V7HC0pDbiQ6F6G3TppawCEQvUcUUFIWaEZplASEV/F
         93/I3opaNtQAA==
Date:   Wed, 11 Sep 2019 00:57:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jackie Liu <liuyun01@kylinos.cn>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20190911005749.74fff98e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KaBVzwNGjJc.aoDM_sHElhC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KaBVzwNGjJc.aoDM_sHElhC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8776f3fa15a5 ("io_uring: fix wrong sequence setting logic")

Fixes tag

  Fixes: de0617e4671 ("io_uring: add support for marking commands as draini=
ng")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/KaBVzwNGjJc.aoDM_sHElhC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl13ue0ACgkQAVBC80lX
0GzZewgAnkOJtHiIvPue6AKCMTOc73Wq1C8NUsC89FpDD0LTF4ND4h/tsEgPVzx2
bX0iZtB7gVVbGL3tYbxdIkjWoLhbbnl+dekyFInBxTTZW7W0Jv2qMKk+FMniwhk8
RAG983rcYyjb8F5RFAjMoCNO4RlaEwSDnt9Mt6XXoG+jBJDuXnWCR9fac4YuDgoN
123a8txQm2LzEv+Q0HORuy9SPaZgxf9Rj4v7QIDoEwutxjI3Zk5eoSd3hWgdrVYa
NFGf4nZcSxoR6HUXqL+/0S+I7/OFP8XayunzUiZL3uBEXtdMaqWDzyr+1fvxOEuU
Hi49misjI4W1s6dbQKU7f/GoY4v9NA==
=sk0+
-----END PGP SIGNATURE-----

--Sig_/KaBVzwNGjJc.aoDM_sHElhC--
