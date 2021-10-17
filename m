Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02E04430C42
	for <lists+linux-next@lfdr.de>; Sun, 17 Oct 2021 23:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232986AbhJQVNr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Oct 2021 17:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233114AbhJQVNr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 17 Oct 2021 17:13:47 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87967C06161C;
        Sun, 17 Oct 2021 14:11:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXXk86Qhyz4xbT;
        Mon, 18 Oct 2021 08:11:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634505089;
        bh=IDZ1rGsNAl9rVJkIt7ZZD08JvArmJxHx58roQ3GFSeg=;
        h=Date:From:To:Cc:Subject:From;
        b=JK3X3KHLQ6i0t1FQ9IOgqdeGda09C+dJrgrp5RtK4df1Oik19e6Luz3ZY+ptk0H1m
         4e7w8NbxR5atZJt28CDSMAnujsgXOzaED3AFAvP0Aq3x+Ry+qsYG4yuot5F5hLAmv0
         6eEGFa9xOUokm53KOUUFP/qSbVWLhiMCdNVSc2FBLcSrAaweNX1GsKbp94q9JXZUy2
         Zup6LVMQ/l7j4ppytPX1DYJm0DsR5Sk2uLp/cc15T/kCMBhUHNE36vRWDjwCPK/622
         2ByZwT0Panm3QDDVJy2AIcDHPtkbE8qpY5Qea7ybp8xXt0zdxiU3UXdC7TjwpRKt5i
         AUxjSXXKzUH9A==
Date:   Mon, 18 Oct 2021 08:11:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jassi Brar <jaswinder.singh@linaro.org>
Cc:     Fei Shao <fshao@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mailbox tree
Message-ID: <20211018081127.1f669984@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HNu_mtUgZ3GSjbhB9DnBKtz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HNu_mtUgZ3GSjbhB9DnBKtz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  0ff9a987584f ("mailbox: mtk-cmdq: Fix local clock ID usage")

Fixes tag

  Fixes: 85dfdbfc13ea ("mailbox: cmdq: add multi-gce clocks support for

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  a657b4ba4fd9 ("mailbox: mtk-cmdq: Validate alias_id on probe")

Fixes tag

  Fixes: 85dfdbfc13ea ("mailbox: cmdq: add multi-gce clocks support for

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/HNu_mtUgZ3GSjbhB9DnBKtz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFskX8ACgkQAVBC80lX
0Gyi9Qf/fmxxosIcC/zR0Xu2Amy7qh2RvGuLu834bozJWhCC8wnbN1Nz0Rl5DCc3
xR5MLOwMiUymiHsrDSvfI+UNbcBkFl1bCbB7TDx+Wg+JZEf35ZWyScOfYqHt+1Y6
Pa0hDPVACzU9Qgo28GJRx+KBE5iRcK3x5FrQOIbr2XXoczoJATwTil+hqrD5aI1s
+hwJDckfbyJ9tSVcULEgm2n+xgonJYprfv/9y85qNh5bcC6tMBqBj88G42GhKVca
rizynhEMK9WGOewLJdVKUJYlGRykUKAl61XAZObOYHCPWylKiAZpD9hEO3ode2R6
X/3HOw2iHFPfst143fi5xGXz2gTBsA==
=svVY
-----END PGP SIGNATURE-----

--Sig_/HNu_mtUgZ3GSjbhB9DnBKtz--
