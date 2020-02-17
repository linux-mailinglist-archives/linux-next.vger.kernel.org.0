Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEAA160955
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2020 04:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgBQD5O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 Feb 2020 22:57:14 -0500
Received: from ozlabs.org ([203.11.71.1]:59041 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726498AbgBQD5O (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 16 Feb 2020 22:57:14 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48LVYN0rkdz9sPk;
        Mon, 17 Feb 2020 14:57:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581911832;
        bh=6EWniJol+6DZkQ5B4Jfa+YWG9P7G35svR3KRf67fL8Y=;
        h=Date:From:To:Cc:Subject:From;
        b=q2EKQ/PJhAT/4CJYNJLDeR7GFfOg01Z4K/As1M2am/8q8aXDozdXz+YQGnQea52lZ
         Re3oo47Um6E7dQHU5s3Rxaa3PFKRhtE/5+6dVCKBKxpPDjEcdjKKHuzCjUATnMOqn/
         oGqXKXKPHNf+xToJoU/CoaETjJL8ZTgZT3NGBaqi3nRNBU972FZEN9Zl3+1I59yY27
         CqR8jBoj7w8Nplr5dnJh1g3fY5Z8d1ynZbSFIX29M2r1rWonq9PNhtsjrYS0IqTW1M
         y1+0Zyk1jfgMAUg7mj7b/tABGOjYLxTlfvfRzsmbn4SPu+8Fe1bb1cRxcjfm/Njga5
         PrBnVvuJwa42g==
Date:   Mon, 17 Feb 2020 14:57:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arjun Roy <arjunroy@google.com>,
        David Miller <davem@davemloft.net>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20200217145711.4af495a3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SS_/My0x1KTFXdXhlWyA9Zl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SS_/My0x1KTFXdXhlWyA9Zl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (sparc64 defconfig)
failed like this:

mm/memory.c: In function 'insert_pages':
mm/memory.c:1523:56: error: macro "pte_index" requires 2 arguments, but onl=
y 1 given
   remaining_pages_total, PTRS_PER_PTE - pte_index(addr));
                                                        ^

Caused by commit

  366142f0b000 ("mm/memory.c: add vm_insert_pages()")

This is the first use of pte_index() outside arch specific code and the
sparc64 version of pte_index() nas an extra argument.

I have reverted these commits for today:

  219ae14a9686 ("net-zerocopy-use-vm_insert_pages-for-tcp-rcv-zerocopy-fix")
  cb912fdf96bf ("net-zerocopy: use vm_insert_pages() for tcp rcv zerocopy")
  72c684430b94 ("add missing page_count() check to vm_insert_pages().")
  dbd9553775f3 ("mm-add-vm_insert_pages-fix")
  366142f0b000 ("mm/memory.c: add vm_insert_pages()")

--=20
Cheers,
Stephen Rothwell

--Sig_/SS_/My0x1KTFXdXhlWyA9Zl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5KDxcACgkQAVBC80lX
0GzNzQf/RUXYmAlRVOUsQT+ZKEgcgos9XIO/TDwMGTGkw9qdYFFL04N5SFmk7fRh
UhDeEowgceP7iMvOLD2pHTwYLbEwQ/h0FldvvUcJXLtRSnXHpd1hmlze3mCVMOkt
EKGQm93UqF836GUvqOPjjJtm6/YIgqhmCIb/TQuttZ/ZhWK0AqHzUrHNyI5hSGge
fQcjwYNqCk01SqQLVruXPD3tHTpD7DRQzG7254KLx74vTDCmfiOcdRz6ycQNmZQ5
8h8MyuN0XRC0fD1pZLf0q27JHPAmaG3NEGLRDphwRSvh18NfEeS+E1wU9ONfdPOR
rdk7PeacEmhi+aca7RY+WX+AwEo8xQ==
=wLJm
-----END PGP SIGNATURE-----

--Sig_/SS_/My0x1KTFXdXhlWyA9Zl--
