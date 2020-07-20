Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776D9226E17
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 20:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgGTSNr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 14:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728857AbgGTSNq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jul 2020 14:13:46 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8587BC061794;
        Mon, 20 Jul 2020 11:13:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9VGc2PXFz9sRN;
        Tue, 21 Jul 2020 04:13:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595268824;
        bh=egriRXWggQ7kQUueLYtiF8ZQjgu4UL2epGqRidsXzNg=;
        h=Date:From:To:Cc:Subject:From;
        b=boOM3JdwKMhzkMDEORNu3RKR1ueCEnahC9fs84S5hwjEPMgGH3TGlo8PUpI6UKhnH
         dROma2hhGil5Xu3jn+Vt9cN8mYCwtIaOv+8TOBkVYnpqzH0MK52vQlYWqNha5lwHmC
         /wcUhNameTdhGRjec1VAmOL/WHkJ7cduTVJYzKn5bU8CWAmF3Wnt4OcYSVtcMohN3k
         PtuC5cphJyUXR/NlxZseNPtpuNBSGW01jPp1ufKZw+n8nQPm2QCMGAME0yAIGDuU5v
         Una1VLxTMplbYTnqga2thsCiOr7hKNMOUakoPuceYqiemDukwayWNa3mMnfGk57MLT
         lzCrSB/NheaNg==
Date:   Tue, 21 Jul 2020 04:13:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the fsinfo tree
Message-ID: <20200721041343.60b3069a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jZCYk3Jf3zK+.3TFM_Di_rn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jZCYk3Jf3zK+.3TFM_Di_rn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  640b0d2b2640 ("fsinfo: Add an attribute that lists all the visible mounts=
 in a namespace")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/jZCYk3Jf3zK+.3TFM_Di_rn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8V3tcACgkQAVBC80lX
0GwCJwf/YgoO3oQHRv7/DwlWnLzqblKmdOn/WQeoO+N11QBsQ2+2JHasICD89Xt6
jyPENQ40UdKWB0JjCCxK20rwCyVsa9iDrBEMeKUxAJH4JkEs3WVFXMFLP/q7BWrU
NZIG8yvOqDJjf2FYjhbSOAKDQs0cIq6VqG5pOL/0vTeBSX0MKrYUX+NYjpcNas5v
vDu8lQH9TVo5GcJWr/B6mcKhJDLFcyQw9GJAUsGoWt3IpgzV/o1zdiMzbpuIJBqH
11CH4+T5aisilUF4w/nKmp8etX/CpHwHqdET5F9qqp7vTIm0JJP9dZXHGlia+XHc
1L/Jr/lAOlK6NQSlhFct9QUslQmZ9w==
=qjD0
-----END PGP SIGNATURE-----

--Sig_/jZCYk3Jf3zK+.3TFM_Di_rn--
