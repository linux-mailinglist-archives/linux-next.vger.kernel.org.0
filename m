Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29D0020E8C7
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 01:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728598AbgF2Wam (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Jun 2020 18:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726901AbgF2Wam (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2020 18:30:42 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE5BEC061755;
        Mon, 29 Jun 2020 15:30:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49whyk2q3qz9sTZ;
        Tue, 30 Jun 2020 08:30:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593469839;
        bh=lEdTfTsjifR2UdpztT0U0cquVcyoeykNUYGq0re6ucY=;
        h=Date:From:To:Cc:Subject:From;
        b=Tz7JCEnHT4dEBZXOjXrfBIVzDdrPfnT/RrpLQOyFUZEVebvu+mi1R6dBdvqu7xUmx
         hOIQPx7j5+ZWOZSWweWUBGC5L/yWDXdvYLkKOZGXWGwg2Q209mN2BuEAfLpU9C2vSK
         ihnbFNwC2yV5AnfHnOj74BMt4MYdZXyji22OIcK2ceYzi/aicBJBz8d6ipihg42u2F
         1RnYxh32yhkMxwbThB2dT5UWDz38ZXavdV56vw5YUOvQYTBgHRrs/ACJUC30p30vzp
         Xug77JsxlFezl9YnDyMl9gJ4mRFpkGcgPW+7U+rSo1ca7GY/G3FQEWA40Ua1JdMazm
         aCVfcn5xgsIbA==
Date:   Tue, 30 Jun 2020 08:30:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Juergen Gross <jgross@suse.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Xen Devel <Xen-devel@lists.xensource.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the xen-tip tree
Message-ID: <20200630083036.648a0743@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8Yz7k4vG3au2bDCvgME8T3f";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8Yz7k4vG3au2bDCvgME8T3f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  724f239c3401 ("arm/xen: remove the unused macro GRANT_TABLE_PHYSADDR")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/8Yz7k4vG3au2bDCvgME8T3f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl76a4wACgkQAVBC80lX
0GyBHAf9F2p7fB/U/JVWSFxuzT/tE3iag6zgDizsPgOoVk9HJGxsS9pxttrObPOb
qvzKk3F7IxgknbR5VsoPjPleAbzOpiQ9GtyJ49jyhk+4V42WSrInSzmC6x3dQgd0
MHZXQuZ9vKvquicdYD7M+Sm84/cusc9/4lYbQsrVDk8Vg8Oy67qEprBVKQm7u393
tththLxHNI0kTLcswWSyg6mI0dxSuo8F27d5/6/Qv7YQM6J1dbxo9R60RZtJwD8V
o0Q2sJSqj3WSQw5iulhesVAe9h2KQBZGIZsffi0sAI6/5iVnPogtossH7+gPjH5P
zJ81Y9qUVQJ84Yro/2g1t7l3aw0JsA==
=hdlQ
-----END PGP SIGNATURE-----

--Sig_/8Yz7k4vG3au2bDCvgME8T3f--
