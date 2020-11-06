Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFED02A8D12
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 03:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725885AbgKFCjJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 21:39:09 -0500
Received: from ozlabs.org ([203.11.71.1]:50453 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbgKFCjJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Nov 2020 21:39:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CS4Mt3mpMz9sRK;
        Fri,  6 Nov 2020 13:39:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604630347;
        bh=lZsxZSHCrT5NJp2SEbtEK6+B1VqsBJ1+l4NBkDDoXVo=;
        h=Date:From:To:Cc:Subject:From;
        b=H00AsdSz8g4hFbMs5Cii7H2jwfczXsIi7ntMFnoElWGQAI0NXhrC7t6Czx1Cp2AtD
         f39wD6M3xxzvZ369ZWj5Lr1bR2urH1kXjDlOurvIKBsApRDLkSnEtTHEWS7F4SIjwe
         UlZudTugxW/F8Au81ZAAdBHEgioWXdB9xPLiz8Hi5b1BqsLPzPJa/8GmgLIXeU0oJp
         /5oCh3gYSbko8G7vZFXxTCvvJeCV/iTszV9Bb7EW7pg0hAteIo0eRMAnzAWuRx2BQL
         Tu5GafRzRM8XJo8rTtuMQgL+Y7LfiqhClCs4wwj+fhho50b1QhYcegDdPEmhmX1OzV
         BjzFK1ffDdJ2w==
Date:   Fri, 6 Nov 2020 13:39:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Ingo Molnar <mingo@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20201106133902.2ec6a1e9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_ZcUsGFamKAWrcnl6m0YsEb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_ZcUsGFamKAWrcnl6m0YsEb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  kernel/kprobes.c

between commit:

  645f224e7ba2 ("kprobes: Tell lockdep about kprobe nesting")

from Linus' tree and commits:

  d741bf41d7c7 ("kprobes: Remove kretprobe hash")
  6e426e0fcd20 ("kprobes: Replace rp->free_instance with freelist")

from the tip tree.

I fixed it up (the latter removed the code updated by the former, so I
just used the latter) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/_ZcUsGFamKAWrcnl6m0YsEb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+kt0YACgkQAVBC80lX
0GxKuQgAmFlmU9cSOb+GHKmEBUIKCO8b8LHafHcKgPCrClJcOCKiIQImdUSOF36j
3S9JO+A5dxK69op0v8ii+M2k6GndPtf9TxoyOwaqlrcozDbr1O49yB49vxfrUJwn
3ogMVmMJiDdh3A+xVoIMdET6ienrgWDjM/NZz4BkJwSKApsUC3n5tTMHhWtH2APf
AEtYBxg7UoxWtyT/15z4A/TBi86LMueCgZ5/9uBZ7pFCQwn72NaR3a/aQUGWPnBK
xahhc4B8yOQMdhXdPQd4YBm+2Fj1iH+7G8mXMEhZu9Pzxavt8PM8Jc0xjjf+MLjl
24774NeR0RBt2N5kOgyF1sxJsfAdxg==
=Ejmp
-----END PGP SIGNATURE-----

--Sig_/_ZcUsGFamKAWrcnl6m0YsEb--
