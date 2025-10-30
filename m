Return-Path: <linux-next+bounces-8765-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C9AC229A1
	for <lists+linux-next@lfdr.de>; Thu, 30 Oct 2025 23:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 16D2D4E67BE
	for <lists+linux-next@lfdr.de>; Thu, 30 Oct 2025 22:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F22314D2A;
	Thu, 30 Oct 2025 22:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oOWKS09S"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D1D34D395;
	Thu, 30 Oct 2025 22:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761864606; cv=none; b=TLPXFKKdA+zGK+Y8sxnrJALOC+ItZYPmBM+PuG5CEODy4nPZxdxuHnRh+a+B1vexIIu+TFNmcimg0bMOVz2lWWjRZYKcxguGZu42Y0DVg/K4EvUmbs1KwOAHDnBXUXnUg4KuEzgwtldSIDubEJkaIJiDVugUfVpw0718rezbvIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761864606; c=relaxed/simple;
	bh=j5wPZ8+ERBdNdG9CMOExProJbgaIIm5eD8iSlmP6vzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CtMCVXsU30RRe0kAvf3vQnY0Rg/o1sQQE10UfmnZ2pY/yYrDq/Mv3/IYobgPjlx+KVeG/ujDMkJMEFdahCMzk16LYAI3U/6D+xgMLNFVsl9AS+qAKPMdTgNk1RWA26mUdaM+ZaaghVmcPySOgDb4RMwisF6r/+aFCsHRVnQWVWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oOWKS09S; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761864599;
	bh=CX/oS2j3KSk8Re/z+JeKLdaK/THAT2mTCSIYzdysAqw=;
	h=Date:From:To:Cc:Subject:From;
	b=oOWKS09S0JED3jOLXKlXLQTlyFXpjprGLPOktMbOZOjpN4zTGnUF9+o8aXUiyZkoJ
	 cLXnY7bbHlWsCVdOGjcaqYCiYO1D4/I6tWeWmzlqrQDUwjEgeOMZI30ggGOGj7GdB4
	 iI2mEr19Qc0WbZm/PwRiuNHfZF3YW/xhDNO1FP/qiaRWMMh5mowl2ErOGmDGATbRP3
	 sej/HYa28/rjs3ZS7OffP0CPWlHuDvAx6d+ZqvTnt9L7CSAeesgKdTGdjrDysv7I1J
	 ktTYFzappvnOtpi37CVaIwdpm99+jJ1pDKI75j4Ij1cbBLn/0IcDa6WVl2fVdEOta1
	 F97V8ZshunCFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cyK7W2BKFz4xGn;
	Fri, 31 Oct 2025 09:49:59 +1100 (AEDT)
Date: Fri, 31 Oct 2025 09:49:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Joel
 Granados <joel.granados@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sysctl tree
Message-ID: <20251031094958.432f4e44@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ugcez0LDOfR71uKEWMnofAu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ugcez0LDOfR71uKEWMnofAu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sysctl tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from drivers/tty/n_tty.c:38:
include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir, v=
oid *buffer,
      |                                        ^~~~~~~~~
include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table, =
int dir,
      |                                                  ^~~~~~~~~
include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, int=
 dir,
      |                                               ^~~~~~~~~
include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int dir=
, void *buffer,
      |                                           ^~~~~~~~~
include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
      |                                                    ^~~~~~~~~
In file included from arch/powerpc/kvm/emulate_loadstore.c:10:
include/linux/jiffies.h:614:40: error: 'struct ctl_table' declared inside p=
arameter list will not be visible outside of this definition or declaration=
 [-Werror]
  614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir, v=
oid *buffer,
      |                                        ^~~~~~~~~
include/linux/jiffies.h:616:50: error: 'struct ctl_table' declared inside p=
arameter list will not be visible outside of this definition or declaration=
 [-Werror]
  616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table, =
int dir,
      |                                                  ^~~~~~~~~
include/linux/jiffies.h:618:47: error: 'struct ctl_table' declared inside p=
arameter list will not be visible outside of this definition or declaration=
 [-Werror]
  618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, int=
 dir,
      |                                               ^~~~~~~~~
include/linux/jiffies.h:620:43: error: 'struct ctl_table' declared inside p=
arameter list will not be visible outside of this definition or declaration=
 [-Werror]
  620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int dir=
, void *buffer,
      |                                           ^~~~~~~~~
include/linux/jiffies.h:622:52: error: 'struct ctl_table' declared inside p=
arameter list will not be visible outside of this definition or declaration=
 [-Werror]
  622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
      |                                                    ^~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [scripts/Makefile.build:287: arch/powerpc/kvm/emulate_loadstor=
e.o] Error 1
make[5]: *** Waiting for unfinished jobs....
In file included from drivers/infiniband/hw/mthca/mthca_catas.c:33:
include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir, v=
oid *buffer,
      |                                        ^~~~~~~~~
