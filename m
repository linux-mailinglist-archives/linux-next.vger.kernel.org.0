Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C0F34F57D
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 02:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbhCaAaD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 20:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbhCaA3v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2021 20:29:51 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35915C061574;
        Tue, 30 Mar 2021 17:29:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F96dm67QSz9sCD;
        Wed, 31 Mar 2021 11:29:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617150589;
        bh=atztkP+D0H9SG45RmAkDMnDP2EuNZy3WXOlluoBx5mE=;
        h=Date:From:To:Cc:Subject:From;
        b=PMiSYKecE46aKQ+tuuxYd87Z1kpoMQUw9eWEkA8xehm69NAcAuUjvHCa6j/fm4dfa
         4KM4B/vWOfEpxHCGh90At1kCwZeJde9CqVb3dyh/WdlDXGbWSzjG+07OXpemqY2+CM
         XLz3Dniryiyok1oj+z4fG3CXN5li7DpZbgBWYdoorFlu0MVleRCOpE0RiCk7EK6QAK
         nw3y6Y70wSH5ypiprvcKgjx1JBPjfAkXA2BxbTgXggQV4nLk5tmWiskd0CqcudlDz/
         Tsfgd779xfYAXg243gaqbqp5k/xVXFWfmdkVnFq3KNpRX7rNsE3A38zH/WEt68//RB
         lLr7wonigZF4Q==
Date:   Wed, 31 Mar 2021 11:29:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Vitaly Kuznetsov <vkuznets@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pm tree
Message-ID: <20210331112945.11aa88f5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1E=lKZ=hKUoGV.peQDf3ZiD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1E=lKZ=hKUoGV.peQDf3ZiD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/acpi/processor_idle.c: In function 'acpi_idle_play_dead':
drivers/acpi/processor_idle.c:542:15: warning: extra tokens at end of #ifde=
f directive
  542 | #ifdef defined(CONFIG_X86) && defined(CONFIG_HOTPLUG_CPU)
      |               ^

Introduced by commit

  bc5706eaeae0 ("ACPI: processor: Fix CPU0 wakeup in acpi_idle_play_dead()")

--=20
Cheers,
Stephen Rothwell

--Sig_/1E=lKZ=hKUoGV.peQDf3ZiD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBjwnkACgkQAVBC80lX
0GxnNwf/SM6s0aXTGBKPouoU/PNnplI8pYwZjTqoivo46UNc0sSeSObC1xI/Qgma
KO4Xk6ee16szFCIBDjbYOdTdHn2XJ4IvufgZM6Fndbt779UJtzM74O2JefXwzU2k
APlsG/qQsUzrJYNqDM4rBB/b1jGJvL/sQXUidwj6fjSGapBYLQLNqAfw/liL7oZP
JZTLdkJXPP3wvbHxg83lGGZnkf5cxjvFv8ORZNFD/4tHNKvEn3nacVTyG4IGRpzY
0QWA/XB5+QHKemg/cihrI2WM5Wh4WLVOyFSugSamfB1CdMhoaENQxr3LkUOA98Op
5ymbga7DvnAzgO51VEeALiXrf2LUtA==
=Verr
-----END PGP SIGNATURE-----

--Sig_/1E=lKZ=hKUoGV.peQDf3ZiD--
