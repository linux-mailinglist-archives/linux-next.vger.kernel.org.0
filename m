Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD086361B89
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 10:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239122AbhDPI04 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Apr 2021 04:26:56 -0400
Received: from ozlabs.org ([203.11.71.1]:36179 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239119AbhDPI0z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Apr 2021 04:26:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FM8SP4w7Zz9sRK;
        Fri, 16 Apr 2021 18:26:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618561590;
        bh=rJsn2xn4zrHwTySjwVScZjOwNoNBsaujoa/Nf1VcOcI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m9aqNncDhkNr+mEYqQ5V1U0p6y0XaNTtIS15eI9WRARxUNEBauoWZtOy2HucOYcXo
         s/VqJdUVSqDoE0m8QeG5H7AzxSwvhholFT0QHI/fckBMkywlCV4zqGs4IAyAgt34MD
         J/JjsfPxI9Uth6VYb+LtAhSETfSltjYVApJERb27tdboY05Gb2PVCOWszk03sS6L8u
         p0MAht8fSAL3IDiDuMF72AXjthlRN+d9JfqpTU+Ya05KmVISBkCg9EKGvWMmPSbASY
         XARD/LygUWpn+LgU+kIKwVojvu+MLarLWJp4gTeHb8b9x/kXHgRnC03Y2uU/zL+pad
         yBLnmsCQVtYyQ==
Date:   Fri, 16 Apr 2021 18:26:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hang Lu <hangl@codeaurora.org>, Li Li <dualli@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Marco Ballesio <balejs@google.com>,
        Miguel Ojeda <ojeda@kernel.org>, Todd Kjos <tkjos@google.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: linux-next: manual merge of the rust tree with the char-misc
 tree
Message-ID: <20210416182628.53df3424@canb.auug.org.au>
In-Reply-To: <20210416175806.2acd314b@canb.auug.org.au>
References: <20210416175806.2acd314b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KRfRZ0E2adh9X.QZPmEdw7L";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KRfRZ0E2adh9X.QZPmEdw7L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 16 Apr 2021 17:58:06 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   include/uapi/linux/android/binder.h
>=20
> between commits:
>=20
>   432ff1e91694 ("binder: BINDER_FREEZE ioctl")
>   ae28c1be1e54 ("binder: BINDER_GET_FROZEN_INFO ioctl")
>   a7dc1e6f99df ("binder: tell userspace to dump current backtrace when de=
tected oneway spamming")
>=20
> from the char-misc tree and commit:
>=20
>   1fed5dee5fbb ("Android: Binder IPC in Rust (WIP)")
>=20
> from the rust tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/uapi/linux/android/binder.h
> index 20e435fe657a,7b13c9e9aa2f..000000000000
> --- a/include/uapi/linux/android/binder.h
> +++ b/include/uapi/linux/android/binder.h
> @@@ -217,31 -217,18 +217,33 @@@ struct binder_node_info_for_ref=20
>   	__u32            reserved3;
>   };
>  =20
>  +struct binder_freeze_info {
>  +	__u32            pid;
>  +	__u32            enable;
>  +	__u32            timeout_ms;
>  +};
>  +
>  +struct binder_frozen_status_info {
>  +	__u32            pid;
>  +	__u32            sync_recv;
>  +	__u32            async_recv;
>  +};
>  +
> - #define BINDER_WRITE_READ		_IOWR('b', 1, struct binder_write_read)
> - #define BINDER_SET_IDLE_TIMEOUT		_IOW('b', 3, __s64)
> - #define BINDER_SET_MAX_THREADS		_IOW('b', 5, __u32)
> - #define BINDER_SET_IDLE_PRIORITY	_IOW('b', 6, __s32)
> - #define BINDER_SET_CONTEXT_MGR		_IOW('b', 7, __s32)
> - #define BINDER_THREAD_EXIT		_IOW('b', 8, __s32)
> - #define BINDER_VERSION			_IOWR('b', 9, struct binder_version)
> - #define BINDER_GET_NODE_DEBUG_INFO	_IOWR('b', 11, struct binder_node_de=
bug_info)
> - #define BINDER_GET_NODE_INFO_FOR_REF	_IOWR('b', 12, struct binder_node_=
info_for_ref)
> - #define BINDER_SET_CONTEXT_MGR_EXT	_IOW('b', 13, struct flat_binder_obj=
ect)
> - #define BINDER_FREEZE			_IOW('b', 14, struct binder_freeze_info)
> - #define BINDER_GET_FROZEN_INFO		_IOWR('b', 15, struct binder_frozen_sta=
tus_info)
> - #define BINDER_ENABLE_ONEWAY_SPAM_DETECTION	_IOW('b', 16, __u32)
> + enum {
> + 	BINDER_WRITE_READ		=3D _IOWR('b', 1, struct binder_write_read),
> + 	BINDER_SET_IDLE_TIMEOUT		=3D _IOW('b', 3, __s64),
> + 	BINDER_SET_MAX_THREADS		=3D _IOW('b', 5, __u32),
> + 	BINDER_SET_IDLE_PRIORITY	=3D _IOW('b', 6, __s32),
> + 	BINDER_SET_CONTEXT_MGR		=3D _IOW('b', 7, __s32),
> + 	BINDER_THREAD_EXIT		=3D _IOW('b', 8, __s32),
> + 	BINDER_VERSION			=3D _IOWR('b', 9, struct binder_version),
> + 	BINDER_GET_NODE_DEBUG_INFO	=3D _IOWR('b', 11, struct binder_node_debug=
_info),
> + 	BINDER_GET_NODE_INFO_FOR_REF	=3D _IOWR('b', 12, struct binder_node_inf=
o_for_ref),
> + 	BINDER_SET_CONTEXT_MGR_EXT	=3D _IOW('b', 13, struct flat_binder_object=
),
> ++	BINDER_FREEZE			=3D _IOW('b', 14, struct binder_freeze_info)
> ++	BINDER_GET_FROZEN_INFO		=3D _IOWR('b', 15, struct binder_frozen_status=
_info)
> ++	BINDER_ENABLE_ONEWAY_SPAM_DETECTION	=3D _IOW('b', 16, __u32)
> + };
>  =20
>   /*
>    * NOTE: Two special error codes you should check for when calling

I also needed this patch (which I will add to my merge resolution):

diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/andro=
id/binder.h
index 49611d7309e0..9fca291e0132 100644
--- a/include/uapi/linux/android/binder.h
+++ b/include/uapi/linux/android/binder.h
@@ -240,9 +240,9 @@ enum {
 	BINDER_GET_NODE_DEBUG_INFO	=3D _IOWR('b', 11, struct binder_node_debug_in=
fo),
 	BINDER_GET_NODE_INFO_FOR_REF	=3D _IOWR('b', 12, struct binder_node_info_f=
or_ref),
 	BINDER_SET_CONTEXT_MGR_EXT	=3D _IOW('b', 13, struct flat_binder_object),
-	BINDER_FREEZE			=3D _IOW('b', 14, struct binder_freeze_info)
-	BINDER_GET_FROZEN_INFO		=3D _IOWR('b', 15, struct binder_frozen_status_in=
fo)
-	BINDER_ENABLE_ONEWAY_SPAM_DETECTION	=3D _IOW('b', 16, __u32)
+	BINDER_FREEZE			=3D _IOW('b', 14, struct binder_freeze_info),
+	BINDER_GET_FROZEN_INFO		=3D _IOWR('b', 15, struct binder_frozen_status_in=
fo),
+	BINDER_ENABLE_ONEWAY_SPAM_DETECTION	=3D _IOW('b', 16, __u32),
 };
=20
 /*

--=20
Cheers,
Stephen Rothwell

--Sig_/KRfRZ0E2adh9X.QZPmEdw7L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB5SjQACgkQAVBC80lX
0GwgMgf+OSuvlBKjzyvOnBasXupT/lY+YVrfsR+R0Ib84VLyVoYyjPqC0mQV97NZ
lSTQ7cApb08Tyn4h/5umk8x+len8UwGIRIY9lYJ753iwCmkjpM5gITGlxRan1G0f
sANBFyStiely1C/efnbDRqBF9hSlY2KKuM8oNiqN/llrT8DPLgLQJ49MQpn6/RRE
UIsxnIF1SekGiQl3opw7xl9uU9L+iBmzX43JXs6ypD5yv3BXl/6UZIye9hp1AR7p
8qcm6RFh/c0TsIW4tY6fAxerKVRE3GraDwysP0JVPZcb/vOsJYiKhrzQRRajMkIS
y3kFJV81cVtHIjLFxJT8iUxvNgc8Eg==
=yXu9
-----END PGP SIGNATURE-----

--Sig_/KRfRZ0E2adh9X.QZPmEdw7L--
