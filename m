Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6141DDA2A
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 00:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730381AbgEUWYi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 May 2020 18:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730041AbgEUWYi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 May 2020 18:24:38 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2FEC061A0E;
        Thu, 21 May 2020 15:24:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Skgk2cYmz9sSw;
        Fri, 22 May 2020 08:24:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590099875;
        bh=7UG/0ck8m7LjoDlF4HVoIgucDjHFyP6zo05vApL+ymM=;
        h=Date:From:To:Cc:Subject:From;
        b=UEzQ5pIW5hUBmYnQCDpFUASjTsqHKabf9U/6Nx5IWSdHTkMpO67dfECTdKmBVljCO
         NyPtIpYtadOP58GB0yMMmHTXzN6HOi4pwoxMqzRP6kVoTp1E8y8+5zg5IbsOyLxAfz
         BucriDS51z7VQdOlDmxreYQ6CiRNgGNk9l7VPo4m4MmNiKdC82h9EBFLo6wT6knLh6
         KQUsANFtf+bYGSPLdptdOwghrG7DrvA/uppgbkCjf94dKViUyn7bLqlwZsWRTnbFj6
         FUARyHhkUuw8eNbk5W9epOS87MwgOyqIHJGtnOFj9qoYGez8yVvoVGYpsMLU6b3OOa
         C6MZ68mzNS21Q==
Date:   Fri, 22 May 2020 08:24:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20200522082433.4f536de1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IvXSHzRHLZYRGpsc1AlupoL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IvXSHzRHLZYRGpsc1AlupoL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  82ab9b6705bd ("dt-bindings: arm: Add Akebi96 board support")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/IvXSHzRHLZYRGpsc1AlupoL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7G/6EACgkQAVBC80lX
0GxLaAf9EWgzgWFYzJys9wwd6evMVEzq283JeOvE9oecgCbCYioxmpjTBx9fMt4x
Z+txmXMofZYtQbVYxzYPrPXu5+dVZvAkszA34JxycWg7ZBeKDnoo/voKTiMujp2x
7FR8GLWERnDKWormbLGFwuiRZ80ecScswc59xURYFc3RbVmh/qmiDhaOLpSaPv4P
r0tSlgx0RHYIpOHxYx1l2Ca5bloHeLUDQkgjWSEbRrH7Ip8tcAeVHJE2LqUnoOzv
0mChkGynxqxyhetQiV7eDNPMUqMMfLfMWa2xkh0Z1PXw0NnGC4h9Q75ipkoM+L7S
NaUNKYM/br5U7F0qHVCEBzXIS6SSYg==
=ow/L
-----END PGP SIGNATURE-----

--Sig_/IvXSHzRHLZYRGpsc1AlupoL--
