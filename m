Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A1B20BD07
	for <lists+linux-next@lfdr.de>; Sat, 27 Jun 2020 01:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgFZXIp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Jun 2020 19:08:45 -0400
Received: from ozlabs.org ([203.11.71.1]:50957 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725883AbgFZXIp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 26 Jun 2020 19:08:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49tsy31qR7z9sRW;
        Sat, 27 Jun 2020 09:08:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593212923;
        bh=D1zmuugj8bJbgnw+BA9XuZwmxXaf0l1iLnEjTRKpwI4=;
        h=Date:From:To:Cc:Subject:From;
        b=UkdT4exPlwBqPvawUmWGe/Qo3r4WZA9ZaQZpwovoT931BIGP7MwIMktoULhTgSAEb
         ar8jbdpKJ6aHybyQVBA5XfMcl4GdNLdfk2d1HOV2fOw9RItoK0YaMEy6IG8Fu/yGKC
         XpyqSpiy2aUxUeRmuxnbNSGWFjvaKtV00aEWNZW/Dj+Ix0Y43u4L40ESw8eOjxC/4R
         ZCFyhQJRelrmy3rXoBlaQMgxX6vhX61EZWQ/UfXwmBHg+dOeRxu8jiypBFlB6rCxh0
         Db4BoIeLTJ1UgNLG18bpkR+hJL/DueGIsNf4CMFuL4/zso08w8/7mWkAJpmrMzochA
         /EkwwOyu9tSew==
Date:   Sat, 27 Jun 2020 09:08:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20200627090842.5e1fba40@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A5NGzbXbJ.H9EpYLzTIaYaM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A5NGzbXbJ.H9EpYLzTIaYaM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  d3cac64c498c ("io_uring: fix NULL-mm for linked reqs")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/A5NGzbXbJ.H9EpYLzTIaYaM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl72f/oACgkQAVBC80lX
0GzTFwf/WlBtaZ7yYkF/Q/WPBSKwOoBOxuDPB4OuokMddT7nPkgfv2/gIzp6B1rA
y0ZYJkLMTlk4aWfcL8qji7YssDrzhEjPShTtqye7R1bcz8cl5ULC0xnoF7QHT8N/
1/d9cIq0XAHbH/FnYV8cDvxnuh+CV3zKcSL5XENDeTgXsAf5psOyPifi9ISrYhhN
281N16Yzt/SjAgoNX5q1eNIsatsm6D5QIVOerBn6y7DkX+eXfOzk8CIb4EZoVBox
PoyhqVk2d1s85NW/9enA+sqWXhi9SQq0WiO2CspzvrOV7EXx8GYfyFbDZ4e85vB6
VLC7v3OPJmjIlNLNkaRI21gmKyaGJA==
=zvbW
-----END PGP SIGNATURE-----

--Sig_/A5NGzbXbJ.H9EpYLzTIaYaM--
