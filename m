Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5D541E835
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 09:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhJAHU3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Oct 2021 03:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbhJAHU2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 Oct 2021 03:20:28 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0417C061775;
        Fri,  1 Oct 2021 00:18:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HLM0g29zJz4xVP;
        Fri,  1 Oct 2021 17:18:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633072723;
        bh=apkQLfd/Y/rylZDXzZzNHT8343n1qvERUuJ/Gpzop6c=;
        h=Date:From:To:Cc:Subject:From;
        b=SMuBORT/EtCU7lIf/UVVg8pci36tNtIgtBe+OsaRsdxk3O0IMz60a+irMkmySHJU/
         4YVXZQ4b7tLwAz0dftR+yjq/h6FB8JO0kuzbiuRin6y/3O1QjGhngdt2CewADMrtg4
         By0PLbfLGmO8Drx0rzEFUc4dZWNvWA1VdmkG35vLV3/WSbHwN9Z54zm4C1/c/JT8Hb
         p/PfO40vgaI+GB920DYQSnKmrRRLkr2KuzU5sm0k5MBXz2wwgJsOHDCEEcclFeXwBH
         UFq6N2JbcuvEtqTNI4GlpxHDN38yP9nlBfam2VBbDEEw5+hfBzvFSZuO2w+JKzoMKu
         MnDvx1E1MQRCQ==
Date:   Fri, 1 Oct 2021 17:18:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Eric Dumazet <edumazet@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of Linus' tree
Message-ID: <20211001171842.7c9482a7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZB6Ve47GOI4ri=ab//2rGY8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZB6Ve47GOI4ri=ab//2rGY8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (htmldocs) produced
this warning:

include/net/sock.h:533: warning: Function parameter or member 'sk_peer_lock=
' not described in 'sock'

Introduced by commit

  35306eb23814 ("af_unix: fix races in sk_peer_pid and sk_peer_cred accesse=
s")

--=20
Cheers,
Stephen Rothwell

--Sig_/ZB6Ve47GOI4ri=ab//2rGY8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFWtlIACgkQAVBC80lX
0Gzuogf+LCUiVN5C38ADACSuNfMWjVcIzEtT2bBFS7FF2hmEnea3lohY9JxtnytB
x+PNtQlDZDGJVhVk3BP31pfICJVtL+wO7dwS9rTNsghWMpYLkSiy1XRIV0F7QhRF
jsjLhB+lVnZ3KrOsMxi6po5Mhkt3CM2Re8WjVsMFlzpBOcJqGEGv6hCEZo0NF4GA
+xc75fDgQ9TGxSi+T5OpwB2yf1ZOTOwM/VPc18THzR+PZlW9bEbO9fj5JaztFIeS
05yNz5ba4xAaS0WTcnZxPvZiA8ggLGW6rIS5GeWPaIvU4dALqDWyb8VY8UQ/oP7J
O0bvkYLMr+le3RULpRZm0DAtVVSfGg==
=u08G
-----END PGP SIGNATURE-----

--Sig_/ZB6Ve47GOI4ri=ab//2rGY8--
