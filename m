Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA1328CC6D
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 13:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgJMLWt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 07:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57571 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726493AbgJMLWr (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 07:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602588165;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=ZnIDEDwpr8eBwiGr7pQeREGplO3SYMkRODVxaJ85l1g=;
        b=DuSedm4onXyy4f2WZpFsW78Riv7ulda0KdBtEpbraQaSbXLWkXTzs0wigEb1gJjhgjD8Ua
        6GzPWIkwFE6sGK4bnjxAnH28POBqt5tKVz8YzpJenq26qeCT9d8SFECZvMi0FbtCuwHbU+
        hxfkl8yg1cike2t9zFjXo2SQ/yZMdak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-Nv28aKXONLKvadgXPCDQ4Q-1; Tue, 13 Oct 2020 07:22:44 -0400
X-MC-Unique: Nv28aKXONLKvadgXPCDQ4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ECED802B63;
        Tue, 13 Oct 2020 11:22:42 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.193.164])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B4ED6EF53;
        Tue, 13 Oct 2020 11:22:40 +0000 (UTC)
Subject: Re: linux-next: manual merge of the fuse tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Miklos Szeredi <miklos@szeredi.hu>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>
References: <20201013104747.559128e7@canb.auug.org.au>
From:   Max Reitz <mreitz@redhat.com>
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
 mQENBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
 /PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
 U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
 mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
 awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
 AAG0HU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+iQFTBBMBCAA9AhsDBQkSzAMABQsJ
 CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
 B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
 2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
 AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
 8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
 4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBuQEN
 BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
 xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
 W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
 DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
 64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAGJ
 ASUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
 sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
 alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
 /ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
 bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
 R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <8d19d870-a9b2-d3e1-c3f1-c86d8f910e92@redhat.com>
Date:   Tue, 13 Oct 2020 13:22:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201013104747.559128e7@canb.auug.org.au>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EsQqbSlWxec3Y7P46zVPPYUQ9VH7pXK5t"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EsQqbSlWxec3Y7P46zVPPYUQ9VH7pXK5t
Content-Type: multipart/mixed; boundary="vYDyOkLdLMLiQzSXpB4Q7J4nLDtWdztoi"

--vYDyOkLdLMLiQzSXpB4Q7J4nLDtWdztoi
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 13.10.20 01:47, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the fuse tree got a conflict in:
>=20
>   fs/fuse/file.c
>=20
> between commit:
>=20
>   933a3752babc ("fuse: fix the ->direct_IO() treatment of iov_iter")
>=20
> from Linus' tree and commit:
>=20
>   fcee216beb9c ("fuse: split fuse_mount off of fuse_conn")
>=20
> from the fuse tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks!  Semantically, the change looks good to me, I just noticed
something about the indentation:

> diff --cc fs/fuse/file.c
> index 43c165e796da,53d4dd1ab992..000000000000
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@@ -3120,17 -3156,10 +3146,18 @@@ fuse_direct_IO(struct kiocb *iocb, str=
u
>   =09 * By default, we want to optimize all I/Os with async request
>   =09 * submission to the client filesystem if supported.
>   =09 */
> - =09io->async =3D ff->fc->async_dio;
>  -=09io->async =3D async_dio;
> ++=09io->async =3D ff->fm->fc->async_dio;
>   =09io->iocb =3D iocb;
>   =09io->blocking =3D is_sync_kiocb(iocb);
>  =20
>  +=09/* optimization for short read */
>  +=09if (io->async && !io->write && offset + count > i_size) {
> - =09=09iov_iter_truncate(iter, fuse_round_up(ff->fc, i_size - offset));
> ++=09=09iov_iter_truncate(iter, fuse_round_up(ff->fm->fc,
> ++=09=09=09=09  i_size - offset));

Personally, I=92d align this second line to the opening parenthesis of
fuse_round_up() (as it is done in fcee216beb9c, in a hunk not shown
here, probably because it=92s been dropped in the merge.).

Max

>  +=09=09shortened =3D count - iov_iter_count(iter);
>  +=09=09count -=3D shortened;
>  +=09}
>  +
>   =09/*
>   =09 * We cannot asynchronously extend the size of a file.
>   =09 * In such case the aio will behave exactly like sync io.



--vYDyOkLdLMLiQzSXpB4Q7J4nLDtWdztoi--

--EsQqbSlWxec3Y7P46zVPPYUQ9VH7pXK5t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl+Fjf4ACgkQ9AfbAGHV
z0AZhwf/QNpKDlur+ESJiRf2IxJ57RHyTIgY3U3RD0f/XIW1MF9SOD9CvYx1/xlJ
x5Vc0DQhw+JLNL6plWWfP932EoTNAktXoqzJ6ff08msFCWBxlBFebpvXKTZPvkzO
K1nNW3CbZKJ0MT5V6Vt49lXq6NSYQctq/oTUWKmuCtLAuhB8JgVHmJIhXfl0B7sW
cXWkw1ZHbrcJXMSc+8n98Yy+sIhBnyTDmN1dxA2Z2lme80Xm/SG3mljtknNj+wba
QSwK6LHbbB46z2qd8XUXDSeT1CC2+Vsc9QoQbRydXLuf2jVFcIMFb/8nDxSU7mpf
0woTu/EU8LwEAxXGV1vBIgw9sYUkRw==
=ESf6
-----END PGP SIGNATURE-----

--EsQqbSlWxec3Y7P46zVPPYUQ9VH7pXK5t--

