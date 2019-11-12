Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A73A6F8705
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 03:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfKLC5s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 21:57:48 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35791 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726932AbfKLC5s (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Nov 2019 21:57:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47BsqY32qqz9sPJ;
        Tue, 12 Nov 2019 13:57:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573527466;
        bh=GiUIGs9K7/JCmbdQD5QCRprmABl3h2/wJKsaeUEccDk=;
        h=Date:From:To:Cc:Subject:From;
        b=a5bftMQsShdhy2V+e8C959+3p/9k9dhB6pjA15+mCH5B23t+17hZjoOZuQU1SEuIv
         8LlyxVk5gPNIOm2isSgPq8qexDseWY/KkonZ0zfZJ+v9BxDW83IvjtAbPoYavbYwrP
         hm4IZygp8AhX/AdFZsEIkVM2KBfNBeWwBfFrCLN45cBFWbazjKXzWdr/2WN97li8RT
         k66U757pldJYtehBBj7voIZrz119io28efBbV3c3pa8xBkLg0F1QEVB8hLTXRd5KB2
         POl9JY8DdS9dCkoJUppMy7WgQ3QLqJtBSyOWnafai2ciey065ftY3BHla29PbNeAB3
         rzQ5l3Di7Bzow==
Date:   Tue, 12 Nov 2019 13:57:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: linux-next: manual merge of the devicetree tree with Linus' tree
Message-ID: <20191112135744.75251303@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SZbub5V7NxRSuzC5s6UPM+Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SZbub5V7NxRSuzC5s6UPM+Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/usb/amlogic,dwc3.txt

between commit:

  976392650a00 ("bindings: rename links to mason USB2/USB3 DT files")

from Linus' tree and commit:

  6aec97513a8c ("dt-bindings: usb: dwc3: Move Amlogic G12A DWC3 Glue Bindin=
gs to YAML schemas")

from the devicetree tree.

I fixed it up (the latter removed the lines updated by the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/SZbub5V7NxRSuzC5s6UPM+Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3KH6gACgkQAVBC80lX
0GwwZwf/X5Xb1IZKYgPDcRLnzzwcKGWjqq5IQAHTUMsgRisP9+7WfpwAJJvBipDJ
h+w6rXvIYiyFZj22G0DG+4DBMuzFXVe5t/n47QwAW4d1a5RSj5dj2eecFYoYjudT
h4PV0jKVdXPQPtGR9eF4SKGcT7LPPAs0s8VNi4EbPPrbyZF+5h9BLfMNcfl8P1Wm
Guz9k2UcU5HY785kZGQccuUJs+Gb6/YAbCh0PPFHVVxFPXXJQqRsnmK+gN3XvDF+
h5SKQekHvmhbHWAC1uCLKMSO454VhZBLjsV3dPfFM/GbU9DKQ4+ynMEyUK49gHv+
1ZYAVEe872g/3xkc2zev0bNahjsxUg==
=6Vr9
-----END PGP SIGNATURE-----

--Sig_/SZbub5V7NxRSuzC5s6UPM+Y--