include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table, =
int dir,
      |                                                  ^~~~~~~~~
include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, int=
 dir,
      |                                               ^~~~~~~~~
include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int dir=
, void *buffer,
      |                                           ^~~~~~~~~
include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
      |                                                    ^~~~~~~~~
make[4]: *** [scripts/Makefile.build:556: arch/powerpc/kvm] Error 2
make[4]: *** Waiting for unfinished jobs....
In file included from drivers/scsi/scsi_netlink.c:8:
include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir, v=
oid *buffer,
      |                                        ^~~~~~~~~
include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table, =
int dir,
      |                                                  ^~~~~~~~~
include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, int=
 dir,
      |                                               ^~~~~~~~~
include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int dir=
, void *buffer,
      |                                           ^~~~~~~~~
include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
      |                                                    ^~~~~~~~~
In file included from kernel/irq/spurious.c:8:
include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir, v=
oid *buffer,
      |                                        ^~~~~~~~~
include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table, =
int dir,
      |                                                  ^~~~~~~~~
include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, int=
 dir,
      |                                               ^~~~~~~~~
include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int dir=
, void *buffer,
      |                                           ^~~~~~~~~
include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
      |                                                    ^~~~~~~~~
In file included from net/sunrpc/auth_gss/gss_krb5_unseal.c:61:
include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir, v=
oid *buffer,
      |                                        ^~~~~~~~~
include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table, =
int dir,
      |                                                  ^~~~~~~~~
include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, int=
 dir,
      |                                               ^~~~~~~~~
include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int dir=
, void *buffer,
      |                                           ^~~~~~~~~
include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
      |                                                    ^~~~~~~~~
In file included from net/netfilter/nf_conntrack_proto_generic.c:7:
include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir, v=
oid *buffer,
      |                                        ^~~~~~~~~
include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table, =
int dir,
      |                                                  ^~~~~~~~~
include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, int=
 dir,
      |                                               ^~~~~~~~~
include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int dir=
, void *buffer,
      |                                           ^~~~~~~~~
include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
      |                                                    ^~~~~~~~~
In file included from net/sunrpc/auth_gss/gss_krb5_seal.c:62:
include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir, v=
oid *buffer,
      |                                        ^~~~~~~~~
include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table, =
int dir,
      |                                                  ^~~~~~~~~
include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, int=
 dir,
      |                                               ^~~~~~~~~
include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int dir=
, void *buffer,
      |                                           ^~~~~~~~~
include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
      |                                                    ^~~~~~~~~
In file included from net/core/hotdata.c:3:
include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir, v=
oid *buffer,
      |                                        ^~~~~~~~~
include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table, =
int dir,
      |                                                  ^~~~~~~~~
include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, int=
 dir,
      |                                               ^~~~~~~~~
include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int dir=
, void *buffer,
      |                                           ^~~~~~~~~
include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
      |                                                    ^~~~~~~~~
make[3]: *** [scripts/Makefile.build:556: arch/powerpc] Error 2
make[3]: *** Waiting for unfinished jobs....
In file included from fs/btrfs/discard.c:3:
include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir, v=
oid *buffer,
      |                                        ^~~~~~~~~
include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table, =
int dir,
      |                                                  ^~~~~~~~~
include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, int=
 dir,
      |                                               ^~~~~~~~~
include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int dir=
, void *buffer,
      |                                           ^~~~~~~~~
include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
  622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
      |                                                    ^~~~~~~~~

Caused by commit

  44df6a7821ed ("sysctl: Move jiffies converters to kernel/time/jiffies.c")

I have used the sysctl tree from next-20251030 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ugcez0LDOfR71uKEWMnofAu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkD65YACgkQAVBC80lX
0Gwjnwf/bXoNKqEFAQ8ln9srrO5lYQ130F3KWGtLW8mbAlMbduscSfINCsOMCHSQ
L8TGAURi0guRJToGMJ9Qylkf5/PEEQebwPIPrjJbkrdvkZMMvZC5gzlHytPplM7Q
RkRe3QTLgl8rFgiriwN8sm5YVyVdnFECgYx6rp+mX7uFLcdw5ZrRxK+OvSgqhg3g
Ny66phDzQg77hCg3tBVQOUN3OWRWeYZ1r5PasG6AfP3yYnQOnX5LMqRNEcU2sTXq
MjCch9f3nO2Hfa5oicsTwb7AD1IJA5HTUpG5qP0aGGyBJFBtxxlM6l37pcUNiY8k
flHV8pD++fG260/Mk/iVs4/hP9AT0g==
=JZfa
-----END PGP SIGNATURE-----

--Sig_/ugcez0LDOfR71uKEWMnofAu--

