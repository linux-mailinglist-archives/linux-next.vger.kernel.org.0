Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 203932026F5
	for <lists+linux-next@lfdr.de>; Sat, 20 Jun 2020 23:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729060AbgFTVvb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 20 Jun 2020 17:51:31 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47271 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729032AbgFTVvb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 20 Jun 2020 17:51:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49q8Wd17cLz9sSJ;
        Sun, 21 Jun 2020 07:51:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592689886;
        bh=lp2YLoz0HcKnI9cbv52h/rCbKQ1p8wvheB9uMtKnLtw=;
        h=Date:From:To:Cc:Subject:From;
        b=VvOBUm0B9jR/lreC+h/jD3Z7xfZ+3AUbs260A5g/RGgljv2Vjjj86k6MZJVckI0Jd
         fIrT0817PuOvlW1CNGZ1wx4LTny1My7UngCqkfw2Di6iRztjnJnDx6sCMGgZ7y/TnV
         VdZNCcQr64on7CW7hRRkeqobnKh5cT907kmOboIe3jaM5/b4vkEG4fPx3L8cVTOc1N
         odnlx2n8GZEnBSNSsT2gxd6Zrc8i81F0NLDgYfJFP/nB5jtSFJ+lxNqGMeVzpiecpf
         KNERTuyZ9B21dcmPUiDzkOLN7vmGSSLdBLoQ1Vg39PsEc/gKFplKy1cWJmDG9dgS8f
         e4X3YcBLjrmEA==
Date:   Sun, 21 Jun 2020 07:51:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Cristian Klein <cristian.klein@elastisys.com>
Subject: linux-next: Signed-off-by missing for commit in the hid tree
Message-ID: <20200621075124.206aeeea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/al7A5AVa8vAZ+zkOOq598rQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/al7A5AVa8vAZ+zkOOq598rQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  470376737e88 ("HID: allow building hid.ko as an external module")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/al7A5AVa8vAZ+zkOOq598rQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7uhNwACgkQAVBC80lX
0GxnHgf/dRVF4oa+klgMTItbkfDYp6Sy7gPIW7itrW7d2TVXqd72ktXk40eTaK5l
eLl8RWKdzzcJ8MGtxC8OSfZDCQ8Qi0TvuFMXuUprPOc9TvxOinS+rY/T0o3j2xTw
Bl8dYZZK6qURPpBhXa9YZZphvtwVMyuVeWqlgtgyS/FyJhEfnwymsNC8njw6hmLq
Stsg0GDJ5cN5Lv+yxg1GIw+T7rowkLn+JLpAVJOwiip7rg4lbF2B3mfCAjqwGh+g
qHs/aNSoUNkBVXLe3UOGu3OBG6Gl0gtC2isbk9zk18OjyANSiTzmtSO+vjGNQTuc
Kl0A4ez8LeecwTm0ahtFBiNG/5KL7w==
=jds/
-----END PGP SIGNATURE-----

--Sig_/al7A5AVa8vAZ+zkOOq598rQ--
