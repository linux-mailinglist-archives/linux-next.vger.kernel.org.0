Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 334F88966C
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 06:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725648AbfHLEsR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 00:48:17 -0400
Received: from ozlabs.org ([203.11.71.1]:48991 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbfHLEsR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 00:48:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466NdV0vqVz9s7T;
        Mon, 12 Aug 2019 14:48:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565585294;
        bh=HSOlcymwrlIqoGwbQQiD+KG+WFcvDmC2mHXslXoPuGw=;
        h=Date:From:To:Cc:Subject:From;
        b=mAOmiz5dz5xANXUb/OfMOwau2aSHrqdKb1R20PmaZPqk7xS648phZSn2mu5cYb8Id
         ZwPsOfBc60wuPZ6aVv0MQ2QaWumxvjmvRJ5fJyvAIjM0dVnzOliq/VyqG4Yo9cz4/T
         KyU9d9n6X4BtOVOZquedTBlBSalpOnXoBPYRazIsoOoH6Q7juKYQiIGB13/ESmJrwi
         3+ZVunR24E+I6kCrFSVZcksn0RK5KTueIRfxiqWMkebcPgqCeP/rI5hceMGwTIqb+v
         VlraehMVsBpvZUsvCfca2676mOhRMXhGA9xvS97+9+xlPuzcldL9J7+TuV+euGHxZD
         EOyh/+NAzhl+g==
Date:   Mon, 12 Aug 2019 14:48:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Matthew Garrett <mjg59@google.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: linux-next: manual merge of the security tree with Linus' tree
Message-ID: <20190812144813.761d9f34@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/./9uIixY.vMTpZAEqlsm+Eh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/./9uIixY.vMTpZAEqlsm+Eh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the security tree got a conflict in:

  kernel/trace/trace_kprobe.c

between commit:

  715fa2fd4c6c ("tracing/kprobe: Check registered state using kprobe")

from Linus' tree and commit:

  e87402c063fd ("lockdown: Lock down tracing and perf kprobes when in confi=
dentiality mode")

from the security tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/trace/trace_kprobe.c
index 9d483ad9bb6c,fcb28b0702b2..000000000000
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@@ -11,9 -11,8 +11,10 @@@
  #include <linux/uaccess.h>
  #include <linux/rculist.h>
  #include <linux/error-injection.h>
+ #include <linux/security.h>
 =20
 +#include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 +
  #include "trace_dynevent.h"
  #include "trace_kprobe_selftest.h"
  #include "trace_probe.h"
@@@ -389,7 -416,11 +390,11 @@@ static int __register_trace_kprobe(stru
  {
  	int i, ret;
 =20
+ 	ret =3D security_locked_down(LOCKDOWN_KPROBES);
+ 	if (ret)
+ 		return ret;
+=20
 -	if (trace_probe_is_registered(&tk->tp))
 +	if (trace_kprobe_is_registered(tk))
  		return -EINVAL;
 =20
  	if (within_notrace_func(tk)) {

--Sig_/./9uIixY.vMTpZAEqlsm+Eh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Q740ACgkQAVBC80lX
0GyHBwf/V9GLIaMp9lh4GnJhB3r0HGoERANx8/VjZIaQxdDVnim1Ii+ay65pU5FT
5U3MoWH95hHmQecBZKmOTpQ+mKXVfIv/8sM7LlO9ly+QaSthjHgzv9dacEQNHXsE
YuzBnUCSBv2i/p+ES7XWM3BuZVK1IBbu6JgLnut6OdNUQWOLSweXwN0ysf9c39cz
vxNQVsWEgziTgXIenFv4TTz0VNszoKcpjxZCiHVv9sIKauGlvFRC92+74axnrfxW
HYS4jBshT2AzTBgk7AJ7486BndD0Jbiu23KNTsahhD+V8+zlHnUtnhKrm8iFhFjZ
5uQtbgi7JfcfIR92UWMasGF+Lps8vQ==
=a9uj
-----END PGP SIGNATURE-----

--Sig_/./9uIixY.vMTpZAEqlsm+Eh--
