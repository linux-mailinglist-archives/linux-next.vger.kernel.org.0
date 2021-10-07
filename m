Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30E25425EDF
	for <lists+linux-next@lfdr.de>; Thu,  7 Oct 2021 23:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241385AbhJGV2x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Oct 2021 17:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242187AbhJGV2p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Oct 2021 17:28:45 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D27C061760;
        Thu,  7 Oct 2021 14:26:43 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQPXJ6ngLz4xb9;
        Fri,  8 Oct 2021 08:26:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633642001;
        bh=lJBSSC0ipR++BQDepp/kqzjaJPT17SlSby74jcw4HbQ=;
        h=Date:From:To:Cc:Subject:From;
        b=VKLV4nVrC46r2280vnB7AB2kNFo6v/3c+DncyNpQltj7waViGT1BijAXQug62JRy6
         yYHhlGbofy7UuTLpMIxpdU1e8rT317j37wyg0Q6xvC8WmEMSt3Q52Ap6fqKBoeQLLm
         uOBFbFeaxb1+V9LCFR792mZVp9J+EWR4JNodOCuBXVO92TEP07HnVyOzHt7vKgzhcU
         G8QDqMApOJCna2HY3fBHa3/NSsWVQ8G4CJ/Ug7+SwDC5Pq0pLb/mx3mft23FaLSLGN
         haXCWw1K2I6kwSWG6vN6hCYcLRJHBeZ6n/nJBzA0F9ubOK/Z3cvL/CAga4/k5Ha4l3
         v4cQj3egL8+KA==
Date:   Fri, 8 Oct 2021 08:26:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: contact/tree changes for the swiotlb tree
Message-ID: <20211008082637.78598d36@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iXFg3DT5UEbM/FGQnm4r2cy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iXFg3DT5UEbM/FGQnm4r2cy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

I noticed commit

  c4800765c0ed ("MAINTAINERS: Update SWIOTLB maintainership")

in the swiotlb tree today.  I assume that I should update the tree/branch
I fetch and the contact information?

--=20
Cheers,
Stephen Rothwell

--Sig_/iXFg3DT5UEbM/FGQnm4r2cy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFfZg0ACgkQAVBC80lX
0GxkGggAoFIiDp9BI2Ut4dE/j0hfzOTBmGtmWAZYDPxVNczHOkJL2yAWsKLk5uHL
ycpP59iu/sP6liLEN6h9s37B5FZtGtZIl6nxfEYtKujfOqs1NS04HbuLH/JlBzr6
3a0HwG8/+4tz3QPUp25krjDCIfvl60yvG5pazdM/3a/ye9bf7Bfg5njqzjyoN2zg
0M0XjBHhjElBZpvyPiH8FSjLDhD2meWwC+sEWZzIonv/o5Gps2W1fKJj/Zhda9W0
HCDkxuAnFWYtyBkO5O8rQ+R2UAIZzADtL0SJ1DSqUf/BIWxzqXNacI7YZudfT9GK
qmzjQslNNGtvrP5sEXbgtkSYofmRZA==
=k1YM
-----END PGP SIGNATURE-----

--Sig_/iXFg3DT5UEbM/FGQnm4r2cy--
