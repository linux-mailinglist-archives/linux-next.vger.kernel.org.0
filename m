Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0AE302001
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 02:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbhAYBsc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Jan 2021 20:48:32 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37243 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbhAYBsa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 24 Jan 2021 20:48:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPCRl6TGJz9sS8;
        Mon, 25 Jan 2021 12:47:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611539268;
        bh=KSEdUoDB87VxC5V6yN1WB8TD5zs3k3W0KpqUBV+/5kI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OzilgZB+ElG042b5Sh/q9Ttm90U8WIqVqy195dVOIjVv2Sw9wKd06i8V0BHWZl61L
         AOjucamqKGc0FfJEcZtwkN2TH/BhVFQpvGW8lrhm25lVMvjBx4EkuhApJ18PXOqpxs
         PfgEKrT2EbS1YqATdB5qRh0XOk6PfMPtWgQEpMauaU22NvDy8lfmO4cR2OCKUq2xgL
         C5HAv4b2Mt3YPkSqhb/PofZqhWuKRSXK+M9UggLm3ftmuhBNybviXF5Dm8klQGqZh8
         F/8t2dJOG+OOo4FbVpJZb3JG2/F8lK0uT4EnXhZv3NUAN4KAGNyJGj2B0UMkW9cAW/
         D3GmMOV7r9YvQ==
Date:   Mon, 25 Jan 2021 12:47:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Stafford Horne <shorne@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the openrisc tree with Linus' tree
Message-ID: <20210125124746.40e2638d@canb.auug.org.au>
In-Reply-To: <20210125010446.GS2002709@lianli.shorne-pla.net>
References: <20210125090506.35337fa2@canb.auug.org.au>
        <20210125010446.GS2002709@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N9ObBHMlHl_T7XVWQHiGCRs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/N9ObBHMlHl_T7XVWQHiGCRs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stafford,

On Mon, 25 Jan 2021 10:04:46 +0900 Stafford Horne <shorne@gmail.com> wrote:
>
> Thank's I knew about this conflict but I was not sure the best way to han=
dle, I
> was/am going to rebase the openrisc/for-next branch onto 5.11-rc5 once re=
leased.
> I will resolve the conflict during the rebase so you should be able to dr=
op the
> conflict patch after that.

Its a pretty trivial conflict, so I wouldn't do the rebase just for this.

> The issue is I had a fix that went straight to 5.11.  Should I usually pu=
t these
> kind of fixes on my for-next and my fixes branches in parallel, that way =
I can
> resolve conflicts on for-next before hand?

I notice that the version in Linus' tree was merged from a separate
branch.  The easiest that to do is for you to merge that same branch
into your for-next branch - that way you only get your own changes, not
any other stuff that might be in Linus' tree.

> I don't usually do that as in my mind for next is for 5.12 and fixes for =
5.11 go
> straight to 5.11.  Also, I don't like putting the same patch in 2 queues.=
  But
> if I got any advice on how to avoid this in the future it would be apprec=
iated.

Like I said, just merge your fixes branch into you for-next branch
when/if you think the fixes are important for further development, or
the conflicts become to great.

I can also add you fixes branch to linux-next if you like (I already
have 86 other "fixes" branches).

--=20
Cheers,
Stephen Rothwell

--Sig_/N9ObBHMlHl_T7XVWQHiGCRs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOI0IACgkQAVBC80lX
0GzCCQf/YAKPxZ+ay2vixNCpBYtW/DiUJpY60hz+ovo+1ndm0mg/QX1NXL9Ej8ld
+TqLacmnH6WEBaDj1SxJv90+bZWCyVLw1FjN1bRyJ9kfTAhapNReXXEpoG9mbO94
bhkE9mTDk/w75Lso1MTCNrHMhooPHojMMJZvEwJfp2CntDFRpke68zQ25itW8xUy
9Tixk18OhrNhd5GA8kyKaGilYzY9YAJHq1mexDgCzvbUF1YCVZcRYNs1SgTd0p3E
ZlcF0bV4+YP2WY+2Pfa6PFfb7oau8sV+kGszgz7UJeydx19msalbneYB1aEDbZF9
HKXCGYoJozEvkFL+2QMVqw9FptGxTA==
=YQbB
-----END PGP SIGNATURE-----

--Sig_/N9ObBHMlHl_T7XVWQHiGCRs--
