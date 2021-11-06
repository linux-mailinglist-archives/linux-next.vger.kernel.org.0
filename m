Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24D92446C22
	for <lists+linux-next@lfdr.de>; Sat,  6 Nov 2021 03:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhKFDBn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Nov 2021 23:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbhKFDBm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Nov 2021 23:01:42 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3036BC061570;
        Fri,  5 Nov 2021 19:59:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HmMXH50d4z4xcG;
        Sat,  6 Nov 2021 13:58:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636167536;
        bh=ZIPdHpDZyV3DQoZHd7BxpbjbtGyh8Bai0u4etKPEdQU=;
        h=Date:From:To:Cc:Subject:From;
        b=BD21KIJE/tPZ1xYYXG3pTWVStLIqal75TUdvcVOkfCG9pQQBUZjSGIQCc4WXaihzN
         gK5bzdClEPFc2ms6qHMfkYxf8QTsOB/CK12CSbgzt7see0Vq6ykrWJb7Xsm88zvZHu
         CGARJapv57pcGL9bF4vki3FzybpLanqySpw2ODLvvy2lHYzVAbx1itCkSp8pEuFpTA
         237MQZ2yVR4DP7lO+JjNpZMvAGNi+FnPIpEmEP6Gb9X2BOPN5aTu8mSozrEHAxsr9G
         rDMQT4xQ7zTKKGBczb3+cpwfOrFZfjcuOjOKxA5P9xjQiarbgWR10vH2VnU9Orlzfv
         QQJ2k/gMENsPw==
Date:   Sat, 6 Nov 2021 13:58:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Subject: linux-next: Tree for Nov 6
Message-ID: <20211106135836.35dcbcdf@elm.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z46DJR0mSgfNZmHl11Sfy6=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/z46DJR0mSgfNZmHl11Sfy6=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20211105:

I was informed that there is a potential corrupter bug in the block
tree included in next-20211105, so this release is just that one with
the block tree code reverted.  I have also replaced the next-20211105
tag with DONT-USE-next-20211105 and removed the incremental patch.

Hopefully this has not caused anyone more than the usual grief.

--=20
Cheers,
Stephen Rothwell

--Sig_/z46DJR0mSgfNZmHl11Sfy6=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGF724ACgkQAVBC80lX
0Gyu8wf+JFL1/1aG411xTRVX12zh2O4BVauUGYKZ5ur6foomIXjFCjYM+b3QVBDM
SamwMarTl/ywLiFhmz4EglInXppAb3v8Ay43J6KAH7DrdbktzxFmVcebwb/hUblO
PIV9xT/TSO7t5vKoYwDnAIKlrRpKCrKfZZWNePKm5fJS/btPnJ0bBbZrKGYPeu4p
7j5SteqpeJb5EfjyhVdnLDnt8nHza9HKMZC229WZcnUU80hsZuRJfqFhPQ+iB4mb
/Q2U5EHYlEIkByzsdZHSXQKT1BamCXUxkxZLSl1FTAkWdHjOSXHXAIPtn/TPyDCs
g9tDev/+ploqpkB02EYZtRdJg8LVig==
=okh+
-----END PGP SIGNATURE-----

--Sig_/z46DJR0mSgfNZmHl11Sfy6=--
