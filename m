Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC0F7E2664
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2019 00:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407869AbfJWWbh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Oct 2019 18:31:37 -0400
Received: from ozlabs.org ([203.11.71.1]:49125 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405952AbfJWWbh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Oct 2019 18:31:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46z4qB4cDDz9sNx;
        Thu, 24 Oct 2019 09:31:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571869894;
        bh=pqWxrYrhoM/ghpzv/M7z8kiMKEJDlL2eWsAmrcgxhWc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rVqtv9T453zYMiTTeuqLPY8MLLDJRr1pJHsaPoXlcTnUsbnOlsNOApQhz11IUGdGa
         Uj5ETGqGVy8rkcowNe+wRJ9GoiVX/apm0DeSFyXVMXt+UHkONwsRnoe+VUI1eBNSy2
         vV1gIzuMHYLS/fGRg49k7WrEOzJYpB9crMEnAEvDOE6SjHCVFnglU+0jbdjkiIlD0O
         Y8euhtHnfpKMJXXsFskjzw8hs3UMi4QHu7sLKOJxbxXwZ0XD4lXeR/Har7ylyc8UKE
         HwcKh6bB2ifOTPY18+vQQ/sao3jmxR40fpGOlsK+tRggzCH2vPPsP2pNFr5JEoqdqd
         W9VWUKjHXVN+Q==
Date:   Thu, 24 Oct 2019 09:31:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: bad update of the v4l-dvb-next tree
Message-ID: <20191024093127.1f2133a8@canb.auug.org.au>
In-Reply-To: <20191001072216.473e0eee@canb.auug.org.au>
References: <20191001072216.473e0eee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mTpe4QhHOLW=iMUWOmGEFqi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mTpe4QhHOLW=iMUWOmGEFqi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Tue, 1 Oct 2019 07:22:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> The v4l-dvb-next tree appears to have been reset to point to a commit
> from early 2014 ...

This is still the case ... could you please reset this branch to be
somewhere nearer to the top of Linus' tree or somewhere in the v4l-dvb
tree, please?

--=20
Cheers,
Stephen Rothwell

--Sig_/mTpe4QhHOLW=iMUWOmGEFqi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2w1L8ACgkQAVBC80lX
0Gycegf9GAm7JvphCEgjEm6vPFmVugnDmzPCq9uk20n5HU9hTGVVgc5b8Lloa4AT
Fe5Wmrw92FIcjlc0XAzNFWML3NXy7B+45fyzf08ATs6TbfCyLVRU7ySGwIAYaLGB
ZdmgQqLVneIr8BLGEArtneSUlag+QjsVk0Pb6GgQFLH8F2t5/Is2cxZIrznSZJc+
bw9HitWYi9cO1upqel+vTgbEEbu5GhTfmc1qEpe9MSAcW2h2VgFVuTH6srxyIId/
fRLLgTYeTeDqeZVjpsWYCGM8GzZHx2+Cwa3M7Rjlje/yyVmr9C6HRPdD9j5DsVz/
Rn6Qn/W/o/ldVu0EbkcnkmjPDQuJCw==
=LjPU
-----END PGP SIGNATURE-----

--Sig_/mTpe4QhHOLW=iMUWOmGEFqi--
