Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75DFD22E306
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 00:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgGZWKG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Jul 2020 18:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgGZWKG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 26 Jul 2020 18:10:06 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DFC8C0619D2;
        Sun, 26 Jul 2020 15:10:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFHDX3xRlz9sRN;
        Mon, 27 Jul 2020 08:10:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595801404;
        bh=cobZIdmn+6KM4sl5DSzEA451/qSe5azeK5+QfyO0It8=;
        h=Date:From:To:Cc:Subject:From;
        b=OWLHKJnaoVqFXJwnB8fWI5fJWpe4S2nLXkaeBL1kcetHQZa6ENHhuwfVrwQ9xQEYT
         jmc+k5nlIQCMv4EVPEwQvkJ+QVsoErum0QtVg+bgbYUAzEoxu+vdLZoYTfA1Sf8hnt
         YbDYuDtDvy+4kaI1b8eee8zJHsHSJevQHlylM6eFLKYd5ihzlSAwNpg1fOi2Y9UWVd
         M0RUAvfkXYgQvC+RpSz3AsPsKJhdlQ0uyf0puuwQrmj/nXveMes1CXgdximJtDytQA
         +Zm2zAqC8En2T68bQKt90Vq9o+3pDHDj7PcrJTkn+b8Pj537xnTJhToLQCdx+qErQf
         5VTvyEa3wT2iA==
Date:   Mon, 27 Jul 2020 08:10:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the irqchip tree
Message-ID: <20200727081003.7ffaa22d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GMt6yF46.OMoA6Nb/29CK/N";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GMt6yF46.OMoA6Nb/29CK/N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  e5c19cf32b68 ("irqchip/stm32-exti: Use the hwspin_lock_timeout_in_atomic(=
) API")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/GMt6yF46.OMoA6Nb/29CK/N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8d/zsACgkQAVBC80lX
0Gz2zgf8DNrMToapTA0DVShvzvwMlXWf1333DdXi6WsI7sNpNN5M2w9UGql1Bv7Q
H98U53A5MdTPMXNeJerhTIG4jQf03DERsMqIaEWuPsZOVtCP6rmNxeCHNUbAW1x1
RLbn1OQTV6HrugqpkzUknifOAHyA/lJZow9QZhPiQ1MxA+ZPshcqBlId7OeZeCOJ
pGyTKzvSJXkisLLd5TKBx7qdgugFhc2wN+DmfcAknIrGySwjHjXBVgQ1+LVsxSes
oUgvdRp96Xy4NLrdUty1e1Z9ds98YadzfQtkffGg81hG7YBZhyTliCGCvdMr7NYV
t8VDam7Oyig8wu3HfnuGoks8O/xcTA==
=rrdD
-----END PGP SIGNATURE-----

--Sig_/GMt6yF46.OMoA6Nb/29CK/N--
