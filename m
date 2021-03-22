Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36C834513C
	for <lists+linux-next@lfdr.de>; Mon, 22 Mar 2021 21:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbhCVU6U (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Mar 2021 16:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhCVU6L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Mar 2021 16:58:11 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B526CC061574;
        Mon, 22 Mar 2021 13:58:07 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F46K82F5Tz9sWK;
        Tue, 23 Mar 2021 07:58:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616446684;
        bh=stf9dUonGNZPblUQtB9jmz0xyjCIWPBCu0UCWIn4smY=;
        h=Date:From:To:Cc:Subject:From;
        b=ExNCGuC+JKkFegpSqspS7V5WgjrscBbSvGXRtbJGVQ9xyo1g5+oHJvjZaPmIRcKKR
         BlSv8MJ9kcb91dzGle+6omS+qqwG+pstkWdS+mRlVfs+fVZsxyxZrzou+7o/Dn29T+
         5a91ikRZREiWmdg6Jvx7IUAX7W94tarfOEqEbYxZJPvwNQr8QxTvBQ+l4O+dno3/oT
         vS6zZD0grDkr9cP3PBMOwlZRzJrAjLSa4R6CSWjFPvW31VsYeQAtQGspAgIcZkoDNM
         I9EEpydRgVq4JiZR0oGFpxE3tE6wjR7RicNUxpTdd87TnfrvPDMSOKFhg+FP2fk2au
         vk/xVUmBpNs3w==
Date:   Tue, 23 Mar 2021 07:58:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Souptick Joarder <jrdr.linux@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb tree
Message-ID: <20210323075803.744a5ff9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aK616+QWiXzaHmE6gz=xmxb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aK616+QWiXzaHmE6gz=xmxb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  16a5dcf7fbc2 ("media: atomisp: Fixed error handling path")

Fixes tag

  Fixes: 14a638ab96c5 ("media: atomisp: use pin_user_pages() for memory

has these problem(s):

  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.  Split tags get
mishandles (as has happened here with the second line being moved above
the rest of the tags).

--=20
Cheers,
Stephen Rothwell

--Sig_/aK616+QWiXzaHmE6gz=xmxb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBZBNsACgkQAVBC80lX
0GyU3wf46Wyj93geFmQhEgMUlk+xnVckIjzuDLh3ZajxF+DpPfpP66cCGzRefevr
g3wfnvrkdcP2+0zHFcf7ziQtOphuzOd2Q8/JgXrgHU6dc09rJn8sL9ZrXSqfRb31
XJBpXhmmWedebua9jEU754NhSKcDPLtyIxgdSSJHBHrUccASxscnxC7kX9PAunrC
j+ierf2zLvOgVDoFK/QX2i17FOHvhSpALc0BLgKNKc5BUhNTMOc7NWVM6Qt95lGm
SnBNQagxhNWjkY3K3NerVf9zviYoaeb5+MjGkh3YquYyhELG5TSWMNNH6kEkL8/N
75GEPGyuoN4+BOtmlMu40CB6byqL
=DYas
-----END PGP SIGNATURE-----

--Sig_/aK616+QWiXzaHmE6gz=xmxb--
