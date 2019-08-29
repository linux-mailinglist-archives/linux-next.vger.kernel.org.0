Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB2BA0EE0
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 03:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfH2BZk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 21:25:40 -0400
Received: from ozlabs.org ([203.11.71.1]:34711 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726079AbfH2BZk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Aug 2019 21:25:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46JlKq1rfHz9sN4;
        Thu, 29 Aug 2019 11:25:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567041935;
        bh=n8r6vSVGNYCvMq3YjOY36k2MVCAOH/mTyab3QuE4RoE=;
        h=Date:From:To:Cc:Subject:From;
        b=iIXzcNjYwOpUyNHmhDOkXsXQIBdSEfszzaNAEbW5r/JDhdZg0bKlBws4DjufOMfXS
         k2Eu54eWLRaOq1QhFYT3W/SlyPgloFX+7MTULU4eZJyB0jX++2gwgxRhSVv3GoEauo
         1kQrWONXYHuhkA5Dn+9F+jVSmuThudmOStz3fEbeflXI1BN9lSk3kLEEeHUhk6fBQm
         aWsqYmHbLbT0lvaFI4Jc/Wfb9vN1f5tgTZSN3oF1R57ikgl9pPBDoP+3n1TtcAHMQX
         PHLE5eDq8MVO/Nxfwy7F2Jf7icyEpqYAbogGO0p3QwQXXN/z9WOPyQJfwLklX1dkFL
         ZTYE2e0KekfXg==
Date:   Thu, 29 Aug 2019 11:25:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>, Sage Weil <sage@newdream.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        "Yan, Zheng" <zyan@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
Subject: linux-next: manual merge of the vfs tree with the ceph tree
Message-ID: <20190829112513.7dd095c4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M/nC=A2DWWA/W9vnrRwdUOy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/M/nC=A2DWWA/W9vnrRwdUOy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/ceph/super.c

between commit:

  8e4133936f30 ("ceph: auto reconnect after blacklisted")

from the ceph tree and commit:

  d91c9998290b ("vfs: Convert ceph to use the new mount API")

from the vfs tree.

I fixed it up (Thanks to Al for the supplied merge resolution, see
below) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/ceph/super.c
index 03b63b1cd32c,6be1e75e70c5..000000000000
--- a/fs/ceph/super.c
+++ b/fs/ceph/super.c
@@@ -138,266 -139,269 +139,279 @@@ enum=20
  	Opt_readdir_max_entries,
  	Opt_readdir_max_bytes,
  	Opt_congestion_kb,
- 	Opt_last_int,
- 	/* int args above */
  	Opt_snapdirname,
  	Opt_mds_namespace,
- 	Opt_fscache_uniq,
 +	Opt_recover_session,
- 	Opt_last_string,
- 	/* string args above */
  	Opt_dirstat,
- 	Opt_nodirstat,
  	Opt_rbytes,
- 	Opt_norbytes,
  	Opt_asyncreaddir,
- 	Opt_noasyncreaddir,
  	Opt_dcache,
- 	Opt_nodcache,
  	Opt_ino32,
- 	Opt_noino32,
  	Opt_fscache,
- 	Opt_nofscache,
  	Opt_poolperm,
- 	Opt_nopoolperm,
  	Opt_require_active_mds,
- 	Opt_norequire_active_mds,
- #ifdef CONFIG_CEPH_FS_POSIX_ACL
  	Opt_acl,
- #endif
- 	Opt_noacl,
  	Opt_quotadf,
- 	Opt_noquotadf,
  	Opt_copyfrom,
- 	Opt_nocopyfrom,
+ 	Opt_source,
  };
 =20
