Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83BB32DE0E
	for <lists+linux-next@lfdr.de>; Fri,  5 Mar 2021 00:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbhCDXwq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 18:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbhCDXwq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Mar 2021 18:52:46 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F72C061574;
        Thu,  4 Mar 2021 15:52:45 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ds72w53ghz9sRR;
        Fri,  5 Mar 2021 10:52:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614901962;
        bh=bNffpLVDpps/kOIp14nDznUZTPEd2xiR/OXEqWuSeQk=;
        h=Date:From:To:Cc:Subject:From;
        b=UaV45GePCesTS45KE0oE/8b/ngd3ScBL+yxuKfpHkB/OcU5VgO3MQgdHRi9xbsoLs
         l1BdP1d14iDG30TVstJRa18rdGULa3nHTYTWAZ+heGxAbZNNydYRd4bg/uiQOdwika
         Ug2p1EQIDM8wZzL1ZT4fHWfX9HJO7VEZm34Z4E26vsi/fsmVbSIXrtPgHI8LbkF+MZ
         iUEkbCQ9y+g0VLNTFJhb+UKenW51cAgCW1sY4o9V/NuEKrqUT9Ge4QPtNPX58q1EsG
         0Gtku5GNGQ5EV8AKdLoYFbt7PElteSWId4Y0oqNkrNLjQ7/1R3Ch9gHSa1bLhJc1V6
         DpBZyYtUw0PoQ==
Date:   Fri, 5 Mar 2021 10:52:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Daniel Wagner <dwagner@suse.de>, Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20210305105239.377577b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CCjWRInJC51MwsxRC4xBDm_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CCjWRInJC51MwsxRC4xBDm_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  284e4cdb0c0b ("nvme-hwmon: Return error code when registration fails")

Fixes tag

  Fixes: ec420cdcfab4 ("nvme/hwmon: rework to avoid devm allocation")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: ed7770f66286 ("nvme-hwmon: rework to avoid devm allocation")

--=20
Cheers,
Stephen Rothwell

--Sig_/CCjWRInJC51MwsxRC4xBDm_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBBcscACgkQAVBC80lX
0Gwyxwf9FKLDYUOHkAMABBu66jz1mAIwuYRNJlWQObBFAQWdT7t0sjCUcg6ghE+f
9KJkkXEZdtllhJDOMCbutUh2UcJg2SOP3nO0CtTsbkG3lzLMC+ZxT48i7nYWnDuu
FDsFW1mtFGdncCJCbkp79dMRCXJ7JvjwN7aQ9tN885zSuRfOEpOYgmoJIKRlMn2e
W/ueoNEESfM1d1OZAgmWUqsvnz9zbqUCjg60XzyIgYBZMUiXJoN21tMp4LqDZtkv
8xOE0QKfAacWP8gj+epa8/0FU3R6K24qDv7ED4bcJbV4IX70uvRBJe9YAGzKX+L0
nozkzVGHnegN5xMTZ6EVOgZJoePtaA==
=m1Wg
-----END PGP SIGNATURE-----

--Sig_/CCjWRInJC51MwsxRC4xBDm_--
