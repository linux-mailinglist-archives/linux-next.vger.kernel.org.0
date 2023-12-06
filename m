Return-Path: <linux-next+bounces-244-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE978806548
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 03:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB8E81C21117
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 02:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AD86D39;
	Wed,  6 Dec 2023 02:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Bte/yh2a"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5965F1AA;
	Tue,  5 Dec 2023 18:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701830983;
	bh=kWSnwSWEWwAgy/sLkb4DDMMtTHVDhNvzb2zwc19N4YU=;
	h=Date:From:To:Cc:Subject:From;
	b=Bte/yh2avh9/wykxnQb217s9hTZBKyrNCK4XSTNSh7aN8e005VB3Skypc36rkO39O
	 3VO8Qp+81Db64c7Nov2MoRyl7mRWoD2LP0A7GZLVBX91L3kH1lp3/bffGB78s/Rjce
	 DbjbI4uraur7znsefjjgT3s1ryzUia4X9/0DWDWdJt+Y6Vy1XSs0aiorEXFvfrx0Mc
	 /XEF9Eq3U333WyS7lUbrl2FGvApMbZkLfQ1mRzMRO0aCeZ/GzL3nGrsivTtUTljKvb
	 AWzSHQD7UMsVY/lShCiRmUF0x3DLvLfWhLMZmKF/y9kwXOr8QIocHnLQbqjdhwN8oX
	 KUDwwbj5PGYsQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SlMLt4R9cz4wcH;
	Wed,  6 Dec 2023 13:49:42 +1100 (AEDT)
Date: Wed, 6 Dec 2023 13:49:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, Xiu Jianfeng <xiujianfeng@huawei.com>
Subject: linux-next: manual merge of the sysctl tree with Linus' tree
Message-ID: <20231206134941.4953e1ae@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kxx6869DCCQaLoMRnCsYhtn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kxx6869DCCQaLoMRnCsYhtn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sysctl tree got conflicts in:

  include/linux/perf_event.h
  kernel/events/core.c

between commit:

  e6814ec3ba19 ("perf/core: Rename perf_proc_update_handler() -> perf_event=
_max_sample_rate_handler(), for readability")

from Linus' tree and commit:

  c8be9e66ca1e ("sysctl: treewide: constify the ctl_table argument of handl=
ers")

from the sysctl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/perf_event.h
index d2a15c0c6f8a,84f8f441d011..000000000000
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@@ -1598,11 -1573,11 +1598,11 @@@ extern int sysctl_perf_cpu_time_max_per
 =20
  extern void perf_sample_event_took(u64 sample_len_ns);
 =20
- int perf_event_max_sample_rate_handler(struct ctl_table *table, int write,
 -int perf_proc_update_handler(const struct ctl_table *table, int write,
++int perf_event_max_sample_rate_handler(const struct ctl_table *table, int=
 write,
  		void *buffer, size_t *lenp, loff_t *ppos);
- int perf_cpu_time_max_percent_handler(struct ctl_table *table, int write,
+ int perf_cpu_time_max_percent_handler(const struct ctl_table *table, int =
write,
  		void *buffer, size_t *lenp, loff_t *ppos);
- int perf_event_max_stack_handler(struct ctl_table *table, int write,
+ int perf_event_max_stack_handler(const struct ctl_table *table, int write,
  		void *buffer, size_t *lenp, loff_t *ppos);
 =20
  /* Access to perf_event_open(2) syscall. */
diff --cc kernel/events/core.c
index 41b4d2278c94,26383e3582c6..000000000000
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@@ -450,8 -449,8 +450,8 @@@ static void update_perf_cpu_limits(void
 =20
  static bool perf_rotate_context(struct perf_cpu_pmu_context *cpc);
 =20
- int perf_event_max_sample_rate_handler(struct ctl_table *table, int write,
 -int perf_proc_update_handler(const struct ctl_table *table, int write,
 -		void *buffer, size_t *lenp, loff_t *ppos)
++int perf_event_max_sample_rate_handler(const struct ctl_table *table, int=
 write,
 +				       void *buffer, size_t *lenp, loff_t *ppos)
  {
  	int ret;
  	int perf_cpu =3D sysctl_perf_cpu_time_max_percent;

--Sig_/kxx6869DCCQaLoMRnCsYhtn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVv4UUACgkQAVBC80lX
0GyINQf/eSteCfMI3LLL1P2E4N52cEdxvbhwstW5HPBsar0Ql/Rh1ZUDHHGrMw2p
mKQ6NnrS3xZAWQL3vnBdUyYqGkjSjOKMnBpoebnF5+xoJR0cW4OdW1xhGW3XWKFj
p6PlUHUFU3NjufnmheCCkBb1L5JbNjT9GeZYAydzQQWeCE1BBXHWWfu6BvlpNR+6
ReimJE6xbkKdXKt58rPdKMT/tIFB8ASF7T1EgUgNsHQjVNuhVQQyyzbwLDeMVIqz
9Iu+Mlc4eVjto12FzTNPyvJca8QT2PabR8UcAiL/6jTbEaRTBq6CnDFMoDcZGixM
FAmpL+SMq8mRWqHzZhU2R6Nm4mKv3A==
=gvAe
-----END PGP SIGNATURE-----

--Sig_/kxx6869DCCQaLoMRnCsYhtn--

