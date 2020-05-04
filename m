Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6D71C34FC
	for <lists+linux-next@lfdr.de>; Mon,  4 May 2020 10:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgEDIx3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 May 2020 04:53:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41553 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726515AbgEDIx3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 May 2020 04:53:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49FxTg1kpfz9sP7;
        Mon,  4 May 2020 18:53:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588582407;
        bh=NIf3PRFXdOizXjV+9ztZcgWcYX+AbXqSiJ8swGG6MtI=;
        h=Date:From:To:Cc:Subject:From;
        b=DRtwU0Tr/1+6SFdC/evgnZ0o9s+hkpWnDhDSJROzYmAi5GFOprKtjBTbAICvKQqu8
         /aYwtpFewL6zTo21MMmRbnWA7AJ9QRx+wA/MttKCQ6eAJWLV4O8si9J58U69v6XIzF
         /GFZ5WP/iCk7XqBLrajHPAjwjlT+OJL4sqZD7Jcf0eGpMzjWE4ogesXoL49zUVKXGy
         wNvrejf3wJlQYEKAU5ihgjcN6gqQgd/1F0sFCEPag31s+zSKP2gRh2YwknHCrZWd8V
         bevpG2TunXRMvdRi7Ttuew8ImevGSTzFKDIuHl9edQ1AC8KhfdnUD0cPX6gL+eMgwg
         8Nt7W7oL4eLIA==
Date:   Mon, 4 May 2020 18:53:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Subject: linux-next: Fixes tag needs some work in the slave-dma-fixes tree
Message-ID: <20200504185326.6c50e387@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jbBtHwd1qYGSuNnnzHj32GM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jbBtHwd1qYGSuNnnzHj32GM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c76d6569de67 ("dmaengine: owl: Use correct lock in owl_dma_get_pchan()")

Fixes tag

  Fixes: 47e20577c24d ("dmaengine: Add Actions Semi Owl family S900 DMA

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

Also, please keep all the commit message tags together at the end of
the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/jbBtHwd1qYGSuNnnzHj32GM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6v2AYACgkQAVBC80lX
0GxA9Qf/dxS6yYyPueidIeQvXpThibMk/dV0ahIhtLZgUngL5+DTKZxywga1MERS
iVirG7jQtF4FctNhK+SLOzMWYE36g4yNncevjvl1YwvKydBs6M+SjlAP0AsUTONv
5eguBZTnb8lUSHTEHQy90atdM9Z4Ylzlb8B1huxlpJ2esZ8wX+AeGQHg9hmn5ff/
Wj9fR2X1uYAabdr+x115tlG8zm6yZNXEaP+s+ZZu4OWRK/wjK6+3eRvzDDl0cg/u
nOeCyI8ei081Wd9PbFe6SeVqi+abscEPWGH+b1EvW/QrOZk/hbFgjKyQt/xtvshH
+UUohomECzwdcMh5jwnw46ayNFTW1w==
=3jgx
-----END PGP SIGNATURE-----

--Sig_/jbBtHwd1qYGSuNnnzHj32GM--
