Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F23715A1A5
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2020 08:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgBLHSi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Feb 2020 02:18:38 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:36887 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728109AbgBLHSi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Feb 2020 02:18:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48HWG32zYRz9s1x;
        Wed, 12 Feb 2020 18:18:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581491916;
        bh=YP6oEXoQMgXjgZmzhpRJSKK/AIeIsipuyghA52XMHvQ=;
        h=Date:From:To:Cc:Subject:From;
        b=N5dTeAOFO73OzhjLDVDLthiXphqAPoPX/UMLdYoCrv0rRcU3VsY4pvUn8nLXbf7yy
         yBEtQn6qO4ItZCI4DB+LI9f84Xez1N6wbjxhhDl/hmyT8y1xsoFxw3AZJ+xVGQ+DKa
         SrR9pOwqYfrLiSL/8OAfZdMlGpJbe9j/oFOLPUf9YTw7KQYV92EuiHH38RzyXXMQYR
         uigTIW4Qinoz0vhEDEBxaC2SqilGyUycRM1kmkRC/P8DGE7RZ6lNjLBNIS53LRZRZp
         y7aZPfhXyiuP3yQ2lbYU6z8afX2QaVg9DraLNO5X/zNqn4RKMnYAld6TisN44mBsHv
         xQZr7wFAJnAeg==
Date:   Wed, 12 Feb 2020 18:18:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: linux-next: Fixes tag needs some work in the qcom tree
Message-ID: <20200212181828.55b99a9e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IFBkUUGA5O0ongyIYWeX5nz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IFBkUUGA5O0ongyIYWeX5nz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a5fccb62cc89 ("soc: qcom: aoss: Read back before triggering the IRQ")

Fixes tag

  Fixes: e91366b0a8f9 ("soc: qcom: aoss: Use wake_up_all() instead of wake_=
up_interruptible_all()")

has these problem(s):

  - Target SHA1 does not exist

I can't find a matching commit :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/IFBkUUGA5O0ongyIYWeX5nz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5DpsQACgkQAVBC80lX
0Gyd6wf/XqebfhycbHLm3F73ViAyzz4boUGPtvFzj7G24hwytalUqm919tmzX2wN
kRLseRCKKTEAUZjYi8tmg+lKsrn2vhIuJqGV2MsLYB1ep4F3GYgnOyiukpWaUp03
XG0WyMeIrsCZXjSK3YVCwpsUPImcS+W8k3z39r1lmWYVEdrgpwSJEof9MtY0FOLk
BUmPf27NR1X1sqr4KouKkHs4nNAeGG5x+Cjj2QSU321oqnsXkcfenzdqn3phhFgV
I4A/C2zVee7GCMrGdIhqUUiO4PIzKTKC7XkJ3DpveaIM0WIgpcC7GWU1XtLbgTs0
BKV3C+F+LIm09Y2Bt293tI52mIzf7g==
=GuXM
-----END PGP SIGNATURE-----

--Sig_/IFBkUUGA5O0ongyIYWeX5nz--
