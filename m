Return-Path: <linux-next+bounces-8777-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4438C254BD
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 14:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A398425CEC
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 13:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813A722A4E5;
	Fri, 31 Oct 2025 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+10atIp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E65190473;
	Fri, 31 Oct 2025 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761918172; cv=none; b=dx5m4Gh0FFnFh28TdokNehI1vHjl+58YDl2Di8pTDgl3ZKGNX40xAZy+oyNdGgGahGxIAFXbQxTYHeMljfdYYsGFgd3W1n+oF+yGhp8qmDap/9IAjKshrH5x1auEzbZYTEtzlDDHS/6Pgw/IRJHtMy3t/lL+s/ak276AXPmN4sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761918172; c=relaxed/simple;
	bh=GfddodwHKuBQ8XcOTjqKEzJRr4fv1VnxxqWl59wfXVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBhru1ebVEAo/ljmjQxY2YKPHU8Pm9qiTCorl6g41zWnGYM3NNV+VwkqDwrnxg1hAZSb3VUjVEk5okaYmbizchirlrQpe/BtZTbzlD0PhyZQzmnTn7cqVAjpBkGi1F2NCLaPeKvjfyehSoRhQT/p6crkW7l3qH0rk3emdRE7TEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+10atIp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85409C4CEE7;
	Fri, 31 Oct 2025 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761918171;
	bh=GfddodwHKuBQ8XcOTjqKEzJRr4fv1VnxxqWl59wfXVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+10atIpWxU6qSNFy1LeKI/GZ6qDuDdIOQ3uaiTp8pdL7x6s1uwTM64E0B7vr8oHW
	 kOKLfLodAHRVhq1vMiA3lssC+4SeRMs90HFvvYqLoX1cbrbtJNHsoTC1WSIPeNRb7y
	 UtzN2aSNourk5iNUWfjqF9ZHQEu0HOo1bGuOJPCUjMUWyRjZ6RnHqBGgpFA2WI9OPk
	 g0TVPEDT3Qwhf4HoJBHrgig3dMuaVGBQsTIe6WuRij1FOeCp2cHgawiROjDSXm1N5J
	 fdtVP2t/imat2a57HrT525hSytEVG6ecc6zhbsXl8X0JlvCYpyxR9kx/mD7LJ+7Jgf
	 ojhBItWYax4aQ==
Date: Fri, 31 Oct 2025 14:42:46 +0100
From: Joel Granados <joel.granados@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sysctl tree
Message-ID: <rvvbiogh3palkhlbq7ymnntujvzfuiivbaabvyplbidgf5djqy@ullh6sl2q43t>
References: <20251031094958.432f4e44@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uoi3vevm2kj5mp36"
Content-Disposition: inline
In-Reply-To: <20251031094958.432f4e44@canb.auug.org.au>


--uoi3vevm2kj5mp36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 09:49:58AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the sysctl tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
Is it *only* powerpc. Right? I'll take a look at this ASAP.

Thx for the heads up.

Best

>=20
> In file included from drivers/tty/n_tty.c:38:
> include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir,=
 void *buffer,
>       |                                        ^~~~~~~~~
> include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
>       |                                                  ^~~~~~~~~
> include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, i=
nt dir,
>       |                                               ^~~~~~~~~
> include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int d=
ir, void *buffer,
>       |                                           ^~~~~~~~~
> include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *tab=
le, int dir,
>       |                                                    ^~~~~~~~~
> In file included from arch/powerpc/kvm/emulate_loadstore.c:10:
> include/linux/jiffies.h:614:40: error: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on [-Werror]
>   614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir,=
 void *buffer,
