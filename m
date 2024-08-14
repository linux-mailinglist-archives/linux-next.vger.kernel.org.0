Return-Path: <linux-next+bounces-3319-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB92952647
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 01:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 881E62877B2
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2024 23:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE26514F136;
	Wed, 14 Aug 2024 23:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ozhwh3A/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01BD14F10F;
	Wed, 14 Aug 2024 23:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723678722; cv=none; b=q2T0i4hubbdNyGHAoUQlHsn14tQXQu/vBWq4ruxMqjXbf1AKjq8baJQhedBSjrfW0DOEOu1yv1qZZ+QOsdrrPZOG99qvJDK5L2yOTHHTh9LLMMcEsyXc0GLjl2ZkTgh8aqukqI2iaxlgl153v3e+gVdEtZv6JRja8wSmMYl8t8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723678722; c=relaxed/simple;
	bh=sNRoUOkGyXH9fGsphGKhvKnFajpTCP0GUhfiOdkX7gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=N1fUY+lj8fTSBjiTbc4SiGtpvflGSwyvTfHBpvBeRaEaF+wBaDhaG0VbYUenOtJ2G14bIcZvxt5NRJtqKg9ttvo6Gj0zudgVbgcDH+s/vUXHaaEPbYGpTJAFkUcU8jbk4OBfUd1Ti52OlBTN1+8cb68PRxnEqS90Gib49PGicMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ozhwh3A/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723678710;
	bh=Ry+s1cUkOXDWfG+OtJTiE9tv+kHdFVW5Py4YlKCBmtM=;
	h=Date:From:To:Cc:Subject:From;
	b=Ozhwh3A/QYxJBO5QL8Fjc6F8PjASauF61vA5xEHVUwFQBV3R3U2DVT5Ab5VDTRAza
	 2sID8ZxlQPzbCGHHr0iOaE/6lRnwtS0KSBs36H1ydqYWwxChblfAshFWZnOZANiFw0
	 6mlS/3GDUjEVCJiOBXqyhdxhJKAm0zuMycPnGh0WjH46Y6vjCiQ37LPyxKDQnikkAq
	 YsbixrvbWrDBU0/HHjjeDiLA2QVRKx406CTzzPOjWn21d4NHFBTL+wldJ1RgzzcaJ0
	 xLXnaeFAmP8AtzCDy4jQ4qFH/IRJqKv8I2cMr1wjVTMPVr2VJEiG34NCy/rIIJFiZy
	 VTp9I80d28Pzw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wkl7V42rwz4x5M;
	Thu, 15 Aug 2024 09:38:30 +1000 (AEST)
Date: Thu, 15 Aug 2024 09:38:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Uros Bizjak <ubizjak@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20240815093829.275058c7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BmxE5yJzK6MXNy_q3=u_mdC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BmxE5yJzK6MXNy_q3=u_mdC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/kcsan-checks.h:13,
                 from include/linux/instrumented.h:12,
                 from include/asm-generic/bitops/instrumented-atomic.h:14,
                 from arch/powerpc/include/asm/bitops.h:321,
                 from include/linux/bitops.h:68,
                 from arch/powerpc/include/asm/mce.h:12,
                 from arch/powerpc/include/asm/paca.h:32,
                 from arch/powerpc/include/asm/percpu.h:30,
                 from include/linux/err.h:9,
                 from arch/powerpc/include/asm/ptrace.h:22,
                 from arch/powerpc/kernel/vdso/sigtramp64.S:14:
include/linux/compiler_attributes.h:55: warning: "__always_inline" redefined
   55 | #define __always_inline                 inline __attribute__((__alw=
ays_inline__))
      |=20
In file included from include/linux/stddef.h:5,
                 from include/linux/string.h:9,
                 from arch/powerpc/include/asm/paca.h:16:
include/uapi/linux/stddef.h:8: note: this is the location of the previous d=
efinition
    8 | #define __always_inline inline
      |=20
include/linux/compiler_attributes.h:91:20: error: missing binary operator b=
efore token "("
   91 | #if __has_attribute(__copy__)
      |                    ^
include/linux/compiler_attributes.h:104:20: error: missing binary operator =
before token "("
  104 | #if __has_attribute(__counted_by__)
      |                    ^
