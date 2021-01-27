Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A57305117
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 05:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239349AbhA0Elc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 23:41:32 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58347 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343614AbhA0EUR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 23:20:17 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQVjw2rdQz9sSs;
        Wed, 27 Jan 2021 15:19:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611721173;
        bh=hcMVls7/rWUAocZd0P28uIj8Y0Eh18tkBzcPYsyo+VA=;
        h=Date:From:To:Cc:Subject:From;
        b=mYDysqBSFLze7BgXbbcXvcRGKhJxIQzJJRpRWCuezqicyh6QlziEXHOWxjdnbbBD4
         acmcXwUQh2N2g2CiSGTw9NJdIWEKcqyoZ613e0rSKKJufPfUKhVqynUZLADWVdWhLR
         k36YHYRDGlDM3YTtdMnDyi27aNWwce27xpukpYD1vMvO16zHgbT/2ODqFD3FzJ3HSH
         Tt3o+y123dfufStItIxvR/8FLN36SScYq+nkIHq1KNVRt+O6q+dCt49f5z2dK8kIug
         dhA+DKHS6g4jwEOFsjrF/KoE2FwvxZU1/g2CxbFj5O2XwD3WjBEDTeGUB4IcDWb07P
         laJtQOGwa3fxA==
Date:   Wed, 27 Jan 2021 15:19:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Tushar Sugandhi <tusharsu@linux.microsoft.com>
Subject: linux-next: manual merge of the integrity tree with the pidfd tree
Message-ID: <20210127151931.530d7aa9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X+mOyQpyJ7UhJU.3fj3vIA1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/X+mOyQpyJ7UhJU.3fj3vIA1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the integrity tree got a conflict in:

  security/integrity/ima/ima_main.c

between commit:

  a2d2329e30e2 ("ima: handle idmapped mounts")

from the pidfd tree and commits:

  2b4a2474a202 ("IMA: generalize keyring specific measurement constructs")
  291af651b350 ("IMA: add support to measure buffer data hash")
  d6e645012d97 ("IMA: define a hook to measure kernel integrity critical da=
ta")

from the integrity tree.

In ima_measure_critical_data(), process_buffer_measurement() is called
with a NULL inode and func set to CRITCTAL_DATA.  In this case, the
mnt_userns parameter is not used (I followed the call chain down) and
so I just passed a NULL for it.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc security/integrity/ima/ima_main.c
index cb1c56eccd6d,6a429846f90a..000000000000
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@@ -816,22 -809,22 +816,24 @@@ int ima_post_load_data(char *buf, loff_
  }
 =20
  /*
-  * process_buffer_measurement - Measure the buffer to ima log.
+  * process_buffer_measurement - Measure the buffer or the buffer data hash
 + * @mnt_userns:	user namespace of the mount the inode was found from
   * @inode: inode associated with the object being measured (NULL for KEY_=
CHECK)
   * @buf: pointer to the buffer that needs to be added to the log.
   * @size: size of buffer(in bytes).
   * @eventname: event name to be used for the buffer entry.
   * @func: IMA hook
   * @pcr: pcr to extend the measurement
-  * @keyring: keyring name to determine the action to be performed
+  * @func_data: func specific data, may be NULL
+  * @buf_hash: measure buffer data hash
   *
-  * Based on policy, the buffer is measured into the ima log.
+  * Based on policy, either the buffer data or buffer data hash is measured
   */
 -void process_buffer_measurement(struct inode *inode, const void *buf, int=
 size,
 +void process_buffer_measurement(struct user_namespace *mnt_userns,
 +				struct inode *inode, const void *buf, int size,
  				const char *eventname, enum ima_hooks func,
- 				int pcr, const char *keyring)
+ 				int pcr, const char *func_data,
+ 				bool buf_hash)
  {
  	int ret =3D 0;
  	const char *audit_cause =3D "ENOMEM";
@@@ -869,9 -864,8 +873,9 @@@
  	 */
  	if (func) {
  		security_task_getsecid(current, &secid);
 -		action =3D ima_get_action(inode, current_cred(), secid, 0, func,
 -					&pcr, &template, func_data);
 +		action =3D ima_get_action(mnt_userns, inode, current_cred(),
 +					secid, 0, func, &pcr, &template,
- 					keyring);
++					func_data);
  		if (!(action & IMA_MEASURE))
  			return;
  	}
@@@ -929,12 -937,38 +947,38 @@@ void ima_kexec_cmdline(int kernel_fd, c
  	if (!f.file)
  		return;
 =20
 -	process_buffer_measurement(file_inode(f.file), buf, size,
 -				   "kexec-cmdline", KEXEC_CMDLINE, 0, NULL,
 -				   false);
 +	process_buffer_measurement(file_mnt_user_ns(f.file), file_inode(f.file),
 +				   buf, size, "kexec-cmdline", KEXEC_CMDLINE, 0,
- 				   NULL);
++				   NULL, false);
  	fdput(f);
  }
 =20
+ /**
+  * ima_measure_critical_data - measure kernel integrity critical data
+  * @event_label: unique event label for grouping and limiting critical da=
ta
+  * @event_name: event name for the record in the IMA measurement list
+  * @buf: pointer to buffer data
+  * @buf_len: length of buffer data (in bytes)
+  * @hash: measure buffer data hash
+  *
+  * Measure data critical to the integrity of the kernel into the IMA log
+  * and extend the pcr.  Examples of critical data could be various data
+  * structures, policies, and states stored in kernel memory that can
+  * impact the integrity of the system.
+  */
+ void ima_measure_critical_data(const char *event_label,
+ 			       const char *event_name,
+ 			       const void *buf, size_t buf_len,
+ 			       bool hash)
+ {
+ 	if (!event_name || !event_label || !buf || !buf_len)
+ 		return;
+=20
 -	process_buffer_measurement(NULL, buf, buf_len, event_name,
++	process_buffer_measurement(NULL, NULL, buf, buf_len, event_name,
+ 				   CRITICAL_DATA, 0, event_label,
+ 				   hash);
+ }
+=20
  static int __init init_ima(void)
  {
  	int error;

--Sig_/X+mOyQpyJ7UhJU.3fj3vIA1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQ6dMACgkQAVBC80lX
0GzKXAf/RZl7tG3seTEZtjpJpsBTRyUnbS4DD8xqHdpYt+HNcRIJbgGPNx/qmvi8
HpMfo7KFfAv+AKpOAN1E/gBxXYYQU1H0lhgB+eCMcV5xMLIace1uPZ3NNjpLBx1x
VywqlSuUYv2uSQp534bFQdVevlFSdCMXZZ93/QZ0k/d2fXgd0JApA3BP/py4gA56
BWOE9J+iHjKIIpilA3XtQURyGVNwdCExhbFCA+kvu7jH79mPpv85LJgmOPufbhgh
49j95Lw1rg1K4j6anKTiS4IFn2MJfTXLjo/PzIMpwBElnL+XIFErCpSKVG4gZRGu
MUmtmgfGvgVw/KlDGDhnuGLF5pJzMQ==
=nk4Y
-----END PGP SIGNATURE-----

--Sig_/X+mOyQpyJ7UhJU.3fj3vIA1--
