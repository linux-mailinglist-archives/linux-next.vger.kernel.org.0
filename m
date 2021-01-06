Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6992EB7FC
	for <lists+linux-next@lfdr.de>; Wed,  6 Jan 2021 03:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbhAFCNN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Jan 2021 21:13:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbhAFCNN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Jan 2021 21:13:13 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A5AC061387;
        Tue,  5 Jan 2021 18:12:32 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D9Xv059kdz9sVs;
        Wed,  6 Jan 2021 13:12:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609899148;
        bh=vFEIujuVqfrRP3UOX60pSDIsJIHaEcdfg1j+cDC90po=;
        h=Date:From:To:Cc:Subject:From;
        b=t5bEx2z8ZFvBvHHcswErrKBIrfHKberKFFweWLXLnvG+S1Y40G4Z2ZIM8ZyMPBs2Q
         OiByuUx84vmj1AucIJAFs6xs5zmmz7qAZOqD1a0VHknYppzx7dc73LkdyqB7saRZyz
         RSbKqv9PSSPKF6fDL0kMvT+XneQNsBINEQ4/QuGc/cYzq9Al3dYxXqfiYxXAdWjmx1
         8I642UuuZykcguiab2yWcNlXA5TcohIeUzpiQeggIyURPeXShNCTA30vLtFQpZwRUX
         NZGXwoteWSfqKZtzr+rIxefWTfxVJZTJr1eln3Aj+7QrvhHmY6+HdOXRgNVuh8tD7T
         ahpfWCJn1Y2aw==
Date:   Wed, 6 Jan 2021 13:12:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the usb tree
Message-ID: <20210106131225.66e82b5c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UUtXkT6vDTJyjiYRgYHukH0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UUtXkT6vDTJyjiYRgYHukH0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (htmldocs) produced
this warning:

drivers/usb/dwc3/core.h:1259: warning: Function parameter or member 'gadget=
_max_speed' not described in 'dwc3'

Introduced by commit

  7c9a2598463a ("usb: dwc3: gadget: Preserve UDC max speed setting")

--=20
Cheers,
Stephen Rothwell

--Sig_/UUtXkT6vDTJyjiYRgYHukH0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/1HIkACgkQAVBC80lX
0GzY/ggAgBzmOnOCVJTBKxPCbXfz/rzE8xP0d5wndDXFXR/XrEDwDM3JC6nA3Lv2
ZXVePZphv39bl+pASNdp3eyxVpygcFD+CTjMhaBJCsUxcSBHqhyjd5d++/TiDQ0k
uoU5+LTAoKJ9EAInL4V7BGJWjriNruS9IXdO7mQCePv73UgWP1DLQHCbMvNpa8mI
Qkzfs+CTcr48v7wQ5XfE25gsZkqJY6a1JM6Ty/x5CgMUDxhiSRvq3s+sUTRJ/go1
TfHZnPpYTfP8iQxgMqdroLQcDLlNBQ3XyN6g7KPTwHMaykY0SPuTPy9qQo2cQ4o3
qIy6HV4Q8xZs2Qa5Bam7kDCHl9oXLA==
=walZ
-----END PGP SIGNATURE-----

--Sig_/UUtXkT6vDTJyjiYRgYHukH0--
