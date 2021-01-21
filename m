Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCF92FF7F7
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 23:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725268AbhAUWbx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 17:31:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbhAUWbq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Jan 2021 17:31:46 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BB9C0613D6;
        Thu, 21 Jan 2021 14:31:04 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DMHD62TsXz9sCD;
        Fri, 22 Jan 2021 09:31:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611268262;
        bh=uVaQ65fEPi72B62bEe+ohl4M6CtunMGDfjs6tVElKmo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dZCa/N5jtJbt2gckDY0h6iK7P32nbtALrYKYNvA7I3ntku2CEc3isserLIP6fjdAu
         P/dcssaVS3uswMoECBAALA58XIFQKtNVpoRzU0Coviq6R7/GweMlnHfleeNcdxfJPu
         tcIHBhU1gKCNLU0zan785QJUFK629DJDW0MNkLkIHGlVZsXKgJxvVbH9dwa5jZIpq9
         M43ZL4NzdvoNlI09FrGOezzcub9fNLyY3vyOBv/W4yeikBwIJJ25irutfdEoLJvw5q
         L7gOeLNmmt0kQdkc2nhpTvjEzooHlOCMn/+vGabO/iPiCazY027RjhYZzV1pyDlkD7
         GwakTxOnJyxCA==
Date:   Fri, 22 Jan 2021 09:31:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sven Schnelle <svens@linux.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] s390: allow reschedule on syscall restart
Message-ID: <20210122093101.058cbc6a@canb.auug.org.au>
In-Reply-To: <20210122083249.60d29c33@canb.auug.org.au>
References: <20210121143926.21440-1-svens@linux.ibm.com>
        <20210121143926.21440-2-svens@linux.ibm.com>
        <20210122083249.60d29c33@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CzqynzLpR=zJy.WU4h/xyDt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CzqynzLpR=zJy.WU4h/xyDt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 22 Jan 2021 08:32:49 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> I add that today as a merge fixup patch to the merge of the rcu tree
> (which contains commit 845f44e8ef28 ("sched: Report local wake up on
> resched blind zone within idle loop") ).

That is now commit

  0932934fd95e ("sched: Report local wake up on resched blind zone within i=
dle loop")

in the rcu tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/CzqynzLpR=zJy.WU4h/xyDt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAKAKUACgkQAVBC80lX
0GzlYQf9FfgFaTc08lXMGDpckNE6vyrnGiwmjbFAW9i7Tyx0npcJVS6zFj+Wv89P
EqLT1lveFrgcYklR2JgrewzRGwcX8aIUU95m3btWge3I/pEvHqiwbQXmnj2eZUOD
RSQKWLG8RtEOW2DSaD2cHVHLNkPp0jkYn2G2dAcBGvLVbGpu89Mdr6FyymcgSKef
wnR3ymrujOe1R6I/euwjpuuwgqP6mM5NLka8HuyiZ54IEinTKHgnsP6yCV0yZu12
SLrEsLHJmSrPiG7cBDdXLo/a/HTv0zvdH0rvOU00szPecBbEkxctIjz/GprW4Bxg
pAvTq94p9WQI9OstjfV6LoKTPJPkaQ==
=nX5+
-----END PGP SIGNATURE-----

--Sig_/CzqynzLpR=zJy.WU4h/xyDt--