>       |                                        ^~~~~~~~~
> include/linux/jiffies.h:616:50: error: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on [-Werror]
>   616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
>       |                                                  ^~~~~~~~~
> include/linux/jiffies.h:618:47: error: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on [-Werror]
>   618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, i=
nt dir,
>       |                                               ^~~~~~~~~
> include/linux/jiffies.h:620:43: error: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on [-Werror]
>   620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int d=
ir, void *buffer,
>       |                                           ^~~~~~~~~
> include/linux/jiffies.h:622:52: error: 'struct ctl_table' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on [-Werror]
>   622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *tab=
le, int dir,
>       |                                                    ^~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [scripts/Makefile.build:287: arch/powerpc/kvm/emulate_loadst=
ore.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
> In file included from drivers/infiniband/hw/mthca/mthca_catas.c:33:
> include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir,=
 void *buffer,
>       |                                        ^~~~~~~~~
> include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
>       |                                                  ^~~~~~~~~
> include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, i=
nt dir,
>       |                                               ^~~~~~~~~
> include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int d=
ir, void *buffer,
>       |                                           ^~~~~~~~~
> include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *tab=
le, int dir,
>       |                                                    ^~~~~~~~~
> make[4]: *** [scripts/Makefile.build:556: arch/powerpc/kvm] Error 2
> make[4]: *** Waiting for unfinished jobs....
> In file included from drivers/scsi/scsi_netlink.c:8:
> include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir,=
 void *buffer,
>       |                                        ^~~~~~~~~
> include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
>       |                                                  ^~~~~~~~~
> include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, i=
nt dir,
>       |                                               ^~~~~~~~~
> include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int d=
ir, void *buffer,
>       |                                           ^~~~~~~~~
> include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *tab=
le, int dir,
>       |                                                    ^~~~~~~~~
> In file included from kernel/irq/spurious.c:8:
> include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir,=
 void *buffer,
>       |                                        ^~~~~~~~~
> include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
>       |                                                  ^~~~~~~~~
> include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, i=
nt dir,
>       |                                               ^~~~~~~~~
> include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int d=
ir, void *buffer,
>       |                                           ^~~~~~~~~
> include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *tab=
le, int dir,
>       |                                                    ^~~~~~~~~
> In file included from net/sunrpc/auth_gss/gss_krb5_unseal.c:61:
> include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir,=
 void *buffer,
>       |                                        ^~~~~~~~~
> include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
>       |                                                  ^~~~~~~~~
> include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, i=
nt dir,
>       |                                               ^~~~~~~~~
> include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int d=
ir, void *buffer,
>       |                                           ^~~~~~~~~
> include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *tab=
le, int dir,
>       |                                                    ^~~~~~~~~
> In file included from net/netfilter/nf_conntrack_proto_generic.c:7:
> include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir,=
 void *buffer,
>       |                                        ^~~~~~~~~
> include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
>       |                                                  ^~~~~~~~~
> include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, i=
nt dir,
>       |                                               ^~~~~~~~~
> include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int d=
ir, void *buffer,
>       |                                           ^~~~~~~~~
> include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *tab=
le, int dir,
>       |                                                    ^~~~~~~~~
> In file included from net/sunrpc/auth_gss/gss_krb5_seal.c:62:
> include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir,=
 void *buffer,
>       |                                        ^~~~~~~~~
> include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
>       |                                                  ^~~~~~~~~
> include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, i=
nt dir,
>       |                                               ^~~~~~~~~
> include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int d=
ir, void *buffer,
>       |                                           ^~~~~~~~~
> include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *tab=
le, int dir,
>       |                                                    ^~~~~~~~~
> In file included from net/core/hotdata.c:3:
> include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir,=
 void *buffer,
>       |                                        ^~~~~~~~~
> include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
>       |                                                  ^~~~~~~~~
> include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, i=
nt dir,
>       |                                               ^~~~~~~~~
> include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int d=
ir, void *buffer,
>       |                                           ^~~~~~~~~
> include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *tab=
le, int dir,
>       |                                                    ^~~~~~~~~
> make[3]: *** [scripts/Makefile.build:556: arch/powerpc] Error 2
> make[3]: *** Waiting for unfinished jobs....
> In file included from fs/btrfs/discard.c:3:
> include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir,=
 void *buffer,
>       |                                        ^~~~~~~~~
> include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
>       |                                                  ^~~~~~~~~
> include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, i=
nt dir,
>       |                                               ^~~~~~~~~
> include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int d=
ir, void *buffer,
>       |                                           ^~~~~~~~~
> include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *tab=
le, int dir,
>       |                                                    ^~~~~~~~~
>=20
> Caused by commit
>=20
>   44df6a7821ed ("sysctl: Move jiffies converters to kernel/time/jiffies.c=
")
>=20
> I have used the sysctl tree from next-20251030 for today.
>=20
> --=20
> Cheers,
> Stephen Rothwell



--=20

Joel Granados

--uoi3vevm2kj5mp36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmkEvM8ACgkQupfNUreW
QU/ZVwv/edjtx3fFeph1/SYaSO2VPYjFmW3Uxbu38glruWnt/ciogcAUktOxWIa+
Ge/4jEUAw3/rQXvi/sSHv8olb8EfXn/lys1UZ3hNsUouPkOQZpduha1kbv5FP/q8
ZPQExMif/lyCU1pukFb8sou/gDaWv0y2/3i1PZl8L2lJh+j/TcquirBAUNNXK6HB
dSG2lj0NkLbHbD4YxF3u1VhCLKFXLzOVLtsvkgGvroGuDM2bbwt+Ze5DjMxJ+lDP
stxo1UUvLvFW8jMDoNDhf3+njnwU/kkwIdszs096y7qBiKcvM/xa6Bt+vbnJjDQR
kGzQ5vArsKcXzPv35OB8AthIMaQGsPRPCcpOhuhsIe/iYSFfpooM6lMm3oOHp1k6
fxUowt87oKXf9FX63RO7ksDdUOdvvWwcEMonvSHs/Q8A+eMCWkucA5j+JnFmRBqs
VyfX9l0OcVYvu7i7MHOILimt8wPP69xwJposCtyOHhScL7i+mZbOsIHRNpyr6BGJ
q6C0O/Go
=uISF
-----END PGP SIGNATURE-----

--uoi3vevm2kj5mp36--

