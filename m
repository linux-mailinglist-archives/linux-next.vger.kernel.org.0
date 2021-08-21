Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04A13F37D5
	for <lists+linux-next@lfdr.de>; Sat, 21 Aug 2021 02:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232939AbhHUArp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Aug 2021 20:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbhHUArp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Aug 2021 20:47:45 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B578CC061575;
        Fri, 20 Aug 2021 17:46:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gs0FV5shRz9sWS;
        Sat, 21 Aug 2021 10:46:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629506815;
        bh=IsRD1iEp6aq/vPbx1sygHBFC7S/E7ximcMS4E8hQwB4=;
        h=Date:From:To:Cc:Subject:From;
        b=DslelNIhWJCF2buB1wnP7FrkwAlN2T6rfVgv8pLvrM5oh398vH5JRBjz3UCy9/qtA
         E4jw/EJIKqKjmMNOgIXylXRLKwAiniHQ5wJIYOSqlOQm/ehYNQ/8x5og8lAh2S7QsS
         f8CmYa0t5rhkgHm3uKU7LI7S95Ti2qUOuEIWF4rwlziMuo+m8sSCAEuTBGq1FlFMNY
         gnaw35pO2FLbhava0A2mAMRocON+otpSmHh5Wo6g5qgzyGy6U0pWUCL0qf3KSJtZFc
         MV+ikkSlaOUkd/LaZSJClTVlHVgJx4QtpJxK4rgB0nDtxbTVMF/zBOoHFWkWxvj4/V
         8C2vgWW4JU4sQ==
Date:   Sat, 21 Aug 2021 10:46:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "Luke D. Jones" <luke@ljones.dev>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the hid tree
Message-ID: <20210821104654.30b0a2b4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jzmb6HzkMH5paYeh=KBtJMw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jzmb6HzkMH5paYeh=KBtJMw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  87c7ee7ad85a ("HID: asus: Prevent Claymore sending suspend event")

is missing a Signed-off-by from its author.

Actually it is just spelled wrong.  Also, please keep all the commit
message tags together at the end of the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/jzmb6HzkMH5paYeh=KBtJMw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEgTP4ACgkQAVBC80lX
0GzK3wf+KG08PesyEMNoydrxQm2xQRThaTpVJgSmOPjs2i4J50x5Js/vwCDNr0UF
ZkQQ2BKFxXqT7Oy00HMfXihdMwCWuYGRfXeJm5rrss21Swhi6ymVKr0Kcn6g+kZV
nAOcbeNEtPSONLxuu1TFqigqi5w6cXTGpPV/qvEvZ1v8BvVVQXcu/9Uxr9WwbQ/Q
RYLBXczfEMpCDIPiTXCPIKsavBrIZJXiriK4J9lmMYFSQxcb8lIn/u85oRdGNsLE
ez7FLIOIS9nbQkx+4s6FO0oMu0uZtuNZzuDglt2FKEjsG65qgQVcJE4tGN2Dibgc
9LNmByJkucmEW46kQaaqWRNIuHuWsg==
=dl/V
-----END PGP SIGNATURE-----

--Sig_/jzmb6HzkMH5paYeh=KBtJMw--
