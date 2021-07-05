Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF2F3BC434
	for <lists+linux-next@lfdr.de>; Tue,  6 Jul 2021 01:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhGEXtI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Jul 2021 19:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhGEXtI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Jul 2021 19:49:08 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DF2C061574;
        Mon,  5 Jul 2021 16:46:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GJj500wWkz9sX1;
        Tue,  6 Jul 2021 09:46:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625528788;
        bh=wmWd1VZlMZwRnKCJ6AG4dUj/B89WdHArR5PIxOk1Uro=;
        h=Date:From:To:Cc:Subject:From;
        b=HBDcguEnFIWDhNVlN3PT+G0qo5fcJy+HqlYZE2fD61HmnwlYMTWPXG3kfGk0hZzrA
         pevktC2/z4N7m/9+/t9Yksd2qEoswXS2zrRkICMJW+p/HeNTZane5AbLnV4LODPFBv
         9C1x//4wsCbfC0w/02fQrdBklNjnM++qvmquwR7EBEhBwivuBL0gEoLqoD09jeotg/
         QOJWZwYLkhPzKWM6habnX1g8iDr99j04CJHfEDc27E1oDVE6/H+Gjlzjk0ew3dc7qD
         272qsecKx3AV2R7Spp4kZeu53lipyK1Ykw2ce8ww4dhXAC1pzv3JMx42OR0Ni577lf
         nPKMK5Use+/Bg==
Date:   Tue, 6 Jul 2021 09:46:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ext4 tree
Message-ID: <20210706094627.1ebe4b98@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+iMMvQkNAcYHEs+Owpy=O5R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+iMMvQkNAcYHEs+Owpy=O5R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ext4 tree, today's linux-next build (KCONFIG_NAME)
produced this warning:

fs/ext4/mmp.c: In function 'kmmpd':
fs/ext4/mmp.c:247:1: warning: label 'exit_thread' defined but not used [-Wu=
nused-label]
  247 | exit_thread:
      | ^~~~~~~~~~~

Introduced by commit

  abc8250d1f1e ("ext4: possible use-after-free when remounting r/o a mmp-pr=
otected file system")

--=20
Cheers,
Stephen Rothwell

--Sig_/+iMMvQkNAcYHEs+Owpy=O5R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDjmdMACgkQAVBC80lX
0Gyxhwf9EzHNY+yf0Nimko/ginpREdUlcV6ff0CxTthDDyaUpLWzPV+DtoDYmcct
TXuN9zV9yzlvEQUNvetl4ngsSQZnLiX2Tr/AgMRJgbeSyt7lvDrovb2GD/Y47VPv
5dw59lbo5/t4jM0JkeYgA1PmF8Xzie0HaFxwHJoHQ0bN4caM6wD+foYf4u5J46h8
NpUa6NO1Eqt1EHi1Y9Mrg4qjhZfv2JZoTEvGVWYXuyKaJYp0lmAR+p5lKzeJZrSQ
2Qon9nzPjLSZyrF8gdWhF5grE4QeSeAHX107uWb9wA6EPsui7S0g91zJlOpbYlj3
Bpi2O7PiRVGXGwRSe0d/IcRC0dM3nA==
=mLOb
-----END PGP SIGNATURE-----

--Sig_/+iMMvQkNAcYHEs+Owpy=O5R--
