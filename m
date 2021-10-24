Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24493438CAF
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 01:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhJYACQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 20:02:16 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:48719 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhJYACQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 20:02:16 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hcw7D41P4z4xZ1;
        Mon, 25 Oct 2021 10:59:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635119993;
        bh=b1BB3lk/zSF22AWGbmc5Yu5uEYzv+zvmf1GPRHBOd7w=;
        h=Date:From:To:Cc:Subject:From;
        b=EVTTy5h+BdZPGvoeE47QACbxFj1uolOKbyGKvMBsPbA4PDBP7FzX85oLpTn/bYfBK
         tD8O0r1nFot2iwowuF0UFK5W8kYd4yhRSuWwT/WbufSAXZE7bRYgpAkuvD8SWesxUE
         3IYPRYqzuyLQxOxiDZeewn4OlLMA53sV+7TYjQAk+AB43WoDiyqn6gc6UTJR/iGdNB
         bqBmIEs1P3cUka2KbN/pad37qfLIW/1/otFalk/DuZ2vJeZX3iYmRwjBnGDpeScOwy
         Eq+7Bz29+9NbRLj7fBV9+uBynrzToK7jVkW8evHldPWzY1tt4s3hqAxDemmo9sR5Uf
         km1gXTkE2SWxQ==
Date:   Mon, 25 Oct 2021 10:59:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "J. Bruce Fields" <bfields@fieldses.org>,
        Trond Myklebust <trondmy@gmail.com>
Cc:     Chuck Lever <chuck.lever@oracle.com>,
        "J. Bruce Fields" <bfields@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: linux-next: manual merge of the nfsd tree with the nfs tree
Message-ID: <20211025105951.109598aa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TmR2xR5LSKXnsBSvc/TH8Kh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TmR2xR5LSKXnsBSvc/TH8Kh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nfsd tree got a conflict in:

  include/trace/events/sunrpc.h

between commit:

  b4776a341ec0 ("SUNRPC: Tracepoints should display tk_pid and cl_clid as a=
 fixed-size field")

from the nfs tree and commit:

  35940a58f9f1 ("SUNRPC: Capture value of xdr_buf::page_base")

from the nfsd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/trace/events/sunrpc.h
index dc922e664820,9ea59959a2fe..000000000000
--- a/include/trace/events/sunrpc.h
+++ b/include/trace/events/sunrpc.h
@@@ -80,11 -80,12 +82,14 @@@ DECLARE_EVENT_CLASS(rpc_xdr_buf_class
  		__entry->msg_len =3D xdr->len;
  	),
 =20
 -	TP_printk("task:%u@%u head=3D[%p,%zu] page=3D%u(%u) tail=3D[%p,%zu] len=
=3D%u",
 +	TP_printk(SUNRPC_TRACE_TASK_SPECIFIER
 +		  " head=3D[%p,%zu] page=3D%u tail=3D[%p,%zu] len=3D%u",
++		  " head=3D[%p,%zu] page=3D%u(%u) tail=3D[%p,%zu] len=3D%u",
  		__entry->task_id, __entry->client_id,
- 		__entry->head_base, __entry->head_len, __entry->page_len,
- 		__entry->tail_base, __entry->tail_len, __entry->msg_len
+ 		__entry->head_base, __entry->head_len,
+ 		__entry->page_len, __entry->page_base,
+ 		__entry->tail_base, __entry->tail_len,
+ 		__entry->msg_len
  	)
  );
 =20

--Sig_/TmR2xR5LSKXnsBSvc/TH8Kh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF183cACgkQAVBC80lX
0GyWbAf/bxcK6/Iuf3mRcmqjdnrk1ooZD9OdKAh3OPToG4H5GYjuqN9MbQvnOtDc
3eUxkRTXu3qoaL7pUn2wOSBxVy3FpUYd88yYAfvSK82s51Y/EX5iU+nxJUudaZmr
t2c8EmcnDGZMDA1QslqupqkmsdPWtiOvkLaQh6YXf1PFhuGzxcjBLE+eTqgCwQ1m
gwEknILtktCWkcRY29M522jz4EQ/pdmAuyUc1TOQvSGd1LaLUHa/5q/9eg+6ToZo
45FU1ByX5nCX8lWofmgWWLCIW2HkyVvUFjCaG3HDI7V/ccDhk6VQI33beIvaWAfG
2lPJAJL7j1tfp0niz3p5F3MMOyij8A==
=HbuO
-----END PGP SIGNATURE-----

--Sig_/TmR2xR5LSKXnsBSvc/TH8Kh--
