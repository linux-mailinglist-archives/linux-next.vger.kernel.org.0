Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B242438CBC
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 02:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbhJYANC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 20:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhJYANC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 20:13:02 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05B8C061745;
        Sun, 24 Oct 2021 17:10:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HcwMf4vgyz4xbr;
        Mon, 25 Oct 2021 11:10:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635120639;
        bh=CahYHHO62eFOy5myA/8RGsjfkANf200+JsYPQzgehw4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lkzvIZ6+xzB8iHrUDexiKFIkkFITUaUr83yM3MabibkJcHLz/KDkf0+8dxj0WA1Ir
         TW6UzGUXBKDywd0gbPCnt1nrL57fGVjHZlP9K3PekYrgcrEspQ8rtKEWVwpfqcjnpK
         DOegaBI2QjBigg8mdpFFVVKAIMlZjlGurENfb7slzU8szZOylLPe8AI1FETMyZizP+
         ynJ+RU/yeSFh7NOPHzR254SSRXbdKGpKM0yPjPV6MEGFC9khgKJb86UXaMq5CfYf9T
         MrB3KwhDCQfE17pUpevLb/Q1VAQ/EZHIbVUZT+sIYaUXs/9tntdN16KdarVOLfiGNl
         JpgmqxKeGKF4A==
Date:   Mon, 25 Oct 2021 11:10:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "J. Bruce Fields" <bfields@fieldses.org>,
        Trond Myklebust <trondmy@gmail.com>
Cc:     Chuck Lever <chuck.lever@oracle.com>,
        "J. Bruce Fields" <bfields@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: linux-next: manual merge of the nfsd tree with the nfs tree
Message-ID: <20211025111037.7b4b8889@canb.auug.org.au>
In-Reply-To: <20211025105951.109598aa@canb.auug.org.au>
References: <20211025105951.109598aa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4=9mYuJ8EAlk6+lmNcnnz1.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4=9mYuJ8EAlk6+lmNcnnz1.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Oct 2021 10:59:51 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the nfsd tree got a conflict in:
>=20
>   include/trace/events/sunrpc.h
>=20
> between commit:
>=20
>   b4776a341ec0 ("SUNRPC: Tracepoints should display tk_pid and cl_clid as=
 a fixed-size field")
>=20
> from the nfs tree and commit:
>=20
>   35940a58f9f1 ("SUNRPC: Capture value of xdr_buf::page_base")
>=20
> from the nfsd tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/trace/events/sunrpc.h
> index dc922e664820,9ea59959a2fe..000000000000
> --- a/include/trace/events/sunrpc.h
> +++ b/include/trace/events/sunrpc.h
> @@@ -80,11 -80,12 +82,14 @@@ DECLARE_EVENT_CLASS(rpc_xdr_buf_class
>   		__entry->msg_len =3D xdr->len;
>   	),
>  =20
>  -	TP_printk("task:%u@%u head=3D[%p,%zu] page=3D%u(%u) tail=3D[%p,%zu] le=
n=3D%u",
>  +	TP_printk(SUNRPC_TRACE_TASK_SPECIFIER
>  +		  " head=3D[%p,%zu] page=3D%u tail=3D[%p,%zu] len=3D%u",

Oops, I have taken the above line out.

> ++		  " head=3D[%p,%zu] page=3D%u(%u) tail=3D[%p,%zu] len=3D%u",
>   		__entry->task_id, __entry->client_id,
> - 		__entry->head_base, __entry->head_len, __entry->page_len,
> - 		__entry->tail_base, __entry->tail_len, __entry->msg_len
> + 		__entry->head_base, __entry->head_len,
> + 		__entry->page_len, __entry->page_base,
> + 		__entry->tail_base, __entry->tail_len,
> + 		__entry->msg_len
>   	)
>   );

--=20
Cheers,
Stephen Rothwell

--Sig_/4=9mYuJ8EAlk6+lmNcnnz1.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF19f0ACgkQAVBC80lX
0GyvKAf+P4qrdE6aZjXK0LdRNz7wmzdQlg5jO6AFhDk95EX7jj0AygfzF61JOzY1
+xeXwBkg1jk2AciYluxiB/P21N09k9vqbMjrrzsEBKHGF5/BtZgoXgpsz48zdfvD
UgrsAq2HMeBI8xnU/cU5nR61ocaeROcbglMkxRyUS1XKcRvhvfckU5T7UnFFBlrD
RIrGpZV+2RhG7DOCzGD1CUxV1xwtL+3FJhYsTkjtjJpo+Htm/+NuQ9LS+DsI1ZBT
o6/rxKRE/XTMU85HABQMlaJickVZWYSSm9gjeGfDsVKlWiSo+YK/OVdNkeNJ0woB
VSh3+esRcs7f9sPEe3iBalyP3kfg6g==
=6Kee
-----END PGP SIGNATURE-----

--Sig_/4=9mYuJ8EAlk6+lmNcnnz1.--
