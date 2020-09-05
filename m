Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F115225E50A
	for <lists+linux-next@lfdr.de>; Sat,  5 Sep 2020 04:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgIECSl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Sep 2020 22:18:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52747 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbgIECSk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 4 Sep 2020 22:18:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bjyrs6MPBz9sTd;
        Sat,  5 Sep 2020 12:18:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599272318;
        bh=9xTsIfpKFrJK+6CcxEyuNQq1X6wX2Zpz7mBvSHpJa+8=;
        h=Date:From:To:Cc:Subject:From;
        b=VdmgoSgtUsgcWLKyiYYKApVHPr/bIRN65VNzEem2NeVLSA7ukGRyegsoKXkfhXhLt
         pbB+dOELBVrNaJEO6SSMGtfK3iFV8VR9P2L/FNAaZJa8ox9AVw3bbkJfvmw3+wUWfZ
         tZp43Pgbd4o5Y2xWvsR+nkj0sZVLjrakm/r2rHPzrWIHO2bdBTfbe/ZQyHqRFc8rRN
         CdQff9khtMiBSdsLdrTRZsBTPiZHaGRnKmqrYB21aCA+ti3A1OMc7zWvHxvKmt1n3p
         GJlgpdKbv3LUAJamiI9psws7eWXA/lsPoYguOSAgiwdCntDZcTcIknZzlmXmsnRnZp
         1yg/SvLjlxurw==
Date:   Sat, 5 Sep 2020 12:18:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the printk tree
Message-ID: <20200905121827.22fb4037@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ae+uAE5g57V.AWQ6ZTLbzem";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ae+uAE5g57V.AWQ6ZTLbzem
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  4c31ead75f41 ("printk: ringbuffer: support dataless records")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/ae+uAE5g57V.AWQ6ZTLbzem
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9S9XMACgkQAVBC80lX
0GyeBggAhLs/myYpmuJulQz/QfTiSizT5ROEVYr/pPbLXIPC3kAaxTd0W2LEbMSq
NkUv56TOlT9yDDRkOolzPPXximDk9vXQp3z78T+Ie6KNMVIjOg3U/j7XjJ5gRIBl
iJF4aaU3E8qLmdp8cbs+n+FECX8tpWqV5ELARmaFn71LVztmhxmNuW0xz3u7ILw5
z73omK6fHSA+N/6+15A8GtmwMChlgArTOphefH9g3IbixJtIMqjZtu8x5cfUXZmn
7GHf3HFvLkUcr8u7sjjJY2AWoBg3dSyDlM/ZQ4wV8e8V1ZvdHT1BkGckuZOLdg5H
daDdAwvI/S8MA0muShAO6nVqLMo9bQ==
=cz9H
-----END PGP SIGNATURE-----

--Sig_/ae+uAE5g57V.AWQ6ZTLbzem--
