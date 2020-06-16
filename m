Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41FD81FA810
	for <lists+linux-next@lfdr.de>; Tue, 16 Jun 2020 07:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgFPFAN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Jun 2020 01:00:13 -0400
Received: from ozlabs.org ([203.11.71.1]:60245 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgFPFAM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Jun 2020 01:00:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49mGGf58zDz9sRK;
        Tue, 16 Jun 2020 15:00:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592283610;
        bh=0FZZfdCvghpA2NAn9J3ijYSyzDVy7NxN0rv+87y7MWQ=;
        h=Date:From:To:Cc:Subject:From;
        b=puQejvygiN/lXeGNqf0WuFgh+gfI43yYxjC9pVScWVD/UpFPMycHkulWniWiLn9Jm
         ylq40zbV18ngXZHk63mEkhU+Wp9Xqop8RVxOAtxpCRCFCyWmZnCnLVC6LyLCGp4bgw
         V3oSEBkclHTzX9yyFJhqzmzHMBDYDR9SgxOI77HN8nCSMqHTkoGPAKPywoGRYUCad8
         yJzvboL1FfFKBDbusSbKYdbSvqW2eC58o2nIT+o16Csdmqbfy5q0VYeRYbgFW1gbK+
         /gtetBgWquNc2bwBDl5SkXvgCt2Vmjeii7cYLylNM62ZWWkLG5Xqiu5JP/+yAgjC6H
         ueHF+hZWCh2iQ==
Date:   Tue, 16 Jun 2020 15:00:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Walker <dwalker@fifo99.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: removal of the cisco tree
Message-ID: <20200616150009.6b9b1140@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_hxU4qcOVi6e1Z9J_DUc5x9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_hxU4qcOVi6e1Z9J_DUc5x9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

I have removed the cisco tree
(https://github.com/daniel-walker/cisco-linux.git#for-next)
from linux-next because it has not been updated in more than a year.
If you would like it reinstated, please just reply and let me know.

--=20
Cheers,
Stephen Rothwell

--Sig_/_hxU4qcOVi6e1Z9J_DUc5x9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7oUdkACgkQAVBC80lX
0GwhGAgAoYTj4W6jTnR1MmIFzJnXyWoyh1Rvu8m42dGaZhiz+WrsPeR2jnnpj1Ms
guoL7nztKlZY/VFMUonJ6gi7IhyREWegnYD37sosU4nL/cnwf7YHAjEeR5aNF2lZ
x4yM01eDQxRp5psP0wulgDJy6GbWfTloUSS2cToJlF+UF9iYPiq+M0FSjAXZTTa8
ockaNcT0MiABahY/wbVJ7I5d6NcQmVmO+Mjxx6AorLv+oizHIP2Prw0pIUXKLa9e
e3lL08wiy27fwUyF8wFtyTJcmmP69KbT7Lo5QgX/CZ9TQyc5poDRfvO8gF5cRMjF
/br816gTIVI0kh2EDGr4qdhvYSze/w==
=nt/s
-----END PGP SIGNATURE-----

--Sig_/_hxU4qcOVi6e1Z9J_DUc5x9--
