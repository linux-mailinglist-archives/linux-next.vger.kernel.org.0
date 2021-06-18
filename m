Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFFA3AC01D
	for <lists+linux-next@lfdr.de>; Fri, 18 Jun 2021 02:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbhFRAfA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 20:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232683AbhFRAe7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 20:34:59 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5B1C061574;
        Thu, 17 Jun 2021 17:32:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G5fyl3c7kz9sT6;
        Fri, 18 Jun 2021 10:32:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623976368;
        bh=TkB+VDpF08WUR0vy6/bzN+A7ca+W8/ZnWNr3TFqRcRc=;
        h=Date:From:To:Cc:Subject:From;
        b=OsJvn6gH+V/q4tznradn+aNlt5sLGc7EG98Sf0ABvF8H3iimJLy0A85wzXmPAAa9d
         qgRgPZlt7yFbEKYlFxhOYbknFC1UYFwfoiFCFoSxYTf7LGyOso17/oTwTDMLlAzGh6
         JNOU6hMCeBXxcMTxNh3R30Ln8BaSA7GfNib7wv68P2pP6oMotX0fFoXNWdidbQRgzw
         r7Sr4CD55A/pJ0E7Y4sq98QhAiCYEbH/zwXc3jpdOFKcf+OTj1lG4tA1PyWp+HnZxA
         XM9oZaCUNgp7x+7VhqddKr4Huy1zg+Xv4rX+Zb2GzSZTOfP41xnlg4QLUWpjMyPFCC
         M58zCG6MPE9Lw==
Date:   Fri, 18 Jun 2021 10:32:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jan Kara <jack@suse.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Subject: linux-next: manual merge of the ext3 tree with Linus' tree
Message-ID: <20210618103245.02f030b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/inD=ugamMelSXyu0PolZeSk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/inD=ugamMelSXyu0PolZeSk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ext3 tree got a conflict in:

  include/uapi/asm-generic/unistd.h

between commit:

  8b1462b67f23 ("quota: finish disable quotactl_path syscall")

from Linus' tree and commit:

  64c2c2c62f92 ("quota: Change quotactl_path() systcall to an fd-based one")

from the ext3 tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/inD=ugamMelSXyu0PolZeSk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDL6a0ACgkQAVBC80lX
0Gw7QAgAiBxSofL4ZgyR56BktZdX779GBiwMXcvGNC+hMYkBJCCyVX+zAjDojRU9
UFGN8YFIlXRtt6+VnMH+M8I7jhLc3NJntayDFzsnUOdOl8vkmDEIZh0FJKjKP6WP
bLdCDVGEtUArg/5xtQ2Ii3WwBTmOjiP80is5USmZ6lkSOatRT3CqX9n1JN6DGEsA
i1yigdzfD86p1FSpACECm3AHbxHr3Kc0mQMj6xhzEJAeBXqq6Wig7wfX0sDIi7zf
EC/TBPYU+s1muSG2rema8JaFS1hTtaBaZkxXHfoD9Qyhul6ulOnKm7+84YXFibly
nwtM42B5Q7ZzpeQskPL7Pv3uOISJpQ==
=mv+g
-----END PGP SIGNATURE-----

--Sig_/inD=ugamMelSXyu0PolZeSk--
