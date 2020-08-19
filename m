Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A4B24939F
	for <lists+linux-next@lfdr.de>; Wed, 19 Aug 2020 05:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgHSDsH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Aug 2020 23:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgHSDsH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Aug 2020 23:48:07 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A48EBC061389;
        Tue, 18 Aug 2020 20:48:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BWYds612fz9sTW;
        Wed, 19 Aug 2020 13:48:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597808882;
        bh=TTZQrzXtn5V6y9tWZTEomrVhqPiwNyx9TGzs5ji/lFc=;
        h=Date:From:To:Cc:Subject:From;
        b=idqV3tBmVsM3yJc9DEVw/lvmiX3gVDI67rb8Xml+0sCZMZauBjSJJzeWISW/WUtkz
         MEKMP5ViPXNuBWROdx8yQezB5ehIatvIHUQ/TRMf+hGruwP0fn5m6aCn2O5GVyQvRv
         hFC0DYVLYTaYPTYCYDCGdW3jiWqn9ZpG8tmp5ys2hbwlzZAPqNAJJcs+U9uY+ZMVVs
         d9fN7nFUNxgWwoZGWgfTM1Q3BsSDxgt3oP/qTTJ6x4d4oZ9oTE9jhEW1i79v1G1e93
         RKX8qzdGJ3DRsgvomioslzJEBA0HNucVuLlf62P+ahrVMP8sRTbyGoiQEJDWak+yEI
         73pwjawX0/m1A==
Date:   Wed, 19 Aug 2020 13:48:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: linux-next: build failure after merge of the mhi tree
Message-ID: <20200819134800.165b78a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UKvqG74hIunveY.sHCJ_jKh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UKvqG74hIunveY.sHCJ_jKh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mhi tree, today's linux-next build (x86_64 allmodconfig)
failed like this:


I am not sure which commit(s) caused this.

I have used the mhi tree from next-20200818 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/UKvqG74hIunveY.sHCJ_jKh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl88oPEACgkQAVBC80lX
0Gx9qQf/RKHNqRP6e+Mk8Mx7lffC2Ste/J7aT8M0ev7RLRFfoQabRgk7JKZ5p8wr
v/C98bfGHokPrcjJDA02FCObSXG1iQClbao9TmaqgGRTyP5B6JSLM68rR5capzjB
ehib7nvH1sj/5KNqO1V9zLBXL/jlxGg8XK+BB+S3oLnyHpYyllSVzh48bCNlzR33
OdK3c0M1ltFjvnX5icc3zVD5UnebrTTnDgKb1Ko9JynhdjH55fhDxrrRmz4Ft4bf
vxFW5CEX7ZNndKOM4aTJNIwhTkc9nbT+52cETYXsd4B0KNGLhFKe2OYys0s33ycc
MVqSpl2T9SUEIQFQ1qLSV6uO3f5h0g==
=cjsZ
-----END PGP SIGNATURE-----

--Sig_/UKvqG74hIunveY.sHCJ_jKh--
