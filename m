Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F0436B32A
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 14:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233196AbhDZMiW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 08:38:22 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35619 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231876AbhDZMiW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 08:38:22 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FTPYW2L2gz9sVw;
        Mon, 26 Apr 2021 22:37:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619440656;
        bh=NjYMD3rNTpEx+BH/0A4k4JIh/zbHtuIIkEL2f+9sBdE=;
        h=Date:From:To:Cc:Subject:From;
        b=qxHGubJyjPZS/1DKYzyJ9AW56WdsV1tfPSmD33zeLBqmecIVWqR9pR7vmYYxNObSz
         HUmfyj6Kq79CuPHrhtXbn1qpflI/kVjByR5vAzYa8bIgr7+swUJFvepdepT5oQVICc
         taD6pLmmr4SN7tbll6+1FWExAZcXXAH1nZ1F2woWmVN5DTqtCvZxIwdItOYvA9JIsB
         MEXmhWYkbRRn8HwInm9DH9xOyZc8ZGveo9Wm2kAY25X3EGHd1y6S90BJCYz7SjZzFC
         NsMPIp+0nnEaQDHc6TZZCVGqgY2eExD/+eh0kEZG3s20mfEdywWc06HEJ4vtYzUmPJ
         0ec7fAuSgstIQ==
Date:   Mon, 26 Apr 2021 22:37:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the usb tree
Message-ID: <20210426223733.6aef5612@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PtgVt608Yj4=wjFRDz6TFw9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PtgVt608Yj4=wjFRDz6TFw9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (htmldocs) produced
this warning:

drivers/usb/dwc3/core.h:865: warning: Function parameter or member 'hwparam=
s9' not described in 'dwc3_hwparams'

Introduced by commit

  16710380d3aa ("usb: dwc3: Capture new capability register GHWPARAMS9")

--=20
Cheers,
Stephen Rothwell

--Sig_/PtgVt608Yj4=wjFRDz6TFw9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCGtA4ACgkQAVBC80lX
0Gyrfwf/eB/uTwU6cVX+Xwo7jR4jzNCDeGC6yMe+s7PfI3JhEzxhP4FXw0oLHLO+
/GTkaZMZntQGvydwGI8llNP8a4CS1Wv3iQJm42NG/IpuehFC9faWvKi/xPlRdkRp
F4rryxBFjz9izNRIFDN3FkvppLVuRifotmqPlR43Z4YsubcHIVykOYfwXS8YnIzl
Zv/OOeCsNwNKAddGHa0BwbboSBYsBqUg5pKChr5nZC+cAXTG6peQWyPURESRg7RX
nMH2pqoSFlI240sxwnFdUPhEcIC+PSz7yQEYisy1+wsCsZewyzODFfMhMd1sZtbz
8URziJ67RWIBwW9urUstqCB+ugFB3w==
=6qkB
-----END PGP SIGNATURE-----

--Sig_/PtgVt608Yj4=wjFRDz6TFw9--
