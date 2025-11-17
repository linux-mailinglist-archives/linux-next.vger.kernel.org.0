Return-Path: <linux-next+bounces-9039-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A9FC62746
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 06:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C61D4357E72
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 05:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8922571C5;
	Mon, 17 Nov 2025 05:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rgy49syV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5251E00B4;
	Mon, 17 Nov 2025 05:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763358685; cv=none; b=tpNVKCK9zBlkLVN3u55TgPGBRH30sucQZpnOgP6j31VKKw6FkEYLl/G7Xq6VZqiR29Iwhk6ZbwMGNJHc92WA7GAgjdDQQdrvyAnuWebv31PpBv4uzQp0JuGFLLt5Gi1sq6tXW5eY5fv1NyqVU5KgaQLJyqz/HFCaMYp5fa0PbZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763358685; c=relaxed/simple;
	bh=+7t5tfS5H+MtD9gjAZ8yD8u+whP2gVcULgcFplnOaKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jVVnOGnyKoEL8CzOdQifxjUxsxBeAPFQDJzthXv013Lrf4fveoXRx//In5f8P6TUuBzAI/yV6wuPsby9X9PtiBAG88u1NrJwVv7ozTkxHHVAKrfPHpn1oaCWuGPiY2/u9lg3GCbyscsMOAjoAmwyP6pynyO3CfpuCO5sZy4xCSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rgy49syV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763358679;
	bh=3qv9IZ9I4+9Zfb2t++zWLJcOo1IGtjumVrW0ibJzs5A=;
	h=Date:From:To:Cc:Subject:From;
	b=rgy49syVndd20PKnYjisrGvO76MZNR54+dYQjGknFK5ogWDXCfP7eJeJgNVNSl28h
	 cvcnnKGagwaw5JR14z8jtZ2BJ8SD8j7qq4plJT0COYq+jJlRI3ZHSXE9opLgDazhs8
	 DLnXabbROIUtBGCuYsOn2/TiIyH7EV5ILljU9PCwxoTtSgv9SkB25aovtMANNJh3AQ
	 4qyNKZ3j+e4JlveqKIIN7+pjvylYWux54GTRplbyhT1AxsdIfrHLqm1jRTLeNKWE/m
	 Tuq4koXAOwVCbaNdQ6VQQM2ssM7EslfzgRmn9DMW6GAjF1ss7KumHvbzdy4G+/9S+X
	 ZAMZ63yOVd5FQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8xgp5smBz58bS;
	Mon, 17 Nov 2025 16:51:18 +1100 (AEDT)
Date: Mon, 17 Nov 2025 16:51:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vhost tree with Linus' tree
Message-ID: <20251117165118.2163d5e7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QZY/tiURBtAE4D4OUboksF2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QZY/tiURBtAE4D4OUboksF2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  scripts/lib/kdoc/kdoc_parser.py

