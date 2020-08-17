Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E09E24795D
	for <lists+linux-next@lfdr.de>; Mon, 17 Aug 2020 23:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbgHQV7a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Aug 2020 17:59:30 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37975 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbgHQV72 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 17 Aug 2020 17:59:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BVny51Jg3z9sR4;
        Tue, 18 Aug 2020 07:59:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597701565;
        bh=yM/Mgdu+FG9MC2whcR8iLT1N9AqLP/cfNnUw3I8bLms=;
        h=Date:From:To:Cc:Subject:From;
        b=F+L43MZybxUPHpbR0Fk8EA3DckQo/ExKKTUb9UAkMEzVburVfT009k4X4PT7rncgp
         dYOO3OrdmhELi9RVKFxdhwocZA5nAPcfohjMFcASP+H6lISRJ4GA8+2OmvoYxdgeg1
         MYXNRSSUrJABAYng7RG32GOqObGWKjUscs0TiZBqiFOi283SHQnPbevPgunpfRUABO
         sox5hggCTflwXHS41CoTB+UyWBf6GLrQiZMcNRuve/umj89Qj+83tOZjgI4G07wPSj
         L2DeNOx6ehBehBpN9FjTBHTMH58JyfEYpmtzgz1s7xLklPQpEc7TDQ0/+eeZEv72Yw
         +Fbt1bRjMz0Fg==
Date:   Tue, 18 Aug 2020 07:59:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: Fixes tag needs some work in the pci-current tree
Message-ID: <20200818075918.15ac1099@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oxq4VH/O44VwC9E6N9Xi50c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oxq4VH/O44VwC9E6N9Xi50c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  35150fc886a0 ("PCI/P2PDMA: Fix build without DMA ops")

Fixes tag

  Fixes: 2f9237d4f6d ("dma-mapping: make support for dma ops optional")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

Not worth a rebase, but worth remembering for next time.

--=20
Cheers,
Stephen Rothwell

--Sig_/oxq4VH/O44VwC9E6N9Xi50c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl86/bYACgkQAVBC80lX
0GxW/wf/XVCcXwhw9gTHGhQHpWOKfn1/WSPlYE8UGeMvq4S4r7ZcYzMlKBEK9y3V
MwqnRXUgCpgmEtmFt0tu6rbK13nNaHERExiGNDEz5T9aKoF7AvZKnnCkZiy0uxRL
1O/d7YsgR8hv7yZTckbNYNB2jsD5n4+L6EnxCRFuy7lXxJV9nT+Pk31SxdDWSYLs
CN14XF/694F9wV4Xvt4Fe5UeWs549CfzratL3gOnoMhBpApbEXslqEV9U6SZ1pDH
thWc3f+ib3Q4BEuhFiuNqtiAGP4QP/IzQKGXBLO0CIimRstsYgwKueafv1tl4Z64
Dl9y7RTmE6z54TQctQdJK454PxyJeQ==
=83xk
-----END PGP SIGNATURE-----

--Sig_/oxq4VH/O44VwC9E6N9Xi50c--
