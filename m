Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA6B13B931
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2020 06:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgAOFrO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 00:47:14 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58901 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725962AbgAOFrO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jan 2020 00:47:14 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47yGYV2Y5cz9sNx;
        Wed, 15 Jan 2020 16:47:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579067231;
        bh=VCtIZxItOFqHZSiDDpXseytl6epnUFM5r+dAruhRX0g=;
        h=Date:From:To:Cc:Subject:From;
        b=HpYKU1iDgm+/rLuG0KuEt7If5vP1J4/Lr56aMaCu6BLjaL2C9yaxVkv6XqcPWkdyi
         YUdqGcdLg/Lo4fsPwcpTn6XuA3DUB84jHs9saeefDeg9YOYnXJCvCxJd3+afoX+K/g
         v90SY3peCCjkujcJz2CZX73GHesudDb3sz18usCNt5RS7HdwJ5uOdkXUJHpHzfnVny
         WcOSlSP8n5iRND2ewfuRWU4wYbACTczbiHXXMKjcWW47+YjutkdtWhfY9f/qOW1r1H
         WGFq2SleuJkF3idMm7ePTsDmJ0MrW1tff7VSsJcEcMoQD8MSsDQrUaQbGhDDlIEEBL
         mmYf7xUpbOxGQ==
Date:   Wed, 15 Jan 2020 16:47:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>
Subject: linux-next: manual merge of the akpm-current tree with the ftrace
 tree
Message-ID: <20200115164708.6c51494c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B0VKlpmGXcxfGIj2SKUi5OZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/B0VKlpmGXcxfGIj2SKUi5OZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  init/main.c

