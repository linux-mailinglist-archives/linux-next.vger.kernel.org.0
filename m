Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA9914AAF6
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2020 21:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgA0UFb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jan 2020 15:05:31 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55991 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbgA0UFa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jan 2020 15:05:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48612J3Lftz9sNF;
        Tue, 28 Jan 2020 07:05:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580155529;
        bh=GRDhdGLkyuhC4hsPT/blWGuMwhoqg5B88YMWwgUB1ko=;
        h=Date:From:To:Cc:Subject:From;
        b=Dh9CziVwUJ3Xyd88jCzffDSDc5wjJKGN2B76GJMZudPK06+TEnDBfHSnNlDKvZDw8
         weez80xuenbd8JaniuAvz0+YJ6UVMBidLsBARwatgzt0mjdp9sXREAclhuvnQpWzIl
         DvYhOJAakfutL5sbnmoRwsONuyePM4jL9RfTY+iLnS1gX6EyhlXAnDjzc5sPIs2FbF
         N5QTALz/8+l7Dsbs5sTBH7LZq8Q6DkWmDQLhTVr4zoEh7YFL3qkJuIJznQ+hbR7dkm
         +o/CMRh4Q6972lq0pn2AZCsSMKDFsbNrqSJ1CkmpaQSYnkqth3mIuxzXKtuTF4aMs/
         E0t5UbyDB2NNQ==
Date:   Tue, 28 Jan 2020 07:05:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: linux-next: Fixes tag needs some work in the phy-next tree
Message-ID: <20200128070521.129eb07a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kcqlLH+ckCcjM2wMPuNNq4T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kcqlLH+ckCcjM2wMPuNNq4T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  0b96a3349af1 ("dt-bindings: fix compilation error of the example in intel=
,lgm-emmc-phy.yaml")

Fixes tag

  Fixes: 5bc999108025 ("dt-bindings: phy: intel-emmc-phy: Add YAML

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please keep Fixes tags on a single line.

--=20
Cheers,
Stephen Rothwell

--Sig_/kcqlLH+ckCcjM2wMPuNNq4T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4vQoEACgkQAVBC80lX
0Gy5XggAgfWIvPvYhtVI+qiHn5QEmo+rsJC7+W6wuwlJojt80blKGYCy3Wl9Amq8
4ebFwy70aT0StsSbc5sFqslRzFEgTqgusbXOfhoZHRna5+my8aScVofzk6o0sbE9
3DRGXGPsAv2fY2xqlQgcmEqL4bJlC7lDx1oM8lJHs1ntsQelOsXDHz2pFbEIfR9C
B6H6DBqZNAeBz/ZdPkDo6VO4kQ/BQgZHu+6xuLkwXAX7Zg/bRCzvBHfYmbh7Yz97
CXTODQF6BgKUNU3npW6YA+YKE/14L/fNDcJXudJZNfKDa/utfxilFNcPtFDqG+5N
ahyQvsQi5Y1b+HwHFg5/Et51TsbqeA==
=3Eo0
-----END PGP SIGNATURE-----

--Sig_/kcqlLH+ckCcjM2wMPuNNq4T--
