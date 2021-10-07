Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632D8424B6B
	for <lists+linux-next@lfdr.de>; Thu,  7 Oct 2021 02:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240128AbhJGA6w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 20:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbhJGA6w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 20:58:52 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9650CC061746;
        Wed,  6 Oct 2021 17:56:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HPtFN1lZQz4xbP;
        Thu,  7 Oct 2021 11:56:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633568217;
        bh=UpZEWDiRGS+OBlhuAxcpxvS6DE5buvVbtK8MzqmhPvA=;
        h=Date:From:To:Cc:Subject:From;
        b=nGBBkhvsc5LWgJzk+GRdEn+NlwEZLtbmDX0HNrepJ9PfSTFUEYygBcuZprP9Wkxzw
         4uYZ628aRT8eOqkh35VB27DxrFgjRRhljCBbPsLJ3vEGeZ5lp/4YSiR8fb/EBzFoLC
         be6ilH7b1wJMB+0X24ofqqWeHkry1dIX6digQxD/k6cHbxnpxts9o66kklMVPB1g8m
         t50NJaK2WxoyEm/UNCALa1uxFRNyLhg4p7PjooZ6M3fY5mk1bOjcdnLkOz+r88KVxG
         00z/ah951QeC+yZ8b0Ye02E4Pj/WF09SWJG16UZi1vpOoI3+gyofTlzSQVwhTuv/Uk
         w2QTSA4HP/EjA==
Date:   Thu, 7 Oct 2021 11:56:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>, Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: linux-next: manual merge of the selinux tree with the block tree
Message-ID: <20211007115653.133463cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hYJsUwdRDsF7gElQlPLj1CV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hYJsUwdRDsF7gElQlPLj1CV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the selinux tree got a conflict in:

  fs/io_uring.c

between commit:

  3d2b8972f292 ("io_uring: optimise plugging")

from the block tree and commit:

  5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_u=
ring")

from the selinux tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/io_uring.c
index 73135c5c6168,f89d00af3a67..000000000000
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@@ -903,8 -917,10 +905,10 @@@ struct io_op_def=20
  	unsigned		buffer_select : 1;
  	/* do prep async if is going to be punted */
  	unsigned		needs_async_setup : 1;
 -	/* should block plug */
 -	unsigned		plug : 1;
 +	/* opcode is not supported by this kernel */
 +	unsigned		not_supported : 1;
+ 	/* skip auditing */
+ 	unsigned		audit_skip : 1;
  	/* size of async data needed, if any */
  	unsigned short		async_size;
  };
@@@ -6542,9 -6622,12 +6576,12 @@@ static int io_issue_sqe(struct io_kioc
  	const struct cred *creds =3D NULL;
  	int ret;
 =20
 -	if ((req->flags & REQ_F_CREDS) && req->creds !=3D current_cred())
 +	if (unlikely((req->flags & REQ_F_CREDS) && req->creds !=3D current_cred(=
)))
  		creds =3D override_creds(req->creds);
 =20
+ 	if (!io_op_defs[req->opcode].audit_skip)
+ 		audit_uring_entry(req->opcode);
+=20
  	switch (req->opcode) {
  	case IORING_OP_NOP:
  		ret =3D io_nop(req, issue_flags);
@@@ -7042,10 -7071,34 +7082,15 @@@ static int io_init_req(struct io_ring_c
  		if (!req->creds)
  			return -EINVAL;
  		get_cred(req->creds);
+ 		ret =3D security_uring_override_creds(req->creds);
+ 		if (ret) {
+ 			put_cred(req->creds);
+ 			return ret;
+ 		}
  		req->flags |=3D REQ_F_CREDS;
  	}
 -	state =3D &ctx->submit_state;
 -
 -	/*
 -	 * Plug now if we have more than 1 IO left after this, and the target
 -	 * is potentially a read/write to block based storage.
 -	 */
 -	if (!state->plug_started && state->ios_left > 1 &&
 -	    io_op_defs[req->opcode].plug) {
 -		blk_start_plug(&state->plug);
 -		state->plug_started =3D true;
 -	}
 -
 -	if (io_op_defs[req->opcode].needs_file) {
 -		req->file =3D io_file_get(ctx, req, READ_ONCE(sqe->fd),
 -					(sqe_flags & IOSQE_FIXED_FILE));
 -		if (unlikely(!req->file))
 -			ret =3D -EBADF;
 -	}
 =20
 -	state->ios_left--;
 -	return ret;
 +	return io_req_prep(req, sqe);
  }
 =20
  static int io_submit_sqe(struct io_ring_ctx *ctx, struct io_kiocb *req,

--Sig_/hYJsUwdRDsF7gElQlPLj1CV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFeRdUACgkQAVBC80lX
0GyVqwf9F3Q1y9j8NbfZIhUuTDZhZPiZRxcymjeVuSDUUEHl7nORD/Ku7YyxVJy7
RAlzn5P7XpjCECm8HbMd7KET9fqWXnmV/bg07nMk9/sOa1dN3/LM2qNMr97PBM7W
D4qFrWSfnQ9xhu7LuZk2vxvS4Eta2dpCWXnbN/+9tEaI3ZP+UI8T4jOjFtKbGjbz
ha1eaHOEzG+ZD1LGgjq8I19qQU96/WTq+0LLxiGcKDdp+9PJYY5psIBWuXr8loYa
iy3P5OxJZGe9cSvkUSK/9fKwAdQBGn6AxmgDGPQFtpL+uaBNeAc6q3qoeUx8PTDE
yeTbmFtaITsxQuUtIdIUDXoBzVD/Sg==
=QL30
-----END PGP SIGNATURE-----

--Sig_/hYJsUwdRDsF7gElQlPLj1CV--
