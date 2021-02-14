Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D58831B280
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 21:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhBNUpV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 15:45:21 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:49249 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229642AbhBNUpS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 15:45:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ddzk82MP4z9sBJ;
        Mon, 15 Feb 2021 07:44:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613335474;
        bh=quTtIuJEhbzEWdTi+iLe11h/NeD1XRmXeikBFV92s1Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HMSdPrfXG7R/As0HPocHptKYYr7BpzVYgZR/jlfoTIih6AOwH6Npuo4byxnbBDCZu
         8tQiIWjWLOeC5dUnFefjEvcg3/DiHPARY/Nomy1TexMsqEAw1oV77eM6LAAkNX1z0T
         hdpuzoLsYpypWRdto3dm79Ynm3ltXJJHo+cx8TnKDZGG1S+UcqnDsPlKfmRcVd8Rie
         pHmVZ6n6Ipw7fIc7gFNgp9nligdcG0PX3EIl/OGWb8TED7KRs2fnwUv6bxlWVGesYS
         c9wkY5TBwezJxcEiAmFSv3sVU1eE19umtJ2wct1aWPiajYgXQIRW2Brr+g7EhxlpeX
         /knc86jhXRibw==
Date:   Mon, 15 Feb 2021 07:44:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Matthew Gerlach <matthew.gerlach@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Moritz Fischer <mdf@kernel.org>,
        Russ Weight <russell.h.weight@intel.com>,
        Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 drivers-x86 tree
