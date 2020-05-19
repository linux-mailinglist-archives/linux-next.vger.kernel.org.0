Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3B91D9C47
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 18:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729391AbgESQS3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 12:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728689AbgESQS1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2020 12:18:27 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54ACFC08C5C0;
        Tue, 19 May 2020 09:18:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49RLf63nH3z9sT4;
        Wed, 20 May 2020 02:18:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589905104;
        bh=CY3Av0XXjcojShvon3BQ5YHl8W2k49JZVZyswAnM1TY=;
        h=Date:From:To:Cc:Subject:From;
        b=MwYYxHKUuDnHSBZhxtgLFHNLtfxLGmhlgcKg+fta6KY/OpEL93/QUPyzboVbv11Z0
         hixZ8wNYulPuZ658qXmbC4cggt4b00FKeNC7F4uj15rpPyhAqHxvvYmfv2aMlfLLFC
         eLQlRkFitT/joROgwGKmZzJktuQwqXbJnSJOQl39oYbCwLH9BFfMzToNvqjbxxNQnG
         zbdJPtM3S82cZXF6LMn7Hzdx5En518H7sU6Cyf0nWMkngfc73JpS3HQABC7IJvVOQr
         3YT907gVilqH45TCc7xz6/Uz051Zy3z5K15LfaLV2NASItaTzxstEF/xBnjjA6UgbA
         gMGZmlNNnZMdw==
Date:   Wed, 20 May 2020 02:18:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20200520021820.618f2080@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Wapk7Tq2pmfAxxXMbCct2kj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Wapk7Tq2pmfAxxXMbCct2kj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  kernel/kprobes.c

between commit:

  4fdd88877e52 ("kprobes: Lock kprobe_mutex while showing kprobe_blacklist")

from the tip tree and commit:

  71294f4f8167 ("kernel/kprobes.c: convert to use DEFINE_SEQ_ATTRIBUTE macr=
o")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/kprobes.c
index 9622ee05f5fa,9146e1a8373b..000000000000
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@@ -2506,15 -2436,10 +2496,15 @@@ static int kprobe_blacklist_seq_show(st
  	return 0;
  }
 =20
 +static void kprobe_blacklist_seq_stop(struct seq_file *f, void *v)
 +{
 +	mutex_unlock(&kprobe_mutex);
 +}
 +
- static const struct seq_operations kprobe_blacklist_seq_ops =3D {
+ static const struct seq_operations kprobe_blacklist_sops =3D {
  	.start =3D kprobe_blacklist_seq_start,
  	.next  =3D kprobe_blacklist_seq_next,
 -	.stop  =3D kprobe_seq_stop,	/* Reuse void function */
 +	.stop  =3D kprobe_blacklist_seq_stop,
  	.show  =3D kprobe_blacklist_seq_show,
  };
 =20

--Sig_/Wapk7Tq2pmfAxxXMbCct2kj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7EBswACgkQAVBC80lX
0GwmTwf/eg4rIUVcZScw6TzYzeuHYuaQitGNnan43iMaAbASnwmmGN4/e71YUz7B
mx/XAxhL4+kFw4TQZ1ZTSdj2q5Abxorv/yhDT6esl1ZW1CLLC/vFxCqP2OeERQPs
7zvoCfIwqv4o/nb7pDUy8p2AAqe+u0zPr5rV8q6GNy7Y2VUxZfqt7YOjCN2boFsC
Tg92sHLOGqUIZkU1o4x6ZTqF6i5H4rPHwsTrWABb2YvsWmiqGL8OXAPEpJgqNOcW
Vsfq4XPhVMdwnDw29XIsXx2AgFU3sawuUioEpYlRpUhLOpzLls3QstMNa7RZ4wZH
ldxZu1lMP1xSJL8wbKvR8JWzaqzdVA==
=MdSE
-----END PGP SIGNATURE-----

--Sig_/Wapk7Tq2pmfAxxXMbCct2kj--
