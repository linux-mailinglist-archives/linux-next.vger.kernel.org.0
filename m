Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031DA219697
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 05:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgGID0M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jul 2020 23:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgGID0M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Jul 2020 23:26:12 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22CD0C061A0B;
        Wed,  8 Jul 2020 20:26:12 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2M5Z0Lwzz9sSt;
        Thu,  9 Jul 2020 13:26:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594265170;
        bh=tm1bGSz8/JmV/fIUWmoWyLspKmHrMYty1alsUC6nMLw=;
        h=Date:From:To:Cc:Subject:From;
        b=eQndleMjMh07sIb5oj11x2nRFiOvRIL+CGA9upbQBnXBbB068FPrsH4JGMC+v+7xE
         RFtjN6rcunVE4LsdzClf/rT1D9Vzm7CVIoAJu1hioA7pTm6VvLoAoEScyVwgaOjH9c
         roTs/G29q637dTKUpGf8UnaKoVn6La7ssPcIsNVTMLPDAQav8KDVJFHvGPsIL1kDAx
         TTL30k7VZGpcH4tpakpnWfrGLoFAmDQ8Co5Ur0Dtowhzc2qvLZl9sso+wtCovkC3jL
         jJGwrV8MQHK+6ANVRgdXIY6dqT5JBd8tD+OkYErM8rIkwcIrB2C94LdhWFqh93ucRs
         7aXfuZKiDEAjQ==
Date:   Thu, 9 Jul 2020 13:26:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        yangerkun <yangerkun@huawei.com>,
        Bryan Gurney <bgurney@redhat.com>
Subject: linux-next: build warning after merge of the device-mapper tree
Message-ID: <20200709132609.6de53604@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2KJrdZRJdMWdjnllffNu.7+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2KJrdZRJdMWdjnllffNu.7+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from drivers/md/dm-dust.c:11:
drivers/md/dm-dust.c: In function 'dust_list_badblocks':
drivers/md/dm-dust.c:307:10: warning: zero-length gnu_printf format string =
[-Wformat-zero-length]
  307 |   DMEMIT("");
      |          ^~
include/linux/device-mapper.h:555:46: note: in definition of macro 'DMEMIT'
  555 |      0 : scnprintf(result + sz, maxlen - sz, x))
      |                                              ^

Introduced by commit

  20f93ea74f9c ("dm dust: add interface to list all badblocks")

--=20
Cheers,
Stephen Rothwell

--Sig_/2KJrdZRJdMWdjnllffNu.7+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8GjlEACgkQAVBC80lX
0GyQBwgApg7Xvf3KGHULY/CvKqalr1itIeRYKVan3DtLLKDInDQMktdM80Kj89Ve
Y8YkBfkpaT/pw71CQW9wfQYu4u40lilaab+gkCNx84NG+okhqG0ZSzPG4qzGvgQu
ADbv6O953lnpNbwCO0SiTtmzWfz9oVdM2zCQ1S9EgwgJUvaEqK7YOQFDDwLuwFZL
1k/9JIc3gmi8Vkoe+CwdFXPZiE8N1y0xIeG0YG+V7uIpGX+e7s/MSeQPRl3B4EZ1
vbze4mp2KshveqppitA2xwdY8IvHHZluyx5k57ruQgJ0Vt6m5I9PVVp8xBfR5OJL
AoqfJneb/1Yu7iNFFN2lNbIt3oQ/jA==
=uDpm
-----END PGP SIGNATURE-----

--Sig_/2KJrdZRJdMWdjnllffNu.7+--