- static match_table_t fsopt_tokens =3D {
- 	{Opt_wsize, "wsize=3D%d"},
- 	{Opt_rsize, "rsize=3D%d"},
- 	{Opt_rasize, "rasize=3D%d"},
- 	{Opt_caps_wanted_delay_min, "caps_wanted_delay_min=3D%d"},
- 	{Opt_caps_wanted_delay_max, "caps_wanted_delay_max=3D%d"},
- 	{Opt_caps_max, "caps_max=3D%d"},
- 	{Opt_readdir_max_entries, "readdir_max_entries=3D%d"},
- 	{Opt_readdir_max_bytes, "readdir_max_bytes=3D%d"},
- 	{Opt_congestion_kb, "write_congestion_kb=3D%d"},
- 	/* int args above */
- 	{Opt_snapdirname, "snapdirname=3D%s"},
- 	{Opt_mds_namespace, "mds_namespace=3D%s"},
- 	{Opt_recover_session, "recover_session=3D%s"},
- 	{Opt_fscache_uniq, "fsc=3D%s"},
- 	/* string args above */
- 	{Opt_dirstat, "dirstat"},
- 	{Opt_nodirstat, "nodirstat"},
- 	{Opt_rbytes, "rbytes"},
- 	{Opt_norbytes, "norbytes"},
- 	{Opt_asyncreaddir, "asyncreaddir"},
- 	{Opt_noasyncreaddir, "noasyncreaddir"},
- 	{Opt_dcache, "dcache"},
- 	{Opt_nodcache, "nodcache"},
- 	{Opt_ino32, "ino32"},
- 	{Opt_noino32, "noino32"},
- 	{Opt_fscache, "fsc"},
- 	{Opt_nofscache, "nofsc"},
- 	{Opt_poolperm, "poolperm"},
- 	{Opt_nopoolperm, "nopoolperm"},
- 	{Opt_require_active_mds, "require_active_mds"},
- 	{Opt_norequire_active_mds, "norequire_active_mds"},
- #ifdef CONFIG_CEPH_FS_POSIX_ACL
- 	{Opt_acl, "acl"},
- #endif
- 	{Opt_noacl, "noacl"},
- 	{Opt_quotadf, "quotadf"},
- 	{Opt_noquotadf, "noquotadf"},
- 	{Opt_copyfrom, "copyfrom"},
- 	{Opt_nocopyfrom, "nocopyfrom"},
- 	{-1, NULL}
+ static const struct fs_parameter_spec ceph_param_specs[] =3D {
+ 	fsparam_flag_no ("acl",				Opt_acl),
+ 	fsparam_flag_no ("asyncreaddir",		Opt_asyncreaddir),
+ 	fsparam_u32	("caps_max",			Opt_caps_max),
+ 	fsparam_u32	("caps_wanted_delay_max",	Opt_caps_wanted_delay_max),
+ 	fsparam_u32	("caps_wanted_delay_min",	Opt_caps_wanted_delay_min),
+ 	fsparam_s32	("write_congestion_kb",		Opt_congestion_kb),
+ 	fsparam_flag_no ("copyfrom",			Opt_copyfrom),
+ 	fsparam_flag_no ("dcache",			Opt_dcache),
+ 	fsparam_flag_no ("dirstat",			Opt_dirstat),
+ 	__fsparam	(fs_param_is_string, "fsc",	Opt_fscache,
+ 			 fs_param_neg_with_no | fs_param_v_optional),
+ 	fsparam_flag_no ("ino32",			Opt_ino32),
+ 	fsparam_string	("mds_namespace",		Opt_mds_namespace),
++	fsparam_string	("recover_session",		Opt_recover_session),
+ 	fsparam_flag_no ("poolperm",			Opt_poolperm),
+ 	fsparam_flag_no ("quotadf",			Opt_quotadf),
+ 	fsparam_u32	("rasize",			Opt_rasize),
+ 	fsparam_flag_no ("rbytes",			Opt_rbytes),
+ 	fsparam_s32	("readdir_max_bytes",		Opt_readdir_max_bytes),
+ 	fsparam_s32	("readdir_max_entries",		Opt_readdir_max_entries),
+ 	fsparam_flag_no ("require_active_mds",		Opt_require_active_mds),
+ 	fsparam_u32	("rsize",			Opt_rsize),
+ 	fsparam_string	("snapdirname",			Opt_snapdirname),
+ 	fsparam_string	("source",			Opt_source),
+ 	fsparam_u32	("wsize",			Opt_wsize),
+ 	{}
+ };
+=20
+ static const struct fs_parameter_description ceph_fs_parameters =3D {
+         .name           =3D "ceph",
+         .specs          =3D ceph_param_specs,
  };
 =20
- static int parse_fsopt_token(char *c, void *private)
+ /*
+  * Parse the source parameter.  Distinguish the server list from the path.
+  * Internally we do not include the leading '/' in the path.
+  *
+  * The source will look like:
+  *     <server_spec>[,<server_spec>...]:[<path>]
+  * where
+  *     <server_spec> is <ip>[:<port>]
+  *     <path> is optional, but if present must begin with '/'
+  */
+ static int ceph_parse_source(struct fs_context *fc, struct fs_parameter *=
param)
  {
- 	struct ceph_mount_options *fsopt =3D private;
- 	substring_t argstr[MAX_OPT_ARGS];
- 	int token, intval, ret;
-=20
- 	token =3D match_token((char *)c, fsopt_tokens, argstr);
- 	if (token < 0)
- 		return -EINVAL;
-=20
- 	if (token < Opt_last_int) {
- 		ret =3D match_int(&argstr[0], &intval);
- 		if (ret < 0) {
- 			pr_err("bad option arg (not int) at '%s'\n", c);
- 			return ret;
+ 	struct ceph_config_context *ctx =3D fc->fs_private;
+ 	struct ceph_mount_options *fsopt =3D ctx->mount_options;
+ 	char *dev_name =3D param->string, *dev_name_end;
+ 	int ret;
+=20
+ 	dout("parse_mount_options %p, dev_name '%s'\n", fsopt, dev_name);
+=20
+ 	if (fc->source)
+ 		return invalf(fc, "Multiple sources specified");
+ 	if (!dev_name || !*dev_name)
+ 		return invalf(fc, "Empty source");
+ 	if (dev_name[0] =3D=3D '/')
+ 		return invalf(fc, "Missing colon");
+=20
+ 	dev_name_end =3D strchr(dev_name + 1, '/');
+ 	if (dev_name_end) {
+ 		if (strlen(dev_name_end) > 1) {
+ 			kfree(fsopt->server_path);
+ 			fsopt->server_path =3D kstrdup(dev_name_end, GFP_KERNEL);
+ 			if (!fsopt->server_path)
+ 				return -ENOMEM;
  		}
- 		dout("got int token %d val %d\n", token, intval);
- 	} else if (token > Opt_last_int && token < Opt_last_string) {
- 		dout("got string token %d val %s\n", token,
- 		     argstr[0].from);
  	} else {
- 		dout("got token %d\n", token);
+ 		dev_name_end =3D dev_name + strlen(dev_name);
+ 	}
+=20
+ 	/* Trim off the path and the colon separator */
+ 	dev_name_end--;
+ 	if (*dev_name_end !=3D ':')
+ 		return invalf(fc, "device name is missing path (no : separator in %s)\n=
",
+ 			      dev_name);
+ 	*dev_name_end =3D 0;
+=20
+ 	dout("device name '%s'\n", dev_name);
+ 	if (fsopt->server_path)
+ 		dout("server path '%s'\n", fsopt->server_path);
+=20
+ 	param->size =3D dev_name_end - dev_name;
+ 	ret =3D ceph_parse_server_specs(ctx->opt, fc,
+ 				      param->string, dev_name_end - dev_name);
+ 	if (ret =3D=3D 0) {
+ 		fc->source =3D param->string;
+ 		param->string =3D NULL;
  	}
 =20
- 	switch (token) {
+ 	return 0;
+ }
+=20
+ static int ceph_parse_param(struct fs_context *fc, struct fs_parameter *p=
aram)
+ {
+ 	struct ceph_config_context *ctx =3D fc->fs_private;
+ 	struct ceph_mount_options *fsopt =3D ctx->mount_options;
+ 	struct fs_parse_result result;
+ 	int ret, opt;
+=20
+ 	ret =3D ceph_parse_option(ctx->opt, fc, param);
+ 	if (ret !=3D -ENOPARAM)
+ 		return ret;
+=20
+ 	opt =3D fs_parse(fc, &ceph_fs_parameters, param, &result);
+ 	if (opt < 0)
+ 		return opt;
+=20
+ 	switch (opt) {
+ 	case Opt_source:
+ 		return ceph_parse_source(fc, param);
  	case Opt_snapdirname:
  		kfree(fsopt->snapdir_name);
- 		fsopt->snapdir_name =3D kstrndup(argstr[0].from,
- 					       argstr[0].to-argstr[0].from,
- 					       GFP_KERNEL);
- 		if (!fsopt->snapdir_name)
- 			return -ENOMEM;
+ 		fsopt->snapdir_name =3D param->string;
+ 		param->string =3D NULL;
  		break;
  	case Opt_mds_namespace:
  		kfree(fsopt->mds_namespace);
- 		fsopt->mds_namespace =3D kstrndup(argstr[0].from,
- 						argstr[0].to-argstr[0].from,
- 						GFP_KERNEL);
- 		if (!fsopt->mds_namespace)
- 			return -ENOMEM;
+ 		fsopt->mds_namespace =3D param->string;
+ 		param->string =3D NULL;
  		break;
 +	case Opt_recover_session:
- 		if (!strncmp(argstr[0].from, "no",
- 			     argstr[0].to - argstr[0].from)) {
++		if (!strcmp(param->string, "no"))
 +			fsopt->flags &=3D ~CEPH_MOUNT_OPT_CLEANRECOVER;
- 		} else if (!strncmp(argstr[0].from, "clean",
- 				    argstr[0].to - argstr[0].from)) {
++		else if (!strcmp(param->string, "clean"))
 +			fsopt->flags |=3D CEPH_MOUNT_OPT_CLEANRECOVER;
- 		} else {
- 			return -EINVAL;
- 		}
- 		break;
- 	case Opt_fscache_uniq:
- 		kfree(fsopt->fscache_uniq);
- 		fsopt->fscache_uniq =3D kstrndup(argstr[0].from,
- 					       argstr[0].to-argstr[0].from,
- 					       GFP_KERNEL);
- 		if (!fsopt->fscache_uniq)
- 			return -ENOMEM;
- 		fsopt->flags |=3D CEPH_MOUNT_OPT_FSCACHE;
++		else
++			goto invalid_value;
 +		break;
- 		/* misc */
  	case Opt_wsize:
- 		if (intval < (int)PAGE_SIZE || intval > CEPH_MAX_WRITE_SIZE)
- 			return -EINVAL;
- 		fsopt->wsize =3D ALIGN(intval, PAGE_SIZE);
+ 		if (result.uint_32 < (int)PAGE_SIZE || result.uint_32 > CEPH_MAX_WRITE_=
SIZE)
+ 			goto invalid_value;
+ 		fsopt->wsize =3D ALIGN(result.uint_32, PAGE_SIZE);
  		break;
  	case Opt_rsize:
- 		if (intval < (int)PAGE_SIZE || intval > CEPH_MAX_READ_SIZE)
- 			return -EINVAL;
- 		fsopt->rsize =3D ALIGN(intval, PAGE_SIZE);
+ 		if (result.uint_32 < (int)PAGE_SIZE || result.uint_32 > CEPH_MAX_READ_S=
IZE)
+ 			goto invalid_value;
+ 		fsopt->rsize =3D ALIGN(result.uint_32, PAGE_SIZE);
  		break;
  	case Opt_rasize:
- 		if (intval < 0)
- 			return -EINVAL;
- 		fsopt->rasize =3D ALIGN(intval, PAGE_SIZE);
+ 		fsopt->rasize =3D ALIGN(result.uint_32, PAGE_SIZE);
  		break;
  	case Opt_caps_wanted_delay_min:
- 		if (intval < 1)
- 			return -EINVAL;
- 		fsopt->caps_wanted_delay_min =3D intval;
+ 		if (result.uint_32 < 1)
+ 			goto invalid_value;
+ 		fsopt->caps_wanted_delay_min =3D result.uint_32;
  		break;
  	case Opt_caps_wanted_delay_max:
- 		if (intval < 1)
- 			return -EINVAL;
- 		fsopt->caps_wanted_delay_max =3D intval;
+ 		if (result.uint_32 < 1)
+ 			goto invalid_value;
+ 		fsopt->caps_wanted_delay_max =3D result.uint_32;
  		break;
  	case Opt_caps_max:
- 		if (intval < 0)
- 			return -EINVAL;
- 		fsopt->caps_max =3D intval;
+ 		fsopt->caps_max =3D result.uint_32;
  		break;
  	case Opt_readdir_max_entries:
- 		if (intval < 1)
- 			return -EINVAL;
- 		fsopt->max_readdir =3D intval;
+ 		if (result.uint_32 < 1)
+ 			goto invalid_value;
+ 		fsopt->max_readdir =3D result.uint_32;
  		break;
  	case Opt_readdir_max_bytes:
- 		if (intval < (int)PAGE_SIZE && intval !=3D 0)
- 			return -EINVAL;
- 		fsopt->max_readdir_bytes =3D intval;
+ 		if (result.uint_32 < (int)PAGE_SIZE && result.uint_32 !=3D 0)
+ 			goto invalid_value;
+ 		fsopt->max_readdir_bytes =3D result.uint_32;
  		break;
  	case Opt_congestion_kb:
- 		if (intval < 1024) /* at least 1M */
- 			return -EINVAL;
- 		fsopt->congestion_kb =3D intval;
+ 		if (result.uint_32 < 1024) /* at least 1M */
+ 			goto invalid_value;
+ 		fsopt->congestion_kb =3D result.uint_32;
  		break;
  	case Opt_dirstat:
- 		fsopt->flags |=3D CEPH_MOUNT_OPT_DIRSTAT;
- 		break;
- 	case Opt_nodirstat:
- 		fsopt->flags &=3D ~CEPH_MOUNT_OPT_DIRSTAT;
+ 		if (!result.negated)
+ 			fsopt->flags |=3D CEPH_MOUNT_OPT_DIRSTAT;
+ 		else
+ 			fsopt->flags &=3D ~CEPH_MOUNT_OPT_DIRSTAT;
  		break;
  	case Opt_rbytes:
- 		fsopt->flags |=3D CEPH_MOUNT_OPT_RBYTES;
- 		break;
- 	case Opt_norbytes:
- 		fsopt->flags &=3D ~CEPH_MOUNT_OPT_RBYTES;
+ 		if (!result.negated)
+ 			fsopt->flags |=3D CEPH_MOUNT_OPT_RBYTES;
+ 		else
+ 			fsopt->flags &=3D ~CEPH_MOUNT_OPT_RBYTES;
  		break;
  	case Opt_asyncreaddir:
- 		fsopt->flags &=3D ~CEPH_MOUNT_OPT_NOASYNCREADDIR;
- 		break;
- 	case Opt_noasyncreaddir:
- 		fsopt->flags |=3D CEPH_MOUNT_OPT_NOASYNCREADDIR;
+ 		if (!result.negated)
+ 			fsopt->flags &=3D ~CEPH_MOUNT_OPT_NOASYNCREADDIR;
+ 		else
+ 			fsopt->flags |=3D CEPH_MOUNT_OPT_NOASYNCREADDIR;
  		break;
  	case Opt_dcache:
- 		fsopt->flags |=3D CEPH_MOUNT_OPT_DCACHE;
- 		break;
- 	case Opt_nodcache:
- 		fsopt->flags &=3D ~CEPH_MOUNT_OPT_DCACHE;
+ 		if (!result.negated)
+ 			fsopt->flags |=3D CEPH_MOUNT_OPT_DCACHE;
+ 		else
+ 			fsopt->flags &=3D ~CEPH_MOUNT_OPT_DCACHE;
  		break;
  	case Opt_ino32:
- 		fsopt->flags |=3D CEPH_MOUNT_OPT_INO32;
- 		break;
- 	case Opt_noino32:
- 		fsopt->flags &=3D ~CEPH_MOUNT_OPT_INO32;
+ 		if (!result.negated)
+ 			fsopt->flags |=3D CEPH_MOUNT_OPT_INO32;
+ 		else
+ 			fsopt->flags &=3D ~CEPH_MOUNT_OPT_INO32;
  		break;
+=20
  	case Opt_fscache:
- 		fsopt->flags |=3D CEPH_MOUNT_OPT_FSCACHE;
- 		kfree(fsopt->fscache_uniq);
- 		fsopt->fscache_uniq =3D NULL;
- 		break;
- 	case Opt_nofscache:
- 		fsopt->flags &=3D ~CEPH_MOUNT_OPT_FSCACHE;
  		kfree(fsopt->fscache_uniq);
  		fsopt->fscache_uniq =3D NULL;
+ 		if (result.negated) {
+ 			fsopt->flags &=3D ~CEPH_MOUNT_OPT_FSCACHE;
+ 		} else {
+ 			fsopt->flags |=3D CEPH_MOUNT_OPT_FSCACHE;
+ 			fsopt->fscache_uniq =3D param->string;
+ 			param->string =3D NULL;
+ 		}
  		break;
+=20
  	case Opt_poolperm:
- 		fsopt->flags &=3D ~CEPH_MOUNT_OPT_NOPOOLPERM;
- 		break;
- 	case Opt_nopoolperm:
- 		fsopt->flags |=3D CEPH_MOUNT_OPT_NOPOOLPERM;
+ 		if (!result.negated)
+ 			fsopt->flags &=3D ~CEPH_MOUNT_OPT_NOPOOLPERM;
+ 		else
+ 			fsopt->flags |=3D CEPH_MOUNT_OPT_NOPOOLPERM;
  		break;
  	case Opt_require_active_mds:
- 		fsopt->flags &=3D ~CEPH_MOUNT_OPT_MOUNTWAIT;
- 		break;
- 	case Opt_norequire_active_mds:
- 		fsopt->flags |=3D CEPH_MOUNT_OPT_MOUNTWAIT;
+ 		if (!result.negated)
+ 			fsopt->flags &=3D ~CEPH_MOUNT_OPT_MOUNTWAIT;
+ 		else
+ 			fsopt->flags |=3D CEPH_MOUNT_OPT_MOUNTWAIT;
  		break;
  	case Opt_quotadf:
- 		fsopt->flags &=3D ~CEPH_MOUNT_OPT_NOQUOTADF;
- 		break;
- 	case Opt_noquotadf:
- 		fsopt->flags |=3D CEPH_MOUNT_OPT_NOQUOTADF;
+ 		if (!result.negated)
+ 			fsopt->flags &=3D ~CEPH_MOUNT_OPT_NOQUOTADF;
+ 		else
+ 			fsopt->flags |=3D CEPH_MOUNT_OPT_NOQUOTADF;
  		break;
  	case Opt_copyfrom:
- 		fsopt->flags &=3D ~CEPH_MOUNT_OPT_NOCOPYFROM;
- 		break;
- 	case Opt_nocopyfrom:
- 		fsopt->flags |=3D CEPH_MOUNT_OPT_NOCOPYFROM;
+ 		if (!result.negated)
+ 			fsopt->flags &=3D ~CEPH_MOUNT_OPT_NOCOPYFROM;
+ 		else
+ 			fsopt->flags |=3D CEPH_MOUNT_OPT_NOCOPYFROM;
  		break;
- #ifdef CONFIG_CEPH_FS_POSIX_ACL
  	case Opt_acl:
- 		fsopt->sb_flags |=3D SB_POSIXACL;
- 		break;
+ 		if (!result.negated) {
+ #ifdef CONFIG_CEPH_FS_POSIX_ACL
+ 			fc->sb_flags |=3D SB_POSIXACL;
+ #else
+ 			return invalf(fc, "POSIX ACL support is disabled");
  #endif
- 	case Opt_noacl:
- 		fsopt->sb_flags &=3D ~SB_POSIXACL;
+ 		} else {
+ 			fc->sb_flags &=3D ~SB_POSIXACL;
+ 		}
  		break;
  	default:
- 		BUG_ON(token);
+ 		BUG();
  	}
  	return 0;
+=20
+ invalid_value:
+ 	return invalf(fc, "ceph: Invalid value for %s", param->key);
  }
 =20
  static void destroy_mount_options(struct ceph_mount_options *args)

--Sig_/M/nC=A2DWWA/W9vnrRwdUOy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1nKXoACgkQAVBC80lX
0GxZtQgAoza0pKjQqlZQ0A8OVWADVdRCd2mSJIILYS9hS1e/NrGgrr8qe4e7fiKZ
sguk1GPe9ARBOSaTK76nlKGIxaqAyPsM7TTlPblVo1FMGhH0FHEpwCwCrnpqn3SB
7wV98NCYUFckoMM0J04GESPX74SQMW7WP7Tin34wxpaMin/38UPwmMfrpSwSdcDi
Q3NNIlN439e29SceiM2GDOsQrR9f4QnXDrL+YVpUNPikUgghxEzbX2kOnKMtuq6k
KBnsO7TlmtWfZ+TmJrqVrlUcIPRvxyl1OKFemGcVdUWHj3aE9rETakNNGwEQ2Fcy
HUtI92yN/28FSvGysdRSBstFCjt+ig==
=4coK
-----END PGP SIGNATURE-----

--Sig_/M/nC=A2DWWA/W9vnrRwdUOy--
