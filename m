Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B41532BB75
	for <lists+linux-next@lfdr.de>; Wed,  3 Mar 2021 22:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241331AbhCCM30 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 07:29:26 -0500
Received: from ozlabs.org ([203.11.71.1]:41317 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1354862AbhCCGGu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Mar 2021 01:06:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dr3QS6ShQz9sWQ;
        Wed,  3 Mar 2021 17:05:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614751553;
        bh=WBKyhqjMCja39+zPcpMIQhPbKNpGkNdhm6QLIuisrXU=;
        h=Date:From:To:Cc:Subject:From;
        b=HNTWWJnvNsbRJk6oG7HzjsPdvUymBDsPXB8Nt8ZB0No0vteuxIIc1VEwv5clSHUJa
         xkZTuqbEbQNE+bY4y6vPZdZpVALoZoMCV8nxExD8EtlJ60UPENTKilDZ3y87BGVPIX
         vprIvApaFJzPLmTVn3oQ16fCu/c71KP5Ke05hBthJU+/BB5RWDBh7oY828L3sH+wZ6
         czgzn8Woga57IHYjep8MfHB/kUhfFC0jpNivSb7Z781XN3QwGO5AiEZAosqiKUNiYi
         9Iz9hijzdmgnGxW1fpRDikykeCTHNnUSOUihDWM9b69+K6GLF9Axd5VvQoxRFxMEcb
         jfytxj0YUyxnA==
Date:   Wed, 3 Mar 2021 17:05:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Ray Chi <raychi@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the usb tree
Message-ID: <20210303170551.0d1d686e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SL1SD.VNdDFF092fzAQq3Ae";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SL1SD.VNdDFF092fzAQq3Ae
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (htmldocs) produced
this warning:

drivers/usb/dwc3/core.h:1273: warning: Function parameter or member 'usb_ps=
y' not described in 'dwc3'

Introduced by commit

  59fa3def35de ("usb: dwc3: add a power supply for current control")

--=20
Cheers,
Stephen Rothwell

--Sig_/SL1SD.VNdDFF092fzAQq3Ae
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA/Jz8ACgkQAVBC80lX
0Gy/iQf/TMG56+AgxUYTUPoig14cxBePMaCv6IuRsUzeLzeI/1t7Xc14txe9RwRG
o7pHC4ErLvFixGhI1OW2kc5X1oQYTIvU0FDYInJh2m62wCHwH8YUzC5/1fAMO8Pi
8kdi4Wtn18Rt2dfZbPDIqZsH4KzmE7OnXSw6bOK2zH0voTI6cLsfQgtyQ+MLKpGj
gJDJpzgdyGxvKFLdy5OsfNbNoDwhnqAmpZanVXjnT0BOQwVkfnAJzT7nZY2TzJ+S
3bsYwijtip71q57DGPpXdzZnI3foIOjUk7Sl9RgABCNqL0YcodtsNe8eEBwS3BQB
kTNFNUAFBZmEZ3VgCB4z6yYWbcVvUw==
=fTMc
-----END PGP SIGNATURE-----

--Sig_/SL1SD.VNdDFF092fzAQq3Ae--
