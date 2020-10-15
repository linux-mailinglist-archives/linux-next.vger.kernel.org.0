Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C1128E98E
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 02:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729108AbgJOA7H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 20:59:07 -0400
Received: from ozlabs.org ([203.11.71.1]:39667 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728153AbgJOA7H (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Oct 2020 20:59:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBWBc4Yn7z9sTD;
        Thu, 15 Oct 2020 11:59:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602723545;
        bh=xec6CFJNV9KEE6VPmqvRfa9FGlrIRQOGjUIa0dPGn/o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hcgW0gdKxHSFu9woY4I/de1djrC3YaAGjuTuKaXK/ZFyQ1xpF0u+QF2JdF4YFscNR
         WceoKV2J/FVFkFESZG4lugXUrqn7whnTaZGM+2rcwQxvTLEZ7NqhAuE0GZ/ijIJGNq
         EKkD/rjfkayaD2q6IBllFs/mU5SkA8l1ECKW5liT5CUfcYOVKn27beHkOmBXvj4eLY
         OFSCHVkyi7+4FqTYXpp1Ydi7+v8VHpRuVHDXho3C6pPuwZDbQnEbklrvJ1YXKXP2Nn
         3RSMJDFcFBtJSiPFWvca7YFjQIUKa2yVLvwya8Flq6iYpb/5m1IhRoWfe/GExvrlaE
         w7XybFlvUqYvA==
Date:   Thu, 15 Oct 2020 11:59:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Williamson <alex.williamson@redhat.com>
Cc:     Diana Craciun OSS <diana.craciun@oss.nxp.com>,
        Bharat Bhushan <Bharat.Bhushan@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfio tree
Message-ID: <20201015115903.3399b116@canb.auug.org.au>
In-Reply-To: <20201013132016.44af05f1@w520.home>
References: <20201013140744.64937ecd@canb.auug.org.au>
        <276bf3f3-108b-fe60-4d17-d3f314e61db4@oss.nxp.com>
        <20201013132016.44af05f1@w520.home>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zR4_.Oj_lERxXh4PE_i3BJW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zR4_.Oj_lERxXh4PE_i3BJW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Tue, 13 Oct 2020 13:20:16 -0600 Alex Williamson <alex.williamson@redhat.=
com> wrote:
>
> Thanks, Stephen.  Diana has posted a 32bit build fix which I've merged,
> maybe that was the error.  Also Diana's series in my branch is currently
> dependent on fsl-bus support in GregKH's char-misc-next branch.  Looking
> at the log from the successful build, I wonder if our branches are just
> in the wrong order (vfio/next processed on line 341, char-misc-next
> processed on 387).  I don't know if you regularly re-order for this
> sort of thing, otherwise it should work out when Greg's branch gets
> merged, but testing sooner in next would be preferred.

I have put the vfio tree after the char-misc tree today (so hopefully
it will build).  The proper way to do this is for you and Greg to have
a shared branch with the commits you both depend on and bot merge that
branch.  That way, it doesn't matter what order the tress are merged
(by me or Linus).

--=20
Cheers,
Stephen Rothwell

--Sig_/zR4_.Oj_lERxXh4PE_i3BJW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+HntcACgkQAVBC80lX
0GxTtAf4yc7xWhoGoCFeGsRi2+kdzuflkHfcqGNZLuXhs6WYn9qJBdszO6/8K7O6
U19EVm6oY7LJn4+DlAMNA0ldy7eaKntVEHZlIs6X+XudvnJULnd31drQVc/G7CxI
rtAtjBGjkjTG+BQJkeXM7Szi2zqWOdjVeOMomc9an/F8kn7bLoOnX4svlYzus7d6
+jWzwTNPO18DEChXaJo/YYPnQx2MgjsI91p2bEUksfz4a2QJF1X1uOPOpO2bSUkh
iehFJOcpyF27s6l6cC+kUAP3Za4WxkFQ8b8ToXhsZmxFbEb/Fs6e2S4IvVNsmTnQ
dnLsLNFtfki5/pCBGIIeFKhXJ2Ti
=kcqa
-----END PGP SIGNATURE-----

--Sig_/zR4_.Oj_lERxXh4PE_i3BJW--
