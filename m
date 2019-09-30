Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 276C2C28BA
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2019 23:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731958AbfI3VWU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Sep 2019 17:22:20 -0400
Received: from ozlabs.org ([203.11.71.1]:46017 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730183AbfI3VWU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Sep 2019 17:22:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46hwMs3Vh2z9sNF;
        Tue,  1 Oct 2019 07:22:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1569878537;
        bh=+E6UBVAGUlRHpC9tpa+7aDAC5lzlHWAv40u3WQwxZ88=;
        h=Date:From:To:Cc:Subject:From;
        b=hXQyVZe6c8fyLPHlXMFiLRlbr+zTWV7zFXeBFVS6mhpKATTkqf13WBFmft3iYN0yZ
         oYTKnusjjZs07j53xsWs4KK+FsHwcOhG63CsjxbWYCb9nlJ6kmQ94NNPi/1ZIZaQKC
         K120TgZWfSi8usCZPs2Ura2ohY4nPIgWBVbIk6cc9UMV6pEpnFLerQTk5LC565ZzEa
         XQT9obprrZuGX/PQr/Tb/VnD/o8RPTa+CgLI+0HpxYBqQCZSwZeQ+zKxbjB2ETpmQQ
         A8g2v4F/owcImaJ5A7Rj8mDpVDp3yBF96oFxvI3W0W7VNnvpjz1gQcaHvD9dwlOiey
         1cOn3ZhDw+xIw==
Date:   Tue, 1 Oct 2019 07:22:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: bad update of the v4l-dvb-next tree
Message-ID: <20191001072216.473e0eee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R5z//8fMhC0wRrxI5SXIcXa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/R5z//8fMhC0wRrxI5SXIcXa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The v4l-dvb-next tree appears to have been reset to point to a commit
from early 2014 ...

--=20
Cheers,
Stephen Rothwell

--Sig_/R5z//8fMhC0wRrxI5SXIcXa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2ScggACgkQAVBC80lX
0Gw0Dwf/dEn/ewhUH1mYIBk0gF3VnwC5/TxS74S8p1rhns7zSWdn/IWYVEPFNmtN
/+9MM9FxScONK4GXI5brRdeJdO8IEQxW15CARBNCLNMz8erwJpBhbUqxDP/4/f0v
5z1EGe+YklblzIPWIA4/zU4qstlnKOzEtyLAANWD7N5+gS1YJSO45Tdbm/zTN+mv
f8PzMTMgkvRle8Pxk2VHuxflCwmeLQQ4uOHo8h3wI63S/U/2KtPgao24anI+g+Zt
MJv1g+rsnjAftesigXW1w59SYvsql8LW52lfk56fjCmjnO5XSkDv4MTYToazn1mP
V1k4LlGOdLsihNaXmQYVOTU0jDjI+Q==
=XMNv
-----END PGP SIGNATURE-----

--Sig_/R5z//8fMhC0wRrxI5SXIcXa--
