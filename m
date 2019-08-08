Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB5B86D42
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 00:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404609AbfHHWa3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 18:30:29 -0400
Received: from ozlabs.org ([203.11.71.1]:56877 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbfHHWa3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Aug 2019 18:30:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 464NNz1gYVz9sND;
        Fri,  9 Aug 2019 08:30:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565303427;
        bh=BJXNPlmf/useJCFEccRm+HznptOb+B5HjdKxuAx0jPQ=;
        h=Date:From:To:Cc:Subject:From;
        b=sdxh9d08i+5usAdh+KiNMTs0aXnExhfvfPRc1qDWvANAjYHuNGvpXjPUxlkHUZ/Nu
         9IJ0VJJHsUeKks9iefm6ZRz53tKvgkT+CwI2xD5kysIE4i3y/FqROECuOx1Pivad4Y
         wEMMqwN3+roUzpcgFQ+epQD3OwsxGvBH0Ebkrq+2+A5W7X6w1R8qgNLR/VOwcfvdIh
         Fg4E1feMyPFUp6UXBp4HEnKRoNWWXeU965/5CJsSDVt5WI9n1Dyh2seF2RSTKn2Q/I
         ZViJrk5mhfAb06G07zytFlYsIeRiBdFBiFRU2BLxYfRfiRJqv+sAL5vEeXACEB7EoT
         GDJMSTJDC9DOA==
Date:   Fri, 9 Aug 2019 08:30:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the afs tree
Message-ID: <20190809083024.237e7fb2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3apbHfm5X5fj=ZvIVug2D3t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3apbHfm5X5fj=ZvIVug2D3t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b214b2d8f277 ("rxrpc: Don't use skb_cow_data() in rxkad")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/3apbHfm5X5fj=ZvIVug2D3t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1MooAACgkQAVBC80lX
0Gxf5Qf9Ep2cyIqBNINn+xTEpMuqhqVRLYrJrGXQoIPc513czrV3YBtOEVFgttZr
Wi4rZdmqA+MGpe648GehV/mm7Hyg0cbvumvD/8V9UAo84Oo09WE9wSS8Mg2yCVZj
ciy60Gg+00ZTXghIrfS9PxjmsT/gwo1nSCK+L83GnxE8Xia7q6/7oByVTMPgJSID
KFvTg6RkN+Z+ivojhdPVAIRSCfMM5rH0g0CcG8GHZxSRSuKHNApV5QLwzpk32mA0
RNBgU0kMcT/66mRCIAjZNjIuS2lfXx/Ikxpqxh7Zt7diiXFTWQXXHy9tgyZ4UFLz
ixQG/1yoMCrkeMe4ZavcEv9t04NfGw==
=3oWk
-----END PGP SIGNATURE-----

--Sig_/3apbHfm5X5fj=ZvIVug2D3t--
