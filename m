Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77D2A1D75E8
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 13:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgERLI1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 07:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgERLI1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 May 2020 07:08:27 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2459DC061A0C;
        Mon, 18 May 2020 04:08:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Qbpx421hz9sTC;
        Mon, 18 May 2020 21:08:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589800105;
        bh=04zCL21QITiWjsuS3kcIIRHW85DOav2/vUYRENFepKI=;
        h=Date:From:To:Cc:Subject:From;
        b=G25aQFAbc0p5cY/yiSrY5FcRgigs5vkikPVp+LIQZrT9bmf3S9KmQhdrsaY6adY/8
         4jHqe/j169rFAvSM/vv8XbW1oUfCIqpgwWIueIM+CjKqM3xegF3HD+pCDpXVAT5IKY
         Kx3WFxZvaF1lmGYX4B/Dpb3VrJQWOWDCTpKUlFKvZMMz84Zq9NFdadNJiEP3zUH+Fz
         ZWs2dub1jyN+j1a4SCddF04FrC8Eq9C/gcTx439DOvWn/KoQ+fUuQ8zIx0raGLiEVa
         JbkOlVQuvJSS3xrqmGmd8G7yZAK02Op5H10xJAXcsEIfX+bfsbNtObX1ta2xPyd9GE
         QZOpIq3RgzA4g==
Date:   Mon, 18 May 2020 21:08:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andre Przywara <andre.przywara@arm.com>
Subject: linux-next: Signed-off-by missing for commit in the scmi tree
Message-ID: <20200518210823.760fee29@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qAV70EUxb2mK7QY3YKjk1Xq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qAV70EUxb2mK7QY3YKjk1Xq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Commit

  17a37ff76e95 ("arm64: dts: juno: Use proper DT node name for USB")

is missing a Signed-off-by from its author.

Also, the commit message tags should be separated from the rest of the
commit message by a blank line.

--=20
Cheers,
Stephen Rothwell

--Sig_/qAV70EUxb2mK7QY3YKjk1Xq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7CbKcACgkQAVBC80lX
0GzxpAf/Wsflke5wuOPg9Ie75sK2RYp/uwldGiXcMTsDP8HUoJVJhNr59EosVDyf
fIQpEW07mROf8E46QS2d+jhvkHHe+ToH4Dd0jfCjN2M7YO1KzaqAWb9veuTWRKSk
NR4vxMfRiGjLsSfV/OcCRjIt48HWy/8/iPv/GZP2xVBme6rie07mSUUboFO5n7/T
P5Xh0jsCf5JTEn4C2Z1OB0Ef4j3UbjrpnzpqEj/9cJ19oo9LVSIO1Kpl9OS18jRF
x+CSK6My5wnttxoHDoPcSFdE0vPnfxxzwzS0b4mRWsCBA1vhyqBQ5Hoa2yiAUvny
Hh7ZquvYHK0Y/yVbQg7LbscV3ysZ5A==
=1JDp
-----END PGP SIGNATURE-----

--Sig_/qAV70EUxb2mK7QY3YKjk1Xq--
