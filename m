Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2932DCAB0
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 02:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgLQBwo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 20:52:44 -0500
Received: from ozlabs.org ([203.11.71.1]:44769 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbgLQBwo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Dec 2020 20:52:44 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CxFNd2Gm1z9sSf;
        Thu, 17 Dec 2020 12:52:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608169922;
        bh=dfWdmZPKNc4knV2vA/KK2tO/Ubm6PIANJcNsarzWHlA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=B/9QUNEjyIhgdY/jO1sJlR6fZEevqnRgMsgR7fyu4308LCwV+Jh9VP85dPIjeO1Xi
         k4aUhOmZCsHl/AzMhapU/DC03sZpFvNjW7J7sKDYlPoXsQnA81vL68B4ahNYV881T6
         oowNH+1pxvbSEdAJUfuLJ84j7PZoUd0wdjIOtiZQCHUD7+rQTti+ekXkpmc5HJLP5J
         F34ApFjIacifSb8dNIdGNt2r7qWtZwwfz7q4LGZY2E5nt25uWVPBPUW+ZDMy1kMSs+
         4ekSWxAkqR8NfwhvAHSfJMNxJ2d/fI7wPHrqv728kGnQOzKWzTk6jXSW9Wu3EMwClP
         z7ZSgoklbnkAA==
Date:   Thu, 17 Dec 2020 12:52:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Trond Myklebust <trondmy@gmail.com>
Cc:     Chuck Lever <chuck.lever@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: linux-next: manual merge of the cel tree with the nfs tree
Message-ID: <20201217125200.2700c85e@canb.auug.org.au>
In-Reply-To: <20201215114150.61178713@canb.auug.org.au>
References: <20201215114150.61178713@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h92QrZQFzfS9x6KqHuqD6Nz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/h92QrZQFzfS9x6KqHuqD6Nz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Dec 2020 11:41:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the cel tree got a conflict in:
>=20
>   include/linux/sunrpc/xdr.h
>=20
> between commits:
>=20
>   9a20f6f4e6ba ("SUNRPC: Fixes for xdr_align_data()")
>   c4f2f591f02c ("SUNRPC: Fix xdr_expand_hole()")
>   f8d0e60f1056 ("SUNRPC: Cleanup - constify a number of xdr_buf helpers")
>=20
> from the nfs tree and commits:
>=20
>   5a7e702670ad ("SUNRPC: Adjust synopsis of xdr_buf_subsegment()")
>   c1346a1216ab ("NFSD: Replace the internals of the READ_BUF() macro")
>=20
> from the cel tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc include/linux/sunrpc/xdr.h
> index 68d49fdc4ee9,9b35ce50cf2b..000000000000
> --- a/include/linux/sunrpc/xdr.h
> +++ b/include/linux/sunrpc/xdr.h
> @@@ -182,14 -182,15 +182,15 @@@ xdr_adjust_iovec(struct kvec *iov, __be
>    * XDR buffer helper functions
>    */
>   extern void xdr_shift_buf(struct xdr_buf *, size_t);
>  -extern void xdr_buf_from_iov(struct kvec *, struct xdr_buf *);
>  +extern void xdr_buf_from_iov(const struct kvec *, struct xdr_buf *);
> - extern int xdr_buf_subsegment(const struct xdr_buf *, struct xdr_buf *,=
 unsigned int, unsigned int);
> + extern int xdr_buf_subsegment(const struct xdr_buf *buf, struct xdr_buf=
 *subbuf,
> + 			      unsigned int base, unsigned int len);
>   extern void xdr_buf_trim(struct xdr_buf *, unsigned int);
>  -extern int read_bytes_from_xdr_buf(struct xdr_buf *, unsigned int, void=
 *, unsigned int);
>  -extern int write_bytes_to_xdr_buf(struct xdr_buf *, unsigned int, void =
*, unsigned int);
>  +extern int read_bytes_from_xdr_buf(const struct xdr_buf *, unsigned int=
, void *, unsigned int);
>  +extern int write_bytes_to_xdr_buf(const struct xdr_buf *, unsigned int,=
 void *, unsigned int);
>  =20
>  -extern int xdr_encode_word(struct xdr_buf *, unsigned int, u32);
>  -extern int xdr_decode_word(struct xdr_buf *, unsigned int, u32 *);
>  +extern int xdr_encode_word(const struct xdr_buf *, unsigned int, u32);
>  +extern int xdr_decode_word(const struct xdr_buf *, unsigned int, u32 *);
>  =20
>   struct xdr_array2_desc;
>   typedef int (*xdr_xcode_elem_t)(struct xdr_array2_desc *desc, void *ele=
m);
> @@@ -250,10 -251,54 +251,54 @@@ extern void xdr_init_decode_pages(struc
>   extern __be32 *xdr_inline_decode(struct xdr_stream *xdr, size_t nbytes);
>   extern unsigned int xdr_read_pages(struct xdr_stream *xdr, unsigned int=
 len);
>   extern void xdr_enter_page(struct xdr_stream *xdr, unsigned int len);
>  -extern int xdr_process_buf(struct xdr_buf *buf, unsigned int offset, un=
signed int len, int (*actor)(struct scatterlist *, void *), void *data);
>  -extern uint64_t xdr_align_data(struct xdr_stream *, uint64_t, uint32_t);
>  -extern uint64_t xdr_expand_hole(struct xdr_stream *, uint64_t, uint64_t=
);
>  +extern int xdr_process_buf(const struct xdr_buf *buf, unsigned int offs=
et, unsigned int len, int (*actor)(struct scatterlist *, void *), void *dat=
a);
>  +extern unsigned int xdr_align_data(struct xdr_stream *, unsigned int of=
fset, unsigned int length);
>  +extern unsigned int xdr_expand_hole(struct xdr_stream *, unsigned int o=
ffset, unsigned int length);
> + extern bool xdr_stream_subsegment(struct xdr_stream *xdr, struct xdr_bu=
f *subbuf,
> + 				  unsigned int len);
> +=20
> + /**
> +  * xdr_set_scratch_buffer - Attach a scratch buffer for decoding data.
> +  * @xdr: pointer to xdr_stream struct
> +  * @buf: pointer to an empty buffer
> +  * @buflen: size of 'buf'
> +  *
> +  * The scratch buffer is used when decoding from an array of pages.
> +  * If an xdr_inline_decode() call spans across page boundaries, then
> +  * we copy the data into the scratch buffer in order to allow linear
> +  * access.
> +  */
> + static inline void
> + xdr_set_scratch_buffer(struct xdr_stream *xdr, void *buf, size_t buflen)
> + {
> + 	xdr->scratch.iov_base =3D buf;
> + 	xdr->scratch.iov_len =3D buflen;
> + }
> +=20
> + /**
> +  * xdr_set_scratch_page - Attach a scratch buffer for decoding data
> +  * @xdr: pointer to xdr_stream struct
> +  * @page: an anonymous page
> +  *
> +  * See xdr_set_scratch_buffer().
> +  */
> + static inline void
> + xdr_set_scratch_page(struct xdr_stream *xdr, struct page *page)
> + {
> + 	xdr_set_scratch_buffer(xdr, page_address(page), PAGE_SIZE);
> + }
> +=20
> + /**
> +  * xdr_reset_scratch_buffer - Clear scratch buffer information
> +  * @xdr: pointer to xdr_stream struct
> +  *
> +  * See xdr_set_scratch_buffer().
> +  */
> + static inline void
> + xdr_reset_scratch_buffer(struct xdr_stream *xdr)
> + {
> + 	xdr_set_scratch_buffer(xdr, NULL, 0);
> + }
>  =20
>   /**
>    * xdr_stream_remaining - Return the number of bytes remaining in the s=
tream

This is now a conflict between the nfs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/h92QrZQFzfS9x6KqHuqD6Nz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/aucAACgkQAVBC80lX
0GzGVQf/RwgIfgGotzP/br0Beon5/cP8zGHhwEuru14Rxoc5GpvmWRHJIUEAPRDD
27idD4V4IcNxnn8WQLoTUYm/zvEa3YE6tnZ4Po8vx55bIo4CNZE93VFbAh7eFGTJ
eGwnAA0ZCinkI9XusiDdOT0Jkt1a/r0ihWRasr+F2d/Rcekrl8zG+Yyj69e+ilpr
jhG5yZvRA+tDvJ5cIyQYDil+EfIzVFXwcV2iQzCYRKlCDzAKWFyGVIyWkTUTlgdY
uL/qjJa5QOons8ZZlmyXXnDYnpO0ZvS0PLnB50bu30QfL6F3U1xgB6vk9V+obznY
98n7KIXsUzLxHVAlgQroFYA55JzM6Q==
=1MfL
-----END PGP SIGNATURE-----

--Sig_/h92QrZQFzfS9x6KqHuqD6Nz--
