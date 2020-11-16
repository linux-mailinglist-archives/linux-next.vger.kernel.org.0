Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62AD2B3CC2
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 07:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgKPGDJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 01:03:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgKPGDJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Nov 2020 01:03:09 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC35C0613CF;
        Sun, 15 Nov 2020 22:03:09 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZJQd12sjz9s0b;
        Mon, 16 Nov 2020 17:03:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605506585;
        bh=MEsqj4CzN1LusJtnTWYmpp8ADH+y7KXD7w6a7qOD+Fw=;
        h=Date:From:To:Cc:Subject:From;
        b=ftFpfhAXeMfO5OcEmbEj30qRUAsjyRY1Olg5A1Wd5LrtoD0kGHmzAzK6DYh9ldfvY
         Hxwmy8KLwroIk92Q7V0lh+tWzlg27+gKJz6+F4+MGsjoMd0JE9c4SiPnHuNuAvU5x8
         YpqI3pcJYRomfjV5s+ZzrdVw6ZCxUq17POXABt4ztFDl13bdrV/WcD6xrtQC4eCYy+
         /avzz0KZnnJ6+eaHA/dmZb9JOZ9l6gypj7GpW+Bg8YfDUK9Ci2EYFRQPb0Z7DKLMVF
         eSI6Ke9Rdw8cg7FcFzsM0AW799CvnDuJJiTrEAeoWrQydruGSC033dLmS1zOQvDMWY
         +6P734JFQgxcg==
Date:   Mon, 16 Nov 2020 17:03:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Wang Qing <wangqing@vivo.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20201116170303.0d457d04@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7aFWdwMJzY8el1qf5XI+N2H";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7aFWdwMJzY8el1qf5XI+N2H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the jc_docs tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/translations/zh_CN/filesystems/tmpfs.rst:5: WARNING: undefine=
d label: tmpfs_index (if the link has no caption the label must precede a s=
ection header)

Introduced by commit

  09028e60fcea ("doc: zh_CN: add translatation for tmpfs")

--=20
Cheers,
Stephen Rothwell

--Sig_/7aFWdwMJzY8el1qf5XI+N2H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+yFhcACgkQAVBC80lX
0Gwz7Qf9F9rsC6LZwYdg16DtoNlVjCaVl/K7349iQ1I7AK7pMBX4Qo6Iz7UeP2jN
FTQSKNYlZlhM7cJcynMw7XdXX8tYrDvOtBE3i8JLzMfsG8f+HjK7X/JyJav7X2V1
+dVWN0BOaKnAfDNOLQ8sxWBHyCgA1VBqWN4sTjpLYF04+X51eru5dRiLTUrmaRLB
kGHLS1sQ5BVCLyP1DLIqAWNJZLY0AToqqrYdKKWAD6l2Kp4cRm+Gtbb5NAzeqcQU
uVHF/AXjbtk8bksaz2QXyE4wxWrwgyd9ruyLAzYJy47mL0NQbSO4fZZ0wdr8gILh
D9EtyMJcHhhmYkCu0/trHEAM383vpg==
=i4ow
-----END PGP SIGNATURE-----

--Sig_/7aFWdwMJzY8el1qf5XI+N2H--
