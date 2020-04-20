Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E562B1B001E
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 05:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbgDTDKE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Apr 2020 23:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725896AbgDTDKE (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Apr 2020 23:10:04 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E37C061A0C;
        Sun, 19 Apr 2020 20:10:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 495BWs4rCqz9sR4;
        Mon, 20 Apr 2020 13:10:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587352201;
        bh=IaxT8cwaTkoVkZGgMoY+Yty/92GniKebPhPt9Fxtdk4=;
        h=Date:From:To:Cc:Subject:From;
        b=SIcuoDMkJ9NRLQ6k0r6ECORjOnIyO+MGGIBbqPEaQHgZ+HhqPdwO84cRFn7PSq0Ku
         y4VfIef4fyjNehfz7JNfqKMPNnL1vWEbeKRYH5C9ICLw+PF+3NqowUqke02c0Fkpoj
         ih5HDgJs0/Eh+Effgyt9Wi3ymnHC4yAGk9OucTjnAsLRCmPP6o3KUjHt94BuPrSfsi
         fphwIAtJy6zVvCcU3SEI5iFL9SwBSVpB/LLXLXT5DhCpyXjlu3mRf5okauKbdgtBg+
         Ek9d99RTVPNuXRcQc59J6jqec1O3j77pb82M+r8io3SaGOWWpuuatS4ZGQxwod8zn+
         CfLA2hxfB8Qhw==
Date:   Mon, 20 Apr 2020 13:09:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Corey Minyard <cminyard@mvista.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Feng Tang <feng.tang@intel.com>
Subject: linux-next: build failure after merge of the ipmi tree
Message-ID: <20200420130959.489a4136@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_Upk7c5UsB8eBIUMn1NQ16l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_Upk7c5UsB8eBIUMn1NQ16l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ipmi tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/char/ipmi/ipmi_msghandler.c: In function 'free_user_work':
drivers/char/ipmi/ipmi_msghandler.c:1156:2: error: implicit declaration of =
function 'vfree'; did you mean 'kvfree'? [-Werror=3Dimplicit-function-decla=
ration]
 1156 |  vfree(user);
      |  ^~~~~
      |  kvfree
drivers/char/ipmi/ipmi_msghandler.c: In function 'ipmi_create_user':
drivers/char/ipmi/ipmi_msghandler.c:1188:13: error: implicit declaration of=
 function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=3Dimplicit-function-=
declaration]
 1188 |  new_user =3D vzalloc(sizeof(*new_user));
      |             ^~~~~~~
      |             kvzalloc
drivers/char/ipmi/ipmi_msghandler.c:1188:11: warning: assignment to 'struct=
 ipmi_user *' from 'int' makes pointer from integer without a cast [-Wint-c=
onversion]
 1188 |  new_user =3D vzalloc(sizeof(*new_user));
      |           ^

Caused by commit

  d6850a47c933 ("ipmi: use vzalloc instead of kmalloc for user creation")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 20 Apr 2020 13:03:29 +1000
Subject: [PATCH] ipmi: vzalloc use requires vmallo.h inclusion

Fixes: d6850a47c933 ("ipmi: use vzalloc instead of kmalloc for user creatio=
n")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/char/ipmi/ipmi_msghandler.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_m=
sghandler.c
index 96f157323646..9afd220cd824 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -33,6 +33,7 @@
 #include <linux/workqueue.h>
 #include <linux/uuid.h>
 #include <linux/nospec.h>
+#include <linux/vmalloc.h>
=20
 #define IPMI_DRIVER_VERSION "39.2"
=20
--=20
2.25.1

--=20
Cheers,
Stephen Rothwell

--Sig_/_Upk7c5UsB8eBIUMn1NQ16l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6dEocACgkQAVBC80lX
0GwQ8wf+IQQidTs8KTXtVJmm1xLySB05f3cbynBa66BgqggyFcoapXfaVIuG1634
WFCSrqKffykHYTkkNNhNhChvqBlKFqRUQfCoI04XRmdFU1tSBXxMOU2UH6+JAAuP
pwQ8tCxAHCwU0I5H+sFRoatpLEFqTO//xNN8kz+MMsnJ0kd9WFt4KVOeHN8iBA+M
msJ1pXkdRibFVjqcqgElvXx/Omuh5bYRVQf2SX2kHrdsXUB1pHGeHnHqRL8vqxry
ZON2/Vq904fTRqwTCkZKGvVva7OltocHMyNGsW3UhCc5nElMY3qAbJ93fsvVB+oL
HDX5z4oYSld82u3TSHd3FB/0WPvPxQ==
=wNuZ
-----END PGP SIGNATURE-----

--Sig_/_Upk7c5UsB8eBIUMn1NQ16l--
