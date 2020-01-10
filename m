Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19FA51366B9
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 06:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgAJFdm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 00:33:42 -0500
Received: from ozlabs.org ([203.11.71.1]:38505 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726096AbgAJFdl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Jan 2020 00:33:41 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47vBVC3rdYz9sRK;
        Fri, 10 Jan 2020 16:33:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578634419;
        bh=b99mOMHx0BXMMxx8Wkq1lFhZYw8ZnBB96n6c/KObwWQ=;
        h=Date:From:To:Cc:Subject:From;
        b=bfohFeTIoqrPg7Js40bEjbaN6wZCeZK/oo4xzhFXB5h3OXKd3B93O54LHNPvJUlp2
         a7vZW3MytZ8IBnEW3blU+c/E5DalZB5nXIXolr0i621EC2MG3fpauWwRIgRKTz1r01
         tOSckv1rVZo4m/3QKFYA2VlKCz8a3Rp8ggDqeK/DPObb5Ax3pN6Zs94Eh7yBEWXN9v
         XTU5NfldDBrcvDk4XidYQHR+gKrWdpQOnPu05xJibagEhlXCXBfa9s5WYgkjPcjtUO
         IzLHGdu3RNrhNqhDX38PheD+eNv4+6gIGvOfMo6SYNqd8zysOcvL0SMIurfo30frnB
         Ra25oyQdR7ttg==
Date:   Fri, 10 Jan 2020 16:33:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Khouloud Touil <ktouil@baylibre.com>
Subject: linux-next: build warning after merge of the at24 tree
Message-ID: <20200110163337.07099844@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//DXboDVVpZLnaR+MY/GWjlq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//DXboDVVpZLnaR+MY/GWjlq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the at24 tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/nvmem/core.c: In function 'nvmem_register':
drivers/nvmem/core.c:354:10: warning: returning 'long int' from a function =
with return type 'struct nvmem_device *' makes pointer from integer without=
 a cast [-Wint-conversion]
  354 |   return PTR_ERR(nvmem->wp_gpio);
      |          ^~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  2a127da461a9 ("nvmem: add support for the write-protect pin")

--=20
Cheers,
Stephen Rothwell

--Sig_//DXboDVVpZLnaR+MY/GWjlq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4YDLEACgkQAVBC80lX
0GzoKgf/VJtkEesSaLf7ywFWiWP8AvRe2Fy9OaEsdtb5zV8cOKmJYW785fj/MUWA
cSR+xFRajVa/xvFKNld97zFbUiBvkLXA6wBpqyqBjFpp3YkEkAIxqrq3PVm5GU4i
YcUQKcIVTcX9yYLABWAMChJQrumoETAOBcI77MQdLQyQVp0Dcctmu3UTMvsKKTSU
usCwPEjOZVLkJPQbWoGAVAszywXPY5U57t0MQg+LXJqUAk559IioAy311NsuKer1
+zhaBAqQQjyWBDoq5LHJMwC7jcmzPqw62BokIAFIBHsj7M8QUpTEEdS9UFzWfRsK
gjx01mVr4Ta8HvhlSE6iqNvO9gH1qA==
=ffNK
-----END PGP SIGNATURE-----

--Sig_//DXboDVVpZLnaR+MY/GWjlq--
