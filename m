Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3900328E963
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 02:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbgJOAKK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 20:10:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55033 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726012AbgJOAKJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Oct 2020 20:10:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBV644WZdz9sT6;
        Thu, 15 Oct 2020 11:10:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602720607;
        bh=35OexaiU4JOENMQy5QwfVO+h6F01NhEub1IaSvAnIcs=;
        h=Date:From:To:Cc:Subject:From;
        b=V1dTggYHQCWQcNpQBQP4zxJuEuB8SzxWJjQT6QHrs+Gh76UK1osD0gi7G//53O9Ck
         ZZXJpsvQUfvNwsk3oAm65CpmY8AdRi9OZ+AkLqhLYtoV0WAnDtFQGUFnrjgD3ZNVXd
         jfX7Uyb3V7lBJsKo5OxWJqM9bP6GZyjn1geUYOpPhJAAZK+8pHjUE0D3c9K7qVM1qj
         9OyS4ZwWVxVu1FfOQs6q+2Xt1dWI3Q3kNLBfg0dNzv2st1rX8kEwCCLW8NmyclpD4X
         7sKjYdQkkj+Ee8vvWu4yTLp0dQGSCV6xlGQIhwypNkAbPHCtG9oW+Y+LSKB9ukgSjE
         jpjhX075Kg4Zw==
Date:   Thu, 15 Oct 2020 11:10:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the risc-v and vfs trees with Linus'
 tree
Message-ID: <20201015111002.47bf431b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Cw9l92TJw2pr8L4Ps/wr/uH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Cw9l92TJw2pr8L4Ps/wr/uH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/x86/lib/getuser.S

between commit:

  ea6f043fc984 ("x86: Make __get_user() generate an out-of-line call")

from Linus' tree and commit:

  47058bb54b57 ("x86: remove address space overrides using set_fs()")

from the risc-v and vfs trees.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/lib/getuser.S
index 2cd902e06062,2f052bc96866..000000000000
--- a/arch/x86/lib/getuser.S
+++ b/arch/x86/lib/getuser.S
@@@ -35,12 -35,19 +35,21 @@@
  #include <asm/smap.h>
  #include <asm/export.h>
 =20
 +#define ASM_BARRIER_NOSPEC ALTERNATIVE "", "lfence", X86_FEATURE_LFENCE_R=
DTSC
 +
+ #ifdef CONFIG_X86_5LEVEL
+ #define LOAD_TASK_SIZE_MINUS_N(n) \
+ 	ALTERNATIVE __stringify(mov $((1 << 47) - 4096 - (n)),%rdx), \
+ 		    __stringify(mov $((1 << 56) - 4096 - (n)),%rdx), X86_FEATURE_LA57
+ #else
+ #define LOAD_TASK_SIZE_MINUS_N(n) \
+ 	mov $(TASK_SIZE_MAX - (n)),%_ASM_DX
+ #endif
+=20
  	.text
  SYM_FUNC_START(__get_user_1)
- 	mov PER_CPU_VAR(current_task), %_ASM_DX
- 	cmp TASK_addr_limit(%_ASM_DX),%_ASM_AX
+ 	LOAD_TASK_SIZE_MINUS_N(0)
+ 	cmp %_ASM_DX,%_ASM_AX
  	jae bad_get_user
  	sbb %_ASM_DX, %_ASM_DX		/* array_index_mask_nospec() */
  	and %_ASM_DX, %_ASM_AX

--Sig_/Cw9l92TJw2pr8L4Ps/wr/uH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Hk1oACgkQAVBC80lX
0GwY4Af+KZKpr2aD5oPAfY1Pu9R+pWHDJecqTXUJ0ko3sgp6b3ccB3U/hDFonhWW
Z6FgTritaKHs2wkEiSu5unIhYzSf+odCfRkau1k8R24LGG4T7Z4ohkReEJut3am3
ZV/mA1G/4g6rwh1lUZm4jTe1ilj4y0KcnFT6Xf/9vMr/RDJyz9uIyZmzNuaD7/ic
EcJ0xbGgjmRBNJwCN1rEJOGvJz+HxW6c2Q6JkGu1c7J7uopNxetJy8iKGAFJQuU7
/a9TcG5MOS8dkDhbz63g/VQqWBWdStChjfWk6AevTba+CsLuDroQUxBRstvpq2uy
v8uw6c5M/9ulrYSKO4loTKuU+1KdjA==
=HEfd
-----END PGP SIGNATURE-----

--Sig_/Cw9l92TJw2pr8L4Ps/wr/uH--
