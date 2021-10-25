Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 017264391CA
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 10:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbhJYI4w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 04:56:52 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:55637 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbhJYI4w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 04:56:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hd8034xG3z4xbq;
        Mon, 25 Oct 2021 19:54:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635152068;
        bh=iej0kjXjZ0C0zUj4zxQ80BQjk0VWVdGfN6v0h3ZeHv4=;
        h=Date:From:To:Cc:Subject:From;
        b=fQYcofEdUOkXEhrYvXReRehQucJSbLwicqVhktSqFF0uDuZki7oe9o/NKILLLpxNc
         g3g/juQC6AYefYEuf0X9i1+i+9sBhizsnUK01PPK1hLuhcvIQ3Oa2OIsFVXhrAA1s3
         XQIEhoCila2It+jJKJuzVBeHsDnbp2jgd9GRVC++OYijbHUMbYdeuR+AYNT4lTWRd/
         DIGx85MCY/LSILsIfXCjKmZ3hfdw9piiXiRk504cIqDLMDcZMNtJNt5wnM9BeShZAd
         3m/8LlVVECNvkq94N4RKGVI4Z6+8kMUrn5GYKzQaLIl2PPbbajLQCfqmu9KofN/cbI
         f2SHpHdshMnCQ==
Date:   Mon, 25 Oct 2021 19:54:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm-current tree with the ftrace
 tree
Message-ID: <20211025195426.34e4a0a1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L7yUvH1u36Sj6MLY9yuXXpe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L7yUvH1u36Sj6MLY9yuXXpe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/bootconfig.c

between commit:

  4ee1b4cac236 ("bootconfig: Cleanup dummy headers in tools/bootconfig")

from the ftrace tree and commit:

  13ab40b0e60e ("memblock: use memblock_free for freeing virtual pointers")

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

diff --cc lib/bootconfig.c
index a056ae137750,547558d80e64..000000000000
--- a/lib/bootconfig.c
+++ b/lib/bootconfig.c
@@@ -42,50 -34,6 +42,50 @@@ static int xbc_err_pos __initdata
  static int open_brace[XBC_DEPTH_MAX] __initdata;
  static int brace_index __initdata;
 =20
 +#ifdef __KERNEL__
 +static inline void *xbc_alloc_mem(size_t size)
 +{
 +	return memblock_alloc(size, SMP_CACHE_BYTES);
 +}
 +
 +static inline void xbc_free_mem(void *addr, size_t size)
 +{
- 	memblock_free_ptr(addr, size);
++	memblock_free(addr, size);
 +}
 +
 +#else /* !__KERNEL__ */
 +
 +static inline void *xbc_alloc_mem(size_t size)
 +{
 +	return malloc(size);
 +}
 +
 +static inline void xbc_free_mem(void *addr, size_t size)
 +{
 +	free(addr);
 +}
 +#endif
 +/**
 + * xbc_get_info() - Get the information of loaded boot config
 + * node_size: A pointer to store the number of nodes.
 + * data_size: A pointer to store the size of bootconfig data.
 + *
 + * Get the number of used nodes in @node_size if it is not NULL,
 + * and the size of bootconfig data in @data_size if it is not NULL.
 + * Return 0 if the boot config is initialized, or return -ENODEV.
 + */
 +int __init xbc_get_info(int *node_size, size_t *data_size)
 +{
 +	if (!xbc_data)
 +		return -ENODEV;
 +
 +	if (node_size)
 +		*node_size =3D xbc_node_num;
 +	if (data_size)
 +		*data_size =3D xbc_data_size;
 +	return 0;
 +}
 +
  static int __init xbc_parse_error(const char *msg, const char *p)
  {
  	xbc_err_msg =3D msg;

--Sig_/L7yUvH1u36Sj6MLY9yuXXpe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF2cMIACgkQAVBC80lX
0GwbLQf+KV9akMjzCoybJ49ThPgMEpUFmHdDGRXzK4ONRUNl4Ke/PdYDVy2NSi1m
2RPz9hZyp9LiUcohwSfJSifk6W8yAofr2Y5yphMc08m/FIpx7evtUNzAfEnqkkT0
fePFkvMbPD9WyRaU+d8TBO8AgGGWDa4DsTmDd7C+400vHNSup38Gnxl2qMywuKy6
Mmb90q/v0N0nH1nirOTnKZeFbX/2mF4CVoduw7XGYAdRu448RtvvCE4Enh6HWFwZ
n9jTqjoPet8+NBSeOmI+QlKjK+Ii7DNyQ1/zvr5ccxH58UuFCrX79A+wr5GLY1ik
u+7g8Xc5GpTzhz8FmojsN35jlNOnDw==
=+HnU
-----END PGP SIGNATURE-----

--Sig_/L7yUvH1u36Sj6MLY9yuXXpe--
