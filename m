Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50DA612582C
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 01:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbfLSABs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Dec 2019 19:01:48 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:36489 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbfLSABs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Dec 2019 19:01:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47dX9P6HLDz9sPK;
        Thu, 19 Dec 2019 11:01:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576713706;
        bh=CBUu1TEhcIZSwqdjl+8GrOmBK0ixeFV5R+0Ppa2jFcc=;
        h=Date:From:To:Cc:Subject:From;
        b=QyyH64gBLr3uCJZO69+ttq+w4LYcziDybU421A6541DKN59KLRLnyERAmPp3czft4
         1+1z4hpXT+TpMa9WUkCYKti1+/LVs+sAfql7F8KtPMPZE6izAu5LZL1cC29JNbKTcR
         8OyUNh1o8/NtGuSNeycKhO0w+un1he9BTu7dA0yyIH+qhxwmDIGk6bYq8S+SeyRnm2
         basqzOKAVZ2g7jGNe+eFDjL7/aGBOvL5ZIxpUPlG/Ge743jzeaT57zv7KQxGZoSefO
         hMv4uJP7ianQ/25z00gABS5jx88dH+xUPT8b/7K3E/tLl9zpmpncqXSyJyBwfsyCsK
         cJeSw/6hspHHw==
Date:   Thu, 19 Dec 2019 11:01:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Elliot Berman <eberman@codeaurora.org>
Subject: linux-next: build failure after merge of the battery tree
Message-ID: <20191219110144.0ccba0bf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0IBJ0t3BNZwJcKT0YDq3uj2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0IBJ0t3BNZwJcKT0YDq3uj2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the battery tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "machine_restart" [drivers/power/reset/restart-poweroff.ko] undefine=
d!

Caused by commit

  263ec7d0c497 ("power: reset: Enable tristate on restart power-off driver")

I have used the bettery tree from next-20191218 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/0IBJ0t3BNZwJcKT0YDq3uj2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl36vegACgkQAVBC80lX
0Gy1MQf+KoqormuEigtJxYPMkYJ9r/p7Ov6V60zfWkGl9VzlF+Qd2weAmx8vrdxj
wCOjSevQMWnT2UU+oBoUhsm8I84c8lmV5EQmP0YfyIIiMTUhe7l/n+BSV0KTBrkL
0h2TM0KLuGFr863NTXKu5bjsjv0s71RSuI0ldamleeyqlkBNX7dYa2MK1kcgcoYf
5n56tcriZV4ie/sr0EbW6zw6UlykLysrDQoiGVX3zpKh1Trn/pr2fys/bZR9VA/0
DDTSWaSY+dLiKozZbA1N8+iuvewNNVyh/VNpPQVooIuiwPc66T1QYRGxSjrxiZ5t
o9rZ5FYejaHrX+RVgXCDPBXUn1iXLA==
=QZkr
-----END PGP SIGNATURE-----

--Sig_/0IBJ0t3BNZwJcKT0YDq3uj2--
