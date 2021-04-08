Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B498A357AFC
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 05:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhDHD7c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 23:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhDHD7c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Apr 2021 23:59:32 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2A4C061760;
        Wed,  7 Apr 2021 20:59:21 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FG6vq04f4z9sRf;
        Thu,  8 Apr 2021 13:59:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617854359;
        bh=eiy45DINHHLC9qF1eeA9kXMsHuIJwdAIU4erEvsXUog=;
        h=Date:From:To:Cc:Subject:From;
        b=fqLFHg9ITwmCy4fDwOr7nFczlvSJrjn8uRTwqUelq7Q5e51TrYOP7yTkYeeEastv/
         q0pg0YV0+3E66DkamQEJEOLxuk0ptGK1cGrtY7lzw5i9R3gQldiOMrxHgCmO3qOCIK
         h4D5WFWKJJpc2rWd9/FJfUAic8U+2am1xf6DdQuEy3gix80hHmth8SFDwcrdgjTvV8
         JxUEBcgixxpxt75/ciTnmi27BLVmu3LxQ8soB4oJo/OOwJSEDr4Nn+QeTYFeDtgumk
         Eo+HhXSGU03pixW2uzeTlNSM+2blzZmm8OHDa7UYZqngLSwn9JWyAmA8b+uxVFa3cI
         l1jplREehubDQ==
Date:   Thu, 8 Apr 2021 13:59:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bluetooth tree
Message-ID: <20210408135917.60ccc2dd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1psDOiO/VzeD=.w.LLa78Dk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1psDOiO/VzeD=.w.LLa78Dk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bluetooth tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from <command-line>:32:
./usr/include/linux/virtio_bt.h:1:1: error: C++ style comments are not allo=
wed in ISO C90
    1 | // SPDX-License-Identifier: BSD-3-Clause
      | ^
./usr/include/linux/virtio_bt.h:1:1: note: (this will be reported only once=
 per input file)

Caused by commit

  148a48f61393 ("Bluetooth: Add support for virtio transport driver")

I have used the bluetooth tree from next-20210407 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/1psDOiO/VzeD=.w.LLa78Dk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBuf5UACgkQAVBC80lX
0GwILgf9E9O4NXEQoZLAzj1kvcytEj4CmArWkCh/OyJ1FTyN2CmksPjNv0pEKnbD
4du5EMtOJo9cGI3Jybix/U/aiEKB+TWWxN9F2nqAHlx21L4fgAnIQCZDey/+IXK0
WtmAG8C2R5wnFlHVh8Q8VFFzp307y0WQWr/Ui10kbdrh8WifVcaRYaz+7ZXwvmjG
0Avm8EjJ5yoTghNBg55myAdt+trc8kE+chM9Ope1LxMwFy+mQeizxylYvn8TEVwl
riaSkQUTMLlBkAfsDKPJIvHUIaaue6BPSHpeNPd63rhqcZybUqORJMVQWIcSMbU9
++EHu5CORl06pynLloaiquVXQja4Yw==
=s7u8
-----END PGP SIGNATURE-----

--Sig_/1psDOiO/VzeD=.w.LLa78Dk--
