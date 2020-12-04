Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB402CEB8B
	for <lists+linux-next@lfdr.de>; Fri,  4 Dec 2020 11:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgLDKAq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Dec 2020 05:00:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgLDKAp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Dec 2020 05:00:45 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 641E5C0613D1;
        Fri,  4 Dec 2020 02:00:05 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CnSqj0xJWz9sWs;
        Fri,  4 Dec 2020 21:00:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607076001;
        bh=KyOLmJk+bbh08zuaMRqMB14NVXFXl63sBfY60oWJWkQ=;
        h=Date:From:To:Cc:Subject:From;
        b=DIm3UP/p7k0x/QrI+q0NDfWPKEANJ/vPsTZMh93/uoHzvv9hvAKzqpmUPPROykf2v
         pnW+sw6oLhscCfi/+x7CypnimRGCmXq2CmDJxtdrWhsJdJBmHByGHIBrw08R1hTmew
         Pk5Ni98FWJXPYtVxGFpfv1AkOfe7k0M0LnyTgQaZo0WzNGBcnmJGXaXe6KIZ3ts1K6
         lFr6mR5PzmXEbiUUW/Tr5gKvbOsRX9V6dEs3+2oaO9AsHd+oT5bJbYpQgLm31Yo/Hm
         CDkHRWc+NW8oFyBg1pnJXdqhrkXwBAb/jmv1pSm+DljdxP2kgN+9cMcctHJbBhEu36
         3lhb9E9WUAvUw==
Date:   Fri, 4 Dec 2020 21:00:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the akpm tree
Message-ID: <20201204210000.660293c6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ApxreD=mQyBp_zuXIq+7bZW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ApxreD=mQyBp_zuXIq+7bZW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (powerpc
allyesconfig) produced warnings like this:

kernel/kcov.c:296:14: warning: conflicting types for built-in function '__s=
anitizer_cov_trace_switch'; expected 'void(long unsigned int,  void *)' [-W=
builtin-declaration-mismatch]
  296 | void notrace __sanitizer_cov_trace_switch(u64 val, u64 *cases)
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

ld: warning: orphan section `.data..Lubsan_data177' from `arch/powerpc/opro=
file/op_model_pa6t.o' being placed in section `.data..Lubsan_data177'

(lots of these latter ones)

I don't know what produced these, but it is in the akpm-current or
akpm trees.

--=20
Cheers,
Stephen Rothwell

--Sig_/ApxreD=mQyBp_zuXIq+7bZW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/KCKAACgkQAVBC80lX
0Gycfgf+Jpu0lbksstLRA0C8i17lPCMxSvQg4IcskZLWUbUk2SLrP5ga3KdgSN7V
YBhl30kZuGGNWxpQGdpDkV4AhpqouvJUpeek0ZNOgP/IwzboFT5R4oLDjI3JbF+U
c1E3w4lUHGza2+bodp5dZcWlda2mfIt62h7wqK0qS+JF8YIIjT8a6Y1jJoVQvR4l
rCZhV1dT9LoYSYSwG5Unco9X3ZrX2Uj1lDztFh17pU8NzmcpVcOeo+20TeRHPdqm
hXsfWChIlaxne+kQeQvgzzdTnJIi5n8+Q8jyrFb3EtLzvBzR9v/UK8uuyRkZMEvW
3OsyufLWp6pqc+wh1Dn2gZ9gkv3JdA==
=/yDS
-----END PGP SIGNATURE-----

--Sig_/ApxreD=mQyBp_zuXIq+7bZW--
