Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD38F23299C
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 03:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgG3Bk3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 21:40:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42101 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726287AbgG3Bk3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 21:40:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHCls1YL9z9sR4;
        Thu, 30 Jul 2020 11:40:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596073227;
        bh=3FAJYP8wbDsbOcsB2wzeQOd6jlQCaTaAEm8z6wj5YmE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LNiAWve/U4Xd7easNqvRvo7sLi6uSZK1qk7hpr/vDDPwD072+CtF6lQUA25fzvfsB
         botj2xNEhc67kKcu7IKW9JbVGP/R++N7hU2UacoTwfgDo0TdnNSDdcPMpwifqKTgeO
         A6X6HfLQKlNgz+LYFeNSU5znTpByGYSD2DaJGQSazGtCA8/uUfTut7sOFJBiTd0GBT
         vcm3lPUB4MVhT5nFXObgb4ARZhwb/YTV3JApbtsR9P7UUB2hZ8UYDwSzlt67/gVcL0
         pJyZCty1xoQlXYOdOHAPAUZ9+ybuPx9tk89EqeUVjrGXLUua0dwCBgZlEdZjfMqFph
         UAzCz4+NzBfpg==
Date:   Thu, 30 Jul 2020 11:40:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh@kernel.org>
Subject: Re: linux-next: build warning after merge of the mips tree
Message-ID: <20200730114023.60317d30@canb.auug.org.au>
In-Reply-To: <f2a9f50d-5299-04f8-146b-e09df8943367@flygoat.com>
References: <20200729203142.18248463@canb.auug.org.au>
        <f2a9f50d-5299-04f8-146b-e09df8943367@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XkTmWDJSI8kKcAk5PVnvlXV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XkTmWDJSI8kKcAk5PVnvlXV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jiaxun,

On Thu, 30 Jul 2020 09:04:40 +0800 Jiaxun Yang <jiaxun.yang@flygoat.com> wr=
ote:
>
> Btw: Neither James nor Ralf is still active at Linux-MIPS.

Interesting.  I have just them listed as my contacts for MIPS.  Should
I change to just Thomes (Thomas Bogendoerfer
<tsbogend@alpha.franken.de>)?

--=20
Cheers,
Stephen Rothwell

--Sig_/XkTmWDJSI8kKcAk5PVnvlXV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8iJQcACgkQAVBC80lX
0GyDZQf/WZHicMPS6TXI2rOzw7dPh9cYfnzJ5GIAhhSdPLaILysrjFwNVDEhQZMJ
dGOenAPl8bex+9YHY8rhLksCDWsuPlo7XzAy28fG40r7/3I0ykYDfGKqPk1VfINL
W8UqzUZsL5oUcIiKhtqrtdkFN3IbpitxWL2yzc0Grl80fzqoZUYxFI39XGEtNXJF
o49ve4abzaOCA81sQmMWIsG61fz1RQjbpEDT3OseqJoui83vOSXYmcUy2ta3MRmz
7kYSNoEszRv9MPK/vhTlf+ldfWA/q8IKV+GGhOfmiZ1XYP/nHdsagXrzOICRX3Jk
FsYD9yYGnNinEB0erIykCoKMbTBSvw==
=LnTa
-----END PGP SIGNATURE-----

--Sig_/XkTmWDJSI8kKcAk5PVnvlXV--