between commit:

  0068c92a9270 ("init/main.c: Alloc initcall_command_line in do_initcall() =
and free it")

from the ftrace tree and commit:

  21cc5aef9811 ("init/main.c: remove unnecessary repair_env_string in do_in=
itcall_level")

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

diff --cc init/main.c
index 031723614b80,7dc422c6444a..000000000000
--- a/init/main.c
+++ b/init/main.c
@@@ -249,143 -245,8 +249,142 @@@ static int __init loglevel(char *str
 =20
  early_param("loglevel", loglevel);
 =20
 +#ifdef CONFIG_BOOT_CONFIG
 +
 +char xbc_namebuf[XBC_KEYLEN_MAX] __initdata;
 +
 +#define rest(dst, end) ((end) > (dst) ? (end) - (dst) : 0)
 +
 +static int __init xbc_snprint_cmdline(char *buf, size_t size,
 +				      struct xbc_node *root)
 +{
 +	struct xbc_node *knode, *vnode;
 +	char *end =3D buf + size;
 +	char c =3D '\"';
 +	const char *val;
 +	int ret;
 +
 +	xbc_node_for_each_key_value(root, knode, val) {
 +		ret =3D xbc_node_compose_key_after(root, knode,
 +					xbc_namebuf, XBC_KEYLEN_MAX);
 +		if (ret < 0)
 +			return ret;
 +
 +		vnode =3D xbc_node_get_child(knode);
 +		ret =3D snprintf(buf, rest(buf, end), "%s%c", xbc_namebuf,
 +				vnode ? '=3D' : ' ');
 +		if (ret < 0)
 +			return ret;
 +		buf +=3D ret;
 +		if (!vnode)
 +			continue;
 +
 +		c =3D '\"';
 +		xbc_array_for_each_value(vnode, val) {
 +			ret =3D snprintf(buf, rest(buf, end), "%c%s", c, val);
 +			if (ret < 0)
 +				return ret;
 +			buf +=3D ret;
 +			c =3D ',';
 +		}
 +		if (rest(buf, end) > 2)
 +			strcpy(buf, "\" ");
 +		buf +=3D 2;
 +	}
 +
 +	return buf - (end - size);
 +}
 +#undef rest
 +
 +/* Make an extra command line under given key word */
 +static char * __init xbc_make_cmdline(const char *key)
 +{
 +	struct xbc_node *root;
 +	char *new_cmdline;
 +	int ret, len =3D 0;
 +
 +	root =3D xbc_find_node(key);
 +	if (!root)
 +		return NULL;
 +
 +	/* Count required buffer size */
 +	len =3D xbc_snprint_cmdline(NULL, 0, root);
 +	if (len <=3D 0)
 +		return NULL;
 +
 +	new_cmdline =3D memblock_alloc(len + 1, SMP_CACHE_BYTES);
 +	if (!new_cmdline) {
 +		pr_err("Failed to allocate memory for extra kernel cmdline.\n");
 +		return NULL;
 +	}
 +
 +	ret =3D xbc_snprint_cmdline(new_cmdline, len + 1, root);
 +	if (ret < 0 || ret > len) {
 +		pr_err("Failed to print extra kernel cmdline.\n");
 +		return NULL;
 +	}
 +
 +	return new_cmdline;
 +}
 +
 +u32 boot_config_checksum(unsigned char *p, u32 size)
 +{
 +	u32 ret =3D 0;
 +
 +	while (size--)
 +		ret +=3D *p++;
 +
 +	return ret;
 +}
 +
 +static void __init setup_boot_config(void)
 +{
 +	u32 size, csum;
 +	char *data, *copy;
 +	u32 *hdr;
 +
 +	if (!initrd_end)
 +		return;
 +
 +	hdr =3D (u32 *)(initrd_end - 8);
 +	size =3D hdr[0];
 +	csum =3D hdr[1];
 +
 +	if (size >=3D XBC_DATA_MAX)
 +		return;
 +
 +	data =3D ((void *)hdr) - size;
 +	if ((unsigned long)data < initrd_start)
 +		return;
 +
 +	if (boot_config_checksum((unsigned char *)data, size) !=3D csum)
 +		return;
 +
 +	copy =3D memblock_alloc(size + 1, SMP_CACHE_BYTES);
 +	if (!copy) {
 +		pr_err("Failed to allocate memory for boot config\n");
 +		return;
 +	}
 +
 +	memcpy(copy, data, size);
 +	copy[size] =3D '\0';
 +
 +	if (xbc_init(copy) < 0)
 +		pr_err("Failed to parse boot config\n");
 +	else {
 +		pr_info("Load boot config: %d bytes\n", size);
 +		/* keys starting with "kernel." are passed via cmdline */
 +		extra_command_line =3D xbc_make_cmdline("kernel");
 +		/* Also, "init." keys are init arguments */
 +		extra_init_args =3D xbc_make_cmdline("init");
 +	}
 +}
 +#else
 +#define setup_boot_config()	do { } while (0)
 +#endif
 +
  /* Change NUL term back to "=3D", to make "param" the whole string. */
- static int __init repair_env_string(char *param, char *val,
- 				    const char *unused, void *arg)
+ static void __init repair_env_string(char *param, char *val)
  {
  	if (val) {
  		/* param=3Dval or param=3D"val"? */
@@@ -1162,15 -990,22 +1161,21 @@@ static const char *initcall_level_names
  	"late",
  };
 =20
+ static int __init ignore_unknown_bootoption(char *param, char *val,
+ 			       const char *unused, void *arg)
+ {
+ 	return 0;
+ }
+=20
 -static void __init do_initcall_level(int level)
 +static void __init do_initcall_level(int level, char *command_line)
  {
  	initcall_entry_t *fn;
 =20
 -	strcpy(initcall_command_line, saved_command_line);
  	parse_args(initcall_level_names[level],
 -		   initcall_command_line, __start___param,
 +		   command_line, __start___param,
  		   __stop___param - __start___param,
  		   level, level,
- 		   NULL, &repair_env_string);
+ 		   NULL, ignore_unknown_bootoption);
 =20
  	trace_initcall_level(initcall_level_names[level]);
  	for (fn =3D initcall_levels[level]; fn < initcall_levels[level+1]; fn++)

--Sig_/B0VKlpmGXcxfGIj2SKUi5OZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4ep1wACgkQAVBC80lX
0GyunAgAgcqDoq4lE07NibfdXlua4R7B8kOAZs357QFR3I2xqgzLz5oCBQJzpz/r
xi4WbsGzzADHGgFmBgeuAGcEeFfQpQgVBGw5EF3M761QLiM3O4sKC8hKhF+fCQ7V
eMVWzXcd5Dp/rYEw3Bb9z3/XNBMYEljawLAGMg9T1Ub+leeA2sGFsF39IrUJ55v0
PTh1EzqwDR35dbSKiXMEXAXvovmmoXQDpPreAmcuzp3JRtHZzoAjWjBRprprQhyA
i/KVsNlMg1LlN/OCy3byGHuDNgRnAVXM0y//8nXkUHRxkQ3gL53V3iR4sa/wzIfL
IAO/Rt2adtDSaDU9adXV1dvH9goAqw==
=9mWW
-----END PGP SIGNATURE-----

--Sig_/B0VKlpmGXcxfGIj2SKUi5OZ--
