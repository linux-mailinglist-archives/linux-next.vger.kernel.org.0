Return-Path: <linux-next+bounces-2410-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE108D29FF
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 03:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC4A32897D6
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 01:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2392E15AADE;
	Wed, 29 May 2024 01:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="q3E7oWEj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425F815AAD9;
	Wed, 29 May 2024 01:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716946139; cv=none; b=OiIwqPKYq4ogMiVR5lwzAHOJj5pXNb59L9lVQUX85Lo8lMT0RuAaJ6jI4/ZvoC33XPTBDyhtkvK3lC+Vi/MxK+KzXMNPMni6ip7MSJESHzeWM4g5y9nN/NKBRaZF6jt6cOaYNoIC0JF33Imnv5hXaAoRkE8jZoHU1XFGRlMgXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716946139; c=relaxed/simple;
	bh=+6UmtZ3tFAh1ncQEqGpFhys5EuukV5ETxWLZaIAEsrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GS2CbJ4218sm8l61Ph1BKoL2S4XFdMCIJe1hplJ7ATZCnGXm45uNl04TeYiOVtnhUQ0qbW55YUfJRomEymdgr+jC9fhtRgt85HWuAL8dlocWa0J4Nb029QA0pTPup7TGguFYOLpXdP9Jd1O5o1JowmjZZPnasYlHh+jKuETNAcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=q3E7oWEj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716946132;
	bh=DFxujHLqbwNMNPEh3VXzYbit5PH4X95MhhNNu8Ap+rU=;
	h=Date:From:To:Cc:Subject:From;
	b=q3E7oWEjrobCB9GpdSByUSL2XUJDTpGecwOkeuqmmRNXEBtSU1r0xp+cSu8qQX9EU
	 m5BsXDWR3/LdJJ1fz21sHe4lRznZ4GAJCrl+J9p3iqeaq8wrqK/eW6Vq4f+DYAqG1+
	 wW94O/8ycTMugrBx49YzxvF0WeZn+KN0Y/jgHexjhtU4sVXGoCIqsJg5dI5h1RwDrN
	 iP+k5daQccZr04dPeEcOCk27S3lUJ8jRufm/umyQkD+MXqFVJd15jXdvMoOv1M3HAF
	 22u7K7TmF3gc9Xkpahhwhz/XA2OBE3nFUTggBbmOB37PssRV1DOIbM8vhs5LMYNdO+
	 Z1nUiPzi7rWDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VpsGr0n2hz4wyY;
	Wed, 29 May 2024 11:28:51 +1000 (AEST)
Date: Wed, 29 May 2024 11:28:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Petr Mladek <pmladek@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Ogness
 <john.ogness@linutronix.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Shimoyashiki Taichi
 <taichi.shimoyashiki@sony.com>, Sreenath Vijayan
 <sreenath.vijayan@sony.com>
Subject: linux-next: manual merge of the printk tree with Linus' tree
Message-ID: <20240529112849.74718b45@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Oprw9qRIHmPcaH3yQtnnJx7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Oprw9qRIHmPcaH3yQtnnJx7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the printk tree got a conflict in:

  include/linux/printk.h

between commit:

  693f75b91a91 ("printk: Add function to replay kernel log on consoles")

from Linus' tree and commits:

  7e4289a0c15f ("nbcon: Add API to acquire context for non-printing operati=
ons")
  8a192e951d8a ("printk: nbcon: Add unsafe flushing on panic")
  dc0f096fb7aa ("printk: Coordinate direct printing in panic")

from the printk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/printk.h
index 40afab23881a,69f40a71c438..000000000000
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@@ -195,7 -195,10 +198,11 @@@ void show_regs_print_info(const char *l
  extern asmlinkage void dump_stack_lvl(const char *log_lvl) __cold;
  extern asmlinkage void dump_stack(void) __cold;
  void printk_trigger_flush(void);
 +void console_replay_all(void);
+ void printk_legacy_allow_panic_sync(void);
+ extern bool nbcon_device_try_acquire(struct console *con);
+ extern void nbcon_device_release(struct console *con);
+ void nbcon_atomic_flush_unsafe(void);
  #else
  static inline __printf(1, 0)
  int vprintk(const char *s, va_list args)
@@@ -275,9 -278,24 +282,27 @@@ static inline void dump_stack(void
  static inline void printk_trigger_flush(void)
  {
  }
 +static inline void console_replay_all(void)
 +{
 +}
+=20
+ static inline void printk_legacy_allow_panic_sync(void)
+ {
+ }
+=20
+ static inline bool nbcon_device_try_acquire(struct console *con)
+ {
+ 	return false;
+ }
+=20
+ static inline void nbcon_device_release(struct console *con)
+ {
+ }
+=20
+ static inline void nbcon_atomic_flush_unsafe(void)
+ {
+ }
+=20
  #endif
 =20
  bool this_cpu_in_panic(void);

--Sig_/Oprw9qRIHmPcaH3yQtnnJx7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZWhNEACgkQAVBC80lX
0GwrEggAni6VJycneGbV6/QWilOWSI8ZvINicDqu7d00tfwtWBw1lzurDbhv1qNP
kWOV9DIWrzTD33FbpeG5btKM+K5OuB+eArOBTLFRFHD6ReQwLDQrLB43+5ClGmuB
GtzI25HMjN5V5mLLwYWBOKsMkAPNwKGwlAklF6AAX8eG7N5pgrSulKuSJBvTMGaC
yxzG16DO+ON21TXdFWPDJHdkgl0t0DuT7D/MYsKCPs5Ulmgj5r+xlDLyZW1pqf6v
KXXR/Tt7yage+UTz5OpJoV6ug2JARwIVdILK1KPHzwQqNw0/46NpjA0+mRz0EC+e
3BqiU53fpxtII8DDLMMgAVPxv1BYlg==
=QklN
-----END PGP SIGNATURE-----

--Sig_/Oprw9qRIHmPcaH3yQtnnJx7--