include/linux/compiler_attributes.h:107: warning: "__counted_by" redefined
  107 | # define __counted_by(member)
      |=20
include/uapi/linux/stddef.h:55: note: this is the location of the previous =
definition
   55 | #define __counted_by(m)
      |=20
include/linux/compiler_attributes.h:116:20: error: missing binary operator =
before token "("
  116 | #if __has_attribute(__diagnose_as_builtin__)
      |                    ^
include/linux/compiler_attributes.h:139:20: error: missing binary operator =
before token "("
  139 | #if __has_attribute(__designated_init__)
      |                    ^
include/linux/compiler_attributes.h:150:20: error: missing binary operator =
before token "("
  150 | #if __has_attribute(__error__)
      |                    ^
include/linux/compiler_attributes.h:161:20: error: missing binary operator =
before token "("
  161 | #if __has_attribute(__externally_visible__)
      |                    ^
include/linux/compiler_attributes.h:198:20: error: missing binary operator =
before token "("
  198 | #if __has_attribute(__no_caller_saved_registers__)
      |                    ^
include/linux/compiler_attributes.h:209:20: error: missing binary operator =
before token "("
  209 | #if __has_attribute(__noclone__)
      |                    ^
include/linux/compiler_attributes.h:226:20: error: missing binary operator =
before token "("
  226 | #if __has_attribute(__fallthrough__)
      |                    ^
include/linux/compiler_attributes.h:252:20: error: missing binary operator =
before token "("
  252 | #if __has_attribute(__nonstring__)
      |                    ^
include/linux/compiler_attributes.h:264:20: error: missing binary operator =
before token "("
  264 | #if __has_attribute(__no_profile_instrument_function__)
      |                    ^
include/linux/compiler_attributes.h:283:20: error: missing binary operator =
before token "("
  283 | #if __has_attribute(__no_stack_protector__)
      |                    ^
include/linux/compiler_attributes.h:294:20: error: missing binary operator =
before token "("
  294 | #if __has_attribute(__overloadable__)
      |                    ^
include/linux/compiler_attributes.h:313:20: error: missing binary operator =
before token "("
  313 | #if __has_attribute(__pass_dynamic_object_size__)
      |                    ^
include/linux/compiler_attributes.h:318:20: error: missing binary operator =
before token "("
  318 | #if __has_attribute(__pass_object_size__)
      |                    ^
include/linux/compiler_attributes.h:342:20: error: missing binary operator =
before token "("
  342 | #if __has_attribute(__uninitialized__)
      |                    ^
include/linux/compiler_attributes.h:388:20: error: missing binary operator =
before token "("
  388 | #if __has_attribute(__warning__)
      |                    ^
include/linux/compiler_attributes.h:405:20: error: missing binary operator =
before token "("
  405 | #if __has_attribute(disable_sanitizer_instrumentation)
      |                    ^

Caused by commit

  8e53757638ec ("err.h: add ERR_PTR_PCPU(), PTR_ERR_PCPU() and IS_ERR_PCPU(=
) functions")

Does include/linux/err.h really need to include asm/percpu.h?  __percpu is
defined in compiler_types.h which is included in every c code compile.

I have reverted that commit and the following one for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/BmxE5yJzK6MXNy_q3=u_mdC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma9P/UACgkQAVBC80lX
0GxdQggAl7vgqkhLlEWTBmAl0F05pO49AXv34KB1Ravro2TDrWPv331FEJ3rU8xi
/HEU+zWQGKf1GGO+GJoi0oECdQKvzPFHaC8FHppvGhorXy5s0M+7UGoUUsn3hIMS
sz0r30uhSgB5FCAl6gSpaEHXmf3ZUkT3XH3jUK8om+xBcAaI7fI8oUhhrGNeNh1M
k3bxcs9vRu3euc/CWINvDivZ9RhqN02YrhTNmxIeYpOGDRlrqeFx4h8nVvGLnUIW
e8ujDLv1ZImzbU9TSgWbIP0HWbfEjppkTnmjQkyLokEgWlybYosj8V9imdlZxh7E
PLfhkFAPxqutzwrS7ie//oIiozakuQ==
=Jcaa
-----END PGP SIGNATURE-----

--Sig_/BmxE5yJzK6MXNy_q3=u_mdC--