Message-ID: <20210215074431.7a06b223@canb.auug.org.au>
In-Reply-To: <20210111130851.374bf4ea@canb.auug.org.au>
References: <20210111130851.374bf4ea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AFa=90iz+XLLOKtQtxySib1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AFa=90iz+XLLOKtQtxySib1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 11 Jan 2021 13:08:51 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the char-misc tree got conflicts in:
>=20
>   include/linux/mod_devicetable.h
>   scripts/mod/devicetable-offsets.c
>   scripts/mod/file2alias.c
>=20
> between commit:
>=20
>   eb0e90a82098 ("platform/surface: aggregator: Add dedicated bus and devi=
ce type")
>=20
> from the drivers-x86 tree and commits:
>=20
>   9326eecd9365 ("fpga: dfl: move dfl_device_id to mod_devicetable.h")
>   4a224acec597 ("fpga: dfl: add dfl bus support to MODULE_DEVICE_TABLE()")
>=20
> from the char-misc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc include/linux/mod_devicetable.h
> index 935060955152,b8dae34eca10..000000000000
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@@ -846,22 -846,28 +846,46 @@@ struct auxiliary_device_id=20
>   	kernel_ulong_t driver_data;
>   };
>  =20
>  +/* Surface System Aggregator Module */
>  +
>  +#define SSAM_MATCH_TARGET	0x1
>  +#define SSAM_MATCH_INSTANCE	0x2
>  +#define SSAM_MATCH_FUNCTION	0x4
>  +
>  +struct ssam_device_id {
>  +	__u8 match_flags;
>  +
>  +	__u8 domain;
>  +	__u8 category;
>  +	__u8 target;
>  +	__u8 instance;
>  +	__u8 function;
>  +
>  +	kernel_ulong_t driver_data;
>  +};
>  +
> + /*
> +  * DFL (Device Feature List)
> +  *
> +  * DFL defines a linked list of feature headers within the device MMIO =
space to
> +  * provide an extensible way of adding features. Software can walk thro=
ugh these
> +  * predefined data structures to enumerate features. It is now used in =
the FPGA.
> +  * See Documentation/fpga/dfl.rst for more information.
> +  *
> +  * The dfl bus type is introduced to match the individual feature devic=
es (dfl
> +  * devices) for specific dfl drivers.
> +  */
> +=20
> + /**
> +  * struct dfl_device_id -  dfl device identifier
> +  * @type: DFL FIU type of the device. See enum dfl_id_type.
> +  * @feature_id: feature identifier local to its DFL FIU type.
> +  * @driver_data: driver specific data.
> +  */
> + struct dfl_device_id {
> + 	__u16 type;
> + 	__u16 feature_id;
> + 	kernel_ulong_t driver_data;
> + };
> +=20
>   #endif /* LINUX_MOD_DEVICETABLE_H */
> diff --cc scripts/mod/devicetable-offsets.c
> index f078eeb0a961,1b14f3cde4e5..000000000000
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@@ -246,13 -246,9 +246,17 @@@ int main(void
>   	DEVID(auxiliary_device_id);
>   	DEVID_FIELD(auxiliary_device_id, name);
>  =20
>  +	DEVID(ssam_device_id);
>  +	DEVID_FIELD(ssam_device_id, match_flags);
>  +	DEVID_FIELD(ssam_device_id, domain);
>  +	DEVID_FIELD(ssam_device_id, category);
>  +	DEVID_FIELD(ssam_device_id, target);
>  +	DEVID_FIELD(ssam_device_id, instance);
>  +	DEVID_FIELD(ssam_device_id, function);
>  +
> + 	DEVID(dfl_device_id);
> + 	DEVID_FIELD(dfl_device_id, type);
> + 	DEVID_FIELD(dfl_device_id, feature_id);
> +=20
>   	return 0;
>   }
> diff --cc scripts/mod/file2alias.c
> index d21d2871387b,7ebabeb1e9c9..000000000000
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@@ -1375,28 -1375,18 +1375,40 @@@ static int do_auxiliary_entry(const cha
>   	return 1;
>   }
>  =20
>  +/*
>  + * Looks like: ssam:dNcNtNiNfN
>  + *
>  + * N is exactly 2 digits, where each is an upper-case hex digit.
>  + */
>  +static int do_ssam_entry(const char *filename, void *symval, char *alia=
s)
>  +{
>  +	DEF_FIELD(symval, ssam_device_id, match_flags);
>  +	DEF_FIELD(symval, ssam_device_id, domain);
>  +	DEF_FIELD(symval, ssam_device_id, category);
>  +	DEF_FIELD(symval, ssam_device_id, target);
>  +	DEF_FIELD(symval, ssam_device_id, instance);
>  +	DEF_FIELD(symval, ssam_device_id, function);
>  +
>  +	sprintf(alias, "ssam:d%02Xc%02X", domain, category);
>  +	ADD(alias, "t", match_flags & SSAM_MATCH_TARGET, target);
>  +	ADD(alias, "i", match_flags & SSAM_MATCH_INSTANCE, instance);
>  +	ADD(alias, "f", match_flags & SSAM_MATCH_FUNCTION, function);
>  +
>  +	return 1;
>  +}
>  +
> + /* Looks like: dfl:tNfN */
> + static int do_dfl_entry(const char *filename, void *symval, char *alias)
> + {
> + 	DEF_FIELD(symval, dfl_device_id, type);
> + 	DEF_FIELD(symval, dfl_device_id, feature_id);
> +=20
> + 	sprintf(alias, "dfl:t%04Xf%04X", type, feature_id);
> +=20
> + 	add_wildcard(alias);
> + 	return 1;
> + }
> +=20
>   /* Does namelen bytes of name exactly match the symbol? */
>   static bool sym_is(const char *name, unsigned namelen, const char *symb=
ol)
>   {
> @@@ -1472,7 -1462,7 +1484,8 @@@ static const struct devtable devtable[
>   	{"wmi", SIZE_wmi_device_id, do_wmi_entry},
>   	{"mhi", SIZE_mhi_device_id, do_mhi_entry},
>   	{"auxiliary", SIZE_auxiliary_device_id, do_auxiliary_entry},
>  +	{"ssam", SIZE_ssam_device_id, do_ssam_entry},
> + 	{"dfl", SIZE_dfl_device_id, do_dfl_entry},
>   };
>  =20
>   /* Create MODULE_ALIAS() statements.

With the merge window about to open, this is a reminder that this
conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/AFa=90iz+XLLOKtQtxySib1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApi68ACgkQAVBC80lX
0Gzf7QgAkuaBdN3b7Q5FQ0k9HR0ionAQbr/4eNOOOeeQdUOUKSq7w+fOJhTGsDmS
XCE0dtcx9HW8VMvwnBBFgBVdvMjVgA0FerYPQS7ZjDsO/u6HlRi7IdgyzfKwU2k5
sBkyOfeUV0yhjx9HzRsrpk1Il5OxI9MJk2NU1wlvJFFvwMtUFl6wMxlev6zePO+w
s4mfTalMMY1N1+Eo8CKYAQoZbH9zH+WgJauIdfind3dniOYXCK2lQ73hyB+DzVJd
05msjcCw5Q4l728kyFrVqEv86gswjvpeMKuOtgW8ALFI2uQo8Uhww7xj5krqDea0
3FDiDnDGCrROxnMAF9ye4S9Rqu6DtQ==
=zL56
-----END PGP SIGNATURE-----

--Sig_/AFa=90iz+XLLOKtQtxySib1--