between commit:

  77e3c875f0a8 ("docs: kdoc: split struct-member rewriting out of dump_stru=
ct()")

from Linus' tree (and maybe some others) and commit:

  67ae57499e77 ("virtio: clean up features qword/dword terms")

from the vhost tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc scripts/lib/kdoc/kdoc_parser.py
index f7dbb0868367,5d629aebc8f0..000000000000
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@@ -72,133 -74,6 +72,134 @@@ doc_begin_func =3D KernRe(str(doc_com)=20
                          r'(?:[-:].*)?$',		# description (not captured)
                          cache =3D False)
 =20
 +#
 +# Here begins a long set of transformations to turn structure member pref=
ixes
 +# and macro invocations into something we can parse and generate kdoc for.
 +#
 +struct_args_pattern =3D r'([^,)]+)'
 +
 +struct_xforms =3D [
 +    # Strip attributes
 +    (KernRe(r"__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)", flags=3Dre.I =
| re.S, cache=3DFalse), ' '),
 +    (KernRe(r'\s*__aligned\s*\([^;]*\)', re.S), ' '),
 +    (KernRe(r'\s*__counted_by\s*\([^;]*\)', re.S), ' '),
 +    (KernRe(r'\s*__counted_by_(le|be)\s*\([^;]*\)', re.S), ' '),
 +    (KernRe(r'\s*__packed\s*', re.S), ' '),
 +    (KernRe(r'\s*CRYPTO_MINALIGN_ATTR', re.S), ' '),
 +    (KernRe(r'\s*____cacheline_aligned_in_smp', re.S), ' '),
 +    (KernRe(r'\s*____cacheline_aligned', re.S), ' '),
 +    (KernRe(r'\s*__cacheline_group_(begin|end)\([^\)]+\);'), ''),
 +    #
 +    # Unwrap struct_group macros based on this definition:
 +    # __struct_group(TAG, NAME, ATTRS, MEMBERS...)
 +    # which has variants like: struct_group(NAME, MEMBERS...)
 +    # Only MEMBERS arguments require documentation.
 +    #
 +    # Parsing them happens on two steps:
 +    #
 +    # 1. drop struct group arguments that aren't at MEMBERS,
 +    #    storing them as STRUCT_GROUP(MEMBERS)
 +    #
 +    # 2. remove STRUCT_GROUP() ancillary macro.
 +    #
 +    # The original logic used to remove STRUCT_GROUP() using an
 +    # advanced regex:
 +    #
 +    #   \bSTRUCT_GROUP(\(((?:(?>[^)(]+)|(?1))*)\))[^;]*;
 +    #
 +    # with two patterns that are incompatible with
 +    # Python re module, as it has:
 +    #
 +    #   - a recursive pattern: (?1)
 +    #   - an atomic grouping: (?>...)
 +    #
 +    # I tried a simpler version: but it didn't work either:
 +    #   \bSTRUCT_GROUP\(([^\)]+)\)[^;]*;
 +    #
 +    # As it doesn't properly match the end parenthesis on some cases.
 +    #
 +    # So, a better solution was crafted: there's now a NestedMatch
 +    # class that ensures that delimiters after a search are properly
 +    # matched. So, the implementation to drop STRUCT_GROUP() will be
 +    # handled in separate.
 +    #
 +    (KernRe(r'\bstruct_group\s*\(([^,]*,)', re.S), r'STRUCT_GROUP('),
 +    (KernRe(r'\bstruct_group_attr\s*\(([^,]*,){2}', re.S), r'STRUCT_GROUP=
('),
 +    (KernRe(r'\bstruct_group_tagged\s*\(([^,]*),([^,]*),', re.S), r'struc=
t \1 \2; STRUCT_GROUP('),
 +    (KernRe(r'\b__struct_group\s*\(([^,]*,){3}', re.S), r'STRUCT_GROUP('),
 +    #
 +    # Replace macros
 +    #
 +    # TODO: use NestedMatch for FOO($1, $2, ...) matches
 +    #
 +    # it is better to also move those to the NestedMatch logic,
 +    # to ensure that parenthesis will be properly matched.
 +    #
 +    (KernRe(r'__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([^\)]+)\)', re.S),
 +     r'DECLARE_BITMAP(\1, __ETHTOOL_LINK_MODE_MASK_NBITS)'),
 +    (KernRe(r'DECLARE_PHY_INTERFACE_MASK\s*\(([^\)]+)\)', re.S),
 +     r'DECLARE_BITMAP(\1, PHY_INTERFACE_MODE_MAX)'),
 +    (KernRe(r'DECLARE_BITMAP\s*\(' + struct_args_pattern + r',\s*' + stru=
ct_args_pattern + r'\)',
 +            re.S), r'unsigned long \1[BITS_TO_LONGS(\2)]'),
 +    (KernRe(r'DECLARE_HASHTABLE\s*\(' + struct_args_pattern + r',\s*' + s=
truct_args_pattern + r'\)',
 +            re.S), r'unsigned long \1[1 << ((\2) - 1)]'),
 +    (KernRe(r'DECLARE_KFIFO\s*\(' + struct_args_pattern + r',\s*' + struc=
t_args_pattern +
 +            r',\s*' + struct_args_pattern + r'\)', re.S), r'\2 *\1'),
 +    (KernRe(r'DECLARE_KFIFO_PTR\s*\(' + struct_args_pattern + r',\s*' +
 +            struct_args_pattern + r'\)', re.S), r'\2 *\1'),
 +    (KernRe(r'(?:__)?DECLARE_FLEX_ARRAY\s*\(' + struct_args_pattern + r',=
\s*' +
 +            struct_args_pattern + r'\)', re.S), r'\1 \2[]'),
 +    (KernRe(r'DEFINE_DMA_UNMAP_ADDR\s*\(' + struct_args_pattern + r'\)', =
re.S), r'dma_addr_t \1'),
 +    (KernRe(r'DEFINE_DMA_UNMAP_LEN\s*\(' + struct_args_pattern + r'\)', r=
e.S), r'__u32 \1'),
++    (KernRe(r'VIRTIO_DECLARE_FEATURES\s*\(' + args_pattern + r'\)', re.S)=
, r'u64 \1; u64 \1_array[VIRTIO_FEATURES_QWORDS]'),
 +]
 +#
 +# Regexes here are guaranteed to have the end limiter matching
 +# the start delimiter. Yet, right now, only one replace group
 +# is allowed.
 +#
 +struct_nested_prefixes =3D [
 +    (re.compile(r'\bSTRUCT_GROUP\('), r'\1'),
 +]
 +
 +#
 +# Transforms for function prototypes
 +#
 +function_xforms  =3D [
 +    (KernRe(r"^static +"), ""),
 +    (KernRe(r"^extern +"), ""),
 +    (KernRe(r"^asmlinkage +"), ""),
 +    (KernRe(r"^inline +"), ""),
 +    (KernRe(r"^__inline__ +"), ""),
 +    (KernRe(r"^__inline +"), ""),
 +    (KernRe(r"^__always_inline +"), ""),
 +    (KernRe(r"^noinline +"), ""),
 +    (KernRe(r"^__FORTIFY_INLINE +"), ""),
 +    (KernRe(r"__init +"), ""),
 +    (KernRe(r"__init_or_module +"), ""),
 +    (KernRe(r"__deprecated +"), ""),
 +    (KernRe(r"__flatten +"), ""),
 +    (KernRe(r"__meminit +"), ""),
 +    (KernRe(r"__must_check +"), ""),
 +    (KernRe(r"__weak +"), ""),
 +    (KernRe(r"__sched +"), ""),
 +    (KernRe(r"_noprof"), ""),
 +    (KernRe(r"__printf\s*\(\s*\d*\s*,\s*\d*\s*\) +"), ""),
 +    (KernRe(r"__(?:re)?alloc_size\s*\(\s*\d+\s*(?:,\s*\d+\s*)?\) +"), ""),
 +    (KernRe(r"__diagnose_as\s*\(\s*\S+\s*(?:,\s*\d+\s*)*\) +"), ""),
 +    (KernRe(r"DECL_BUCKET_PARAMS\s*\(\s*(\S+)\s*,\s*(\S+)\s*\)"), r"\1, \=
2"),
 +    (KernRe(r"__attribute_const__ +"), ""),
 +    (KernRe(r"__attribute__\s*\(\((?:[\w\s]+(?:\([^)]*\))?\s*,?)+\)\)\s+"=
), ""),
 +]
 +
 +#
 +# Apply a set of transforms to a block of text.
 +#
 +def apply_transforms(xforms, text):
 +    for search, subst in xforms:
 +        text =3D search.sub(subst, text)
 +    return text
 +
  #
  # A little helper to get rid of excess white space
  #

--Sig_/QZY/tiURBtAE4D4OUboksF2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkat9YACgkQAVBC80lX
0Gy4eQf/SrdyAKm8sg8hCMbKGBZi2+R8uCq/3KucmNzDKeHeFVvupu/gdJAeV1rM
rfGQ4qAwFxnWw1dyVThJ8ZDBfuWzsTR//bF5v79gPKQUXinq9Iv+ObYHwP1yB5CP
XPsIYbOC7NUc65DwkXzLDZ4l9VN4IlBi/SJkqFPfo7FimhHIIKNcMgV3LcdXFLQ5
aVNxlMHdnn6JSZU+mYbA57LJ2yh9937yR0o5xVIGuV7IyHiNIDyvHlyuPtsvvSk+
tyg+ogJ5qECIvVH17kzgICdYoIC9dc7mwV6LIu5/AtDO0W+9hTjlOP+mlB4wz+YT
P7LUiEy9RflTcasEZbhYlR37w+uFAg==
=RE9Y
-----END PGP SIGNATURE-----

--Sig_/QZY/tiURBtAE4D4OUboksF2--

