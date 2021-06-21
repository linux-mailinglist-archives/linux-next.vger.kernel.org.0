Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258A33AF75D
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 23:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbhFUV3m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 17:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbhFUV3k (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 17:29:40 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B17C061756;
        Mon, 21 Jun 2021 14:27:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G82fw6JSMz9sT6;
        Tue, 22 Jun 2021 07:27:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624310841;
        bh=5p2d9hSD+IPpRjv+xgTNm6UGr7prKmrmoPrVUIYlQMA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ePgctC23uvGFEaWNIpsn1NH2VjrSfYM/8UsNEG/7yU0jCVGKs/IrBuPQtPnVP2vZh
         StkGg3zy9YX1YIDp1urVouNNCzS5pU23T/PG9Mn/S5RkCz8YgXk6Mh7LITtKku4uNi
         +gF8MfQc/5vMj5uGpdj4ZTqoJlIMGTQP27ScqrpkyD6p3ZLHpafaYGrcYegsSr81Jf
         JyfEsk8D5Z2xfl6WKfbBFXdvpAS2hrA7PB0RupmKHSuPVClRkCu/6vgLcTG3ay+kME
         XHtFbGxwBKzJwldF3CTK1xM6xn/C+KlmIxIXC+Wlx2WDkoMEwJXv8yvqpvasAaY4T6
         W9Ykdyh9LlvCw==
Date:   Tue, 22 Jun 2021 07:27:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <djwong@kernel.org>
Cc:     David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Allison Henderson <allison.henderson@oracle.com>,
        Chandan Babu R <chandanrlinux@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the xfs tree
Message-ID: <20210622072719.1d312bf0@canb.auug.org.au>
In-Reply-To: <20210621171208.GD3619569@locust>
References: <20210621082656.59cae0d8@canb.auug.org.au>
        <20210621171208.GD3619569@locust>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RW4H6sPo8Y9vSIfwqAeW8lk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RW4H6sPo8Y9vSIfwqAeW8lk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Darrick,

On Mon, 21 Jun 2021 10:12:08 -0700 "Darrick J. Wong" <djwong@kernel.org> wr=
ote:
>
> On Mon, Jun 21, 2021 at 08:26:56AM +1000, Stephen Rothwell wrote:
> >=20
> > Commits
> >=20
> >   742140d2a486 ("xfs: xfs_log_force_lsn isn't passed a LSN")
> >   e30fbb337045 ("xfs: Fix CIL throttle hang when CIL space used going b=
ackwards")
> >   feb616896031 ("xfs: journal IO cache flush reductions")
> >   6a5c6f5ef0a4 ("xfs: remove need_start_rec parameter from xlog_write()=
")
> >   d7693a7f4ef9 ("xfs: CIL checkpoint flushes caches unconditionally")
> >   e45cc747a6fd ("xfs: async blkdev cache flush")
> >   9b845604a4d5 ("xfs: remove xfs_blkdev_issue_flush")
> >   25f25648e57c ("xfs: separate CIL commit record IO")
> >   a6a65fef5ef8 ("xfs: log stripe roundoff is a property of the log")
> >=20
> > are missing a Signed-off-by from their committers. =20
>=20
> <sigh> Ok, I'll rebase the branch again to fix the paperwork errors.
>=20
> For future reference, if I want to continue accepting pull requests from
> other XFS developers, what are the applicable standards for adding the
> tree maintainer's (aka my) S-o-B tags?  I can't add my own S-o-Bs after
> the fact without rewriting the branch history and changing the commit
> ids (which would lose the signed tag), so I guess that means the person
> sending the pull request has to add my S-o-B for me?  Which also doesn't
> make sense?

If you want to take a pull request, then use "git pull" (or "git fetch"
followed by "git merge") which will create a merge commit committed by
you.  The above commits were applied to your tree by you as patches (or
rebased) and so need your sign off.  The commits in a branch that you
just merge into your tree only need the SOBs for their author(s) and
committer.

If you then rebase your tree (with merge commits in it), you need to
use "git rebase -r" to preserve the merge commits.  alternatively, you
can rebase the commits you applied as patches and then redo the
pulls/merges manually.  You generally should not rebase other's work.

Of course, you should not really rebase a published tree at all (unless
vitally necessary) - see Documentation/maintainer/rebasing-and-merging.rst

--=20
Cheers,
Stephen Rothwell

--Sig_/RW4H6sPo8Y9vSIfwqAeW8lk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDRBDcACgkQAVBC80lX
0GzIlQf/S0VOECaLF1wYu8PKzSojZvRfec8gBUCFJB7sfphjhY+S8AEYUi6+tqb3
dUj85ErLygvwy50Pqjj8oWtGlEtzJsBEhMzA4DEgtDtSNUXfyOvw/LfPW75Cs0Lo
Z0lcBDfb/02GFD3llaPiGy7lOVpMDwYYEb24TbRbsmrwDXUsDmcB/sf4exUVxPTb
iq9PKPYSzLQKpfg0d6ZyIcILD8fPev8+WwduTVRHveKYRI1F5ISykP790p1OUhlU
iq8u1tpErCYbwSNFwe07u9FgkMUGoRojwWgi9Tbtd7feo1Gf1bSYteysqS1S4TI7
pUvlP9Uofp7VWqQlYlqG2dBzBLqWqg==
=OqX0
-----END PGP SIGNATURE-----

--Sig_/RW4H6sPo8Y9vSIfwqAeW8lk--
