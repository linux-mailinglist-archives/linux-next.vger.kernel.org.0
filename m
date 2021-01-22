Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E16372FFBFB
	for <lists+linux-next@lfdr.de>; Fri, 22 Jan 2021 06:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbhAVFJn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Jan 2021 00:09:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbhAVFJm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Jan 2021 00:09:42 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094E7C06174A;
        Thu, 21 Jan 2021 21:09:02 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DMS3G3mCmz9s2g;
        Fri, 22 Jan 2021 16:08:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611292139;
        bh=pc8vzjVjWl5BN0r853Ljs32ViP+rQiirbx1hGAwUdxw=;
        h=Date:From:To:Cc:Subject:From;
        b=W6oEMcFgufRISnRIFUyqiPnWwwSw7mFvP8+QnTCc2JVNU2W6kej8a+HuHJXxxbzFH
         xzTdc6ntRCYzdCmbZKc991IG7SjR7oGERBxtKbYjuulWwgfZxLc3vSBFy+6o/QbByX
         aN3ozPyLb20n1TvnRot7HStp5eMF8K11i3HaJHmvfgxL2EbGNGa0I0XetwwO4+Yu/O
         tSmvAiWesRMM0EFXUcxWOaYk9z+fVkw5rvj49UbPY4OeWpWA7dkv1itHbCwJnbZF3m
         WDsuQzaoB4RmxYkzJ4D8QobDBYUqBU5LFgHmoMwFDUXmqx2/RyezsTxgP5kirVPSa1
         JVB63Hd4okhNQ==
Date:   Fri, 22 Jan 2021 16:08:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Gabriel Krisman Bertazi <krisman@collabora.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the notifications tree with the keys
 tree
Message-ID: <20210122160857.3e2939de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NFD6Iu64N4KFc7GusQX22Vf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NFD6Iu64N4KFc7GusQX22Vf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the notifications tree got conflicts in:

  Documentation/security/keys/core.rst
  samples/Kconfig
  samples/watch_queue/watch_test.c
  security/keys/Kconfig

between commit:

  0c3f19da1229 ("watch_queue: Drop references to /dev/watch_queue")

from the keys tree and commit:

  e3bc554d80d3 ("watch_queue: Clean up references to /dev/watch_queue")

from the notifications tree.

I fixed it up (in each file I used the latter's version of the
conflicted text) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted
for merging.  You may also want to consider cooperating with the
maintainer of the conflicting tree to minimise any particularly complex
conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/NFD6Iu64N4KFc7GusQX22Vf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAKXekACgkQAVBC80lX
0GyX5wf/TZZMAB9EB+2j0yIhIaGlgEvHoa9J6YdumsjEphJ0mlZD90g4uwm0Hwmi
vB/8yXhUiGaSGuG2SGglPIkittOXIikVKH68hul4IL3+BlQFKTUUcqa71ZG6zaZL
eaEfa+q4ITFYdPDYiz/rWW3EKB34bl1Z0HXmuJ2+xuB87T0vR5te0eg70VyUWHsR
szbMMdmbHbQ+0DZUH68pjvc0qPc8BJx2nwKqnIGT/EFWNPm549gyMkKaD3Mx9V9m
XNj3ZCA83GhiTfFE8xCfxCBp7kxoLmPS2vVX3Z0lnBzVtHbeM1BRF08lS4Bs22CL
I0PStC/UlqVU6Fpz8YGDEmY7r2YMkA==
=TR3L
-----END PGP SIGNATURE-----

--Sig_/NFD6Iu64N4KFc7GusQX22Vf--
