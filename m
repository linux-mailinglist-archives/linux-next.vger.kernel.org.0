Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C64A1C3518
	for <lists+linux-next@lfdr.de>; Mon,  4 May 2020 10:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbgEDI6L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 May 2020 04:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726467AbgEDI6L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2020 04:58:11 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89AFC061A0E;
        Mon,  4 May 2020 01:58:10 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Fxb16TLPz9sSd;
        Mon,  4 May 2020 18:58:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588582687;
        bh=EFLzW5EtsM/NU6ka1mG0d9nnQIB7WifNEw9o5jrd4j0=;
        h=Date:From:To:Cc:Subject:From;
        b=bOLJK2jIOMRjWfEwpFuY+3NkHAi3VLxZr5EwrLDNpCAnPxvU/b0iW5TSdyJo48sPV
         Hvhv0FQ30FjVkkLdwkA+QQdOHh67zl+OiDYoGiQrLteTxPqAJcWr0njBUUT2BjMcC0
         cl6n8S5Mgk9rOzcVLdA10UAZ7ZinLA2MfltfT3yju1bHxEGiyo00ZzCcmlil3ZiWXo
         sJE7E4AXxPr5SfQYprHJ2ic4ksalraZ35JT/NBQBf+dJyQfBfKF0sag1kVYehvvNxc
         PaUpy7pD2gsNLKVsaBZ3u8cWQMQlaIj1qEMdUlAhwgITPj1am99aY96aP00OawncfV
         ESL2Z7LjY1Lng==
Date:   Mon, 4 May 2020 18:58:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xie XiuQi <xiexiuqi@huawei.com>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20200504185804.460ab939@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/71W.KGUR+NjGpIV3HJEr1sb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/71W.KGUR+NjGpIV3HJEr1sb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  f080d93e1d41 ("sched/debug: Fix trival print_task() format")

is missing a Signed-off-by from its author.

Also, there should be a blank line before the commit message tags
(it actually looks like the end of the commit message got truncated -
probably by leading dahses on a line).

--=20
Cheers,
Stephen Rothwell

--Sig_/71W.KGUR+NjGpIV3HJEr1sb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6v2RwACgkQAVBC80lX
0Gw30Af/fUBNVInZYyj9XuqNR8WspEuAKzqnxxEWtxUkZyRBCoqLAGvOnaRmPMxR
o3+uSAWj8BKKTD4vlyLQqU/r2uPTgS+1tXOfNqa+5BbX1oCI+O80PaCVMqSZRUjp
B7CFVFcWdwcNtpdf0brtLfv+xpQ8bgTm9pDzRz8rQzOdHfPqw40NuplMc2GZqtA+
eY8GDVw5b8dhUo7iR8gLczG7sGgj0SBvV7mMRn5FjabYOC+lTz3DGFZ2yTTRybf4
nr4yZtYFfW0tbhebDrDp5ZHxS6JBwZ3eyK54Gzow3pNwB2p/deYLAhK4ke0lPoDz
OpJNNqYw4pKWVBFQ24Cy/p7bCaKHIw==
=F4aE
-----END PGP SIGNATURE-----

--Sig_/71W.KGUR+NjGpIV3HJEr1sb--
