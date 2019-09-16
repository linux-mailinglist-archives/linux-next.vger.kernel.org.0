Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36395B393D
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 13:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730434AbfIPLUu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 07:20:50 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:41524 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfIPLUu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 07:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=p1ICrPahcBuNP8vRgKnrWt7iiZAn6aGVp/xbImOxqWo=; b=T6k2Ig3p3uVnKQ0NLJWIXSCsd
        gl9CBaAi5adWuQD07Ygu2PY65PNGRihRb6dGiB1TOTGlxDxx4p9xGT2Ongsa1HpjTLAleYbNA6EVt
        QywQdFumjt7krEXduH7C5+0q18kSf4nxK0ZpsuqhI0WOBub6zbqzLqAZfLiFksGyaM2Wk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9p3j-00040E-Eb; Mon, 16 Sep 2019 11:20:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 633112741A23; Mon, 16 Sep 2019 12:20:42 +0100 (BST)
Date:   Mon, 16 Sep 2019 12:20:42 +0100
From:   Mark Brown <broonie@kernel.org>
To:     "Luck, Tony" <tony.luck@intel.com>, Christoph Hellwig <hch@lst.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the ia64 tree with the dma-mapping tree
Message-ID: <20190916112042.GZ4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GXk5ufetu984H6pr"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--GXk5ufetu984H6pr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ia64 tree got a conflict in:

  arch/ia64/sn/pci/pci_dma.c

between commit:

  f9f3232a7d0ab73a3 ("dma-mapping: explicitly wire up ->mmap and ->get_sgta=
ble")

=66rom the dma-mapping tree and commit:

  cf07cb1ff4ea008ab ("ia64: remove support for the SGI SN2 platform")

=66rom the ia64 tree.

I fixed it up by taking the delete from ia64 and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.


--GXk5ufetu984H6pr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1/cAkACgkQJNaLcl1U
h9Dncwf+IJZPs0eB0mMiitTSr1FTYFTPAZyyGrNtHLvR8xUWljF+8gpX25FQwEN5
fvGY9v1M31kE8za7qMMwXusQ5fEB1y6++173/AIXsKB8VoC/IFun5gG6C5EilPyX
CsWnHVVIBhOpgHiaHAUdVuTAOfClPnYBNJmrcdBrhD4Gpar+oQgQ0ZfteLSrxTtQ
yKBO/B7RO1WaTP3cDGnZMs8CWuxQgMaNeV/gJ9nqHfx5qlAcOQjRXdy6rvEwF1pK
Wug2ZkW6TFr3L4sAFy6rI1VPQS7mk8fq+liotd+IlNzCF0WSJ3EQdpX57dv6tZQn
ABnNLG7N47gTaqAYXfthyxUB0t9MYw==
=spHU
-----END PGP SIGNATURE-----

--GXk5ufetu984H6pr--
